# 1 需求背景

> A5代际中，基于Triton DSL的性能只有AscendC性能的10%，无法满足客户的性能需求；

# 2 方案分析和对比

> 需要对比cvpipeline、preload 方案；

1. 业务要求
2. 方案分析

**方案一：cv-pipeline优缺点分析**

缺点：

优点:

**方案二：preload优缺点分析**

缺点：

优点：

**方案三：XXX优缺点分析**

缺点：

优点：

**结论：XXX。**

# 3 需求场景分析

## 3.1 特性需求来源与价值概述

## 3.2 特性场景分析

## 3.3 特性影响&交付分析

该特性涉及VF融合、基础if/select op支持、vector 1切2 等特性；xxx

### 3.3.1 涉及部件及要求

bishengir-compile 支持if op；xxxx

### 3.3.2 与其他高级特性的交互分析

VF融合xxx；vector 1切2xxx；xxx

## 3.4 规格

### 3.4.1 shape规格

支持全量shape 大小？

### 3.4.2 性能规格

所有shape性能完成0.9x AscendC；

## 3.5 约束&限制

1、该特性当前依赖A5硬件，只能生效在基于A5及之后的硬件；
2、当前特性只对最内层循环生效；因此类似diffusion attention这类算子理论上无性能提升；pattern如下（for2很有可能是尾块处理，因此存在性能无法提升的情况）：

```
for1:
	c1
	v1
	c2
	v2
	for2 :
		c3
		v3
		c4
		v4
```

3、当前特性只对最内层循环生效；因此类似diffusion attention这类算子理论上无明显性能提升；
4、当前方案需要产生额外的片上内存开销，当前UB或者L1等片上内存不足的情况下（包括VEC1:2切分失败场景），无法获得性能收益；
5、由于读后写or写后读导致的性能瓶颈，该方案理论上无性能收益；
6、由于编译器SCOPE OP暂不支持SMIT场景，导致该方案暂不支持SMIT场景；
7、由于稀疏类CV、Vector bound、MTE bound等本身非CV流水排布导致的性能瓶颈，该方案理论上无性能收益；
8、无循环迭代场景，如只做一次CV交互，该方案理论上无性能收益；

无法使能场景分析：

| 具体原因                                                                                                               | 场景分析                                     |
| ------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------- |                             |
| flag_id is not enough for transfer, invalidFlagNum                                                                    | 有超过14个dot需要排流水                      |
| Found tensor iter_arg using and updating in different block_ids!Found tensor iter_arg using in multi block_ids!   | 迭代间有数据依赖，且迭代内CV执行顺序完全串行 |
| 迭代间有数据依赖，且迭代内CV执行并非完全串行                                                                           |
| No cycle of multiple iterations, the DynamicCVPipeline pass will be interrupted, and resumed to the original workflow. | while op里面有CV交互，没有for op |
| **1）for循环里面纯C or 纯V操作**且for循环外有复杂的CV交互2）/ **没有for循环**且有复杂的CV交互                      |
| **1）for循环里面纯C or 纯V操作**且for循环外只有单向的C->V or V->C2）/ 没有for循环**且只有单向的C->V or V->C**      |
| no linalg.matmul operation was found                                                                                   | 没有cube计算 |
| **No op beside matmul add in vector main loop.**（不应该存在，需要摸底测试）                                           | **for循环里面纯C or 纯V操作；**且for循环外有复杂的CV交互 |
|**for循环里面只有单向CV交互**|流水排布拿不到预期收益
|**for循环里面纯C or 纯V操作；**且for循环外只有单向的C->V or V->C                                                     |
|NPU IR不支持xor的reduce，导致回退。使用https://gitcode.com/Ascend/AscendNPU-IR-Dev/pull/1895/diffs可以验证通过；|

# 4 特性功能设计

## 4.1 总体方案

当前A5架构上，CV融合性能提升主要面临3大难题：

1、CV融合场景下，vec核和cube核间只能通过wait/set intra flag 阻塞式方式进行信号同步；

2、当前vec核和cube核，均存在计算依赖存储操作的场景，即compute依赖load、store操作，导致MTE硬件和cube/vec硬件无法流水；

3、CV融合场景下，vec核的UB内存和cube核的L1内存，无法按需分配内存；存在UB or L1 资源利用率不足的问题；

针对CV融合场景下的3大难题，我们提炼出了三大关键技术逐一解决：

1、数据流&控制流分离：采用以buffer为中心的设计思路，通过CV间的 Shared Scalar Buffer（ssbuf）传递buffer状态，只有当前buffer状态满足条件的情况下才执行相关数据流，完成对buffer中数据的操作；

2、计算&访存分离：将load、store等需要和GM进行访存交互的指令和 基于缓存的计算指令 进行分离，从而实现MTE2/3访存 与 cube/vec 硬件的流水掩盖；解决的是核内 数据传输和 计算 无法有效掩盖的问题；

3、多缓存方案：采用多buffer方案，解决核间 数据传输 和 计算 无法有效掩盖的问题；

## 4.2 模型抽象

mlir是基于数据流的一种中间表示编译器框架，作为上层软件优化和底层硬件架构的桥梁；常见的分析方式有三种：以计算为中心、以数据流为中心、以关系为中心；下面简单说明：

1）以计算为中心：计算操作在时间维度上的映射；以NVDIA为代表；

时间轴 :  T0时刻     -> T1时刻    -> T2时刻   -> ....

```
| 执行操作A | 执行操作B | 执行操作C |
```

2）以数据流为中心：关注数据的时间和空间复用情况；提高cache命中率；以NVDIA为代表；

3）以关系为中心：关注数据与计算单元、调度间的关系；如下图所示：

PE0 --- PE1 --- PE2

|                       |

-------PE3 -----

由于NPU特殊的硬件结构，分两个VEC核和CUBE核，三个PE单元，如下图所示（DavidV100用户手册 第一卷 功能描述 分卷2 DavidDie功能描述）：

![](./87bec9f3-111c-43f6-b516-ac135ba03edd.png)

所以我们需要以关系为中心考虑核间调度关系；同时由于AIV 0/1 核中可以并发执行多条指令，因此我们需要兼顾以计算为中心的设计思路；因此为了兼顾上述两种设计思路，因此需要在MLIR中引入“计算块”的概念；

“计算块”的定义：将某一个时刻在PE（AIV0/1 or AIC）上执行的操作的集合；如下图所示：

时间轴：            T0时刻       ->          T1时刻        ->      T2时刻 -> ...

```
| 执行操作A on AIV0 | 执行操作X on AIV0 |          ...

        | 执行操作B on AIV1 | 执行操作X on AIV1 |          ...

        | 执行操作C on AIC   | 执行操作X on AIC   |          ...
```

## pre-4.3 标准化操作

### matmul 拆分

基于 npuir 与硬件支持情况，对 matmul 操作进行选择性拆分

## 4.3 计算块划分

MLIR基于SSA原则，本质上是一个有向无环图（点：OP；边：数据流关系），以下面OP为例：

%2 = arith.addi %1, %0

可以抽象为如下图：

![](./74e888e7-c281-4737-a0eb-697a0514a18f.png)

计算块划分，即是将上述有向无环图划分成多个子图，该子图在不同的PE上执行；如下图所示：

![](./62d408f2-7871-4b4b-a8c1-2dcaa7033441.png)

白色代表在VEC PE上执行，红色代表在CUBE PE上执行；存在如下两种计算块划分方案：

方案一：

![](./93f6c802-9c52-4358-862e-8ef6ab69f5d0.png)

方案二：

![](./4375870e-fbbd-463d-bcb9-241f38e4f4c3.png)

映射的硬件执行逻辑均为：

时间轴：       T0时刻          ->         T1时刻        ->         2时刻

```
BLOCK1 on AIV   |   BLOCK2 on AIC  |   BLOCK3 on AIV  |
```

