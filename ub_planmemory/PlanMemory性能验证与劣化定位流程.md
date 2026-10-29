# PlanMemory 性能验证与劣化定位流程

本文统一保存环境、构建入口、功能/性能验证及 IR 定位步骤。已合并 WSL `/home/VSCode/NPUIR-verify.sh` 的操作信息（2026-10-15）；原文件不删除，后续以本文维护的流程为准。

## 物理卡独占时段（2026-10-29更新）

按北京时间（Asia/Shanghai）执行：09:00–22:00，物理卡6被独占；22:00–次日09:00，物理卡4、5、6、7被独占。后续实验避开对应独占卡。物理卡4、5、7在09:00–22:00空闲且健康时可以使用；物理卡1仍按此前约定排除。每批开始前核对物理编号映射、健康和占用，跨22:00的任务需在边界前停止对4/5/7的新调度。换卡应重做stable/current配对，不能跨卡拼接结果。

## 结论表达规则（2026-10-29新增）

**先直接说有没有问题，再用一句话说明依据。口吻简洁明了，不让用户从一大段实验描述里猜结论。**

- 明确说清：**autotune选型是否变化、PlanMemory输入是否变化、PlanMemory输出是否变化、最终二进制是否变化**。未核对的写“未核对”，不能猜测。
- 本次仅修改PlanMemory相关代码时，若相关kernel的PlanMemory输入输出及最终二进制均一致，直接写：**“无劣化：PlanMemory输入输出一致，最终二进制一致。”** 不要仍以“劣化（+X%）；上下文影响”等措辞作为最终结论。
- 若只有前序kernel发生变化，直接指出“目标kernel没变，前序哪个kernel变了”，不要混在一起描述。是否影响目标性能，以消融结果为准。
- autotune变化就直接写选型变化及端到端性能结果；PlanMemory输出变化就直接写改变了什么及复测结果。不要用“运行上下文”“未确认稳定回归”等抽象措辞代替这些事实。
- 最终结论确定后，**立即更新汇总表最后一列**；历史均值、变化比例和初测结论保留，但不能让旧的“劣化”标签继续充当最终结论。
- 频率、缓存、MTE2周期、消融过程等放在定位记录中。对用户的回复和汇总表只保留结论及必要依据，需要展开时再解释。

## 快速使用与交接入口

按需要执行，不必每次重跑全流程：

- **新版本验收**：确认基线与组件 → 单例检查链路 → 全量功能 → 单例检查性能CSV → 批量性能。
- **单条性能异常**：复测 → 对齐autotune → 固定同一bcmlir → 比较PlanMemory → 比较GraphSyncSolver；没有证据前不修改分配算法。
- **编译速度变化**：先确定要测 Triton 编译、`bishengir-compile`，还是单个 PlanMemory Pass，见“编译时长与阶段占比”。
- **换机器或换agent**：先看“迁移与恢复清单”，复用已有材料，不重新搭建整套代码仓、不覆盖历史数据。

后文绝对路径是950-ide历史环境中的实际位置，迁移时统一替换根目录；日期、设备编号、分支名及测试结果均不是永久常量。

## 环境、构建与组件切换

### 1. 连接及构建

- 连接入口：Windows 终端执行 `ssh 950-shell`。原笔记标注此 SSH 配置在 Windows 下，不在 WSL 下；不要将 WSL 的连接配置当作服务器环境。
- 编译、验证均在 **950-ide** 进行，不在 WSL 编译。
- 代码仓：`/home/m00953828/AscendNPU-IR`。
- 构建命令入口：服务器 `/home/m00953828/cv-fusion.sh`。按其中的构建命令操作，不把整个脚本当作可直接执行的纯构建脚本。
- 编译产物目录：`/home/m00953828/AscendNPU-IR/build/bin`。
- 基线采用双方确认的 **stable**，不要把 origin/master、某个中间重构提交自动当作正确基线。记录两版完整commit、dirty patch及submodule状态；分支同名不代表产物相同。

服务器 `cv-fusion.sh` 中已有的构建参数如下，适合在现有仓库中复用；先检查工作区，不清理用户改动或重新克隆完整仓库：

