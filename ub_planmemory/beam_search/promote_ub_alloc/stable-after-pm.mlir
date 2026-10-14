// -----// IR Dump After PlanMemoryRegBase (hivm-plan-memory-regbase) //----- //
#map = affine_map<()[s0] -> (s0 * 10240)>
#map1 = affine_map<()[s0, s1] -> (s0 + s1)>
#map2 = affine_map<()[s0] -> (s0 + 10240)>
#map3 = affine_map<()[s0, s1] -> (s0 - s1)>
#map4 = affine_map<()[s0, s1] -> (s0 * s1)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<AIV>, ssbuffer.insertionOptimization} {
  func.func @_rmsnorm_fwd_kernel_fused_0_outlined_vf_0(%arg0: memref<1x10240xf32, #hivm.address_space<ub>>, %arg1: memref<1xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c64 = arith.constant 64 : index
    %c10240 = arith.constant 10240 : index
    %c0 = arith.constant 0 : index
    %0 = scf.for %arg2 = %c0 to %c10240 step %c64 iter_args(%arg3 = %cst_0) -> (vector<1x64xf32>) {
      %subview = memref.subview %arg0[0, %arg2] [1, 64] [1, 1] : memref<1x10240xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[10240, 1], offset: ?>, #hivm.address_space<ub>>
      %3 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[10240, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %4 = arith.mulf %3, %3 : vector<1x64xf32>
      %5 = arith.addf %4, %arg3 {reductionOp} : vector<1x64xf32>
      scf.yield %5 : vector<1x64xf32>
    } {reductionLoop}
    %1 = vector.transfer_read %arg1[%c0], %cst {in_bounds = [true]} : memref<1xf32, #hivm.address_space<ub>>, vector<1xf32>
    %2 = vector.multi_reduction <add>, %0, %1 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
    vector.transfer_write %2, %arg1[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, #hivm.address_space<ub>>
    return
  }
  func.func @_rmsnorm_fwd_kernel_fused_2_outlined_vf_0(%arg0: memref<1xf32, #hivm.address_space<ub>>, %arg1: memref<1xf32, #hivm.address_space<ub>>, %arg2: memref<1xf32, #hivm.address_space<ub>>, %arg3: memref<1xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<1.000000e+00> : vector<64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1] : vector<64xi1>
    %1 = vector.transfer_read %arg0[%c0], %cst_0, %0 {in_bounds = [true]} : memref<1xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = vector.transfer_read %arg1[%c0], %cst_0, %0 {in_bounds = [true]} : memref<1xf32, #hivm.address_space<ub>>, vector<64xf32>
    %3 = vector.transfer_read %arg2[%c0], %cst_0, %0 {in_bounds = [true]} : memref<1xf32, #hivm.address_space<ub>>, vector<64xf32>
    %4 = arith.divf %1, %2 : vector<64xf32>
    %5 = arith.addf %4, %3 : vector<64xf32>
    %6 = math.sqrt %5 : vector<64xf32>
    %7 = arith.divf %cst, %6 : vector<64xf32>
    vector.transfer_write %7, %arg3[%c0], %0 {in_bounds = [true]} : vector<64xf32>, memref<1xf32, #hivm.address_space<ub>>
    return
  }
  func.func @_rmsnorm_fwd_kernel_outlined_vf_0(%arg0: memref<1x10240xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c64 = arith.constant 64 : index
    %c10240 = arith.constant 10240 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c10240 step %c64 {
      %subview = memref.subview %arg0[0, %arg1] [1, 64] [1, 1] : memref<1x10240xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[10240, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[10240, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @_rmsnorm_fwd_kernel_outlined_vf_1(%arg0: memref<1xf32, #hivm.address_space<ub>>, %arg1: memref<1xf32, #hivm.address_space<ub>>, %arg2: memref<1xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1] : vector<64xi1>
    %1 = vector.transfer_read %arg0[%c0], %cst, %0 {in_bounds = [true]} : memref<1xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = vector.transfer_read %arg1[%c0], %cst, %0 {in_bounds = [true]} : memref<1xf32, #hivm.address_space<ub>>, vector<64xf32>
    %3 = arith.addf %1, %2 : vector<64xf32>
    vector.transfer_write %3, %arg2[%c0], %0 {in_bounds = [true]} : vector<64xf32>, memref<1xf32, #hivm.address_space<ub>>
    return
  }
  func.func @_rmsnorm_fwd_kernel_outlined_vf_2(%arg0: memref<10240xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c64 = arith.constant 64 : index
    %c10240 = arith.constant 10240 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c10240 step %c64 {
      %subview = memref.subview %arg0[%arg1] [64] [1] : memref<10240xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @_rmsnorm_fwd_kernel_outlined_vf_3(%arg0: memref<10240xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c64 = arith.constant 64 : index
    %c10240 = arith.constant 10240 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c10240 step %c64 {
      %subview = memref.subview %arg0[%arg1] [64] [1] : memref<10240xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @_rmsnorm_fwd_kernel_outlined_vf_4(%arg0: memref<10240xf32, #hivm.address_space<ub>>, %arg1: memref<10240xf32, #hivm.address_space<ub>>, %arg2: f32, %arg3: f32, %arg4: memref<10240xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c64 = arith.constant 64 : index
    %c10240 = arith.constant 10240 : index
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %arg2 : f32 to vector<64xf32>
    %1 = vector.broadcast %arg3 : f32 to vector<64xf32>
    scf.for %arg5 = %c0 to %c10240 step %c64 {
      %subview = memref.subview %arg0[%arg5] [64] [1] : memref<10240xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg5] [64] [1] : memref<10240xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg4[%arg5] [64] [1] : memref<10240xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %3 = vector.transfer_read %subview_0[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %4 = arith.addf %3, %0 : vector<64xf32>
      %5 = arith.mulf %2, %1 : vector<64xf32>
      %6 = arith.mulf %5, %4 : vector<64xf32>
      vector.transfer_write %6, %subview_1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @_rmsnorm_fwd_kernel(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg3: i32, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: i32, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg8: i32, %arg9: i32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, false, true, false, true, true, false, false, false, false, false, false, false]> : vector<15xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "aiv", parallel_mode = "simd"} {
    %c204864_i64 = arith.constant 204864 : i64
    %c163904_i64 = arith.constant 163904 : i64
    %c122944_i64 = arith.constant 122944 : i64
    %c81984_i64 = arith.constant 81984 : i64
    %c81952_i64 = arith.constant 81952 : i64
    %c81920_i64 = arith.constant 81920 : i64
    %c245824_i64 = arith.constant 245824 : i64
    %c40960_i64 = arith.constant 40960 : i64
    %c0_i64 = arith.constant 0 : i64
    %c245888_i64 = arith.constant 245888 : i64
    %c245856_i64 = arith.constant 245856 : i64
    %c245920_i64 = arith.constant 245920 : i64
    %c0_i32 = arith.constant 0 : i32
    %c10240_i32 = arith.constant 10240 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c10240 = arith.constant 10240 : index
    %c1 = arith.constant 1 : index
    %c56_i32 = arith.constant 56 : i32
    %0 = arith.muli %arg12, %arg13 : i32
    %1 = arith.muli %0, %arg14 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %4 = hivm.hir.pointer_cast(%c245920_i64) : memref<1xf32, #hivm.address_space<ub>>
    %5 = arith.sitofp %arg9 : i32 to f32
    %6 = hivm.hir.pointer_cast(%c245856_i64) : memref<1xf32, #hivm.address_space<ub>>
    memref.store %5, %6[%c0] : memref<1xf32, #hivm.address_space<ub>>
    %7 = hivm.hir.pointer_cast(%c245888_i64) : memref<1xf32, #hivm.address_space<ub>>
    memref.store %arg10, %7[%c0] : memref<1xf32, #hivm.address_space<ub>>
    %8 = arith.index_cast %arg9 : i32 to index
    scf.for %arg15 = %3 to %1 step %c56_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %9 = arith.remsi %arg15, %arg12 : i32
      scf.for %arg16 = %9 to %arg8 step %arg12  : i32 {
        %10 = hivm.hir.pointer_cast(%c81920_i64, %c81952_i64) : memref<1xf32, #hivm.address_space<ub>>
        annotation.mark %10 {hivm.multi_buffer = 2 : i32} : memref<1xf32, #hivm.address_space<ub>>
        %11 = arith.cmpi slt, %arg16, %arg8 : i32
        %12 = arith.muli %arg16, %arg5 : i32
        %13 = arith.index_cast %12 : i32 to index
        %14 = arith.index_castui %11 : i1 to index
        %15 = affine.apply #map()[%14]
        %16 = arith.minsi %14, %c1 : index
        %17 = arith.maxsi %16, %c0 : index
        %18 = arith.cmpi slt, %17, %c1 : index
        memref.store %cst, %4[%c0] : memref<1xf32, #hivm.address_space<ub>>
        %19 = scf.for %arg17 = %c0_i32 to %arg9 step %c10240_i32 iter_args(%arg18 = %4) -> (memref<1xf32, #hivm.address_space<ub>>)  : i32 {
          %24 = hivm.hir.pointer_cast(%c0_i64, %c40960_i64) : memref<1x10240xf32, #hivm.address_space<ub>>
          annotation.mark %24 {hivm.multi_buffer = 2 : i32} : memref<1x10240xf32, #hivm.address_space<ub>>
          %25 = arith.index_cast %arg17 : i32 to index
          %26 = affine.apply #map1()[%13, %25]
          %reinterpret_cast_1 = memref.reinterpret_cast %arg4 to offset: [%26], sizes: [1, 10240], strides: [10240, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<1x10240xf32, strided<[10240, 1], offset: ?>, #hivm.address_space<gm>>
          %collapse_shape = memref.collapse_shape %reinterpret_cast_1 [[0, 1]] : memref<1x10240xf32, strided<[10240, 1], offset: ?>, #hivm.address_space<gm>> into memref<10240xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %27 = affine.apply #map2()[%25]
          %28 = arith.maxsi %25, %8 : index
          %29 = arith.minsi %27, %28 : index
          %30 = affine.apply #map3()[%29, %25]
          %31 = arith.minsi %15, %30 : index
          %32 = arith.maxsi %31, %c0 : index
          %33 = arith.cmpi slt, %32, %c10240 : index
          %34 = arith.ori %18, %33 : i1
          scf.if %34 {
            func.call @_rmsnorm_fwd_kernel_outlined_vf_0(%24) {hivm.vector_function, no_inline} : (memref<1x10240xf32, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          %35 = affine.apply #map4()[%17, %32]
          %subview_2 = memref.subview %collapse_shape[0] [%35] [1] : memref<10240xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %subview_3 = memref.subview %24[0, 0] [1, %35] [1, 1] : memref<1x10240xf32, #hivm.address_space<ub>> to memref<1x?xf32, strided<[10240, 1]>, #hivm.address_space<ub>>
          %collapse_shape_4 = memref.collapse_shape %subview_3 [[0, 1]] : memref<1x?xf32, strided<[10240, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
          hivm.hir.load ins(%subview_2 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%collapse_shape_4 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 eviction_policy = <EvictFirst> core_type = <VECTOR>
          %36 = hivm.hir.pointer_cast(%c245824_i64) : memref<1xf32, #hivm.address_space<ub>>
          func.call @_rmsnorm_fwd_kernel_fused_0_outlined_vf_0(%24, %36) {hivm.vector_function, no_inline} : (memref<1x10240xf32, #hivm.address_space<ub>>, memref<1xf32, #hivm.address_space<ub>>) -> ()
          %37 = hivm.hir.pointer_cast(%c245920_i64) : memref<1xf32, #hivm.address_space<ub>>
          func.call @_rmsnorm_fwd_kernel_outlined_vf_1(%arg18, %36, %37) {hivm.vector_function, no_inline} : (memref<1xf32, #hivm.address_space<ub>>, memref<1xf32, #hivm.address_space<ub>>, memref<1xf32, #hivm.address_space<ub>>) -> ()
          scf.yield %37 : memref<1xf32, #hivm.address_space<ub>>
        }
        func.call @_rmsnorm_fwd_kernel_fused_2_outlined_vf_0(%19, %6, %7, %10) {hivm.vector_function, no_inline} : (memref<1xf32, #hivm.address_space<ub>>, memref<1xf32, #hivm.address_space<ub>>, memref<1xf32, #hivm.address_space<ub>>, memref<1xf32, #hivm.address_space<ub>>) -> ()
        %20 = arith.index_cast %arg16 : i32 to index
        %reinterpret_cast = memref.reinterpret_cast %arg7 to offset: [%20], sizes: [1], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %subview = memref.subview %10[0] [%14] [1] : memref<1xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %reinterpret_cast[0] [%14] [1] : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%subview_0 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>)
        %21 = arith.muli %arg16, %arg3 : i32
        %22 = memref.load %10[%c0] : memref<1xf32, #hivm.address_space<ub>>
        %23 = arith.index_cast %21 : i32 to index
        scf.for %arg17 = %c0_i32 to %arg9 step %c10240_i32  : i32 {
          %24 = hivm.hir.pointer_cast(%c0_i64, %c40960_i64) : memref<10240xf32, #hivm.address_space<ub>>
          annotation.mark %24 {hivm.multi_buffer = 2 : i32} : memref<10240xf32, #hivm.address_space<ub>>
          %25 = hivm.hir.pointer_cast(%c163904_i64, %c204864_i64) : memref<10240xf32, #hivm.address_space<ub>>
          annotation.mark %25 {hivm.multi_buffer = 2 : i32} : memref<10240xf32, #hivm.address_space<ub>>
          %26 = hivm.hir.pointer_cast(%c81984_i64, %c122944_i64) : memref<10240xf32, #hivm.address_space<ub>>
          annotation.mark %26 {hivm.multi_buffer = 2 : i32} : memref<10240xf32, #hivm.address_space<ub>>
          %27 = arith.index_cast %arg17 : i32 to index
          %28 = affine.apply #map1()[%13, %27]
          %reinterpret_cast_1 = memref.reinterpret_cast %arg4 to offset: [%28], sizes: [10240], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<10240xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %29 = affine.apply #map2()[%27]
          %30 = arith.maxsi %27, %8 : index
          %31 = arith.minsi %29, %30 : index
          %32 = affine.apply #map3()[%31, %27]
          %33 = arith.minsi %15, %32 : index
          %34 = arith.maxsi %33, %c0 : index
          %35 = arith.cmpi slt, %34, %c10240 : index
          %36 = arith.ori %18, %35 : i1
          scf.if %36 {
            func.call @_rmsnorm_fwd_kernel_outlined_vf_2(%26) {hivm.vector_function, no_inline} : (memref<10240xf32, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          %37 = affine.apply #map4()[%17, %34]
          %subview_2 = memref.subview %reinterpret_cast_1[0] [%37] [1] : memref<10240xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %subview_3 = memref.subview %26[0] [%37] [1] : memref<10240xf32, #hivm.address_space<ub>> to memref<?xf32, #hivm.address_space<ub>>
          hivm.hir.load ins(%subview_2 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_3 : memref<?xf32, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 eviction_policy = <EvictFirst> core_type = <VECTOR>
          %reinterpret_cast_4 = memref.reinterpret_cast %arg6 to offset: [%27], sizes: [10240], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<10240xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %38 = arith.cmpi slt, %32, %c10240 : index
          scf.if %38 {
            func.call @_rmsnorm_fwd_kernel_outlined_vf_3(%25) {hivm.vector_function, no_inline} : (memref<10240xf32, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          %subview_5 = memref.subview %reinterpret_cast_4[0] [%32] [1] : memref<10240xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %subview_6 = memref.subview %25[0] [%32] [1] : memref<10240xf32, #hivm.address_space<ub>> to memref<?xf32, #hivm.address_space<ub>>
          hivm.hir.load ins(%subview_5 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_6 : memref<?xf32, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 eviction_policy = <EvictFirst> core_type = <VECTOR>
          func.call @_rmsnorm_fwd_kernel_outlined_vf_4(%26, %25, %arg11, %22, %24) {hivm.vector_function, no_inline} : (memref<10240xf32, #hivm.address_space<ub>>, memref<10240xf32, #hivm.address_space<ub>>, f32, f32, memref<10240xf32, #hivm.address_space<ub>>) -> ()
          %39 = affine.apply #map1()[%23, %27]
          %reinterpret_cast_7 = memref.reinterpret_cast %arg2 to offset: [%39], sizes: [10240], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<10240xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %subview_8 = memref.subview %24[0] [%37] [1] : memref<10240xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
          %subview_9 = memref.subview %reinterpret_cast_7[0] [%37] [1] : memref<10240xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          hivm.hir.store ins(%subview_8 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%subview_9 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>)
        }
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}