因此：最终算子的执行耗时取决于：BLOCK1在AIV上的执行时间 + BLOCK2在AIC上的执行时间 + BLOCK3在AIV上的执行时间；VF融合方案即是解决上述问题；详见链接：[https://wiki.huawei.com/domains/171252/wiki/356674/WIKI2026033010602419](https://wiki.huawei.com/domains/171252/wiki/356674/WIKI2026033010602419)

## 4.4 数据流&控制流分离方案

由于NPU的PE（AIV/AIC）间无自动调度硬件，只能通过控制AIV 和 AIC 间的scalar硬件来进一步控制 下发的计算块 ，通过软件实现调度的方式来达到动态调度的效果；

由于AIC 和 AIV间 有且只有一块共享内存（ssbuf），可以达到非阻塞式同步信息的目的；使用ssbuf存在如下两大问题：

1）如何防止AIV 和 AIC 同时读写相同的地址内存？

2）调度策略如何动态确定？

3）需要传递哪些信息来完成相关的调度策略？

### 4.4.1 防读写冲突

为了解决AIV 和 AIC 的scalar同时读写相同地址的ssbuf内存，需要AIV 和 AIC间进行阻塞式同步（可以理解为“锁”同步）；如下所示：

VEC：

hivm.hir.sync_block_wait[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 0

some ops

hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 0

CUBE：

hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 0

some ops

hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 0

VEC和CUBE核通过 核间的 PIPE S 来完成“锁”同步；

### 4.4.2 调度策略

以FA前向为例，对应的“计算块”及块间数据依赖如下图所示：

![](./2c5d6768-0d7a-4333-94bd-e99efc4f972c.png)

比较合理的调度策略如下所示：（数据编号：需要计算的第N组数据；N>=1）

![](./5ea84c55-2308-422c-9b40-e5084d09b129.png)

遵循的策略：贪心策略；尽可能将CUBE、VEC的计算利用率提到最高；

（缺少理论证明，需要后续建模证明）

### 4.4.3 控制信号

对于计算块可以理解为是由Input（Load）、Compute、Output（Output）三部分组成；Input对应计算块所在有向无环图的入边、Compute对应计算块的逻辑计算部分、Output对应计算块所在有向无环图的输出部分；

![](./c0af2d8b-5654-4406-8133-ecfbae75f90c.png)

上图中的每一个BLOCK块都可以用Input/Compute/Output三部分进行描述，如下图所示：

![](./c04bd9c3-c342-4e1f-a196-968fb30ab424.png)![](./d5d46276-b960-4fd9-8aaa-04506ad3b25e.png)![](./67b05259-8151-4d74-b44b-98580b3610c2.png)

一个计算块想要在PE（AIC/AIV）上执行，需要满足两个条件：1）有新数据到来；2）可以将输出数据写出去；在硬件上计算块的输入输出都对应一块物理内存；因此我们在调度过程中需要传递的信号即是这些输入输出物理内存的状态信息；

## 4.5 计算&访存分离

4.4.3章节中有提交到计算块是分为三部分（load、compute、store）；这里的load 特指 从GM读取数据的LOAD类指令，store特指写数据到GM的STORE类指令；针对A5上UB-TO-L1(MTE3)和 LOC-TO-UB(FIXPIPE)的数据读写，由于是操作的是片上高速缓存，可以归于compute部分；

LOAD/STORE类指令通常耗时在100 cycle；而最长的SORT等耗时久的指令也才7 cycle左右；因此为了提高整个compute的计算效率，需要对长短指令进行分离；实现如下图所示的流水情况；

![](./7a5ea73f-7d57-4dfc-af2f-222a3939d226.png)

## 4.6 多缓存方案

LOAD/STORE指令映射在硬件上为MTE3硬件，一次MTE3读写通常需要1us左右（DMA操作），cube core的频率是1.65GHZ（​*dav-c310*​），即0.6ns左右为一个cycle；一次完整的MMAD指令通常需要300ns左右（不同的shape需要的时间不一样），会出现如下情况：

![](./139b6c5a-cb52-484a-8c2a-47be9d540663.png)

因此需要多缓存来缓解上述Compute利用率较低的问题；以下图双缓存为例：

![](./4a1978a4-f244-4372-9105-3ca23a5a785d.png)

同时受限于UB内存和L1内存的大小（不同代际规格也不一样）；我们需要更细粒度的控制每个计算块的缓存区的个数；假如compute2 的耗时较长，则不需要多缓存，如下所示：

![](./282e7352-2506-48d3-906e-6dbc9351d2c8.png)

## 4.7 特性兼容

4.7.1 VEC 1切2

4.7.2 CV pipeline

4.7.3 preload

4.7.4 xxx待补充

# 5 特性功能实现设计

当前面向Triton算子的编译器lowring过程如下图所示：

![](./165c4abe-5c05-4e87-b635-5d44a1ffbcdc.png)

由于咱们是作为优化层的一部分，因此需要在Ascend-NPU IR层进行架构设计；由于总体方案设计中都是通过“软”逻辑实现的，该功能模块和其它优化特性无互斥关系，因此放在NPU IR优化层的任何阶段均可；但是，考虑到CV融合的方案复杂度，越往下方案复杂度越高，因此当前该功能模块放在TA层进行开发；

总体功能模块按照下图分为5个部分：计算块划分、插入核间同步、计算&访存分离、分配多缓存、新增控制流、计算块生命周期分析；

![](./b5846e37-60d9-480e-9604-7154228a847c.png)

# 6 特性详细功能设计

## 6.1 计算块划分（刘一辰、陈伍洋、邵怡阳、付琦峰）---包括VF融合部分的

![](./44dd82e6-a63e-443d-9065-1f9e410f4c13.png)

包括 C/V 类型判别、Cube Block 划分、Vector Block 划分、指令重排四个一级模块。Vector Block 划分中包含多个二级模块。

该 Pass 的输入输出规则概括如下，细节请参阅详细模块介绍：

1. Core Type 的判断，基于 dot op 沿 def-chain 传播 cube 标签。没有被传播到 cube 标签的算子被标记为 vector，同样会向上传播。
2. 划分是 mlir block 级别的操作，会遍历每一个 mlir block，来进行计算块的划分：因此不会出现 op 跨越 mlir block 被分到同一个计算块中的情况。
3. Vector 划分：Vector 结果被 Cube 使用时，该 Vector 计算块仅包含必要的前置计算。其余 Vector会在不成环的情况下完全融合。
4. Cube 划分：Cube 划分仅依赖数据块上的连通性，所有在数据依赖图中联通的 Cube 块会被划分到同一个计算块中。不存在数据依赖的 Cube 不会被划到同一个计算块中；跨越 V 边界的 C 不会被融合到一起；
5. 计算块 Core Type：所有计算块中一定只包含 Cube 或只包含 Vector 的 Core Type。
6. 指令重排基于划分出来的计算块，即基于 ssbuffer.block_id 进行重排。重排过程中遵循原则：​**只做等价变换**​。并保证所有 ssbuffer.block_id 相同的 op 被排到相邻的位置。
7. 控制流/BlockOp/函数调用: 包含 op 的语句例如 scf.for, scf.if, scf.call 等会被分配单独且唯一的 block_id 但该 block_id 不表示任何计算块划分策略，仅为了输出一致性；如果有多返回值的话，会分配对应的 Core Type。格式为 ssbuffer.core_type = "cube,cube,vector,cube" （假设返回值有 4 个且依次为 cube, cube, vector, cube）

### 6.1.2 C/V 类型判别

C/V 类型判别：根据 IR 识别每个 Op 需要放在 Cube 还是 Vector 核上执行，以及每个 Value 是在 cube 还是 vector 上，并进行标记。

具体流程为：

1. 1. 种子节点标记：遍历并寻找所有必定在 Cube 上执行的 Op，标记为种子。
   2. 种子节点会基于 def 链条向上传播，通过 pattern 识别来自 GM 的数据来源，并将整个链条上可以在 Cube 上运算的 Op 标记为 Cube.
   3. 种子节点接下来会基于 use 链条向下传播，通过 pattern 识别写入 GM 的输出结果，并将整个链条上可以在 Cube 上运算的 Op 标记为 Cube.
   4. Cube 标记完毕后，会将所有剩余的节点标记为 Vector，并再次执行向上传播，此时会沿着 def 链条，将所有遍历到的 Op 添加 Vector 标签，如果该 Op 已经被搭上了 Cube 标签，则将标签改编为 CubeAndVector
   5. 在标记完成后，为了使 Op 的标签能够直接确定在哪个核上执行，该流程中会将所有被标注为 CubeAndVector 的标签分裂成两个 Op，分别持有 Cube 和 Vector 标签，并根据后续调用点的类型指向对应的 Op

### 6.1.3 Cube Block 划分

给定一个有向无环图 G=(V,E) ，其中节点集合 V 包含三类节点：Vector 节点（即分块障碍节点）、 Cube节点（A⊆V, 需要分块的点）、dot 节点（B⊆A, 即具有特殊语义的锚节点）。目标是将 A 划分为若干不相交的块 {P1,P2,…,Pk}，满足以下约束：

1.DAG 保持性：对每个块内节点进行缩点后，所得图 G′仍为 DAG；
2.dot 唯一性：每个块 Pi​ 最多包含一个 dot 节点；
3.依赖内聚性：dot 节点所依赖的上下游节点应尽可能归入同一块；
4.最小化块数：在满足上述约束的前提下，k尽可能小；

算法分为两步：首先进行 dot锚点驱动的分块算法，再进行残差节点层序归并算法，流程图如下：

![image](./0aa1433c-16b2-4bfa-9b81-6a194c6f8af4.png)

### 6.1.4 Vector Block 划分

根据第一层生产的标记，将同层的 Vector 计算合理地划分为多个 Block.

**模块时序图：**

![](./6b4de647-a82f-4107-9474-d92b73c929b2.png?1775184989756)

BFS实现流程图：

![image](./d13f0e7d-cd2f-4f2e-9384-b616034e3771.png)

**剪枝模块**

经过融合算法挑选出来的 VF 都需要执行后处理优化模块，该模块的主要作用为对当前模块的算子进行剪枝优化，因为算法在融合的过程中无法具有全局的视角，后处理主要即补足全局视角对融合的限制。当前后处理仅包含一个基于 C/V 分界线的剪枝模块，因此此处暂且不做后处理策略管理模块的冗余设计，仅实现该剪枝策略。
该剪枝策略即：当 V 的融合跨越某个 C 的边界，将一些本不需要一定在 C 之前执行的 V 融合进需要在 C 之前执行的 VF 中时，该模块会将这些可以放在 C 后面执行的 V 从当前 VF 中去除，以保证流水不会劣化。
具体场景如下：

![image](./433bc8b9-fff9-4a33-a31c-dc54fb21668f.png)
框架伪代码：

```cpp
void cutErrorOp(Block *block, SmallVector<Operation *> &nowFuseGroup, DenseMap<Operation *, bool> &visited,
                SmallVector<Operation *> &candidates, DenseMap<Operation *, int> &indegree,
                const  MemoryDependenceGraph &memGraph)
{
    // 1.Find ops in fuse group whose next node is a non-fusable (CUBE-only) op
    auto toProcess = findOpsAdjacentToCube(block, nowFuseGroup, visited, memGraph);

    // 2. early return: if cannot find one node which next node is CUBE, need to check if return or not;
    if (cannot find one node which next node is CUBE) {
        return;
    }

    // 3. Collect keepOps transitively (data + memory + loop-carried deps)
    auto keepOps = collectKeepOps(block, toProcess, nowFuseGroup, memGraph);

    // 4. Remove non-kept ops from fuseGroup and restore BFS state
    evictAndRestoreState(block, keepOps, nowFuseGroup, visited, candidates, indegree, memGraph);
}

```

### 6.1.5 指令重排

根据前两层划分的 Block ID，对 IR 进行指令重排，使相同 Block ID 的指令在 IR 上连续，便于后续进行同步或多缓冲区处理。

![](./e64d9708-88be-4a7a-bba9-51cfd37dcc33.png?1775135222920)

## 6.2 插入核间同步（刘茹枫、丁一）

![](./fed99eec-f938-4d77-b45c-5c4fad777949.png?1775648076601)

### 6.2.1 数据依赖分析模块（刘茹枫）

![](./e9d668cb-6691-4770-98a9-f83d23878985.png?1775554572444)

获取计算块之间的数据依赖关系，包括c->v/v->c/c->c三种（该部分不考虑v->v之间的数据依赖）

该模块输入：带有`ssbuffer.core_type`和`ssbuffer.id`信息的ir

该模块输出：计算块信息，v-c依赖关系信息，c-v依赖关系信息，c-c依赖关系信息

#### 6.2.1.1 block信息统计

统计计算块信息`BlockInfo`，所有计算块信息存为`BlockInfoMap`，用于后续依赖关系分析

**​注：​**这一部分中，也会统计`scf.for`、`scf.if`等控制流作为特殊计算块的信息

#### 6.2.1.2 外部输入分析（v->c分析）

遍历`blockInfoMap`，分析每个cube计算块的所有inputs：

* 如果input属于cube，则进行c->c特殊情况分析；
* 如果input属于vector，进行producer/consumer层级关系分析，确定producer&consumer的blockid，存为`DependencyInfo`，加入`V2CDependency`。

#### 6.2.1.3 外部输出分析（c->v分析）

遍历`blockInfoMap`，分析每个cube计算块的所有outputs：

* 如果output属于cube，则进行c->c特殊情况分析；
* 如果output属于vector，进行producer/consumer层级关系分析，确定producer&consumer的blockid，存为`DependencyInfo`，加入`C2VDependency`。

#### 6.2.1.4 c->c特殊情况分析

![](./1895b6f7-6d61-4975-b7cb-5c20526e3240.png?1775137626782)

cube计算块之间可能会存在如上图所示的两种依赖关系：①乘数依赖前面的dot（dependindex为0/1）；②加数依赖前面的dot（dependindex为2）

#### 6.2.1.5 producer/consumer层级关系分析

该部分是为了保证在处理依赖关系时，生产者和消费者​**处于同一层级**​，保证后续数据搬运和同步操作的正确性。

![](./b4760a0b-6445-491d-9a3b-73d5f784ddd4.png?1775545839261)![](./62527d17-0c82-422f-93bc-06a1b8165434.png?1775545970876)![](./8da7e1e1-f1f2-4c0b-b28e-2ed0d8a57d10.png?1775546005719)![](./d94516d4-d772-46f8-bc5d-418e1cbe8e9d.png?1775619168247)![](./859b4097-58e6-43fd-85b3-0f26c7b38f15.png?1775619503068)

* 如果producer和consumer在同一mlir block中，则直接用生产和消费的op所在的blockid作为producerBlockId和consumerBlockId
* 如果producer和consumer在不同mlir block中，则​**找到最小的公共层级**​，选取op在这一层级所属的blockid作为producerBlockId/consumerBlockId，另一op选取同层级的控制流op的blockid作为producerBlockId/consumerBlockId

### 6.2.2 插入数据搬运（刘茹枫）

![](./80f4f935-10af-4315-ac22-be87a8201928.png?1775556444419)

根据6.2.1获取的依赖关系，分别针对c->v/v->c/c->c的依赖关系插入数据搬运。

具体包括插入点分析以及插入具体搬运操作两个部分，插入搬运操作可根据不同代际进行扩展。

数据搬运操作包括生产者传出数据、消费者接收数据、分配数据存放的buffer三个部分。

#### 6.2.2.0 计算块起始/结束op获取(公用)

获取计算块开始和结束的op，用于后续确定插入点位置

#### 6.2.2.1 插入点位置

1. 生产者传出数据：在producerblock结尾
2. 消费者接收数据：在consumerblock开头
3. 存放数据的buffer：跟随生产者传出数据以及消费者接收数据的位置

根据依赖关系中blockid和`BlockInfo`中的`*startOp`/`*endOp`可获取1、2对应位置。

#### 6.2.2.2 数据搬运

##### **（1）V->C**

遍历`V2CDependency`，对于每个DependencyInfo，首先通过6.2.2.1获取插入点位置，后分别插入内存分配、V block传出数据、C block接收数据的相关OP。

* **​内存分配：​**L1（`cbuf`）上分配内存，`memref.alloc()`标签为`#hivm.address_space<cbuf>`
* **​V block传出数据：​**将数据从nd布局转为nz布局，并通过`hivm.hir.copy`传出
* ****C block接收数据：****`hivm.hir.convert_layout`将数据转回nd布局，并通过`memref.memory_space_cast`+`bufferization.to_tensor`将L1上的memref转为tensor

##### **（2）C->V**

遍历`C2VDependency`，对于每个DependencyInfo，首先通过6.2.2.1获取插入点位置，后分别插入内存分配、C block传出数据、V block接收数据的相关OP。

* **​内存分配：​**UB上分配内存，`memref.alloc()`标签为`#hivm.address_space<ub>`
* **​C block传出数据：​**通过`hivm.hir.fixpipe`传出
* ****V block接收数据：****通过`memref.memory_space_cast`+`bufferization.to_tensor`将UB上的memref转为tensor

##### **（3）C->C**

遍历`C2CDependency`，对于每个C2CDependencyInfo，首先判断依赖模式：

如果是乘数依赖，通过6.2.2.1获取插入点位置，后分别插入内存分配、C block传出数据、C block接收数据的相关OP。

* **​内存分配：​**L1上分配内存，`memref.alloc()`标签为`#hivm.address_space<cbuf>`
* **​C block传出数据：​**通过`hivm.hir.fixpipe`传出
* ****C block接收数据：****通过`memref.memory_space_cast`+`bufferization.to_tensor`将UB上的memref转为tensor

如果是加数依赖，不做处理。

#### 6.2.2.3 nd2nz

（1）将2D按ND排布的数据转为4D按NZ排布的数据

（2）对非整数倍shape的数据做泛化处理

#### 6.2.2.5 给新增op打上标签

1. 新增op按op所在的计算块的标签添加Block ID及CUBE/VECTOR标签。
2. 同一组数据传输的op会用全局唯一的`TransferID`标记。

### 6.2.3 flag id管理（公用）

功能：返回能够使用的flag_id

![](./6d279f6b-4abd-4349-abb3-ffe5628af81c.png?1775649107100)

#### 6.2.3.1 获取现有 Flag ID 最大值

目的：为需要生成新同步点的场景提供基础计数，确保新生成的 `<span data-vt-id="oxcx3eio">flag_id</span>` 全局唯一，避免与现存同步点冲突。

输入：funcOp

输出：返回当前范围内未被使用的最小正整数 ID

#### 6.2.3.2 同步点复用分析

判断是否有与当前同步点控制区域不冲突的同步点id，如果有，则返回id，否则返回-1

如果某一组同步点被完全包含于与当前block无关的scf.for或scf.if中，则可以复用该组同步点的flag_id。

### 6.2.4 同步插入模块（刘茹枫）

该模块目的是保证L1/UB上，写入时原有数据已被使用，读取时需要的数据已被写入，防止踩内存
![](./24c07ec9-7fed-43d4-adf9-2bd19a73b7a0.png?1775642566946)

#### 6.2.4.2 同步阻塞分析

根据数据流c->v/v->c，给set、wait加上正确的阻塞标签

6.2.4.3 给新增op打上标签

逻辑同6.2.2.5：

1. 新增op按op所在的计算块的标签添加Block ID及CUBE/VECTOR标签。
2. 同一组数据传输的op会用全局唯一的`TransferID`标记。

#### 6.2.4.3 主逻辑：插入同步点

![](./e7f42ae5-4eac-4955-b509-efe721031e5d.png?1775649224501)

**执行流程：**

遍历依赖list：

1. 根据`DependencyInfo`和`blockInfoMap`获取producer和consumer计算块各自的起止点`producerStartOp`、`producerEndOp`、`consumerStartOp`、`consumerEndOp`
2. 调用`analyzeSyncReuse`分析是否存在可以复用的flag_id
3. 如果有可复用flag_id，使用该flag_id，否则调用`acquireNextAvailableFlagId`获取新的flag_id
4. 判断flag_id是否合法，不合法则回退整个DAG，合法则插入同步点
5. 插入防止读冲突的同步点：在producer fixpipe/copy op后插入set op，consumerStartOp前插入wait op
6. 插入防止写冲突的同步点：在producer fixpipe/copy op前插入wait op，consumerEndOp后插入set op
7. 插入起始/结束的同步点：在for循环外，前后分别插入set op和wait op

### 6.2.5 分scope（丁一）

复制删除方案

![](./cca803cf-6df0-457d-8b82-cde5a443a405.png)

#### 6.2.5.1创建cube和vector的scope

将所有的操作分别放到cube和vector的scope结构当中，并且打上对应的标签

#### 6.2.5.2归一化处理

![](./93a5c938-1ac4-4002-92c0-06e49395caa3.png)

遍历规则

遍历scope当中的所有op

1.当参数的core_type与当前Scope类型不匹配时  添加op到需处理的列表中并且加上可以直接删除的标签

2.对于带region控制流 分别检测该操作本身，输出结果和所有region内操作 包含与当前scope类型不匹配参数  加入到需处理的列表中打上需归一化的控制流标签

控制流处理规则

处理步骤：

1. 遍历结果：检查每个结果的core_type
2. 识别不匹配：`resultCoreType != scopeType`
3. 替换terminator use：将yield中对不匹配结果的引用替换为常量占位值
4. 递归处理Region：对控制流内部的嵌套操作重复上述过程

### 6.2.5 优化（预留）

优化数据搬运&同步Op的插入位置，减少对Vector计算的打断/核间等待时间等

### 6.2.6 预计输出

annotation.mark

memref依赖

ptr

![](./745282ee-c137-4669-9967-226460d300db.png?1775805151526)

其中，绿色和蓝色的op会分别标上唯一的transferID

## 6.3 计算&访存分离（李承峰、张开、吴志伟）

### 指令重排模块

遗留问题：复杂场景的load、compute处理约束

输入：带有`ssbuffer.core_type`和`ssbuffer.id`信息的IR

输出：重排LOAD后的IR

​**1、指令识别与聚合**​： 对计算块（Compute Block）进行静态扫描，识别所有 `Load` 指令并进行打标记。针对每一项访存操作，以其地址操作数为起点进行逆向数据流溯源，提取该地址生成的完整依赖链（Address Generation Chain），并将链上指令聚合为待调度的逻辑单元。

此处`Load` 指令需满足以下条件：

* ​**具有属性 `mlir::MemoryEffects::Read`**​： 明确该指令的操作语义为“读取”，而非写入或仅分配空间。
* ​**源（Source）是 Global Memory (GM)**​： 操作数的内存空间（Memory Space）属性必须指向全局地址空间。
* ​**目的（Destination）是 Local Memory (L1/L2/Register)**​： 数据流向应当是计算单元可直接访问的低延迟存储层（通常是寄存器或片上高速缓存）。
* ​**不为原子操作（Non-atomic）**​： 原子读取涉及特殊的同步机制和硬件锁，通常不参与常规的访存延迟隐藏调度或简单的地址溯源。原子操作同时设计读和写，本次写会影响到下一次的读，所以不对原子操作进行判别
* **​记忆化溯源策略：​**在提取 Load 指令的依赖链时，若检测到当前算子已被标记为‘已处理’，则终止该分支的递归追踪与重新调度，以避免冗余处理及依赖冲突。

​**2、迭代冒泡调度**​： 按照指令的原始执行顺序，依次对各访存链路执行提升操作。采用类似冒泡排序的交换机制，将链路内的各条指令与其前驱指令进行逐位比对。 在移动过程中，通过合法性探测函数（即定义的 `if` 约束条件）实时评估置换的可行性。满足以下条件之一，不可移动：

* 前驱指令为自身指令的输入或为前驱指令为LoadOp
* 本身有region或触达region边缘

**​3、循环重复操作：​**若置换合法，指令将持续向上提升，直至触达 Block 边界或依赖限制。后续所有`Load` 指令同理

​**4、性能目标实现**​： 通过这种方式，尽可能使访存操作处于计算块的首部，旨在利用硬件的异步执行特性，最大限度地掩盖离片访存的高时延，从而优化算子的整体吞吐性能。

![](./4a7e91dc-ed63-4f38-b50f-e2886408cadc.png)

IR输入：

IR输出：

## 6.4 分配多缓存（林子睿、陈啸天、张德龙）

本系统采用“算存分离多缓冲并行 + Scope内依赖约束 + Scope间多缓存处理”的协同设计架构：在算存协同层面，通过为计算与访存操作配置独立的全局缓冲区（如 `alloc_0` 与 `alloc_1`），实现计算与内存访问的真正并行，突破访存瓶颈；在逻辑控制层面，Scope 内聚焦于精确表达与约束数据依赖关系，保障计算语义的正确性；Scope 间则通过对FixPipe、copy语句进行控制流添加实现核间任务的调度，显著提升整体性能；特别强调，核间通过 FixPipe 传输数据时，必须使用确定的多个全局 `alloc` 变量（如 `alloc_0` 与 `alloc_1`）分别绑定不同缓冲区，若仅用单一 `alloc` 替代多缓冲，则强制串行执行，导致并行性失效——因此，多缓冲并行机制的实现前提，是多个独立、确定的 `alloc` 变量的显式使用；最终，系统以分离后的 block 块为输入，输出在 block 间与 Scope 间严格控制的依赖流，实现高效、正确、可预测的并行计算执行。

* **整体设计方案：**

输入：接收上游计算访存分离后的结果（block已划分好）

输出：在分离访存后的block块间以及scope间的依赖控制流

### 6.4.1 算存多Buffer方案-多buffer数据加载模块（吴志伟）

该模块负责将计算块内从GM读取数据的Load类指令数据暂存于buffer区域中，以降低Load和Compute之间的耦合，为后续提高Compute利用率提供基础。

流程为：发起GM Load -> Load完后写入多buffer -> Compute消费

规则：

1、每条 GM Load 对应一个 buffer 组

2、buffer 的数量由buffer数量识别模块给定

3、当buffer为空时，执行Load数据写入buffer，首轮填充满buffer，单轮对应Compute只执行一次，第二轮开始按照FIFO的消费顺序，重新填充buffer区域

4、buffer的生命周期由外部生命周期模块进行分析，以实现buffer的复用，避免ub overflow

算法及流程如下（以buffer num = 2为例）：

![](./1d70361a-f0b1-4f4e-9e75-a11689a4dc95.png)

1、缓冲区用独立的标志控制，初始状态为0，表示缓冲区均为空，当缓冲区被加载时设置为1，表示该缓冲区被填充；

2、初始发射等同于缓冲区数量的Load指令，每一轮消费者一个缓冲区，后面每轮检查缓冲区是否为空，当缓冲区为空时，可以加载；

3、Load指令加载次数与未优化前Load指令总次数保持一致，即upper_bound是指令加载上限。

实现如下所示Load与Compute并行掩盖。

![](./6a150159-28f4-4523-bdd3-3875903a68fd.png?1775649939897)

IR输入：

IR输出：

### 6.4.2 Scope内多缓存分配设计方案

### 

![](./83c45601-8ad5-4b5f-bc11-786c17d86ac9.png?1775196932492)

#### 6.4.2.1创建依赖识别图createDepValueMap（张德龙）

此模块会递归遍历所有的block内的所有Op并找到对应的依赖值。

##### 6.4.2.1.1 collectBlockInfo

递归遍历所有 Block 及其内部的 Op，收集每个 Block 的结构化信息，为后续构建依赖图提供基础数据。

输入：Op.attribute

输出：抽取了Block信息的数据结构

##### 6.4.2.1.2 createDepValuesMap

此函数会处理所有的前面收集到的block，在处理时：

会维护一个前面block输出的总列表allBlockOutput以及当前block输入的临时列表tmpInput。

对比当前block输入以及前block输出列表，将对应的依赖值写入依赖图。

具体数据结构：

{Block_1:[depandence1, depandence2 ...], Block_2:[depandence3...]}

#### 6.4.2.2 缓存区需求分析以及创建createBuffers（林子睿）

此模块会收集核间和核内的依赖数量并计算出对应的总buffer数需求量，并在作用域前创建buffer。

##### 6.4.2.2.1 Buffer创建需求信息收集

`collectExternalBufferInfo()`

该函数会收集所有CV之间需要创建buffer的数量信息。

输入：createDepValuesMap()得到的依赖图。

输出：只包含CV之间依赖的依赖图。

`collectInternalBufferInfo()`

该函数会收集所有C核与V核核内需要创建buffer的数量信息。

输入：createDepValuesMap()得到的依赖图。

输出：只包含C核与V核核内依赖的依赖图。

##### 6.4.2.2.2 buffer数量评估模块

`bufferNumAssess()`

该模块将模拟运行态执行的顺序排布流水，获取某个buffer数量组合规划下的流水排布，判断是否有buffer使用不饱和的op和buffer数量不足阻塞的op。

若存在上述buffer分配不合理的情况，调整不合理的buffer数，重复上述排布模拟。

优先保证流水功能正常，其次优化流水buffer使用情况。

考虑作用域，核内和核间需要分开考虑。先做核内再做核间。

输入：(可选)运行态block执行策略，形式可以为block的优先级序列；涉及的运算和读写操作的costmodel，可以认为是一个存放计算耗时估值的序列；上述函数收集到的数据依赖信息。

输出：一组可行的buffer数map，为从计算操作到需要buffer数量的映射。*该模块不涉及mlir改动。

实现细节：核内操作仅调节UB和L1上的buffer数。目前在不考虑复用的情况下我们确保所有buffer大小的和不超过UB/L1的总空间。C/V核内计算块内考虑load/store/compute的时间轴，CV核间计算块考虑fixpipe/copy/Vcompute/Ccompute的时间轴。通过确认阻塞和空泡点位来确认不合理buffer分配的位置。直到把所有空间分配完毕或者流水不存在空隙。

##### 6.4.2.2.3 Buffer创建

`createBuffers()`

此函数会基于bufferNumAssess()的返回结果给每个计算分配对应数量的buffer。创建的位置基于生命周期分析的层级，将创建在生命周期的起始点前。

问题：说明buffer创建层级需求

输入：插入buffer alloc前的mlir，bufferNumAssess的计算-buffer数评估结果。

输出：插入buffer alloc后的mlir；一个alloc出来的函数名和buffer的一一映射map。

#### 6.4.2.3 多缓存区控制流addMultiBufferControlFlow（陈啸天）

此模块会将上游传来的依赖图进行递归处理，添加多buffer控制流逻辑，共分为两大部分（所有场景下的控制流语句都要打印相关blockId标签方便后续处理）：

输入：createDepValuesMap所生成的依赖map、createBuffers()生成的buffer list

输出：插入多buffer控制流逻辑的IR

实现方式：使用scope内声明的计数器counter，通过取余操作来确定当前要写入/读取的buffer是哪个

##### 6.4.2.3.1 prevBlockProcess：**前驱计算块的依赖变量多buffer写入控制**

本模块针对​**被依赖的前驱计算块**​（即下游依赖的上游节点），对其输出的依赖变量进行​**多buffer缓冲式写入控制**​：

传输机制采用 **FIFO（先进先出）** 队列策略，确保数据顺序一致性。

通过一个Scope内的全局计数器（`counter`）与预设的 buffer 数量进行取余运算，动态确定当前应使用的 buffer 索引，实现负载均衡与轮询调度。

控制流逻辑由 `processProducerValues` 实现，根据余数结果选择对应 buffer，完成依赖变量的写入操作。

##### **6.4.2.3.2 postBlockProcess：**后继计算块的依赖变量多buffer读取与传输控制****

本模块针对​**依赖该计算块的后继节点**​，对其输入的依赖变量进行​**多buffer缓冲式读取与传输控制**​：

传输机制同样基于 **FIFO** 策略，保障数据读取顺序与一致性。

利用计数器（`counter`）与 buffer 总数的余数关系，动态判断当前应从哪个 buffer 中读取数据，实现高效的轮询读取机制。

控制流逻辑由 `processConsumerValues` 实现，依据余数选择目标 buffer，完成依赖变量的读取与跨buffer传输

### 6.4.3 CV间多缓存分配

**本模块旨通过调整fixPipe与hir.copy数据传输逻辑处理Cube和Vector核间的依赖关系：**

* ![](./c85a812f-6e79-4b4d-8b33-e9ad23285dc0.png?1775199095361)

#### 6.4.3.1 findDepValuesBetweenCV:**识别需要采用多缓存传输的数据**（林子睿）****

通过遍历fixpipe与copy的数据传输情况确认CV核间依赖关系。
根据buffer数量评估模块`bufferNumAssess()`的结果创建CV间的buffer。

CV间暂时不采用全局alloc，采用和核内相同的内存分配方式，额外打标签传输。

#### 6.4.3.2 addMultiBufferBetweenCV：添加CV间控制流（张德龙，陈啸天）

根据6.2插入核间同步打上的标签对于fixPipe以及copy进行多buffer控制流处理：

* * 输入：带有是否需要处理标签的fixPipe和copy的ir以及buffer列表
  * 输出：添加了多缓冲控制流的ir

##### 6.4.3.2.1 由Cube传输到Vector

数据从 Cube 向 Vector 传输时，Cube 作为数据的生产端，负责将依赖变量通过 `fixPipe` 写入指定通道, Vector 作为接收端，使用 `memory_space` 接收数据。

###### 6.4.3.2.1.1 多缓冲控制流添加（陈啸天）

* * 传输过程遵循 FIFO 逻辑，发送端根据计数器与 buffer 数量的余数，动态选择对应的 `fixPipe` 进行写入，实现轮询分发。
  * 接收端也根据相同的逻辑，选择对应的 `memory_space` 接收数据，确保读写匹配。

###### 6.4.3.2.1.2 添加同步点（张德龙）

* * 根据6.2.3.1 flag id管理函数判断是否有多余的flagid可供多buffer逻辑使用，若没有则直接return。
  * 根据发端和收端的fixPipe和memory_space语句找到对应的wait、set同步点插入位置。
  * 根据counter取余结果添加轮询逻辑，并在if中添加同步点。
  * 遗留问题：yield结果可以删掉
* 发端ir举例：
* 收端ir举例：
* * 传输过程遵循 FIFO 逻辑，发送端根据计数器与 buffer 数量的余数，动态选择对应的 `fixPipe` 进行写入，实现轮询分发。（陈啸天）
  * 接收端也根据相同的逻辑，选择对应的 `memory_space` 接收数据，确保读写匹配。（陈啸天）

##### 6.4.2.3.2 由Vector传输到Cube

* 数据从 Vector 向 Cube 传输时，Vector 作为数据的提供方，使用 `hir.copy` 将依赖变量复制并发送到目标通道, Cube 作为处理端，通过 `convertlayout` 接收数据，并将其转换为适合计算的布局格式（逻辑与C->V相同）：
  * 同样采用 FIFO 机制，发送端根据计数器与 buffer 总数的余数，选择对应的 `hir.copy` 执行复制操作，实现轮询调度。（陈啸天）
  * 收端同样会根据根据counter与buffer数关系动态选择convertlayout进行数据接收。（陈啸天）
  * 插入新同步点。（张德龙）

## 6.5 新增控制流（朱信光、马杰、孙先淼）

### 6.5.1 总体设计

#### 6.5.1.1设计图

![](./83f2685b-cecd-4390-be37-e8b959f15369.jpg?1775132943307)

#### 6.5.1.2控制流框架

### 6.5.2 详细模块

#### 6.5.2.0 前置准备

##### 6.5.2.0.1 CopyOpsInCube：拷贝CUBE潜在的依赖op --马杰

CUBE间不同block_id的计算块存在依赖关系，可能引起copy cbuf to cbuf的问题，因此拷贝这些有依赖的op到关联的block中

伪代码：

输入：

输出：

#### 6.5.2.1 CreateIfOps：创建if true的计算块 --马杰

***1.前置信息：***​**6.2插入核间同步**提供主要计算的for op的信息（**ssbuffer.mainloop**标记） [TODO：未来while op支持]

***2.做法：***

在mainloop标记的for op中，依据block_id创建`scf.if %true` op（打上**ssbuffer.if**标记），以包裹计算块

伪代码：

模块输入：

模块输出：

#### 6.5.2.2 UpdateForOps：更新for op --马杰

需要新增：每个计算块的计数器、核内依赖的控制条件、核间for同步的PIPE_S

***1.前置信息：***​**6.4分配多缓存**提供核内依赖情况的信息

***2.做法：***

1. for iter_args新增每个计算块独立的计数器，与ssbuffer.if标记对应 ，提供DenseMap<ForOp, SmallVector<int>> BlockCounters接口；

伪代码：

模块输入：

模块输出：

> SmallVector<int> BlockCounters = { 2, 3 }，分别表示新增ssbuffer.if的if op的计数器的index

2. for iter_args新增每个核内依赖所需的控制条件，与**6.4分配多缓存**提供的信息（Map<消费者，生产者>）对应，提供DenseMap<ForOp, SmallVector<int>> InnerDepConds接口；

伪代码：

模块输入：

模块输出：

> DenseMap<ForOp, SmallVector<int>> InnerDepConds = { <%30:2 = scf.for, <4>> }，表示%30:2 = scf.for这个forOp中有一个计算块间的依赖，对应的控制条件的iter_args index=4

3. 在ssbuffer.mainloop标记的for op的开始末尾加上PIPE_S的核间同步 [TODO：for op全用flag=14 需要demo验证]

3.1 VECTOR SCOPE: scope开始位置插入set flag=15，后续在for op中插入wait flag=14、set flag=15

3.2 CUBE SCOPE: scope末尾位置插入wait flag=15，在for op中插入wait flag=15、set flag=14

伪代码：

#### 6.5.2.3 UpdateIfConds：分析、计算每个if的条件

##### 6.5.2.3.1 collectDependcyBuffers：调整获取到上游全局依赖信息​**​ ​**​--朱信光

给出在当前for循环内的全部核内/核间依赖，并为其标号

输入：

```cpp
// key: comsumerOp result, value: [producer1Op result, producer2Op result, ...]
DenseMap<Value, SmallVector<Value>> crossCoreDependentMap;
DenseMap<scf::ForOp, DenseMap<Value, SmallVector<Value>>> intraCoreDependentMap;
```

输出：

```cpp
// 在原有基础上添加index标记
// {
//     index: 0，key: comsumerValue, value: [producer1, producer2, ...],
//     index: 1，key: comsumerValue, value: [producer1, producer2, ...],
//     ...
// }
DenseMap<int, DenseMap<Value, SmallVector<Value>>> crossCoreBuffers,
DenseMap<int, DenseMap<Value, SmallVector<Value>>> intraCoreBuffers
```

##### 6.5.2.3.2 GetInputOutputs：遍历 ​**mainloop 中的计算块，分析输入输出 ​**​--朱信光

``getInputOutputs``

> 输入：
> 当前for循环内的所有核间/核内buffer
> DenseMap<int, DenseMap<Value, SmallVector<Value>>> crossCoreBuffers;
> DenseMap<int, DenseMap<Value, SmallVector<Value>>> intraCoreBuffers;
> 
> 输出：
> 当前计算块的外部输入输出列表：
> smallVector<int> crossCoreInputValues;
> smallVector<int> crossCoreOutputValues;
> smallVector<int> intraCoreInputValues;
> smallVector<int> intraCoreOutputValues;

**收集计算块中的所有外部输入和输出**

* 外部输入定义：

1. 所有op的操作数；某些特殊op（fixpipe，copy）的ins操作数；
2. 上述op的操作数包含在bufferList中

* 外部输出定义：

1. 计算块（ifop）的result值；某些特殊op（fixpipe，copy）的outs操作数；
2. 上述op的操作数包含在bufferList中

##### 6.5.2.3.3 setCrossScopeConditions：核间条件设定 --朱信光

``setCrossSccopeConditions``

> 输入：
> 
> 指向全局核间依赖关系的index列表，基于index获取到当前计算块内包含的crossCoreBuffers的依赖关系
> 
> smallVector<int> crossCoreInputValues;
> 
> smallVector<int> crossCoreOutputValues;
> 
> 输出：无（直接操作mlir）

**1. 申请核间buffer总共所需的 ssbuffer 地址以及初始化**

* * 一个控制变量对于一个外部输入/输出的buffer状态（空/满）
  * 核间buffer：申请ssbuffer地址存放，vector 0 核从0地址开始分配，每额外分配一个地址偏移4（0, 4, 8, 12, ...），最多可分配256个控制变量；vector 1核从1024地址开始分配，每额外分配一个地址偏移4（1024, 1028, 1032, 1036, ...）

![](./edda4c18-aaae-4adf-8753-065c5a1fc207.png?1775566318142)

**2. 根据外部输入输出添加控制变量条件和**控制变量变更逻辑****

* * 控制变量条件：
    * buffer读取：flag > 0
    * buffer写入：flag < bufferNum
  * 控制变量更改
* * * buffer读取：flag -= 1
    * buffer写入：flag +=1

![](./1f1d14b5-c892-4177-9615-d5093e590487.png?1775565684180)

##### 6.5.2.3.4 setIntraCoreCondition：核内条件设定 --孙先淼

本模块依据scf.if %true 包裹住的计算块分析cube核和vector核内的数据间依赖关系，并依据数据间的依赖关系设定if条件

![](./78ae97c9-e157-4a7f-b18b-4a5b075e87f7.png?1775807040932)

* 建立intraCoreBuffers和InnerDepConds变量的映射关系
* 根据intraCoreInputValues的key到InnerDepConds取条件变量，作为该消费者的条件变量
* 根据intraCoreOutputValues的key在InnerDepConds取出的变量作为生产者组的控制的条件变量
* 生产者组size为bufferNum
* 该ifop使用的变量记录到varUpadate中，便于更新else中yield值
* 根据外部输入输出在block外添加控制变量条件
* * 输入：flag > 0
  * 输出：flag < bufferNum
* 根据外部输入输出在block内部添加控制变量变更逻辑
* * 输入：flag -= 1
  * 输出：flag +=1

##### 6.5.2.3.5 combineConditions条件合并 --孙先淼

本模块将核间和核内的条件以及计数器条件合并后替换掉scf.if %true

* 根据ifop从BlockCounters中获取计数器，控制迭代次数
* 将IfOp使用的计数器存储到计数器映射图 DenseMap<scf::IfOp, Value> cntArgs中
* 创建else，并yield计数器和变量
* 将核间和核内的条件以及计数器条件合并，替换掉scf.if %true
  
  * 输入:
* * 输出：

#### 6.5.2.4 UpdateForIterTimes：更新for的迭代次数 --朱信光

本模块主要对for循环次数进行微调，保证新增控制流能够计算完成，并且不会增加过多的循环空转

> 输入：计数器映射图 DenseMap<scf::IfOp, Value> cntArgs
> 
> 输出：无

##### 6.5.2.4.1 设计所需要的额外的次数

![](./7a626317-f088-464b-b243-eb79c698a07d.png?1775543144239)

流水排布到后面一定会是稳定的排布，此时单论循环内会将全部的cv计算块都入队，所有仅需要考虑在启动阶段需要多少循环次数

考虑最慢的启动：C1 -> C1 V1 -> C1 V1 C2 -> C1 V2 C2 V2 -> C1 V2 C2 V2 C3 -> C1 V2 C2 V2 C3 V3，即每轮排布仅会增加一个计算块

在实际运行中是CV核交替进行入队操作，对于上述操作，CV核各自需要额外循环次数为对应计算块数量-1，即启动轮次C核有两轮：C1和C1C2；V核也有两轮：V1和V1V2

故额外的循环次数最多需要各自计算块数量 - 1

##### 6.5.2.4.2 使用计数器替换原本的循环迭代计数器

for循环的迭代轮次已经发生了变换，失去了原本的作用，所以需要对计算块中使用了for循环计数器的 op 进行操作数的替换

***1.前置信息：***每个计算块新增的计数器

***2.做法：***遍历所有的计算块，将对应的计数器变量替换掉for循环计数器

![](./b1b75c52-a860-4a8f-90d4-6bda293d9d23.png?1775566694378)

## 6.6 生命周期分析（朱信光、马杰）

### 6.6.1 总体设计

![](./d2abfe83-f6ca-42c5-b999-b41202163c06.jpg?1776050902361)

### 6.6.2 详细模块

#### 6.6.2.1 GetNestingDepths：确定每个op的嵌套深度

遍历所有op，并设定嵌套深度属性**ssbuffer.nesting_depth**

输入：无

输出：无（直接修改mlir）

#### 6.6.2.2 GetEndNestingDepths：确定当前op生命周期结束的嵌套深度

遍历所有op，确定op生命周期结束的嵌套深度**ssbuffer.end_nesting_depth**

**依据：只有被scf.yield yield的value，生命周期才会不等于它的嵌套深度，即小于嵌套深度nesting_depth**

输入：带有ssbuffer.nesting_depth信息的MLIR

输出：带有ssbuffer.end_nesting_depth信息的MLIR

#### 6.6.2.3 SetLifecycleLevels：设定每个op的生命周期属性

设定op的生命周期信息**ssbuffer.lifecycle_level**

> **lifecycle_level = nesting_depth - end_nesting_depth**
> 
> 例如，lifecycle_level=0表示生命周期为当前region，lifecycle_level=1表示生命周期为外部的region结束

输入：带有ssbuffer.nesting_depth、ssbuffer.end_nesting_depth信息的MLIR

输出：带有ssbuffer.lefecycle_level信息的MLIR

# 7 特性非功能性（DFX）设计

## 7.1 可测试性

## 7.2 可维护性

## 7.3 可靠性

# 8 性能优化

## 8.1 定频设置

整个AI CORE，AI CUBE CORE，AI VEC CORE使用的是同一个同步时钟源；如下图所示：

![](./a6597188-b2a5-4942-87e9-1080d0f5b998.png)
因此频率设置，可以整体提高性能（在不考虑能耗比的情况下）；

## 

8.2 读/写请求合并

AIC/AIV CORE的SU中有LSU（load、store unit），LSU有诸多特性，待确定store-store / load-load request merging特性是否使能，从而进一步提升总线的有效带宽；

## 

8.3 使能auto-blockify功能

xxx

## 8.4 datalayout convert --- 陈相廷

# 9 性能基线

# 10 Alpha测试设计

## 10.1 用例分析

### 10.1.0 13个高优算子仓

https://wiki.huawei.com/domains/159562/wiki/341728/WIKI2026042110854457?title=2-diffusion-attention-dllm-

### 10.1.1 已有用例分析（7大算子仓）

[https://onebox.huawei.com/v/7d9ac7a1427c3eb97aeefde52b7299ca?type=1&sheet=%E7%9B%AE%E6%A0%87%E4%B8%89%EF%BC%88A5%E7%AE%97%E5%AD%90%E6%B3%9B%E5%8C%96%EF%BC%89](https://onebox.huawei.com/v/7d9ac7a1427c3eb97aeefde52b7299ca?type=1&sheet=%E7%9B%AE%E6%A0%87%E4%B8%89%EF%BC%88A5%E7%AE%97%E5%AD%90%E6%B3%9B%E5%8C%96%EF%BC%89)

10.1.1.1 FlagGems算子仓

（1）addmm、addmm_out：V1->C1 -> V2；无特殊op，默认当前方案支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/addmm.py](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/addmm.py)

（2）baddbmm：C1 -> V1；无特殊op，默认当前方案支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/baddbmm.py](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/baddbmm.py)

（3）baddbmm_backward：V1->C1->V2；存在whileop，当前不支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/baddbmm.py](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/baddbmm.py)

