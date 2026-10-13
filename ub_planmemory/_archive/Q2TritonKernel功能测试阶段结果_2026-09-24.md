# Q2TritonKernel 功能测试阶段结果（2026-09-24）

## 说明

- 本文只记录当前测试结果，不分析失败原因。
- 性能测试本轮未执行。
- `test_wy_fast_gated_delta_bwd.py` 已改在卡 7 上从头运行，当前结果另行补充。
- 测试使用的编译器：`/home/m00953828/NPU-IR/bishengir/bin/bishengir-compile`。
- 主测试日志目录：`/home/m00953828/q2_dsatur_fixed_func_logs`。

## 总体结果

除仍在运行的最后一个文件外，原始全量运行已记录 15 个测试文件，共 161 个测试结果：

- 148 passed
- 12 failed
- 1 skipped

主日志目录中检索 `UB overflow` 和 `overflow, requires`，匹配数量为 0。

缓存产物缺失的 4 个文件使用卡 2、独立缓存 `./cache_retry_card2` 和 `TRITON_ALWAYS_COMPILE=1` 重新编译并运行，最终 `40 passed, 4 warnings in 524.78s`。

## 分文件结果

| 测试文件 | 结果 | 耗时 |
| --- | --- | --- |
| `test_causal_conv1d_bwd.py` | 10 passed | 1128.51s |
| `test_chunk_bwd_dqkwg.py` | 原始运行 9 passed, 1 failed；卡 2 全文件重跑 10 passed | 原始 255.02s；四文件合并重跑 524.78s |
| `test_chunk_bwd_dv_local.py` | 10 passed | 68.60s |
| `test_chunk_gated_delta_rule_bwd_dhu.py` | 10 passed | 362.19s |
| `test_chunk_gated_delta_rule_fwd_h.py` | 10 passed | 318.23s |
| `test_chunk_local_cumsum.py` | 10 passed | 43.74s |
| `test_chunk_o.py` | 原始运行 9 passed, 1 failed；卡 2 全文件重跑 10 passed | 原始 110.52s；四文件合并重跑 524.78s |
| `test_chunk_scaled_dot_kkt_fwd.py` | 原始运行 9 passed, 1 failed；卡 2 全文件重跑 10 passed | 原始 364.75s；四文件合并重跑 524.78s |
| `test_layer_norm_gated_bwd.py` | 10 passed | 132.73s |
| `test_layer_norm_gated_fwd.py` | 10 passed | 78.97s |
| `test_prepare_wy_repr_bwd.py` | 1 skipped | 21.62s |
| `test_recompute_w_u_fwd.py` | 原始运行 18 passed, 2 failed；卡 1 精确重跑失败项 2 passed | 原始 213.45s；重跑 248.98s |
| `test_recompute_w_u_fwd_large.py` | 14 passed, 6 failed | 单独运行，未在主日志目录记录耗时 |
| `test_solve_tril.py` | 原始运行 9 passed, 1 failed；卡 2 全文件重跑 10 passed | 原始 162.88s；四文件合并重跑 524.78s |
| `test_solve_tril_mxr.py` | 10 passed | 150.52s |

## 当前未完成项

`test_wy_fast_gated_delta_bwd.py`：共收集 20 个参数组合，当前绑定 `ASCEND_RT_VISIBLE_DEVICES=7` 运行。该文件完成后需补充最终 pytest 摘要，本文件暂不统计其结果。

## 失败用例 node id（用于后续精确重跑）

### `test_chunk_bwd_dqkwg.py`

- `tests/fla/test_chunk_bwd_dqkwg.py::test_chunk_bwd_dqkwg_g[B1-T131072-H4-K128]`

### `test_chunk_o.py`

- `tests/fla/test_chunk_o.py::test_chunk_fwd_o[B1-T1024-H32-D128-V128]`

### `test_chunk_scaled_dot_kkt_fwd.py`

- `tests/fla/test_chunk_scaled_dot_kkt_fwd.py::test_chunk_scaled_dot_kkt_fwd_with_g_and_beta[B1-T8192-H64-D128]`

### `test_recompute_w_u_fwd.py`

- `tests/fla/test_recompute_w_u_fwd.py::test_recompute_w_u_fwd_cross_platform_acc[B4-T131072-H32-HV32-K128-V128-BT64-torch.bfloat16]`
- `tests/fla/test_recompute_w_u_fwd.py::test_recompute_w_u_fwd_cross_platform_acc[B16-T131072-H8-HV8-K128-V128-BT64-torch.bfloat16]`

### `test_recompute_w_u_fwd_large.py`

