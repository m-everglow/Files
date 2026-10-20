import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import time

import torch
import torch_npu
import triton
import triton.language as tl


@triton.jit
def fragmented_copy(X, Y, A: tl.constexpr, B: tl.constexpr, C: tl.constexpr,
                    D: tl.constexpr, BARRIER: tl.constexpr):
    a = tl.load(X + tl.arange(0, A), volatile=True)
    if BARRIER:
        tl.debug_barrier()
    b = tl.load(X + A + tl.arange(0, B), volatile=True)
    if BARRIER:
        tl.debug_barrier()
    c = tl.load(X + A + B + tl.arange(0, C), volatile=True)
    if BARRIER:
        tl.debug_barrier()
    tl.store(Y + tl.arange(0, A), a)
    tl.store(Y + A + B + tl.arange(0, C), c)
    if BARRIER:
        tl.debug_barrier()
    d = tl.load(X + A + B + C + tl.arange(0, D), volatile=True)
    if BARRIER:
        tl.debug_barrier()
    tl.store(Y + A + B + C + tl.arange(0, D), d)
    tl.store(Y + A + tl.arange(0, B), b)


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--sizes', default='16384,16384,16384,32768')
    p.add_argument('--barrier', type=int, default=1)
    p.add_argument('--dtype', default='float32')
    p.add_argument('--bind', type=int, default=0)
    p.add_argument('--result', default='result.json')
    p.add_argument('--capture-only', action='store_true')
    args = p.parse_args()
    sizes = list(map(int, args.sizes.split(',')))
    torch.npu.set_device(0)
    xcpu = (torch.arange(sum(sizes), dtype=torch.int32) % 251).to(getattr(torch, args.dtype))
    x = xcpu.npu()
    y = torch.empty_like(x)
    opts = dict(num_warps=4, num_stages=1, multibuffer=False,
                enable_auto_bind_sub_block=bool(args.bind))
    # Explicitly supply the common runtime library: build/bin lacks ../lib/*.bc.
    original_run = subprocess.run
    def traced_run(command, *pos, **kw):
        if isinstance(command, (list, tuple)) and Path(str(command[0])).name == 'bishengir-compile' and '--help' not in command:
            command = list(command)
            saved = Path(args.result).with_suffix('.input.mlir')
            shutil.copyfile(command[1], saved)
            Path(args.result).with_suffix('.command.json').write_text(json.dumps(command, indent=2))
            if args.capture_only:
                raise RuntimeError('CAPTURE_ONLY: saved Triton frontend output')
            command.append('--link-aicore-bitcode=/home/m00953828/mojo/npu-ir/stable/lib/meta_op.aiv.c310.bc')
        return original_run(command, *pos, **kw)
    subprocess.run = traced_run
    info = dict(sizes=sizes, dtype=args.dtype, barrier=args.barrier,
                options=opts, started=time.time(), source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    try:
        k = fragmented_copy[(1,)](x, y, *sizes, bool(args.barrier), **opts)
        torch.npu.synchronize()
        actual = y.cpu()
        torch.testing.assert_close(actual, xcpu, rtol=0, atol=0)
        info.update(status='PASS', metadata=str(k.metadata), hash=k.hash)
        for name, data in k.asm.items():
            if isinstance(data, str):
                Path(args.result).with_suffix('.' + name).write_text(data)
    except Exception as e:
        info.update(status='FAIL', error=repr(e))
        raise
    finally:
        info['ended'] = time.time()
        Path(args.result).write_text(json.dumps(info, indent=2))
        print(json.dumps(info, indent=2), flush=True)


if __name__ == '__main__':
    main()
