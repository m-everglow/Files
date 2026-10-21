#map = affine_map<()[s0] -> (s0 + 1)>
#map1 = affine_map<()[s0, s1] -> (s0 + s1 * 12288)>
#map2 = affine_map<()[s0, s1] -> (s0 - s1)>
#map3 = affine_map<()[s0, s1] -> ((s0 - s1 + 15) floordiv 16)>
#map4 = affine_map<()[s0] -> (s0 floordiv 16)>
#map5 = affine_map<()[s0] -> (s0 mod 16)>
#map6 = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2 * 12288)>
#map7 = affine_map<()[s0, s1, s2] -> (s0 - s2 - s1 floordiv 12288)>
#map8 = affine_map<()[s0] -> (-s0 + (s0 floordiv 12288) * 12288 + 128)>
#map9 = affine_map<(d0) -> (d0, 0)>
#map10 = affine_map<()[s0] -> (s0 * 64)>
#map11 = affine_map<()[s0] -> (s0 * 32)>
#map12 = affine_map<()[s0] -> (s0 * 4)>
#map13 = affine_map<()[s0] -> (s0 * 2)>
#map14 = affine_map<()[s0] -> (s0 * 64 + 64)>
#map15 = affine_map<()[s0, s1] -> (s0 + s1)>
#map16 = affine_map<()[s0] -> (-s0 + (s0 floordiv 128) * 128 + 128)>
#map17 = affine_map<()[s0] -> (-(s0 floordiv 128) + 128)>
#map18 = affine_map<()[s0, s1, s2] -> (-s0 + s1 - s2)>
#map19 = affine_map<()[s0, s1] -> (s0 - s1 * 64)>
#map20 = affine_map<()[s0] -> (s0 * 32 + 32)>
#map21 = affine_map<()[s0, s1] -> (s0 - s1 * 32)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  func.func @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_merged_vf_0(%arg0: memref<64x1xf32, #hivm.address_space<ub>>, %arg1: memref<64x1xf32, #hivm.address_space<ub>>, %arg2: memref<32x128xf32, #hivm.address_space<ub>>, %arg3: memref<32x128xbf16, #hivm.address_space<ub>>, %arg4: memref<32x128xbf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
    %c128 = arith.constant 128 : index
    %c32 = arith.constant 32 : index
    %cst = arith.constant 0.000000e+00 : bf16
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c64 = arith.constant 64 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 1] : vector<1x64xi1>
    scf.for %arg5 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg5, 0] [1, 1] [1, 1] : memref<64x1xf32, #hivm.address_space<ub>> to memref<1x1xf32, strided<[1, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg5, 0] [1, 1] [1, 1] : memref<64x1xf32, #hivm.address_space<ub>> to memref<1x1xf32, strided<[1, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0, %c0], %cst_0, %0 {in_bounds = [true, true]} : memref<1x1xf32, strided<[1, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = math.exp %1 : vector<1x64xf32>
      vector.transfer_write %2, %subview_1[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x1xf32, strided<[1, 1], offset: ?>, #hivm.address_space<ub>>
    }
    scf.for %arg5 = %c0 to %c32 step %c1 {
      scf.for %arg6 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg2[%arg5, %arg6] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg3[%arg5, %arg6] [1, 64] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg4[%arg5, %arg6] [1, 64] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
        %3 = arith.extf %2 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
        %4 = arith.addf %1, %3 : vector<1x64xf32>
        %5 = arith.truncf %4 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
        vector.transfer_write %5, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xbf16>, memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg8: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg12: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg14: f32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<19xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c0_i64 = arith.constant 0 : i64
    %cst = arith.constant 0.000000e+00 : bf16
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %c63_i32 = arith.constant 63 : i32
    %c-1_i32 = arith.constant -1 : i32
    %c128_i32 = arith.constant 128 : i32
    %c96_i32 = arith.constant 96 : i32
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
    %c16_i64 = arith.constant 16 : i64
    %c1040_i64 = arith.constant 1040 : i64
    %c3_i32 = arith.constant 3 : i32
    %c2_i32 = arith.constant 2 : i32
    %true = arith.constant true
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg16, %arg17 : i32
    %1 = arith.muli %0, %arg18 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    scf.for %arg19 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %4 = arith.remsi %arg19, %arg16 : i32
      %5 = arith.divsi %arg19, %arg16 : i32
      %6 = arith.remsi %5, %arg17 : i32
      %7 = hivm.hir.pointer_cast(%c0_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %8 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %7[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %8[] : memref<i32, #hivm.address_space<ssbuf>>
      %9 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %10 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %9[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %10[] : memref<i32, #hivm.address_space<ssbuf>>
      %11 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %12 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %11[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %12[] : memref<i32, #hivm.address_space<ssbuf>>
      %13 = hivm.hir.pointer_cast(%c12_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %14 = hivm.hir.pointer_cast(%c1036_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %13[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %14[] : memref<i32, #hivm.address_space<ssbuf>>
      %15 = hivm.hir.pointer_cast(%c16_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %16 = hivm.hir.pointer_cast(%c1040_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %15[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %16[] : memref<i32, #hivm.address_space<ssbuf>>
      %17 = arith.divsi %6, %c96_i32 : i32
      %18 = arith.remsi %6, %c96_i32 : i32
      %19 = arith.index_cast %17 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg12 to offset: [%19], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %20 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %21 = arith.trunci %20 : i64 to i32
      %22 = affine.apply #map()[%19]
      %reinterpret_cast_0 = memref.reinterpret_cast %arg12 to offset: [%22], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %23 = memref.load %reinterpret_cast_0[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %24 = arith.trunci %23 : i64 to i32
      %25 = arith.subi %24, %21 : i32
      %26 = arith.addi %25, %c63_i32 : i32
      %27 = arith.divsi %26, %c64_i32 : i32
      %28 = arith.muli %21, %c96_i32 : i32
      %29 = arith.addi %28, %18 : i32
      %30 = arith.extsi %29 : i32 to i64
      %31 = arith.muli %30, %c128_i64 : i64
      %32 = arith.index_cast %31 : i64 to index
      %33 = arith.muli %4, %c128_i32 : i32
      %34 = arith.maxsi %33, %c0_i32 : i32
      %35 = arith.index_cast %34 : i32 to index
      %36 = arith.subi %c0_i32, %33 : i32
      %37 = arith.maxsi %36, %c0_i32 : i32
      %38 = arith.index_cast %37 : i32 to index
      %39 = arith.subi %27, %c1_i32 : i32
      %alloc = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %alloc_1 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_1 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = -1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      %alloc_2 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_2 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_3 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_3 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
      %alloc_4 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_4 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
      %40 = arith.muli %27, %c3_i32 : i32
      %41 = arith.addi %40, %c2_i32 : i32
      %42:3 = scf.for %arg20 = %c-1_i32 to %41 step %c1_i32 iter_args(%arg21 = %c-1_i32, %arg22 = %c-1_i32, %arg23 = %c-1_i32) -> (i32, i32, i32)  : i32 {
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        %43 = memref.load %13[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %43 {memref_ext.volatile} : i32
        %44 = arith.cmpi sgt, %43, %c0_i32 : i32
        %45 = memref.load %14[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %45 {memref_ext.volatile} : i32
        %46 = arith.cmpi sgt, %45, %c0_i32 : i32
        %47 = arith.andi %44, %46 : i1
        %48 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %48 {memref_ext.volatile} : i32
        %49 = arith.cmpi slt, %48, %c1_i32 : i32
        %50 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %50 {memref_ext.volatile} : i32
        %51 = arith.cmpi slt, %50, %c1_i32 : i32
        %52 = arith.andi %49, %51 : i1
        %53 = arith.andi %47, %52 : i1
        %54 = arith.cmpi slt, %arg21, %39 : i32
        %55 = arith.andi %53, %54 : i1
        %56 = scf.if %55 -> (i32) {
          %79 = arith.subi %39, %arg21 : i32
          %80 = arith.addi %79, %c-1_i32 : i32
          %81 = arith.muli %80, %c64_i32 : i32
          %82 = arith.maxsi %81, %c0_i32 : i32
          %83 = arith.index_cast %82 : i32 to index
          %84 = affine.apply #map1()[%32, %83]
          %85 = arith.index_cast %25 : i32 to index
          %86 = arith.subi %c0_i32, %81 : i32
          %87 = arith.maxsi %86, %c0_i32 : i32
          %88 = arith.index_cast %87 : i32 to index
          %reinterpret_cast_5 = memref.reinterpret_cast %arg3 to offset: [%84], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_6 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
          annotation.mark %alloc_6 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
          %cast = memref.cast %alloc_6 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
          %89 = affine.apply #map2()[%85, %83]
          %90 = arith.maxsi %89, %c0 : index
          %91 = arith.minsi %90, %c64 : index
          %92 = arith.minsi %88, %91 : index
          %93 = affine.apply #map2()[%91, %92]
          %94 = arith.cmpi slt, %93, %c64 : index
          %subview = memref.subview %reinterpret_cast_5[0, 0] [%93, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %95 = affine.apply #map3()[%91, %92]
          %96 = affine.apply #map4()[%92]
          %97 = affine.apply #map5()[%92]
          %subview_7 = memref.subview %alloc_6[0, %96, %97, 0] [8, %95, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
          %cast_8 = memref.cast %subview_7 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
          scf.if %94 {
            %collapse_shape = memref.collapse_shape %alloc_6 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
            hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
          } {hivm.unlikely_condition}
          hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_8 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
          %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
          annotation.mark %alloc_9 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
          %cast_10 = memref.cast %alloc_9 : memref<8x4x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
          hivm.hir.mmadL1 {already_set_real_mkn, normalized_in_L0C} ins(%cast, %alloc, %true, %c64, %c128, %c128 : memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_10 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_9 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_2 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 3
          hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
          %98 = memref.load %13[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %98 {memref_ext.volatile} : i32
          %99 = arith.subi %98, %c1_i32 : i32
          memref.store %99, %13[] : memref<i32, #hivm.address_space<ssbuf>>
          %100 = memref.load %14[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %100 {memref_ext.volatile} : i32
          %101 = arith.subi %100, %c1_i32 : i32
          memref.store %101, %14[] : memref<i32, #hivm.address_space<ssbuf>>
          %102 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %102 {memref_ext.volatile} : i32
          %103 = arith.addi %102, %c1_i32 : i32
          memref.store %103, %7[] : memref<i32, #hivm.address_space<ssbuf>>
          %104 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %104 {memref_ext.volatile} : i32
          %105 = arith.addi %104, %c1_i32 : i32
          memref.store %105, %8[] : memref<i32, #hivm.address_space<ssbuf>>
          %106 = arith.addi %arg21, %c1_i32 : i32
          scf.yield %106 : i32
        } else {
          scf.yield %arg21 : i32
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 3 : i32}
        %57 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %57 {memref_ext.volatile} : i32
        %58 = arith.cmpi slt, %57, %c1_i32 : i32
        %59 = memref.load %12[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %59 {memref_ext.volatile} : i32
        %60 = arith.cmpi slt, %59, %c1_i32 : i32
        %61 = arith.andi %58, %60 : i1
        %62 = arith.cmpi slt, %arg22, %39 : i32
        %63 = arith.andi %61, %62 : i1
        %64 = scf.if %63 -> (i32) {
          %79 = arith.subi %39, %arg22 : i32
          %80 = arith.addi %79, %c-1_i32 : i32
          %81 = arith.muli %80, %c64_i32 : i32
          %82 = arith.maxsi %81, %c0_i32 : i32
          %83 = arith.index_cast %82 : i32 to index
          %84 = affine.apply #map1()[%32, %83]
          %85 = arith.index_cast %25 : i32 to index
          %86 = arith.subi %c0_i32, %81 : i32
          %87 = arith.maxsi %86, %c0_i32 : i32
          %88 = arith.index_cast %87 : i32 to index
          %89 = affine.apply #map2()[%85, %83]
          %90 = arith.maxsi %89, %c0 : index
          %91 = arith.minsi %90, %c64 : index
          %92 = arith.minsi %88, %91 : index
          %93 = affine.apply #map2()[%91, %92]
          %94 = arith.cmpi slt, %93, %c64 : index
          %95 = affine.apply #map6()[%35, %32, %83]
          %reinterpret_cast_5 = memref.reinterpret_cast %arg8 to offset: [%95], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_6 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
          annotation.mark %alloc_6 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
          %cast = memref.cast %alloc_6 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
          %96 = affine.apply #map7()[%85, %35, %83]
          %97 = arith.maxsi %96, %c0 : index
          %98 = arith.minsi %97, %c64 : index
          %99 = affine.apply #map8()[%35]
          %100 = arith.maxsi %99, %c0 : index
          %101 = arith.minsi %100, %c128 : index
          %102 = arith.minsi %88, %98 : index
          %103 = affine.apply #map2()[%98, %102]
          %104 = arith.minsi %38, %101 : index
          %105 = affine.apply #map2()[%101, %104]
          %106 = arith.cmpi slt, %103, %c64 : index
          %107 = arith.cmpi slt, %105, %c128 : index
          %108 = arith.ori %106, %107 : i1
          %subview = memref.subview %reinterpret_cast_5[0, 0] [%103, %105] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %109 = affine.apply #map3()[%98, %102]
          %110 = affine.apply #map3()[%101, %104]
          %111 = affine.apply #map4()[%102]
          %112 = affine.apply #map5()[%102]
          %113 = affine.apply #map4()[%104]
          %114 = affine.apply #map5()[%104]
          %subview_7 = memref.subview %alloc_6[%113, %111, %112, %114] [%110, %109, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
          %cast_8 = memref.cast %subview_7 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
          scf.if %108 {
            %collapse_shape = memref.collapse_shape %alloc_6 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
            hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
          } {hivm.unlikely_condition}
          hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_8 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
          %reinterpret_cast_9 = memref.reinterpret_cast %arg2 to offset: [%84], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_10 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
          annotation.mark %alloc_10 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
          %cast_11 = memref.cast %alloc_10 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
          %subview_12 = memref.subview %reinterpret_cast_9[0, 0] [%93, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %115 = affine.apply #map3()[%91, %92]
          %116 = affine.apply #map4()[%92]
          %117 = affine.apply #map5()[%92]
          %subview_13 = memref.subview %alloc_10[0, %116, %117, 0] [8, %115, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
          %cast_14 = memref.cast %subview_13 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
          scf.if %94 {
            %collapse_shape = memref.collapse_shape %alloc_10 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
            hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
          } {hivm.unlikely_condition}
          hivm.hir.nd2nz {dst_continuous} ins(%subview_12 : memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_14 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
          %alloc_15 = memref.alloc() {alignment = 64 : i64} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
          annotation.mark %alloc_15 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
          %cast_16 = memref.cast %alloc_15 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
          hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, normalized_in_L0C} ins(%cast_11, %cast, %true, %c128, %c64, %c128 : memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_16 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
          hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_15 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_3 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 4
          %118 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %118 {memref_ext.volatile} : i32
          %119 = arith.addi %118, %c1_i32 : i32
          memref.store %119, %11[] : memref<i32, #hivm.address_space<ssbuf>>
          %120 = memref.load %12[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %120 {memref_ext.volatile} : i32
          %121 = arith.addi %120, %c1_i32 : i32
          memref.store %121, %12[] : memref<i32, #hivm.address_space<ssbuf>>
          %122 = arith.addi %arg22, %c1_i32 : i32
          scf.yield %122 : i32
        } else {
          scf.yield %arg22 : i32
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 5 : i32}
        %65 = memref.load %15[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %65 {memref_ext.volatile} : i32
        %66 = arith.cmpi sgt, %65, %c0_i32 : i32
        %67 = memref.load %16[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %67 {memref_ext.volatile} : i32
        %68 = arith.cmpi sgt, %67, %c0_i32 : i32
        %69 = arith.andi %66, %68 : i1
        %70 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %70 {memref_ext.volatile} : i32
        %71 = arith.cmpi slt, %70, %c1_i32 : i32
        %72 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %72 {memref_ext.volatile} : i32
        %73 = arith.cmpi slt, %72, %c1_i32 : i32
        %74 = arith.andi %71, %73 : i1
        %75 = arith.andi %69, %74 : i1
        %76 = arith.cmpi slt, %arg23, %39 : i32
        %77 = arith.andi %75, %76 : i1
        %78 = scf.if %77 -> (i32) {
          %79 = arith.subi %39, %arg23 : i32
          %80 = arith.addi %79, %c-1_i32 : i32
          %81 = arith.muli %80, %c64_i32 : i32
          %82 = arith.maxsi %81, %c0_i32 : i32
          %83 = arith.index_cast %82 : i32 to index
          %84 = affine.apply #map1()[%32, %83]
          %85 = arith.index_cast %25 : i32 to index
          %86 = arith.subi %c0_i32, %81 : i32
          %87 = arith.maxsi %86, %c0_i32 : i32
          %88 = arith.index_cast %87 : i32 to index
          %89 = affine.apply #map2()[%85, %83]
          %90 = arith.maxsi %89, %c0 : index
          %91 = arith.minsi %90, %c64 : index
          %92 = arith.minsi %88, %91 : index
          %93 = affine.apply #map2()[%91, %92]
          %94 = arith.cmpi slt, %93, %c64 : index
          %reinterpret_cast_5 = memref.reinterpret_cast %arg4 to offset: [%84], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_6 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
          annotation.mark %alloc_6 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
          %cast = memref.cast %alloc_6 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
          %subview = memref.subview %reinterpret_cast_5[0, 0] [%93, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %95 = affine.apply #map3()[%91, %92]
          %96 = affine.apply #map4()[%92]
          %97 = affine.apply #map5()[%92]
          %subview_7 = memref.subview %alloc_6[0, %96, %97, 0] [8, %95, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
          %cast_8 = memref.cast %subview_7 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
          scf.if %94 {
            %collapse_shape = memref.collapse_shape %alloc_6 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
            hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
          } {hivm.unlikely_condition}
          hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_8 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
          %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
          annotation.mark %alloc_9 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
          %cast_10 = memref.cast %alloc_9 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
          hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, normalized_in_L0C} ins(%cast, %alloc_1, %true, %c128, %c64, %c128 : memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_10 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
          hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_9 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_4 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 5
          hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
          %98 = memref.load %15[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %98 {memref_ext.volatile} : i32
          %99 = arith.subi %98, %c1_i32 : i32
          memref.store %99, %15[] : memref<i32, #hivm.address_space<ssbuf>>
          %100 = memref.load %16[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %100 {memref_ext.volatile} : i32
          %101 = arith.subi %100, %c1_i32 : i32
          memref.store %101, %16[] : memref<i32, #hivm.address_space<ssbuf>>
          %102 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %102 {memref_ext.volatile} : i32
          %103 = arith.addi %102, %c1_i32 : i32
          memref.store %103, %9[] : memref<i32, #hivm.address_space<ssbuf>>
          %104 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %104 {memref_ext.volatile} : i32
          %105 = arith.addi %104, %c1_i32 : i32
          memref.store %105, %10[] : memref<i32, #hivm.address_space<ssbuf>>
          %106 = arith.addi %arg23, %c1_i32 : i32
          scf.yield %106 : i32
        } else {
          scf.yield %arg23 : i32
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 7 : i32}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        scf.yield %56, %64, %78 : i32, i32, i32
      } {fixpipe_for_mmad_result_already_inserted = true}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
  func.func @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_fused_2_outlined_vf_0(%arg0: memref<32x128xbf16, #hivm.address_space<ub>>, %arg1: memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg2, 0] [1, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[0, %arg2, 0] [8, 1, 16] [1, 1, 1] : memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> to memref<8x1x16xbf16, strided<[528, 16, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x128xbf16>
      %1 = vector.shape_cast %0 : vector<1x128xbf16> to vector<8x1x16xbf16>
      vector.transfer_write %1, %subview_0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<8x1x16xbf16>, memref<8x1x16xbf16, strided<[528, 16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_vf_0(%arg0: memref<64x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_vf_1(%arg0: memref<64x128xf32, #hivm.address_space<ub>>, %arg1: memref<64x128xbf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c64 step %c1 {
      scf.for %arg3 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg2, %arg3] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg2, %arg3] [1, 64] [1, 1] : memref<64x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = arith.truncf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
        vector.transfer_write %1, %subview_0[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xbf16>, memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_vf_2(%arg0: memref<64x128xbf16, #hivm.address_space<ub>>, %arg1: memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg2, 0] [1, 128] [1, 1] : memref<64x128xbf16, #hivm.address_space<ub>> to memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[0, %arg2, 0] [8, 1, 16] [1, 1, 1] : memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<8x1x16xbf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x128xbf16>
      %1 = vector.shape_cast %0 : vector<1x128xbf16> to vector<8x1x16xbf16>
      vector.transfer_write %1, %subview_0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<8x1x16xbf16>, memref<8x1x16xbf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_vf_3(%arg0: memref<32x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_vf_5(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64x128xf32, #hivm.address_space<ub>>, %arg2: memref<64x128xf32, #hivm.address_space<ub>>, %arg3: memref<64x128xf32, #hivm.address_space<ub>>, %arg4: f32, %arg5: memref<64x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %arg4 : f32 to vector<1x64xf32>
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg6] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map9} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      scf.for %arg7 = %c0 to %c128 step %c64 {
        %subview_0 = memref.subview %arg1[%arg6, %arg7] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg6, %arg7] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg3[%arg6, %arg7] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg5[%arg6, %arg7] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %4 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = arith.mulf %3, %0 : vector<1x64xf32>
        %6 = arith.subf %5, %4 : vector<1x64xf32>
        %7 = arith.mulf %2, %1 : vector<1x64xf32>
        %8 = arith.addf %7, %6 : vector<1x64xf32>
        vector.transfer_write %8, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg8: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg12: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg14: f32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<19xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c32 = arith.constant 32 : index
    %c28_i32 = arith.constant 28 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %c1040_i64 = arith.constant 1040 : i64
    %c16_i64 = arith.constant 16 : i64
    %c1036_i64 = arith.constant 1036 : i64
    %c12_i64 = arith.constant 12 : i64
    %c1032_i64 = arith.constant 1032 : i64
    %c8_i64 = arith.constant 8 : i64
    %c1028_i64 = arith.constant 1028 : i64
    %c4_i64 = arith.constant 4 : i64
    %c1024_i64 = arith.constant 1024 : i64
    %cst = arith.constant 0.000000e+00 : f32
    %c64_i32 = arith.constant 64 : i32
    %c0_i32 = arith.constant 0 : i32
    %c128_i64 = arith.constant 128 : i64
    %c96_i32 = arith.constant 96 : i32
    %c128_i32 = arith.constant 128 : i32
    %c16384_i64 = arith.constant 16384 : i64
    %c16384_i32 = arith.constant 16384 : i32
    %c-1_i32 = arith.constant -1 : i32
    %c1572864_i64 = arith.constant 1572864 : i64
    %c12288_i32 = arith.constant 12288 : i32
    %c63_i32 = arith.constant 63 : i32
    %c128 = arith.constant 128 : index
    %c64 = arith.constant 64 : index
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %c0_i64 = arith.constant 0 : i64
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %0 = arith.muli %arg16, %arg17 : i32
    %1 = arith.muli %0, %arg18 : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %4 = hivm.hir.get_sub_block_idx -> i64
    %5 = arith.muli %4, %c1024_i64 : i64
    %6 = arith.addi %5, %c8_i64 : i64
    %7 = arith.addi %5, %c4_i64 : i64
    %8 = arith.addi %5, %c16_i64 : i64
    %9 = arith.addi %5, %c12_i64 : i64
    %10 = arith.index_cast %4 : i64 to index
    %11 = affine.apply #map10()[%10]
    %12 = affine.apply #map11()[%10]
    %13 = affine.apply #map12()[%10]
    %14 = affine.apply #map13()[%10]
    annotation.mark %1 {logical_block_num} : i32
    %15 = affine.apply #map14()[%10]
    scf.for %arg19 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %16 = arith.remsi %arg19, %arg16 : i32
      %17 = arith.divsi %arg19, %arg16 : i32
      %18 = arith.remsi %17, %arg17 : i32
      %19 = hivm.hir.pointer_cast(%c0_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %20 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %19[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %20[] : memref<i32, #hivm.address_space<ssbuf>>
      %21 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %22 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %21[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %22[] : memref<i32, #hivm.address_space<ssbuf>>
      %23 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %24 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %23[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %24[] : memref<i32, #hivm.address_space<ssbuf>>
      %25 = hivm.hir.pointer_cast(%c12_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %26 = hivm.hir.pointer_cast(%c1036_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %25[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %26[] : memref<i32, #hivm.address_space<ssbuf>>
      %27 = hivm.hir.pointer_cast(%c16_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %28 = hivm.hir.pointer_cast(%c1040_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %27[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %28[] : memref<i32, #hivm.address_space<ssbuf>>
      %29 = hivm.hir.pointer_cast(%6) : memref<i32, #hivm.address_space<ssbuf>>
      %30 = hivm.hir.pointer_cast(%7) : memref<i32, #hivm.address_space<ssbuf>>
      %31 = hivm.hir.pointer_cast(%5) : memref<i32, #hivm.address_space<ssbuf>>
      %32 = hivm.hir.pointer_cast(%8) : memref<i32, #hivm.address_space<ssbuf>>
      %33 = hivm.hir.pointer_cast(%9) : memref<i32, #hivm.address_space<ssbuf>>
      %34 = arith.divsi %18, %c96_i32 : i32
      %35 = arith.remsi %18, %c96_i32 : i32
      %36 = arith.index_cast %34 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg12 to offset: [%36], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %37 = affine.apply #map()[%36]
      %38 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %39 = arith.trunci %38 : i64 to i32
      %reinterpret_cast_1 = memref.reinterpret_cast %arg12 to offset: [%37], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %40 = memref.load %reinterpret_cast_1[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %41 = arith.trunci %40 : i64 to i32
      %42 = arith.subi %41, %39 : i32
      %43 = arith.addi %42, %c63_i32 : i32
      %44 = arith.divsi %43, %c64_i32 : i32
      %reinterpret_cast_2 = memref.reinterpret_cast %arg13 to offset: [%36], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %45 = memref.load %reinterpret_cast_2[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %46 = arith.trunci %45 : i64 to i32
      %47 = arith.muli %39, %c96_i32 : i32
      %48 = arith.addi %47, %35 : i32
      %49 = arith.extsi %48 : i32 to i64
      %50 = arith.muli %49, %c128_i64 : i64
      %51 = arith.index_cast %50 : i64 to index
      %52 = arith.muli %46, %c96_i32 : i32
      %53 = arith.addi %52, %35 : i32
      %54 = arith.extsi %53 : i32 to i64
      %55 = arith.muli %54, %c16384_i64 : i64
      %56 = arith.muli %18, %c16384_i32 : i32
      %57 = arith.index_cast %56 : i32 to index
      %58 = arith.muli %16, %c128_i32 : i32
      %59 = arith.maxsi %58, %c0_i32 : i32
      %60 = arith.index_cast %59 : i32 to index
      %61 = affine.apply #map8()[%60]
      %62 = affine.apply #map15()[%57, %60]
      %63 = affine.apply #map16()[%60]
      %64 = affine.apply #map17()[%60]
      %reinterpret_cast_3 = memref.reinterpret_cast %arg6 to offset: [%62], sizes: [128, 128], strides: [128, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc {hivm.multi_buffer = 2 : i32} : memref<64x128xf32, #hivm.address_space<ub>>
      %65 = arith.maxsi %64, %c0 : index
      %66 = arith.minsi %65, %c128 : index
      %67 = arith.maxsi %63, %c0 : index
      %68 = arith.minsi %67, %c128 : index
      %69 = arith.minsi %66, %c0 : index
      %70 = affine.apply #map2()[%66, %69]
      %71 = arith.subi %c0_i32, %58 : i32
      %72 = arith.maxsi %71, %c0_i32 : i32
      %73 = arith.index_cast %72 : i32 to index
      %74 = arith.minsi %73, %68 : index
      %75 = affine.apply #map2()[%68, %74]
      %76 = arith.cmpi slt, %70, %c128 : index
      %77 = arith.cmpi slt, %75, %c128 : index
      %78 = arith.ori %76, %77 : i1
      %79 = arith.minsi %11, %70 : index
      %80 = affine.apply #map18()[%79, %66, %69]
      %81 = arith.minsi %80, %c64 : index
      %subview = memref.subview %reinterpret_cast_3[%11, 0] [%81, %75] [1, 1] : memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %82 = arith.maxsi %69, %11 : index
      %83 = arith.minsi %66, %15 : index
      %84 = arith.maxsi %82, %83 : index
      %85 = affine.apply #map2()[%84, %82]
      %86 = affine.apply #map19()[%82, %10]
      %subview_4 = memref.subview %alloc[%86, %74] [%85, %75] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %87 = arith.remui %74, %c8 : index
      scf.if %78 {
        func.call @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_vf_0(%alloc) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_4 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %87 : index
      %88 = arith.subi %44, %c1_i32 : i32
      %89 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %90 = arith.trunci %89 : i64 to i32
      %91 = memref.load %reinterpret_cast_1[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %92 = arith.trunci %91 : i64 to i32
      %93 = arith.subi %92, %90 : i32
      %94 = arith.addi %93, %c63_i32 : i32
      %95 = arith.divsi %94, %c64_i32 : i32
      %96 = arith.subi %95, %c1_i32 : i32
      %alloc_5 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_6 = memref.subview %alloc_5[0, %13, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_5 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %alloc_7 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_8 = memref.subview %alloc_7[0, %14, 0, 0] [8, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_7 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %alloc_9 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_9 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
      %alloc_10 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_10 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
      %alloc_11 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_11 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
      %alloc_12 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
      %alloc_13 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
      %97 = arith.muli %95, %c3_i32 : i32
      %98 = arith.addi %97, %c2_i32 : i32
      %99:6 = scf.for %arg20 = %c-1_i32 to %98 step %c1_i32 iter_args(%arg21 = %alloc, %arg22 = %c-1_i32, %arg23 = %c-1_i32, %arg24 = %c-1_i32, %arg25 = %c0_i32, %arg26 = %c1_i32) -> (memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32, i32)  : i32 {
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        %100 = memref.load %33[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %100 {memref_ext.volatile} : i32
        %101 = arith.cmpi slt, %100, %c1_i32 : i32
        %102 = arith.cmpi eq, %arg26, %c1_i32 : i32
        %103 = arith.cmpi slt, %arg22, %96 : i32
        %104 = arith.andi %101, %102 : i1
        %105 = arith.andi %104, %103 : i1
        %106:2 = scf.if %105 -> (i32, i32) {
          %alloc_17 = memref.alloc() {alignment = 64 : i64} : memref<64x128xbf16, #hivm.address_space<ub>>
          annotation.mark %alloc_17 {hivm.multi_buffer = 2 : i32} : memref<64x128xbf16, #hivm.address_space<ub>>
          func.call @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_vf_1(%arg21, %alloc_17) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xbf16, #hivm.address_space<ub>>) -> ()
          %129 = arith.subi %88, %arg22 : i32
          %130 = arith.addi %129, %c-1_i32 : i32
          %131 = arith.extsi %130 : i32 to i64
          %132 = arith.muli %131, %c1572864_i64 : i64
          %133 = arith.addi %55, %132 : i64
          %134 = arith.index_cast %133 : i64 to index
          %135 = affine.apply #map15()[%134, %60]
          %reinterpret_cast_18 = memref.reinterpret_cast %arg9 to offset: [%135], sizes: [128, 128], strides: [128, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
          %subview_19 = memref.subview %alloc_17[%86, %74] [%85, %75] [1, 1] : memref<64x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
          %subview_20 = memref.subview %reinterpret_cast_18[%11, 0] [%81, %75] [1, 1] : memref<128x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_21 = memref.alloc() : memref<8x65x16x1xbf16, #hivm.address_space<ub>>
          %subview_22 = memref.subview %alloc_21[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xbf16, #hivm.address_space<ub>> to memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
          func.call @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_vf_2(%alloc_17, %subview_22) {hivm.vector_function, no_inline} : (memref<64x128xbf16, #hivm.address_space<ub>>, memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
          %expand_shape = memref.expand_shape %subview_22 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
          %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
          %collapse_shape_23 = memref.collapse_shape %subview_6 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
          hivm.hir.copy ins(%collapse_shape : memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_23 : memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
          hivm.hir.store ins(%subview_19 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_20 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
          %136 = memref.load %33[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %136 {memref_ext.volatile} : i32
          %137 = arith.addi %136, %c1_i32 : i32
          memref.store %137, %33[] : memref<i32, #hivm.address_space<ssbuf>>
          %138 = arith.subi %arg26, %c1_i32 : i32
          %139 = arith.addi %arg22, %c1_i32 : i32
          scf.yield %138, %139 : i32, i32
        } else {
          scf.yield %arg26, %arg22 : i32, i32
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 11 : i32}
        %107 = memref.load %31[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %107 {memref_ext.volatile} : i32
        %108 = arith.cmpi sgt, %107, %c0_i32 : i32
        %109 = memref.load %32[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %109 {memref_ext.volatile} : i32
        %110 = arith.cmpi slt, %109, %c1_i32 : i32
        %111 = arith.andi %108, %110 : i1
        %112 = arith.cmpi slt, %arg25, %c2_i32 : i32
        %113 = arith.cmpi slt, %arg23, %96 : i32
        %114 = arith.andi %111, %112 : i1
        %115 = arith.andi %114, %113 : i1
        %116:2 = scf.if %115 -> (i32, i32) {
          %129 = arith.subi %88, %arg23 : i32
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 3
          %130 = arith.addi %129, %c-1_i32 : i32
          %131 = arith.muli %129, %c64_i32 : i32
          %132 = arith.minsi %131, %42 : i32
          %133 = arith.subi %132, %c1_i32 : i32
          %134 = arith.muli %130, %c64_i32 : i32
          %135 = arith.maxsi %134, %c0_i32 : i32
          %136 = arith.index_cast %135 : i32 to index
          %137 = affine.apply #map6()[%60, %51, %136]
          %138 = arith.index_cast %42 : i32 to index
          %139 = affine.apply #map7()[%138, %60, %136]
          %reinterpret_cast_17 = memref.reinterpret_cast %arg10 to offset: [%137], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %reinterpret_cast_18 = memref.reinterpret_cast %arg11 to offset: [%137], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %140 = arith.maxsi %139, %c0 : index
          %141 = arith.minsi %140, %c64 : index
          %142 = arith.maxsi %61, %c0 : index
          %143 = arith.minsi %142, %c128 : index
          %144 = arith.subi %c0_i32, %134 : i32
          %145 = arith.maxsi %144, %c0_i32 : i32
          %146 = arith.index_cast %145 : i32 to index
          %147 = arith.minsi %146, %141 : index
          %148 = affine.apply #map2()[%141, %147]
          %149 = arith.minsi %73, %143 : index
          %150 = affine.apply #map2()[%143, %149]
          %151 = arith.cmpi slt, %148, %c64 : index
          %152 = arith.cmpi slt, %150, %c128 : index
          %153 = arith.ori %151, %152 : i1
          %154 = arith.muli %133, %c12288_i32 : i32
          %155 = arith.index_cast %154 : i32 to index
          %156 = affine.apply #map15()[%51, %155]
          %reinterpret_cast_19 = memref.reinterpret_cast %arg5 to offset: [%156], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %subview_20 = memref.subview %reinterpret_cast_19[%11] [64] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %alloc_21 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_21 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32} : memref<64xf32, #hivm.address_space<ub>>
          hivm.hir.load ins(%subview_20 : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_21 : memref<64xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
          %alloc_22 = memref.alloc() : memref<32x128xbf16, #hivm.address_space<ub>>
          annotation.mark %alloc_22 {hivm.multi_buffer = 2 : i32} : memref<32x128xbf16, #hivm.address_space<ub>>
          %157 = arith.minsi %12, %148 : index
          %158 = affine.apply #map18()[%157, %141, %147]
          %159 = arith.minsi %158, %c32 : index
          %subview_23 = memref.subview %reinterpret_cast_17[%12, 0] [%159, %150] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %160 = affine.apply #map20()[%10]
          %161 = arith.maxsi %147, %12 : index
          %162 = arith.minsi %141, %160 : index
          %163 = arith.maxsi %161, %162 : index
          %164 = affine.apply #map2()[%163, %161]
          %165 = affine.apply #map21()[%161, %10]
          %subview_24 = memref.subview %alloc_22[%165, %149] [%164, %150] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
          %166 = arith.remui %149, %c16 : index
          scf.if %153 {
            func.call @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_vf_3(%alloc_22) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          hivm.hir.load ins(%subview_23 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_24 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %166 : index
          %subview_25 = memref.subview %reinterpret_cast_18[%12, 0] [%159, %150] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
          %expand_shape = memref.expand_shape %alloc_21 [[0, 1]] output_shape [64, 1] : memref<64xf32, #hivm.address_space<ub>> into memref<64x1xf32, #hivm.address_space<ub>>
          %alloc_26 = memref.alloc() {alignment = 64 : i64} : memref<64x1xf32, #hivm.address_space<ub>>
          %alloc_27 = memref.alloc() {alignment = 64 : i64} : memref<32x128xbf16, #hivm.address_space<ub>>
          annotation.mark %alloc_27 {hivm.multi_buffer = 2 : i32} : memref<32x128xbf16, #hivm.address_space<ub>>
          func.call @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_merged_vf_0(%expand_shape, %alloc_26, %alloc_9, %alloc_22, %alloc_27) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64x1xf32, #hivm.address_space<ub>>, memref<64x1xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xbf16, #hivm.address_space<ub>>, memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
          %collapse_shape = memref.collapse_shape %alloc_26 [[0, 1]] : memref<64x1xf32, #hivm.address_space<ub>> into memref<64xf32, #hivm.address_space<ub>>
          %subview_28 = memref.subview %alloc_27[%165, %149] [%164, %150] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
          %alloc_29 = memref.alloc() : memref<8x33x16x1xbf16, #hivm.address_space<ub>>
          %subview_30 = memref.subview %alloc_29[0, 0, 0, 0] [8, 32, 16, 1] [1, 1, 1, 1] : memref<8x33x16x1xbf16, #hivm.address_space<ub>> to memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>
          func.call @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_fused_2_outlined_vf_0(%alloc_27, %subview_30) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>, memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) -> ()
          %expand_shape_31 = memref.expand_shape %subview_30 [[0], [1, 2], [3]] output_shape [8, 2, 16, 16] : memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> into memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
          %collapse_shape_32 = memref.collapse_shape %expand_shape_31 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>
          %collapse_shape_33 = memref.collapse_shape %subview_8 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
          hivm.hir.copy ins(%collapse_shape_32 : memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_33 : memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
          hivm.hir.store ins(%subview_28 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_25 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
          %167 = arith.subi %arg23, %c-1_i32 : i32
          %168 = arith.remsi %167, %c2_i32 : i32
          %169 = arith.cmpi eq, %168, %c0_i32 : i32
          scf.if %169 {
            hivm.hir.copy ins(%collapse_shape : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_12 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
          } else {
            hivm.hir.copy ins(%collapse_shape : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_13 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
          }
          %170 = memref.load %31[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %170 {memref_ext.volatile} : i32
          %171 = arith.subi %170, %c1_i32 : i32
          memref.store %171, %31[] : memref<i32, #hivm.address_space<ssbuf>>
          %172 = memref.load %32[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %172 {memref_ext.volatile} : i32
          %173 = arith.addi %172, %c1_i32 : i32
          memref.store %173, %32[] : memref<i32, #hivm.address_space<ssbuf>>
          %174 = arith.addi %arg25, %c1_i32 : i32
          %175 = arith.addi %arg23, %c1_i32 : i32
          scf.yield %174, %175 : i32, i32
        } else {
          scf.yield %arg25, %arg23 : i32, i32
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 13 : i32}
        %117 = memref.load %29[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %117 {memref_ext.volatile} : i32
        %118 = arith.cmpi sgt, %117, %c0_i32 : i32
        %119 = memref.load %30[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %119 {memref_ext.volatile} : i32
        %120 = arith.cmpi sgt, %119, %c0_i32 : i32
        %121 = arith.andi %118, %120 : i1
        %122 = arith.cmpi sgt, %116#0, %c0_i32 : i32
        %123 = arith.cmpi eq, %106#0, %c0_i32 : i32
        %124 = arith.andi %122, %123 : i1
        %125 = arith.cmpi slt, %arg24, %96 : i32
        %126 = arith.andi %121, %124 : i1
        %127 = arith.andi %126, %125 : i1
        %128:4 = scf.if %127 -> (memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32) {
          %129 = arith.subi %arg24, %c-1_i32 : i32
          %130 = arith.remsi %129, %c2_i32 : i32
          %131 = arith.cmpi eq, %130, %c0_i32 : i32
          %132 = arith.select %131, %alloc_12, %alloc_13 : memref<64xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 5
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 4
          %alloc_17 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
          func.call @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128_mix_aiv_outlined_vf_5(%132, %arg21, %alloc_10, %alloc_11, %arg14, %alloc_17) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, f32, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
          %133 = memref.load %29[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %133 {memref_ext.volatile} : i32
          %134 = arith.subi %133, %c1_i32 : i32
          memref.store %134, %29[] : memref<i32, #hivm.address_space<ssbuf>>
          %135 = memref.load %30[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %135 {memref_ext.volatile} : i32
          %136 = arith.subi %135, %c1_i32 : i32
          memref.store %136, %30[] : memref<i32, #hivm.address_space<ssbuf>>
          %137 = arith.addi %106#0, %c1_i32 : i32
          %138 = arith.subi %116#0, %c1_i32 : i32
          %139 = arith.addi %arg24, %c1_i32 : i32
          scf.yield %alloc_17, %137, %138, %139 : memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
        } else {
          scf.yield %arg21, %106#0, %116#0, %arg24 : memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
        }
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        scf.yield %128#0, %106#1, %116#1, %128#3, %128#2, %128#1 : memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32, i32
      }
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %reinterpret_cast_14 = memref.reinterpret_cast %arg7 to offset: [%62], sizes: [128, 128], strides: [128, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_15 = memref.subview %reinterpret_cast_14[%11, 0] [%81, %75] [1, 1] : memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_16 = memref.subview %99#0[%86, %74] [%85, %75] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.store ins(%subview_16 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_15 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}
