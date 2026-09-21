# 重构规划
## 1. 调整顶层的attempt的位置
### 提交1：显式区分 policy 和 ordering attempt
    不改变算法结果，只调整控制流：
    PlanMemoryForFuncOp
    → PlanWithPolicies
    → LegacyFirstFitPlanner
### 提交2：消除规划过程中的全局副作用
    处理：
    remove MultiBufferAttr
    disableVFReachableCheck pass成员
    改为 policy-local，成功后再 commit。
### 提交3：liveness 确定化并允许复用
    处理：
    randomSeed
    randomGenerator
    getShuffledRange
    SetLinearOperation(move)
    让 liveness 每个 policy 只执行一次。
### 提交4：顺序扰动下沉到 StorageEntry 层
    新增：
    BuildStorageEntryOrder()
    LegacyOrderKind
    StableStorageEntryId
    PlanningWorkingSet
    first-fit 的 retry 完全封装在 LegacyFirstFitPlanner 中。

## 2. 替换first-fit算法



# PlanMemory 总体分析

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


## 4. 当前方案的问题

### 4.1. First-fit 可能产生假失败
当前PLAN_FAILED，代表当前排序、inplace 组合和有限回滚没有找到可行布局，而不一定是UB容量不足。

```text
当前 entry 选择第一个可行位置
    ↓
局部选择占据关键空间
    ↓
后续 entry 无法放置
    ↓
PLAN_FAILED
```

### 4.2. Optional inplace 在全局规划前被不可逆合并

```text
大输入 A，短生命周期
小输出 B，长生命周期

A/B inplace
    ↓
B 的整个生命周期占据 A 的大空间
    ↓
其他 buffer 无法复用 A 的旧地址
```

### 4.3. 20 次 attempt 重复完整分析，编译成本高但搜索覆盖有限

每次attempt都执行完整的如下步骤：
```text
MLIR Liveness
IR 遍历
alias/gen-kill/BufferLife
StorageEntry 构建
inplace 合并
outline 规划
rollback
```

更合理的方式是：
```text
分析一次
    ↓
构建不可变规划问题
    ↓
solver 内低成本尝试不同决策
```

###  4.4. 求解结果高度依赖 StorageEntry 顺序

当前 solver 是顺序敏感的 first-fit 启发式算法；20 次确定性 shuffle 是一种 multi-start heuristic，通过尝试若干不同的间接输入顺序提高找到可行解的概率，但它既不保证找到可行解，也不解决 first-fit 缺少全局视角的根本问题。

StorageEntry顺序的来源：
```text
同一个 IR
    ↓
相同的 buffer、大小、生命周期、UB 容量
    ↓
不同 attempt 使用不同 seed
    ↓
部分 live buffer 的遍历顺序变化
    ↓
gen/kill vector 顺序变化
    ↓
inplace pair 和 StorageEntry 顺序可能变化
    ↓
first-fit 得到不同地址布局
    ↓
可能出现不同 offset、不同峰值，甚至成功/失败差异
```

## 5. 重构方案

1、提供复杂度分析
2、best-fit主要提供性能优先的分配策略
3、best-fit失败，落入beam search展开更广范围的搜索，可以基于best-fit的已有信息进行快速剪枝


### 5.1. 方案一：确定性 Global Decreasing Size Best-Fit
做法：
1. 对同一 mem Scope 的 AllocationUnit 建立冲突关系。
2. 使用固定规则排序，例如：
    memoryUnique
    → MultiBuffer/同址组合
    → conflictBytes 降序
    → alignedSize 降序
    → lifeSpan 降序
    → StableBufferId
3. 对当前 entry，生成所有可能的候选地址：
    0
    AlignUp(other.offset + other.size)
4. 检查候选地址与所有冲突 entry 是否空间重叠。
5. 不选扫描到的第一个，而是评估全部候选，选择代价最小的一个。
代价可以是：
    (newPeak,
    specLevelPenalty,
    generatedFragmentSize,
    offset)

优点：
- 一次 liveness、一次分配；
- 行为稳定；
- 比当前“从低地址遇到第一个就提交”更合理；
- 实现成本较低；
- 容易先与现有实现做 A/B 对比。
缺点：
- 依然是单路径贪心；
- 前面一次不理想的决策仍然无法撤销；
- 仍然可能出现“明明存在可行解，但算法报告失败”。
因此它适合作为新框架的 baseline，不建议作为重构的最终目标。


### 5.2. 方案二：确定性有界 Beam Search / Branch-and-Bound
这是推荐方案。
核心思想是：每次不只保留一个局部最优布局，而是保留前 K 个不同的部分布局。
固定 AllocationUnit 输入
        ↓
