# PlanMemory 性能验证与劣化定位流程

## 基本口径

- 在 950-ide 上编译、运行。先确认 NPU 健康且空闲；同一组 stable/current 用同一张卡，顺序执行，必要时换健康卡复测。
- 两版分别使用保存的 `bishengir-compile`，运行前用 `which bishengir-compile` 和 SHA256 核对。保留各自独立的 `TRITON_CACHE_DIR`。
- 每次 pytest 设置 `TRITON_ALWAYS_COMPILE=1 TRITON_DEBUG=1 TRITON_PRINT_AUTOTUNING=1`，不能让旧缓存掩盖编译或 autotune 差异。
- 同一轮比较必须采用同一种计时来源（例如 profiler 的 `Avg Time(us)`，或同一测试日志的 `Device latency`）；不要把两种来源直接拼成一对。
- 判定阈值：绝对变化在 2 μs 以内，或相对变化在 2% 以内，视为波动；两项都超阈值才记为劣化/优化。单次超阈值还需复测，不能直接归因。
- 结果按 `kernel_name + pytest case + autotune 配置` 记录；同一 kernel 的不同 case 分开分析。

## 分流流程

```text
全量性能统计找到疑似劣化 case
  └─ 原始 autotune 配置是否相同？
     ├─ 不同
     │  ├─ 查每档编译失败、UB overflow、候选计时及最终选型
     │  ├─ 同卡交替复测（stable→current→current→stable），观察同一版本是否也换选型
     │  └─ 分别固定关键配置，对同一配置比较性能与 PlanMemory 输出 IR
     └─ 相同
        └─ 确认输入 bcmlir 相同；比较 PlanMemory 输出 IR
           ├─ IR 不同：定位具体 UB 地址/容量/回退差异；
           │           再看后续 GraphSyncSolver 的 wait_flag/set_flag，
           │           固定配置复测性能，确认差异是否真的导致劣化
           └─ IR 相同：换健康卡、调换运行顺序并复测，排查环境波动
```

## 操作要点

1. 先从 pytest 日志的 `TRITON_PRINT_AUTOTUNING` 找最终配置，从 `TRITON_DEBUG` 找对应的 `bishengir-compile` 命令和 `.bcmlir`；配置不同不能直接比较两版地址规划的性能效果。
2. 固定 autotune 时只临时屏蔽其他候选，测试脚本须用退出清理逻辑恢复源码；结束后核对 `git status`。固定每档分别运行两版，优先用 stable→current→current→stable 顺序、隔离缓存。
3. 用相同 `.bcmlir` 和原编译参数，加 `--mlir-print-ir-before-all --mlir-print-ir-after-all` 复放；按每次 PlanMemory pass 的输入/输出 IR 对比。**不能用 npubin 相同代替 IR 对比。** 最终 IR 若只差外部组件绝对路径，应注明路径差异。
4. `wait_flag/set_flag` 由 PlanMemory 后续的 GraphSyncSolver 插入；核间同步 `sync_block_set/sync_block_wait` 则另行区分。比较同步操作时检查具体增删/位置，不只看整份 dump 的哈希。
5. 即使 PlanMemory 输出地址变了，也要在**相同配置**下证明性能稳定劣化，才能把该 case 的性能问题归因于地址变化。反过来，若某些 autotune 候选因新版 PlanMemory 编译失败，应查失败原因，不能简单当环境波动。
6. 优先解决能稳定复现、超过阈值且指向 PlanMemory 的问题；其余标记为“选型不稳定”“环境波动”或“证据不足”，保留原始日志，不覆盖全量统计。

## 本轮验证可复用材料

- 脚本与日志：`/home/m00953828/mojo/mojo_data/planmemory_perf_full_2026-10-10/`。
- 固定 GELU 两档并交替复测：`run_gelu_fixed{8192,16384}_card2_abba.sh`；GEMM/SDPA 原始 autotune 交替复测：`run_gemm_sdpa_retest_card2.sh`。
- IR 对比示例：`debug_gelu_fixed{8192,16384}/`、`debug_sdpa_fixed128/`、`debug_gemm_same_config/`。
- 本轮经验：GELU 两版同配置 PlanMemory IR 一致，原始 autotune 选型会摇摆；SDPA 同配置 IR 一致且性能方向随复测反转；GEMM 同配置有一处 UB 地址变化，但当前同配置复测未证实由此造成劣化。不要把这三种情况合并成一个结论。