（4）conv1d、conv1d_padding：V1->V2->C1；无特殊op，默认当前方案支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/conv1d.py](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/conv1d.py)

（5）conv2d、conv2d_padding：V1->C1；无特殊op，默认当前方案支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/conv2d.py](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/conv2d.py)

（6）conv3d、conv3d_padding：V1->V2->C1->V3；无特殊op，默认当前方案支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/conv3d.py](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/conv3d.py)

（7）flash_attention_forward：V1->V2->C1->V3->C2->V4->C3->V5->C4->V6；无特殊op，默认当前方案支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/attention.py#L1075](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/attention.py#L1075)

（8）flash_attn_varlen_func：V1->V2->C1->V3->C2->V4->C3->V5->C4->V6；无特殊op，默认当前方案支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/attention.py#L1182](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/attention.py#L1182)

（9）flash_mla：C1->V1->V2->C2；torch + cuda的实现；

[https://github.com/deepseek-ai/FlashMLA/blob/main/flash\_mla/flash\_mla\_interface.py#L53](https://github.com/deepseek-ai/FlashMLA/blob/main/flash_mla/flash_mla_interface.py#L176)

（10）linear：同（1）；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/addmm.py](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/addmm.py)

（11）matmul：V1->C1；无特殊op，默认当前方案支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/bmm.py](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/bmm.py)