```bash
cd /home/m00953828/AscendNPU-IR
./build-tools/build.sh \
  --c-compiler clang --cxx-compiler clang++ \
  '--add-cmake-options=-DLLVM_ENABLE_LLD=ON' \
  --build-type Release --enable-assertion \
  --disable-werror --disable-bishengir-werror --disable-mlir-werror \
  --build-triton -j 16 --build ./build
```

构建并发按服务器负载调整；已有build可增量构建。需要切分支构建基线时，先保存并核对未提交修改，不能直接覆盖工作区。

构建完成后，将同一版本的 `bishengir-compile`、`bishengir-opt`、`hivmc`、`hivmc-a5` **复制**到版本独立目录保存，保留原构建产物。不要只换其中一个组件；运行所需的 `lib` 应与 `bin` 配套。

已有组件目录（使用前确认内容和版本）：

```text
stable： /home/m00953828/mojo/npu-ir/stable/bin
current：/home/m00953828/mojo/npu-ir/local-inplace/bin
```

### 2. 配置运行环境

原笔记的 CANN 环境入口如下；如服务器安装已调整，应换成与本次验证匹配的环境，并在结果中记录。

```bash
source /data/shared/cann/9.2.0.weekly.20260902/cann-9.2.0/set_env.sh

# 每个批次只选一个版本；下一批次再切换。
export PATH=/home/m00953828/mojo/npu-ir/local-inplace/bin:$PATH
which bishengir-compile
which bishengir-opt
which hivmc
which hivmc-a5
sha256sum "$(command -v bishengir-compile)"

npu-smi info
# 仅为示例，先确认6卡健康及占用情况。
export ASCEND_RT_VISIBLE_DEVICES=6
```

stable 批次对应改用 `/home/m00953828/mojo/npu-ir/stable/bin`。建议每批使用独立 shell 配置环境，避免多次追加 PATH 后混用组件。

旧smoke脚本还使用 `/home/m00953828/.venv/bin/activate`、测试仓库的 `PYTHONPATH` 及 `MOJO_Backend=ttx`。迁移时检查当前测试是否需要它们，保存 `which python`、`which pytest` 和Triton实际安装位置，不仅核对编译器PATH。

### 3. Mojo 仓库与运行命令

- 测试仓库：`/home/m00953828/mojo/mojo_operator_cases/github_mojo_opset_950perf`。
- 批量运行脚本：`/home/m00953828/mojo/mojo_operator_cases/run_mojo_accuracy_hw_950_acc_github.sh`。
- 批量用例目录清单：`/home/m00953828/mojo/mojo_operator_cases/testcase_github.txt`；性能专项的历史范围是前16行，运行前核对当前文件，不能把此范围误认为全量功能范围。
- 新的日志、缓存、IR、CSV 等验证材料统一放在 `/home/m00953828/mojo/mojo_data/<本次任务目录>/`。

单条 case 模板（替换实际 pytest nodeid；stable/current、批次及并行进程各用独立缓存目录）：

```bash
cd /home/m00953828/mojo/mojo_operator_cases/github_mojo_opset_950perf
TRITON_CACHE_DIR=/home/m00953828/mojo/mojo_data/<本次任务目录>/<版本_批次_case>/cache \
TRITON_ALWAYS_COMPILE=1 TRITON_DEBUG=1 TRITON_PRINT_AUTOTUNING=1 \
pytest -sv '<测试文件.py>::<测试函数>[<参数>]'
```

`TRITON_ALWAYS_COMPILE=1` 强制重新编译，不要求删除共享缓存；不要通过清理其他运行中的缓存来解决路径问题。批量脚本运行前确认环境变量会传给实际 pytest 进程，且没有覆盖所选版本的 PATH。

## 先功能，后性能

