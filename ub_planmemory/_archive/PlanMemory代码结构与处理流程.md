# PlanMemory.cpp 代码结构与处理流程

文件：`AscendNPU-IR/bishengir/lib/Dialect/HIVM/Transforms/regbase/PlanMemory.cpp`

## 1. 文件职责

该文件实现 HIVM RegBase 后端的内存规划 Pass。核心目标是：根据每个 buffer 的生命周期、别名关系、内存空间、原地复用约束及硬件容量/对齐要求，为局部内存或全局 workspace 分配地址偏移，并将结果回写到 IR。

支持的主要内存规划模式：

- `LOCAL_MEM_PLAN`：规划 UB、L1、L0C 等局部内存空间，必要时利用生命周期重叠分析复用地址。
- `GLOBAL_WORKSPACE_PLAN`：规划 workspace 参数对应的 GM 偏移，可选择全局复用。

整体结构可以概括为：

```text
PlanMemoryPass
  ├─ MemLivenessAnalysisRegBase：遍历 IR，建立 buffer/alias/gen-kill/lifetime
  └─ MemPlanRegBase：建立 StorageEntry，尝试原地复用和地址分配
       └─ MultiSpecPlan / SpecAlloc：按内存空闲区间和规划策略放置 buffer
```

## 2. 文件主要组成

### 2.1 文件级辅助函数

开头的匿名命名空间提供规划判定和标记解析逻辑：

- `isReusableCastOp`、`isReusableNarrowWidth`、`isReusableOperands`：判断窄位宽转换、元素位宽和 shape 条件是否允许原地复用。
- `hasInlineBroadcastOrTransposeAttr`：检测 HIVM 操作是否带 inline broadcast/transpose 维度。
- `isReusableExtraBuffer`：判断额外临时 buffer 是否符合原地复用条件。
- `isStaticShapeSame`：比较生成 buffer 与释放 buffer 的静态 shape。
- `GetCVMixIdAndAllocOpFromMarkOp`：从 tightly-coupled buffer 标记中解析 CV mix id，并追溯对应的 alloc。

这些函数主要被后续的 HIVM 原地复用判定及跨核 CV buffer 地址共享逻辑调用。

### 2.2 `MemLivenessAnalysisRegBase`

负责把 MLIR Region/Operation 转换成内存规划需要的线性信息，维护的核心数据包括：

- `linearOperation`：按遍历顺序记录操作，并为控制流建立 begin/end 位置。
- `bufferInfos`：buffer 的内存空间、元素类型、静态大小等信息。
- `buffer2AliasVec`：buffer 别名及条件别名关系。
- `genKillMap`：每个线性操作生成哪些 buffer、释放哪些 buffer。
- `buffer2Life`：每个 buffer 的 `[allocTime, freeTime]` 生命周期。
- `inplacePairList`：来自显式别名且满足约束的原地复用对。
- preload、multibuffer、tightly-coupled buffer 等特殊属性信息。

主要方法分组如下：

1. `build`
   - 创建 MLIR `Liveness`。
   - 调用 `RecursionIR` 遍历函数 Region。
   - 补充 preload buffer 的跨 scope gen/kill 信息。
   - 生成生命周期并初始化原地复用对。
   - 记录 `SyncBlockWaitOp` 的位置，用于跨 pipeline 冲突判断。

2. `RecursionIR` 与控制流递归处理
   - 普通操作通过 `UpdateLinearOperation` 加入线性序列。
   - `scf.if`、`scf.for`、`scf.while`、`scope.scope` 分别由 `RecursiveIfOp`、`RecursiveForOp`、`RecursiveWhileOp`、`RecursiveScopeOp` 递归处理。
   - 对 loop init/yield、while condition、branch block argument、scope return 等建立 alias。
   - 对 HIVM destination-style 操作、call、GPU launch、load/store、select、mark 等分别更新 gen/kill 或别名信息。
   - 遇到无法识别且可能触碰 buffer 的操作时终止遍历并报告错误。