（12）mm：V1->C1->V2->C2->V3；无特殊op，默认当前方案支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/mm.py](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/mm.py)

（13）scaled_dot_product_attention：V1->V2->C1>V3->C2->V4；无特殊op，默认当前方案支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/attention.py#L760](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/attention.py#L760)

（14）scaled_dot_product_attention_backward：V1->V2->C1->V3->C2->V4->C3->V5->C4->V6->C5->V7->C6->V8->C7->V9；无特殊op，默认当前方案支持；

[https://github.com/flagos-ai/FlagGems/blob/master/src/flag\_gems/ops/attention.py#L864](https://github.com/flagos-ai/FlagGems/blob/master/src/flag_gems/ops/attention.py#L864)

10.1.1.2 SGLang算子仓

_bmm_chunk_fwd_kernel: V1->C1->V2 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/mamba/ops/ssd\_bmm.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/mamba/ops/ssd_bmm.py)

_chunk_scan_fwd_kernel: V1->V2->C1->V3->V4->C2->V5->V6 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/mamba/ops/ssd\_chunk\_scan.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/mamba/ops/ssd_chunk_scan.py)

_chunked_lora_expand_kernel: V1->V2->C1->V3-V4;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton\_ops/chunked\_sgmv\_expand.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton_ops/chunked_sgmv_expand.py)

_chunked_lora_shrink_kernel:V1->C1->V2 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton\_ops/chunked\_sgmv\_shrink.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton_ops/chunked_sgmv_shrink.py)

_fwd_grouped_kernel_stage1_rope:V1->V2->C1->V3;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/triton\_ops/rocm\_mla\_decode\_rope.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/triton_ops/rocm_mla_decode_rope.py)

_gate_up_lora_b_kernel:V1->C1->C2->V2 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton\_ops/gate\_up\_lora\_b.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton_ops/gate_up_lora_b.py)

_qkv_lora_b_kernel:V1->C1->C2->C3->V2 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton\_ops/qkv\_lora\_b.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton_ops/qkv_lora_b.py)

_sgemm_lora_a_kernel:V1->C1->V2 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton\_ops/sgemm\_lora\_a.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton_ops/sgemm_lora_a.py)

_sgemm_lora_b_kernel:V1->C1->V2->V3 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton\_ops/sgemm\_lora\_b.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/lora/triton_ops/sgemm_lora_a.py)

chunk_fwd_kernel_o:V1->C1->C2->V2 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/chunk\_o.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/chunk_o.py)

chunk_gated_delta_rule_fwd_kernel_h_blockdim64:V1->C1->V2->C2->V3 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/chunk\_delta\_h.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/chunk_delta_h.py)

chunk_kda_scaled_dot_kkt_fwd_kernel_intra_sub_inter:V1->C1->C2->V2->v3 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/kda.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/kda.py)

chunk_local_cumsum_vector_kernel:V1->C1->V2 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/cumsum.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/cumsum.py)

chunk_scaled_dot_kkt_fwd_kernel:V1->C1->V2->V3 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/chunk\_scaled\_dot\_kkt.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/chunk_scaled_dot_kkt.py)

fp8_gemm_group_triton_kernel:V1->C1->V2->V3->C2->V4 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/benchmark/kernels/deepseek/benchmark\_deepgemm\_fp8\_group\_gemm.py](https://github.com/sgl-project/sglang/blob/main/benchmark/kernels/deepseek/benchmark_deepgemm_fp8_group_gemm.py)

fused_moe_kernel:V1->V2->C1->V3->V4;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/moe/fused\_moe\_triton/fused\_moe\_triton\_kernels.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/moe/fused_moe_triton/fused_moe_triton_kernels.py)

fused_moe_kernel_gptq_awq:V1->V2->C1->V3->V4;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/moe/fused\_moe\_triton/fused\_moe\_triton\_kernels.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/moe/fused_moe_triton/fused_moe_triton_kernels.py)

fused_moe_router_tensorcore_kernel:V1->C1->V2->V3 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/moe/router.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/moe/router.py)

merge_16x16_to_32x32_inverse_kernel:V1->C1->V2 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/solve\_tril.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/solve_tril.py)

merge_16x16_to_64x64_inverse_kernel:V1->C1->V2 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/solve\_tril.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/solve_tril.py)

recompute_w_u_fwd_kernel:V1->C1->V2 ;无特殊op，默认当前方案支持；

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/wy\_fast.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/wy_fast.py)

[https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/kda.py](https://github.com/sgl-project/sglang/blob/main/python/sglang/srt/layers/attention/fla/kda.py)

10.1.1.3 vLLM算子仓

_bmm_chunk_fwd_kernel：V1->C1->V2 ;无特殊op，默认当前方案支持；

[https://github.com/vllm-proje ct/vllm/blob/main/vllm/model\_executor/layers/mamba/ops/ssd\_bmm.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/mamba/ops/ssd_bmm.py)

_chunk_scan_fwd_kernel ：V1->V2->C1->V3->C2->V4 ;无特殊op，默认当前方案支持；

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/mamba/ops/ssd\_chunk\_scan.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/mamba/ops/ssd_chunk_scan.py)

_chunk_state_fwd_kernel:V1->C1->V2 ;无特殊op，默认当前方案支持；

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/mamba/ops/ssd\_chunk\_state.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/mamba/ops/ssd_chunk_state.py)

_chunk_state_varlen_kernel

好像被删除了

_fwd_diag_kernel:V1->V2->C1->C2->V3 ;无特殊op，默认当前方案支持；

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/lightning\_attn.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/lightning_attn.py)

_fwd_grouped_kernel_stage1:V1->V2->C1->V3->C2->V4->C3->V5 ;无特殊op，默认当前方案支持；

[https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/triton\_decode\_attention.py](https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/triton_decode_attention.py)

_fwd_kernel:V1->V2->C1->V3->C2->V4 ;无特殊op，默认当前方案支持；

[https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/triton\_prefill\_attention.py](https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/triton_prefill_attention.py)

[https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/prefix\_prefill.py](https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/prefix_prefill.py)

_fwd_kernel_alibi:V1->V2->C1->V3->C2->V4->C3->V5;无特殊op，默认当前方案支持；

[https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/prefix\_prefill.py](https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/prefix_prefill.py)

_fwd_kv_parallel:V1->C1->V2 ;无特殊op，默认当前方案支持；

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/lightning\_attn.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/lightning_attn.py)

_fwd_none_diag_kernel:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/lightning\_attn.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/lightning_attn.py)

w8a8_block_int8_matmul:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/quantization/utils/int8\_utils.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/quantization/utils/int8_utils.py)

_w8a8_triton_block_scaled_mm:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/quantization/utils/fp8\_utils.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/quantization/utils/fp8_utils.py)

awq_gemm_kernel:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/quantization/awq\_triton.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/quantization/awq_triton.py)

batched_triton_kernell:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/fused\_moe/fused\_batched\_moe.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/fused_moe/fused_batched_moe.py)

bmm_kernel:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/batch\_invariant.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/batch_invariant.py)

chunk_fwd_kernel_o:V1->V2->C1->V3->C2->V4 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/fla/ops/chunk\_o.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/fla/ops/chunk_o.py)

chunk_gated_delta_rule_fwd_kernel_h_blockdim64:V1->V2->C1->V3->C2->V4 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/fla/ops/chunk\_delta\_h.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/fla/ops/chunk_delta_h.py)

chunk_gla_fwd_kernel_o:V1->V2->C1->V3->C2->V4 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/fla/ops/kda.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/fla/ops/kda.py)

chunk_kda_scaled_dot_kkt_fwd_kernel_intra_sub_inter:V1->V2->C1->V3->C2->V4 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/fla/ops/kda.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/fla/ops/kda.py)

chunk_local_cumsum_vector_kernel:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/fla/ops/cumsum.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/fla/ops/cumsum.py)

chunk_scaled_dot_kkt_fwd_kernel:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/fla/ops/chunk\_scaled\_dot\_kkt.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/fla/ops/chunk_scaled_dot_kkt.py)

fused_moe_kernel:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/lora/layers/fused\_moe.py](https://github.com/vllm-project/vllm/blob/main/vllm/lora/layers/fused_moe.py)

fused_moe_kernel_gptq_awq:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/lora/layers/fused\_moe.py](https://github.com/vllm-project/vllm/blob/main/vllm/lora/layers/fused_moe.py)

kernel_paged_attention_2d:V1->V2->C1->V3->C2->V4 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/chunked\_prefill\_paged\_decode.py](https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/chunked_prefill_paged_decode.py)

kernel_unified_attention_2d:V1->V2->C1->V3->C2->V4 ;​**出现while op**​，当前方案不支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/triton\_unified\_attention.py](https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/triton_unified_attention.py)

kernel_unified_attention_3d:V1->V2->C1->V3->C2->V4 ;​**出现while op**​，当前方案不支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/triton\_unified\_attention.py](https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/triton_unified_attention.py)

matmul_kernel_persistent:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/batch\_invariant.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/batch_invariant.py)

merge_16x16_to_32x32_inverse_kernel：V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/fla/ops/solve\_tril.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/fla/ops/solve_tril.py)

merge_16x16_to_64x64_inverse_kernel：V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/fla/ops/solve\_tril.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/fla/ops/solve_tril.py)

recompute_w_u_fwd_kernel:V1->V2->C1->V3->C2->V4 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/fla/ops/kda.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/fla/ops/kda.py)

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/fla/ops/wy\_fast.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/fla/ops/wy_fast.py)

scaled_mm_kernel:V1->V2->C1->V3 ;无特殊op，默认当前方案支持;

[https://github.com/vllm-project/vllm/blob/main/vllm/model\_executor/layers/quantization/compressed\_tensors/triton\_scaled\_mm.py](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/quantization/compressed_tensors/triton_scaled_mm.py)

10.1.1.4 FBGEMM算子仓

_kernel_matmul_fp8_row: V1->C1->V2 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/experimental/gemm/triton\_gemm/fp8\_gemm.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/experimental/gemm/triton_gemm/fp8_gemm.py)

