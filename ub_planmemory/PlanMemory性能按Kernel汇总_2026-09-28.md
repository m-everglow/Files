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

| Kernel 名字 | 提升 case 数量 | 劣化小于阈值 case 数量 | 劣化超过阈值 case 数量 |
|---|---:|---:|---:|
| `_fused_add_layernorm_fwd_kernel` | 4 | 2 | 0 |
| `_fused_add_rmsnorm_fwd_kernel` | 5 | 1 | 0 |
| `_fused_add_rmsnorm_fwd_single_pass_kernel` | 10 | 14 | 0 |
| `_gelu_fwd_kernel` | 1 | 1 | 0 |
| `_group_rmsnorm_interleaved_kernel` | 16 | 17 | 0 |
| `_int8_gemm_dequant_kernel` | 8 | 3 | 0 |
| `_join_prob_reject_sampler_kernel` | 1 | 0 | 0 |
| `_layernorm_fwd_kernel` | 5 | 4 | 0 |
| `_layernorm_fwd_single_pass_kernel` | 5 | 4 | 0 |
| `_reject_sampler_kernel` | 1 | 0 | 0 |
| `_rmsnorm_bwd_kernel` | 2 | 2 | 0 |
| `_rmsnorm_bwd_large_cols_kernel` | 5 | 3 | 0 |
| `_rmsnorm_fwd_kernel` | 7 | 5 | 0 |
| `_rmsnorm_infer_kernel_single` | 18 | 21 | 0 |
| `_rope_kernel` | 6 | 6 | 0 |
| `_sdpa_infer_kernel` | 2 | 1 | 1 |
| `_silu_bwd_flatten_kernel` | 0 | 1 | 2 |
| `_silu_fwd_flatten_kernel` | 4 | 2 | 1 |
| `_store_label_cache_triton_kernel` | 5 | 4 | 1 |
| `_store_paged_kv_cache_chunk_kernel` | 17 | 21 | 0 |
| `_swa_bwd_dkdv_kernel` | 3 | 5 | 0 |
| `_swa_bwd_dq_kernel` | 5 | 2 | 1 |
| `_swa_bwd_preprocess` | 8 | 0 | 0 |
| `_swa_fwd_kernel` | 6 | 2 | 0 |
| `_swa_paged_decode_kernel` | 6 | 6 | 0 |
| `_swa_paged_prefill_aggregation_kernel` | 1 | 0 | 0 |
| `_swa_paged_prefill_kernel` | 5 | 3 | 0 |
| `_swiglu_fwd_kernel` | 0 | 2 | 1 |
| `_top_k_sample_kernel` | 2 | 1 | 0 |
| `_top_p_filter_kernel` | 3 | 0 | 0 |
| `_vision_rope_apply_kernel` | 2 | 2 | 2 |
| `causal_conv1d_update_kernel_bdt_fwd` | 4 | 3 | 0 |
| `flex_attention_backward_dkdv_kernel` | 1 | 0 | 0 |
| `flex_attention_backward_dkdv_kernel_tasklist` | 4 | 0 | 0 |
| `flex_attention_backward_dq_kernel` | 1 | 4 | 0 |
| `flex_attention_kernel` | 5 | 0 | 0 |
| `kernel_sdpa_bwd_d` | 2 | 0 | 0 |
| `kernel_sdpa_bwd_kv` | 0 | 0 | 1 |
| `kernel_sdpa_bwd_q` | 0 | 0 | 1 |
| `kernel_sdpa_bwd_qkv` | 0 | 1 | 0 |
| `kernel_sdpa_fwd` | 1 | 0 | 1 |
| `lightning_indexer_kernel` | 7 | 2 | 0 |
| `n_gram_decode_kernel` | 2 | 2 | 0 |
| `n_gram_prefill_kerenl` | 1 | 3 | 0 |
| `paged_decode_fd_kernel` | 1 | 2 | 0 |
| `paged_decode_fd_reduce_kernel` | 2 | 1 | 0 |
| `paged_decode_kernel` | 0 | 4 | 0 |
| `paged_prefill_kernel` | 3 | 4 | 0 |
| `paged_prefill_page_aggregation_kernel` | 0 | 1 | 0 |