最难分配的 unit 优先
        ↓
枚举当前 unit 的全部边界候选地址
        ↓
产生多个新状态
        ↓
计算每个状态的下界和代价
        ↓
剪枝并保留最好的 K 个状态
        ↓
继续下一个 unit

候选地址仍然不需要遍历整个 UB 地址空间。对于普通连续布局，只需要考虑：
0
AlignUp(已分配冲突块的结束地址)

原因是：如果一个可行 buffer 没有贴着地址 0 或某个冲突块的右边界，它通常还能继续向低地址移动；因此真正有意义的紧凑布局一般位于这些边界上。

每个搜索状态包含：
struct PlanningState {
  DenseMap<UnitId, uint64_t> offsets;
  uint64_t peakBits;
  SpecPenalty penalty;
  FragmentMetric fragmentation;
};

排序目标建议采用字典序，而不是简单的加权求和：
1. peakBits 必须 ≤ maxBits
2. 尽量保持 SPEC_LEVEL_3 / no-stall
3. 尽量减少降级到 level 2/1/0 的 entry 数量或容量
4. 最小化 peakBits
5. 最小化碎片
6. StableId 保证相同代价下结果稳定

剪枝下界可以先实现：
lowerBound =
    max(
        currentPeak,
        maximumLiveBytes,
        mandatoryConflictLowerBound
    )

如果 lowerBound > maxBits，状态直接丢弃。

为了让编译时间严格可控，不建议用 wall-clock timeout，而使用确定性预算：
beamWidth       = 8/16/32
maxExpandedNode = 固定数量
maxCandidatesPerUnit = 固定数量

相同 IR、相同配置一定得到相同结果和近似相同工作量。

建议用方案一的结果作为第一个完整解和搜索上界。这样：
- 简单输入通常直接结束；
- 困难输入才进入有限搜索；
- 搜索耗尽预算时，仍然至少有一个合法的 greedy 结果；
- 不再需要 20 次随机 attempt。

### 5.3. 方案三：CP-SAT/ILP 精确求解
每个 AllocationUnit 建立地址变量：
    offset[i] ≥ 0
    offset[i] % alignment[i] = 0
    offset[i] + size[i] ≤ maxBits

对于任意硬冲突 pair (i, j)：
    offset[i] + size[i] ≤ offset[j]
    OR
    offset[j] + size[j] ≤ offset[i]

同址/inplace：
    offset[i] = offset[j]
目标：
    minimize peak
    peak ≥ offset[i] + size[i]

spec level 可以通过布尔变量和 penalty 建模。OR-Tools CP-SAT 原生支持整数变量、可选约束和 NoOverlap2D；将时间作为固定 X 轴、地址作为变量 Y 轴即可表达生命周期矩形不重叠。

优点：
- 可以证明最优；
- 找不到方案时可以更可信地判断不可行；
- 非常适合作为单元测试和算法质量评估的 oracle。
缺点：
- 引入第三方求解器依赖；
- 最坏情况指数复杂度；
- BufferLifeVec 多段生命周期、MultiBuffer、spec level 会显著增加模型复杂度；
- 编译延迟难以保证；
- 大函数不适合作为默认生产路径。

建议用途：
- 小规模函数精确求解；
- CI 中随机生成小图，对比启发式结果；
- 验证“当前 greedy 报失败但实际有解”的 testcase；
- 衡量 Beam Search 与最优值之间的 gap。

### 5.4. 最终建议
选择方案二，但按三步落地：

阶段一：解耦
  一次确定性 liveness
  → MemoryPlanningProblem
  → Solver 接口
  → 独立 Verifier

阶段二：建立基线
  实现 deterministic global best-fit
  替换 outline first-fit
  去掉 20 次 attempt

阶段三：提升求解质量
  在 best-fit 结果上加入 bounded Beam Search
  保留多个部分布局
  用固定节点预算控制编译开销

方案二与当前方案的对比

当前方案基本是单路径：

处理 Entry A
  → 从低地址扫描
  → 找到第一个可用位置
  → 提交

处理 Entry B
  → 从低地址扫描
  → 找到第一个可用位置
  → 提交

处理 Entry C
  → 无法分配
  → 局部 rollback / 降 spec_level

维护的只有一个布局：
当前状态 = 唯一的 outline + history

方案二：
处理 Entry A
  ├── 状态 S1：A 放在 offset 0
  ├── 状态 S2：A 放在 offset 4096
  └── 状态 S3：A 放在 offset 8192

处理 Entry B
  ├── 从 S1 扩展若干布局
  ├── 从 S2 扩展若干布局
  └── 从 S3 扩展若干布局

对所有新状态评分，只保留最好的 Beam width 个