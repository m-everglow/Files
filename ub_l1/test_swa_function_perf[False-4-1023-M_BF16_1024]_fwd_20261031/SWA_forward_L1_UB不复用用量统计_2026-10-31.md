# SWA forward：before PlanMemory 的 UB / L1 用量

输入：/home/m00953828/Files/ub_l1/test_swa_function_perf[False-4-1023-M_BF16_1024]_fwd_20261031/before_planmemory.mlir

按当前 IR 中的静态 memref.alloc 逐条求和；计入显式 multi_buffer 和 32 B 尺寸对齐，不做 PlanMemory 原地复用或生命周期合并。容量来自 Ascend950_BaseSpec（UbSize=2031616 bit、L1Size=4194304 bit），与 IR 第17行一致。

| 内存（每核） | 可用容量 | 不复用用量 | 占用 |
|---|---:|---:|---:|
| AIV UB | 248 KiB | 282,880 B = 276.25 KiB | 111.39%（超出 28.25 KiB） |
| AIC L1 | 512 KiB | 163,840 B = 160.00 KiB | 31.25% |

| 类别 | alloc 数 | 不复用用量 | 主要 IR 证据 |
|---|---:|---:|---|
| L1：GM load（Q/K/V） | 3 | 96 KiB | nd2nz 第183、250、332行；AIC %alloc 第162行、%alloc_13 第229/314行 |
| L1：tight-couple | 2 | 64 KiB | AIC %alloc_6/%alloc_7 第189–192行 |
| UB：GM load | 1（2槽） | 16 KiB | AIV %alloc_34 第670–673行，64×128xi8，multi_buffer=2 |
| UB：tight-couple | 4 | 128 KiB | AIV %alloc_7–%alloc_10 第595–604行；AIC fixpipe 结果 |
| UB：VECTOR 显式槽 | 6 | 1.5 KiB | AIV %alloc_11–%alloc_16 第607–612行，两个三槽状态组 |
| UB：VF 工作与结果 | 15 | 130.75 KiB | AIV 中其余 UB alloc，详见 CSV |

39 条 alloc 中，6 条是跨核 tight-couple 的镜像、2 条属于 L0C，排除后计 5 条 AIC L1 和 26 条 AIV UB。AIV cbuf 两条镜像归 AIC L1；AIC UB 四条镜像归 AIV UB，不能再加一次。

各分配的类型大小已满足 32 B 尺寸对齐，因此本例对齐前后总数相同。第670行 UB load 单槽 8 KiB，按标记计两槽为 16 KiB；其余独立 alloc 各计一次，循环次数不乘入。结果是无复用的静态分配预算，不代表 PlanMemory 最终布局。

逐 alloc 明细：/home/m00953828/mojo/ub_l1/swa_tiling_debug_archive_20261031/baseline_128x128_evidence/SWA_forward_L1_UB分配明细_2026-10-31.csv
容量和对齐源码：/home/m00953828/AscendNPU-IR/bishengir/include/bishengir/Dialect/HACC/Targets/NPUTargetSpec.td:225
