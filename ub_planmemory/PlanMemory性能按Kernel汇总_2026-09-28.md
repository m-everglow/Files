# PlanMemory 性能按 Kernel 汇总

## 对比口径

- 新方案数据：`/home/m00953828/mojo/mojo_operator_cases/perf_results/graph_ordered_first_fit/kernel_perf.csv`
- Stable 基线：`/home/m00953828/mojo/mojo_operator_cases/perf_results/stable_first_fit/kernel_perf.csv`
- 两份 CSV 逐行对比，共 371 条记录；kernel 名称及输入/输出信息逐行一致。
- 提升：新方案 avg_time 小于 Stable。
- 劣化小于阈值：新方案更慢，但绝对差小于 2us，或者相对差小于 2%。
- 劣化超过阈值：新方案更慢，且绝对差不小于 2us、相对差不小于 2%。

## 总计

- Kernel 名称数量：49
- 提升 case 数量：197
- 劣化小于阈值 case 数量：162
- 劣化超过阈值 case 数量：12

| Kernel 名字 | 提升 case 数量 | 劣化小于阈值 case 数量 | 劣化超过阈值 case 数量 | 复测结论 |
|---|---:|---:|---:|---|
| `_fused_add_layernorm_fwd_kernel` | 4 | 2 | 0  |
| `_fused_add_rmsnorm_fwd_kernel` | 5 | 1 | 0  |
| `_fused_add_rmsnorm_fwd_single_pass_kernel` | 10 | 14 | 0  |
| `_gelu_fwd_kernel` | 1 | 1 | 0  |
| `_group_rmsnorm_interleaved_kernel` | 16 | 17 | 0  |
| `_int8_gemm_dequant_kernel` | 8 | 3 | 0  |
| `_join_prob_reject_sampler_kernel` | 1 | 0 | 0  |
| `_layernorm_fwd_kernel` | 5 | 4 | 0  |
| `_layernorm_fwd_single_pass_kernel` | 5 | 4 | 0  |
| `_reject_sampler_kernel` | 1 | 0 | 0  |
| `_rmsnorm_bwd_kernel` | 2 | 2 | 0  |
| `_rmsnorm_bwd_large_cols_kernel` | 5 | 3 | 0  |
| `_rmsnorm_fwd_kernel` | 7 | 5 | 0  |
| `_rmsnorm_infer_kernel_single` | 18 | 21 | 0  |
| `_rope_kernel` | 6 | 6 | 0  |
| `_sdpa_infer_kernel` | 2 | 1 | 1 | 复测无劣化；stable/new 产物一致，原始差异为环境波动 |
| `_silu_bwd_flatten_kernel` | 0 | 1 | 2 | 换卡定点复测无劣化；stable/new 产物一致，原始差异为环境波动 |
| `_silu_fwd_flatten_kernel` | 4 | 2 | 1 | 整体复测无劣化 |
| `_store_label_cache_triton_kernel` | 5 | 4 | 1 | 换卡定点复测无劣化；stable/new 产物一致，原始差异为环境波动 |
| `_store_paged_kv_cache_chunk_kernel` | 17 | 21 | 0  |
| `_swa_bwd_dkdv_kernel` | 3 | 5 | 0  |
| `_swa_bwd_dq_kernel` | 5 | 2 | 1 | 整体复测无劣化 |
| `_swa_bwd_preprocess` | 8 | 0 | 0  |
| `_swa_fwd_kernel` | 6 | 2 | 0  |
| `_swa_paged_decode_kernel` | 6 | 6 | 0  |
| `_swa_paged_prefill_aggregation_kernel` | 1 | 0 | 0  |
| `_swa_paged_prefill_kernel` | 5 | 3 | 0  |
| `_swiglu_fwd_kernel` | 0 | 2 | 1  |
| `_top_k_sample_kernel` | 2 | 1 | 0  |
| `_top_p_filter_kernel` | 3 | 0 | 0  |
| `_vision_rope_apply_kernel` | 2 | 2 | 2  |
| `causal_conv1d_update_kernel_bdt_fwd` | 4 | 3 | 0  |
| `flex_attention_backward_dkdv_kernel` | 1 | 0 | 0  |
| `flex_attention_backward_dkdv_kernel_tasklist` | 4 | 0 | 0  |
| `flex_attention_backward_dq_kernel` | 1 | 4 | 0  |
| `flex_attention_kernel` | 5 | 0 | 0  |
| `kernel_sdpa_bwd_d` | 2 | 0 | 0  |
| `kernel_sdpa_bwd_kv` | 0 | 0 | 1  |
| `kernel_sdpa_bwd_q` | 0 | 0 | 1  |
| `kernel_sdpa_bwd_qkv` | 0 | 1 | 0  |
| `kernel_sdpa_fwd` | 1 | 0 | 1  |
| `lightning_indexer_kernel` | 7 | 2 | 0  |
| `n_gram_decode_kernel` | 2 | 2 | 0  |
| `n_gram_prefill_kerenl` | 1 | 3 | 0  |
| `paged_decode_fd_kernel` | 1 | 2 | 0  |
| `paged_decode_fd_reduce_kernel` | 2 | 1 | 0  |
| `paged_decode_kernel` | 0 | 4 | 0  |
| `paged_prefill_kernel` | 3 | 4 | 0  |
| `paged_prefill_page_aggregation_kernel` | 0 | 1 | 0  |

