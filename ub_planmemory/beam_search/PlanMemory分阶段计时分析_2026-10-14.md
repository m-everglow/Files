# PlanMemory 分阶段计时：SwiGLU forward

## 结论

**7 次 attempt → 3 次 policy，不等于耗时按 7∶3 缩短。** 此例最大的耗时是 liveness；它的第一次执行明显比重复执行贵。减少的四次主要是较便宜的重复分析。此外，current 新增了局部 inplace 选择、冲突图和 DSATUR 排序。

本轮诊断计时平均总耗时：stable **936.15µs**，current **588.59µs**，降低 **37.1%**。其中 liveness 减少 **292.22µs**，贡献约 **84.1%** 的总耗时减少。

原组件同期、不插桩的 `--mlir-timing` 中位数为 stable **1.3ms**、current **0.9ms**。这与 10 月 13 日的 1.7ms / 1.3ms 不是同一轮测量；不能把本轮阶段时间拼到旧总时间上。

## 各阶段占比

以下均为 **60 次交替采样的平均独占耗时**，单位 **µs**。父阶段扣除了子阶段耗时，因此不会重复累计；占比的分母是各版本本轮诊断总耗时。

| 阶段 | stable 耗时 | stable 占比 | current 耗时 | current 占比 |
|---|---:|---:|---:|---:|
| CV reuse 白名单准备 | 8.16 | 0.9% | 7.70 | 1.3% |
| VF inplace 分析 | 32.67 | 3.5% | 33.87 | 5.8% |
| liveness 构建 | 676.10 | 72.2% | 383.88 | 65.2% |
| SE 构建、MultiBuffer 展开、按 scope 合并等准备 | 47.28 | 5.1% | 26.92 | 4.6% |
| inplace 合并／选择 | 22.73 | 2.4% | 26.36 | 4.5% |
| 冲突图构建 + DSATUR 排序 | 0.00 | 0.0% | 18.88 | 3.2% |
| 地址规划（含 first-fit / MultiSpec） | 79.43 | 8.5% | 34.99 | 5.9% |
| 独立分配结果验证 | 0.00 | 0.0% | 0.80 | 0.1% |
| attempt / policy 的其他准备与清理 | 47.37 | 5.1% | 32.70 | 5.6% |
| offset 结果整理、写回 IR | 17.91 | 1.9% | 17.41 | 3.0% |
| 其他 Pass 控制流 | 4.50 | 0.5% | 5.07 | 0.9% |
| **总计** | **936.15** | **100%** | **588.59** | **100%** |

占比四舍五入可能导致表格中的百分比之和略偏离 100%。

## 为什么不能按 attempt 次数比例计算

逐次 liveness 的平均耗时如下，单位 **µs**：

| 版本 | policy 1 | policy 2 | policy 3 | 总计 |
|---|---|---|---|---:|
| stable | 206.10、89.15、79.55 | 77.51、75.13、74.56 | 74.10 | 676.10 |
| current | 213.46 | 91.31 | 79.11 | 383.88 |

这里的“policy 1 / 2 / 3”分别为原始约束、移除符合条件的 AIV MultiBuffer 标记后、关闭 VF reachable check 后。不是三个不同的 for 循环；每次 `build()` 分析整个待规划函数。

1. **第一次 liveness 约 210µs，重复分析约 75–91µs，不是等价的七份成本。** 每次都是新建分析对象；这不代表代码显式缓存并复用了 liveness 结果。首轮与后续轮次耗时不同是本次直接测到的事实；具体底层缓存、初始化分别贡献多少，需要更细的 profiling，不能仅凭此表认定。
2. stable 的前两个 policy 各重复三次；current 各一次。减少的主要是低耗时重复轮次。实际 liveness 降幅 **43.2%**，不是按次数估算的 **57.1%**。
3. current 的 inplace 总耗时略增加约 **3.63µs**，新增冲突图 + DSATUR 约 **18.88µs**，Verifier 约 **0.80µs**，抵消部分收益。
4. CV/VF 准备和最终写回等阶段不会随 attempt 次数同比减少。

因此，之前“主要是固定开销导致没有等比例加速”的解释不够准确：**本例首先是 liveness 各轮成本不等，其次是新算法开销和一次性开销。**

## 此例的执行路径

```text
stable：policy 1 失败 ×3 → policy 2 失败 ×3 → policy 3 成功 ×1
current：policy 1 失败 ×1 → policy 2 失败 ×1 → policy 3 成功 ×1
```

本例展开得到 6 个 SE，属于 3 个 double-buffer 组。前两个 policy 的规划失败。第三个 policy 放宽 VF 复用检查后，inplace 合并使 SE 数量降到 4，`PlanBuffersWithoutReuse` 即可成功。

因此 current 的 DSATUR 只执行 **2 次**，发生在前两个失败 policy；第三个成功 policy 没有进入 DSATUR。地址规划阶段计时包括无复用快路径，并不全部都是 first-fit 扫描。

## 测量方式与边界

- 在 950-ide 执行；输入为同一个 `before-planmemory.mlir`，只运行 `--hivm-plan-memory-regbase`。
- stable 源码快照为 `693abf31f`（origin/stable），current 为 `18f12fd5f`。
- 使用现有 Release 编译参数，仅重编译诊断版 PlanMemory 对象并单独链接 `bishengir-opt`。没有修改仓库源码、正式构建目录或原组件。两版诊断程序共用现有其他对象，所以这是一组控制其他组件的源码阶段对比，不是重新完整构建两个正式版本。
- `steady_clock` 嵌套计时，打印发生在总计时结束后；没有启用 `--debug`。每版预热 5 次，正式采样 60 次，stable/current 交替并轮换先后顺序。
- 对每次样本断言：所有独占阶段之和等于总耗时；stable liveness / attempt 为 7 次，current liveness / policy 为 3 次，current DSATUR 为 2 次。
- **两版插桩输出 IR 分别与各自原组件的输出逐字节一致。** 这验证插桩未改变输出，不是说 stable/current 的输出必须互相一致。
- 插桩与独立重新链接会影响绝对时间；本表用于阶段占比、重复次数和成本结构分析。原组件的整体收益应以不插桩计时为准，不应把 936.15 / 588.59µs 当成原组件正式 Pass 耗时。

## 数据和复现文件

全部文件位于：

`/home/m00953828/mojo/mojo_data/planmemory_swiglu_timing_analysis_20261014/phase_profile/`

- `phase_summary.csv`：各阶段平均耗时、占比、调用次数。
- `phase_samples.csv` / `phase_samples.json`：60 次样本的逐阶段数据。
- `liveness_call_samples.json`：每次样本的逐轮 liveness 时间。
- `phase_summary.json`：汇总数据、逐轮 liveness 均值、原组件同期计时。
- `benchmark_pm_phases.py`：采样和校验脚本。
- `PMPhaseProfile.h`：诊断计时实现。
- `stable/`、`current/`：诊断源码、独立二进制、构建命令及输出 IR。

输入文件：

`/home/m00953828/mojo/mojo_data/planmemory_complex_activation_20261013_093936/03__swiglu_fwd_kernel/before-planmemory.mlir`