_kernel_matmul_fp8_row_no_fast_acc: V1->C1->V2 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/experimental/gemm/triton\_gemm/fp8\_gemm.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/experimental/gemm/triton_gemm/fp8_gemm.py)

_kernel_matmul_fp8_row_imprecise_acc: V1->C1->V2 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/experimental/gemm/triton\_gemm/fp8\_gemm.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/experimental/gemm/triton_gemm/fp8_gemm.py)

_kernel_matmul_fp8_block_fastacc: V1->C1->V2 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/experimental/gemm/triton\_gemm/fp8\_gemm.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/experimental/gemm/triton_gemm/fp8_gemm.py)

_kernel_matmul_fp8_block_slowacc: V1->C1->V2 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/experimental/gemm/triton\_gemm/fp8\_gemm.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/experimental/gemm/triton_gemm/fp8_gemm.py)

_kernel_matmul_fp8_row_non_persistent: V1->C1->V2 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/experimental/gemm/triton\_gemm/fp8\_gemm.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/experimental/gemm/triton_gemm/fp8_gemm.py)

_fbgemm_grouped_gemm: V1->C1->V2 ; 存在 while op，当前不支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/experimental/gemm/triton\_gemm/grouped\_gemm.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/experimental/gemm/triton_gemm/grouped_gemm.py)

_fbgemm_grouped_gemm_fp8_rowwise: V1->C1->V2 ; 存在 while op，当前不支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/experimental/gemm/triton\_gemm/grouped\_gemm.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/experimental/gemm/triton_gemm/grouped_gemm.py)

_kernel_dequantize_mx4: V1 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/triton/quantize.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/triton/quantize.py)

simplicial_bwd_kv1_kernel: V1->C1 / V1->C1->V2->C2->V3->C3（存在 if 条件） ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/experimental/simplicial\_attention/simplicial/ops/triton/bwd.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/experimental/simplicial_attention/simplicial/ops/triton/bwd.py)

simplicial_bwd_kv2q_kernel: V1->C1->V2->C2->V3->C3->V4 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/experimental/simplicial\_attention/simplicial/ops/triton/bwd.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/experimental/simplicial_attention/simplicial/ops/triton/bwd.py)

_gqa_pack_fwd_kernel: C1->V1->C2->V2; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/experimental/simplicial\_attention/simplicial/ops/triton/fwd.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/experimental/simplicial_attention/simplicial/ops/triton/fwd.py)

jagged_dense_bmm_kernel: V1->C1->V2 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/sll/triton/triton\_jagged\_bmm.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/sll/triton/triton_jagged_bmm.py)

jagged_jagged_bmm_kernel: V1->C1->V2 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/sll/triton/triton\_jagged\_bmm.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/sll/triton/triton_jagged_bmm.py)

array_jagged_bmm_kernel: V1->C1->V2 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/sll/triton/triton\_jagged\_bmm\_jagged\_out.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/sll/triton/triton_jagged_bmm_jagged_out.py)

jagged_jagged_bmm_jagged_out_kernel: V1->C1->V2 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/sll/triton/triton\_jagged\_bmm\_jagged\_out.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/sll/triton/triton_jagged_bmm_jagged_out.py)

jagged_dense_flash_attention_fwd_kernel: V1->C1->V2->C2->V3 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/sll/triton/triton\_jagged\_dense\_flash\_attention.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/sll/triton/triton_jagged_dense_flash_attention.py)

_jagged_dense_flash_attention_bwd_dv_db_dq_kernel: V1->C1->V2->C2->V3->C3 ; 存在 while op，当前不支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/sll/triton/triton\_jagged\_dense\_flash\_attention.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/sll/triton/triton_jagged_dense_flash_attention.py)

_jagged_dense_flash_attention_bwd_dk_kernel: V1->C1->V2->C2 ; 存在 while op，当前不支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/sll/triton/triton\_jagged\_dense\_flash\_attention.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/sll/triton/triton_jagged_dense_flash_attention.py)

jagged_flash_attention_basic_kernel: V1->C1->V2->C2->V3 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/sll/triton/triton\_jagged\_flash\_attention\_basic.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/sll/triton/triton_jagged_flash_attention_basic.py)

_jagged_flash_attention_bwd_basic_kernel: V1->C1->V2->C2->V3->C3 ; 存在 while op，当前不支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/sll/triton/triton\_jagged\_flash\_attention\_basic.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/sll/triton/triton_jagged_flash_attention_basic.py)

_multi_head_jagged_flash_attention_fwd_kernel: V1->C1->V2->C2->V3 ; 无特殊 op，默认当前方案支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/sll/triton/triton\_multi\_head\_jagged\_flash\_attention.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/sll/triton/triton_multi_head_jagged_flash_attention.py)

_multi_head_jagged_flash_attention_bwd_kernel: V1->C1->V2->C2->V3->C3->V4->C4->V5->C5->V6->C6 ; 存在 while op，当前不支持；

