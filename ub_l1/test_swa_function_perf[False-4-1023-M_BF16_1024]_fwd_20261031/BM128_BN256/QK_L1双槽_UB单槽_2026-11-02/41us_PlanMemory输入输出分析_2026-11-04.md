# 41 μs 版本的 PlanMemory 输入输出

结论：本次检查未发现 PlanMemory 分配错误。QK 的 L1 双槽保留，K/V 合法复用同一地址。需要继续优化的是核内同步释放的位置。

重新编译的二进制与原 41.1682 μs 版本 SHA256 完全一致：162a2c41eb956d61cd2d5e6e313d69a3258aa7ecd7cec99e57e0c8b5d02a1e59。本次只做编译和 IR 检查，未运行硬件。

## AIC 的 L1 分配

以下 SSA 名来自第三次 PlanMemory 的输入、输出。区间单位为 KiB，右端不包含在内。

| buffer | 输入 SSA | 输出 SSA | 大小 | 输出地址范围 |
|---|---|---|---:|---|
| Q | %alloc | %55 | 32 KiB | [0, 32) |
| P 槽 0 | %alloc_6 | %73 | 64 KiB | [96, 160) |
| P 槽 1 | %alloc_7 | %74 | 64 KiB | [32, 96) |
| QK 暂存槽 0 | %alloc_8 | %75 | 128 KiB | [288, 416) |
| QK 暂存槽 1 | %alloc_9 | %76 | 128 KiB | [160, 288) |
| K，C1 内的 %alloc_14 | %alloc_14 | %126 | 64 KiB | [416, 480) |
| V，C2 内的 %alloc_14 | %alloc_14 | %129 | 64 KiB | [416, 480) |

两个 %alloc_14 在不同的 scf.if 内，名称相同，但输入中是两个独立分配。

QK 双槽、P 双槽地址均不重叠。K/V 复用同一个 64 KiB 区域，最终 L1 地址占到 480 KiB，没有超出 512 KiB。

AIC 中可见的跨核 UB 地址也保持分离：QK 单槽 [99584,165120) 字节；PV 两槽分别为 [165120,197888)、[49664,82432) 字节。它们之间没有地址重叠。这不是对全部 VF 临时 buffer 的重新审计。

## K/V 为什么可以复用

输入中 K 在 ssbuffer.if=4 的 C1 内加载，供该块的 mmadL1 使用；V 在 ssbuffer.if=6 的 C2 内加载，供该块的 mmadL1 使用。两块按程序顺序提交，K/V 数据不作为循环携带值保留到后续计算块。

硬件 MTE2、MTE1 异步执行，因此仅看 SSA 生命周期还不够。后续 GraphSyncSolver 插入 MTE1→MTE2 同步，保证旧值从 L1 读完后，才允许另一个 GM load 覆盖这个区域。跨轮次也有对应的同步。因此，这里的同址复用没有暴露出覆盖未读数据的问题。

## 保留双槽，让 K/V 分开分配的验证

只给 K、V 原始分配增加 mem_unique，QK 双槽、ssbuffer 条件和计算顺序均保持不变。

编译在第三次 PlanMemory 失败：

    cbuf overflow, requires 4456448 bits while 4194304 bits available!

即需要 544 KiB，容量为 512 KiB。按当前这些 buffer 各自占独立区域计算：

    Q 32 + P 双槽 128 + QK 双槽 256 + K 64 + V 64 = 544 KiB

这说明直接禁止 K/V 复用无法在当前规划下编译通过；不代表已经排除了其他生命周期复用方案。

## GM load 为什么被推迟

GraphSyncSolver 输出中：

- 第 229 行：C1 的 mmadL1 使用 K。
- 第 245/248 行：L1→UB copy，读取 QK 暂存槽，不读取 K。
- 第 262 行：C1 整块结束后，才发 MTE1→MTE2 EVENT_ID0。
- 第 284 行：C2 之前等待 EVENT_ID0，之后才提交 V 的 GM→L1 load。
- 第 371 行：C2 整块结束后发 MTE1→MTE2 EVENT_ID1；下一轮 C1 前的第 184 行等待它。

所以 V 的 GM load 不仅等 K 读完，还等了 C1 后面的 L1→UB copy。跨轮次的 K load 也会受到这些 MTE1 排队和块级同步位置影响。

这里有真实的 K/V 覆盖依赖，同步不能直接删除。可继续检查 GraphSyncSolver 能否在 K 的最后一次 L1 读取完成处提前释放，而不是等到整个 C1 结束。涉及 mmadL1 内部 L1→L0 的同步接口，需要单独验证；本次未修改同步代码。

## 复现文件

原始日志和 IR 均在 Files 目录之外：

- 输入：/home/m00953828/mojo/ub_l1/planmemory_audit_41us_20261104/before_planmemory_2.mlir
- 输出：/home/m00953828/mojo/ub_l1/planmemory_audit_41us_20261104/after_planmemory_2.mlir
- 核内同步输入：/home/m00953828/mojo/ub_l1/planmemory_audit_41us_20261104/before_gss_2.mlir
- 核内同步输出：/home/m00953828/mojo/ub_l1/planmemory_audit_41us_20261104/after_gss_2.mlir
- 双槽 K/V 分开分配日志：/home/m00953828/mojo/ub_l1/planmemory_audit_41us_20261104/separate_compile.log

此前 38.38 μs 实验把 QK 的 L1 暂存改成单槽，改变了双槽实验条件，不作为保留双槽方案的优化结论。

## 后续同步验证

只提前 C1 真分支的释放信号，仍会受到空调度轮次收发事件的限制。进一步按实际 K/V 读取收发事件后，保持双槽、地址和访存不变，硬件精度通过，均值 38.27 μs（本轮原版 40.72 μs，提升 6.02%）。新流水确认 V 的 GM load 已与 L1→UB copy 重叠。详见 ../双槽_核内同步优化_2026-11-04/分析与验证.md。
