# PlanMemory 原 6 条“提升”case 复测（2026-10-13）

## 范围与方法

- 来源：`/home/m00953828/Files/ub_planmemory/beam_search/kernel_perf_comparison.csv`。原表中 6 条“提升”分属 `_rmsnorm_fwd_kernel`、`_rope_kernel`、`_silu_bwd_flatten_kernel`；本次把这 3 个 kernel 的全部 27 条 case 一起复测。
- 950-ide 环境，先跑完整 stable 两轮，再跑完整 current 两轮。每个 kernel 固定卡：RMSNorm=0、RoPE=4、SiLU=5。两版编译器分别是 `/home/m00953828/mojo/npu-ir/stable/bin/bishengir-compile` 和 `/home/m00953828/mojo/npu-ir/local-inplace/bin/bishengir-compile`。
- 每轮使用独立 `TRITON_CACHE_DIR`，设置 `TRITON_ALWAYS_COMPILE=1`、`TRITON_DEBUG=1`、`TRITON_PRINT_AUTOTUNING=1`。27 条 case 每一轮均通过。
- 判定沿用原口径：绝对变化 ≤2 µs **或** 相对变化 <2% 算波动；其余才算提升或劣化。表中时间单位为 µs，越低越好。
- 原始日志、profiling 和卡状态快照：`/home/m00953828/mojo/mojo_data/planmemory_improved_groups_2x_20261013_101938/`。前两次因共享任务占卡中断的数据未混入本次统计。

## 原 6 条“提升”的逐轮结果

| Kernel / case | stable 两轮 | current 两轮 | 均值变化 | 本次判读 |
|---|---|---|---:|---|
| RMSNorm `x10-weight10` | 22.656, 22.329 | 20.721, 20.453 | −1.905 (−8.47%) | 绝对差 <2 µs，按约定算波动 |
| RMSNorm `x5-weight5` | 902.428, 905.382 | 866.759, 880.719 | −30.166 (−3.34%) | 两轮均有收益，初步确认提升 |
| RoPE `dtype1-128-1-1-8192-32` | 186.232, 186.307 | 185.823, 187.009 | +0.147 (+0.08%) | 原收益未复现，波动 |
| RoPE `dtype2-128-1-1-8192-32` | 186.795, 186.229 | 186.887, 187.804 | +0.834 (+0.45%) | 原收益未复现，波动 |
| SiLU `shape1` | 42.499, 46.889 | 42.261, 28.172 | −9.477 (−21.21%) | 仅第二轮明显提升，结果不稳定 |
| SiLU `shape2` | 54.760, 49.679 | 54.815, 37.439 | −6.093 (−11.67%) | 仅第二轮明显提升，结果不稳定 |

SiLU 日志显示 `shape1` 的 autotune 输出在各轮均含 `BLOCK_SIZE: 8192`，但测时仍大幅变化；`shape2` 的 autotune 输出曾出现 16384 和 8192。仅凭本次日志不能把 SiLU 波动单独归因于环境或 autotune，应视为尚未确认的收益。

因此，原 6 条中只有 RMSNorm `x5-weight5` 在两轮都复现了收益；其余 5 条尚不能认定为稳定收益。

## 后续

若需要确认 SiLU 的收益，建议先固定其 autotune 配置，再在负载更稳定的卡上补充多轮测量；若要分析 PlanMemory 是否直接带来 RMSNorm `x5-weight5` 的收益，则需比较该 case 两版最终选用配置及 PlanMemory 输出 IR。此次整组复测只做性能重复性核查，未做原因归因。

配套数据：`kernel_improvement_retest_summary_2026-10-13.csv`（仅原 6 条的均值）、`kernel_improvement_retest_per_round_2026-10-13.csv`（仅原 6 条的 24 条逐轮记录）。完整 27 条的原始结果仍保留在上述 `mojo_data` 目录。