[https://github.com/pytorch/FBGEMM/blob/main/fbgemm\_gpu/fbgemm\_gpu/sll/triton/triton\_multi\_head\_jagged\_flash\_attention.py](https://github.com/pytorch/FBGEMM/blob/main/fbgemm_gpu/fbgemm_gpu/sll/triton/triton_multi_head_jagged_flash_attention.py)

10.1.1.5 Liger-Kernel 算子仓

_fused_neighborhood_attention_av_kernel: V1->V2->C1->V3；无特殊 op，默认当前方案支持；

[https://github.com/linkedin/Liger-Kernel/blob/main/src/liger\_kernel/ops/fused\_neighborhood\_attention.py](https://github.com/linkedin/Liger-Kernel/blob/main/src/liger_kernel/ops/fused_neighborhood_attention.py)

_fused_neighborhood_attention_grad_attn_kernel: V1->V2->C1->V3；无特殊 op，默认当前方案支持；

[https://github.com/linkedin/Liger-Kernel/blob/main/src/liger\_kernel/ops/fused\_neighborhood\_attention.py](https://github.com/linkedin/Liger-Kernel/blob/main/src/liger_kernel/ops/fused_neighborhood_attention.py)

_fused_neighborhood_attention_grad_k_kernel: V1->V2->C1->V3；无特殊 op，默认当前方案支持；

[https://github.com/linkedin/Liger-Kernel/blob/main/src/liger\_kernel/ops/fused\_neighborhood\_attention.py](https://github.com/linkedin/Liger-Kernel/blob/main/src/liger_kernel/ops/fused_neighborhood_attention.py)

_fused_neighborhood_attention_grad_qk_kernel: V1->V2->C1->V3；无特殊 op，默认当前方案支持；

[https://github.com/linkedin/Liger-Kernel/blob/main/src/liger\_kernel/ops/fused\_neighborhood\_attention.py](https://github.com/linkedin/Liger-Kernel/blob/main/src/liger_kernel/ops/fused_neighborhood_attention.py)

_fused_neighborhood_attention_grad_v_kernel: V1->V2->C1->V3；无特殊 op，默认当前方案支持；

[https://github.com/linkedin/Liger-Kernel/blob/main/src/liger\_kernel/ops/fused\_neighborhood\_attention.py](https://github.com/linkedin/Liger-Kernel/blob/main/src/liger_kernel/ops/fused_neighborhood_attention.py)

_fused_neighborhood_attention_qk_kernel: V1->V2->C1->V3；无特殊 op，默认当前方案支持；

[https://github.com/linkedin/Liger-Kernel/blob/main/src/liger\_kernel/ops/fused\_neighborhood\_attention.py](https://github.com/linkedin/Liger-Kernel/blob/main/src/liger_kernel/ops/fused_neighborhood_attention.py)

matmul_kernal: V1->V2->C1->V3->V4；无特殊 op，默认当前方案支持；

[https://github.com/linkedin/Liger-Kernel/blob/main/src/liger\_kernel/ops/experimental/mm\_int8int2.py](https://github.com/linkedin/Liger-Kernel/blob/main/src/liger_kernel/ops/experimental/mm_int8int2.py)

10.1.1.6 verl 算子仓

efficient_entropy_kernel_general_mainloop: V1->V2->C1->V3->V4；无特殊 op，默认当前方案支持；

[https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py](https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py)

efficient_entropy_triton_kernel_epilogue: V1->V2->V3；无特殊 op，默认当前方案支持；

[https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py](https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py)

efficient_entropy_triton_kernel_epilogue_tp: V1->V2->V3；无特殊 op，默认当前方案支持；

[https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py](https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py)

efficient_entropy_triton_epilogue_tp_update: V1->V2->V3；无特殊 op，默认当前方案支持；

[https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py](https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py)

efficient_entropy_backward_kernel_general_mainloop_MN: V1->V2->C1->V3->V4->C2->V5->C3->V6；无特殊 op，默认当前方案支持；

[https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py](https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py)

efficient_entropy_backward_kernel_d_hidden: V1->V2->C1->V3->V4->C2->V5；无特殊 op，默认当前方案支持；

[https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py](https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py)

efficient_entropy_backward_kernel_d_weight: V1->V2->C1->V3；无特殊 op，默认当前方案支持；

[https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py](https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py)

efficient_entropy_backward_kernel_general_d_logits: V1->V2->C1->V3->V4；无特殊 op，默认当前方案支持；

[https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py](https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py)

efficient_entropy_backward_kernel_general_d_logits_split_N: V1->V2->C1->V3->V4；无特殊 op，默认当前方案支持；

[https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py](https://github.com/volcengine/verl/blob/main/verl/utils/kernel/kernels.py)

10.1.1.7 mojo 算子仓

test_paged_prefill_gqa: V1->C1->V2->C2；torch+cuda实现

[https://github.com/XPU-Forces/mojo\_opset/blob/master/mojo\_opset/tests/accuracy/operators/test\_attention.py](https://github.com/XPU-Forces/mojo_opset/blob/master/mojo_opset/tests/accuracy/operators/test_attention)

test_sdpa: V1->C1->V2->C2->V3；torch+cuda实现

[https://github.com/XPU-Forces/mojo\_opset/blob/master/mojo\_opset/tests/accuracy/operators/test\_attention.py](https://github.com/XPU-Forces/mojo_opset/blob/master/mojo_opset/tests/accuracy/operators/test_attention.py)

test_group_gemm: C1->V1；torch+cuda实现

[https://github.com/XPU-Forces/mojo\_opset/blob/master/mojo\_opset/tests/accuracy/operators/test\_gemm.py](https://github.com/XPU-Forces/mojo_opset/blob/master/mojo_opset/tests/accuracy/operators/test_gemm.py)

### 10.1.2 新增用例设计

## 10.2计算块划分用例设计

### 10.2.1 独立的 Cube 计算与指令交错

​**场景描述**​：包含两组完全没有数据依赖的矩阵乘法（Cube）和一组完全独立的 Vector 计算。在输入 IR 中，这些指令是穿插交错的。

​**预期行为**​：因为两组 `tt.dot` 没有数据依赖，它们将被划分到两个不同的 Cube Block 中；独立的 Vector 计算被划分到单独的 Vector Block；最后基于 `block_id` 进行指令重排。

**输入**

**输出**

### 10.2.2 跨越边界的隔离

​**场景描述**​：计算图存在 `Vector -> Cube -> Vector` 以及 `Cube -> Vector -> Cube` 的依赖链。

​**预期行为**​：由于边界的存在，前面的 Vector 不会和后面的 Vector 融合在一起；同理，前面的 Cube 也不会和后面的 Cube 融合在一起。

**输入**

**输出**

### 10.2.3 控制流与多返回值

​**场景描述**​：使用了 `scf.if`，且根据控制流会返回两个 Tensor。其中第一个返回值后续用于 Matrix Multiplication（Cube类型），第二个返回值后续参与普通的加法运算（Vector类型）。

​**预期行为**​：`scf.if` 本身被分配单独的 `block_id`。它的多返回值分别被追踪到外部的 Cube 和 Vector op，因此它的 `ssbuffer.core_type` 为以逗号分隔的数组形态。内部区域也是 MLIR Block 级别的独立划分。

**输入：**

**输出：**

**10.3**

## **10.4 计算&访存分离用例设计**

### 10.4.1 测试覆盖场景

| TC   | 测试点                                                | 覆盖函数/步骤                      |
| ------ | ------------------------------------------------------- | ------------------------------------ |
| TC01 | GM加载需标记 - 馈入Cube计算需打标记                   | isLoadOp需返回true                 |
| TC02 | MASK不标记 - element-wise操作的mask不馈入Cube，不标记 | isMaskProcessingOp检查             |
| TC03 | 元数据不标记 - memref.load读取的scalar metadata不标记 | isLoadOp检查                       |
| TC04 | 非线性不标记 - 地址无法线性投影的iter_arg不标记      | isLinearAndPredictable检查         |
| TC05 | RAW读回不标记 - dQ等RAW依赖的readback不标记           | isRaw返回true                      |
| TC06 | 基础双 Buffer，外层 Q                                 | Step 1\~6，collectMarkedLoads      |
| TC07 | 无标记不变换                                          | collectMarkedLoads early return    |
| TC08 | trip count ≤ depth 不变换                            | getConstantTripCount 检查          |
| TC09 | 无 AllocOp 不变换                                     | collectMarkedLoads foundAlloc 检查 |
| TC10 | 原始 iter_args 保留且扩展                            | Step 2 newIterInits 构建           |
| TC11 | 线性 iter_arg 投影（Fix 3）                          | Step 3 getLinearIterArgDelta       |
| TC12 | 多 load 同组（K+V 共享 counter）                      | mergeChains，同组 Producer         |
| TC13 | 三 Buffer（depth=3）                                  | transformFor depth 参数化          |
| TC14 | Dead DMA 消除（Q copy 消除）                          | computeSkipInConsumer              |
| TC15 | Dead iter_arg 消除（k_ctr 消除）                    | pruneDeadIterArgs                  |

### 10.4.2 Load读取识别模块UT

#### 10.4.2.1 GM加载需标记 - 馈入Cube计算需打标记

- 馈入 `linalg.matmul`（Cube 计算）
- 数据来源于 GM（通过 `memref.reinterpret_cast` + `memref.copy` 从 `%argX` 加载）
- 线性可投影: `bufferization.to_tensor` → 追踪 `memref.copy` → 追踪 `memref.reinterpret_cast` 的 offset/sizes 参数为线性

```markup
// RUN: triton-opt --async-load-hoisting %s | FileCheck %s

// CHECK-LABEL: func.func @test_gm_load_cube_marked
// Test 1: GM loads feeding Cube compute should be marked
// GM加载需标记 - 馈入Cube计算的bufferization.to_tensor需打标记
func.func @test_gm_load_cube_marked(
  %arg2: memref<?xf16> {tt.divisibility = 16 : i32, tt.tensor_kind = 0 : i32},
  %arg3: memref<?xf16> {tt.divisibility = 16 : i32, tt.tensor_kind = 0 : i32},
  %arg4: tensor<128x128xf16>,
  %arg5: tensor<128x128xf32>
) {
  %c0_i32 = arith.constant 0 : i32
  %c8192_i32 = arith.constant 8192 : i32
  %c128_i32 = arith.constant 128 : i32
  %c128 = arith.constant 128 : index
  %c0 = arith.constant 0 : index

  // Create bufferization.to_tensor feeding linalg.matmul
  %reinterpret_cast = memref.reinterpret_cast %arg2 to offset: [%c0], sizes: [128, 128], strides: [128, 1] {ssbuffer.block_id = 0 : i32} : memref<?xf16> to memref<128x128xf16, strided<[128, 1], offset: ?>>
  %alloc = memref.alloc() {ssbuffer.block_id = 0 : i32} : memref<128x128xf16>
  memref.copy %reinterpret_cast, %alloc {ssbuffer.block_id = 0 : i32} : memref<128x128xf16, strided<[128, 1], offset: ?>> to memref<128x128xf16>

  // CHECK: bufferization.to_tensor
  // CHECK-SAME: gm_load_bufferable
  %to_tensor = bufferization.to_tensor %alloc restrict writable {ssbuffer.block_id = 0 : i32} : memref<128x128xf16>

  %transposed = linalg.transpose ins(%to_tensor : tensor<128x128xf16>) outs(%4 : tensor<128x128xf16>) permutation = [1, 0] {ssbuffer.block_id = 0 : i32}
  %matmul = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 0 : i32} ins(%arg4, %transposed : tensor<128x128xf16>, tensor<128x128xf16>) outs(%arg5 : tensor<128x128xf32>) -> tensor<128x128xf32>

  return
}
```

#### 10.4.2.2 MASK不标记 - element-wise操作的mask不馈入Cube，不标记

读取出来的值用于 `broadcast`、`arith.cmpf`、`arith.select` 等，不直接馈入 Cube时，不打标记

```markup
// RUN: triton-opt --async-load-hoisting %s | FileCheck %s

// CHECK-LABEL: func.func @test_mask_not_marked
// Test 2: MASK operations (element-wise) should NOT be marked
// MASK不标记 - element-wise操作的mask不馈入Cube，不标记
func.func @test_mask_not_marked(
  %arg0: tensor<128x128xf32>,
  %arg1: tensor<128x128xf32>
) {
  %c0 = arith.constant 0.0 : f32

  // Create mask value via arith.cmpf (mask processing op)
  %cmp = arith.cmpf ogt, %arg0, %arg1 : tensor<128x128xf32>

  // Create broadcast (mask processing op)
  %broadcast = linalg.broadcast ins(%cmp : tensor<128x128xf32>) outs(%arg0 : tensor<128x128xf32>) dimensions = [1]

  // CHECK-NOT: gm_load_bufferable
  // mask processing ops should NOT have gm_load_bufferable
  %fill = linalg.fill ins(%c0 : f32) outs(%arg0 : tensor<128x128xf32>) -> tensor<128x128xf32>

  return
}
// RUN: triton-opt --async-load-hoisting %s | FileCheck %s
```

#### 10.4.2.3  元数据不标记 - memref.load读取的scalar metadata不标记

```markup
// CHECK-LABEL: func.func @test_metadata_not_marked
// Test 3: Scalar metadata loads should NOT be marked
// 元数据不标记 - memref.load读取的scalar metadata不标记
func.func @test_metadata_not_marked(
  %arg0: memref<1024xf16>,
  %arg1: index
) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index

  // memref.load with constant indices (scalar metadata)
  // CHECK-NOT: gm_load_bufferable
  %loaded = memref.load %arg0[%c0] : memref<1024xf16>

  // Variable index load - this one CAN be marked
  %var_loaded = memref.load %arg0[%arg1] : memref<1024xf16>

  return
}
```

#### 10.4.2.4 非线性不标记 - 地址无法线性投影的iter_arg不标记

```markup
// RUN: triton-opt --async-load-hoisting %s | FileCheck %s

// CHECK-LABEL: func.func @test_nonlinear_not_marked
// Test 4: Non-linear address calculations should NOT be marked
// 非线性不标记 - 地址无法线性投影的iter_arg不标记
func.func @test_nonlinear_not_marked(
  %arg0: memref<?xf16> {tt.divisibility = 16 : i32, tt.tensor_kind = 0 : i32}
) {
  %c0_i32 = arith.constant 0 : i32
  %c1024_i32 = arith.constant 1024 : i32
  %c128_i32 = arith.constant 128 : i32

  // Non-linear: reinterpret_cast with offset from scf.for iter_arg
  // The iter_arg is updated by memref.load inside the loop (non-linear)
  scf.for %i = %c0_i32 to %c1024_i32 step %c128_i32 iter_args(%iter = %c0_i32) -> i32 {
    // iter_arg depends on memref.load (non-linear pattern)
    %next = memref.load %arg0[%i] : memref<?xf16>
    %addr = arith.index_cast %next : index to i32
    %iter_next = arith.addi %iter, %addr : i32

    // CHECK-NOT: gm_load_bufferable
    // Non-linear address calculation should NOT be marked
    scf.yield %iter_next : i32
  }

  return
}
```

#### 10.4.2.5 RAW读回不标记 - dQ等RAW依赖的readback不标记

```markup
// RUN: triton-opt --async-load-hoisting %s | FileCheck %s

// CHECK-LABEL: func.func @test_raw_readback_not_marked
// Test 5: RAW readback dependencies should NOT be marked
// RAW读回不标记 - dQ等RAW依赖的readback不标记
func.func @test_raw_readback_not_marked(
  %arg0: memref<?xf16> {tt.divisibility = 16 : i32, tt.tensor_kind = 0 : i32}
) {
  %c0 = arith.constant 0 : index
  %c128 = arith.constant 128 : index

  // memref.copy from GM
  %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%c0], sizes: [128, 128], strides: [128, 1] {ssbuffer.block_id = 0 : i32} : memref<?xf16> to memref<128x128xf16, strided<[128, 1], offset: ?>>
  %alloc = memref.alloc() {ssbuffer.block_id = 0 : i32} : memref<128x128xf16>
  memref.copy %reinterpret_cast, %alloc {ssbuffer.block_id = 0 : i32} : memref<128x128xf16, strided<[128, 1], offset: ?>> to memref<128x128xf16>

  // RAW readback: reading the destination of memref.copy
  // This should NOT be marked as gm_load_bufferable
  %to_tensor = bufferization.to_tensor %alloc restrict writable {ssbuffer.block_id = 0 : i32} : memref<128x128xf16>

  // If this to_tensor feeds into a store that writes back to GM,
  // it's a RAW dependency and should NOT be marked

  return
}
```

### 10.4.3 多buffer数据加载模块UT

#### 10.4.3.1 基础双 Buffer 变换（FA Q Load，depth=2）

​**测试目的**​：验证外层循环中单个 Q Load（带 `gm_load_bufferable` 标记）能被正确改写为双 Buffer 结构，检验 Step 1（buffer slot 分配）、Step 2（iter_args 扩展）、Step 3（Producer）、Step 4（Consumer select）的核心路径。

```makeup
// RUN: triton-opt --gm-load-multi-buffer %s | FileCheck %s

module {
  func.func @tc01_q_double_buffer(
      %arg2: memref<?xf16>,   // Q 全局内存
      %arg3: memref<?xf16>,   // K 全局内存
      %arg13: i32,            // 当前核的起始 tile（simd 并行 offset）
      %arg9: i32)             // num_kv_heads
  {
    %c28_i32  = arith.constant 28 : i32
    %c65536_i32 = arith.constant 65536 : i32
    %c128_i32 = arith.constant 128 : i32
    %c8192_i32  = arith.constant 8192 : i32
    %c64_i32  = arith.constant 64 : i32
    %c8_i32   = arith.constant 8 : i32
    %c0_i32   = arith.constant 0 : i32
    %c1048576_i64 = arith.constant 1048576 : i64
    %c8388608_i64 = arith.constant 8388608 : i64
    %c128     = arith.constant 128 : index
    %acc_init = tensor.empty() : tensor<128x128xf32>
    %acc_zero = linalg.fill ins(%c0_i32 : i32) outs(%acc_init : tensor<128x128xf32>)
                            -> tensor<128x128xf32>

    // 外层 Q-tile 循环，无原始 iter_args
    scf.for %arg16 = %arg13 to %c65536_i32 step %c28_i32 : i32 {
      // ── Q Load chain（带 gm_load_bufferable 标记）────────────────────
      %flat_head  = arith.divsi %arg16, %c64_i32 : i32
      %seq_tile   = arith.remsi %arg16, %c64_i32 : i32
      %batch_idx  = arith.divsi %flat_head, %c8_i32 : i32
      %head_idx   = arith.remsi %flat_head, %c8_i32 : i32
      %batch_ext  = arith.extsi %batch_idx : i32 to i64
      %batch_off  = arith.muli %batch_ext, %c8388608_i64 : i64
      %head_ext   = arith.extsi %head_idx : i32 to i64
      %head_off   = arith.muli %head_ext, %c1048576_i64 : i64
      %bh_off     = arith.addi %batch_off, %head_off : i64
      %bh_idx     = arith.index_cast %bh_off : i64 to index
      %seq_rows   = arith.muli %seq_tile, %c128_i32 : i32
      %seq_clamp  = arith.maxsi %seq_rows, %c0_i32 : i32
      %seq_idx    = arith.index_cast %seq_clamp : i32 to index
      %row_off    = arith.muli %seq_idx, %c128 : index
      %q_gm_off   = arith.addi %row_off, %bh_idx : index
      %q_src_rc   = memref.reinterpret_cast %arg2 to offset: [%q_gm_off],
                    sizes: [128, 128], strides: [128, 1]
                    : memref<?xf16> to memref<128x128xf16, strided<[128, 1], offset: ?>>
      %q_alloc    = memref.alloc() : memref<128x128xf16>
      memref.copy %q_src_rc, %q_alloc
                  : memref<128x128xf16, strided<[128, 1], offset: ?>> to memref<128x128xf16>
      %q_tensor   = bufferization.to_tensor %q_alloc restrict writable
                    {gm_load_bufferable} : memref<128x128xf16>

      // ── K Load（无标记）+ 计算 ────────────────────────────────────────
      %kv_head    = arith.muli %head_idx, %arg9 : i32
      %kv_head_idx = arith.divsi %kv_head, %c8_i32 : i32
      %kv_batch_ext = arith.extsi %batch_idx : i32 to i64
      %kv_b_off   = arith.muli %kv_batch_ext, %c8388608_i64 : i64
      %kv_h_ext   = arith.extsi %kv_head_idx : i32 to i64
      %kv_h_off   = arith.muli %kv_h_ext, %c1048576_i64 : i64
      %kv_bh_off  = arith.addi %kv_b_off, %kv_h_off : i64
      %kv_base    = arith.index_cast %kv_bh_off : i64 to index
      %k_counter_init = arith.constant 0 : i32
      %v_counter_init = arith.constant 0 : i32
      %inner:2 = scf.for %arg17 = %c0_i32 to %c8192_i32 step %c128_i32
                          iter_args(%k_ctr = %k_counter_init,
                                    %v_ctr = %v_counter_init)
                          -> (i32, i32) : i32 {
        %k_row      = arith.index_cast %k_ctr : i32 to index
        %k_row_off  = arith.muli %k_row, %c128 : index
        %k_gm_off   = arith.addi %k_row_off, %kv_base : index
        %k_src_rc   = memref.reinterpret_cast %arg3 to offset: [%k_gm_off],
                      sizes: [128, 128], strides: [128, 1]
                      : memref<?xf16> to memref<128x128xf16, strided<[128, 1], offset: ?>>
        %k_alloc    = memref.alloc() : memref<128x128xf16>
        memref.copy %k_src_rc, %k_alloc
                    : memref<128x128xf16, strided<[128, 1], offset: ?>> to memref<128x128xf16>
        %k_tensor   = bufferization.to_tensor %k_alloc restrict writable
                      : memref<128x128xf16>   // 无 gm_load_bufferable
        %k_T_buf    = tensor.empty() : tensor<128x128xf16>
        %k_trans    = linalg.transpose ins(%k_tensor : tensor<128x128xf16>)
                      outs(%k_T_buf : tensor<128x128xf16>) permutation = [1, 0]
        %qk_out     = linalg.matmul ins(%q_tensor, %k_trans
                                        : tensor<128x128xf16>, tensor<128x128xf16>)
                      outs(%acc_zero : tensor<128x128xf32>) -> tensor<128x128xf32>
        %k_ctr_next = arith.addi %k_ctr, %c128_i32 : i32
        %v_ctr_next = arith.addi %v_ctr, %c128_i32 : i32
        scf.yield %k_ctr_next, %v_ctr_next : i32, i32
      }
    }
    return
  }
}
```

​**FileCheck 验证点**​：

```makeup
// ── Step 1：循环外 Q buffer slots ─────────────────────────────────────
// CHECK:      %[[Q_SLOT0:.*]] = memref.alloc() : memref<128x128xf16>
// CHECK-NEXT: %[[Q_SLOT1:.*]] = memref.alloc() : memref<128x128xf16>

// ── Step 2：iter_args 扩展（原始 0 → 新增 4 个控制 arg）─────────────
// CHECK:      scf.for %[[IV:.*]] = {{.*}} iter_args(
// CHECK-SAME:     %[[F0:.*]] = %false, %[[F1:.*]] = %false,
// CHECK-SAME:     %[[PROD:.*]] = %c0, %[[CONS:.*]] = %c0)
// CHECK-SAME:     -> (i1, i1, index, index)

// ── Step 3：tripCount = ceildivui((ub - lb), step) ─────────────────
// CHECK:      %[[RANGE:.*]]      = arith.subi {{.*}} : index
// CHECK:      %[[TRIP_COUNT:.*]] = arith.ceildivui %[[RANGE]], {{.*}} : index

// ── Step 3：Producer slot0 —— scf.if (flag0==false AND prod<N) ──────
// CHECK:      %[[P0_EMPTY:.*]] = arith.cmpi eq, %[[F0]], %false
// CHECK:      %[[P0_HASMORE:.*]] = arith.cmpi ult, %[[PROD]], %[[TRIP_COUNT]]
// CHECK:      %[[P0_COND:.*]] = arith.andi %[[P0_EMPTY]], %[[P0_HASMORE]]
// CHECK:      %[[P0_RES:.*]]:2 = scf.if %[[P0_COND]] -> (i1, index)
// ── IV 投影：virt_iv = lb + prod * step ──────────────────────────────
// CHECK:        arith.muli {{.*}}, {{.*}} : i32   // prod * step（i32）
// CHECK:        arith.addi {{.*}}, {{.*}} : i32   // lb + prod*step
// ── 写入 slot0 ────────────────────────────────────────────────────────
// CHECK:        memref.copy {{.*}}, %[[Q_SLOT0]]
// CHECK:        scf.yield %true, {{.*}} : i1, index

// ── Step 3：Producer slot1 —— 类似 slot0，写入 slot1 ────────────────
// CHECK:      scf.if {{.*}} -> (i1, index)
// CHECK:        memref.copy {{.*}}, %[[Q_SLOT1]]

// ── Step 4：Consumer —— remui + select ──────────────────────────────
// CHECK:      %[[TARGET:.*]] = arith.remui %[[CONS]], %c2
// CHECK:      %[[Q0_T:.*]] = bufferization.to_tensor %[[Q_SLOT0]] restrict writable
// CHECK:      %[[Q1_T:.*]] = bufferization.to_tensor %[[Q_SLOT1]] restrict writable
// CHECK:      %[[EQ0:.*]] = arith.cmpi eq, %[[TARGET]], %c0
// CHECK:      %[[Q_SEL:.*]] = arith.select %[[EQ0]], %[[Q0_T]], %[[Q1_T]]

// ── Step 4：Flag clearing ────────────────────────────────────────────
// CHECK:      %[[F0_CLR:.*]] = scf.if {{.*}} -> (i1)
// CHECK:        scf.yield %false : i1
// CHECK:      %[[F1_CLR:.*]] = scf.if {{.*}} -> (i1)
// CHECK:        scf.yield %false : i1

// ── Step 5：Consumer body 中 Q 的 memref.copy 已消除 ─────────────────
// CHECK:      linalg.matmul ins(%[[Q_SEL]], {{.*}})
// CHECK-NOT:  memref.copy {{.*}}, %[[Q_SLOT0]]  // 不在 consumer body 内
// CHECK-NOT:  memref.copy {{.*}}, %[[Q_SLOT1]]

// ── Step 6：yield 包含 4 个控制 arg ──────────────────────────────────
// CHECK:      scf.yield %[[F0_CLR]], %[[F1_CLR]], {{.*}}, {{.*}}
//             : i1, i1, index, index

// ── Step 8：原始 0 iter_arg → 无 dead iter_arg 可消除 ────────────────
// (K_counter 和 V_counter 在内层循环，外层无 iter_args 需要消除)
```

#### 10.4.3.2 无 `gm_load_bufferable` 标记 → Pass-through

​**测试目的**​：验证 `bufferization.to_tensor` 缺少 `gm_load_bufferable` 属性时 Pass 不做任何变换，保留原始 IR 不变。对应 `collectMarkedLoads` 中 `!op->hasAttr(kBufferableMarker)` 的跳过逻辑。

```makeup
// RUN: triton-opt --gm-load-multi-buffer %s | FileCheck %s --check-prefix=PASSTHRU

module {
  func.func @tc02_no_marker(%arg2: memref<?xf16>, %arg13: i32) {
    %c28_i32  = arith.constant 28 : i32
    %c65536_i32 = arith.constant 65536 : i32
    %c128_i32 = arith.constant 128 : i32
    %c0_i32   = arith.constant 0 : i32
    %c128     = arith.constant 128 : index

    scf.for %arg16 = %arg13 to %c65536_i32 step %c28_i32 : i32 {
      %iv_idx   = arith.index_cast %arg16 : i32 to index
      %row_off  = arith.muli %iv_idx, %c128 : index
      %q_src_rc = memref.reinterpret_cast %arg2 to offset: [%row_off],
                  sizes: [128, 128], strides: [128, 1]
                  : memref<?xf16> to memref<128x128xf16, strided<[128, 1], offset: ?>>
      %q_alloc  = memref.alloc() : memref<128x128xf16>
      memref.copy %q_src_rc, %q_alloc
                  : memref<128x128xf16, strided<[128, 1], offset: ?>> to memref<128x128xf16>
      // 无 gm_load_bufferable，不应被 buffer
      %q_tensor = bufferization.to_tensor %q_alloc restrict writable
                  : memref<128x128xf16>
    }
    return
  }
}
```

​**FileCheck 验证点**​：

```makeup
// PASSTHRU-NOT: iter_args(%{{.*}} = %false
// PASSTHRU-NOT: arith.remui
// PASSTHRU-NOT: arith.ceildivui
// PASSTHRU:     scf.for %{{.*}} = {{.*}} to {{.*}} step {{.*}} : i32 {
// PASSTHRU-NOT: scf.for {{.*}} iter_args
// PASSTHRU:     bufferization.to_tensor %{{.*}} restrict writable
// PASSTHRU-NOT: arith.select
```

#### 10.4.3.3 trip count ≤ depth → 不做变换

​**测试目的**​：验证当循环 trip count（编译期已知）≤ `bufferDepth` 时，Pass 正确跳过该循环（预填充无意义）。对应 `collectMarkedLoads` 中 `if (*tc <= depth) return` 的早退逻辑。

```makeup
// RUN: triton-opt --gm-load-multi-buffer='buffer-depth=2' %s | FileCheck %s --check-prefix=SKIP

module {
  func.func @tc03_trip_too_small(%arg2: memref<?xf16>) {
    %c0   = arith.constant 0 : index
    %c2   = arith.constant 2 : index   // trip count = 2 = depth → 跳过
    %c1   = arith.constant 1 : index
    %c128 = arith.constant 128 : index

    // trip count = (2 - 0) / 1 = 2 = bufferDepth → 不 buffer
    scf.for %iv = %c0 to %c2 step %c1 : index {
      %row_off  = arith.muli %iv, %c128 : index
      %q_src_rc = memref.reinterpret_cast %arg2 to offset: [%row_off],
                  sizes: [128, 128], strides: [128, 1]
                  : memref<?xf16> to memref<128x128xf16, strided<[128, 1], offset: ?>>
      %q_alloc  = memref.alloc() : memref<128x128xf16>
      memref.copy %q_src_rc, %q_alloc
                  : memref<128x128xf16, strided<[128, 1], offset: ?>> to memref<128x128xf16>
      %q_tensor = bufferization.to_tensor %q_alloc restrict writable
                  {gm_load_bufferable} : memref<128x128xf16>
    }
    return
  }
}
```

​**FileCheck 验证点**​：

```makeup
// SKIP-NOT: iter_args(%{{.*}} = %false
// SKIP-NOT: arith.ceildivui
// SKIP:     scf.for %{{.*}} = %c0 to %c2 step %c1 : index {
// SKIP:       memref.copy
// SKIP:       bufferization.to_tensor {{.*}} {gm_load_bufferable}
```

#### 10.4.4 Producer IV 投影正确性（Fix 2）

​**测试目的**​：验证 Producer 使用计算预取地址，保证第 k 个 slot 填充的是迭代 k 的正确数据。

```makeup
// RUN: triton-opt --gm-load-multi-buffer %s | FileCheck %s

module {
  func.func @tc06_iv_projection(
      %arg2: memref<?xf16>,   // Q GM
      %arg13: i32)            // lb（运行时）
  {
    %c28_i32   = arith.constant 28 : i32
    %c65536_i32 = arith.constant 65536 : i32
    %c128_i32  = arith.constant 128 : i32
    %c0_i32    = arith.constant 0 : i32
    %c128      = arith.constant 128 : index

    scf.for %arg16 = %arg13 to %c65536_i32 step %c28_i32 : i32 {
      // 地址链依赖 IV %arg16
      %iv_idx   = arith.index_cast %arg16 : i32 to index
      %row_off  = arith.muli %iv_idx, %c128 : index
      %q_src_rc = memref.reinterpret_cast %arg2 to offset: [%row_off],
                  sizes: [128, 128], strides: [128, 1]
                  : memref<?xf16> to memref<128x128xf16, strided<[128, 1], offset: ?>>
      %q_alloc  = memref.alloc() : memref<128x128xf16>
      memref.copy %q_src_rc, %q_alloc
                  : memref<128x128xf16, strided<[128, 1], offset: ?>> to memref<128x128xf16>
      %q_tensor = bufferization.to_tensor %q_alloc restrict writable
                  {gm_load_bufferable} : memref<128x128xf16>
    }
    return
  }
}
```

​**FileCheck 验证点**​：

```makeup
// ── Producer scf.if 内的 IV 投影结构 ──────────────────────────────────
// CHECK:      scf.if %[[P0_COND:.*]] -> (i1, index) {
// ── lb 和 step 先转换为 IV 的原生类型（i32），再计算投影 ──────────────
// CHECK:        %[[LB_I32:.*]]   = arith.index_cast {{.*}} : index to i32
// CHECK:        %[[STEP_I32:.*]] = arith.index_cast {{.*}} : index to i32
// CHECK:        %[[PROD_I32:.*]] = arith.index_cast %[[PROD:.*]] : index to i32
// CHECK:        %[[PROD_STEP:.*]] = arith.muli %[[PROD_I32]], %[[STEP_I32]] : i32
// CHECK:        %[[VIRT_IV:.*]]   = arith.addi %[[LB_I32]], %[[PROD_STEP]] : i32
// ── 虚拟 IV 用于地址计算（%arg16 不再出现在 producer 内）────────────
// CHECK:        arith.index_cast %[[VIRT_IV]] : i32 to index
// CHECK:        memref.copy {{.*}}, {{.*}}

// ── 确认真实 IV %arg16 不被直接用于 producer 地址链 ──────────────────
// （以下检查在 producer 的 scf.if thenBlock 范围内不应出现 %arg16 参与地址计算）
```

#### 10.4.4.5 三 Buffer（depth=3）

​**测试目的**​：验证 `buffer-depth=3` 时生成 3 个 slot、3 个 flag iter_args、Producer 循环 3 次、Consumer `remui` 除以 3。对应 `transformFor` 的 `depth` 参数化逻辑。

```makeup
// RUN: triton-opt --gm-load-multi-buffer='buffer-depth=3' %s | FileCheck %s --check-prefix=DEPTH3

module {
  func.func @tc09_triple_buffer(%arg2: memref<?xf16>, %arg13: i32) {
    %c28_i32   = arith.constant 28 : i32
    %c65536_i32 = arith.constant 65536 : i32
    %c128_i32  = arith.constant 128 : i32
    %c0_i32    = arith.constant 0 : i32
    %c128      = arith.constant 128 : index

    // trip count = ceil((65536 - arg13) / 28) >> 3，满足变换条件
    scf.for %arg16 = %arg13 to %c65536_i32 step %c28_i32 : i32 {
      %iv_idx   = arith.index_cast %arg16 : i32 to index
      %row_off  = arith.muli %iv_idx, %c128 : index
      %q_src_rc = memref.reinterpret_cast %arg2 to offset: [%row_off],
                  sizes: [128, 128], strides: [128, 1]
                  : memref<?xf16> to memref<128x128xf16, strided<[128, 1], offset: ?>>
      %q_alloc  = memref.alloc() : memref<128x128xf16>
      memref.copy %q_src_rc, %q_alloc
                  : memref<128x128xf16, strided<[128, 1], offset: ?>> to memref<128x128xf16>
      %q_tensor = bufferization.to_tensor %q_alloc restrict writable
                  {gm_load_bufferable} : memref<128x128xf16>
    }
    return
  }
}
```

​**FileCheck 验证点**​：

```makeup
// DEPTH3:      %[[S0:.*]] = memref.alloc() : memref<128x128xf16>  // slot0
// DEPTH3-NEXT: %[[S1:.*]] = memref.alloc() : memref<128x128xf16>  // slot1
// DEPTH3-NEXT: %[[S2:.*]] = memref.alloc() : memref<128x128xf16>  // slot2

// 3 个 flag iter_args
// DEPTH3:      iter_args(%[[F0:.*]] = %false, %[[F1:.*]] = %false, %[[F2:.*]] = %false,
// DEPTH3-SAME:           %[[PROD:.*]] = %c0, %[[CONS:.*]] = %c0)
// DEPTH3-SAME: -> (i1, i1, i1, index, index)

// 3 个 Producer scf.if 块（slot0, slot1, slot2）
// DEPTH3:      scf.if {{.*}} -> (i1, index) {  // producer slot0
// DEPTH3:        memref.copy {{.*}}, %[[S0]]
// DEPTH3:      scf.if {{.*}} -> (i1, index) {  // producer slot1
// DEPTH3:        memref.copy {{.*}}, %[[S1]]
// DEPTH3:      scf.if {{.*}} -> (i1, index) {  // producer slot2
// DEPTH3:        memref.copy {{.*}}, %[[S2]]

// Consumer 除以 3（depth=3）
// DEPTH3:      arith.remui %[[CONS]], %c3 : index

// 3 个 to_tensor + 2 级 arith.select 链（depth-1=2 级）
// DEPTH3:      bufferization.to_tensor %[[S0]] restrict writable
// DEPTH3:      bufferization.to_tensor %[[S1]] restrict writable
// DEPTH3:      bufferization.to_tensor %[[S2]] restrict writable
// DEPTH3:      arith.select {{.*}}  // 第 1 级
// DEPTH3:      arith.select {{.*}}  // 第 2 级（最终 result）

// 3 个 flag clearing scf.if（target==0, target==1, target==2）
// DEPTH3:      scf.if {{.*}} -> (i1)
// DEPTH3:      scf.if {{.*}} -> (i1)
// DEPTH3:      scf.if {{.*}} -> (i1)
```

**10.5**

## 10.5测试脚本

[获取安装脚本和测试脚本](https://gitcode.com/gcw_LcYTzRJy/test_script/blob/dynamic/README.md)

# 11 遗留问题

## 11.1 和TA其它PASS的耦合性分析

所有信息来源：[https://gitcode.com/Ascend/triton-ascend/blob/main/docs/zh/architecture\_design\_and\_core\_features.md](https://gitcode.com/Ascend/triton-ascend/blob/main/docs/zh/architecture_design_and_core_features.md) 及代码分析；

前版本TA涉及到add_auto_blockify、add_triton_to_structure、这些pass

### 11.1.1 add_auto_blockify

add_auto_blockify：自动块化优化；当TRITON_ALL_BLOCKS_PARALLEL为1时，使用指定的auto_blockify_size扩展最高维度的块大小，提高并行度；

工作原理：

1. 逻辑 Block ID 展平化：将三维的 program_id (x, y, z) 展平为一维的逻辑 block ID
2. Block ID 扩展：使用 `auto_blockify_size` 将一个逻辑 block ID 扩展为多个 blockified ID
3. Mask 生成：生成 mask 来确保扩展后的 ID 不会超出有效范围
4. 代码转换：将标量操作转换为向量操作，处理 load/store 等操作

假设原来要处理的tensor数据的格式为<8x32xi32>，auto_blockify_size=5，则新的tensor的数据格式为<5x8x32xi32>，将数据量提高了5倍；

pass限制：从代码可见，`checkBlockifiable()` 会检查以下条件，某些情况不适用：

- 不能有 `cf::CondBranchOp`、`triton::IntToPtrOp`、`scf::WhileOp`、`triton::DotOp`
- 不能有 tensor 指针类型的操作数
- 循环操作需要特殊的 region 标记

结论：当前方案需要支持该特性，建议放到该pass之后；

### 11.1.2 add_triton_to_structure

add_triton_to_structure：Triton IR结构化转化Pass；功能：将triton中涉及广播/splat的多维指针操作转化为更简单的线性化结构化形式；

工作原理：

1. Canonicalization patterns(规范化)：

（1）PromotePointerIterArgsPattern：将循环中的指针迭代参数提升为整数偏移；

![](./096d5d52-051a-4bb6-90a2-8ba200403674.png?1775198554055)

（2）SimplifyTensorIterArgsPattern：将tensor iter arg的shape变化（reshape/broadcast）移出循环

![](./3de0fadf-fb2b-4fc4-883f-ac09afaf97d2.png?1775199255110)

（3）AddPtrSplatConverter：splat（ptr）+ broadcast（offset）-> 先计算小维度addptr，在broadcast结果

![](./1af0f2d7-f535-4850-a257-9f8598ee37ba.png?1775526310887)

（4）LoadBroadcastConverter：load(broadcast(ptr)) -> broadcast(load(ptr))，提前将load下沉到更小维度

![](./68506ab8-4810-46ec-97d3-7dc7f557569f.png?1775526697955)

（5）SplatCmpConverter：将splat和cmp的组合进行归一化处理，先做compare再进行splat；

![](./f2f6645d-6645-47cc-95bb-f382f8315098.png?1775550053572)

2、MemOp Conversion Patterns（内存操作转化）

目的：把triton中“有广播维度的多维指针访问”，变成“更低维度的线性指针访问+事后补偿操作”，可以缓解NPU的访存压力；

（1）LoadConverter：转换load操作

使用由 `CreateAddpr` 生成的新指针表达式和由 `BuildMask` 生成的新掩码表达式，重新创建（替换）原始的 `tl.load` 操作，完成指令重写。生成的还是tl.load

（2）StoreConverter：转换store操作

使用由 `CreateAddpr` 生成的新指针表达式和由 `BuildMask` 生成的新掩码表达式，重新创建（替换）原始的 `tl.store` 操作，完成指令重写。

**补充：sync block lock、sync block unlock可以完成对同一个内存的读写锁机制；需要找编译器的人确认核间的原子操作如何使用这两个lock？？？**

**这两个op的定义（软件定义的）：[https://wiki.huawei.com/domains/148244/wiki/296387/WIKI202511189078305](https://wiki.huawei.com/domains/148244/wiki/296387/WIKI202511189078305)**

上述的受限条件：

1、pointer分析无法确定的场景；（1）pointer 通过运行时产生 或者 通过cast 产生；（2）pointer是通过arith.select产生的，select的两个ptr维度无法保持一致；（3）pointer to pointer，间接访存；（4）当pointer是通过scf.for的参数获取的；

2、mask分析无法确定的场景；同理

结论：当前方案需要支持该特性，建议放到该pass之后；

### 11.1.3 add_discrete_mask_access_conversion

在Triton IR 这一层将discrete mask的语义展开为显示的load+select组合，让NPU只看到没有mask的内存操作；

当前load/store方案：[https://wiki.huawei.com/domains/148244/wiki/296387/WIKI2026020410058748](https://wiki.huawei.com/domains/148244/wiki/296387/WIKI2026020410058748)

工作原理：

（1）DiscreteMaskLoadConversion

![](./b9fb65da-bba7-4dfb-90c6-2977cb6ee4eb.png?1775984010434)

（2）DiscreteMaskStoreConversion

![](./f19b88b1-e087-4e16-a7fb-e08c235f3152.png?1775984514272)

（3）DiscreteMaskAtomicConversion

![](./4d8cc5e6-254d-4ee3-a7e9-482c61f62bc2.png?1775984662338)

约束场景：

1）mask是scf.if的结果；

2）arith::OrIOp 组合的mask

3）不支持的cmpi组合，当前只支持slt/sle/sge/eq/ne，这5种，其它不支持；另外ne只支持 lhs != 0，其它lns != constant 的不支持；

4）多维cmpI不支持；即使是连续的也不支持；

5）包含Div操作的mask组合，不支持；

6）参与组合的op不允许出现非mask的操作；比如说scala的bool运算；

7）arith.selectOp不满足select（cmp, 1 ,0）模式；true value 和 false value 必须是常量scala；

8）tt.make_range 步长必须是1,；

结论：当前方案需要支持该特性，建议放到该pass之后；

### 11.1.4 add_triton_to_annotation

把triton::ascend::AnnotationOp 转化为 annotation::MarkOp；历史遗留代码，无实际作用；考虑联系TA SE删除；

### 11.1.5 add_triton_to_unstructure

处理“非结构化内存访问”的，对于地址不连续的tt.load/tt.store/tt.atomic_rmw/tt.atomic_cas，将向量化的批量访存展开为逐元素的标量访问循环（scf.for + tensor.extract + tensor.insert）操作；

对比add_discrete_mask_access_conversion pass，该pass解决的是更严重的离散访存；内存地址都不连续，无法像add_discrete_mask_access_conversion pass通过浪费内存带宽来解决；

实现原理：

该pass的核心作用依赖PtrOffsetInfo 数据结构，对每一个ptr的offset进行了分类；

enum class AxisInfo {

```
unstructured,

structured,

scalarlike,

scalar
```

};

scalar：该维度是标量维（rank size=1）；

scalarlike：所有元素值都相同（shape维度可以不是1）

structured：步长连续可知，且stride为固定值；

unstructured：步长不可静态分析；如不连续或运行时产生

scalar ⊆ scalarlike ⊆ structured；

unstructured = complement（structured）

具体实现代码流程如下：

（1）ptr降维预处理：replacePtrArguments：将scf.for、scf.while、scf.if op的ptr tenor的参数变成标量类型；如下以scf.for op为例：

![](./285b1ab2-ad9d-4f81-a5d2-ae336f526002.png)

（2）使用开源pass  CannonicalizerConverter::IfYieldAddHoistConverter 将公共的计算部分提到scf.if的外面去执行，简化MLIR逻辑

（3）从loadOp、storeOp、atomicRMWOp、atomicCASOp触发溯源找到ptr的offset信息

（4）对上述op进行unstructuredMemAccessConverter 转化；

最终生成的离散访存的例子如下：

scf.for %arg42 = %c0 to %c32 step %c1 {

```
%extracted = tensor.extract %101[%arg42, %c0] {DiscreteMemAccess} : tensor<32x1xi32> loc(#loc16)

          %109 = arith.extsi %extracted : i32 to i64 loc(#loc16)

          %110 = arith.addi %53, %109 : i64 loc(#loc16)

          %111 = arith.index_cast %110 : i64 to index loc(#loc16)

          %reinterpret_cast_11 = memref.reinterpret_cast %arg6 to offset: [%111], sizes: [1, 128], strides: [128, 1] : memref<?xf16> to memref<1x128xf16, strided<[128, 1], offset: ?>> loc(#loc16)

          %extracted_slice = tensor.extract_slice %104[%arg42, 0] [1, 128] [1, 1] {DiscreteMemAccess} : tensor<32x128xf32> to tensor<1x128xf32> loc(#loc16)

          %112 = arith.truncf %extracted_slice : tensor<1x128xf32> to tensor<1x128xf16> loc(#loc16)

          hivm.hir.store ins(%112 : tensor<1x128xf16>) outs(%reinterpret_cast_11 : memref<1x128xf16, strided<[128, 1], offset: ?>>) atomic = <add> loc(#loc16)

        } {ExtractedLoadOrStore} loc(#loc16)
```

哪些场景下该pass生效，转化成标量访存？

（1）任意维度未unstructured （muli/divsi/load的结果/编译时未知）

（2）带discreteMask属性；（add_discrete_mask_access_conversion pass传递下来的）

（3）scalarLike 且 shape 不全为1（splat 广播指针）

（4）地址 来自 tensor参数（fromTensorArg）

（5）forceScalarizeMode=true 强制触发

（6）连续维总字节数不是32B对齐的；

其它场景下正常lowring（包括SMIT场景）

结论：当前方案需要支持该特性，建议放到该pass之后；

### 11.1.6 add_triton_to_hivm

作用：将sync_block_all、sync_block_set、sync_block_wait 这些op转换成hivm 下的op；

结论：当前cv融合方案在添加核间同步的时候，使用的就是hivm下的op方言；该pass顺序无影响；

### 11.1.7 add_triton_to_hfusion

将triton的某些op转化为hfusion的op；

（1）triton::HistogramOp -> hfusion::HistogramOp

（2）triton::FpToFpOp -> hfusion::CastOp

（3）triton::ascend::ModOp -> hfusion::ElemwiseBinaryOp

结论：需要放到该pass之后；

**遗留问题：需要确保转换成的hfusion方言一定是cube only 或者 vec only的方言；**

### 11.1.8 add_triton_to_llvm

将triton::ElementwiseInlineAsmOp (tt.elementwise_inline_asm) 转化为llvm方言的llvm.inline.asm

结论：cv融合方案和该pass功能无耦合关系，无影响；

### 11.1.9 add_bubble_up_operation

目的，其实是为了配合add_triton_to_unstructure 使用，将tensor.extract / tensor.extract_slice 向上bubble up到def op处，从而减少中间无效的张量计算量；

默认参数enableAggressiveMode=false，只有parentOp唯一被使用时才bubble up；

enableAggressiveMode=true：即使有多个user 也强制使用bubble up，但是这样可能会产生比较多的临时变量，从而占用内存；

支持bubble up的op有：

整数算术类：ADDI、SUBI、MULI、DIVSI、REMSI、MAXSI、MINSI、ANDI、ORI

浮点算术类：ADDF、SUBF、MULF、DIVF、MINNUMF、MAXNUMF

类型转换类：EXTSI、TRUNCF、EXTF、FPTOSI、SITOFP

比较类：CMPI、CMPF

数学函数：math.floor、math.ceil

triton op：AddPtr、Broadcast、ExpandDims、Splat、MakeRange、ClampF

张量op：tensor.ExtractSlice（只能被ExtractOp bubble up），如下图所示：

![](./f3018a52-f6b5-42f2-befc-b55434fc05ac.png)

结论：当前方案需要支持该特性，建议放到该pass之后；

### 11.1.10 add_triton_to_linalg

基于开源的triton-linalg开源pass修改；整个pass流程如下：

（1）processDescriptorOperations：​**NPU定制化修改**​；预处理（向前兼容Triton 2.x版本）；将 triton::DescriptorLoadOp/triton::DescriptorStoreOp 转化成 triton::LoadOp/triton::StoreOp

（2）processImplicitPermuteOperations：​**NPU定制化修改**​；预处理；将隐式转置显示化处理；比如A[j, i]的访问模式，直接通过插入显示的permute来完成；涉及op：load、store、atomicrmw、atomiccas、splatcmp组合；

（3）MarkTensorKindPass：​**NPU定制化修改**​；给triton::LoadOp、triton::ascend::IndexSelectSimdOp、triton::ascend::GatherOutToUbOp、triton::ascend::IndirectLoadOp 加上 TensorKind::INPUT 标签；

给triton::StoreOp、triton::ascend::IndexPutOp、triton::ascend::ScatterUbToOutOp、triton::ascend::IndirectStoreOp 加上 TensorKind::OUTPUT 标签；

给triton::AtomicRMWOp、triton::AtomicCASOp 添加 TensorKind::INPUT_OUTPUT标签；

（4）populateTritonToLinalgCanonicalizationPatterns；在开源pass上有定制化修改，目的是将IR规范化到一个“可转换”的形态；**开源代码；**

![](./fc674c1a-2c6e-445f-aaff-259fe88f6ee6.png)

![](./c3c45f10-238b-42d8-9099-81b94169cebe.png)

![](./843bc969-164a-46af-93e7-75760696f66a.png)

（5）addProgramInfo：​**NPU定制修改**​；在kernel尾部追加6个i32的参数：num_programs_x, num_programs_y, num_programs_z, program_id_x, program_id_y, program_id_z；kernel内部的tt.get_program_id_x 就变成具体的参数；

![](./1636c218-328d-4647-9372-324a57788f53.png)

（6）对loop的特殊处理；**NPU定制；**

（7）processLegalStrideOperations；​**NPU定制**​；将stride 0 变成stride 1；stride=0 意味着 size 为1，因此stride值是多少不会影响运算结果；该pass是blockptranalysis pass的后处理修复pass，解决非法stride的问题；

（8）convertTTFunc；​**NPU定制**​；关键功能：1、将element type 为i1的memref 修复为 i8；2、创建func.FuncOp，并迁移attrs；新增mix_mode（取值：aiv or mix）、parallel_mode（取值：simd or mix_simd_simt）；3、多block控制流结构化，若函数体有多个block（来自triton的cf.cond_br跳转），调佣 convertMultipleBlockControlFlow将其结构化为scf.if；

（9）解决PointerCastOp的result 类型是memref<?xf32>这种内存大小不确定的情况；根据后续reinterpretCastOp的size/strides，精确算出来所需内存的大小；**NPU定制**

（10）可能的interleave优化；​**NPU定制**​；如下：

even_range = tl.arange(0, N//2) * 2        # [0, 2, 4, ...] stride=2

odd_range = tl.arange(0, N//2) * 2 + 1        #[1, 3, 5, ...] stride=2, offset+1

两次写操作效率低，可以通过interleave操作合并成一次写操作；

（11）插入SyncBlockLockArgIdx/WorkspaceArgIdx；**遗留问题：这两个attribute 需要再明确下作用；**

（12）修复UnknownLoc 问题；NPU定制；

结论：当前方案需要支持该特性，建议放到该pass之后；

# 12个高优算子进展

（1）【字节中台】FA(含FP8/MxFP8)    --- 责任人：刘一辰
编译问题：
精度问题：
性能问题：
（2）【字节中台】【mojo】sdpa (attention+mask)	---责任人：刘茹枫
（3）【字节中台】【mojo】diffusion attention(dllm)		---责任人：吴志伟
（4）【推理/训练解决方案】【FLA】chunk_bwd_dqkwg		---责任人：陈啸天
（5）【推理/训练解决方案】【FLA】chunk_bwd_dv_local		---责任人：朱信光
（6）【推理/训练解决方案】【FLA】chunk_gated_delta_rule_fwd_h		---责任人：马杰
（7）【推理/训练解决方案】【FLA】chunk_gated_delta_rule_bwd_dhu		---责任人：陈伍洋
（8）【推理/训练解决方案】【FLA】chunk_fwd_o		---责任人：李承峰
（9）【推理/训练解决方案】【FLA】chunk_scaled_dot_kkt_fwd		---张德龙
（10）【推理/训练解决方案】【FLA】recompute_w_u_fwd			---张开
（11）【推理/训练解决方案】【FLA】prepare_wy_repr_bwd			---孙先淼
（12）【推理/训练解决方案】【FLA】solve_tril			--- 付琦峰
（13）原生FA + 字节POC FA		---邵怡阳

# 7大算子仓进展

xxx

# PR汇总

## 基本功能 PR 汇总

1、赵杰山：ssbuf重构框架；https://gitcode.com/Ascend/triton-ascend/pull/1639；**已合入；已打入**
2、刘一辰：计算块划分框架；https://gitcode.com/Ascend/triton-ascend/pull/1680；**已合入；已打入**
3、刘茹枫：CV分核框架；https://gitcode.com/Ascend/triton-ascend/pull/1684；**已合入；已打入**
4、孙先淼：if条件控制流框架；https://gitcode.com/Ascend/triton-ascend/pull/1690；**已合入；已打入**
5、吴志伟：计算访存分离框架；https://gitcode.com/Ascend/triton-ascend/pull/1722；**已合入；已打入**
6、陈啸天：核内多缓存控制流框架；https://gitcode.com/Ascend/triton-ascend/pull/1727；**已合入；已打入**
7、 付琦峰：OP分类；https://gitcode.com/Ascend/triton-ascend/pull/1707；**已合入；已打入**
8、陈伍洋：cube 块划分；https://gitcode.com/Ascend/triton-ascend/pull/1709；**已合入;已打入**
9、陈伍洋：指令重排；https://gitcode.com/Ascend/triton-ascend/pull/1710；**已合入; 已打入**
10、邵怡阳：vector块划分：https://gitcode.com/Ascend/triton-ascend/pull/1711；**已合入;已打入**
遗留问题：后续整改Passes.h 和 OpClassifier.h；

11、吴志伟：访存多buffer：https://gitcode.com/Ascend/triton-ascend/pull/1712; **已合入；已打入**
14、孙先淼：更新if条件pass框架：https://gitcode.com/Ascend/triton-ascend/pull/1717；**已合入；已打入**
15、丁一：代码scope分核处理：https://gitcode.com/Ascend/triton-ascend/pull/1719； **已合入;已打入**
16、张开：gm load打标记：https://gitcode.com/Ascend/triton-ascend/pull/1701；**已合入；已打入**
17、朱信光：更新for循环迭代次数：https://gitcode.com/Ascend/triton-ascend/pull/1791；**已合入;已打入**
18、刘一辰：添加内存副作用分析：https://gitcode.com/Ascend/triton-ascend/pull/1729；**已合入;已打入**
27、刘茹枫：插入数据搬运和同步的框架代码：https://gitcode.com/Ascend/triton-ascend/pull/1782；**已合入；已打入**
28、付琦峰：https://gitcode.com/Ascend/triton-ascend/pull/1776；**已合入；已打入**
29、孙先淼：https://gitcode.com/Ascend/triton-ascend/pull/1784；**已合入；已打入**
30、陈啸天：多缓存控制流代码：https://gitcode.com/Ascend/triton-ascend/pull/1785；**已合入；已打入**
31、刘茹枫：插入数据搬运和同步代码：https://gitcode.com/Ascend/triton-ascend/pull/1792；**已合入;已打入**
32 、吴志伟：添加MultiBufferToGMLoad实现代码：[https://gitcode.com/Ascend/triton-ascend/pull/1793](https://gitcode.com/Ascend/triton-ascend/pull/1793)；**已合入；已打入**
33、朱信光：获取上游核间核内依赖关系pass：https://gitcode.com/Ascend/triton-ascend/pull/1796；**已合入；已打入**
34、马杰：控制流OP拷贝、创建ifOp、更新计数器参数、核内控制条件、插入PIPE_S，https://gitcode.com/Ascend/triton-ascend/pull/1798；**已合入：已打入**
35、刘一辰：修复 MemoryEffectTracker 当前存在的两个识别异常场景问题：[https://gitcode.com/Ascend/triton-ascend/pull/1800](https://gitcode.com/Ascend/triton-ascend/pull/1800)；**已合入;已打入**

## 修复 PR 汇总

~~1、马杰：修复cloneops后续的清理操作的判断规则，https://gitcode.com/Ascend/triton-ascend/pull/1830，已合入github仓，关闭
2、马杰：修复核间forOp同步的pipes插入规则，https://gitcode.com/Ascend/triton-ascend/pull/1854，已合入github仓，关闭~~
3、刘一辰：修复 MemEffectTracker 未能顺利处理 for 内部 subview + copy 的问题,https://github.com/triton-lang/triton-ascend/pull/93 已检视，待新增问题描述；
4、刘一辰：增加 fallback 机制,https://github.com/triton-lang/triton-ascend/pull/84 ；已检视，待合入
5、马杰：处理tensor类型的for iter_args的判断，https://github.com/triton-lang/triton-ascend/pull/95，待检视
6、刘茹枫：修复iterarg相关核间依赖分析+注册opt+修复UT，https://github.com/triton-lang/triton-ascend/pull/96，待检视
7、朱信光：为ssbuffer读写op增加volatile属性，https://github.com/triton-lang/triton-ascend/pull/99，已检视，待合入

8. 邵怡阳： ub-usage-opt添加判环： https://github.com/triton-lang/triton-ascend/pull/88，已检视，待合入
9. 朱信光：修改循环迭代次数pass增加对C3对V1有核间数据依赖的场景：https://github.com/triton-lang/triton-ascend/pull/158

## UT PR 汇总

~~1、孙先淼：控制流新增ut:https://gitcode.com/Ascend/triton-ascend/pull/1826；**已合入;已打入**
2、陈啸天：修复核内新增op标签漏标问题以及核内多缓存ut：https://gitcode.com/Ascend/triton-ascend/pull/1829；**已合入；已打入**
3. 邵怡阳： plan-vector-block功能的UT：https://gitcode.com/Ascend/triton-ascend/pull/1827；待检视待合入
4. 陈伍洋：[test: add test for DynamicCVPipeline.PlanComputeBlock subview cases-triton-ascend-AtomGit | GitCode](https://gitcode.com/Ascend/triton-ascend/pull/1834)；待检视
5.马杰：https://gitcode.com/Ascend/triton-ascend/pull/1836，**已合入;已打入**
6.张德龙、林子睿 ： 修复核间flagid的边界条件和应对处理以及核间单buffer UT https://gitcode.com/Ascend/triton-ascend/pull/1832；待检视
7. 陈伍洋：为 triton-opt 添加命令行参数用于跑 ut [test: triton-opt for plan compute block for ut-triton-ascend-AtomGit | GitCode](https://gitcode.com/Ascend/triton-ascend/pull/1842)；待检视
8、孙先淼：控制流新增ut:https://gitcode.com/Ascend/triton-ascend/pull/1850；待检视
9、付琦峰：op-classifier ut : [feat: add op classifier ut-triton-ascend-AtomGit | GitCode](https://gitcode.com/Ascend/triton-ascend/pull/1848)
10、孙先淼：控制流新增ut:https://gitcode.com/Ascend/triton-ascend/pull/1853；**已合入;已打入**
11、丁一： 新增分scope ut  https://gitcode.com/Ascend/triton-ascend/pull/1845) 待检视
12、李承峰：computeBlockOpt中修改block_id代码 https://gitcode.com/Ascend/triton-ascend/pull/1861 待检视~~

13、遗留问题：UT待补充；# fix(ssbuffer): ub usage opt；---责任人：邵怡阳；