1. 先验证功能：不能出现新增 UB overflow、编译失败或精度错误。区分 skip、环境/缺文件失败和算法造成的失败，成功与失败 case 都要记录。
2. 功能确认后再比较性能。每个 kernel 可以对应多个 pytest case，不按测试文件汇总成一个性能值。
3. 性能 CSV 至少记录 `kernel_name, case, current_time_us, stable_time_us, change_pct, classification`。保留 autotune 配置、设备、轮次及原始日志以便追溯；若使用 profiler 解析脚本，`avg_time` 的单位也必须明确。
4. 阈值沿用下文：**变化不超过2µs，或者不超过2%，都算波动；两项都超过阈值才算劣化/优化**。原笔记中“超过2%或者2µs算劣化”的措辞有歧义，不沿用。

## 基本口径

- 在 950-ide 上编译、运行。先确认所选 NPU 均健康且空闲；可以多张卡并行，但**同一 case 在所有轮次必须固定到同一卡**。每批结束后重新检查卡的健康/占用状态。
- 两版分别使用保存的 `bishengir-compile`，运行前用 `which bishengir-compile` 和 SHA256 核对。保留各自独立的 `TRITON_CACHE_DIR`。
- 复测采用**整批固定组件**：12 条 case 全跑 stable-1，再全跑 current-1、current-2、stable-2。每个批次只使用一个版本的 NPU-IR，批次间才切换 `PATH`；不能每条 case 跑完就切一次组件。多卡分工在四批之间保持不变，并记录 case→卡号映射。
- 每次 pytest 设置 `TRITON_ALWAYS_COMPILE=1 TRITON_DEBUG=1 TRITON_PRINT_AUTOTUNING=1`，不能让旧缓存掩盖编译或 autotune 差异。
- 同一轮比较必须采用同一种计时来源（例如 profiler 的 `Avg Time(us)`，或同一测试日志的 `Device latency`）；不要把两种来源直接拼成一对。
- 判定阈值：绝对变化在 2 μs 以内，或相对变化在 2% 以内，视为波动；两项都超阈值才记为劣化/优化。单次超阈值还需复测，不能直接归因。
- 结果按 `kernel_name + pytest case + autotune 配置` 记录；同一 kernel 的不同 case 分开分析。
- 换卡是**新的一组配对复测**：stable/current均在新卡上重跑，不能拿旧卡的stable与新卡的current直接比较。不要与“同组固定case→卡号映射”的要求混淆。
- 无空闲卡时，经确认可以用低占用健康卡做功能验证或初筛，记录竞争负载；严谨性能结论优先使用低负载环境。同一版本先跑完整批次，不要为抢卡而在单case之间频繁切换组件。

## 性能数据：先单例验证，再批量汇总

### 单例必须检查的三件事

1. pytest/JUnit显示功能通过；这**不等于**已采集到kernel性能。
2. 找到本轮真实的 `ASCEND_PROFILER_OUTPUT/op_statistic.csv`、`kernel_details.csv`，且来源属于本轮，不是旧日志。
3. 用既有解析器得到 `avg_time(us)` 和来源，再生成stable/current对比CSV。

```bash
python3 /home/m00953828/mojo/mojo_operator_cases/parse_ascend_kernel_perf.py \
  /home/m00953828/mojo/mojo_data/<本次任务目录>/<版本_批次> \
  --show-source \
  --output-file-name /home/m00953828/mojo/mojo_data/<本次任务目录>/<版本_批次>/perf.csv
```

解析器取 `op_statistic.csv` 的 `Avg Time(us)` 作为平均性能值，再用同名kernel的 `kernel_details.csv` 中最接近均值的一行关联shape等详情。**不是把那条单次Duration当作均值，也不是把JUnit时长、脚本总时长当作kernel性能。** 默认CSV名为 `perf_result_A5.csv`，务必指定版本独立输出，避免覆盖。`--show-source` 用于保留来源。

### 对齐规则及汇总

