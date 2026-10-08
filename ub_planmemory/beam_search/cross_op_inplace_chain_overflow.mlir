// PlanMemory Beam Search 的合成复现 IR；UB_SIZE = 1536 bit，即 192B。
// Buffer 大小：A = 32xf32 = 128B，B1 = 32xf16 = 64B，
//             B2 = 32xi8 = 32B，X = 32xf32 = 128B。
// VF1 读取 A 并生成 B1；VF2 读取 B1 并生成 B2。
// X 在 VF2 之后创建，只与 B2 的生命周期重叠，不与 A、B1 重叠。
//
// 可选原地复用候选：p1 = B1 复用 A；p2 = B2 复用 B1。
// Beam 对每条候选分别尝试“选/不选”，得到 {}、{p1}、{p2}、{p1,p2}。
// Beam 宽度为 16，本例不会剪枝。排序首先比较已选合并对数，
// 因此选择 {p1,p2}（两对），随后将 A、B1、B2 合并为同一个 SE。
//
// 每条候选都会扫描原始 SE 集合估算冲突，但两条候选独立评分：
// p1 相对 X 新增 0 bit 冲突；p2 相对 X 新增 256 bit（32B）冲突。
// 两条都合并后，A、B1、B2 所在的 SE 在 B2 存活期间实际大小为 128B；
// 加上同时存活的 X（128B），共需 256B = 2048 bit，超过可用的 192B = 1536 bit。
// 运行本 IR 会报 UB overflow；仅保留 p2 为合法候选的对照 IR 则能成功规划。
// 因此，Beam 能保留跨 op 的选择，每条候选的评分也参考全局 SE；
// 但它不会基于合并后的状态重新评分，也不会为每个状态运行 first-fit，
// 所以不能保证所选组合最终一定可分配。
// 
// 这里的“考虑全局信息”是有限度的，主要指两件事：
// - 给每条候选评分时，会看它与其他所有原始 SE 的生命周期冲突，而不只看这两个待合并的 buffer。比如 B2-B1 会看到 X，算出新增 32B 冲突。
// - Beam 状态会记录跨 op 选了哪些边，所以能保留 {B1-A, B2-B1} 这样的组合。
// 
// 这个具体问题可以在 Beam Search 内解决，不需要替换后面的 first-fit。
// 关键不是只调整 addedConflictBytes 的权重，而是让每个 Beam 状态按已经选择的全部合并关系计算：
// 1. 传递地合并 SE：选 {B1-A, B2-B1} 后得到 {A,B1,B2}，大小为 128B。
// 2. 计算该状态各时刻同时存活的 SE 容量下界。本例它与 X 同时存活，需要 256B，超过 192B，直接剪掉这个状态。
// 3. 在未被剪掉的状态中再评分；不能继续把“合并对数最多”放在容量可行性之前。

module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 1536 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<AIV>} {
  // 合成复现例子：A(128B) -> B1(64B) -> B2(32B)。
  // UB_SIZE 为 1536 bit（192B）；同时选择两条可选复用边后需要 2048 bit。
  func.func @vf1(%src: memref<32xf32, #hivm.address_space<ub>>, %dst: memref<32xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c0 = arith.constant 0 : index
    %zero = arith.constant 0.0 : f32
    %v = vector.transfer_read %src[%c0], %zero {in_bounds = [true]} : memref<32xf32, #hivm.address_space<ub>>, vector<32xf32>
    %cast = arith.truncf %v : vector<32xf32> to vector<32xf16>
    vector.transfer_write %cast, %dst[%c0] {in_bounds = [true]} : vector<32xf16>, memref<32xf16, #hivm.address_space<ub>>
    return
  }
  func.func @vf2(%src: memref<32xf16, #hivm.address_space<ub>>, %dst: memref<32xi8, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c0 = arith.constant 0 : index
    %zero = arith.constant 0.0 : f16
    %v = vector.transfer_read %src[%c0], %zero {in_bounds = [true]} : memref<32xf16, #hivm.address_space<ub>>, vector<32xf16>
    %cast = arith.fptosi %v : vector<32xf16> to vector<32xi8>
    vector.transfer_write %cast, %dst[%c0] {in_bounds = [true]} : vector<32xi8>, memref<32xi8, #hivm.address_space<ub>>
    return
  }
  func.func @kernel() attributes {hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vf_mode = #hivm.vf_mode<SIMD>} {
    %c0 = arith.constant 0 : index
    %zero_i8 = arith.constant 0 : i8
    %zero_f32 = arith.constant 0.0 : f32
    %v_zero = vector.broadcast %zero_f32 : f32 to vector<32xf32>
    %a = memref.alloc() : memref<32xf32, #hivm.address_space<ub>>
    vector.transfer_write %v_zero, %a[%c0] {in_bounds = [true]} : vector<32xf32>, memref<32xf32, #hivm.address_space<ub>>
    %b1 = memref.alloc() : memref<32xf16, #hivm.address_space<ub>>
    func.call @vf1(%a, %b1) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>, memref<32xf16, #hivm.address_space<ub>>) -> ()
    %b2 = memref.alloc() : memref<32xi8, #hivm.address_space<ub>>
    func.call @vf2(%b1, %b2) {hivm.vector_function, no_inline} : (memref<32xf16, #hivm.address_space<ub>>, memref<32xi8, #hivm.address_space<ub>>) -> ()
    // X(128B) 在 op2 后开始存活，与 B2 重叠，不与 A 或 B1 重叠。
    %x = memref.alloc() : memref<32xf32, #hivm.address_space<ub>>
    vector.transfer_write %v_zero, %x[%c0] {in_bounds = [true]} : vector<32xf32>, memref<32xf32, #hivm.address_space<ub>>
    %v_b2 = vector.transfer_read %b2[%c0], %zero_i8 {in_bounds = [true]} : memref<32xi8, #hivm.address_space<ub>>, vector<32xi8>
    %v_x = vector.transfer_read %x[%c0], %zero_f32 {in_bounds = [true]} : memref<32xf32, #hivm.address_space<ub>>, vector<32xf32>
    return
  }
}
