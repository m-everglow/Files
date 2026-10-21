#map = affine_map<()[s0, s1] -> (s0 + s1 * 1024)>
#map1 = affine_map<()[s0, s1] -> (s0 - s1)>
#map2 = affine_map<()[s0, s1] -> ((s0 - s1 + 15) floordiv 16)>
#map3 = affine_map<()[s0] -> (s0 floordiv 16)>
#map4 = affine_map<()[s0] -> (s0 mod 16)>
#map5 = affine_map<(d0) -> (0, d0)>
#map6 = affine_map<()[s0, s1] -> (s0 + s1 * 128)>
#map7 = affine_map<()[s0] -> (-s0 + 128)>
#map8 = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2 * 1024)>
#map9 = affine_map<()[s0, s1, s2] -> (s0 - s2 - s1 floordiv 1024)>
#map10 = affine_map<()[s0] -> (-s0 + (s0 floordiv 1024) * 1024 + 128)>
#map11 = affine_map<()[s0, s1] -> (s0 + s1)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<MIX>, hivm.tile_and_bind_subblock_reverted} {
  func.func @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_merged_vf_0(%arg0: memref<128xf32, #hivm.address_space<ub>>, %arg1: memref<128xf32, #hivm.address_space<ub>>, %arg2: memref<64x128xf16, #hivm.address_space<ub>>, %arg3: memref<64x128xf32, #hivm.address_space<ub>>, %arg4: memref<64x128xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f16
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg5 = %c0 to %c128 step %c64 {
      %subview = memref.subview %arg0[%arg5] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg5] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst_0 {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %1 = math.exp %0 : vector<64xf32>
      vector.transfer_write %1, %subview_1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    scf.for %arg5 = %c0 to %c64 step %c1 {
      scf.for %arg6 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg2[%arg5, %arg6] [1, 64] [1, 1] : memref<64x128xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg3[%arg5, %arg6] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg4[%arg5, %arg6] [1, 64] [1, 1] : memref<64x128xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
        %1 = vector.transfer_read %subview_1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.extf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf16> to vector<1x64xf32>
        %3 = arith.subf %2, %1 : vector<1x64xf32>
        %4 = arith.truncf %3 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
        vector.transfer_write %4, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf16>, memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg8: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, false, false, false, false]> : vector<13xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c0_i64 = arith.constant 0 : i64
    %cst = arith.constant 0.000000e+00 : f16
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %c128 = arith.constant 128 : index
    %c63_i32 = arith.constant 63 : i32
    %c8_i32 = arith.constant 8 : i32
    %c128_i64 = arith.constant 128 : i64
    %c0_i32 = arith.constant 0 : i32
    %c64_i32 = arith.constant 64 : i32
    %c1024_i64 = arith.constant 1024 : i64
    %c4_i64 = arith.constant 4 : i64
    %c1028_i64 = arith.constant 1028 : i64
    %c8_i64 = arith.constant 8 : i64
    %c1032_i64 = arith.constant 1032 : i64
    %c12_i64 = arith.constant 12 : i64
    %c1036_i64 = arith.constant 1036 : i64
    %c3_i32 = arith.constant 3 : i32
    %true = arith.constant true
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg10, %arg11 : i32
    %1 = arith.muli %0, %arg12 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %4 = arith.addi %arg9, %c63_i32 : i32
    %5 = arith.divsi %4, %c64_i32 : i32
    %6 = arith.muli %5, %c3_i32 : i32
    %7 = arith.addi %6, %c3_i32 : i32
    scf.for %arg13 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %8 = arith.divsi %arg13, %arg10 : i32
      %9 = arith.remsi %8, %arg11 : i32
      %10 = hivm.hir.pointer_cast(%c0_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %11 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %10[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %11[] : memref<i32, #hivm.address_space<ssbuf>>
      %12 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %13 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %12[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %13[] : memref<i32, #hivm.address_space<ssbuf>>
      %14 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %15 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %14[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %15[] : memref<i32, #hivm.address_space<ssbuf>>
      %16 = hivm.hir.pointer_cast(%c12_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %17 = hivm.hir.pointer_cast(%c1036_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %16[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %17[] : memref<i32, #hivm.address_space<ssbuf>>
      %18 = arith.divsi %9, %c8_i32 : i32
      %19 = arith.remsi %9, %c8_i32 : i32
      %20 = arith.muli %18, %arg9 : i32
      %21 = arith.muli %20, %c8_i32 : i32
      %22 = arith.addi %21, %19 : i32
      %23 = arith.extsi %22 : i32 to i64
      %24 = arith.muli %23, %c128_i64 : i64
      %25 = arith.index_cast %24 : i64 to index
      %alloc = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %alloc_0 = memref.alloc() : memref<8x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_0 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>} : memref<8x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      %alloc_1 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_1 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>} : memref<64x128xf32, #hivm.address_space<ub>>
      %alloc_2 = memref.alloc() : memref<128x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_2 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>} : memref<128x128xf32, #hivm.address_space<ub>>
      %26:2 = scf.for %arg14 = %c0_i32 to %7 step %c1_i32 iter_args(%arg15 = %c0_i32, %arg16 = %c0_i32) -> (i32, i32)  : i32 {
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        %27 = memref.load %14[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %27 {memref_ext.volatile} : i32
        %28 = arith.cmpi sgt, %27, %c0_i32 : i32
        %29 = memref.load %15[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %29 {memref_ext.volatile} : i32
        %30 = arith.cmpi sgt, %29, %c0_i32 : i32
        %31 = arith.andi %28, %30 : i1
        %32 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %32 {memref_ext.volatile} : i32
        %33 = arith.cmpi slt, %32, %c1_i32 : i32
        %34 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %34 {memref_ext.volatile} : i32
        %35 = arith.cmpi slt, %34, %c1_i32 : i32
        %36 = arith.andi %33, %35 : i1
        %37 = arith.andi %31, %36 : i1
        %38 = arith.cmpi slt, %arg15, %5 : i32
        %39 = arith.andi %37, %38 : i1
        %40 = scf.if %39 -> (i32) {
          %55 = arith.muli %arg15, %c64_i32 : i32
          %56 = arith.maxsi %55, %c0_i32 : i32
          %57 = arith.index_cast %56 : i32 to index
          %58 = affine.apply #map()[%25, %57]
          %59 = arith.index_cast %arg9 : i32 to index
          %reinterpret_cast = memref.reinterpret_cast %arg4 to offset: [%58], sizes: [64, 128], strides: [1024, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_3 = memref.alloc() : memref<8x4x16x16xf16, #hivm.address_space<cbuf>>
          %cast = memref.cast %alloc_3 : memref<8x4x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
          %60 = affine.apply #map1()[%59, %57]
          %61 = arith.maxsi %60, %c0 : index
          %62 = arith.minsi %61, %c64 : index
          %63 = arith.subi %c0_i32, %55 : i32
          %64 = arith.maxsi %63, %c0_i32 : i32
          %65 = arith.index_cast %64 : i32 to index
          %66 = arith.minsi %65, %62 : index
          %67 = affine.apply #map1()[%62, %66]
          %68 = arith.cmpi slt, %67, %c64 : index
          %subview = memref.subview %reinterpret_cast[0, 0] [%67, 128] [1, 1] : memref<64x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>
          %69 = affine.apply #map2()[%62, %66]
          %70 = affine.apply #map3()[%66]
          %71 = affine.apply #map4()[%66]
          %subview_4 = memref.subview %alloc_3[0, %70, %71, 0] [8, %69, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
          %cast_5 = memref.cast %subview_4 : memref<8x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
          scf.if %68 {
            %collapse_shape = memref.collapse_shape %alloc_3 [[0, 1, 2, 3]] : memref<8x4x16x16xf16, #hivm.address_space<cbuf>> into memref<8192xf16, #hivm.address_space<cbuf>>
            hivm.hir.vbrc ins(%cst : f16) outs(%collapse_shape : memref<8192xf16, #hivm.address_space<cbuf>>)
          } {hivm.unlikely_condition}
          hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_5 : memref<?x?x?x?xf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
          %alloc_6 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
          %cast_7 = memref.cast %alloc_6 : memref<8x4x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
          hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, normalized_in_L0C} ins(%cast, %alloc, %true, %c64, %c128, %c128 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, memref<8x8x16x16xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_7 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_6 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_1 : memref<64x128xf32, #hivm.address_space<ub>>)
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 3
          hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
          %72 = memref.load %14[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %72 {memref_ext.volatile} : i32
          %73 = arith.subi %72, %c1_i32 : i32
          memref.store %73, %14[] : memref<i32, #hivm.address_space<ssbuf>>
          %74 = memref.load %15[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %74 {memref_ext.volatile} : i32
          %75 = arith.subi %74, %c1_i32 : i32
          memref.store %75, %15[] : memref<i32, #hivm.address_space<ssbuf>>
          %76 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %76 {memref_ext.volatile} : i32
          %77 = arith.addi %76, %c1_i32 : i32
          memref.store %77, %10[] : memref<i32, #hivm.address_space<ssbuf>>
          %78 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %78 {memref_ext.volatile} : i32
          %79 = arith.addi %78, %c1_i32 : i32
          memref.store %79, %11[] : memref<i32, #hivm.address_space<ssbuf>>
          %80 = arith.addi %arg15, %c1_i32 : i32
          scf.yield %80 : i32
        } else {
          scf.yield %arg15 : i32
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 3 : i32}
        %41 = memref.load %16[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %41 {memref_ext.volatile} : i32
        %42 = arith.cmpi sgt, %41, %c0_i32 : i32
        %43 = memref.load %17[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %43 {memref_ext.volatile} : i32
        %44 = arith.cmpi sgt, %43, %c0_i32 : i32
        %45 = arith.andi %42, %44 : i1
        %46 = memref.load %12[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %46 {memref_ext.volatile} : i32
        %47 = arith.cmpi slt, %46, %c1_i32 : i32
        %48 = memref.load %13[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %48 {memref_ext.volatile} : i32
        %49 = arith.cmpi slt, %48, %c1_i32 : i32
        %50 = arith.andi %47, %49 : i1
        %51 = arith.andi %45, %50 : i1
        %52 = arith.cmpi slt, %arg16, %5 : i32
        %53 = arith.andi %51, %52 : i1
        %54 = scf.if %53 -> (i32) {
          %55 = arith.muli %arg16, %c64_i32 : i32
          %56 = arith.maxsi %55, %c0_i32 : i32
          %57 = arith.index_cast %56 : i32 to index
          %58 = affine.apply #map()[%25, %57]
          %59 = arith.index_cast %arg9 : i32 to index
          %60 = affine.apply #map1()[%59, %57]
          %61 = arith.maxsi %60, %c0 : index
          %62 = arith.minsi %61, %c64 : index
          %63 = arith.subi %c0_i32, %55 : i32
          %64 = arith.maxsi %63, %c0_i32 : i32
          %65 = arith.index_cast %64 : i32 to index
          %66 = arith.minsi %65, %62 : index
          %67 = affine.apply #map1()[%62, %66]
          %68 = arith.cmpi slt, %67, %c64 : index
          %reinterpret_cast = memref.reinterpret_cast %arg2 to offset: [%58], sizes: [64, 128], strides: [1024, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_3 = memref.alloc() : memref<8x4x16x16xf16, #hivm.address_space<cbuf>>
          %cast = memref.cast %alloc_3 : memref<8x4x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
          %subview = memref.subview %reinterpret_cast[0, 0] [%67, 128] [1, 1] : memref<64x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>
          %69 = affine.apply #map2()[%62, %66]
          %70 = affine.apply #map3()[%66]
          %71 = affine.apply #map4()[%66]
          %subview_4 = memref.subview %alloc_3[0, %70, %71, 0] [8, %69, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
          %cast_5 = memref.cast %subview_4 : memref<8x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
          scf.if %68 {
            %collapse_shape = memref.collapse_shape %alloc_3 [[0, 1, 2, 3]] : memref<8x4x16x16xf16, #hivm.address_space<cbuf>> into memref<8192xf16, #hivm.address_space<cbuf>>
            hivm.hir.vbrc ins(%cst : f16) outs(%collapse_shape : memref<8192xf16, #hivm.address_space<cbuf>>)
          } {hivm.unlikely_condition}
          hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_5 : memref<?x?x?x?xf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
          %alloc_6 = memref.alloc() {alignment = 64 : i64} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
          %cast_7 = memref.cast %alloc_6 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
          hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, normalized_in_L0C} ins(%cast, %alloc_0, %true, %c128, %c64, %c128 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_7 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
          hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2dn>} ins(%alloc_6 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_2 : memref<128x128xf32, #hivm.address_space<ub>>)
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 4
          hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
          %72 = memref.load %16[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %72 {memref_ext.volatile} : i32
          %73 = arith.subi %72, %c1_i32 : i32
          memref.store %73, %16[] : memref<i32, #hivm.address_space<ssbuf>>
          %74 = memref.load %17[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %74 {memref_ext.volatile} : i32
          %75 = arith.subi %74, %c1_i32 : i32
          memref.store %75, %17[] : memref<i32, #hivm.address_space<ssbuf>>
          %76 = memref.load %12[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %76 {memref_ext.volatile} : i32
          %77 = arith.addi %76, %c1_i32 : i32
          memref.store %77, %12[] : memref<i32, #hivm.address_space<ssbuf>>
          %78 = memref.load %13[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %78 {memref_ext.volatile} : i32
          %79 = arith.addi %78, %c1_i32 : i32
          memref.store %79, %13[] : memref<i32, #hivm.address_space<ssbuf>>
          %80 = arith.addi %arg16, %c1_i32 : i32
          scf.yield %80 : i32
        } else {
          scf.yield %arg16 : i32
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 5 : i32}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        scf.yield %40, %54 : i32, i32
      } {fixpipe_for_mmad_result_already_inserted = true}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
  func.func @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_0(%arg0: memref<128x128xf32, #hivm.address_space<ub>>, %arg1: memref<128x128xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c128 step %c1 {
      scf.for %arg3 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg2, %arg3] [1, 64] [1, 1] : memref<128x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg2, %arg3] [1, 64] [1, 1] : memref<128x128xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = arith.truncf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
        vector.transfer_write %1, %subview_0[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf16>, memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_1(%arg0: memref<128x128xf16, #hivm.address_space<ub>>, %arg1: memref<8x128x16xf16, strided<[2064, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c128 step %c1 {
      %subview = memref.subview %arg0[%arg2, 0] [1, 128] [1, 1] : memref<128x128xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[0, %arg2, 0] [8, 1, 16] [1, 1, 1] : memref<8x128x16xf16, strided<[2064, 16, 1]>, #hivm.address_space<ub>> to memref<8x1x16xf16, strided<[2064, 16, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x128xf16>
      %1 = vector.shape_cast %0 : vector<1x128xf16> to vector<8x1x16xf16>
      vector.transfer_write %1, %subview_0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<8x1x16xf16>, memref<8x1x16xf16, strided<[2064, 16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_2(%arg0: memref<64x128xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 128] [1, 1] : memref<64x128xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_5(%arg0: memref<64x128xf16, #hivm.address_space<ub>>, %arg1: memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg2, 0] [1, 128] [1, 1] : memref<64x128xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[0, %arg2, 0] [8, 1, 16] [1, 1, 1] : memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<8x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x128xf16>
      %1 = vector.shape_cast %0 : vector<1x128xf16> to vector<8x1x16xf16>
      vector.transfer_write %1, %subview_0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<8x1x16xf16>, memref<8x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_6(%arg0: memref<128x128xf32, #hivm.address_space<ub>>, %arg1: memref<128xf32, #hivm.address_space<ub>>, %arg2: memref<128x128xf32, #hivm.address_space<ub>>, %arg3: memref<128x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c128 step %c1 {
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg4, %arg5] [1, 64] [1, 1] : memref<128x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg5] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg4, %arg5] [1, 64] [1, 1] : memref<128x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg3[%arg4, %arg5] [1, 64] [1, 1] : memref<128x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0], %cst {in_bounds = [true, true], permutation_map = #map5} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = arith.mulf %0, %1 : vector<1x64xf32>
        %4 = arith.addf %3, %2 : vector<1x64xf32>
        vector.transfer_write %4, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_7(%arg0: memref<128x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c128 step %c1 {
      scf.for %arg2 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<128x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg8: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, false, false, false, false]> : vector<13xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c16 = arith.constant 16 : index
    %c0_i64 = arith.constant 0 : i64
    %cst = arith.constant 0.000000e+00 : f16
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %c128 = arith.constant 128 : index
    %c63_i32 = arith.constant 63 : i32
    %c1024_i32 = arith.constant 1024 : i32
    %c131072_i64 = arith.constant 131072 : i64
    %c16384_i64 = arith.constant 16384 : i64
    %c128_i32 = arith.constant 128 : i32
    %c8_i32 = arith.constant 8 : i32
    %c128_i64 = arith.constant 128 : i64
    %c0_i32 = arith.constant 0 : i32
    %c64_i32 = arith.constant 64 : i32
    %c16384_i32 = arith.constant 16384 : i32
    %c1024_i64 = arith.constant 1024 : i64
    %c4_i64 = arith.constant 4 : i64
    %c1028_i64 = arith.constant 1028 : i64
    %c8_i64 = arith.constant 8 : i64
    %c1032_i64 = arith.constant 1032 : i64
    %c12_i64 = arith.constant 12 : i64
    %c1036_i64 = arith.constant 1036 : i64
    %c3_i32 = arith.constant 3 : i32
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg10, %arg11 : i32
    %1 = arith.muli %0, %arg12 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %4 = hivm.hir.get_sub_block_idx -> i64
    %5 = arith.muli %4, %c1024_i64 : i64
    %6 = arith.addi %5, %c4_i64 : i64
    %7 = arith.addi %5, %c12_i64 : i64
    %8 = arith.addi %5, %c8_i64 : i64
    %9 = arith.addi %arg9, %c63_i32 : i32
    %10 = arith.divsi %9, %c64_i32 : i32
    %11 = arith.muli %10, %c3_i32 : i32
    %12 = arith.addi %11, %c3_i32 : i32
    %13 = arith.index_cast %4 : i64 to index
    %14 = arith.cmpi eq, %13, %c0 : index
    scf.for %arg13 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %15 = arith.remsi %arg13, %arg10 : i32
      %16 = arith.divsi %arg13, %arg10 : i32
      %17 = arith.remsi %16, %arg11 : i32
      %18 = hivm.hir.pointer_cast(%c0_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %19 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %18[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %19[] : memref<i32, #hivm.address_space<ssbuf>>
      %20 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %21 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %20[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %21[] : memref<i32, #hivm.address_space<ssbuf>>
      %22 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %23 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %22[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %23[] : memref<i32, #hivm.address_space<ssbuf>>
      %24 = hivm.hir.pointer_cast(%c12_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %25 = hivm.hir.pointer_cast(%c1036_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %24[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %25[] : memref<i32, #hivm.address_space<ssbuf>>
      %26 = hivm.hir.pointer_cast(%6) : memref<i32, #hivm.address_space<ssbuf>>
      %27 = hivm.hir.pointer_cast(%5) : memref<i32, #hivm.address_space<ssbuf>>
      %28 = hivm.hir.pointer_cast(%7) : memref<i32, #hivm.address_space<ssbuf>>
      %29 = hivm.hir.pointer_cast(%8) : memref<i32, #hivm.address_space<ssbuf>>
      %30 = arith.divsi %17, %c8_i32 : i32
      %31 = arith.remsi %17, %c8_i32 : i32
      %32 = arith.muli %30, %arg9 : i32
      %33 = arith.muli %30, %10 : i32
      %34 = arith.muli %33, %c8_i32 : i32
      %35 = arith.addi %34, %31 : i32
      %36 = arith.extsi %35 : i32 to i64
      %37 = arith.muli %36, %c16384_i64 : i64
      %38 = arith.muli %32, %c8_i32 : i32
      %39 = arith.addi %38, %31 : i32
      %40 = arith.extsi %39 : i32 to i64
      %41 = arith.muli %40, %c128_i64 : i64
      %42 = arith.index_cast %41 : i64 to index
      %43 = arith.muli %15, %c128_i32 : i32
      %44 = arith.muli %31, %c128_i32 : i32
      %alloc = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
      %alloc_0 = memref.alloc() : memref<8x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_0 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>} : memref<8x4x16x16xf16, #hivm.address_space<cbuf>>
      %alloc_1 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_1 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>} : memref<64x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
      %alloc_2 = memref.alloc() : memref<128x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_2 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>} : memref<128x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
      %alloc_3 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
      %alloc_4 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
      %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32, #hivm.address_space<ub>>
      func.call @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_7(%alloc_5) {hivm.vector_function, no_inline} : (memref<128x128xf32, #hivm.address_space<ub>>) -> ()
      %45:6 = scf.for %arg14 = %c0_i32 to %12 step %c1_i32 iter_args(%arg15 = %alloc_5, %arg16 = %c0_i32, %arg17 = %c0_i32, %arg18 = %c0_i32, %arg19 = %c0_i32, %arg20 = %c1_i32) -> (memref<128x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32, i32)  : i32 {
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        %59 = memref.load %29[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %59 {memref_ext.volatile} : i32
        %60 = arith.cmpi slt, %59, %c1_i32 : i32
        %61 = arith.cmpi eq, %arg20, %c1_i32 : i32
        %62 = arith.cmpi slt, %arg16, %10 : i32
        %63 = arith.andi %60, %61 : i1
        %64 = arith.andi %63, %62 : i1
        %65:2 = scf.if %64 -> (i32, i32) {
          %alloc_7 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf16, #hivm.address_space<ub>>
          func.call @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_0(%arg15, %alloc_7) {hivm.vector_function, no_inline} : (memref<128x128xf32, #hivm.address_space<ub>>, memref<128x128xf16, #hivm.address_space<ub>>) -> ()
          %85 = arith.extsi %arg16 : i32 to i64
          %86 = arith.muli %85, %c131072_i64 : i64
          %87 = arith.addi %37, %86 : i64
          %88 = arith.index_cast %87 : i64 to index
          %89 = arith.maxsi %43, %c0_i32 : i32
          %90 = arith.index_cast %89 : i32 to index
          %91 = affine.apply #map6()[%88, %90]
          %reinterpret_cast_8 = memref.reinterpret_cast %arg7 to offset: [%91], sizes: [128, 128], strides: [128, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
          %92 = affine.apply #map7()[%90]
          %93 = arith.maxsi %92, %c0 : index
          %94 = arith.minsi %93, %c128 : index
          %95 = arith.subi %c0_i32, %43 : i32
          %96 = arith.maxsi %95, %c0_i32 : i32
          %97 = arith.index_cast %96 : i32 to index
          %98 = arith.minsi %97, %94 : index
          %99 = affine.apply #map1()[%94, %98]
          %subview_9 = memref.subview %alloc_7[%98, 0] [%99, 128] [1, 1] : memref<128x128xf16, #hivm.address_space<ub>> to memref<?x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
          %subview_10 = memref.subview %reinterpret_cast_8[0, 0] [%99, 128] [1, 1] : memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_11 = memref.alloc() : memref<8x129x16x1xf16, #hivm.address_space<ub>>
          %subview_12 = memref.subview %alloc_11[0, 0, 0, 0] [8, 128, 16, 1] [1, 1, 1, 1] : memref<8x129x16x1xf16, #hivm.address_space<ub>> to memref<8x128x16xf16, strided<[2064, 16, 1]>, #hivm.address_space<ub>>
          func.call @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_1(%alloc_7, %subview_12) {hivm.vector_function, no_inline} : (memref<128x128xf16, #hivm.address_space<ub>>, memref<8x128x16xf16, strided<[2064, 16, 1]>, #hivm.address_space<ub>>) -> ()
          %expand_shape = memref.expand_shape %subview_12 [[0], [1, 2], [3]] output_shape [8, 8, 16, 16] : memref<8x128x16xf16, strided<[2064, 16, 1]>, #hivm.address_space<ub>> into memref<8x8x16x16xf16, strided<[2064, 256, 16, 1]>, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
          scf.if %14 {
            %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x8x16x16xf16, strided<[2064, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x2048xf16, strided<[2064, 1]>, #hivm.address_space<ub>>
            %collapse_shape_13 = memref.collapse_shape %alloc [[0], [1, 2, 3]] : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> into memref<8x2048xf16, #hivm.address_space<cbuf>>
            hivm.hir.copy ins(%collapse_shape : memref<8x2048xf16, strided<[2064, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_13 : memref<8x2048xf16, #hivm.address_space<cbuf>>)
          } {limit_sub_block_id0}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
          scf.if %14 {
            %collapse_shape = memref.collapse_shape %subview_9 [[0, 1]] : memref<?x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>> into memref<?xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>
            %collapse_shape_13 = memref.collapse_shape %subview_10 [[0, 1]] : memref<?x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<?xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>
            hivm.hir.store ins(%collapse_shape : memref<?xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>) outs(%collapse_shape_13 : memref<?xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>)
          } {limit_sub_block_id0}
          %100 = memref.load %29[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %100 {memref_ext.volatile} : i32
          %101 = arith.addi %100, %c1_i32 : i32
          memref.store %101, %29[] : memref<i32, #hivm.address_space<ssbuf>>
          %102 = arith.subi %arg20, %c1_i32 : i32
          %103 = arith.addi %arg16, %c1_i32 : i32
          scf.yield %102, %103 : i32, i32
        } else {
          scf.yield %arg20, %arg16 : i32, i32
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 9 : i32}
        %66 = memref.load %27[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %66 {memref_ext.volatile} : i32
        %67 = arith.cmpi sgt, %66, %c0_i32 : i32
        %68 = memref.load %28[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %68 {memref_ext.volatile} : i32
        %69 = arith.cmpi slt, %68, %c1_i32 : i32
        %70 = arith.andi %67, %69 : i1
        %71 = arith.cmpi slt, %arg19, %c2_i32 : i32
        %72 = arith.cmpi slt, %arg17, %10 : i32
        %73 = arith.andi %70, %71 : i1
        %74 = arith.andi %73, %72 : i1
        %75:2 = scf.if %74 -> (i32, i32) {
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 3
          %85 = arith.maxsi %43, %c0_i32 : i32
          %86 = arith.index_cast %85 : i32 to index
          %87 = arith.subi %c0_i32, %43 : i32
          %88 = arith.maxsi %87, %c0_i32 : i32
          %89 = arith.index_cast %88 : i32 to index
          %90 = arith.muli %arg17, %c64_i32 : i32
          %91 = arith.maxsi %90, %c0_i32 : i32
          %92 = arith.index_cast %91 : i32 to index
          %93 = arith.index_cast %arg9 : i32 to index
          %94 = arith.subi %c0_i32, %90 : i32
          %95 = arith.maxsi %94, %c0_i32 : i32
          %96 = arith.index_cast %95 : i32 to index
          %97 = affine.apply #map8()[%86, %42, %92]
          %reinterpret_cast_7 = memref.reinterpret_cast %arg3 to offset: [%97], sizes: [64, 128], strides: [1024, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_8 = memref.alloc() : memref<64x128xf16, #hivm.address_space<ub>>
          annotation.mark %alloc_8 {hivm.multi_buffer = 2 : i32} : memref<64x128xf16, #hivm.address_space<ub>>
          %98 = affine.apply #map9()[%93, %86, %92]
          %99 = arith.maxsi %98, %c0 : index
          %100 = arith.minsi %99, %c64 : index
          %101 = affine.apply #map10()[%86]
          %102 = arith.maxsi %101, %c0 : index
          %103 = arith.minsi %102, %c128 : index
          %104 = arith.minsi %96, %100 : index
          %105 = affine.apply #map1()[%100, %104]
          %106 = arith.minsi %89, %103 : index
          %107 = affine.apply #map1()[%103, %106]
          %108 = arith.cmpi slt, %105, %c64 : index
          %109 = arith.cmpi slt, %107, %c128 : index
          %110 = arith.ori %108, %109 : i1
          %subview_9 = memref.subview %reinterpret_cast_7[0, 0] [%105, %107] [1, 1] : memref<64x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>
          %subview_10 = memref.subview %alloc_8[%104, %106] [%105, %107] [1, 1] : memref<64x128xf16, #hivm.address_space<ub>> to memref<?x?xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
          %111 = arith.remui %106, %c16 : index
          scf.if %110 {
            func.call @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_2(%alloc_8) {hivm.vector_function, no_inline} : (memref<64x128xf16, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          hivm.hir.load ins(%subview_9 : memref<?x?xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_10 : memref<?x?xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f16 left_padding_num = %111 : index
          %reinterpret_cast_11 = memref.reinterpret_cast %arg5 to offset: [%97], sizes: [64, 128], strides: [1024, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>
          %subview_12 = memref.subview %reinterpret_cast_11[0, 0] [%105, %107] [1, 1] : memref<64x128xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>
          %112 = arith.addi %arg17, %c1_i32 : i32
          %113 = arith.muli %112, %c64_i32 : i32
          %114 = arith.minsi %113, %arg9 : i32
          %115 = arith.subi %114, %c1_i32 : i32
          %116 = arith.addi %32, %115 : i32
          %117 = arith.muli %116, %c1024_i32 : i32
          %118 = arith.index_cast %117 : i32 to index
          %119 = arith.index_cast %44 : i32 to index
          %120 = affine.apply #map11()[%118, %119]
          %reinterpret_cast_13 = memref.reinterpret_cast %arg6 to offset: [%120], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %alloc_14 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_14 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_14 {hivm.multi_buffer = 2 : i32} : memref<128xf32, #hivm.address_space<ub>>
          hivm.hir.load ins(%reinterpret_cast_13 : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_14 : memref<128xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
          %alloc_15 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
          %alloc_16 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf16, #hivm.address_space<ub>>
          func.call @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_merged_vf_0(%alloc_14, %alloc_15, %alloc_8, %alloc_1, %alloc_16) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<64x128xf16, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf16, #hivm.address_space<ub>>) -> ()
          %subview_17 = memref.subview %alloc_16[%104, %106] [%105, %107] [1, 1] : memref<64x128xf16, #hivm.address_space<ub>> to memref<?x?xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
          %alloc_18 = memref.alloc() : memref<8x65x16x1xf16, #hivm.address_space<ub>>
          %subview_19 = memref.subview %alloc_18[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xf16, #hivm.address_space<ub>> to memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
          func.call @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_5(%alloc_16, %subview_19) {hivm.vector_function, no_inline} : (memref<64x128xf16, #hivm.address_space<ub>>, memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
          %expand_shape = memref.expand_shape %subview_19 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
          scf.if %14 {
            %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
            %collapse_shape_20 = memref.collapse_shape %alloc_0 [[0], [1, 2, 3]] : memref<8x4x16x16xf16, #hivm.address_space<cbuf>> into memref<8x1024xf16, #hivm.address_space<cbuf>>
            hivm.hir.copy ins(%collapse_shape : memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_20 : memref<8x1024xf16, #hivm.address_space<cbuf>>)
          } {limit_sub_block_id0}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
          scf.if %14 {
            hivm.hir.store ins(%subview_17 : memref<?x?xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_12 : memref<?x?xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<gm>>)
          } {limit_sub_block_id0}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
          %121 = arith.remsi %arg17, %c2_i32 : i32
          %122 = arith.cmpi eq, %121, %c0_i32 : i32
          scf.if %122 {
            hivm.hir.copy ins(%alloc_15 : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_3 : memref<128xf32, #hivm.address_space<ub>>)
          } else {
            hivm.hir.copy ins(%alloc_15 : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_4 : memref<128xf32, #hivm.address_space<ub>>)
          }
          %123 = memref.load %27[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %123 {memref_ext.volatile} : i32
          %124 = arith.subi %123, %c1_i32 : i32
          memref.store %124, %27[] : memref<i32, #hivm.address_space<ssbuf>>
          %125 = memref.load %28[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %125 {memref_ext.volatile} : i32
          %126 = arith.addi %125, %c1_i32 : i32
          memref.store %126, %28[] : memref<i32, #hivm.address_space<ssbuf>>
          %127 = arith.addi %arg19, %c1_i32 : i32
          scf.yield %127, %112 : i32, i32
        } else {
          scf.yield %arg19, %arg17 : i32, i32
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 11 : i32}
        %76 = memref.load %26[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %76 {memref_ext.volatile} : i32
        %77 = arith.cmpi sgt, %76, %c0_i32 : i32
        %78 = arith.cmpi sgt, %75#0, %c0_i32 : i32
        %79 = arith.cmpi eq, %65#0, %c0_i32 : i32
        %80 = arith.andi %78, %79 : i1
        %81 = arith.cmpi slt, %arg18, %10 : i32
        %82 = arith.andi %77, %80 : i1
        %83 = arith.andi %82, %81 : i1
        %84:4 = scf.if %83 -> (memref<128x128xf32, #hivm.address_space<ub>>, i32, i32, i32) {
          %85 = arith.remsi %arg18, %c2_i32 : i32
          %86 = arith.cmpi eq, %85, %c0_i32 : i32
          %87 = arith.select %86, %alloc_3, %alloc_4 : memref<128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 4
          %alloc_7 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32, #hivm.address_space<ub>>
          func.call @chunk_gated_delta_rule_fwd_kernel_h_k128_blockdim128_mix_aiv_outlined_vf_6(%arg15, %87, %alloc_2, %alloc_7) {hivm.vector_function, no_inline} : (memref<128x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<128x128xf32, #hivm.address_space<ub>>, memref<128x128xf32, #hivm.address_space<ub>>) -> ()
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
          %88 = memref.load %26[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %88 {memref_ext.volatile} : i32
          %89 = arith.subi %88, %c1_i32 : i32
          memref.store %89, %26[] : memref<i32, #hivm.address_space<ssbuf>>
          %90 = arith.subi %75#0, %c1_i32 : i32
          %91 = arith.addi %65#0, %c1_i32 : i32
          %92 = arith.addi %arg18, %c1_i32 : i32
          scf.yield %alloc_7, %90, %91, %92 : memref<128x128xf32, #hivm.address_space<ub>>, i32, i32, i32
        } else {
          scf.yield %arg15, %75#0, %65#0, %arg18 : memref<128x128xf32, #hivm.address_space<ub>>, i32, i32, i32
        }
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        scf.yield %84#0, %65#1, %75#1, %84#3, %84#1, %84#2 : memref<128x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32, i32
      }
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %46 = arith.muli %17, %c16384_i32 : i32
      %47 = arith.index_cast %46 : i32 to index
      %48 = arith.maxsi %43, %c0_i32 : i32
      %49 = arith.index_cast %48 : i32 to index
      %50 = affine.apply #map6()[%47, %49]
      %reinterpret_cast = memref.reinterpret_cast %arg8 to offset: [%50], sizes: [128, 128], strides: [128, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %51 = affine.apply #map7()[%49]
      %52 = arith.maxsi %51, %c0 : index
      %53 = arith.minsi %52, %c128 : index
      %54 = arith.subi %c0_i32, %43 : i32
      %55 = arith.maxsi %54, %c0_i32 : i32
      %56 = arith.index_cast %55 : i32 to index
      %57 = arith.minsi %56, %53 : index
      %58 = affine.apply #map1()[%53, %57]
      %subview = memref.subview %reinterpret_cast[0, 0] [%58, 128] [1, 1] : memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_6 = memref.subview %45#0[%57, 0] [%58, 128] [1, 1] : memref<128x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      scf.if %14 {
        %collapse_shape = memref.collapse_shape %subview_6 [[0, 1]] : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>> into memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %collapse_shape_7 = memref.collapse_shape %subview [[0, 1]] : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%collapse_shape : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) outs(%collapse_shape_7 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>)
      } {limit_sub_block_id0}
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}
