"""Triton 差异回归：同一 kernel/config，stable 分配失败，current 成功。

每段都是 float32：A/B/C 各 64 KiB，D 为 128 KiB；UB 为 248 KiB。
A/B/C 同时存活；写回 A/C 后加载 D，此时 B 仍然存活。
活跃峰值为 192 KiB。旧顺序 A→B→C→D 把 B 放在中间，造成碎片；
新顺序 D→B→A→C 将 A/C 与 D 错时复用，占用 192 KiB。
volatile load 和 barrier 固定这个合成用例的访问顺序。
这是编译可行性回归，不用于声称真实模型加速或 DSATUR 总是最优。
"""

import argparse
import hashlib
import json
from pathlib import Path
import time

import torch
import torch_npu
import triton
import triton.language as tl


SIZES = (16384, 16384, 16384, 32768)
OPTIONS = dict(num_warps=4, num_stages=1, multibuffer=False,
               enable_auto_bind_sub_block=False)


@triton.jit
def fragmented_copy(X, Y, A: tl.constexpr, B: tl.constexpr,
                    C: tl.constexpr, D: tl.constexpr):
    a = tl.load(X + tl.arange(0, A), volatile=True)
    tl.debug_barrier()
    b = tl.load(X + A + tl.arange(0, B), volatile=True)
    tl.debug_barrier()
    c = tl.load(X + A + B + tl.arange(0, C), volatile=True)
    tl.debug_barrier()
    tl.store(Y + tl.arange(0, A), a)
    tl.store(Y + A + B + tl.arange(0, C), c)
    tl.debug_barrier()
    d = tl.load(X + A + B + C + tl.arange(0, D), volatile=True)
    tl.debug_barrier()
    tl.store(Y + A + B + C + tl.arange(0, D), d)
    tl.store(Y + A + tl.arange(0, B), b)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--compile-only', action='store_true')
    parser.add_argument('--seed-base', type=int, default=0)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    record = dict(started=time.time(), sizes=SIZES, options=OPTIONS,
                  source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                  checks=[])
    try:
        torch.npu.set_device(0)
        record['device'] = torch.npu.get_device_name(0)
        x = torch.empty(sum(SIZES), device='npu', dtype=torch.float32)
        y = torch.empty_like(x)
        kernel = fragmented_copy.warmup(x, y, *SIZES, grid=(1,), **OPTIONS)
        record['kernel_hash'] = kernel.hash
        record['metadata'] = str(kernel.metadata)
        for name, data in kernel.asm.items():
            if isinstance(data, (str, bytes)):
                path = args.output / ('kernel.' + name)
                path.write_bytes(data.encode() if isinstance(data, str) else data)
        if not args.compile_only:
            for test_id in range(8):
                if test_id == 0:
                    expected = torch.arange(sum(SIZES), dtype=torch.float32)
                else:
                    generator = torch.Generator().manual_seed(args.seed_base + test_id)
                    expected = torch.randn(sum(SIZES), generator=generator)
                x.copy_(expected)
                y.fill_(float('nan'))
                # Launch the already compiled binary, avoiding recompilation per input.
                kernel[(1, 1, 1)](x, y, *SIZES)
                torch.npu.synchronize()
                actual = y.cpu()
                torch.testing.assert_close(actual, expected, rtol=0, atol=0)
                record['checks'].append(dict(test_id=test_id, elements=actual.numel(), exact=True))
        record['status'] = 'PASS'
    except Exception as error:
        record.update(status='FAIL', error=repr(error))
        raise
    finally:
        record['ended'] = time.time()
        (args.output / 'result.json').write_text(json.dumps(record, indent=2))
        print(json.dumps({k: v for k, v in record.items() if k != 'metadata'}, indent=2), flush=True)


if __name__ == '__main__':
    main()