3. 别名与 buffer 信息维护
   - `UpdateBufferAlias`、`GetAliasBuffers`、`GetAliasBufferCondPairs` 维护别名集合及条件别名。
   - `UpdateOpBufferInfo`、`GenerateBufferInfo`、`GetBufferInfo` 收集 buffer 大小和 address space。
   - `ProcessMarkOp` 处理 memory unique、multibuffer、preload、tightly-coupled 等标记。

4. gen/kill 与生命周期
   - `UpdateOpGenInfo` 将首次使用的 buffer 记为 gen。
   - `OpKillHandle` 根据 MLIR liveness 和 alias 用户关系寻找可释放 buffer。
   - `AllDeadAfter`、`IsDeadAfterOp` 同时检查普通 SSA 使用、跨 region 使用和 while sibling region，避免过早 kill。
   - `GenerateBufferLife` 将线性操作上的 gen/kill 转换为时间区间。

### 2.3 `MemPlanRegBase`

负责根据分析结果执行实际地址规划。

#### 原地复用候选

`GenerateInplaceList` 遍历每个操作的 gen/kill buffer，优先尝试较大 gen buffer，要求 kill buffer 容量不小于 gen buffer，并过滤 `ignoreInplace`、`memoryUnique` 等情况。

`IsReuseHIVMOp` 的判断顺序主要是：

1. ISA 明确支持的向量 elementwise 操作直接允许复用。
2. `restrictInplaceAsISA` 开启时禁止扩展规则。
3. 额外 buffer、transpose、broadcast、元素类型/位宽、VCast rank/连续性等约束必须满足。
4. 对 VF call 还需经过 `VFInplaceReuseInfo` 和 MTE2/MTE3 reachable 检查，避免 loop 中发生 pipeline stall。

#### StorageEntry 构建与合并

- `GenerateStorageEntry`：每个 gen buffer 建立一个初始 `StorageEntry`。
- `MergeInplaceSE`：将原地复用的两个 entry 合并，合并生命周期和 buffer 列表。
- `ExpandMultiBufferStorageEntry`：将 multibuffer entry 展开成多个相关 entry。
- 局部内存通过 `MergeSameScopeSE` 按 address space 聚合。
- workspace 通过 `MergeSameWorkSpaceArgSE` 按 workspace 参数聚合。

#### 地址分配

- `PlanLocalMemAddress`
  1. 构建 DMA buffer/pipeline 信息。
  2. 合并原地复用 entry。
  3. 展开 multibuffer。
  4. 按内存空间聚合并规划。

- `PlanWorkSpaceMemAddress`
  1. 合并原地复用和 multibuffer。
  2. 按 workspace 参数合并。
  3. 通过 `PlanMemOffsetOfWholeWorkSpace` 分配 GM offset；关闭全局复用时采用顺序无复用布局。

- `PlanMemAddressOfWholeLocalBuffer`
  - 若所有 buffer 顺序排列后不超容量，直接使用 no-reuse 布局。
  - 若超容量，依次尝试无 pipeline stall 的单级规划、多级规划和失败恢复策略。
  - 规划失败时记录所需容量并输出诊断信息。

- `MultiSpecPlan`、`SpecAlloc`、`VerifyConflictStage0/1/2/3`：核心区间分配逻辑。它维护 memory outline，把 buffer 插入空闲区间，同时验证生命周期冲突、pipeline 冲突、multibuffer 关联关系；失败时由 `ApplyFailStrategy` 和 rollback 机制恢复并尝试其他策略。

### 2.4 `PlanMemoryPass`

Pass 层负责跨函数协调和 IR 修改：

- `BuildCVReuseAllowedPairs`：扫描非 host、非 VF 函数，计算 tightly-coupled CV buffer 的使用区间；只有在所有共同引用函数中区间都不重叠时，才允许跨 scope 共享地址。
- `PlanMemoryForFuncOp`：对单个函数最多尝试 20 次确定性随机顺序，重新执行 liveness 和 memory plan，以提高找到可行布局的概率。
- `UpdateId2Offsets`：从 AIV/UB 或 AIC/L1 buffer 记录 cvMixId 到 offset 的映射。
- `UpdateBuffer2OffsetsForFuncOp`：将对应 cvMixId 的地址同步到另一核心的 buffer。
- `PopulateBufferAddressToAllocOp`：局部内存通过 `walkAllocToPointerCast` 将 alloc 转成带规划地址的 pointer cast；workspace 则给 `alloc_workspace` 附加 offset。
- `fixMultibufferEnabledPointerCastOps`：将 multibuffer pointer cast 提升到合适 loop block，并合并相同 pointer cast，避免重复定义和 dominance 问题。

