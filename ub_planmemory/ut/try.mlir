#map = affine_map<(d0) -> (d0, 0)>
#map1 = affine_map<()[s0, s1] -> (s0 + s1 * 128)>
#map2 = affine_map<(d0) -> (d0 * 16)>
#map3 = affine_map<()[s0] -> (s0 * 64)>
#map4 = affine_map<()[s0] -> (s0 * 4)>
#map5 = affine_map<()[s0, s1] -> (s0 + s1)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  func.func @_attn_fwd_mix_aiv_fused_4_outlined_merged_vf_0(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>, %arg3: memref<64xf32, #hivm.address_space<ub>>, %arg4: memref<64x128xf32, #hivm.address_space<ub>>, %arg5: memref<64x128xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
    %c128 = arith.constant 128 : index
    %c64 = arith.constant 64 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %cst {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %1 = vector.transfer_read %arg1[%c0], %cst {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = math.log %1 : vector<64xf32>
    %3 = arith.addf %0, %2 : vector<64xf32>
    vector.transfer_write %3, %arg2[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg3[%arg6] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %4 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      scf.for %arg7 = %c0 to %c128 step %c64 {
        %subview_0 = memref.subview %arg4[%arg6, %arg7] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg5[%arg6, %arg7] [1, 64] [1, 1] : memref<64x128xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %5 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %6 = arith.divf %5, %4 : vector<1x64xf32>
        %7 = arith.truncf %6 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
        vector.transfer_write %7, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf16>, memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @_attn_fwd_mix_aiv_fused_2_outlined_merged_vf_0(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>, %arg3: memref<64xf32, #hivm.address_space<ub>>, %arg4: memref<64xf32, #hivm.address_space<ub>>, %arg5: memref<64x128xf32, #hivm.address_space<ub>>, %arg6: memref<64x128xf32, #hivm.address_space<ub>>, %arg7: memref<64x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
    %c128 = arith.constant 128 : index
    %c64 = arith.constant 64 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %cst {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %1 = vector.transfer_read %arg1[%c0], %cst {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = vector.transfer_read %arg2[%c0], %cst {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %3 = arith.mulf %0, %1 : vector<64xf32>
    %4 = arith.addf %3, %2 : vector<64xf32>
    vector.transfer_write %4, %arg3[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    scf.for %arg8 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg4[%arg8] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %5 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      scf.for %arg9 = %c0 to %c128 step %c64 {
        %subview_0 = memref.subview %arg5[%arg8, %arg9] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg6[%arg8, %arg9] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg7[%arg8, %arg9] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %6 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %8 = arith.mulf %7, %5 : vector<1x64xf32>
        %9 = arith.addf %6, %8 : vector<1x64xf32>
        vector.transfer_write %9, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @_attn_fwd_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32, #hivm.address_space<gm>>, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg7: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg8: memref<?xi32, #hivm.address_space<gm>>, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, false, false, false, false]> : vector<13xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c229376_i64 = arith.constant 229376 : i64
    %c131072_i64 = arith.constant 131072 : i64
    %c196608_i64 = arith.constant 196608 : i64
    %c98304_i64 = arith.constant 98304 : i64
    %c98560_i64 = arith.constant 98560 : i64
    %c65792_i64 = arith.constant 65792 : i64
    %c33024_i64 = arith.constant 33024 : i64
    %c256_i64 = arith.constant 256 : i64
    %c32768_i64 = arith.constant 32768 : i64
    %c65536_i64 = arith.constant 65536 : i64
    %c163840_i64 = arith.constant 163840 : i64
    %c0_i64 = arith.constant 0 : i64
    %c0_i64_0 = arith.constant 0 : i64
    %c128 = arith.constant 128 : index
    %c65536_i32 = arith.constant 65536 : i32
    %c8192_i32 = arith.constant 8192 : i32
    %c0_i32 = arith.constant 0 : i32
    %c64_i32 = arith.constant 64 : i32
    %c8_i32 = arith.constant 8 : i32
    %c8388608_i64 = arith.constant 8388608 : i64
    %c1048576_i64 = arith.constant 1048576 : i64
    %c128_i32 = arith.constant 128 : i32
    %c1024_i64 = arith.constant 1024 : i64
    %c4_i64 = arith.constant 4 : i64
    %c1028_i64 = arith.constant 1028 : i64
    %c8_i64 = arith.constant 8 : i64
    %c1032_i64 = arith.constant 1032 : i64
    %c2_i32 = arith.constant 2 : i32
    %c8576_i32 = arith.constant 8576 : i32
    %c256_i32 = arith.constant 256 : i32
    %true = arith.constant true
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg10, %arg11 : i32
    %1 = arith.muli %0, %arg12 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    scf.for %arg13 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %4 = arith.remsi %arg13, %arg10 : i32
      %5 = hivm.hir.pointer_cast(%c0_i64_0) : memref<i32, #hivm.address_space<ssbuf>>
      %6 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %5[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %6[] : memref<i32, #hivm.address_space<ssbuf>>
      %7 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %8 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %7[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %8[] : memref<i32, #hivm.address_space<ssbuf>>
      %9 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %10 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %9[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %10[] : memref<i32, #hivm.address_space<ssbuf>>
      scf.for %arg14 = %4 to %c65536_i32 step %c28_i32  : i32 {
        %11 = hivm.hir.pointer_cast(%c0_i64, %c163840_i64) : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %11 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %12 = arith.divsi %arg14, %c64_i32 : i32
        %13 = arith.remsi %arg14, %c64_i32 : i32
        %14 = arith.divsi %12, %c8_i32 : i32
        %15 = arith.remsi %12, %c8_i32 : i32
        %16 = arith.extsi %15 : i32 to i64
        %17 = arith.muli %15, %arg9 : i32
        %18 = arith.divsi %17, %c8_i32 : i32
        %19 = arith.extsi %14 : i32 to i64
        %20 = arith.muli %19, %c8388608_i64 : i64
        %21 = arith.muli %16, %c1048576_i64 : i64
        %22 = arith.addi %20, %21 : i64
        %23 = arith.extsi %18 : i32 to i64
        %24 = arith.muli %23, %c1048576_i64 : i64
        %25 = arith.addi %20, %24 : i64
        %26 = arith.index_cast %22 : i64 to index
        %27 = arith.muli %13, %c128_i32 : i32
        %28 = arith.maxsi %27, %c0_i32 : i32
        %29 = arith.index_cast %28 : i32 to index
        %30 = affine.apply #map1()[%26, %29]
        %reinterpret_cast = memref.reinterpret_cast %arg2 to offset: [%30], sizes: [128, 128], strides: [128, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
        %31 = arith.index_cast %25 : i64 to index
        %cast = memref.cast %11 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
        hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast : memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
        %32 = hivm.hir.pointer_cast(%c65536_i64) : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %33 = hivm.hir.pointer_cast(%c32768_i64) : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %33 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %32 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 4
        %34 = hivm.hir.pointer_cast(%c256_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        %35 = hivm.hir.pointer_cast(%c33024_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %35 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %34 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %36 = hivm.hir.pointer_cast(%c65792_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        %37 = hivm.hir.pointer_cast(%c98560_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %37 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %36 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %38:5 = scf.for %arg15 = %c0_i32 to %c8576_i32 step %c128_i32 iter_args(%arg16 = %c0_i32, %arg17 = %c0_i32, %arg18 = %c0_i32, %arg19 = %c0_i32, %arg20 = %c0_i32) -> (i32, i32, i32, i32, i32)  : i32 {
          %39 = hivm.hir.pointer_cast(%c65536_i64, %c196608_i64) : memref<8x8x16x16xf32, #hivm.address_space<cc>>
          annotation.mark %39 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
          %40 = hivm.hir.pointer_cast(%c131072_i64, %c229376_i64) : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
          annotation.mark %40 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
          %41 = hivm.hir.pointer_cast(%c0_i64, %c131072_i64) : memref<8x8x16x16xf32, #hivm.address_space<cc>>
          annotation.mark %41 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
          %42 = hivm.hir.pointer_cast(%c98304_i64, %c196608_i64) : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
          annotation.mark %42 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          %43 = arith.cmpi slt, %arg18, %c8192_i32 : i32
          %44 = scf.if %43 -> (i32) {
            %71 = arith.addi %arg18, %c128_i32 : i32
            scf.yield %71 : i32
          } else {
            scf.yield %arg18 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 10 : i32}
          %45 = memref.load %5[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %45 {memref_ext.volatile} : i32
          %46 = arith.cmpi slt, %45, %c2_i32 : i32
          %47 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %47 {memref_ext.volatile} : i32
          %48 = arith.cmpi slt, %47, %c2_i32 : i32
          %49 = arith.andi %46, %48 : i1
          %50 = arith.cmpi slt, %arg19, %c8192_i32 : i32
          %51 = arith.andi %49, %50 : i1
          %52:2 = scf.if %51 -> (i32, i32) {
            %71 = arith.divsi %arg19, %c128_i32 : i32
            %72 = arith.remsi %71, %c2_i32 : i32
            %73 = arith.cmpi eq, %72, %c0_i32 : i32
            %74 = arith.maxsi %arg16, %c0_i32 : i32
            %75 = arith.index_cast %74 : i32 to index
            %76 = affine.apply #map1()[%31, %75]
            %reinterpret_cast_1 = memref.reinterpret_cast %arg3 to offset: [%76], sizes: [128, 128], strides: [128, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
            %cast_2 = memref.cast %42 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
            hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast_1 : memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_2 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
            %cast_3 = memref.cast %41 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, normalized_in_L0C} ins(%cast, %cast_2, %true, %c128, %c128, %c128 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_3 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %73 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%41 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%34 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%41 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%35 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 5
            }
            %77 = arith.addi %arg16, %c128_i32 : i32
            %78 = memref.load %5[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %78 {memref_ext.volatile} : i32
            %79 = arith.addi %78, %c1_i32 : i32
            memref.store %79, %5[] : memref<i32, #hivm.address_space<ssbuf>>
            %80 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %80 {memref_ext.volatile} : i32
            %81 = arith.addi %80, %c1_i32 : i32
            memref.store %81, %6[] : memref<i32, #hivm.address_space<ssbuf>>
            %82 = arith.addi %arg19, %c128_i32 : i32
            scf.yield %77, %82 : i32, i32
          } else {
            scf.yield %arg16, %arg19 : i32, i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 4 : i32}
          %53 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %53 {memref_ext.volatile} : i32
          %54 = arith.cmpi sgt, %53, %c0_i32 : i32
          %55 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %55 {memref_ext.volatile} : i32
          %56 = arith.cmpi sgt, %55, %c0_i32 : i32
          %57 = arith.andi %54, %56 : i1
          %58 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %58 {memref_ext.volatile} : i32
          %59 = arith.cmpi slt, %58, %c2_i32 : i32
          %60 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %60 {memref_ext.volatile} : i32
          %61 = arith.cmpi slt, %60, %c2_i32 : i32
          %62 = arith.andi %59, %61 : i1
          %63 = arith.andi %57, %62 : i1
          %64 = arith.cmpi sge, %arg19, %c8192_i32 : i32
          %65 = arith.cmpi sge, %arg19, %c256_i32 : i32
          %66 = arith.ori %64, %65 : i1
          %67 = arith.cmpi slt, %arg20, %c8192_i32 : i32
          %68 = arith.andi %63, %66 : i1
          %69 = arith.andi %68, %67 : i1
          %70:2 = scf.if %69 -> (i32, i32) {
            %71 = arith.divsi %arg20, %c128_i32 : i32
            %72 = arith.remsi %71, %c2_i32 : i32
            %73 = arith.cmpi eq, %72, %c0_i32 : i32
            %74 = arith.maxsi %arg17, %c0_i32 {ssbuffer.arg = 1 : i32} : i32
            %75 = arith.index_cast %74 : i32 to index
            %76 = affine.apply #map1()[%31, %75]
            %reinterpret_cast_1 = memref.reinterpret_cast %arg4 to offset: [%76], sizes: [128, 128], strides: [128, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
            %cast_2 = memref.cast %40 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
            hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast_1 : memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_2 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
            %77 = arith.select %73, %32, %33 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
            scf.if %73 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
            }
            %cast_3 = memref.cast %39 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, normalized_in_L0C} ins(%77, %cast_2, %true, %c128, %c128, %c128 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_3 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %73 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%39 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%36 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 3
              hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%39 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%37 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 6
              hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 4
            }
            %78 = arith.addi %arg17, %c128_i32 {ssbuffer.arg = 1 : i32} : i32
            %79 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %79 {memref_ext.volatile} : i32
            %80 = arith.subi %79, %c1_i32 : i32
            memref.store %80, %9[] : memref<i32, #hivm.address_space<ssbuf>>
            %81 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %81 {memref_ext.volatile} : i32
            %82 = arith.subi %81, %c1_i32 : i32
            memref.store %82, %10[] : memref<i32, #hivm.address_space<ssbuf>>
            %83 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %83 {memref_ext.volatile} : i32
            %84 = arith.addi %83, %c1_i32 : i32
            memref.store %84, %7[] : memref<i32, #hivm.address_space<ssbuf>>
            %85 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %85 {memref_ext.volatile} : i32
            %86 = arith.addi %85, %c1_i32 : i32
            memref.store %86, %8[] : memref<i32, #hivm.address_space<ssbuf>>
            %87 = arith.addi %arg20, %c128_i32 : i32
            scf.yield %78, %87 : i32, i32
          } else {
            scf.yield %arg17, %arg20 : i32, i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 6 : i32}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %52#0, %70#0, %44, %52#1, %70#1 : i32, i32, i32, i32, i32
        } {fixpipe_for_mmad_result_already_inserted = true}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
  func.func @_attn_fwd_mix_aiv_outlined_vf_0(%arg0: memref<64x128xf32, #hivm.address_space<ub>>, %arg1: memref<64x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<5.000000e-01> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c64 step %c1 {
      scf.for %arg3 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg2, %arg3] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg2, %arg3] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = arith.mulf %0, %cst : vector<1x64xf32>
        vector.transfer_write %1, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @_attn_fwd_mix_aiv_outlined_vf_1(%arg0: memref<64x128xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<0xFF800000> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg1[%arg2] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = scf.for %arg3 = %c0 to %c128 step %c64 iter_args(%arg4 = %cst_0) -> (vector<1x64xf32>) {
        %subview_1 = memref.subview %arg0[%arg2, %arg3] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %3 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %4 = arith.maximumf %3, %arg4 {reductionOp} : vector<1x64xf32>
        scf.yield %4 : vector<1x64xf32>
      } {reductionLoop}
      %1 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true]} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1xf32>
      %2 = vector.multi_reduction <maximumf>, %0, %1 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
      vector.transfer_write %2, %subview[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @_attn_fwd_mix_aiv_outlined_vf_2(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>, %arg3: memref<64xf32, #hivm.address_space<ub>>, %arg4: memref<64x128xf32, #hivm.address_space<ub>>, %arg5: memref<64xf32, #hivm.address_space<ub>>, %arg6: memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %cst_0 {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %1 = vector.transfer_read %arg1[%c0], %cst_0 {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = arith.maximumf %0, %1 : vector<64xf32>
    vector.transfer_write %2, %arg2[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    %3 = arith.subf %0, %2 : vector<64xf32>
    %4 = math.exp %3 : vector<64xf32>
    vector.transfer_write %4, %arg3[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    scf.for %arg7 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg5[%arg7] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg7] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %5 = vector.transfer_read %subview_1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %6 = scf.for %arg8 = %c0 to %c8 step %c4 iter_args(%arg9 = %cst) -> (vector<1x64xf32>) {
        %9 = affine.apply #map2(%arg8)
        %subview_2 = memref.subview %arg4[%arg7, %9] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = vector.transfer_read %subview_2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = arith.subf %10, %5 : vector<1x64xf32>
        %12 = math.exp %11 : vector<1x64xf32>
        %13 = arith.addf %12, %arg9 {reductionOp} : vector<1x64xf32>
        %14 = arith.truncf %12 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
        %subview_3 = memref.subview %arg6[%arg8, %arg7, 0] [4, 1, 16] [1, 1, 1] : memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<4x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
        %15 = vector.shape_cast %14 : vector<1x64xf16> to vector<4x1x16xf16>
        vector.transfer_write %15, %subview_3[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<4x1x16xf16>, memref<4x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
        scf.yield %13 : vector<1x64xf32>
      } {reductionLoop, unroll_for_vsstb}
      %7 = vector.transfer_read %subview[%c0], %cst_0 {in_bounds = [true]} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1xf32>
      %8 = vector.multi_reduction <add>, %6, %7 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
      vector.transfer_write %8, %subview[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @_attn_fwd_mix_aiv_outlined_vf_4(%arg0: memref<64xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<1.000000e+00> : vector<64xf32>
    %c0 = arith.constant 0 : index
    vector.transfer_write %cst, %arg0[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @_attn_fwd_mix_aiv_outlined_vf_5(%arg0: memref<64x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c64 step %c1 {
      scf.for %arg2 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @_attn_fwd_mix_aiv_outlined_vf_7(%arg0: memref<64xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0xFF800000> : vector<64xf32>
    %c0 = arith.constant 0 : index
    vector.transfer_write %cst, %arg0[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @_attn_fwd_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32, #hivm.address_space<gm>>, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg7: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg8: memref<?xi32, #hivm.address_space<gm>>, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, false, false, false, false]> : vector<13xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c183552_i64 = arith.constant 183552 : i64
    %c183296_i64 = arith.constant 183296 : i64
    %c133632_i64 = arith.constant 133632 : i64
    %c133376_i64 = arith.constant 133376 : i64
    %c132864_i64 = arith.constant 132864 : i64
    %c133120_i64 = arith.constant 133120 : i64
    %c150528_i64 = arith.constant 150528 : i64
    %c150272_i64 = arith.constant 150272 : i64
    %c131840_i64 = arith.constant 131840 : i64
    %c131584_i64 = arith.constant 131584 : i64
    %c131328_i64 = arith.constant 131328 : i64
    %c132608_i64 = arith.constant 132608 : i64
    %c132096_i64 = arith.constant 132096 : i64
    %c132352_i64 = arith.constant 132352 : i64
    %c98560_i64 = arith.constant 98560 : i64
    %c65792_i64 = arith.constant 65792 : i64
    %c33024_i64 = arith.constant 33024 : i64
    %c256_i64 = arith.constant 256 : i64
    %c32768_i64 = arith.constant 32768 : i64
    %c65536_i64 = arith.constant 65536 : i64
    %c0_i64 = arith.constant 0 : i64
    %c28_i32 = arith.constant 28 : i32
    %c1_i32 = arith.constant 1 : i32
    %c8576_i32 = arith.constant 8576 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %c1032_i64 = arith.constant 1032 : i64
    %c8_i64 = arith.constant 8 : i64
    %c1028_i64 = arith.constant 1028 : i64
    %c4_i64 = arith.constant 4 : i64
    %c1024_i64 = arith.constant 1024 : i64
    %c128_i32 = arith.constant 128 : i32
    %c1048576_i64 = arith.constant 1048576 : i64
    %c8388608_i64 = arith.constant 8388608 : i64
    %c8_i32 = arith.constant 8 : i32
    %c64_i32 = arith.constant 64 : i32
    %c0_i32 = arith.constant 0 : i32
    %c8192_i32 = arith.constant 8192 : i32
    %c65536_i32 = arith.constant 65536 : i32
    %c0_i64_0 = arith.constant 0 : i64
    %0 = arith.muli %arg10, %arg11 : i32
    %1 = arith.muli %0, %arg12 : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %4 = hivm.hir.get_sub_block_idx -> i64
    %5 = arith.muli %4, %c1024_i64 : i64
    %6 = arith.addi %5, %c4_i64 : i64
    %7 = arith.addi %5, %c8_i64 : i64
    %8 = hivm.hir.pointer_cast(%c0_i64) : memref<64xf32, #hivm.address_space<ub>>
    call @_attn_fwd_mix_aiv_outlined_vf_7(%8) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>) -> ()
    %9 = arith.index_cast %4 : i64 to index
    %10 = affine.apply #map3()[%9]
    %11 = affine.apply #map4()[%9]
    annotation.mark %1 {logical_block_num} : i32
    scf.for %arg13 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %12 = arith.remsi %arg13, %arg10 : i32
      %13 = hivm.hir.pointer_cast(%c0_i64_0) : memref<i32, #hivm.address_space<ssbuf>>
      %14 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %13[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %14[] : memref<i32, #hivm.address_space<ssbuf>>
      %15 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %16 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %15[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %16[] : memref<i32, #hivm.address_space<ssbuf>>
      %17 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %18 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %17[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %18[] : memref<i32, #hivm.address_space<ssbuf>>
      %19 = hivm.hir.pointer_cast(%6) : memref<i32, #hivm.address_space<ssbuf>>
      %20 = hivm.hir.pointer_cast(%5) : memref<i32, #hivm.address_space<ssbuf>>
      %21 = hivm.hir.pointer_cast(%7) : memref<i32, #hivm.address_space<ssbuf>>
      scf.for %arg14 = %12 to %c65536_i32 step %c28_i32  : i32 {
        %22 = hivm.hir.pointer_cast(%c65536_i64) : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %subview = memref.subview %22[0, %11, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %23 = hivm.hir.pointer_cast(%c32768_i64) : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %subview_1 = memref.subview %23[0, %11, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %23 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %22 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %24 = hivm.hir.pointer_cast(%c256_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %24 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %25 = hivm.hir.pointer_cast(%c33024_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %25 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        %26 = hivm.hir.pointer_cast(%c65792_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %26 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %27 = hivm.hir.pointer_cast(%c98560_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %27 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        %28 = hivm.hir.pointer_cast(%c132352_i64) : memref<64xf32, #hivm.address_space<ub>>
        %29 = hivm.hir.pointer_cast(%c132096_i64) : memref<64xf32, #hivm.address_space<ub>>
        %30 = hivm.hir.pointer_cast(%c132608_i64) : memref<64xf32, #hivm.address_space<ub>>
        %31 = hivm.hir.pointer_cast(%c131328_i64) : memref<64xf32, #hivm.address_space<ub>>
        %32 = hivm.hir.pointer_cast(%c131584_i64) : memref<64xf32, #hivm.address_space<ub>>
        %33 = hivm.hir.pointer_cast(%c131840_i64) : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        %34 = hivm.hir.pointer_cast(%c150272_i64) : memref<64xf32, #hivm.address_space<ub>>
        func.call @_attn_fwd_mix_aiv_outlined_vf_4(%34) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>) -> ()
        %35 = hivm.hir.pointer_cast(%c150528_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        func.call @_attn_fwd_mix_aiv_outlined_vf_5(%35) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>) -> ()
        %36 = hivm.hir.pointer_cast(%c133120_i64) : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%8 : memref<64xf32, #hivm.address_space<ub>>) outs(%36 : memref<64xf32, #hivm.address_space<ub>>)
        %37:8 = scf.for %arg15 = %c0_i32 to %c8576_i32 step %c128_i32 iter_args(%arg16 = %35, %arg17 = %34, %arg18 = %36, %arg19 = %c0_i32, %arg20 = %c0_i32, %arg21 = %c0_i32, %arg22 = %c0_i32, %arg23 = %c0_i32) -> (memref<64x128xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32, i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          %58 = arith.cmpi slt, %arg19, %c8192_i32 : i32
          %59 = scf.if %58 -> (i32) {
            %81 = arith.addi %arg19, %c128_i32 : i32
            scf.yield %81 : i32
          } else {
            scf.yield %arg19 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 10 : i32}
          %60 = memref.load %20[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %60 {memref_ext.volatile} : i32
          %61 = arith.cmpi sgt, %60, %c0_i32 : i32
          %62 = memref.load %21[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %62 {memref_ext.volatile} : i32
          %63 = arith.cmpi slt, %62, %c2_i32 : i32
          %64 = arith.andi %61, %63 : i1
          %65 = arith.cmpi slt, %arg22, %c3_i32 : i32
          %66 = arith.cmpi slt, %arg23, %c3_i32 : i32
          %67 = arith.andi %65, %66 : i1
          %68 = arith.cmpi slt, %arg20, %c8192_i32 : i32
          %69 = arith.andi %64, %67 : i1
          %70 = arith.andi %69, %68 : i1
          %71:4 = scf.if %70 -> (memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %81 = arith.divsi %arg20, %c128_i32 : i32
            %82 = arith.remsi %81, %c2_i32 : i32
            %83 = arith.cmpi eq, %82, %c0_i32 : i32
            %84 = arith.select %83, %24, %25 : memref<64x128xf32, #hivm.address_space<ub>>
            scf.if %83 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 5
            }
            func.call @_attn_fwd_mix_aiv_outlined_vf_0(%84, %84) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
            %85 = hivm.hir.pointer_cast(%c132864_i64) : memref<64xf32, #hivm.address_space<ub>>
            func.call @_attn_fwd_mix_aiv_outlined_vf_1(%84, %85) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
            %86 = hivm.hir.pointer_cast(%c133120_i64) : memref<64xf32, #hivm.address_space<ub>>
            %87 = hivm.hir.pointer_cast(%c132864_i64) : memref<64xf32, #hivm.address_space<ub>>
            %88 = hivm.hir.pointer_cast(%c133376_i64) : memref<64xf32, #hivm.address_space<ub>>
            %89 = hivm.hir.pointer_cast(%c133632_i64) : memref<8x65x16x1xf16, #hivm.address_space<ub>>
            %subview_6 = memref.subview %89[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xf16, #hivm.address_space<ub>> to memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
            func.call @_attn_fwd_mix_aiv_outlined_vf_2(%arg18, %85, %86, %87, %84, %88, %subview_6) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
            %expand_shape = memref.expand_shape %subview_6 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
            scf.if %83 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
              %collapse_shape_7 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_8 = memref.collapse_shape %subview [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_7 : memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_8 : memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 4
              %collapse_shape_7 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_8 = memref.collapse_shape %subview_1 [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_7 : memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_8 : memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
            }
            %90 = arith.divui %arg20, %c128_i32 : i32
            %91 = arith.remsi %90, %c3_i32 : i32
            %92 = arith.cmpi eq, %91, %c0_i32 : i32
            scf.if %92 {
              hivm.hir.copy ins(%87 : memref<64xf32, #hivm.address_space<ub>>) outs(%28 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              hivm.hir.copy ins(%88 : memref<64xf32, #hivm.address_space<ub>>) outs(%31 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
            } else {
              %100 = arith.cmpi eq, %91, %c1_i32 : i32
              scf.if %100 {
                hivm.hir.copy ins(%87 : memref<64xf32, #hivm.address_space<ub>>) outs(%29 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%88 : memref<64xf32, #hivm.address_space<ub>>) outs(%32 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              } else {
                hivm.hir.copy ins(%87 : memref<64xf32, #hivm.address_space<ub>>) outs(%30 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%88 : memref<64xf32, #hivm.address_space<ub>>) outs(%33 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              }
            }
            %93 = memref.load %20[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %93 {memref_ext.volatile} : i32
            %94 = arith.subi %93, %c1_i32 : i32
            memref.store %94, %20[] : memref<i32, #hivm.address_space<ssbuf>>
            %95 = memref.load %21[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %95 {memref_ext.volatile} : i32
            %96 = arith.addi %95, %c1_i32 : i32
            memref.store %96, %21[] : memref<i32, #hivm.address_space<ssbuf>>
            %97 = arith.addi %arg23, %c1_i32 : i32
            %98 = arith.addi %arg22, %c1_i32 : i32
            %99 = arith.addi %arg20, %c128_i32 : i32
            scf.yield %86, %97, %98, %99 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg18, %arg23, %arg22, %arg20 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          %72 = memref.load %19[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %72 {memref_ext.volatile} : i32
          %73 = arith.cmpi sgt, %72, %c0_i32 : i32
          %74 = arith.cmpi sgt, %71#2, %c0_i32 : i32
          %75 = arith.cmpi sgt, %71#1, %c0_i32 : i32
          %76 = arith.andi %74, %75 : i1
          %77 = arith.cmpi slt, %arg21, %c8192_i32 : i32
          %78 = arith.andi %73, %76 : i1
          %79 = arith.andi %78, %77 : i1
          %80:5 = scf.if %79 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %81 = arith.divsi %arg21, %c128_i32 : i32
            %82 = arith.remsi %81, %c2_i32 : i32
            %83 = arith.cmpi eq, %82, %c0_i32 : i32
            %84 = arith.divui %arg21, %c128_i32 : i32
            %85 = arith.remsi %84, %c3_i32 : i32
            %86 = arith.cmpi eq, %85, %c0_i32 : i32
            %87:2 = scf.if %86 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) {
              scf.yield %31, %28 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            } else {
              %96 = arith.cmpi eq, %85, %c1_i32 : i32
              %97 = arith.select %96, %32, %33 : memref<64xf32, #hivm.address_space<ub>>
              %98 = arith.select %96, %29, %30 : memref<64xf32, #hivm.address_space<ub>>
              scf.yield %97, %98 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            }
            %88 = arith.select %83, %26, %27 : memref<64x128xf32, #hivm.address_space<ub>>
            scf.if %83 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 3
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 6
            }
            %89 = hivm.hir.pointer_cast(%c150272_i64) : memref<64xf32, #hivm.address_space<ub>>
            %90 = hivm.hir.pointer_cast(%c150528_i64) : memref<64x128xf32, #hivm.address_space<ub>>
            func.call @_attn_fwd_mix_aiv_fused_2_outlined_merged_vf_0(%arg17, %87#1, %87#0, %89, %87#1, %88, %arg16, %90) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
            scf.if %83 {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
            } else {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
            } {ssbuffer.cross_buffer = 1 : i32}
            %91 = memref.load %19[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %91 {memref_ext.volatile} : i32
            %92 = arith.subi %91, %c1_i32 : i32
            memref.store %92, %19[] : memref<i32, #hivm.address_space<ssbuf>>
            %93 = arith.subi %71#1, %c1_i32 : i32
            %94 = arith.subi %71#2, %c1_i32 : i32
            %95 = arith.addi %arg21, %c128_i32 : i32
            scf.yield %89, %90, %93, %94, %95 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg17, %arg16, %71#1, %71#2, %arg21 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %80#1, %80#0, %71#0, %59, %71#3, %80#4, %80#3, %80#2 : memref<64x128xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32, i32, i32
        }
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 4
        %38 = arith.divsi %arg14, %c64_i32 : i32
        %39 = arith.remsi %arg14, %c64_i32 : i32
        %40 = arith.divsi %38, %c8_i32 : i32
        %41 = arith.remsi %38, %c8_i32 : i32
        %42 = arith.extsi %41 : i32 to i64
        %43 = arith.extsi %40 : i32 to i64
        %44 = arith.muli %43, %c8388608_i64 : i64
        %45 = arith.muli %42, %c1048576_i64 : i64
        %46 = arith.addi %44, %45 : i64
        %47 = arith.index_cast %46 : i64 to index
        %48 = arith.muli %39, %c128_i32 : i32
        %49 = arith.maxsi %48, %c0_i32 : i32
        %50 = arith.index_cast %49 : i32 to index
        %51 = affine.apply #map1()[%47, %50]
        %reinterpret_cast = memref.reinterpret_cast %arg7 to offset: [%51], sizes: [128, 128], strides: [128, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_2 = memref.subview %reinterpret_cast[%10, 0] [64, 128] [1, 1] {to_be_bubbled_slice} : memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
        %52 = arith.muli %38, %c8192_i32 : i32
        %53 = arith.index_cast %52 : i32 to index
        %54 = arith.index_cast %48 : i32 to index
        %55 = affine.apply #map5()[%53, %54]
        %reinterpret_cast_3 = memref.reinterpret_cast %arg6 to offset: [%55], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %subview_4 = memref.subview %reinterpret_cast_3[%10] [64] [1] {to_be_bubbled_slice} : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %56 = hivm.hir.pointer_cast(%c183296_i64) : memref<64xf32, #hivm.address_space<ub>>
        %57 = hivm.hir.pointer_cast(%c183552_i64) : memref<64x128xf16, #hivm.address_space<ub>>
        func.call @_attn_fwd_mix_aiv_fused_4_outlined_merged_vf_0(%37#2, %37#1, %56, %37#1, %37#0, %57) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf16, #hivm.address_space<ub>>) -> ()
        hivm.hir.store ins(%56 : memref<64xf32, #hivm.address_space<ub>>) outs(%subview_4 : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        %collapse_shape = memref.collapse_shape %57 [[0, 1]] : memref<64x128xf16, #hivm.address_space<ub>> into memref<8192xf16, #hivm.address_space<ub>>
        %collapse_shape_5 = memref.collapse_shape %subview_2 [[0, 1]] : memref<64x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<8192xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%collapse_shape : memref<8192xf16, #hivm.address_space<ub>>) outs(%collapse_shape_5 : memref<8192xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}

