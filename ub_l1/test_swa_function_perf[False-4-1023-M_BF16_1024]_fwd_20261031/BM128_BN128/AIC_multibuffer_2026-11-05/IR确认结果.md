# AIC自动multibuffer：IR确认

**已生效，原case精度通过。**

调用处设置multibuffer=True、limit_auto_multi_buffer_buffer="only-cube"。BM=BN=128及其他参数保持原脚本设置，没有额外设置num_warps或num_stages。为避免重复传参，移除了autotune配置中同名的multibuffer=False项，唯一值来自调用处。

实际bishengir-compile命令确认：
- --enable-auto-multi-buffer=True
- --limit-auto-multi-buffer-buffer=only-cube

| AIC L1 buffer | 原版 | 本次 | IR物理起点（B） |
|---|---:|---:|---|
| Q | 单槽32 KiB | 双槽64 KiB | 0、163840 |
| K | 单槽32 KiB | 双槽64 KiB | 98304、196608 |
| V | 单槽32 KiB | 双槽64 KiB | 131072、229376 |
| V1→C2的P | 双槽64 KiB | 双槽64 KiB | 32768、65536 |
| 合计 | 160 KiB | **256 KiB / 512 KiB** | [0,262144) |

证据：PlanMemory前Q/K/V分配均带hivm.multi_buffer=2；EnableMultiBuffer前各有两个地址；最终编译IR中8个32 KiB物理L1槽均保留。

原pytest case：test_swa_function_fwd_perf[False-4-1023-M_BF16_1024]，1 passed。原case精度max_abs=0.015625。同次profiler采到20条_swa_fwd_kernel记录，均值24.9559 μs，中位数24.8515 μs，范围24.500–26.231 μs。与历史128×128约25.1 μs接近；这不是同批配对复测，不据此认定性能提升。

采集过程只增加IR打印参数；没有替换bcmlir或二进制。初次因autotune与调用处重复传入multibuffer报错，去除重复项后的本轮为有效结果。

原始资料：/home/m00953828/mojo/ub_l1/swa_aic_multibuffer_20261105/retry_no_duplicate
- compile_1/original_command.json：实际算法编译参数
- compile_1/command.json：增加日志打印后的命令
- compile_1/input.bcmlir：实际输入
- compile_1/all_ir.log：全量后端IR
- before_planmemory.mlir：PlanMemory前模块
- aic_before_enable_multibuffer.mlir：AIC多地址pointer_cast
- pytest.log：原case日志
- swa.patch：算子改动