## `_sdpa_infer_kernel` 复测记录

- 对应来源：`sdpa.py::test_sdpa` 1 个 case，`swa.py::test_swa_infer` 3 个 case。
- `test_sdpa` 使用 Stable 和新方案在同一卡、全新 cache、`TRITON_ALWAYS_COMPILE=1` 下重新执行。
- 两版 autotune 成功/失败配置完全一致，最终均选择 `BLOCK_M=128, BLOCK_N=128`。
- 两版最终 `.bcmlir` 字节完全一致。
- Stable 为 `62418.264us`，新方案为 `62420.929us`，差异 `+2.665us / +0.00427%`，不构成劣化。
- `test_swa_infer` 的 3 个 case 在 Stable 和新方案下均使用全新 cache、`TRITON_ALWAYS_COMPILE=1` 完整复测，功能均为 `3 passed`。
- `M_BF16_WITH_CACHE`：Stable `1430.383us`，新方案 `1377.285us`，提升 `3.712%`。
- `M_BF16_PADDIM`：Stable `703.165us`，新方案 `677.303us`，提升 `3.678%`。
- `M_BF16`：Stable `773.985us`，新方案 `794.534us`，劣化 `20.549us / 2.655%`，超过阈值。
- 本轮初次结论：`sdpa.py::test_sdpa` 的原始超阈值记录属于环境或采样波动；`swa.py::test_swa_infer[M_BF16]` 单次复测仍超过阈值，后续多轮换卡复测结论见下文。

### 补充复测结论

- 在 7 卡上对 `swa.py::test_swa_infer[M_BF16]` 进行 Stable/New 各 3 次交替复测。
- Stable：`48.127 / 48.162 / 48.102us`；New：`48.275 / 47.947 / 48.392us`。New 均值仅慢约 `0.15%`，且 6 次生成的 `.npubin` 完全一致。
- 最终结论：`_sdpa_infer_kernel` 复测无劣化，历史差异属于环境波动。

## 第 2–5 个劣化 Kernel 复测

- 复测方式：Stable/New 使用相同测试文件、固定卡号、独立 cache，并设置 `TRITON_ALWAYS_COMPILE=1`。
- `_silu_fwd_flatten_kernel`：完整执行 `test_activation.py`，所有 case 均无超阈值劣化。
- `_swa_bwd_dq_kernel`：完整执行 `test_attention_swa_mfu.py`，8 个 shape 均无超阈值劣化。
- `_silu_bwd_flatten_kernel`：首次整体复测中 `10485760` shape 出现异常差异；Stable/New 对应 `.npubin` 完全一致。换至 4 卡定点复测后，Stable `25.883us`、New `25.988us`，差异 `+0.105us / +0.406%`，无劣化。
- `_store_label_cache_triton_kernel`：首次整体复测中两个 8-head shape 出现异常差异；Stable/New 所有对应 `.npubin` 完全一致。换至 4 卡定点复测：
  - `2048,8,128`：Stable `6.829us`、New `6.718us`，提升 `1.625%`。
  - `4096,8,128`：Stable `10.812us`、New `10.538us`，提升 `2.534%`。

结论：

- 第 2–5 个历史劣化 Kernel 复测均无劣化。
- 异常项在 Stable/New 下生成了完全相同的机器码，且换卡后差异消失，因此可判定为运行环境或性能采样波动，不是 PlanMemory 修改造成的性能回退。
