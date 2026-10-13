# UB 内存规划原始实现：First-Fit / Multi-Level Ladder

> 对应 `bishengir/lib/Dialect/HIVM/Transforms/regbase/PlanMemory.cpp` 的 **graph-coloring 引入之前** 的版本（commit `bdf2e2090` 之前，共 3313 行）。
> 当前代码里这一套逻辑依然存在，作为 graph-coloring 失败后的**兜底梯子**保留。

## 0. 整体架构

```
PlanMemoryForFuncOp (顶层入口, PlanMemory.cpp:3025-3076)
└── 20 次确定性 shuffle 重试循环（kPlanRetryCount=20）
    └── MemLivenessAnalysisRegBase::build()      // 第 1 步：liveness 分析
    └── MemPlanRegBase::plan()                   // 第 2 步：分配 plan
        ├── PlanWorkSpaceMemAddress()            //   2a. GM workspace 路径
        └── PlanLocalMemAddress()                //   2b. LOCAL_MEM 路径（本文件主线）
            └── PlanMemAddressOfWholeLocalBuffer()  // 策略梯子入口
                └── [每个 memScope: UB / L1 / L0C]
                    ① bufferScope2RequiredSize ≤ maxBits → PlanBuffersWithoutReuse
                    ② mergedChildren 空 → PLAN_FAILED
                    ③ PlanMemAddressForSingleLevel(maxLevel)         // no-stall 一次性
                    ④ MultiSpecPlan 多档降级 + ApplyFailStrategy 兜底
```

---

## 1. 顶层：20 次确定性重试循环

**位置**：`PlanMemory.cpp:3025-3076` `PlanMemoryPass::PlanMemoryForFuncOp`

```cpp
constexpr int kPlanRetryCount = 20;
for (int attempt = 0; attempt < kPlanRetryCount; ++attempt) {
  MemLivenessAnalysisRegBase memLiveness(
      funcOp, ..., /*randomSeed=*/attempt);  // ← 不同 seed → 不同 lifetime 顺序
  memLiveness.build();

  MemPlanRegBase memPlan(...);
  memPlan.SetBuffer2Life(memLiveness.buffer2Life);  // ← seed 影响 buffer2Life
  ...
  if (succeeded(memPlan.plan(/*emitErrors=*/isLastAttempt))) {
    return make_optional(memPlan.GetBuffer2Offsets());
  }
}
```

**关键事实**：

| 项 | 值 |
|---|---|
| 重试次数 | `20`（hardcoded） |
| 重试驱动 | `randomSeed` 传入 `MemLivenessAnalysisRegBase` |
| 失败后果 | 仅最后一次（`isLastAttempt=true`）打 error，其余沉默 |
| 注释自承 | `// TODO: Remove the retry loop once the plan-memory algorithm is improved` |

**算法承认**：自己也知道是「换种子碰运气」。source code 注释原话：
> "The current plan-memory algorithm is sensitive to the order in which some candidate buffers are considered."

---

## 2. 第二层：MemPlanRegBase::plan()

**位置**：`PlanMemory.cpp:1442`

```cpp
LogicalResult MemPlanRegBase::plan(bool emitErrors) {
  // 1. GenerateStorageEntry — 把 buffer 聚合到 StorageEntry
  GenerateStorageEntry();
  // 2. MergeInplaceSE — inplace 复用合并
  MergeInplaceSE();
  // 3. ExpandMultiBufferStorageEntry — multi_buffer=2/3 兄弟展开成独立 entry
  ExpandMultiBufferStorageEntry();
  // 4. MergeSameScopeSE — 同 scope 的 entry 合并到一个 mergedChildren 列表
  MergeSameScopeSE();
  // 5. Workspace 路径
  if (failed(PlanWorkSpaceMemAddress())) return failure();
  // 6. LOCAL 路径（本文件主线）
  return PlanLocalMemAddress();
}
```

**6 个阶段，全部必跑，前序结果做后序输入**。`mergedChildren` 列表就是规划算法看到的「buffer 数组」。

---

## 3. 第三层：PlanLocalMemAddress()

**位置**：`PlanMemory.cpp:1589`