- 同名kernel可能来自不同算子文件（历史上SDPA与SWA都出现 `_sdpa_infer_kernel`）。保留pytest完整nodeid、kernel来源文件/函数、shape、dtype、profiler路径；通过实际调用链和日志确认归属，不只按名字匹配。
- 单case可执行多个kernel；每个kernel分别记录。性能对比以相同case、kernel、shape/dtype及必要的调用身份为键对齐，**只有核对键与顺序均一致后才能逐行相减**。缺失、多余或重复项单独列出，不能用0补齐。
- `delta_us = current_us - stable_us`；`change_pct = delta_us / stable_us × 100%`。正数为变慢。若 `abs(delta_us) <= 2` **或** `abs(change_pct) <= 2`，归为波动；其余按正负归为劣化/提升。stable时间非正、值缺失时不计算比例。
- 复测先保留每轮原始值，再对每版有效轮次取均值后比较；注明轮数、卡号、配置是否固定及样本来源。两轮不稳定时可扩展到每版四轮，不能只挑有利一轮。
- 原始全量表不覆盖；另外保存“原疑似劣化case的最新复测表”或“原提升case复测表”。Kernel级汇总分“提升 / 波动 / 劣化”计数，具体case清单仍需保留。
- 若同版本autotune自己也摇摆，先固定配置确认编译输出与性能，再评价端到端选型稳定性；提升同样需要复测，不能只复测劣化。

### 批量执行和故障排查

| 现象/风险 | 做法 |
|---|---|
| 旧脚本写死PATH、设备、日志或cache路径 | 先读脚本和单例试跑，确认实际子进程环境。`run_planmemory_perf_smoke.sh`曾写死旧组件PATH及设备2/3/4，不能直接当作通用stable/current对比入口 |
| 日志目录复制时报 `cp: cannot stat .../logs/*` | 检查真实profiler落盘位置和复制源目录；JUnit通过不能证明性能汇总成功，也不能随意拿另一目录旧数据补齐 |
| `FileNotFoundError: ...kernel.source` | 保存完整上下文，检查独立cache/dump目录、并发清理及上游编译错误。换独立路径强制重编译；不能直接认定是UB overflow |
| 大shape OOM/设备异常 | 记录健康状态、占用及控制台原始错误；换低负载健康卡配对复测，区分设备内存OOM与编译期UB overflow |
| 缺Python依赖或运行时lib | 按测试环境补齐依赖/配套lib；不要擅自删用例或改测试语义规避失败。两版共同缺文件失败也应在结果表说明 |
| TRITON_DEBUG日志很多但任务疑似卡住 | 查具体pytest PID、日志更新时间、编译子进程和设备状态，不凭日志量估计进度；启用 `pytest -s` 保存实时控制台输出 |
| 需要停止或续跑 | 记录启动PID/进程组，仅停本次任务及其子进程，不广泛kill其他用户任务；标记中断项，按缺失case续跑，防止重复事件混入均值 |

批量脚本可能在启动时清理固定日志目录，**并行运行前必须检查目录是否隔离**。不要在共享目录执行清缓存、清日志命令。缺少性能数据时先修采集链路，不急着全量重跑。

## 分流流程

```text
全量性能统计找到疑似劣化 case
  └─ 原始 autotune 配置是否相同？
     ├─ 不同
     │  ├─ 查每档编译失败、UB overflow、候选计时及最终选型
     │  ├─ 按整批 stable→current→current→stable 复测，同一 case 四批固定同卡；观察同一版本是否也换选型
     │  └─ 分别固定关键配置，对同一配置比较性能与 PlanMemory 输出 IR
     └─ 相同
        └─ 确认输入 bcmlir 相同；比较 PlanMemory 输出 IR
           ├─ IR 不同：定位具体 UB 地址/容量/回退差异；
           │           再看后续 GraphSyncSolver 的 wait_flag/set_flag，
           │           固定配置复测性能，确认差异是否真的导致劣化
           └─ IR 相同：换健康卡、调换运行顺序并复测，排查环境波动
```

## 操作要点