## 3. 端到端处理流程

### 阶段 A：Pass 初始化

`runOnOperation` 获取 Module：

1. 若允许 tightly-coupled 复用，构建 CV mix id 安全共享白名单。
2. 创建 `VFInplaceReuseAnalysis`。
3. 准备函数到 `buffer2Offsets` 的映射，以及跨 AIC/AIV 使用的 `id2Offsets`。

### 阶段 B：逐函数分析与规划

对每个非 host、非 VF 函数调用 `PlanMemoryForFuncOp`：

1. 创建 `MemLivenessAnalysisRegBase`，执行 `build`。
2. 创建 `MemPlanRegBase`，读取模块 memory spec、对齐和容量。
3. 注入 liveness 产物：线性操作、buffer 信息、生命周期、gen/kill、multibuffer、显式 inplace 对、VF 复用信息、sync 位置及 CV 白名单。
4. 调用 `memPlan.plan()`：生成 StorageEntry、合并复用、执行地址规划、生成 `buffer2Offsets`。
5. 若失败，换一个确定性 seed 重试；最后一次失败才输出错误并使 Pass 失败。
6. 规划成功后保存当前函数的 offset，并更新全局 `id2Offsets`。

### 阶段 C：第二次遍历与 IR 回写

对已经规划成功的函数：

1. 用 `id2Offsets` 修正跨核心 tightly-coupled buffer 的 offset。
2. 将 offset 写回 alloc 或 alloc_workspace。
3. 修复 multibuffer pointer cast 的位置并去重。

## 4. 关键设计点与约束

- 规划依赖静态 shape；`GetBufferInfo` 无法取得静态总大小时会直接报错。
- 生命周期不仅依赖 MLIR `Liveness`，还结合 alias 链、dominance、用户顺序和跨 region 规则，避免错误复用。
- 线性遍历和 live set 使用确定性容器；但部分候选顺序仍影响成功率，因此 Pass 使用固定次数的确定性 shuffle 重试。
- 原地复用和地址复用是两个层次：前者把多个逻辑 buffer 合并到同一个 `StorageEntry`，后者在不重叠生命周期的空闲区间中放置不同 entry。
- `memoryUnique`、条件 alias、preload、multibuffer、tightly-coupled buffer 都会限制普通复用。
- 当容量不足时，算法会在“无复用”“允许 DMA buffer 复用”“多级规划/回滚”等策略间切换，并保留失败所需容量用于报错。

## 5. 简化伪代码

```text
runOnOperation(module):
  cvAllowed = buildCVReuseAllowedPairs(module)
  vfInfo = analyzeVFInplaceReuse(module)

  for func in nonHostNonVFFunctions(module):
    repeat up to 20 times:
      live = MemLivenessAnalysis(func).build()
      plan = MemPlan(live, moduleSpecs, vfInfo, cvAllowed)
      if plan succeeds:
        save func buffer -> offsets
        update cross-core cv id -> offsets
        break
    if all attempts fail:
      signalPassFailure()

  for planned func:
    apply cross-core offsets
    write offsets to alloc / alloc_workspace
    fix multibuffer pointer casts
```

## 6. 总结

`PlanMemory.cpp` 不是简单的线性 bump allocator，而是一个基于 SSA liveness 和 alias 分析的约束内存规划器。它先把复杂控制流降维成带生命周期的 buffer 集合，再通过原地复用、生命周期不冲突复用、multibuffer 关联、pipeline 冲突检查和多级回滚，在有限的 UB/L1/L0C/workspace 空间中寻找可行地址布局，最后把地址信息重新编码到 MLIR 操作中。