```cpp
PlanStatus MemPlanRegBase::PlanLocalMemAddress() {
  return PlanMemAddressOfWholeLocalBuffer();
}
```

极薄一层，直接转发。

---

## 4. 第四层（核心）：PlanMemAddressOfWholeLocalBuffer()

**位置**：`PlanMemory.cpp:1775-1869`（pre-coloring 版本）/ `PlanMemory.cpp:2061-`（当前版本，含 coloring）

### 4.1 策略梯子

```cpp
for (auto [memScope, rootStorageEntry] : memscope2rootStorageEntry) {
  size_t align = ..., maxBits = ...;
  auto iter = bufferScope2RequiredSize.find(memScope);

  // ① 总大小 ≤ budget → 无复用直接铺开
  if (iter->second <= maxBits) {
    PlanBuffersWithoutReuse(rootStorageEntry, align);
    continue;
  }

  // ② mergedChildren 空 → 直接 PLAN_FAILED
  if (rootStorageEntry->mergedChildren.empty()) return PLAN_FAILED;

  // ★ ③ GetReorderRootStorageEntry 重排（UB only）
  rootStorageEntry = GetReorderRootStorageEntry(rootStorageEntry);

  // ④ 单级 no-stall（PlanMemAddressForSingleLevel(SPEC_LEVEL_3)）
  auto maxAllocBits = PlanMemAddressForSingleLevel(rootStorageEntry, /*specLevel=*/SPEC_LEVEL_3);
  if (maxAllocBits <= maxBits) continue;
  // 失败 → 进入多档梯子
  memscope2allocatedEntry.erase(memScope);

  // ⑤ MultiSpecPlan 循环 + ApplyFailStrategy 兜底
  outline.push_back(MemoryBound(0, maxBits, nullptr));
  while (si.childIdx < childrenNum) {
    curEntry = rootStorageEntry->mergedChildren[si.childIdx];
    curEntry->alignedConstBits = AlignUp(curEntry->bufInfo->constBits, align);
    LogicalResult r = MultiSpecPlan(si, outline, history, curEntry);
    if (failed(r)) {
      auto as = ApplyFailStrategy(statusWrapper, maxBits);
      if (as == RESTART_NEW_PLAN) { si = SpecInfo(); curEntry = root; continue; }
      if (as == PLAN_FAILED) return PLAN_FAILED;
    }
    if (si.childIdx >= childrenNum) break;
    curEntry = root->mergedChildren[si.childIdx];
  }
}
```

### 4.2 流程图

```
                ┌──────────────────────────┐
                │  每个 memScope（UB/L1/L0C）│
                └────────────┬─────────────┘
                             ▼
                bufferScope2RequiredSize ≤ maxBits?
                ┌────────────┴────────────┐
                ▼ YES                     ▼ NO
        PlanBuffersWithoutReuse         mergedChildren 空?
        (no reuse, offset=0)            ┌────┴────┐
                │                       ▼ YES    ▼ NO
                ▼                  PLAN_FAILED   │
                │                                ▼
                │              GetReorderRootStorageEntry  ← 重排：memUnique / DMA / scalar
                │                                │
                │                                ▼
                │              PlanMemAddressForSingleLevel(SPEC_LEVEL_3)
                │              ← 单级 no-stall，所有 buffer 都按 SPEC_LEVEL_3 处理
                │                                │
                │                       peak ≤ maxBits?
                │                ┌────────┴────────┐
                │                ▼ YES             ▼ NO
                │            continue           outline = [MemoryBound(0, maxBits)]
                │                                  │
                │                                  ▼
                │              ┌────────────────────────────┐
                │              │   while childIdx < N:      │ ← 主循环
                │              │     MultiSpecPlan(si,...)  │
                │              └─────────────┬──────────────┘
                │                            ▼
                │                  success?
                │                ┌─────┴─────┐
                │                ▼ YES       ▼ NO
                │            childIdx++    ApplyFailStrategy
                │            continue           │
                │                               ▼
                │                   ┌──────┬────┴────┬──────┐
                │                   ▼      ▼         ▼      │
                │              specLevel > 0?                 │
                │              ┌──┴──┐                        │
                │              ▼ YES ▼ NO                     │
                │       specLevel--  splitOutline?            │
                │       CONTINUE  ┌──┴──┐                    │
                │                  ▼ YES ▼ NO                │
                │           splitOutline=true │                │
                │           RESTART_NEW_PLAN  │                │
                │           (回到循环头)       PLAN_FAILED    │
                └─────────────────────────────────────────────┘
```

