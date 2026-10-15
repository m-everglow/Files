// RUN: bishengir-opt %s -hacc-append-device-spec=target=Ascend950PR_9579 -hivm-plan-memory-regbase | FileCheck %s --implicit-check-not=memref.alloc
//
// 对比目标：同一份IR、相同Ascend950PR_9579设备规格和Pass参数，
// stable全部9次attempt失败，current成功。
// 本例没有VF、alias、MultiBuffer或optional inplace，专门展示SE排序的影响。
//
// 以下1 KB按1024 B计。UB共248 KB：A=62 KB，B=124 KB，C=62 KB，D=93 KB。
// A/B/C同时存活；随后A、C结束，D生成，B仍存活。
//
// 相同的4个SE，为什么得到不同的规划顺序？
// stable：四个都是scalar pipeline buffer，默认同类保留输入顺序A→B→C→D。
// current：用DSATUR逐个选择。本例保守冲突图含流水线边，四个节点两两相连，
// 因而每轮未选节点的saturation都相同，实际由后面的评分裁决：
//   ① B、D的冲突容量都是217 KB，大于A、C的186 KB，先处理B、D。
//      冲突容量 = 对每个冲突邻居累加min(自身大小, 邻居大小)。
//   ② B、D之间，B更大（124 KB > 93 KB），所以B先、D后。
//   ③ A、C大小及复用机会相同；A生命周期更长（6个tick > 3个tick），所以A先。
// 最终顺序：stable为A→B→C→D；current为B→D→A→C。
// 后面的first-fit/MultiSpec分配规则相同，改变的是它接收的SE顺序。
//
// stable按A→B→C→D规划。到D存活时：
// [空闲62 KB]──[B：124 KB]──[空闲62 KB]
// 两段空闲不连续，放不下93 KB的D，分配失败。
//
// current按B→D→A→C规划。到D存活时：
// [B：124 KB]──[D：93 KB]──[空闲31 KB]
// A、C各使用B后面连续124 KB的一半，与D错时复用，分配成功。
//
// 为了让IR易读，各大buffer只演示第0个元素的标量读写；没有运行设备kernel。
// 用例用于验证静态内存规划，不代表真实模型的算子性能。
//
// CHECK-LABEL: func.func @dsatur_avoids_fragmentation(
// CHECK-DAG: %[[ZERO:.*]] = arith.constant 0 : i64
// CHECK-DAG: %[[SHARED:.*]] = arith.constant 126976 : i64
// CHECK-DAG: %[[TAIL:.*]] = arith.constant 190464 : i64
// CHECK: %[[A:.*]] = hivm.hir.pointer_cast(%[[SHARED]]) : memref<63488xi8,
// CHECK: %[[B:.*]] = hivm.hir.pointer_cast(%[[ZERO]]) : memref<126976xi8,
// CHECK: %[[C:.*]] = hivm.hir.pointer_cast(%[[TAIL]]) : memref<63488xi8,
// CHECK: %[[D:.*]] = hivm.hir.pointer_cast(%[[SHARED]]) : memref<95232xi8,
// CHECK: return
module {
  func.func @dsatur_avoids_fragmentation() -> i8 {
    %zero = arith.constant 0 : index
    %value = arith.constant 1 : i8
    %a = memref.alloc() : memref<63488xi8, #hivm.address_space<ub>>
    memref.store %value, %a[%zero] : memref<63488xi8, #hivm.address_space<ub>>
    %b = memref.alloc() : memref<126976xi8, #hivm.address_space<ub>>
    memref.store %value, %b[%zero] : memref<126976xi8, #hivm.address_space<ub>>
    %c = memref.alloc() : memref<63488xi8, #hivm.address_space<ub>>
    memref.store %value, %c[%zero] : memref<63488xi8, #hivm.address_space<ub>>
    %read_a = memref.load %a[%zero] : memref<63488xi8, #hivm.address_space<ub>>
    %read_c = memref.load %c[%zero] : memref<63488xi8, #hivm.address_space<ub>>
    %d = memref.alloc() : memref<95232xi8, #hivm.address_space<ub>>
    memref.store %value, %d[%zero] : memref<95232xi8, #hivm.address_space<ub>>
    %read_d = memref.load %d[%zero] : memref<95232xi8, #hivm.address_space<ub>>
    %read_b = memref.load %b[%zero] : memref<126976xi8, #hivm.address_space<ub>>
    %sum_ac = arith.addi %read_a, %read_c : i8
    %sum_acd = arith.addi %sum_ac, %read_d : i8
    %sum = arith.addi %sum_acd, %read_b : i8
    return %sum : i8
  }
}
