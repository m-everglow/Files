# 为什么需要attempt
打乱候选 buffer 的处理顺序，避免当前内存规划算法因为“贪心顺序”导致某些本来可行的布局失败。
    attempt0: live = {A, B, C}
    attempt1: live = {C, A, B}

主要影响链路是：
    live buffer 顺序
        ↓
    genKillMap 中 gen/kill 的顺序
        ↓
    inplace pair 的选择顺序
        ↓
    StorageEntry 的生成/合并顺序
        ↓
    outline 中的首次可用地址选择
        ↓
    最终是否能放入有限 UB/L1/L0C 空间

为什么不能只尝试一次？
    因为当前 planner 有这些特点：
    - StorageEntry 主要按遍历顺序进入规划；
    - 地址分配是从 outline 中寻找第一个满足条件的区间；
    - inplace pair 选择存在顺序依赖；
    - multibuffer slot 需要成组匹配；
    - pipeline 冲突会使某些地址选择失效；
    - 多级 speculative plan 和 rollback 仍然无法覆盖所有排列组合。

# UB buffer类型


# SPEC_LEVEL分级


# Inplace Reuse
genBuffer  = 当前操作新生成/写入的 buffer，通常是输出
killBuffer = 当前操作之后生命周期结束的 buffer，通常是输入

A = alloc UB buffer
B = alloc UB buffer
B = vadd(A, C)

主要判断包括：
- killBuffer 的容量不小于 genBuffer；
- 两个 buffer 不是 memoryUnique；
- 没有被 ignoreInplace 禁止；
- 操作本身支持 inplace，例如部分 elementwise HIVM 操作；
- 不涉及不允许的 transpose/broadcast；
- 位宽、shape、VCast 连续性等满足要求；
- VF call 还需要通过额外的 VF 和 pipeline 冲突检查。

VFInplaceReuse：对某个 VF call，判断它的输出参数对应的 buffer，是否可以原地复用该次调用中某个输入参数对应的 buffer。
