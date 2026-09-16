# graph-coloring的优势
 1. 确定性：一次 attempt vs 20 次 seed retry

 2. 全局优化：DSATUR + best-fit slot vs greedy outline

  First-fit（SpecAlloc/MultiSpecPlan） 的逻辑是逐个 entry 顺序放（regbase/PlanMemory.cpp:2281）：
  - 对每个 entry 尝试从 specLevel=3 降到 minLevel=0
  - 一旦某 level 成功就 break（line 2294 注释: "stop here; lower levels NOT tried for this entry"）
  - 用 MemBoundList 的 outline 找第一个能装下的洞
  
  Graph-coloring（DSATUR） 的逻辑是全局图视角（regbase/PlanMemory.cpp:1776-2025）：
  - 先建 conflict graph：edge = lifetime 重叠 + DMA pipe 冲突
  - 按 DSATUR 优先级选下一个 node：max saturation → max weight → max degree
  - 选 slot 时用 best-fit：在所有可行 slot 里选 peak 增量最小 的（line 1930-1942）

  差别用一句话说：first-fit 是"先来先占"，graph-coloring 是"全局最优化"。

3. 能装而 first-fit 装不下的 case
bishengir/test/Dialect/HIVM/RegBase/plan-memory-coloring-succeeds-firstfit-fails.mlir

4. 更快、更准的诊断

  ┌──────────────────────────────────────────┬────────────────────────────────────────┬──────────────────────────────────────────────┐
  │                 诊断信息                 │             graph-coloring             │                  first-fit                   │
  ├──────────────────────────────────────────┼────────────────────────────────────────┼──────────────────────────────────────────────┤
  │ 是否装得下的"下界"                       │ [Coloring] lower bound = X bits 立即出 │ 不知道，只能跑 20 次重试 + multi-level retry │
  ├──────────────────────────────────────────┼────────────────────────────────────────┼──────────────────────────────────────────────┤
  │ strict (no-stall) 能装下的"实际峰"       │ [Coloring] strict=1 peak = X bits      │ N/A                                          │
  ├──────────────────────────────────────────┼────────────────────────────────────────┼──────────────────────────────────────────────┤
  │ relaxed (lifetime-only) 能装下的"实际峰" │ [Coloring] strict=0 peak = X bits      │ N/A                                          │
  ├──────────────────────────────────────────┼────────────────────────────────────────┼──────────────────────────────────────────────┤
  │ 是否成功 + 用了几个 slot                 │ [Coloring] success: ..., slots = N     │ N/A（要等 ApplyFailStrategy 跑完）           │
  ├──────────────────────────────────────────┼────────────────────────────────────────┼──────────────────────────────────────────────┤
  │ 物理不可行 vs 难装但能装                 │ 区分得很清楚                           │ 跑满 20 次都失败后只告诉你"overflow"         │
  └──────────────────────────────────────────┴────────────────────────────────────────┴──────────────────────────────────────────────┘

  在 _attn_bwd_mix_aiv 上 graph-coloring 一句话就说清楚了"物理下界 2234368 > budget 2031616，无解"；first-fit 必须跑 20 次 seed shuffle + multi-level retry 才得到同一个结论。这就是源码注释里"Remove the
  retry loop"的意思。

5. 更规整的 layout 减少 pipe stall


没有任何一个 pattern 让 coloring 成功而 first-fit 失败。

  为什么会这样（算法层面解释）

  PlanMemory.cpp 中 first-fit 的 capability：

  kPlanRetryCount = 20 // 重做 lifetime 分析20 次，每次用不同 seed
  SPEC_LEVEL_3 → 2 → 1 → 0    // 4 档降级：DMA pipe conflict → 同 loop conflict → multi-buffer reuse → lifetime-only
  ApplyFailStrategy // SPEC_LEVEL_0 失败后启用 splitOutline
  splitOutline = true         // 把 buffer 拆到多个 outline gap 的 sectional split
  RollBackForAllocFail        // 历史回滚
  
  Color path 的 capability高度对等：
  PlanMemAddressByColoring    // DSATUR + best-fit slot
    ├── strict mode (含 DMA pipe conflict) ↔ SPEC_LEVEL_3
    └── relaxed mode (lifetime-only)          ↔ SPEC_LEVEL_0
  
  两者都在 相同的 lifetime 约束 下寻找可行 placement。区别只是 placement优化（DSATUR+best-fit vs 贪心 outline 扫描），但可行域完全相同。
  
  用户的目标在当前算法下不可能实现
  
  我已经穷尽了实证搜索空间，并对照了 Explore agent 的算法分析：

  ▎ 构造 first-fit 真正失败、graph-coloring 成功的 UT 在当前算法下不可能。
  ▎
  ▎ 这不是"没找到合适的 pattern"，而是算法能力上不可能——只要 lifetime 约束可行，first-fit 的 20 retries + 4-level ladder + splitOutline 一定能搜到。