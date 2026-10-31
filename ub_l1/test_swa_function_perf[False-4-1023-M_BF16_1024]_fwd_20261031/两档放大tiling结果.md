# SWA forward 放大 tiling 结果

用新构建的 `stable` (`a0d796eb7`)；固定 autotune，`multibuffer=False`；首个用例只调用一次 forward。容量：AIV UB 248 KiB，AIC L1 512 KiB。

| BLOCK_M × BLOCK_N | 编译/运行 | PlanMemory 最终所需 UB | before PlanMemory 不复用 UB | before PlanMemory 不复用 L1 |
|---|---|---:|---:|---:|
| 128 × 256 | 编译失败：UB overflow；未运行 | 273.25 KiB | 356.50 KiB | 288.00 KiB |
| 256 × 128 | 编译失败：UB overflow；未运行 | 358.50 KiB | 536.25 KiB | 256.00 KiB |

详细 IR、错误和分项用量分别见 `BM128_BN256/结果与内存统计.md`、`BM256_BN128/结果与内存统计.md`。
表中“最终所需 UB”是编译器报错值；“不复用”是对 before PlanMemory 的静态 alloc 求和，两者口径不同。

128×256 的 L1 中转与单 UB 槽原型已通过完整编译和 Triton 对象替换；NPU 输出正确性受设备运行超时阻碍，详见 `BM128_BN256/L1中转实验.md`。