---

## 5. GetReorderRootStorageEntry — UB 专用重排

**位置**：`PlanMemory.cpp:1910-1986`

**目的**：把 entry 按以下顺序重排，让 first-fit 优先处理「最难放」的：
```
memUnique → touchDMA → other → touchPipeScalar
```
每个分组内可选 `LARGEST_FIRST` 策略按 size 降序。

**副作用**：会 `mergedChildren.clear()` 后重新填入，所以**只能在 first-fit ladder 使用一次**，不可被 coloring 复用。

**注释原话**：
> "reorder storage entrys: mem unique buffers + dma touched buffers + other buffers + scalar touched buffers"

---

## 6. SPEC_LEVEL 含义

| LEVEL | 含义 | 实现位置 |
|---|---|---|
| **SPEC_LEVEL_0** = 0 | 仅 lifetime 不重叠即可复用 | `VerifyConflictStage0` |
| **SPEC_LEVEL_1** = 1 | lifetime 不重叠 + 多 buffer 兄弟可共享同 slot | `VerifyConflictStage1` + `PlanRelationOtherBufferEntryAddress` |
| **SPEC_LEVEL_2** = 2 | + 同 loop 内不与 DMA 冲突 | `VerifyConflictStage2` |
| **SPEC_LEVEL_3** = 3 | + 任一 DMA pipe 冲突不复用 | `VerifyConflictStage3` |

**数字越大 = 约束越严 = peak 越大**。

---

## 7. PlanMemAddressForSingleLevel()

**位置**：`PlanMemory.cpp:1733-1772`

```cpp
uint64_t PlanMemAddressForSingleLevel(StorageEntry *root, int specLevel) {
  // 1. 重排
  root = GetReorderRootStorageEntry(root);
  // 2. 初始 outline = 全区间 [0, UINT64_MAX)
  MemBoundList outline = {MemoryBound(0, UINT64_MAX, nullptr)};
  // 3. 顺序对每个 child 调 MultiSpecPlan（specLevel = maxLevel = minLevel = L3）
  for (StorageEntry *e : children) {
    MultiSpecPlan(si={.specLevel=L3, .maxLevel=L3, .minLevel=L3}, outline, his, e);
  }
  // 4. 算 maxAllocBits = max(child.bitsOffset + child.alignedConstBits)
  return maxAllocBits;
}
```

**单级专用**：传 `SPEC_LEVEL_3` 时所有 entry 都按最严约束，能装下就装下，不能就报错（不降级）。

---

## 8. MultiSpecPlan — 多档降级

**位置**：`PlanMemory.cpp:2030-2060`（pre-coloring 版本）

```cpp
LogicalResult MultiSpecPlan(SpecInfo &si, ..., StorageEntry *entry) {
  for (int level = si.specLevel; level >= si.minLevel; level--) {
    auto r = SpecAlloc(outline, history, entry, si, /*localLevel=*/level);
    if (succeeded(r)) {
      si.childIdx++;
      if (si.childIdx == si.specStartIdx) si.specLevel = si.maxLevel;
      return success();
    }
  }
  return failure();  // → ApplyFailStrategy
}
```

**关键事实**（行内注释）：
> "stop here; lower levels NOT tried for this entry"

**对当前 entry 而言**：从最高 specLevel 开始向下尝试，**找到第一个能放下的 level 就 break**——**不再试更低的 level**。

**对梯子整体**：当 ApplyFailStrategy 把 specLevel-- 后，**当前 entry 重新尝试**（不重头跑）。

---

## 9. SpecAlloc — First-Fit 扫描核心

**位置**：`PlanMemory.cpp:2080-2143`

