# PlanMemory 的 UB 内存分配代码路径与示例

源文件：`bishengir/lib/Dialect/HIVM/Transforms/regbase/PlanMemory.cpp`

## 1. 总体调用树

```text
PlanMemoryPass::runOnOperation()                         // Module 级入口
├── BuildCVReuseAllowedPairs()                          // 可选：构造 CV buffer 安全复用白名单
├── VFInplaceReuseAnalysis                              // 分析 VF call 参数的 inplace 关系
├── 第一次遍历非 host、非 VF 的 func::FuncOp
│   └── PlanMemoryForFuncOp()                           // 函数级入口
│       └── 最多 20 次确定性 shuffle 尝试
│           ├── MemLivenessAnalysisRegBase::build()     // 第 1 阶段
│           │   ├── RecursionIR()
│           │   │   ├── 线性化 if / for / while / scope
│           │   │   ├── 收集 BufferInfo
│           │   │   ├── 建立 alias 关系
│           │   │   └── 建立 genKillMap
│           │   ├── UpdatePreloadBuffersGenKillMap()
│           │   ├── GenerateBufferLife()                // gen/kill → allocTime/freeTime
│           │   ├── InitializeInplacePairList()
│           │
│           ├── MemPlanRegBase::InitMemSpecsFromModule()
│           │   ├── 读取 UB_SIZE
│           │   ├── 读取 UB_ALIGN_SIZE
│           │   └── SIMT/MIX VF 时动态调整可用 UB 大小
│           │
│           └── MemPlanRegBase::plan()                  // 第 2 阶段
│               ├── GenerateStorageEntry()              // 每个 gen buffer → 初始 StorageEntry
│               ├── PlanWorkSpaceMemAddress()           // GLOBAL_WORKSPACE_PLAN 分支，本文不展开
│               └── PlanLocalMemAddress()               // LOCAL_MEM_PLAN 分支
│                   ├── dmaFirstPipelineOpt.build()
│                   │   ├── 标记 MTE2/MTE3/FIX buffer
│                   │   └── 标记 scalar load/store/loop buffer
│                   ├── MergeInplaceSE()
│                   │   ├── GenerateInplaceList()
│                   │   └── 合并可原地复用的 StorageEntry -> inplace 减少了两个 buffer 交接时的瞬时内存需求，但可能延长大存储块的占用、扩大 pipeline 冲突并限制后续地址布局，不是无条件有利
│                   ├── ExpandMultiBufferStorageEntry()
│                   ├── MergeSameScopeSE()
│                   │   ├── UB root + UB children
│                   │   ├── L1 root + L1 children
│                   │   └── L0C root + L0C children
│                   └── PlanMemAddressOfWholeLocalBuffer() // 策略梯子入口
│                       └── 对每个 memScope 独立规划
│                           ├── GetBufferSpaceInfo()
│                           │   └── UB: align=ubAlignSize, capacity=ubSpaceSize
│                           ├── ① requiredSize <= capacity
│                           │   └── PlanBuffersWithoutReuse()
│                           ├── ② requiredSize > capacity 且没有 children
│                           │   └── PLAN_FAILED
│                           ├── ③ GetReorderRootStorageEntry()        // UB entry 重排
│                           │   └── PlanMemAddressForSingleLevel(SPEC_LEVEL_3)
│                           │       └── 计算 no-pipe-stall 布局的最大地址
│                           └── ④ 如果 Level 3 布局仍超过容量
│                               ├── splitOutline = true
│                               ├── 创建有限容量 outline [0, ubSpaceSize)
│                               └── 逐个 StorageEntry 执行 MultiSpecPlan()
│                                   ├── SpecAlloc(level 3)
│                                   ├── SpecAlloc(level 2)
│                                   ├── SpecAlloc(level 1)
│                                   ├── SpecAlloc(level 0)
│                                   └── 全部失败 → ApplyFailStrategy()
│                                       ├── RollBackForAllocFail()
│                                       ├── 回滚历史 StorageEntry
│                                       ├── 降低回滚点的 spec level
│                                       └── CONTINUE / RESTART / FAILED
│
│               └── UpdateBuffer2Offsets()              // bitsOffset → byte offset vector
│
├── UpdateId2Offsets()                                  // 记录 CV mix id 的提供侧地址
└── 第二次遍历已规划函数
    ├── UpdateBuffer2OffsetsForFuncOp()                  // 同步 AIC/AIV CV 地址
    ├── walkAllocToPointerCast()                         // local alloc 写回 planned address
    └── fixMultibufferEnabledPointerCastOps()
```

## 2. 完整示例

下面使用 KB 表示大小，并假设所有大小已经满足 UB 对齐。

### 2.1 输入

假设可用 UB：

```text
ubSpaceSize = 256 KB
```

经过 liveness、inplace 合并和 multibuffer 展开后，有四个 StorageEntry：