1. 先从 pytest 日志的 `TRITON_PRINT_AUTOTUNING` 找最终配置，从 `TRITON_DEBUG` 找对应的 `bishengir-compile` 命令和 `.bcmlir`；配置不同不能直接比较两版地址规划的性能效果。
2. 12 条疑似劣化 case 用 `beam_search/run_degraded_12_perf_cases.sh --cards 1,2,3,4,6,7` 复测；卡号须按当时 `npu-smi info` 的健康/空闲情况选择，不能照搬示例。脚本按稳定的 case→卡号映射多卡并行，四个批次各自完成后才切换组件；每次单独缓存、强制重新编译，并保存编译器 SHA256、pytest 日志、profiler 数据和 `summary.tsv`。如批次间某张卡被其他进程占用，先停止、等该卡恢复空闲，再用相同 `--cards` 加 `--resume <结果目录>` 续跑完整的下一批；不可临时改该 case 的卡号。固定 autotune 时只临时屏蔽其他候选，测试脚本须用退出清理逻辑恢复源码；结束后核对 `git status`。
3. 用相同 `.bcmlir` 和原编译参数，加 `--mlir-print-ir-before-all --mlir-print-ir-after-all` 复放；按每次 PlanMemory pass 的输入/输出 IR 对比。**不能用 npubin 相同代替 IR 对比。** 最终 IR 若只差外部组件绝对路径，应注明路径差异。
4. `wait_flag/set_flag` 由 PlanMemory 后续的 GraphSyncSolver 插入；核间同步 `sync_block_set/sync_block_wait` 则另行区分。比较同步操作时检查具体增删/位置，不只看整份 dump 的哈希。
5. 即使 PlanMemory 输出地址变了，也要在**相同配置**下证明性能稳定劣化，才能把该 case 的性能问题归因于地址变化。反过来，若某些 autotune 候选因新版 PlanMemory 编译失败，应查失败原因，不能简单当环境波动。
6. 优先解决能稳定复现、超过阈值且指向 PlanMemory 的问题；其余标记为“选型不稳定”“环境波动”或“证据不足”，保留原始日志，不覆盖全量统计。

## PlanMemory DEBUG：从 case 到输入 IR

### 1. 确定 kernel、配置及 bcmlir

先确定劣化的是哪个 `kernel_name + pytest case`。保留完整 pytest 日志：

- `TRITON_PRINT_AUTOTUNING=1` 查看最终选用的 autotune 配置。
- `TRITON_DEBUG=1` 查看实际执行的 `bishengir-compile` 命令和输入路径。
- 独立的 `TRITON_CACHE_DIR` 保存本次编译候选及产物。

autotune 会编译多个候选，**不能随便选一个同名 bcmlir 作为最终配置的输入**。需要对应配置与编译命令；若无法唯一对应，临时将算子 autotune 候选限制为选中的配置，再强制编译运行，确认性能现象仍然存在，并保存该次输入。测试结束恢复算子源码。

### 2. 用同一份 bcmlir 打印两版全量 IR

复制日志中的真实编译命令，保留 target、设备编译选项和 libdevice 参数；将输入换成保存的同一个 `input.bcmlir`，两版分别执行。下面只是原笔记对应的命令示例，不能覆盖实际 case 的选项：

```bash
bishengir-compile input.bcmlir \
  --target=Ascend950PR_9579 \
  --enable-auto-multi-buffer=True \
  --enable-auto-bind-sub-block=True \
  --disable-ffts \
  --limit-auto-multi-buffer-of-local-buffer=no-limit \
  --enable-auto-blockify-loop \
  --enable-hfusion-compile=true \
  --enable-triton-kernel-compile=true \
  '--append-bisheng-options=-cce-link-aicore-ll-module /usr/local/python3.11.15/lib/python3.11/site-packages/triton/backends/ascend/lib/libdevice.10.bc' \
  --enable-vf-merge-level=1 \
  --enable-tuning-mode \
  --mlir-print-ir-before-all --mlir-print-ir-after-all \
  -o kernel > all-ir.mlir 2>&1
```

其中 `--enable-tuning-mode` 用于关闭编译失败后的多次重试，减少重复 dump。不要额外添加 `mlir-disable-threading`。GraphSyncSolver 本身会执行多次，不能把这些正常调用都当成失败重试。

### 3. 提取 PlanMemory 输入并单独调试

原笔记关注的是**第三次 PlanMemory 的输入**。这是当时流水线的定位经验，不是任意 IR 的固定编号：先核对 dump 标题、所在 pipeline 和函数，尤其关注 `_aic` / `_aiv` 后缀的函数，再提取对应的完整、可解析的输入 module。