```cpp
LogicalResult SpecAlloc(outline, his, e, si, localLevel) {
  // 已 plan 过 → 直接返回 success
  if (his contains e) return success();

  // size=0 → offset=0
  if (e->alignedConstBits == 0) { e->bitsOffset = 0; return success(); }

  // ★★★ First-Fit：顺序扫 outline 找第一个能装下的区间 ★★★
  for (auto start = outline.begin(); start != outline.end(); ++start) {
    uint64_t size = 0, allocOff = (*start)->offset;
    for (auto end = start; end != outline.end(); ++end) {
      size += (*end)->extent;

      // 与上次回滚结果相同 → 跳过
      if (IsSamePlanAsLastRollBack(allocOff, e->childIdx, si) ||
          VerifyConflictStage0(e, *end)) {                  // ← L0 判定
        start = end; break;
      }
      if (size < e->alignedConstBits) continue;             // ← 当前洞还装不下

      // SPEC_LEVEL_1 → 还要为 otherbuffer 找 offset
      if (localLevel == L1 &&
          VerifyConflictStage1(outline, his, e, ..., otherBufferOffsets)) break;

      // L2/L3 → pipe 冲突判定
      if (VerifyConflictStage2(his, e, localLevel, start, outline)) break;
      if (VerifyConflictStage3(his, e, localLevel, start, outline)) break;

      e->bitsOffset = allocOff;
      UpdateOutline(outline, his, e, ..., localLevel);       // ← 切洞

      if (localLevel == L1) PlanRelationOtherBufferEntryAddress(...);
      RecordAllocatedEntry(e);
      return success();
    }
  }
  return failure();
}
```

**First-Fit 本质**：

| 步骤 | 行为 |
|---|---|
| 1 | 从 `outline.begin()` 起遍历所有「洞」 |
| 2 | 对每个起始 `start`，累积 `size` 直到 ≥ `e->alignedConstBits` |
| 3 | 第一次满足大小时，做冲突判定（Stage 0/1/2/3） |
| 4 | **任一冲突** → `break`，从下一个 `start` 开始 |
| 5 | **无冲突** → 放进去，`UpdateOutline` 切洞 |

**致命弱点**：只看「当前位置能不能放」，**不知道后面还有谁要来**——放置顺序敏感。

---

## 10. UpdateOutline — 切洞

**位置**：`PlanMemory.cpp:2458-2512`（pre-coloring 版本）

```cpp
void UpdateOutline(outline, his, e, OutlineSectionInfo{start, end, size}, level) {
  // outline: |--head--|--split e--|--tail--|
  uint64_t res = size - e->alignedConstBits;

  // 1. 计算 e 占用的 split 区间（splitOutline 模式下分段）
  if (splitOutline) AddMemBoundInSectionalWay(e, start, end, splitBound);
  else              整个 e 作一个 bound;

  // 2. 切出尾部剩余空间（res > 0）
  if (res > 0) outline.insert(end, tailBound);

  // 3. 把 split 区间塞入 outline
  for (auto &b : splitBound) outline.insert(end, b);

  // 4. 记录到 history
  his.emplace_back(PlanRecord{level, e->childIdx, ...});
  e->appliedSpecLevel = level;
}
```

---

## 11. splitOutline 与 AddMemBoundInSectionalWay

**位置**：`PlanMemory.cpp:2514-2548`

`splitOutline = false`（默认）：e 整个作一个 bound，lifetime 是合并后的整体。
`splitOutline = true`（失败后启用）：把 e 按 outline 边界**切成多片**，每片 lifetime = e ∩ 该 outline 段的交集。

**作用**：当 lifetime 错位的 buffer 没法整体 reuse 时，允许「把 e 拆成两半，前半复用 outline[i]，后半复用 outline[j]」。

**示例**：

```
outline:  |--free[3-7]--|--used[1-9]--|--free[4-10]--|
e:                allocTime=2, freeTime=8, size=4KB

splitOutline=false: 把 2-8 整个当作 bound，前后 free 区间不能复用
splitOutline=true:  切成 [2-7]∪[7-8] 两片，分别落到 free[3-7] 后半段和 used[1-9] 的剩余空间
```

---

## 12. ApplyFailStrategy — 失败恢复梯子

**位置**：`PlanMemory.cpp:2677-2692`（pre-coloring 版本）

