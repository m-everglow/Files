# PlanMemory 编译时间对比（2026-10-13）

## 目标样例

- 来源：真实 GELU `BLOCK_SIZE=16384` 编译产生的第三份 PlanMemory 输入。
- 输入：`/home/m00953828/mojo/mojo_data/planmemory_perf_full_2026-10-10/debug_gelu_fixed16384/current/before-planmemory-3.mlir`
- stable 的 `bishengir-opt --hivm-plan-memory-regbase --debug` 日志依次出现 `Memory planning attempt 1/9` 至 `7/9`，第 7 次后成功退出（exit 0）。
- current 使用**同一 IR**运行相同 Pass，成功退出（exit 0）。current 路径不再打印顶层 attempt 日志。

## 测量方法

- 环境：950-ide；二进制分别为 `/home/m00953828/mojo/npu-ir/stable/bin/bishengir-opt` 和 `/home/m00953828/mojo/npu-ir/local-inplace/bin/bishengir-opt`。
- 命令：`bishengir-opt <同一输入> --hivm-plan-memory-regbase --mlir-timing -o /dev/null`。正式计时不启用 `--debug`。
- 两版各预热 3 次，再各测 30 次；按轮次交替 stable/current 和 current/stable，以减轻时间顺序偏差。
- `pass_ms` 来自 MLIR 的 `PlanMemoryRegBase` 计时；`process_ms` 是整个 `bishengir-opt` 进程的墙钟时间（包含启动、解析和输出）。

| 指标（30 次中位数） | stable | current | current 相对 stable |
|---|---:|---:|---:|
| PlanMemory Pass | 0.90 ms | 0.85 ms | 约快 5.6%（差 −0.05 ms） |
| 整个 `bishengir-opt` 进程 | 18.50 ms | 21.97 ms | 约慢 18.8%（差 +3.47 ms） |

**结论：**在这个需要 stable 尝试 7 次才成功的真实样例上，current 的 PlanMemory Pass 没有明显编译时间劣化。整个进程的额外约 3.47 ms 不在 Pass 计时内，不能归因于 PlanMemory 算法；由于 Pass 本身不足 1 ms，也不宜把此样例外推到所有大 IR。

逐轮原始数据：`/home/m00953828/mojo/mojo_data/planmemory_retry_bench_20261013.csv`。

## 扩展：更复杂的真实 IR（同日）

从保存的 bcmlir 重新运行 `bishengir-compile --enable-tuning-mode --mlir-print-ir-before-all`，提取第三份 `Before PlanMemoryRegBase` 快照，再用两版 `bishengir-opt` 对同一输入分别验证和计时。计时方式与上文相同：各预热 3 次、正式测 30 次、交替运行；以下均为中位数。

| 样例 | Pass 输入大小 | `memref.alloc` 数 | stable attempt | stable Pass | current Pass | Pass 差值 |
|---|---:|---:|---:|---:|---:|---:|
| GELU（上文） | 7,813 B | 2 | 第 7 次成功 | 0.90 ms | 0.85 ms | −0.05 ms |
| SwiGLU forward | 12,869 B | 3 | **第 7 次成功** | **1.70 ms** | **1.30 ms** | **−0.40 ms** |
| Flex Attention backward dkdv | 138,860 B | 69 | 第 1 次成功 | 9.05 ms | 9.30 ms | +0.25 ms（+2.8%） |

SwiGLU 是比 GELU 更复杂、同时满足“stable 多次 attempt 才成功且 current 也成功”的真实样例。它的整个 `bishengir-opt` 进程中位数为 stable 22.42 ms、current 26.96 ms；额外约 4.54 ms 不在 PlanMemory Pass 计时内。Flex Attention 是规模明显更大的对照，但**不满足多次 attempt 条件**；其整个进程中位数为 stable 67.46 ms、current 67.52 ms，基本一致。

为避免按文件大小误选，另从 Flex Attention、SWA、paged-prefill 等复杂 bcmlir 打印全量 IR 并检查 attempt；已检查的较大可成功输入均为 stable 首轮成功。因此，当前证据支持“这两个多轮成功样例的 PlanMemory Pass 没有明显变慢”，不支持概括为所有大 IR 都无回归。

- SwiGLU 输入：`/home/m00953828/mojo/mojo_data/planmemory_complex_activation_20261013_093936/03__swiglu_fwd_kernel/before-planmemory.mlir`
- SwiGLU 逐轮数据：`/home/m00953828/mojo/mojo_data/planmemory_swiglu_retry_bench_20261013.csv`
- Flex Attention 输入：`/home/m00953828/mojo/mojo_data/planmemory_complex_scan_20261013_092405/flex_backward_dkdv/before-planmemory-3.mlir`
- Flex Attention 逐轮数据：`/home/m00953828/mojo/mojo_data/planmemory_flex_backward_bench_20261013.csv`

# SwiGLU forward的耗时为什么不是3/7 ?

主要因为 **每次 attempt 的耗时不一样，第一次明显更贵**。

- stable：第一次 **309µs**，后六次合计 **594µs**，轮外工作 **77µs**。
- current：第一次 **294µs**，后两次合计 **234µs**，轮外工作 **63µs**。

省掉的四次是每次约100µs的重复执行，**不是把七份同样的工作删掉四份**。较贵的首次执行仍然保留，所以总耗时是 **980→590µs（约60%）**，而不是变成3/7（约43%）。

首次为什么更贵，还没细分查清；但它是目前实测中不能按3/7折算的主要原因。
