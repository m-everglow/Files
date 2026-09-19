# attempt
attempt影响：
    genKillMap[op].gen  中的顺序
    genKillMap[op].kill 中的顺序

示例: 
    UB SIZE=192KB
    A: 96 KB
    B: 96 KB
    X: 96 KB
    Y: 96 KB

inplace候选: 
    X -> A 或 B
    Y -> A

1、差的attempt: inplace列表[X, Y]
    X -> A
    Y 无法 inplace
    B 独立

物理Entry: -> 若生命周期无法复用，则规划失败
    XA: 96 KB
    Y:  96 KB
    B:  96 KB

2、好的attempt: inplace列表[Y, X]
    Y -> A
    X -> B

物理Entry: -> TOTAL SIZE<=192KB, 规划成功
    YA: 96 KB
    XB: 96 KB

# UB buffer类型
memoryUnique buffer
    ↓
DMA touched buffer
    ↓
普通 buffer
    ↓
scalar pipeline buffer


# StorageEntry
经过 inplace 合并和 multibuffer 展开之后，UB/L1/L0C 地址规划器真正处理的“内存对象”。

# SPEC_LEVEL分级
SPEC_LEVEL_3：避免 pipeline conflict
SPEC_LEVEL_2：避免同一 loop 内地址复用
SPEC_LEVEL_1：复用 multibuffer 的整组地址
SPEC_LEVEL_0：纯生命周期复用

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
