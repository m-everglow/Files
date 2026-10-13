# RMSNorm `x5-weight5` 性能收益定位（2026-10-13）

## 结论

不是 autotune 选择了不同配置。`_rmsnorm_fwd_kernel` 使用确定性的 launch 参数与 `BLOCK_SIZE_M` 启发式；四次运行的输入 `.bcmlir` 哈希一致。stable/current 的编译产物不同，首次 IR 差异出现在**第三次 `PlanMemoryRegBase` 的输出**：UB 物理地址布局被重新排列。之后 `GraphSyncSolver` 生成的同步依赖也不同。这条链路能够解释为什么 PlanMemory 修改可能影响运行性能；但目前不能把约 3% 的收益精确归因于某一个地址或同步点。

## 关键证据

1. 复测：stable 两轮 902.428、905.382 µs；current 两轮 866.759、880.719 µs。均值 903.905 → 873.739 µs，快 30.166 µs（3.34%）。
2. `x5-weight5` 的四轮 `.bcmlir` SHA256 均为 `667211d1e8e372bdb6c6a9eb5ac66c83008742bdaa70bb4881f95f3a1a8085ac`；Triton `.ttir` 和 `.ttadapter` 两版也相同。源码是 `@triton.heuristics`，没有多候选 `@triton.autotune` 或 `best config selected`。因此不是 Triton 输入、tiling/autotune 切换造成的差异。
3. 用同一 `.bcmlir` 分别以 stable/current 的 `bishengir-compile` 重放并打开全量 IR。前两次 PlanMemory 的输出逐字节相同；第三次 PlanMemory 的输入相同、输出不同。此时主要变化是 `hivm.hir.pointer_cast` 的 UB 地址，并未观察到该 pass 改变计算操作的结构。例如一个双缓冲 `memref<10240xf32>` 从 `[0, 40960]` 变为 `[163840, 204800]`；另外两个同大小 buffer 的地址也重新排列。
4. 后续前向函数的 `GraphSyncSolver` 结果不同：stable 有 20 个 `wait_flag`、20 个 `set_flag`、2 个 `pipe_barrier`；current 分别为 21、21、3。同步的 pipeline/event 组合及位置发生变化，**并不是简单的“同步指令更少”**。
5. 重放所得 `kernel.o` 与各自端到端测试缓存中的 `.npubin` SHA256 完全一致（stable `36fc3e85…`，current `c0f6204f…`）。因此这次 IR 对比对应实际被测速的二进制。

## 解释边界

当前最稳妥的判断是：新 PlanMemory 改变 UB 布局，并向下游传播为不同的核内同步安排/机器码；这是可观察到的编译侧差异。收益可能来自不同的流水线等待或地址访问行为，但当前数据没有隔离这些机制，不能断言某一处同步变化就是 3.34% 收益的唯一原因。若要进一步精确归因，需要固定其他变量、交换布局或同步结果做消融测试，并看设备侧 stall/overlap 计数。

IR 与重放产物：`/home/m00953828/mojo/mojo_data/rmsnorm_x5_planmemory_analysis_20261013/{stable,current}/`。复测日志与 profiling：`/home/m00953828/mojo/mojo_data/planmemory_improved_groups_2x_20261013_101938/_rmsnorm_fwd_kernel/`。
