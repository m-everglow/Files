# 4-buffer IR：stable失败，current成功

输入：[dsatur_stable_fail_current_success.mlir](dsatur_stable_fail_current_success.mlir)。IR开头有中文说明；仓库回归测试为 `bishengir/test/Dialect/HIVM/RegBase/plan-memory-dsatur-fragmentation.mlir`。

## 实测结果

两版使用**完全相同的IR、Ascend950PR_9579设备规格及默认Pass参数**。没有修改生产代码。

| 项目 | stable | current |
|---|---|---|
| 组件 | `/home/m00953828/mojo/npu-ir/stable/bin/bishengir-opt` | `/home/m00953828/AscendNPU-IR/build/bin/bishengir-opt` |
| 默认规划结果 | 9次attempt后失败，exit 1 | 首个policy成功，exit 0 |
| 日志 | `ub overflow, requires 2285568 bits while 2031616 bits available!` | `PlanVerifier: verified 4 StorageEntries` |
| SE处理顺序 | A → B → C → D | B → D → A → C |
| spec档位 | 无容量约束单档布局过大，之后多档回退仍失败 | 最高档spec_level_3的单档规划直接成功，无须降档 |

默认运行与debug运行分别重复3轮，共12次调用，结果全部稳定。新增lit测试通过。

## 为什么失败/成功

UB总容量 **253952 B（248 KiB）**，取一份=31744 B。下列名称就是输入IR的 `%a/%b/%c/%d`。

| buffer | 大小 | 份数 | 静态生命周期 |
|---|---:|---:|---|
| A | 63488 B | 2 | `[3,8]` |
| B | 126976 B | 4 | `[5,13]` |
| C | 63488 B | 2 | `[7,9]` |
| D | 95232 B | 3 | `[11,12]` |

A、B、C曾同时存活，合计正好8份。D生成时A、C已经结束，但B仍存活；此时只需7份。因此**存在容量内的合法布局**。

stable按类别及原顺序规划，同为scalar pipeline的A/B/C先占满UB：

```text
0 ──[A：2份]──[B：4份]──[C：2份]── 8份

D存活时：
0 ──[可复用：2份]──[B仍存活：4份]──[可复用：2份]── 8份
```

D需要连续3份，左右各2份，放不下。原有回退没有形成可行布局，9次顺序扰动也没有改变这个无循环、无多gen/kill候选的例子的输入顺序。报出的2285568 bit=285696 B是失败规划的需求估计，**不是证明该IR至少需要这么多UB的下界**。

current先安排B，后安排D，再安排A/C。最终物理地址关系如下，`/`表示不同生命周期使用同一地址，不是合并成同一个SE：

```text
0 ──[B：4份]──[A / D前2份]──[C / D尾1份]──[C剩余1份]── 8份
              4份            6份           7份            8份
```

实际地址：B=0；A=126976；D=126976；C=190464。D与A/C不同时存活，A/C虽然同时存活但地址区间相邻、不重叠。

C占用的2份中，前1份复用D的尾部，后1份使用D没有覆盖的最后一份空间；因此不是D和C必须等大才可复用。

## DSATUR为何选这个顺序

四个group在保守排序图中两两有边，每轮未选节点的saturation相同，不能区分候选。决定本例顺序的评分是：

| group | 冲突容量 B | group大小 B | 可复用group数 | liveTicks |
|---|---:|---:|---:|---:|
| B | 222208 | 126976 | 0 | 9 |
| D | 222208 | 95232 | 2 | 2 |
| A | 190464 | 63488 | 1 | 6 |
| C | 190464 | 63488 | 1 | 3 |

B/D冲突容量相同，B更大，先选B；之后D优于A/C；A/C相同评分再由liveTicks选择A。颜色仍只用于排序，不是实际地址约束。

本例无VF、alias、optional inplace、MultiBuffer，没有AIV/AIC混合模块；日志没有optional合并决策。因此不是inplace选择、移除MultiBuffer或关闭VF检查造成差异。

## 复现命令

```bash
# stable：预期退出码1，UB overflow
/home/m00953828/mojo/npu-ir/stable/bin/bishengir-opt \
  /home/m00953828/Files/ub_planmemory/beam_search/dsatur_stable_fail_current_success.mlir \
  --hacc-append-device-spec=target=Ascend950PR_9579 \
  --hivm-plan-memory-regbase --debug -o /dev/null

# current：预期退出码0，生成四个合法pointer_cast
/home/m00953828/AscendNPU-IR/build/bin/bishengir-opt \
  /home/m00953828/Files/ub_planmemory/beam_search/dsatur_stable_fail_current_success.mlir \
  --hacc-append-device-spec=target=Ascend950PR_9579 \
  --hivm-plan-memory-regbase --debug -o /dev/null
```

全部证据及复验脚本：`/home/m00953828/mojo/mojo_data/dsatur_advantage_20261015/`。

- `verify_example.py`：重复运行并断言失败诊断、attempt数、current分组顺序、无optional合并、输出地址及Verifier结果。
- `verification.json`：输入/组件SHA256、current commit、完整命令、每次退出码及对应日志。
- `stable_round*_normal/debug.log`、`current_round*_normal/debug.log`：最终例子的原始日志和配套 `.mlir`。
- `fragmentation.mlir` / `*_950.log`等是构造过程的候选和中间记录；**最终输入以Files目录链接和verification.json中的SHA256为准**。

## 证据边界

这是一个合法的**IR级合成回归用例**，只对每个大buffer的第0个元素做已初始化的标量读写，返回四次读取的和；没有运行真实NPU kernel，不代表模型性能收益。

另做正向控制：stable额外指定 `--hivm-plan-memory-regbase=plan-memory-strategy=largest-first` 也在第1次成功，日志见 `stable_largest_first.log`。因此本例证明的是**current的新排序优于stable默认分类顺序**，不证明DSATUR优于所有其他排序或在所有IR上更好。正向控制改变了参数，独立列出，不混入同参数主对比。
