# Triton 实测：stable 分配失败，current 成功

2026-10-19，设备 `Ascend950PR_9579`。这是一个完整的 Triton kernel：将四段输入原样写回输出，每个元素都参与真实的设备读写。

固定同一个 kernel、输入、grid 和编译配置，stable 报：

```text
ub overflow, requires 2097152 bits while 2031616 bits available!
```

即旧布局需求估计为 **256 KiB**，超过设备的 **248 KiB UB**。current 编译成功，实际布局占 **192 KiB**，并通过设备结果校验。

## 用例与配置

源文件：[triton_dsatur_fragmentation.py](triton_dsatur_fragmentation.py)。验证脚本：[verify_triton_dsatur.py](verify_triton_dsatur.py)。

四段都是 float32：

| buffer | 元素数 | 大小 | 在最终 PlanMemory 输入中的名字 | 生命周期 |
|---|---:|---:|---|---|
| A | 16384 | 64 KiB | `%alloc` | `[7,18]` |
| B | 16384 | 64 KiB | `%alloc_1` | `[11,29]` |
| C | 16384 | 64 KiB | `%alloc_3` | `[15,20]` |
| D | 32768 | 128 KiB | `%alloc_7` | `[24,27]` |

执行顺序为：读 A → 读 B → 读 C → 写 A/C → 读 D → 写 D/B。

`volatile=True` 的 load 和 `tl.debug_barrier()` 保留这个合成用例的访问顺序；前端因此自动关闭 AutoBlockify。两版都固定 `grid=(1,)`、`num_warps=4`、`num_stages=1`、`multibuffer=False`、`enable_auto_bind_sub_block=False`，不使用 autotune。

A/B/C 同时存活时需要 192 KiB；D 与 B 同时存活时也需要 192 KiB。**容量本身足够，难点是连续空间布局。**

## 为什么旧顺序失败

stable 默认顺序是 `A → B → C → D`，前三段先排成：

```text
地址 KiB：0        64       128      192      248
          [ A 64 ][ B 64 ][ C 64 ][ 空闲56 ]
```

等到 D 生成时，A/C 已经用完，但 B 仍然存活：

```text
          [ 空64 ][ B 64 ][   连续空闲120   ]
```

D 要求连续 128 KiB，左右分别只有 64 KiB 和 120 KiB，无法放入。stable 的 9 次 PlanMemory attempt 均失败；最低复用档位及回退也没有得到可行布局。

报错中的 256 KiB 是失败规划给出的需求估计，不是这个 kernel 的理论内存下界。

## 新顺序如何解决

current 的 DSATUR 顺序是 `D → B → A → C`，实测地址如下：

| buffer | 地址偏移 | 大小 |
|---|---:|---:|
| D | 0 KiB | 128 KiB |
| B | 128 KiB | 64 KiB |
| A | 0 KiB | 64 KiB |
| C | 64 KiB | 64 KiB |

```text
A/B/C 存活： [ A 64 ][ C 64 ][ B 64 ][ 空闲56 ]
D/B   存活： [     D 128    ][ B 64 ][ 空闲56 ]
```

A/C 与 D 错时复用同一段连续空间，总地址上界为 192 KiB。current 仍然需要降到允许 DMA buffer 复用的档位；本例的优势是找到合法布局，不是消除了 DMA 复用。

四个 group 在保守排序图中两两相连，因此每轮未选 group 的 saturation 相同。它们的冲突容量也都是 192 KiB，后续评分决定顺序：

| group | 大小 | 可复用 group 数 | liveTicks |
|---|---:|---:|---:|
| D | 128 KiB | 2 | 4 |
| B | 64 KiB | 0 | 19 |
| A | 64 KiB | 1 | 12 |
| C | 64 KiB | 1 | 6 |

D 最大，先选；剩余三者中 B 的可复用候选最少，优先安排；A/C 同分，再由生命周期长度选 A。

注意：现有日志的 `groupBytes`、`weightedConflictBytes` 是遗留字段名，实际数值单位为 bit。本文已统一换算为 KiB。

## 验证与证据

完整记录见 [verification.json](evidence/verification.json)。原始远端证据目录：

```text
/home/m00953828/mojo/mojo_data/triton_fragmentation_20261019/verification/
```

验证脚本检查：

- 两版各用独立缓存进行 3 轮完整 Triton 编译；stable 每轮均为 UB overflow，current 每轮均成功。
- current 每轮运行 8 组输入：递增值与不同随机数据。每组 81920 个 float32，输出先填 NaN，再与 CPU 输入逐元素零误差校验，共 24 组。
- 6 次 Triton 前端输出的 SHA256 完全相同；两版完整流水线产生的最终 PlanMemory 输入逐字节相同。
- 对同一份提取的 [PlanMemory 输入](evidence/input_plan_memory.mlir) 再各运行 3 轮：stable 均失败，current 均成功，且地址符合上表，Verifier 验证 4 个 StorageEntry。
- 两版同时关闭 optional tightly-coupled buffer reuse，仍然保持相同差异；该用例没有 VF、optional inplace pair 或 MultiBuffer。
- stable 改用 `largest-first` 后也能成功，作为正向控制单独保存，不混入同参数主对比。因此这里证明的是新排序优于 stable 默认顺序，不是优于所有其他排序。

current 使用原构建产物的副本，commit 为 `ba215b7681c9d9033ea1928354386341e94d89fb`。实验没有修改编译器生产代码。两套工具链使用同一份配套 bitcode；复制 current 到独立工具目录并连接公共 lib，解决了原 build/bin 找不到 `../lib/meta_op*.bc` 的环境问题。具体二进制及 bitcode 的 SHA256 都保存在记录中。

## 复现

在 `950-ide` 中执行。切换版本时只替换 PATH，保持其余参数相同：

```bash
source /data/shared/cann/9.2.0.weekly.20260902/cann-9.2.0/set_env.sh
export ASCEND_RT_VISIBLE_DEVICES=6

# current；stable 改为 /home/m00953828/mojo/npu-ir/stable/bin
export PATH=/home/m00953828/mojo/mojo_data/triton_fragmentation_20261019/toolchains/current/bin:$PATH
export TRITON_ALWAYS_COMPILE=1
export TRITON_CACHE_DIR=/tmp/triton_dsatur_current_cache

python /home/m00953828/Files/ub_planmemory/beam_search/stable_fail/triton_dsatur_fragmentation.py \
  --output /tmp/triton_dsatur_current_result
```

批量复验可运行同目录的 `verify_triton_dsatur.py --output <新的证据目录>`。它会记录全部命令、退出码、组件 SHA256 和对照结果。

这个例子证明新排序可以解决 stable 默认排序遇到的一种 UB 碎片化问题。它是有意构造的差异回归用例，不代表真实模型加速，也不证明 DSATUR 优于所有排序。
