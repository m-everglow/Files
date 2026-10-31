# 128×256：UB 复用可行性

**保持原 IR 的双 buffer、VF 数据布局和调度，仅调整 PlanMemory 的分配顺序或普通生命周期复用，不能放入 248 KiB。** 若要成功，需要进一步改变 buffer 的使用方式或计算调度。

分析对象为未做 L1 中转的 before_planmemory_attempt1.mlir。重新执行现有 bishengir-opt 的 PlanMemory，仍需 273.25 KiB，超出 25.25 KiB。该需求是本次分配结果，不是理论最小值。

## 关键重叠区间

在 AIV 的 outlined_vf_1 调用处，下面几块大 buffer 在现有生命周期模型中重叠：

| AIV SSA | 大小 | 必须保留的原因 |
|---|---:|---|
| %alloc_7、%alloc_8 | 128 KiB | 两个跨核 QK 槽，%130 选择其中一个；另一槽可能被 CUBE 并行生产 |
| %alloc_9、%alloc_10 | 64 KiB | 两个跨核 PV 槽，后续通过 %133 消费，不能直接覆盖 |
| %arg31（%alloc_17 / %alloc_33） | 32 KiB | 循环携带的累加结果，后面的 fused_2 VF 仍需读取；这里只计一份 |
| %alloc_39 | 32.5 KiB | 当前 VF 的 NZ 格式 bf16 输出，分配形状 16×65×16×1，含 padding |
| 合计 | **256.5 KiB** | 已超过 248 KiB **8.5 KiB**，还未计小 buffer |

调试日志中，四个跨核槽的生存区间均覆盖 VF1；%alloc_17/%alloc_33 为 138–353，%alloc_39 为 204–222。当前跨核复用分析得到 0 对可共享 buffer。

## 为什么不能把 %alloc_39 直接放到 %130 上

%130 是 64×256 的行优先 f32 输入。VF1 按行读取，但 bf16 输出按 NZ 地址写入，plane stride 为 2080 B，row stride 为 32 B。同址复用会把后面尚未读取的输入行覆盖，不能把 64 KiB 输入简单缩成 32.5 KiB 输出。

另外按原 VF 顺序扫描了 32 B 对齐的输入输出相对地址：只考虑 VF1 的读写依赖、忽略核间限制时，最多允许约 3 KiB 的部分重叠。即使采用这个乐观值，上述大块仍需 253.5 KiB，超过容量。该扫描不是完整合法地址方案，不能直接用于硬件。

可复用的 mask %alloc_34（16 KiB）在 VF0 后失效，可以与后续临时空间共享；尾部输出也可以复用循环结束后的空间。但它们不能消除 VF1 处的上述重叠。

**后续优先方向：减少跨核槽位并配套调整调度/同步，或改变 VF 的分块与布局以允许真正的原地转换。单纯优化地址排序不足以解决当前 IR。** 这个结论限于当前整块 buffer 与既有调度，不是对所有改写方案的不可能性证明。

原始 IR：本目录 before_planmemory_attempt1.mlir。调试日志与计算证据：/home/m00953828/mojo/ub_l1/swa_tiling_debug_archive_20261031/BM128_BN256/reuse_feasibility/。
