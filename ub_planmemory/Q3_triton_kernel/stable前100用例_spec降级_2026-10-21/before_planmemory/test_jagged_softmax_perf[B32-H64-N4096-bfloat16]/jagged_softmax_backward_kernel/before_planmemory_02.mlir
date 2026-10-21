#map = affine_map<(d0) -> (0, d0)>
#map1 = affine_map<()[s0] -> (s0 + 1)>
#map2 = affine_map<()[s0, s1, s2] -> ((s1 + s2) * s0)>
#map3 = affine_map<()[s0] -> (s0 + 256)>
#map4 = affine_map<()[s0, s1] -> (s0 - s1)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<AIV>, ssbuffer.insertionOptimization} {
  func.func @jagged_softmax_backward_kernel_fused_0_outlined_vf_0(%arg0: memref<256x64xbf16, #hivm.address_space<ub>>, %arg1: memref<256x64xbf16, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant dense<0.000000e+00> : vector<64xf32>
    %0 = scf.for %arg3 = %c0 to %c256 step %c1 iter_args(%arg4 = %cst_0) -> (vector<64xf32>) {
      %subview = memref.subview %arg0[%arg3, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg3, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
      %3 = arith.extf %2 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
      %4 = arith.extf %1 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
      %5 = arith.mulf %4, %3 : vector<1x64xf32>
      %6 = vector.shape_cast %5 : vector<1x64xf32> to vector<64xf32>
      %7 = arith.addf %arg4, %6 : vector<64xf32>
      scf.yield %7 : vector<64xf32>
    }
    vector.transfer_write %0, %arg2[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_0(%arg0: memref<256x64xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 64] : vector<1x128xi1>
    scf.for %arg1 = %c0 to %c256 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_1(%arg0: memref<256x64xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 64] : vector<1x128xi1>
    scf.for %arg1 = %c0 to %c256 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_2(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %cst {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %1 = vector.transfer_read %arg1[%c0], %cst {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = arith.addf %0, %1 : vector<64xf32>
    vector.transfer_write %2, %arg2[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_3(%arg0: memref<256x64xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 64] : vector<1x128xi1>
    scf.for %arg1 = %c0 to %c256 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_4(%arg0: memref<256x64xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 64] : vector<1x128xi1>
    scf.for %arg1 = %c0 to %c256 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_5(%arg0: memref<256x64xbf16, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<256x64xbf16, #hivm.address_space<ub>>, %arg3: memref<256x64xbf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg1[%c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<64xf32, #hivm.address_space<ub>>, vector<1x64xf32>
    scf.for %arg4 = %c0 to %c256 step %c1 {
      %subview = memref.subview %arg0[%arg4, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg4, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg3[%arg4, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
      %3 = arith.extf %2 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
      %4 = arith.extf %1 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
      %5 = arith.subf %4, %0 : vector<1x64xf32>
      %6 = arith.mulf %5, %3 : vector<1x64xf32>
      %7 = arith.truncf %6 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
      vector.transfer_write %7, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xbf16>, memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_6(%arg0: memref<64xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c0 = arith.constant 0 : index
    vector.transfer_write %cst, %arg0[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @jagged_softmax_backward_kernel(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg5: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, false, false, false, false, false, false]> : vector<12xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "aiv", parallel_mode = "simd"} {
    %c0_i64 = arith.constant 0 : i64
    %c4096_i64 = arith.constant 4096 : i64
    %c256_i64 = arith.constant 256 : i64
    %c0 = arith.constant 0 : index
    %c256 = arith.constant 256 : index
    %cst = arith.constant 0.000000e+00 : bf16
    %c56_i32 = arith.constant 56 : i32
    %0 = arith.muli %arg9, %arg10 : i32
    %1 = arith.muli %0, %arg11 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %4 = arith.index_cast %arg6 : i32 to index
    %5 = arith.index_cast %arg7 : i32 to index
    %6 = arith.index_cast %arg8 : i32 to index
    scf.for %arg12 = %3 to %1 step %c56_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %7 = arith.remsi %arg12, %arg9 : i32
      %alloc = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
      func.call @jagged_softmax_backward_kernel_outlined_vf_6(%alloc) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>) -> ()
      %8 = arith.index_cast %7 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg5 to offset: [%8], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %9 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %10 = affine.apply #map1()[%8]
      %reinterpret_cast_0 = memref.reinterpret_cast %arg5 to offset: [%10], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %11 = memref.load %reinterpret_cast_0[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %12 = arith.subi %11, %9 : i64
      %13 = arith.minsi %12, %c4096_i64 : i64
      %14 = arith.index_cast %9 : i64 to index
      %15 = arith.index_cast %13 : i64 to index
      %16 = scf.for %arg13 = %c0_i64 to %13 step %c256_i64 iter_args(%arg14 = %alloc) -> (memref<64xf32, #hivm.address_space<ub>>)  : i64 {
        %17 = arith.index_cast %arg13 : i64 to index
        %18 = affine.apply #map2()[%4, %14, %17]
        %reinterpret_cast_1 = memref.reinterpret_cast %arg2 to offset: [%18], sizes: [256, 64], strides: [%4, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %19 = affine.apply #map2()[%5, %14, %17]
        %reinterpret_cast_2 = memref.reinterpret_cast %arg3 to offset: [%19], sizes: [256, 64], strides: [%5, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_3 = memref.alloc() : memref<256x64xbf16, #hivm.address_space<ub>>
        annotation.mark %alloc_3 {hivm.multi_buffer = 2 : i32} : memref<256x64xbf16, #hivm.address_space<ub>>
        %20 = affine.apply #map3()[%17]
        %21 = arith.maxsi %17, %15 : index
        %22 = arith.minsi %20, %21 : index
        %23 = affine.apply #map4()[%22, %17]
        %24 = arith.minsi %23, %c256 : index
        %25 = arith.maxsi %24, %c0 : index
        %26 = arith.cmpi slt, %25, %c256 : index
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_0(%alloc_3) {hivm.vector_function, no_inline} : (memref<256x64xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview = memref.subview %reinterpret_cast_1[0, 0] [%25, 64] [1, 1] : memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_4 = memref.subview %alloc_3[0, 0] [%25, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview : memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_4 : memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : bf16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %alloc_5 = memref.alloc() : memref<256x64xbf16, #hivm.address_space<ub>>
        annotation.mark %alloc_5 {hivm.multi_buffer = 2 : i32} : memref<256x64xbf16, #hivm.address_space<ub>>
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_1(%alloc_5) {hivm.vector_function, no_inline} : (memref<256x64xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview_6 = memref.subview %reinterpret_cast_2[0, 0] [%25, 64] [1, 1] : memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_7 = memref.subview %alloc_5[0, 0] [%25, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview_6 : memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_7 : memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : bf16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %alloc_8 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
        func.call @jagged_softmax_backward_kernel_fused_0_outlined_vf_0(%alloc_3, %alloc_5, %alloc_8) {hivm.vector_function, no_inline} : (memref<256x64xbf16, #hivm.address_space<ub>>, memref<256x64xbf16, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
        %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
        func.call @jagged_softmax_backward_kernel_outlined_vf_2(%arg14, %alloc_8, %alloc_9) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
        scf.yield %alloc_9 : memref<64xf32, #hivm.address_space<ub>>
      }
      scf.for %arg13 = %c0_i64 to %13 step %c256_i64  : i64 {
        %17 = arith.index_cast %arg13 : i64 to index
        %18 = affine.apply #map2()[%4, %14, %17]
        %reinterpret_cast_1 = memref.reinterpret_cast %arg2 to offset: [%18], sizes: [256, 64], strides: [%4, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %19 = affine.apply #map2()[%5, %14, %17]
        %reinterpret_cast_2 = memref.reinterpret_cast %arg3 to offset: [%19], sizes: [256, 64], strides: [%5, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_3 = memref.alloc() : memref<256x64xbf16, #hivm.address_space<ub>>
        annotation.mark %alloc_3 {hivm.multi_buffer = 2 : i32} : memref<256x64xbf16, #hivm.address_space<ub>>
        %20 = affine.apply #map3()[%17]
        %21 = arith.maxsi %17, %15 : index
        %22 = arith.minsi %20, %21 : index
        %23 = affine.apply #map4()[%22, %17]
        %24 = arith.minsi %23, %c256 : index
        %25 = arith.maxsi %24, %c0 : index
        %26 = arith.cmpi slt, %25, %c256 : index
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_3(%alloc_3) {hivm.vector_function, no_inline} : (memref<256x64xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview = memref.subview %reinterpret_cast_1[0, 0] [%25, 64] [1, 1] : memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_4 = memref.subview %alloc_3[0, 0] [%25, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview : memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_4 : memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : bf16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %alloc_5 = memref.alloc() : memref<256x64xbf16, #hivm.address_space<ub>>
        annotation.mark %alloc_5 {hivm.multi_buffer = 2 : i32} : memref<256x64xbf16, #hivm.address_space<ub>>
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_4(%alloc_5) {hivm.vector_function, no_inline} : (memref<256x64xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview_6 = memref.subview %reinterpret_cast_2[0, 0] [%25, 64] [1, 1] : memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_7 = memref.subview %alloc_5[0, 0] [%25, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview_6 : memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_7 : memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : bf16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %27 = affine.apply #map2()[%6, %14, %17]
        %reinterpret_cast_8 = memref.reinterpret_cast %arg4 to offset: [%27], sizes: [256, 64], strides: [%6, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<256x64xbf16, #hivm.address_space<ub>>
        annotation.mark %alloc_9 {hivm.multi_buffer = 2 : i32} : memref<256x64xbf16, #hivm.address_space<ub>>
        func.call @jagged_softmax_backward_kernel_outlined_vf_5(%alloc_3, %16, %alloc_5, %alloc_9) {hivm.vector_function, no_inline} : (memref<256x64xbf16, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<256x64xbf16, #hivm.address_space<ub>>, memref<256x64xbf16, #hivm.address_space<ub>>) -> ()
        %subview_10 = memref.subview %alloc_9[0, 0] [%25, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>
        %subview_11 = memref.subview %reinterpret_cast_8[0, 0] [%25, 64] [1, 1] : memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_10 : memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>) outs(%subview_11 : memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>)
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}