`MultiSpecPlan` 对当前 child 在 `[specLevel, minLevel]` 区间里所有档都试过都失败时调用，分三层决策：

```cpp
PlanStatus ApplyFailStrategy(StatusWrapper &sw, size_t maxBits) {
  // ① 无论后面走哪条路，先回滚
  RollBackForAllocFail(sw, maxBits);    // ← 把 history 中最近几条 entry 撤销
                                        //    (同步移除对应的 outline bound)

  // ③ specLevel > 0 → 降一档，重试当前 child（不前进）
  if (sw.si->specLevel > SPEC_LEVEL_0 && sw.si->childIdx >= 0) {
    sw.si->specLevel--;
    return PlanStatus::CONTINUE_PLAN;   // ← childIdx 不动，下轮循环 MultiSpecPlan 重跑
  }

  // ④ specLevel 已 = 0，splitOutline 还关着 → 启用并整体重启
  if (!splitOutline) {
    splitOutline = true;                // ← 唯一开关
    return PlanStatus::RESTART_NEW_PLAN; // ← 调用方会：si = SpecInfo(), curEntry = root
  }

  // ⑤ 都试过了 → 失败
  return PlanStatus::PLAN_FAILED;
}
```

调用方（`PlanMemAddressOfWholeLocalBuffer:1837-1852`）按返回值分三种处理：

```cpp
LogicalResult r = MultiSpecPlan(si, outline, history, curEntry);
if (failed(r)) {
  PlanStatus as = ApplyFailStrategy(statusWrapper, maxBits);

  if (as == RESTART_NEW_PLAN) {
    si = SpecInfo();               // specLevel ← SPEC_LEVEL_3, childIdx ← 0
    curEntry = rootStorageEntry;
    continue;                       // 回到 while 循环头，从 root 开始再走
  }
  if (as == PLAN_FAILED) {
    return PlanStatus::PLAN_FAILED;
  }
  // CONTINUE_PLAN：什么都不做，下一轮 while 循环
  //   curEntry 会被循环顶重新赋值为 rootStorageEntry->mergedChildren[si.childIdx]
  //   由于 childIdx 未动，所以仍是同一个 child
  //   但此时 specLevel 已降，outline 也已回滚腾出更多「洞」
  //   MultiSpecPlan 再跑时起点就是新档位
}
```

### 12.1 为什么 CONTINUE_PLAN 还能成功？

直觉上 MultiSpecPlan 已经把 `[specLevel..minLevel]` 全跑过一遍失败了，再降一档怎么可能成？

**关键在 RollBackForAllocFail**：

- 它撤销的是**前几个成功 plan 过的 child**（不只当前 child 自身——当前 child 失败，根本不在 history 里）
- 撤销动作同时把它们对应的 outline bound 也移走 → outline 多出洞
- 之后 MultiSpecPlan 重跑当前 child 时，找洞的视野变了

所以 CONTINUE_PLAN = 「**降一档 + 退几步**」。每次失败都多退几步，腾出更多空间，给更宽松的档位机会。

### 12.2 完整退化链

```
                        [MultiSpecPlan 对 child_i 试 L3..L0]
                                          │
                                          ▼
                                    全失败？
                                          │
                          ┌───────────────┼───────────────────────────┐
                          ▼ YES                                  ▼ NO (某个档成功)
                ApplyFailStrategy                              childIdx++
                  │                                                │
   ┌──────────────┼──────────────────────┐                        ▼
   │              │                      │                  下一个 child
   ▼ ①            ▼ ②                    ▼ ③

 RollBackForAllocFail  ←────────────────────────  每次都先做这一件事
 (回滚 history & outline 中最近几条)

 分支:
   A. specLevel > 0  ──→ CONTINUE_PLAN
        • specLevel--
        • childIdx 不动
        • 下轮循环重跑同一 child
        • 起点 = 降一档（如 L3→L2）
        • outline 比上次大（更多老 entry 被撤了）

   B. specLevel == 0 + splitOutline=false
        ──→ RESTART_NEW_PLAN
        • si = SpecInfo() → specLevel ← SPEC_LEVEL_3, childIdx ← 0
        • curEntry = root
        • outline 由 RollBack 清空回初始 [0, maxBits)
        • 完整重跑 L3→L2→L1→L0
        • 唯一区别：splitOutline = true（UpdateOutline 会切多段）

   C. specLevel == 0 + splitOutline=true
        ──→ PLAN_FAILED
        • 当前 memScope 标记失败
        • 整个 PlanLocalMemAddress 返回失败
        • 上层 `PlanMemoryForFuncOp` 决定是否要第 (attempt+1) 次 retry
```

