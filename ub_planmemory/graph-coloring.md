# 0917
目标：
1、去掉kPlanRetryCount = 20的重试机制
2、利用全局视野，达到相比first-fit更优的分配
3、考虑pipe conflict，而不是一味收紧placement：尽量不阻塞性能（插核内同步在planmemory之后）

方案：graph-coloring替换first-fit + 加 sync-aware pre-pass 把 pipe conflict 分类为 HARD/SOFT

  维度     │        spec_level        │              sync-aware               │
  ├──────────────┼──────────────────────────┼───────────────────────────────────────┤
  │ 决策粒度     │ per-plan（一档管全部对） │ per-pair（每对独立判定）              │
  ├──────────────┼──────────────────────────┼───────────────────────────────────────┤
  │ 决策时机     │ 分配失败时降档           │ 分配前一次性算好                      │
  ├──────────────┼──────────────────────────┼───────────────────────────────────────┤
  │ failure 行为 │ 失败 → 全局降档          │ 失败 → 直接报（pre-pass 已静态算好）  │
  ├──────────────┼──────────────────────────┼───────────────────────────────────────┤
  │ 冲突模型     │ 隐含在 ladder 里         │ 显式 ConflictKind 表                  │
  ├──────────────┼──────────────────────────┼───────────────────────────────────────┤
  │ 架构改动     │ 已有                     │ 需要新增 pre-pass + 改 conflict query 

  ┌────────┬───────────────────────────────────────┬──────┐
  │ 原档位 │          与 sync-aware 关系           │ 处理 │
  ├────────┼───────────────────────────────────────┼──────┤
  │ L3     │ sync-aware 更松（少 block SOFT）      │ 删   │
  ├────────┼───────────────────────────────────────┼──────┤
  │ L2     │ sync-aware 更松（少 block SOFT）      │ 删   │
  ├────────┼───────────────────────────────────────┼──────┤
  │ L1     │ 完全独立（multi-buffer 规则，不重叠） │ 保留 │
  ├────────┼───────────────────────────────────────┼──────┤
  │ L0     │ sync-aware 更严（多 block HARD）      │ 删   │
  └────────┴───────────────────────────────────────┴──────┘

  ▎ spec_level 是「档位 ladder」（粗粒度，全局降档）
  ▎ sync-aware 是「conflict 分类」（细粒度，per-pair 静态） 
  ▎
  ▎ sync-aware 落在 L0 和 L2 之间，不等于任何一个。
  ▎ 实现上需要新增 pre-pass + 改 conflict query，不是改 ladder 数字。
  ▎ 引入 sync-aware 后，L0/L2/L3三个档都变冗余，只剩 L1（multi-buffer）保留。

1、kPlanRetryCount = 20 -> randomSeed 不影响 lifetime，影响的是 slot 复用选择 -> first-fit/graph-color均可能会受影响 -> fa bwd不存在该场景
  链路完整：

  randomSeed
    ↓ shuffle 改变 push_back 顺序
  genKillMap[op].kill（顺序变化，set 不变）
    ↓ BuildInplaceList 内层遍历 kill 列表，break 在第一个匹配的
  inplaceList（内容可能不同）
    ↓ MergeInplaceSE 合并哪些 SE
  mergedChildren（不同）
    ↓ first-fit outline 扫描
  最终 peak（不同）

  理论链能成立的前提是：某个 kill 点有 ≥2 个候选 genBuffer 可与它形成 inplace 配对。这要求 IR 里出现类似这样的结构：

  %A = alloc A  (10 bits, lifetime [0, 5])
  %B = alloc B  (10 bits, lifetime [0, 5])
  opX reads %A, writes %C
  opX reads %B, writes %D
  // 在 opX 处 %A 和 %B 都能被复用给 %C 或 %D

  这种"对称候选"在 IR 里并不常见。

2、first-fit分配地址的时候存在多档降级处理 -> graph-color需不需要同样的SPEC_LEVEL_3/2/1/0这4档处理？-> 目前graph-color只有严格的level-3/level-0两档（插核内同步在planmemory之后，会影响性能）
    buffer1 spec_level_3
    buffer2 spec_level_3
    buffer3 spec_level_3->2->1->0


3、应该尽量不复用打满硬件空间 -> 而不是减少峰值空间占用



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


修改优先级：
 优先级 │            项目             │              收益               │          风险          │  工作量  │
  ├────────┼─────────────────────────────┼─────────────────────────────────┼────────────────────────┼──────────┤
  │ P0     │ 1.1 lifetime adj 只建一次   │ 性能常数 ~2×                    │ 0                      │ 0.5 小时 │   DEAL
  ├────────┼─────────────────────────────┼─────────────────────────────────┼────────────────────────┼──────────┤  DEAL
  │ P0     │ 1.2 DSATUR 用优先队列       │ n>50 时 ~3-5×                   │ 0                      │ 1 小时   │
  ├────────┼─────────────────────────────┼─────────────────────────────────┼────────────────────────┼──────────┤
  │ P1     │ 1.3 bitmask 槽位            │ n>64 时 ~5-10×                  │ 0（局部）              │ 1 小时   │
  ├────────┼─────────────────────────────┼─────────────────────────────────┼────────────────────────┼──────────┤
  │ P1     │ 2.1 多 attempt 重试         │ 启发式质量 ↑↑                   │ 中（破坏完全单一路径） │ 半天     │
  ├────────┼─────────────────────────────┼─────────────────────────────────┼────────────────────────┼──────────┤
  │ P2     │ 2.2 L1 跨槽复用建模         │ 密集 multi-buffer case 大幅改善 │ 中                     │ 1-2 天   │
  ├────────┼─────────────────────────────┼─────────────────────────────────┼────────────────────────┼──────────┤
  │ P2     │ 2.3 PlanMemoryStrategy 映射 │ API 完善                        │ 低                     │ 半天     │
  ├────────┼─────────────────────────────┼─────────────────────────────────┼────────────────────────┼──────────┤
  │ P3     │ 3.1 Pipe-aware LB           │ strict pass 加速                │ 低                     │ 半天     │
  ├────────┼─────────────────────────────┼─────────────────────────────────┼────────────────────────┼──────────┤
  │ P3     │ 3.2 LB/UB 紧度诊断          │ 用户诊断 +                      │ 0                      │ 半小时  

最直接、最有价值的下一步是加 Belady MIN 作为 lifetime-only 的精确解——它对当前 coloring 构成严格的下界验证（成功时 peak == LB = 最优），也能在 coloring 失败的某些 case 里提供 fallback。