同一份输入分别用两版 opt 调试（Pass 选项应与原流水线一致）：

```bash
bishengir-opt before-planmemory.mlir \
  --hivm-plan-memory-regbase --debug \
  -o after-planmemory.mlir > planmemory-debug.log 2>&1
```

依次比较：外层 policy / attempt、alias 与 optional inplace、SE 集合和顺序、spec level 回退、最终 UB 地址及容量。

### 4. 按证据分流

| 观察结果 | 下一步 |
|---|---|
| autotune 不同 | 查候选编译失败、UB overflow 与候选计时；固定相同配置后比较 |
| 同配置但 bcmlir 不同 | 先确认输入差异；使用同一份 bcmlir 复放两版，隔离 NPU-IR 的影响 |
| 同输入而 PlanMemory 输出不同 | 定位具体地址/复用变化，再比较后续 GraphSyncSolver 的同步变化 |
| 同配置且 PlanMemory 输出一致 | 换健康卡、调整批次顺序复测；必要时继续核对后续/最终输出 IR，再判断环境波动 |

核内同步为 `hivm.hir.wait_flag` / `hivm.hir.set_flag`，由 PlanMemory **之后**的 Pass 插入；核间同步为 `hivm.hir.sync_block_set` / `hivm.hir.sync_block_wait`，本流程关注的 PlanMemory 输入阶段通常已存在。两者不能混淆。`npubin` 一致不能代替 PlanMemory 或最终输出 IR 的一致性证据。

### 5. 更高效、准确地解释IR差异

- bcmlir哈希不同先做文本diff。标量 `iter_args` 顺序变化不应直接当作PlanMemory输入语义变化；但也不能未经验证就忽略，应分别固定两份输入，比较两版输出。
- 多次PlanMemory可能承担不同任务：RMSNorm历史样例前两次为GM workspace、第三次为本地内存。按实际pass模式和函数定位，不把三次调用误认为三次失败重试。
- 不同Pass的SSA编号会变化。跨dump按函数、循环、VF名称及def-use链定位；跨循环同名 `%24` 用 `A.%24`、`B.%24` 区分，图示直接引用IR op和值，不另起L/O/X/Y等难追踪代号。
- 先核对**在哪个policy成功**，再比SE组成、顺序、spec level与offset。不能默认stable/current都在相同的MultiBuffer或VF检查设置下成功。
- 日志里的 `needBits/offset/groupBytes` 等字段可能实际为bit，按代码确认后除8换成B；名称带Bytes也不能想当然。对齐前buffer大小、SE规划大小、MultiBuffer整组大小分别记录。
- 画outline优先用一条按地址排列的线，标出buffer名、复用对象、已占用小块与真正空洞。标量夹在大块中不是空闲碎片；`lastStorageEntry`是规划顺序的最后使用者，不是IR执行顺序。
- mandatory alias合并、optional inplace合并、不同SE最终同址是三件事；本例没有optional候选时，不能把收益归给inplace选择。
- DSATUR颜色不是物理地址。建图包含保守流水线冲突，低spec level仍可能允许图中有边的SE同址；不要用颜色数推算实际UB占用。
- 解释性能因果时沿“SE顺序 → 地址复用对象 → 具体读写op/流水线 → 同步增删或位置 → 复测性能”逐步举证。相同峰值容量也可能有不同同步；静态生命期不重叠不代表异步load/store已完成。

## 编译时长与阶段占比

### 三种时间不能混用

| 要回答的问题 | 测量方式 | 边界 |
|---|---|---|
| PlanMemory本身是否变慢 | 同一PlanMemory输入用opt的 `--mlir-timing` | 取 `PlanMemoryRegBase` 行，不是opt进程总时长 |
| NPU-IR整体是否变慢 | 同一bcmlir、原始参数，测 `bishengir-compile` 进程耗时 | 不启用debug/全量IR打印计时；记录失败重试及tuning mode是否一致 |
| 运行pytest时每kernel的总编译工作量 | Triton `knobs.compilation.listener` 的 `CompileTimes` | 包含IR初始化、lowering及结果保存，不只NPU-IR；不是autotune设备性能或pytest墙钟时长 |

