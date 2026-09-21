// -----// IR Dump Before PlanMemoryRegBase (hivm-plan-memory-regbase) //----- //
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
    %c0_i64 = arith.constant 0 : i64
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
      %5 = hivm.hir.pointer_cast(%c0_i64) : memref<i32, #hivm.address_space<ssbuf>>
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
        %11 = arith.divsi %arg14, %c64_i32 : i32
        %12 = arith.remsi %arg14, %c64_i32 : i32
        %13 = arith.divsi %11, %c8_i32 : i32
        %14 = arith.remsi %11, %c8_i32 : i32
        %15 = arith.extsi %14 : i32 to i64
        %16 = arith.muli %14, %arg9 : i32
        %17 = arith.divsi %16, %c8_i32 : i32
        %18 = arith.extsi %13 : i32 to i64
        %19 = arith.muli %18, %c8388608_i64 : i64
        %20 = arith.muli %15, %c1048576_i64 : i64
        %21 = arith.addi %19, %20 : i64
        %22 = arith.extsi %17 : i32 to i64
        %23 = arith.muli %22, %c1048576_i64 : i64
        %24 = arith.addi %19, %23 : i64
        %25 = arith.index_cast %21 : i64 to index
        %26 = arith.muli %12, %c128_i32 : i32
        %27 = arith.maxsi %26, %c0_i32 : i32
        %28 = arith.index_cast %27 : i32 to index
        %29 = affine.apply #map1()[%25, %28]
        %reinterpret_cast = memref.reinterpret_cast %arg2 to offset: [%29], sizes: [128, 128], strides: [128, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
        %30 = arith.index_cast %24 : i64 to index
        %alloc = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %cast = memref.cast %alloc : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
        hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast : memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
        %alloc_0 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %alloc_1 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_1 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_0 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 4
        %alloc_2 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_3 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_3 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_2 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_4 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_5 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_5 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_4 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %31:5 = scf.for %arg15 = %c0_i32 to %c8576_i32 step %c128_i32 iter_args(%arg16 = %c0_i32, %arg17 = %c0_i32, %arg18 = %c0_i32, %arg19 = %c0_i32, %arg20 = %c0_i32) -> (i32, i32, i32, i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          %32 = arith.cmpi slt, %arg18, %c8192_i32 : i32
          %33 = scf.if %32 -> (i32) {
            %60 = arith.addi %arg18, %c128_i32 : i32
            scf.yield %60 : i32
          } else {
            scf.yield %arg18 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 10 : i32}
          %34 = memref.load %5[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %34 {memref_ext.volatile} : i32
          %35 = arith.cmpi slt, %34, %c2_i32 : i32
          %36 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %36 {memref_ext.volatile} : i32
          %37 = arith.cmpi slt, %36, %c2_i32 : i32
          %38 = arith.andi %35, %37 : i1
          %39 = arith.cmpi slt, %arg19, %c8192_i32 : i32
          %40 = arith.andi %38, %39 : i1
          %41:2 = scf.if %40 -> (i32, i32) {
            %60 = arith.divsi %arg19, %c128_i32 : i32
            %61 = arith.remsi %60, %c2_i32 : i32
            %62 = arith.cmpi eq, %61, %c0_i32 : i32
            %63 = arith.maxsi %arg16, %c0_i32 : i32
            %64 = arith.index_cast %63 : i32 to index
            %65 = affine.apply #map1()[%30, %64]
            %reinterpret_cast_6 = memref.reinterpret_cast %arg3 to offset: [%65], sizes: [128, 128], strides: [128, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_7 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
            annotation.mark %alloc_7 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
            %cast_8 = memref.cast %alloc_7 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
            hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast_6 : memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_8 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
            %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            annotation.mark %alloc_9 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            %cast_10 = memref.cast %alloc_9 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, normalized_in_L0C} ins(%cast, %cast_8, %true, %c128, %c128, %c128 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_10 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %62 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_9 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_2 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_9 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_3 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 5
            }
            %66 = arith.addi %arg16, %c128_i32 : i32
            %67 = memref.load %5[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %67 {memref_ext.volatile} : i32
            %68 = arith.addi %67, %c1_i32 : i32
            memref.store %68, %5[] : memref<i32, #hivm.address_space<ssbuf>>
            %69 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %69 {memref_ext.volatile} : i32
            %70 = arith.addi %69, %c1_i32 : i32
            memref.store %70, %6[] : memref<i32, #hivm.address_space<ssbuf>>
            %71 = arith.addi %arg19, %c128_i32 : i32
            scf.yield %66, %71 : i32, i32
          } else {
            scf.yield %arg16, %arg19 : i32, i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 4 : i32}
          %42 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %42 {memref_ext.volatile} : i32
          %43 = arith.cmpi sgt, %42, %c0_i32 : i32
          %44 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %44 {memref_ext.volatile} : i32
          %45 = arith.cmpi sgt, %44, %c0_i32 : i32
          %46 = arith.andi %43, %45 : i1
          %47 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %47 {memref_ext.volatile} : i32
          %48 = arith.cmpi slt, %47, %c2_i32 : i32
          %49 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %49 {memref_ext.volatile} : i32
          %50 = arith.cmpi slt, %49, %c2_i32 : i32
          %51 = arith.andi %48, %50 : i1
          %52 = arith.andi %46, %51 : i1
          %53 = arith.cmpi sge, %arg19, %c8192_i32 : i32
          %54 = arith.cmpi sge, %arg19, %c256_i32 : i32
          %55 = arith.ori %53, %54 : i1
          %56 = arith.cmpi slt, %arg20, %c8192_i32 : i32
          %57 = arith.andi %52, %55 : i1
          %58 = arith.andi %57, %56 : i1
          %59:2 = scf.if %58 -> (i32, i32) {
            %60 = arith.divsi %arg20, %c128_i32 : i32
            %61 = arith.remsi %60, %c2_i32 : i32
            %62 = arith.cmpi eq, %61, %c0_i32 : i32
            %63 = arith.maxsi %arg17, %c0_i32 {ssbuffer.arg = 1 : i32} : i32
            %64 = arith.index_cast %63 : i32 to index
            %65 = affine.apply #map1()[%30, %64]
            %reinterpret_cast_6 = memref.reinterpret_cast %arg4 to offset: [%65], sizes: [128, 128], strides: [128, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_7 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
            annotation.mark %alloc_7 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
            %cast_8 = memref.cast %alloc_7 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
            hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast_6 : memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_8 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
            %66 = arith.select %62, %alloc_0, %alloc_1 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
            scf.if %62 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
            }
            %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            annotation.mark %alloc_9 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            %cast_10 = memref.cast %alloc_9 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, normalized_in_L0C} ins(%66, %cast_8, %true, %c128, %c128, %c128 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_10 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %62 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_9 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_4 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 3
              hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_9 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_5 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 6
              hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 4
            }
            %67 = arith.addi %arg17, %c128_i32 {ssbuffer.arg = 1 : i32} : i32
            %68 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %68 {memref_ext.volatile} : i32
            %69 = arith.subi %68, %c1_i32 : i32
            memref.store %69, %9[] : memref<i32, #hivm.address_space<ssbuf>>
            %70 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %70 {memref_ext.volatile} : i32
            %71 = arith.subi %70, %c1_i32 : i32
            memref.store %71, %10[] : memref<i32, #hivm.address_space<ssbuf>>
            %72 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %72 {memref_ext.volatile} : i32
            %73 = arith.addi %72, %c1_i32 : i32
            memref.store %73, %7[] : memref<i32, #hivm.address_space<ssbuf>>
            %74 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %74 {memref_ext.volatile} : i32
            %75 = arith.addi %74, %c1_i32 : i32
            memref.store %75, %8[] : memref<i32, #hivm.address_space<ssbuf>>
            %76 = arith.addi %arg20, %c128_i32 : i32
            scf.yield %67, %76 : i32, i32
          } else {
            scf.yield %arg17, %arg20 : i32, i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 6 : i32}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %41#0, %59#0, %33, %41#1, %59#1 : i32, i32, i32, i32, i32
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
    %c0_i64 = arith.constant 0 : i64
    %0 = arith.muli %arg10, %arg11 : i32
    %1 = arith.muli %0, %arg12 : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %4 = hivm.hir.get_sub_block_idx -> i64
    %5 = arith.muli %4, %c1024_i64 : i64
    %6 = arith.addi %5, %c4_i64 : i64
    %7 = arith.addi %5, %c8_i64 : i64
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
    call @_attn_fwd_mix_aiv_outlined_vf_7(%alloc) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>) -> ()
    %8 = arith.index_cast %4 : i64 to index
    %9 = affine.apply #map3()[%8]
    %10 = affine.apply #map4()[%8]
    annotation.mark %1 {logical_block_num} : i32
    scf.for %arg13 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %11 = arith.remsi %arg13, %arg10 : i32
      %12 = hivm.hir.pointer_cast(%c0_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %13 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %12[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %13[] : memref<i32, #hivm.address_space<ssbuf>>
      %14 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %15 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %14[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %15[] : memref<i32, #hivm.address_space<ssbuf>>
      %16 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %17 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %16[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %17[] : memref<i32, #hivm.address_space<ssbuf>>
      %18 = hivm.hir.pointer_cast(%6) : memref<i32, #hivm.address_space<ssbuf>>
      %19 = hivm.hir.pointer_cast(%5) : memref<i32, #hivm.address_space<ssbuf>>
      %20 = hivm.hir.pointer_cast(%7) : memref<i32, #hivm.address_space<ssbuf>>
      scf.for %arg14 = %11 to %c65536_i32 step %c28_i32  : i32 {
        %alloc_0 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %subview = memref.subview %alloc_0[0, %10, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %alloc_1 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %subview_2 = memref.subview %alloc_1[0, %10, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_1 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_0 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %alloc_3 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_3 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_4 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_4 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        %alloc_5 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_5 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_6 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_6 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        %alloc_7 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_8 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_9 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_10 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_11 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_12 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        %alloc_13 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
        func.call @_attn_fwd_mix_aiv_outlined_vf_4(%alloc_13) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>) -> ()
        %alloc_14 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
        func.call @_attn_fwd_mix_aiv_outlined_vf_5(%alloc_14) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>) -> ()
        %alloc_15 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%alloc : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_15 : memref<64xf32, #hivm.address_space<ub>>)
        %21:8 = scf.for %arg15 = %c0_i32 to %c8576_i32 step %c128_i32 iter_args(%arg16 = %alloc_14, %arg17 = %alloc_13, %arg18 = %alloc_15, %arg19 = %c0_i32, %arg20 = %c0_i32, %arg21 = %c0_i32, %arg22 = %c0_i32, %arg23 = %c0_i32) -> (memref<64x128xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32, i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          %40 = arith.cmpi slt, %arg19, %c8192_i32 : i32
          %41 = scf.if %40 -> (i32) {
            %63 = arith.addi %arg19, %c128_i32 : i32
            scf.yield %63 : i32
          } else {
            scf.yield %arg19 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 10 : i32}
          %42 = memref.load %19[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %42 {memref_ext.volatile} : i32
          %43 = arith.cmpi sgt, %42, %c0_i32 : i32
          %44 = memref.load %20[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %44 {memref_ext.volatile} : i32
          %45 = arith.cmpi slt, %44, %c2_i32 : i32
          %46 = arith.andi %43, %45 : i1
          %47 = arith.cmpi slt, %arg22, %c3_i32 : i32
          %48 = arith.cmpi slt, %arg23, %c3_i32 : i32
          %49 = arith.andi %47, %48 : i1
          %50 = arith.cmpi slt, %arg20, %c8192_i32 : i32
          %51 = arith.andi %46, %49 : i1
          %52 = arith.andi %51, %50 : i1
          %53:4 = scf.if %52 -> (memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %63 = arith.divsi %arg20, %c128_i32 : i32
            %64 = arith.remsi %63, %c2_i32 : i32
            %65 = arith.cmpi eq, %64, %c0_i32 : i32
            %66 = arith.select %65, %alloc_3, %alloc_4 : memref<64x128xf32, #hivm.address_space<ub>>
            scf.if %65 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 5
            }
            func.call @_attn_fwd_mix_aiv_outlined_vf_0(%66, %66) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
            %alloc_22 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            func.call @_attn_fwd_mix_aiv_outlined_vf_1(%66, %alloc_22) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
            %alloc_23 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_24 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_25 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_26 = memref.alloc() : memref<8x65x16x1xf16, #hivm.address_space<ub>>
            %subview_27 = memref.subview %alloc_26[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xf16, #hivm.address_space<ub>> to memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
            func.call @_attn_fwd_mix_aiv_outlined_vf_2(%arg18, %alloc_22, %alloc_23, %alloc_24, %66, %alloc_25, %subview_27) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
            %expand_shape = memref.expand_shape %subview_27 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
            scf.if %65 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
              %collapse_shape_28 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_29 = memref.collapse_shape %subview [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_28 : memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_29 : memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 4
              %collapse_shape_28 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_29 = memref.collapse_shape %subview_2 [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_28 : memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_29 : memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
            }
            %67 = arith.divui %arg20, %c128_i32 : i32
            %68 = arith.remsi %67, %c3_i32 : i32
            %69 = arith.cmpi eq, %68, %c0_i32 : i32
            scf.if %69 {
              hivm.hir.copy ins(%alloc_24 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_7 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              hivm.hir.copy ins(%alloc_25 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_10 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
            } else {
              %77 = arith.cmpi eq, %68, %c1_i32 : i32
              scf.if %77 {
                hivm.hir.copy ins(%alloc_24 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_8 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%alloc_25 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_11 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              } else {
                hivm.hir.copy ins(%alloc_24 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_9 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%alloc_25 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_12 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              }
            }
            %70 = memref.load %19[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %70 {memref_ext.volatile} : i32
            %71 = arith.subi %70, %c1_i32 : i32
            memref.store %71, %19[] : memref<i32, #hivm.address_space<ssbuf>>
            %72 = memref.load %20[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %72 {memref_ext.volatile} : i32
            %73 = arith.addi %72, %c1_i32 : i32
            memref.store %73, %20[] : memref<i32, #hivm.address_space<ssbuf>>
            %74 = arith.addi %arg23, %c1_i32 : i32
            %75 = arith.addi %arg22, %c1_i32 : i32
            %76 = arith.addi %arg20, %c128_i32 : i32
            scf.yield %alloc_23, %74, %75, %76 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg18, %arg23, %arg22, %arg20 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          %54 = memref.load %18[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %54 {memref_ext.volatile} : i32
          %55 = arith.cmpi sgt, %54, %c0_i32 : i32
          %56 = arith.cmpi sgt, %53#2, %c0_i32 : i32
          %57 = arith.cmpi sgt, %53#1, %c0_i32 : i32
          %58 = arith.andi %56, %57 : i1
          %59 = arith.cmpi slt, %arg21, %c8192_i32 : i32
          %60 = arith.andi %55, %58 : i1
          %61 = arith.andi %60, %59 : i1
          %62:5 = scf.if %61 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %63 = arith.divsi %arg21, %c128_i32 : i32
            %64 = arith.remsi %63, %c2_i32 : i32
            %65 = arith.cmpi eq, %64, %c0_i32 : i32
            %66 = arith.divui %arg21, %c128_i32 : i32
            %67 = arith.remsi %66, %c3_i32 : i32
            %68 = arith.cmpi eq, %67, %c0_i32 : i32
            %69:2 = scf.if %68 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) {
              scf.yield %alloc_10, %alloc_7 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            } else {
              %76 = arith.cmpi eq, %67, %c1_i32 : i32
              %77 = arith.select %76, %alloc_11, %alloc_12 : memref<64xf32, #hivm.address_space<ub>>
              %78 = arith.select %76, %alloc_8, %alloc_9 : memref<64xf32, #hivm.address_space<ub>>
              scf.yield %77, %78 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            }
            %70 = arith.select %65, %alloc_5, %alloc_6 : memref<64x128xf32, #hivm.address_space<ub>>
            scf.if %65 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 3
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 6
            }
            %alloc_22 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_23 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
            func.call @_attn_fwd_mix_aiv_fused_2_outlined_merged_vf_0(%arg17, %69#1, %69#0, %alloc_22, %69#1, %70, %arg16, %alloc_23) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
            scf.if %65 {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
            } else {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
            } {ssbuffer.cross_buffer = 1 : i32}
            %71 = memref.load %18[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %71 {memref_ext.volatile} : i32
            %72 = arith.subi %71, %c1_i32 : i32
            memref.store %72, %18[] : memref<i32, #hivm.address_space<ssbuf>>
            %73 = arith.subi %53#1, %c1_i32 : i32
            %74 = arith.subi %53#2, %c1_i32 : i32
            %75 = arith.addi %arg21, %c128_i32 : i32
            scf.yield %alloc_22, %alloc_23, %73, %74, %75 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg17, %arg16, %53#1, %53#2, %arg21 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %62#1, %62#0, %53#0, %41, %53#3, %62#4, %62#3, %62#2 : memref<64x128xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32, i32, i32
        }
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 4
        %22 = arith.divsi %arg14, %c64_i32 : i32
        %23 = arith.remsi %arg14, %c64_i32 : i32
        %24 = arith.divsi %22, %c8_i32 : i32
        %25 = arith.remsi %22, %c8_i32 : i32
        %26 = arith.extsi %25 : i32 to i64
        %27 = arith.extsi %24 : i32 to i64
        %28 = arith.muli %27, %c8388608_i64 : i64
        %29 = arith.muli %26, %c1048576_i64 : i64
        %30 = arith.addi %28, %29 : i64
        %31 = arith.index_cast %30 : i64 to index
        %32 = arith.muli %23, %c128_i32 : i32
        %33 = arith.maxsi %32, %c0_i32 : i32
        %34 = arith.index_cast %33 : i32 to index
        %35 = affine.apply #map1()[%31, %34]
        %reinterpret_cast = memref.reinterpret_cast %arg7 to offset: [%35], sizes: [128, 128], strides: [128, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_16 = memref.subview %reinterpret_cast[%9, 0] [64, 128] [1, 1] {to_be_bubbled_slice} : memref<128x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
        %36 = arith.muli %22, %c8192_i32 : i32
        %37 = arith.index_cast %36 : i32 to index
        %38 = arith.index_cast %32 : i32 to index
        %39 = affine.apply #map5()[%37, %38]
        %reinterpret_cast_17 = memref.reinterpret_cast %arg6 to offset: [%39], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %subview_18 = memref.subview %reinterpret_cast_17[%9] [64] [1] {to_be_bubbled_slice} : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %alloc_19 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
        %alloc_20 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf16, #hivm.address_space<ub>>
        func.call @_attn_fwd_mix_aiv_fused_4_outlined_merged_vf_0(%21#2, %21#1, %alloc_19, %21#1, %21#0, %alloc_20) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf16, #hivm.address_space<ub>>) -> ()
        hivm.hir.store ins(%alloc_19 : memref<64xf32, #hivm.address_space<ub>>) outs(%subview_18 : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        %collapse_shape = memref.collapse_shape %alloc_20 [[0, 1]] : memref<64x128xf16, #hivm.address_space<ub>> into memref<8192xf16, #hivm.address_space<ub>>
        %collapse_shape_21 = memref.collapse_shape %subview_16 [[0, 1]] : memref<64x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<8192xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%collapse_shape : memref<8192xf16, #hivm.address_space<ub>>) outs(%collapse_shape_21 : memref<8192xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}