| Entry | 类型 | 大小 | 生命周期 | 父 loop |
| --- | --- | ---: | --- | --- |
| U | memoryUnique | 64 KB | `[0,10]` | loop0 |
| D | DMA | 96 KB | `[0,4]` | loop0 |
| V | ordinary/vector | 96 KB | `[5,9]` | loop0 |
| S | scalar | 64 KB | `[2,8]` | loop0 |

无复用总需求：

```text
64 + 96 + 96 + 64 = 320 KB > 256 KB
```

所以快速路径失败。

### 2.2 UB 重排

按类别排序：

```text
U(memoryUnique)
    ↓
D(DMA)
    ↓
V(ordinary)
    ↓
S(scalar)
```

得到：

```text
root = U
children = [D, V, S]
```

### 2.3 Level 3 单级试排

初始无限 outline：

```text
[0, ∞) life={}
```

依次规划：

```text
U -> [0,64)
```

U 是 `memoryUnique`，其他 entry 不能普通复用它的地址。

```text
D -> [64,160)
```

V 与 D 生命周期不重叠：

```text
D = [0,4]
V = [5,9]
```

但 D 是 DMA buffer，Level 3 的 `BufferPipeConflict(D,V)` 阻止 V 复用 D 的地址，所以：

```text
V -> [160,256)
```

S 的生命周期 `[2,8]` 与 U、D、V 都有重叠，只能放到末尾：

```text
S -> [256,320)
```

Level 3 试排最高地址：

```text
maxAllocBits = 320 KB > 256 KB
```

因此不能接受，进入有限容量的多级规划。

### 2.4 有限 outline 中首次尝试

重新建立：

```text
outline = [0,256)
splitOutline = true
```

Level 3 下先得到：

```text
U -> [0,64)
D -> [64,160)
V -> [160,256)
```

轮到 S 时：

```text
[0,64)    被 U 的 memoryUnique 占用
[64,160)  生命周期与 D 重叠
[160,256) 生命周期与 V 重叠
```

S 在 Level 3、2、1、0 都找不到 64 KB 可用区间，触发回滚。

### 2.5 回滚并降低 V 的策略

规划器撤销 V 的历史记录，把回滚点移到 V。假设 V 与 D 属于同一个 loop：

```text
V 在 Level 2 下仍不能与 D 共享地址
```

Level 1 在本例中没有 multibuffer relation，因此不适用。

到 Level 0 时，只要求生命周期不重叠：

```text
D = [0,4]
V = [5,9]
```

所以 V 可以复用 D 的物理地址：

```text
D -> [64,160), life=[0,4]
V -> [64,160), life=[5,9]
```

对应 outline 记账可以理解为：

```text
[0,64)    life={U[0,10]}
[64,160)  life={D[0,4], V[5,9]}
[160,256) life={}
```

### 2.6 再次规划 S

S 生命周期 `[2,8]` 与 D、V 都重叠，因此不能使用 `[64,160)`；但 `[160,224)` 仍为空：

```text
S -> [160,224)
```

最终布局：

```text
UB [0,64)      U
UB [64,160)    D / V 生命周期复用
UB [160,224)   S
UB [224,256)   未使用
```

最终峰值：

```text
224 KB <= 256 KB
```

规划成功。

### 2.7 最终 offset 回写

`UpdateBuffer2Offsets()` 将 `bitsOffset` 转成 byte offset，并给 entry 中所有 `inplaceBuffers` 写入地址：

```text
U.offset = 0
D.offset = 64 KB
V.offset = 64 KB
S.offset = 160 KB
```

随后 `walkAllocToPointerCast()` 把这些地址写回对应的 local alloc/pointer cast。D 和 V 是不同逻辑 buffer，但生命周期不重叠，因此共享同一个 UB 地址。

## 3. 核心理解

UB 分配可以压缩为下面这条主线：

```text
IR 中的 UB alloc
    ↓
liveness 得到大小、alias、gen/kill、生命周期
    ↓
每个 buffer 生成 StorageEntry
    ↓
inplace 合并，multibuffer 展开
    ↓
按 UB 分组并重排
    ↓
先尝试不复用
    ↓ 超容量
尝试 Level 3 无 pipeline stall 布局
    ↓ 仍超容量
在有限 UB outline 中执行 Level 3→2→1→0 first-fit
    ↓ 失败
回滚前序 entry 并降低策略重新规划
    ↓
得到每个 StorageEntry 的 bitsOffset
    ↓
转换为每个 buffer 的 byte offset 并写回 IR
```

当前算法的本质是：

> 以 StorageEntry 顺序为基础、以 outline 为地址状态、以生命周期为正确性底线、以 spec level 控制 pipeline/multibuffer 策略的 first-fit 风格贪心规划，并通过有限回滚和最多 20 次确定性顺序重试提高成功率。