测Pass的最小命令：

```bash
bishengir-opt before-planmemory.mlir \
  --hivm-plan-memory-regbase --mlir-timing -o /dev/null
```

若输入未包含设备规格，按原流水线需要加 `--hacc-append-device-spec=target=Ascend950PR_9579`；不要对已有规格的输入机械重复追加。**debug找原因与正式计时分开执行**。

- 历史Pass计时方法：每版预热3次，正式各30次，轮换stable/current先后顺序，保留逐次数据并汇总中位数；低负载下重复，注意计时显示精度，不夸大小于1ms样例的小差异。
- 从真实bcmlir打印IR、提取对应PlanMemory输入，再开debug核对实际attempt。输入文件大、alloc多，不代表stable需要多次attempt；必须以日志成功退出为证。
- 要证明attempt减少的收益，优先选stable多次成功且current也成功的样例，同时保留stable首轮成功的大IR作回归对照。不能从单样例推断全模型无回归。

### Triton候选编译计时的已有实现

目录：`/home/m00953828/mojo/mojo_data/compile_time_full_20261013/`。

- pytest插件：`planmemory_full_compile_probe.py`，设置 `knobs.compilation.listener`，用pytest nodeid绑定每个编译事件。
- 调用入口：`run_mojo_compile_times.py`；通过 `pytest -p planmemory_full_compile_probe` 加载，并配置 `PM_TRITON_COMPILE_EVENTS`、`PM_PYTEST_CASE_RESULTS` 和插件的PYTHONPATH。
- 保存case、kernel、source hash、constexpr、num_warps/num_ctas/num_stages及各阶段耗时。**原始事件单位µs，已有汇总CSV单位ms**，不要再乘错1000。
- `candidate_comparison.csv`按候选配对；`kernel_comparison.csv`按case/kernel累计所有成功编译候选。候选不同、数量不同，应先分析候选表，不能直接把总时间差当成单次编译速度变化。
- listener只记录**成功编译**，失败候选还要查pytest/编译日志；cache hit也要核对。`store_results`是Triton保存编译结果/缓存的阶段，不是单指输入bcmlir生成。
- 中断补跑可能产生重复事件；边界case必要时独立缓存干净重跑，汇总只用一个明确来源。缺失候选留空，不用0填充。
- 这批历史全量计时曾让两版在不同卡上并行且服务器负载较高，适合检查覆盖率和明显量级差异，**不能作为严谨的小幅编译回归结论**。新一轮严格测量需固定并发、低负载和重复样本。

### 分阶段插桩：仅在需要解释耗时结构时使用

复用目录：`/home/m00953828/mojo/mojo_data/planmemory_swiglu_timing_analysis_20261014/phase_profile/`。

在函数入口放 `pmphase::Scope`，用 `steady_clock` 的RAII对象计时；父阶段扣除子阶段，分别记录liveness、SE准备、inplace、DSATUR、地址规划、Verifier、轮内其他、写回以及Pass总时间。逐轮版本区分stable的每次attempt与current的每个policy。

- `PMPhaseProfile.h`：计时实现；`benchmark_pm_phases.py`、`benchmark_pm_runs.py`：采样；`run_phase_summary.csv`包含逐轮耗时及占本轮/整个Pass的比例。
- 使用源代码快照和独立诊断二进制，不覆盖正式组件。历史做法按已有编译参数重编PlanMemory对象，重新归档/链接；**只有确认源码、头文件ABI和依赖兼容时才能复用其他对象**，否则正常完整构建。
- 计时结束后打印；每版诊断输出须与各自原组件逐字节一致；校验独占阶段之和等于每轮/整个Pass耗时。诊断二进制与正式二进制的绝对时间不能直接混算。
- 报告明确分母：阶段占整个Pass、阶段占本轮、全部循环占整个Pass是三种比例。每次attempt成本不等，7→3次不代表时间必为3/7；先看逐轮实测，不把首轮较贵直接认定为已查明的缓存根因。

## 迁移与恢复清单

一次任务至少保存以下信息；新agent按此恢复，不依赖长聊天记录：