### 12.3 状态变化表

| 触发条件 | `si.specLevel` | `si.childIdx` | `curEntry` | `splitOutline` | `outline` | `history` |
|---|---|---|---|---|---|---|
| 初始 | `SPEC_LEVEL_3` (=3) | -1 (root) | `rootStorageEntry` | `false` | `[0, maxBits)` | 空 |
| child_i 在 L3 失败 | 3 | i | `children[i]` | false | (无变化) | (无变化) |
| → CONTINUE_PLAN | **2** | **i** | `children[i]` | false | **回滚+腾洞** | **回滚** |
| child_i 在 L2..L0 全失败 | 0 | i | `children[i]` | false | (无变化) | (无变化) |
| → RESTART_NEW_PLAN | **3** | **-1 (root)** | `rootStorageEntry` | **true** | **[0, maxBits)** | **空** |
| 第二次 child_i 在 L3..L0 全失败 | 0 | i | `children[i]` | true | (无变化) | (无变化) |
| → PLAN_FAILED | — | — | — | — | — | — |

### 12.4 时序图

```
time ─────────────────────────────────────────────────────────►

[首次跑]
  child 0 ─► MultiSpecPlan(L3..L0) ─► ok → childIdx++
  child 1 ─► MultiSpecPlan(L3..L0) ─► ok → childIdx++
  child 2 ─► MultiSpecPlan(L3..L0) ─► fail
              ApplyFailStrategy ─► CONTINUE_PLAN(specLevel=2)
              child 2 重跑 ─► fail (L2 fail)
              ApplyFailStrategy ─► CONTINUE_PLAN(specLevel=1)
              child 2 重跑 ─► fail (L1 fail)
              ApplyFailStrategy ─► CONTINUE_PLAN(specLevel=0)
              child 2 重跑 ─► fail (L0 fail)
              ApplyFailStrategy ─► RESTART_NEW_PLAN
                                  si = SpecInfo()
                                  splitOutline = true
                                  outline 清空回 [0, maxBits)
                                  history 清空

[二次跑：splitOutline=true]
  child 0 ─► MultiSpecPlan(L3..L0) ─► fail (切多段后仍装不下)
              ApplyFailStrategy ─► ... → PLAN_FAILED
              → 当前 memScope 失败
              → 上层 PlanMemoryForFuncOp 准备第 (attempt+1) 次重试
```

### 12.5 注释原话

`PlanMemory.cpp:3035-3036`（PlanMemoryForFuncOp 里的 TODO）：
> "TODO: Remove the retry loop once the plan-memory algorithm is improved to produce a stable valid plan in a single attempt."

——这段 ApplyFailStrategy 的「降档 + 整体重启」机制正是 source code 自承「需要被更好算法替换」的部分。

---

## 13. 整体算法性质总结

| 性质 | 体现 |
|---|---|
| **确定性** | ❌ 受 randomSeed shuffle 影响（20 次每次不同） |
| **顺序敏感** | ❌ First-Fit 按 mergedChildren 顺序逐个放；GetReorderRootStorageEntry 是手工补丁 |
| **重试换运气** | ❌ kPlanRetryCount=20，注释自承 |
| **失败模式** | ✓ 分层退化：specLevel + splitOutline + 回滚 |
| **时间复杂度** | 20 × O(n²) worst case（rebuild 重扎）|
| **debug 完整性** | ✓ 每个 entry 的 placement 都有 `ReportCurEntryDebugInfo` |

**这就是 graph-coloring 要替换的「原罪」清单**：确定性、顺序敏感性、20 次重试。三条同时满足是 coloring 引入的 motivation。