- `tests/fla/test_recompute_w_u_fwd_large.py::test_recompute_w_u_fwd_large[B1-T131072-H32-HV32-K128-V128-BT64]`
- `tests/fla/test_recompute_w_u_fwd_large.py::test_recompute_w_u_fwd_large[B4-T131072-H32-HV32-K128-V128-BT64]`
- `tests/fla/test_recompute_w_u_fwd_large.py::test_recompute_w_u_fwd_large[B16-T131072-H8-HV8-K128-V128-BT64]`
- `tests/fla/test_recompute_w_u_fwd_large.py::test_recompute_w_u_fwd_cross_platform_acc_large[B1-T131072-H32-HV32-K128-V128-BT64]`
- `tests/fla/test_recompute_w_u_fwd_large.py::test_recompute_w_u_fwd_cross_platform_acc_large[B4-T131072-H32-HV32-K128-V128-BT64]`
- `tests/fla/test_recompute_w_u_fwd_large.py::test_recompute_w_u_fwd_cross_platform_acc_large[B16-T131072-H8-HV8-K128-V128-BT64]`

### `test_solve_tril.py`

- `tests/fla/test_solve_tril.py::test_solve_tril_varlen[H16-D128-chunk_size64]`

以上失败项只做记录，暂未分析。

## 控制台错误摘要

### `test_chunk_bwd_dqkwg.py`

- 错误类型：`FileNotFoundError`
- 关键输出：找不到 `cache/.../chunk_bwd_kernel_dqkwg.source`。
- 完整日志：`/home/m00953828/q2_dsatur_fixed_func_logs/test_chunk_bwd_dqkwg.py.log`

### `test_chunk_o.py`

- 错误类型：`FileNotFoundError`
- 关键输出：找不到 `cache/.../chunk_fwd_kernel_h.source`。
- 完整日志：`/home/m00953828/q2_dsatur_fixed_func_logs/test_chunk_o.py.log`

### `test_chunk_scaled_dot_kkt_fwd.py`

- 错误类型：`FileNotFoundError`
- 关键输出：找不到 `cache/.../chunk_scaled_dot_kkt_fwd_kernel.source`。
- 完整日志：`/home/m00953828/q2_dsatur_fixed_func_logs/test_chunk_scaled_dot_kkt_fwd.py.log`

### `test_recompute_w_u_fwd.py`

- 两个失败项的错误类型均为 `torch.OutOfMemoryError`。
- B4 用例关键输出：申请 8.00 GiB；当时仅剩 3.91 GiB 空闲，PyTorch 已分配 50.06 GiB、预留 54.06 GiB。
- B16 用例关键输出：申请 8.00 GiB；当时仅剩 3.90 GiB 空闲，PyTorch 已分配 52.12 GiB、预留 54.06 GiB。
- 原始日志：`/home/m00953828/q2_dsatur_fixed_func_logs/test_recompute_w_u_fwd.py.log`
- 卡 1 重跑：两个 node id 均通过，`2 passed, 4 warnings in 248.98s`。
- 重跑日志：`/home/m00953828/q2_dsatur_fixed_func_logs/retry_oom_card1_20260924.log`

### `test_recompute_w_u_fwd_large.py`

- 错误类型：`FileNotFoundError`。
- 缺少以下输入文件：
  - `/data/PytorchFile/fla_operator_cases/recompute_w_u_fwd_pt/B1-T131072-H32-HV32-K128-V128-BT64-input.pt`
  - `/data/PytorchFile/fla_operator_cases/recompute_w_u_fwd_pt/B4-T131072-H32-HV32-K128-V128-BT64-input.pt`
  - `/data/PytorchFile/fla_operator_cases/recompute_w_u_fwd_pt/B16-T131072-H8-HV8-K128-V128-BT64-input.pt`
- 三个普通用例和三个 cross-platform 用例分别引用上述三个输入文件，因此共得到 6 个失败结果。
- 完整日志：`/tmp/q2_dsatur_func_logs/test_recompute_w_u_fwd_large.py.log`

### `test_solve_tril.py`

- 错误类型：`FileNotFoundError`
- 关键输出：找不到 `cache/.../merge_16x16_to_64x64_inverse_kernel.source`。
- 完整日志：`/home/m00953828/q2_dsatur_fixed_func_logs/test_solve_tril.py.log`

## `.source` 缺失用例重跑结果

- 执行卡：NPU 2。
- 缓存路径：`TRITON_CACHE_DIR=./cache_retry_card2`。
- 强制编译：`TRITON_ALWAYS_COMPILE=1`。
- 重跑范围：`test_chunk_bwd_dqkwg.py`、`test_chunk_o.py`、`test_chunk_scaled_dot_kkt_fwd.py`、`test_solve_tril.py`，共 40 个用例。
- 最终结果：`40 passed, 4 warnings in 524.78s`。
- 重跑过程中未再次出现 `.source` 文件缺失。
- 完整控制台日志：`/home/m00953828/q2_dsatur_fixed_func_logs/retry_missing_source_card2_20260924.log`。