| 材料 | 必须包含 |
|---|---|
| 版本清单 | stable/current commit、dirty diff、submodule状态、构建参数；四个组件路径与SHA256、配套lib |
| 环境清单 | 服务器/容器、CANN/Python/Triton版本与源码位置、venv、PATH/PYTHONPATH、健康卡快照与case→卡映射 |
| 运行清单 | 完整pytest nodeid、批次顺序、三项TRITON变量、cache/dump/log目录、启动PID、命令、起止时间和退出码 |
| 性能证据 | profiler原CSV、来源路径、解析器版本、对齐键、单位、逐轮值、均值和阈值判定；不只留最终百分比 |
| 编译/IR证据 | bcmlir及配置映射、真实编译命令、完整all-ir、提取输入、PlanMemory前后IR、debug、GraphSyncSolver及必要的最终IR |
| 进度与结论 | 已完成/运行中/中断/待补case，当前结论、证据边界、下一条待执行命令；缺失环境文件单列 |

推荐每次在 `mojo_data/<任务名_日期>/` 下按 `stable/current → 批次 → case` 分目录，放一个README指向脚本和原始数据。Files中的分析文档和CSV记录来源路径；**迁移时连原始证据一起复制**，仅复制Markdown会留下失效绝对链接。巨大的cache可按对应case保留必要候选，但先列清单，未经确认不清理历史证据。

迁移后先核对SHA256、依赖和设备，再跑一个已知可复现case，确认kernel性能CSV与bcmlir都能得到，再恢复批量。恢复只跑缺失项，统计时排除中断重复项；不要自动安装/升级整套软件、改测试逻辑或覆盖基线。提交/push由用户决定，凭据不放脚本、日志或文档。

## 可复用案例与脚本索引

| 目的 | 入口 |
|---|---|
| 原疑似劣化12项，逐项结论及数据追溯 | [12项复测结论](beam_search/PlanMemory原劣化12项复测结论_2026-10-12.md)、同目录 `run_degraded_12_perf_cases.sh` |
| 原提升case也需复测，区分稳定收益与波动 | [6项提升复测](beam_search/kernel_improvement_retest_2026-10-13.md) |
| 同输入看attempt及Pass耗时 | [PlanMemory编译时间对比](beam_search/PlanMemory编译时间对比_2026-10-13.md) |
| 阶段总占比与逐轮占比 | [分阶段分析](beam_search/PlanMemory分阶段计时分析_2026-10-14.md)、[逐轮计时](beam_search/PlanMemory逐轮分阶段计时_2026-10-14.md) |
| SE顺序→复用对象→同步的完整例子 | [RMSNorm SE与outline](beam_search/promote_ub_alloc/rmsnorm_x5_se_outline.md)、[IR地址与同步](beam_search/promote_ub_alloc/rmsnorm_x5_planmemory_ir_changes.md) |
| Triton全量候选编译计时 | `/home/m00953828/mojo/mojo_data/compile_time_full_20261013/README.md`及其中插件、汇总/审计脚本 |

以上是**历史证据和工具入口，不是当前代码永远正确的证明**；换版本后重新核对，复用方法而非照搬结论。旧脚本可能保留当时卡号、路径和清理操作，运行前必须审阅。

## 本轮验证可复用材料

- 脚本与日志：`/home/m00953828/mojo/mojo_data/planmemory_perf_full_2026-10-10/`。
- 固定 GELU 两档并交替复测：`run_gelu_fixed{8192,16384}_card2_abba.sh`；GEMM/SDPA 原始 autotune 交替复测：`run_gemm_sdpa_retest_card2.sh`。
- IR 对比示例：`debug_gelu_fixed{8192,16384}/`、`debug_sdpa_fixed128/`、`debug_gemm_same_config/`。
- 本轮经验：GELU 两版同配置 PlanMemory IR 一致，原始 autotune 选型会摇摆；SDPA 同配置 IR 一致且性能方向随复测反转；GEMM 同配置有一处 UB 地址变化，但当前同配置复测未证实由此造成劣化。不要把这三种情况合并成一个结论。
