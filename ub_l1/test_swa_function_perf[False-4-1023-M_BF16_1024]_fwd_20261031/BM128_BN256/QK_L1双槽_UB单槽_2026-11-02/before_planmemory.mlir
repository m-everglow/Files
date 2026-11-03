#map = affine_map<(d0) -> (d0, 0)>
#map1 = affine_map<()[s0, s1, s2, s3] -> (s0 * s1 + s2 + s3)>
#map2 = affine_map<()[s0, s1] -> (s0 - s1)>
#map3 = affine_map<()[s0, s1] -> ((s0 - s1 + 15) floordiv 16)>
#map4 = affine_map<()[s0] -> (s0 floordiv 16)>
#map5 = affine_map<()[s0] -> (s0 mod 16)>
#map6 = affine_map<(d0) -> (d0 * 16)>
#map7 = affine_map<()[s0] -> (s0 * 64)>
#map8 = affine_map<()[s0] -> (s0 * 4)>
#map9 = affine_map<()[s0] -> (s0 * 64 + 64)>
#map10 = affine_map<()[s0, s1] -> (s0 + s1 * 2816)>
#map11 = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2)>
#map12 = affine_map<()[s0] -> (s0 + 128)>
#map13 = affine_map<()[s0, s1, s2] -> (-s0 + s1 - s2)>
#map14 = affine_map<()[s0, s1] -> (s0 - s1 * 64)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  func.func @_swa_fwd_kernel_mix_aiv_fused_4_outlined_merged_vf_0(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>, %arg3: memref<64xf32, #hivm.address_space<ub>>, %arg4: memref<64x128xf32, #hivm.address_space<ub>>, %arg5: memref<64x128xbf16, #hivm.address_space<ub>>, %arg6: memref<64x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
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
    scf.for %arg7 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg3[%arg7] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %4 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      scf.for %arg8 = %c0 to %c128 step %c64 {
        %subview_0 = memref.subview %arg4[%arg7, %arg8] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg6[%arg7, %arg8] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %5 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %6 = arith.divf %5, %4 : vector<1x64xf32>
        vector.transfer_write %6, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg5[%arg7, %arg8] [1, 64] [1, 1] : memref<64x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %7 = arith.truncf %6 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
        vector.transfer_write %7, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xbf16>, memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @_swa_fwd_kernel_mix_aiv_fused_2_outlined_merged_vf_0(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>, %arg3: memref<64xf32, #hivm.address_space<ub>>, %arg4: memref<64xf32, #hivm.address_space<ub>>, %arg5: memref<64x128xf32, #hivm.address_space<ub>>, %arg6: memref<64x128xf32, #hivm.address_space<ub>>, %arg7: memref<64x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
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
  func.func @_swa_fwd_kernel_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg3: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg5: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xi32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xi32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: f32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: memref<?xi8, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg23: i32, %arg24: i32, %arg25: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false]> : vector<26xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c0_i64 = arith.constant 0 : i64
    %c4_i32 = arith.constant 4 : i32
    %c1023_i32 = arith.constant 1023 : i32
    %c255_i32 = arith.constant 255 : i32
    %c127_i32 = arith.constant 127 : i32
    %c256_i32 = arith.constant 256 : i32
    %cst = arith.constant 0.000000e+00 : bf16
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c12_i32 = arith.constant 12 : i32
    %c128_i32 = arith.constant 128 : i32
    %c256 = arith.constant 256 : index
    %c3_i32 = arith.constant 3 : i32
    %c1024_i64 = arith.constant 1024 : i64
    %c4_i64 = arith.constant 4 : i64
    %c1028_i64 = arith.constant 1028 : i64
    %c8_i64 = arith.constant 8 : i64
    %c1032_i64 = arith.constant 1032 : i64
    %c12_i64 = arith.constant 12 : i64
    %c1036_i64 = arith.constant 1036 : i64
    %c2_i32 = arith.constant 2 : i32
    %true = arith.constant true
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg23, %arg24 : i32
    %1 = arith.muli %0, %arg25 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %reinterpret_cast = memref.reinterpret_cast %arg8 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %reinterpret_cast_0 = memref.reinterpret_cast %arg8 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %reinterpret_cast_1 = memref.reinterpret_cast %arg9 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %reinterpret_cast_2 = memref.reinterpret_cast %arg9 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %4 = arith.index_cast %arg16 : i32 to index
    scf.for %arg26 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %5 = arith.remsi %arg26, %arg23 : i32
      %6 = hivm.hir.pointer_cast(%c0_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %7 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %6[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %7[] : memref<i32, #hivm.address_space<ssbuf>>
      %8 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %9 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %8[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %9[] : memref<i32, #hivm.address_space<ssbuf>>
      %10 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %11 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %10[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %11[] : memref<i32, #hivm.address_space<ssbuf>>
      %12 = hivm.hir.pointer_cast(%c12_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %13 = hivm.hir.pointer_cast(%c1036_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %12[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %13[] : memref<i32, #hivm.address_space<ssbuf>>
      %14 = memref.load %reinterpret_cast[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %15 = memref.load %reinterpret_cast_0[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %16 = memref.load %reinterpret_cast_1[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %17 = memref.load %reinterpret_cast_2[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %18 = arith.subi %15, %14 : i32
      %19 = arith.subi %17, %16 : i32
      %20 = arith.subi %19, %18 : i32
      %21 = arith.addi %18, %c127_i32 : i32
      %22 = arith.divsi %21, %c128_i32 : i32
      %23 = arith.muli %22, %c12_i32 : i32
      %24 = arith.remsi %5, %arg23 : i32
      %25 = arith.muli %14, %arg16 : i32
      %26 = arith.index_cast %25 : i32 to index
      %27 = arith.muli %16, %arg18 : i32
      %28 = arith.index_cast %27 : i32 to index
      %29 = arith.muli %16, %arg20 : i32
      %30 = arith.index_cast %29 : i32 to index
      %31 = arith.index_cast %18 : i32 to index
      scf.for %arg27 = %24 to %23 step %arg23  : i32 {
        %32 = arith.divsi %arg27, %c12_i32 : i32
        %33 = arith.muli %32, %c128_i32 : i32
        %34 = arith.addi %33, %c128_i32 : i32
        %35 = arith.minsi %34, %18 : i32
        %36 = arith.subi %35, %33 : i32
        %37 = arith.addi %33, %20 : i32
        %38 = arith.addi %37, %36 : i32
        %39 = arith.addi %38, %c255_i32 : i32
        %40 = arith.divsi %39, %c256_i32 : i32
        %41 = arith.minsi %40, %c1_i32 : i32
        %42 = arith.subi %37, %c1023_i32 : i32
        %43 = arith.maxsi %42, %c0_i32 : i32
        %44 = arith.divsi %43, %c256_i32 : i32
        %45 = arith.maxsi %41, %44 : i32
        %46 = arith.subi %40, %45 : i32
        %47 = arith.addi %41, %46 : i32
        %48 = arith.remsi %arg27, %c12_i32 : i32
        %49 = arith.divsi %48, %c3_i32 : i32
        %50 = arith.muli %48, %arg17 : i32
        %51 = arith.index_cast %50 : i32 to index
        %52 = arith.maxsi %33, %c0_i32 : i32
        %53 = arith.index_cast %52 : i32 to index
        %54 = affine.apply #map1()[%53, %4, %26, %51]
        %reinterpret_cast_3 = memref.reinterpret_cast %arg5 to offset: [%54], sizes: [128, 128], strides: [%4, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
        %cast = memref.cast %alloc : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
        %55 = affine.apply #map2()[%31, %53]
        %56 = arith.maxsi %55, %c0 : index
        %57 = arith.minsi %56, %c128 : index
        %58 = arith.subi %c0_i32, %33 : i32
        %59 = arith.maxsi %58, %c0_i32 : i32
        %60 = arith.index_cast %59 : i32 to index
        %61 = arith.minsi %60, %57 : index
        %62 = affine.apply #map2()[%57, %61]
        %63 = arith.cmpi slt, %62, %c128 : index
        %subview = memref.subview %reinterpret_cast_3[0, 0] [%62, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %64 = affine.apply #map3()[%57, %61]
        %65 = affine.apply #map4()[%61]
        %66 = affine.apply #map5()[%61]
        %subview_4 = memref.subview %alloc[0, %65, %66, 0] [8, %64, 16, 16] [1, 1, 1, 1] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %cast_5 = memref.cast %subview_4 : memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
        scf.if %63 {
          %collapse_shape = memref.collapse_shape %alloc [[0, 1, 2, 3]] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> into memref<16384xbf16, #hivm.address_space<cbuf>>
          hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<16384xbf16, #hivm.address_space<cbuf>>)
        } {hivm.unlikely_condition}
        hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_5 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
        %67 = arith.subi %45, %41 : i32
        %68 = arith.muli %49, %arg19 : i32
        %69 = arith.index_cast %68 : i32 to index
        %70 = arith.muli %49, %arg21 : i32
        %71 = arith.index_cast %70 : i32 to index
        %alloc_6 = memref.alloc() : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %alloc_7 = memref.alloc() : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_7 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = -1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_6 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = -1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
        %alloc_8 = memref.alloc() : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>
        %alloc_9 = memref.alloc() : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>
        %alloc_10 = memref.alloc() : memref<64x256xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_10 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index} : memref<64x256xf32, #hivm.address_space<ub>>
        %alloc_11 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_12 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_12 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_11 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %72 = arith.addi %47, %c4_i32 : i32
        %73:3 = scf.for %arg28 = %c0_i32 to %72 step %c1_i32 iter_args(%arg29 = %c0_i32, %arg30 = %c0_i32, %arg31 = %c0_i32) -> (i32, i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          %74 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %74 {memref_ext.volatile} : i32
          %75 = arith.cmpi slt, %74, %c2_i32 : i32
          %76 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %76 {memref_ext.volatile} : i32
          %77 = arith.cmpi slt, %76, %c2_i32 : i32
          %78 = arith.andi %75, %77 : i1
          %79 = arith.cmpi slt, %arg29, %47 : i32
          %80 = arith.andi %78, %79 : i1
          %81 = scf.if %80 -> (i32) {
            %112 = arith.remsi %arg29, %c2_i32 : i32
            %113 = arith.cmpi eq, %112, %c0_i32 : i32
            %114 = arith.cmpi sge, %arg29, %41 : i32
            %115 = arith.extui %114 : i1 to i32
            %116 = arith.muli %115, %67 : i32
            %117 = arith.addi %arg29, %116 : i32
            %118 = arith.muli %117, %c256_i32 : i32
            %119 = arith.maxsi %118, %c0_i32 : i32
            %120 = arith.index_cast %119 : i32 to index
            %121 = arith.index_cast %arg18 : i32 to index
            %122 = affine.apply #map1()[%120, %121, %28, %69]
            %123 = arith.index_cast %19 : i32 to index
            %reinterpret_cast_13 = memref.reinterpret_cast %arg6 to offset: [%122], sizes: [256, 128], strides: [%121, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_14 = memref.alloc() : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>>
            %cast_15 = memref.cast %alloc_14 : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
            %124 = affine.apply #map2()[%123, %120]
            %125 = arith.maxsi %124, %c0 : index
            %126 = arith.minsi %125, %c256 : index
            %127 = arith.subi %c0_i32, %118 : i32
            %128 = arith.maxsi %127, %c0_i32 : i32
            %129 = arith.index_cast %128 : i32 to index
            %130 = arith.minsi %129, %126 : index
            %131 = affine.apply #map2()[%126, %130]
            %132 = arith.cmpi slt, %131, %c256 : index
            %subview_16 = memref.subview %reinterpret_cast_13[0, 0] [%131, 128] [1, 1] : memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %133 = affine.apply #map3()[%126, %130]
            %134 = affine.apply #map4()[%130]
            %135 = affine.apply #map5()[%130]
            %subview_17 = memref.subview %alloc_14[0, %134, %135, 0] [8, %133, 16, 16] [1, 1, 1, 1] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
            %cast_18 = memref.cast %subview_17 : memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
            scf.if %132 {
              %collapse_shape = memref.collapse_shape %alloc_14 [[0, 1, 2, 3]] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> into memref<32768xbf16, #hivm.address_space<cbuf>>
              hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<32768xbf16, #hivm.address_space<cbuf>>)
            } {hivm.unlikely_condition}
            hivm.hir.nd2nz {dst_continuous} ins(%subview_16 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_18 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
            %alloc_19 = memref.alloc() {alignment = 64 : i64} : memref<16x8x16x16xf32, #hivm.address_space<cc>>
            %cast_20 = memref.cast %alloc_19 : memref<16x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, normalized_in_L0C} ins(%cast, %cast_15, %true, %c128, %c128, %c256 : memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_20 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %113 {
              hivm.hir.fixpipe ins(%alloc_19 : memref<16x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_8 : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>)
            } else {
              hivm.hir.fixpipe ins(%alloc_19 : memref<16x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_9 : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>)
            }
            %136 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %136 {memref_ext.volatile} : i32
            %137 = arith.addi %136, %c1_i32 : i32
            memref.store %137, %6[] : memref<i32, #hivm.address_space<ssbuf>>
            %138 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %138 {memref_ext.volatile} : i32
            %139 = arith.addi %138, %c1_i32 : i32
            memref.store %139, %7[] : memref<i32, #hivm.address_space<ssbuf>>
            %140 = arith.addi %arg29, %c1_i32 : i32
            scf.yield %140 : i32
          } else {
            scf.yield %arg29 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 4 : i32}
          %82 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %82 {memref_ext.volatile} : i32
          %83 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %83 {memref_ext.volatile} : i32
          %84 = memref.load %12[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %84 {memref_ext.volatile} : i32
          %85 = memref.load %13[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %85 {memref_ext.volatile} : i32
          %86 = arith.cmpi sgt, %82, %c0_i32 : i32
          %87 = arith.cmpi sgt, %83, %c0_i32 : i32
          %88 = arith.cmpi slt, %84, %c1_i32 : i32
          %89 = arith.cmpi slt, %85, %c1_i32 : i32
          %90 = arith.andi %86, %87 : i1
          %91 = arith.andi %88, %89 : i1
          %92 = arith.andi %90, %91 : i1
          %93 = scf.if %92 -> (i32) {
            %112 = arith.remsi %arg31, %c2_i32 : i32
            %113 = arith.cmpi eq, %112, %c0_i32 : i32
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_MTE1>] flag = 2
            scf.if %113 {
              %subview_13 = memref.subview %alloc_8[0, 0, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] : memref<16x8x16x16xf32, #hivm.address_space<cbuf>> to memref<16x4x16x16xf32, strided<[2048, 256, 16, 1]>, #hivm.address_space<cbuf>>
              %subview_14 = memref.subview %alloc_8[0, 4, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] : memref<16x8x16x16xf32, #hivm.address_space<cbuf>> to memref<16x4x16x16xf32, strided<[2048, 256, 16, 1], offset: 1024>, #hivm.address_space<cbuf>>
              hivm.hir.l12ub ins(%subview_13 : memref<16x4x16x16xf32, strided<[2048, 256, 16, 1]>, #hivm.address_space<cbuf>>) outs(%alloc_10 : memref<64x256xf32, #hivm.address_space<ub>>)
              hivm.hir.l12ub {sub_block_idx = 1 : i32} ins(%subview_14 : memref<16x4x16x16xf32, strided<[2048, 256, 16, 1], offset: 1024>, #hivm.address_space<cbuf>>) outs(%alloc_10 : memref<64x256xf32, #hivm.address_space<ub>>)
            } else {
              %subview_13 = memref.subview %alloc_9[0, 0, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] : memref<16x8x16x16xf32, #hivm.address_space<cbuf>> to memref<16x4x16x16xf32, strided<[2048, 256, 16, 1]>, #hivm.address_space<cbuf>>
              %subview_14 = memref.subview %alloc_9[0, 4, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] : memref<16x8x16x16xf32, #hivm.address_space<cbuf>> to memref<16x4x16x16xf32, strided<[2048, 256, 16, 1], offset: 1024>, #hivm.address_space<cbuf>>
              hivm.hir.l12ub ins(%subview_13 : memref<16x4x16x16xf32, strided<[2048, 256, 16, 1]>, #hivm.address_space<cbuf>>) outs(%alloc_10 : memref<64x256xf32, #hivm.address_space<ub>>)
              hivm.hir.l12ub {sub_block_idx = 1 : i32} ins(%subview_14 : memref<16x4x16x16xf32, strided<[2048, 256, 16, 1], offset: 1024>, #hivm.address_space<cbuf>>) outs(%alloc_10 : memref<64x256xf32, #hivm.address_space<ub>>)
            }
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_V>] flag = 2
            %114 = arith.subi %82, %c1_i32 : i32
            %115 = arith.subi %83, %c1_i32 : i32
            %116 = arith.addi %84, %c1_i32 : i32
            %117 = arith.addi %85, %c1_i32 : i32
            memref.store %114, %6[] : memref<i32, #hivm.address_space<ssbuf>>
            memref.store %115, %7[] : memref<i32, #hivm.address_space<ssbuf>>
            memref.store %116, %12[] : memref<i32, #hivm.address_space<ssbuf>>
            memref.store %117, %13[] : memref<i32, #hivm.address_space<ssbuf>>
            %118 = arith.addi %arg31, %c1_i32 : i32
            scf.yield %118 : i32
          } else {
            scf.yield %arg31 : i32
          } {ssbuffer.if = 20 : i32}
          %94 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %94 {memref_ext.volatile} : i32
          %95 = arith.cmpi sgt, %94, %c0_i32 : i32
          %96 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %96 {memref_ext.volatile} : i32
          %97 = arith.cmpi sgt, %96, %c0_i32 : i32
          %98 = arith.andi %95, %97 : i1
          %99 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %99 {memref_ext.volatile} : i32
          %100 = arith.cmpi slt, %99, %c2_i32 : i32
          %101 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %101 {memref_ext.volatile} : i32
          %102 = arith.cmpi slt, %101, %c2_i32 : i32
          %103 = arith.andi %100, %102 : i1
          %104 = arith.andi %98, %103 : i1
          %105 = arith.cmpi sge, %arg29, %47 : i32
          %106 = arith.cmpi sge, %arg29, %c2_i32 : i32
          %107 = arith.ori %105, %106 : i1
          %108 = arith.cmpi slt, %arg30, %47 : i32
          %109 = arith.andi %104, %107 : i1
          %110 = arith.andi %109, %108 : i1
          %111 = scf.if %110 -> (i32) {
            %112 = arith.remsi %arg30, %c2_i32 : i32
            %113 = arith.cmpi eq, %112, %c0_i32 : i32
            %114 = arith.cmpi sge, %arg30, %41 : i32
            %115 = arith.extui %114 : i1 to i32
            %116 = arith.muli %115, %67 : i32
            %117 = arith.addi %arg30, %116 : i32
            %118 = arith.muli %117, %c256_i32 : i32
            %119 = arith.maxsi %118, %c0_i32 : i32
            %120 = arith.index_cast %119 : i32 to index
            %121 = arith.index_cast %19 : i32 to index
            %122 = arith.subi %c0_i32, %118 : i32
            %123 = arith.maxsi %122, %c0_i32 : i32
            %124 = arith.index_cast %123 : i32 to index
            %125 = arith.index_cast %arg20 : i32 to index
            %126 = affine.apply #map1()[%120, %125, %30, %71]
            %reinterpret_cast_13 = memref.reinterpret_cast %arg7 to offset: [%126], sizes: [256, 128], strides: [%125, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_14 = memref.alloc() : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>>
            %cast_15 = memref.cast %alloc_14 : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
            %127 = affine.apply #map2()[%121, %120]
            %128 = arith.maxsi %127, %c0 : index
            %129 = arith.minsi %128, %c256 : index
            %130 = arith.minsi %124, %129 : index
            %131 = affine.apply #map2()[%129, %130]
            %132 = arith.cmpi slt, %131, %c256 : index
            %subview_16 = memref.subview %reinterpret_cast_13[0, 0] [%131, 128] [1, 1] : memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %133 = affine.apply #map3()[%129, %130]
            %134 = affine.apply #map4()[%130]
            %135 = affine.apply #map5()[%130]
            %subview_17 = memref.subview %alloc_14[0, %134, %135, 0] [8, %133, 16, 16] [1, 1, 1, 1] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
            %cast_18 = memref.cast %subview_17 : memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
            scf.if %132 {
              %collapse_shape = memref.collapse_shape %alloc_14 [[0, 1, 2, 3]] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> into memref<32768xbf16, #hivm.address_space<cbuf>>
              hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<32768xbf16, #hivm.address_space<cbuf>>)
            } {hivm.unlikely_condition}
            hivm.hir.nd2nz {dst_continuous} ins(%subview_16 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_18 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
            %136 = arith.select %113, %alloc_6, %alloc_7 : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
            scf.if %113 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
            }
            %alloc_19 = memref.alloc() {alignment = 64 : i64} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            %cast_20 = memref.cast %alloc_19 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, normalized_in_L0C} ins(%136, %cast_15, %true, %c128, %c256, %c128 : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_20 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %113 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_19 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_11 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 3
              hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_19 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_12 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 6
              hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
            }
            %137 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %137 {memref_ext.volatile} : i32
            %138 = arith.subi %137, %c1_i32 : i32
            memref.store %138, %10[] : memref<i32, #hivm.address_space<ssbuf>>
            %139 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %139 {memref_ext.volatile} : i32
            %140 = arith.subi %139, %c1_i32 : i32
            memref.store %140, %11[] : memref<i32, #hivm.address_space<ssbuf>>
            %141 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %141 {memref_ext.volatile} : i32
            %142 = arith.addi %141, %c1_i32 : i32
            memref.store %142, %8[] : memref<i32, #hivm.address_space<ssbuf>>
            %143 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %143 {memref_ext.volatile} : i32
            %144 = arith.addi %143, %c1_i32 : i32
            memref.store %144, %9[] : memref<i32, #hivm.address_space<ssbuf>>
            %145 = arith.addi %arg30, %c1_i32 : i32
            scf.yield %145 : i32
          } else {
            scf.yield %arg30 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 6 : i32}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %81, %111, %93 : i32, i32, i32
        } {fixpipe_for_mmad_result_already_inserted = true}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_MTE1>] flag = 2
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
  func.func @_swa_fwd_kernel_mix_aiv_outlined_vf_0(%arg0: memref<64x256xi8, #hivm.address_space<ub>>, %arg1: memref<64x256xf32, #hivm.address_space<ub>>, %arg2: f32, %arg3: memref<64xf32, #hivm.address_space<ub>>, %arg4: memref<64x256xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<-1.000000e+06> : vector<1x64xf32>
    %cst_0 = arith.constant dense<0> : vector<1x64xi8>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %c0_i8 = arith.constant 0 : i8
    %cst_2 = arith.constant dense<0xFF800000> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %arg2 : f32 to vector<1x64xf32>
    scf.for %arg5 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg3[%arg5] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %1 = scf.for %arg6 = %c0 to %c256 step %c64 iter_args(%arg7 = %cst_2) -> (vector<1x64xf32>) {
        %subview_3 = memref.subview %arg0[%arg5, %arg6] [1, 64] [1, 1] : memref<64x256xi8, #hivm.address_space<ub>> to memref<1x64xi8, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_4 = memref.subview %arg1[%arg5, %arg6] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_5 = memref.subview %arg4[%arg5, %arg6] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_3[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<1x64xi8, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi8>
        %5 = vector.transfer_read %subview_4[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %6 = arith.mulf %5, %0 : vector<1x64xf32>
        %7 = arith.cmpi ne, %4, %cst_0 : vector<1x64xi8>
        %8 = arith.select %7, %6, %cst : vector<1x64xi1>, vector<1x64xf32>
        vector.transfer_write %8, %subview_5[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %9 = arith.maximumf %8, %arg7 {reductionOp} : vector<1x64xf32>
        scf.yield %9 : vector<1x64xf32>
      } {reductionLoop}
      %2 = vector.transfer_read %subview[%c0], %cst_1 {in_bounds = [true]} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1xf32>
      %3 = vector.multi_reduction <maximumf>, %1, %2 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
      vector.transfer_write %3, %subview[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @_swa_fwd_kernel_mix_aiv_outlined_vf_1(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>, %arg3: memref<64xf32, #hivm.address_space<ub>>, %arg4: memref<64x256xf32, #hivm.address_space<ub>>, %arg5: memref<64xf32, #hivm.address_space<ub>>, %arg6: memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %cst_0 {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %1 = vector.transfer_read %arg1[%c0], %cst_0 {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = arith.maximumf %0, %1 : vector<64xf32>
    vector.transfer_write %2, %arg3[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    %3 = arith.subf %0, %2 : vector<64xf32>
    %4 = math.exp %3 : vector<64xf32>
    vector.transfer_write %4, %arg2[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    scf.for %arg7 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg5[%arg7] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg3[%arg7] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %5 = vector.transfer_read %subview_1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %6 = scf.for %arg8 = %c0 to %c16 step %c4 iter_args(%arg9 = %cst) -> (vector<1x64xf32>) {
        %9 = affine.apply #map6(%arg8)
        %subview_2 = memref.subview %arg4[%arg7, %9] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = vector.transfer_read %subview_2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = arith.subf %10, %5 : vector<1x64xf32>
        %12 = math.exp %11 : vector<1x64xf32>
        %13 = arith.addf %12, %arg9 {reductionOp} : vector<1x64xf32>
        %14 = arith.truncf %12 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
        %subview_3 = memref.subview %arg6[%arg8, %arg7, 0] [4, 1, 16] [1, 1, 1] : memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<4x1x16xbf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
        %15 = vector.shape_cast %14 : vector<1x64xbf16> to vector<4x1x16xbf16>
        vector.transfer_write %15, %subview_3[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<4x1x16xbf16>, memref<4x1x16xbf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
        scf.yield %13 : vector<1x64xf32>
      } {reductionLoop, unroll_for_vsstb}
      %7 = vector.transfer_read %subview[%c0], %cst_0 {in_bounds = [true]} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1xf32>
      %8 = vector.multi_reduction <add>, %6, %7 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
      vector.transfer_write %8, %subview[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @_swa_fwd_kernel_mix_aiv_outlined_vf_3(%arg0: memref<64x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @_swa_fwd_kernel_mix_aiv_outlined_vf_5(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0xFF800000> : vector<64xf32>
    %cst_0 = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c0 = arith.constant 0 : index
    vector.transfer_write %cst_0, %arg0[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    vector.transfer_write %cst, %arg1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @_swa_fwd_kernel_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg3: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg5: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xi32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xi32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: f32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: memref<?xi8, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg23: i32, %arg24: i32, %arg25: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false]> : vector<26xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c64 = arith.constant 64 : index
    %c28_i32 = arith.constant 28 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c1036_i64 = arith.constant 1036 : i64
    %c12_i64 = arith.constant 12 : i64
    %c1032_i64 = arith.constant 1032 : i64
    %c8_i64 = arith.constant 8 : i64
    %c1028_i64 = arith.constant 1028 : i64
    %c4_i64 = arith.constant 4 : i64
    %c1024_i64 = arith.constant 1024 : i64
    %c3_i32 = arith.constant 3 : i32
    %c128_i32 = arith.constant 128 : i32
    %c12_i32 = arith.constant 12 : i32
    %c0_i32 = arith.constant 0 : i32
    %c128 = arith.constant 128 : index
    %c256_i32 = arith.constant 256 : i32
    %c127_i32 = arith.constant 127 : i32
    %c255_i32 = arith.constant 255 : i32
    %c1023_i32 = arith.constant 1023 : i32
    %c2176_i32 = arith.constant 2176 : i32
    %c5_i32 = arith.constant 5 : i32
    %c4_i32 = arith.constant 4 : i32
    %c2304_i32 = arith.constant 2304 : i32
    %c0_i64 = arith.constant 0 : i64
    %c0 = arith.constant 0 : index
    %0 = arith.muli %arg23, %arg24 : i32
    %1 = arith.muli %0, %arg25 : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %4 = hivm.hir.get_sub_block_idx -> i64
    %5 = arith.muli %4, %c1024_i64 : i64
    %6 = arith.addi %5, %c4_i64 : i64
    %7 = arith.addi %5, %c12_i64 : i64
    %8 = arith.addi %5, %c8_i64 : i64
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
    call @_swa_fwd_kernel_mix_aiv_outlined_vf_5(%alloc, %alloc_0) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
    %reinterpret_cast = memref.reinterpret_cast %arg8 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %reinterpret_cast_1 = memref.reinterpret_cast %arg8 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %reinterpret_cast_2 = memref.reinterpret_cast %arg9 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %reinterpret_cast_3 = memref.reinterpret_cast %arg9 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %9 = arith.index_cast %arg11 : i32 to index
    %10 = arith.index_cast %arg13 : i32 to index
    %11 = arith.index_cast %4 : i64 to index
    %12 = affine.apply #map7()[%11]
    %13 = affine.apply #map8()[%11]
    annotation.mark %1 {logical_block_num} : i32
    %14 = affine.apply #map9()[%11]
    scf.for %arg26 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %15 = arith.remsi %arg26, %arg23 : i32
      %16 = hivm.hir.pointer_cast(%c0_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %17 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %16[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %17[] : memref<i32, #hivm.address_space<ssbuf>>
      %18 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %19 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %18[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %19[] : memref<i32, #hivm.address_space<ssbuf>>
      %20 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %21 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %20[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %21[] : memref<i32, #hivm.address_space<ssbuf>>
      %22 = hivm.hir.pointer_cast(%c12_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %23 = hivm.hir.pointer_cast(%c1036_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %22[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %23[] : memref<i32, #hivm.address_space<ssbuf>>
      %24 = hivm.hir.pointer_cast(%6) : memref<i32, #hivm.address_space<ssbuf>>
      %25 = hivm.hir.pointer_cast(%7) : memref<i32, #hivm.address_space<ssbuf>>
      %26 = hivm.hir.pointer_cast(%8) : memref<i32, #hivm.address_space<ssbuf>>
      %27 = memref.load %reinterpret_cast[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %28 = memref.load %reinterpret_cast_1[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %29 = memref.load %reinterpret_cast_2[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %30 = memref.load %reinterpret_cast_3[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %31 = arith.subi %28, %27 : i32
      %32 = arith.subi %30, %29 : i32
      %33 = arith.subi %32, %31 : i32
      %34 = arith.addi %31, %c127_i32 : i32
      %35 = arith.divsi %34, %c128_i32 : i32
      %36 = arith.muli %35, %c12_i32 : i32
      %37 = arith.remsi %15, %arg23 : i32
      %38 = arith.muli %27, %arg11 : i32
      %39 = arith.index_cast %38 : i32 to index
      %40 = arith.muli %27, %arg13 : i32
      %41 = arith.index_cast %40 : i32 to index
      %42 = arith.index_cast %27 : i32 to index
      %43 = arith.index_cast %31 : i32 to index
      scf.for %arg27 = %37 to %36 step %arg23  : i32 {
        %44 = arith.divsi %arg27, %c12_i32 : i32
        %45 = arith.muli %44, %c128_i32 : i32
        %46 = arith.addi %45, %c128_i32 : i32
        %47 = arith.minsi %46, %31 : i32
        %48 = arith.subi %47, %45 : i32
        %49 = arith.addi %45, %33 : i32
        %50 = arith.addi %49, %48 : i32
        %51 = arith.addi %50, %c255_i32 : i32
        %52 = arith.divsi %51, %c256_i32 : i32
        %53 = arith.minsi %52, %c1_i32 : i32
        %54 = arith.subi %49, %c1023_i32 : i32
        %55 = arith.maxsi %54, %c0_i32 : i32
        %56 = arith.divsi %55, %c256_i32 : i32
        %57 = arith.maxsi %53, %56 : i32
        %58 = arith.subi %52, %57 : i32
        %59 = arith.addi %53, %58 : i32
        %60 = arith.subi %57, %53 : i32
        %61 = arith.cmpi sge, %49, %32 : i32
        %62 = arith.extui %61 : i1 to i32
        %63 = arith.minsi %49, %c2176_i32 : i32
        %64 = arith.subi %c1_i32, %62 : i32
        %65 = arith.muli %64, %63 : i32
        %66 = arith.muli %62, %c2304_i32 : i32
        %67 = arith.addi %65, %66 : i32
        %68 = arith.subi %49, %67 : i32
        %69 = arith.cmpi ne, %68, %c0_i32 : i32
        %70 = arith.extui %69 : i1 to i32
        %71 = arith.index_cast %67 : i32 to index
        %alloc_4 = memref.alloc() : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %subview = memref.subview %alloc_4[0, %13, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %alloc_5 = memref.alloc() : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %subview_6 = memref.subview %alloc_5[0, %13, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_5 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_4 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %alloc_7 = memref.alloc() : memref<64x256xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_7 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, hivm.vf_inplace_source, tiledAlloc} : memref<64x256xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_MTE1>] flag = 2
        %alloc_8 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_8 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_9 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_9 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        %alloc_10 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_11 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_12 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_13 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_14 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_15 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        %72 = arith.addi %59, %c4_i32 : i32
        %alloc_16 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
        func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_3(%alloc_16) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>) -> ()
        %alloc_17 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%alloc_0 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_17 : memref<64xf32, #hivm.address_space<ub>>)
        %alloc_18 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%alloc : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_18 : memref<64xf32, #hivm.address_space<ub>>)
        %73:7 = scf.for %arg28 = %c0_i32 to %72 step %c1_i32 iter_args(%arg29 = %alloc_17, %arg30 = %alloc_18, %arg31 = %alloc_16, %arg32 = %c0_i32, %arg33 = %c0_i32, %arg34 = %c0_i32, %arg35 = %c0_i32) -> (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          %110 = memref.load %25[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %110 {memref_ext.volatile} : i32
          %111 = arith.cmpi sgt, %110, %c0_i32 : i32
          %112 = memref.load %26[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %112 {memref_ext.volatile} : i32
          %113 = arith.cmpi slt, %112, %c2_i32 : i32
          %114 = arith.andi %111, %113 : i1
          %115 = arith.cmpi slt, %arg34, %c3_i32 : i32
          %116 = arith.cmpi slt, %arg35, %c3_i32 : i32
          %117 = arith.andi %115, %116 : i1
          %118 = arith.cmpi slt, %arg32, %59 : i32
          %119 = arith.andi %114, %117 : i1
          %120 = arith.andi %119, %118 : i1
          %121:4 = scf.if %120 -> (memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %131 = arith.remsi %arg32, %c2_i32 : i32
            %132 = arith.cmpi eq, %131, %c0_i32 : i32
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_V>] flag = 2
            %133 = arith.cmpi sge, %arg32, %53 : i32
            %134 = arith.extui %133 : i1 to i32
            %135 = arith.muli %134, %60 : i32
            %136 = arith.addi %arg32, %135 : i32
            %137 = arith.muli %136, %c256_i32 : i32
            %138 = arith.cmpi slt, %137, %c4_i32 : i32
            %139 = arith.extui %138 : i1 to i32
            %140 = arith.subi %49, %137 : i32
            %141 = arith.cmpi sle, %140, %c1023_i32 : i32
            %142 = arith.extui %141 : i1 to i32
            %143 = arith.subi %c1_i32, %139 : i32
            %144 = arith.muli %139, %142 : i32
            %145 = arith.addi %143, %144 : i32
            %146 = arith.muli %70, %145 : i32
            %147 = arith.subi %c1_i32, %146 : i32
            %148 = arith.muli %147, %137 : i32
            %149 = arith.subi %137, %68 : i32
            %150 = arith.maxsi %149, %c5_i32 : i32
            %151 = arith.muli %146, %150 : i32
            %152 = arith.addi %148, %151 : i32
            %153 = arith.muli %152, %64 : i32
            %154 = arith.index_cast %153 : i32 to index
            %155 = affine.apply #map10()[%154, %71]
            %reinterpret_cast_31 = memref.reinterpret_cast %arg22 to offset: [%155], sizes: [128, 256], strides: [2816, 1] : memref<?xi8, #hivm.address_space<gm>> to memref<128x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>
            %subview_32 = memref.subview %reinterpret_cast_31[%12, 0] [64, 256] [1, 1] : memref<128x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_33 = memref.alloc() : memref<64x256xi8, #hivm.address_space<ub>>
            annotation.mark %alloc_33 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x256xi8, #hivm.address_space<ub>>
            hivm.hir.load ins(%subview_32 : memref<64x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_33 : memref<64x256xi8, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
            %alloc_34 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_0(%alloc_33, %alloc_7, %arg10, %alloc_34, %alloc_7) {hivm.vector_function, no_inline} : (memref<64x256xi8, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>, f32, memref<64xf32, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>) -> ()
            %alloc_35 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_36 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_37 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_38 = memref.alloc() : memref<16x65x16x1xbf16, #hivm.address_space<ub>>
            %subview_39 = memref.subview %alloc_38[0, 0, 0, 0] [16, 64, 16, 1] [1, 1, 1, 1] : memref<16x65x16x1xbf16, #hivm.address_space<ub>> to memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_1(%arg29, %alloc_34, %alloc_35, %alloc_36, %alloc_7, %alloc_37, %subview_39) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
            %expand_shape = memref.expand_shape %subview_39 [[0], [1, 2], [3]] output_shape [16, 4, 16, 16] : memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
            scf.if %132 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
              %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_40 = memref.collapse_shape %subview [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape : memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_40 : memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
              %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_40 = memref.collapse_shape %subview_6 [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape : memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_40 : memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
            }
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_MTE1>] flag = 2
            %156 = arith.remsi %arg32, %c3_i32 : i32
            %157 = arith.cmpi eq, %156, %c0_i32 : i32
            scf.if %157 {
              hivm.hir.copy ins(%alloc_35 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_10 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              hivm.hir.copy ins(%alloc_37 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_13 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
            } else {
              %165 = arith.cmpi eq, %156, %c1_i32 : i32
              scf.if %165 {
                hivm.hir.copy ins(%alloc_35 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_11 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%alloc_37 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_14 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              } else {
                hivm.hir.copy ins(%alloc_35 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_12 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%alloc_37 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_15 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              }
            }
            %158 = memref.load %25[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %158 {memref_ext.volatile} : i32
            %159 = arith.subi %158, %c1_i32 : i32
            memref.store %159, %25[] : memref<i32, #hivm.address_space<ssbuf>>
            %160 = memref.load %26[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %160 {memref_ext.volatile} : i32
            %161 = arith.addi %160, %c1_i32 : i32
            memref.store %161, %26[] : memref<i32, #hivm.address_space<ssbuf>>
            %162 = arith.addi %arg34, %c1_i32 : i32
            %163 = arith.addi %arg35, %c1_i32 : i32
            %164 = arith.addi %arg32, %c1_i32 : i32
            scf.yield %alloc_36, %162, %163, %164 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg29, %arg34, %arg35, %arg32 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          %122 = memref.load %24[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %122 {memref_ext.volatile} : i32
          %123 = arith.cmpi sgt, %122, %c0_i32 : i32
          %124 = arith.cmpi sgt, %121#1, %c0_i32 : i32
          %125 = arith.cmpi sgt, %121#2, %c0_i32 : i32
          %126 = arith.andi %124, %125 : i1
          %127 = arith.cmpi slt, %arg33, %59 : i32
          %128 = arith.andi %123, %126 : i1
          %129 = arith.andi %128, %127 : i1
          %130:5 = scf.if %129 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %131 = arith.remsi %arg33, %c2_i32 : i32
            %132 = arith.cmpi eq, %131, %c0_i32 : i32
            %133 = arith.remsi %arg33, %c3_i32 : i32
            %134 = arith.cmpi eq, %133, %c0_i32 : i32
            %135:2 = scf.if %134 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) {
              scf.yield %alloc_13, %alloc_10 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            } else {
              %142 = arith.cmpi eq, %133, %c1_i32 : i32
              %143 = arith.select %142, %alloc_14, %alloc_15 : memref<64xf32, #hivm.address_space<ub>>
              %144 = arith.select %142, %alloc_11, %alloc_12 : memref<64xf32, #hivm.address_space<ub>>
              scf.yield %143, %144 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            }
            %136 = arith.select %132, %alloc_8, %alloc_9 : memref<64x128xf32, #hivm.address_space<ub>>
            scf.if %132 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 3
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 6
            }
            %alloc_31 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_32 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_fused_2_outlined_merged_vf_0(%arg30, %135#1, %135#0, %alloc_31, %135#1, %136, %arg31, %alloc_32) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
            scf.if %132 {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
            } else {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
            } {ssbuffer.cross_buffer = 1 : i32}
            %137 = memref.load %24[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %137 {memref_ext.volatile} : i32
            %138 = arith.subi %137, %c1_i32 : i32
            memref.store %138, %24[] : memref<i32, #hivm.address_space<ssbuf>>
            %139 = arith.subi %121#1, %c1_i32 : i32
            %140 = arith.subi %121#2, %c1_i32 : i32
            %141 = arith.addi %arg33, %c1_i32 : i32
            scf.yield %alloc_31, %alloc_32, %139, %140, %141 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg30, %arg31, %121#1, %121#2, %arg33 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %121#0, %130#0, %130#1, %121#3, %130#4, %130#2, %130#3 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32
        }
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
        %74 = arith.remsi %arg27, %c12_i32 : i32
        %75 = arith.muli %74, %arg15 : i32
        %76 = arith.index_cast %75 : i32 to index
        %77 = arith.maxsi %45, %c0_i32 : i32
        %78 = arith.index_cast %77 : i32 to index
        %79 = affine.apply #map2()[%43, %78]
        %80 = arith.subi %c0_i32, %45 : i32
        %81 = arith.maxsi %80, %c0_i32 : i32
        %82 = arith.index_cast %81 : i32 to index
        %83 = arith.index_cast %45 : i32 to index
        %84 = affine.apply #map11()[%83, %76, %42]
        %85 = affine.apply #map12()[%83]
        %reinterpret_cast_19 = memref.reinterpret_cast %arg4 to offset: [%84], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %86 = arith.maxsi %83, %43 : index
        %87 = arith.minsi %85, %86 : index
        %88 = affine.apply #map2()[%87, %83]
        %89 = arith.minsi %12, %88 : index
        %90 = affine.apply #map13()[%89, %87, %83]
        %91 = arith.minsi %90, %c64 : index
        %subview_20 = memref.subview %reinterpret_cast_19[%12] [%91] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %92 = arith.muli %74, %arg12 : i32
        %93 = arith.index_cast %92 : i32 to index
        %94 = affine.apply #map1()[%78, %9, %39, %93]
        %reinterpret_cast_21 = memref.reinterpret_cast %arg2 to offset: [%94], sizes: [128, 128], strides: [%9, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %95 = arith.maxsi %79, %c0 : index
        %96 = arith.minsi %95, %c128 : index
        %97 = arith.minsi %82, %96 : index
        %98 = affine.apply #map2()[%96, %97]
        %99 = arith.minsi %12, %98 : index
        %100 = affine.apply #map13()[%99, %96, %97]
        %101 = arith.minsi %100, %c64 : index
        %subview_22 = memref.subview %reinterpret_cast_21[%12, 0] [%101, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %102 = arith.muli %74, %arg14 : i32
        %103 = arith.index_cast %102 : i32 to index
        %104 = affine.apply #map1()[%78, %10, %41, %103]
        %reinterpret_cast_23 = memref.reinterpret_cast %arg3 to offset: [%104], sizes: [128, 128], strides: [%10, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_24 = memref.subview %reinterpret_cast_23[%12, 0] [%101, 128] [1, 1] : memref<128x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_25 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
        %alloc_26 = memref.alloc() {alignment = 64 : i64} : memref<64x128xbf16, #hivm.address_space<ub>>
        %alloc_27 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
        func.call @_swa_fwd_kernel_mix_aiv_fused_4_outlined_merged_vf_0(%73#0, %73#1, %alloc_25, %73#1, %73#2, %alloc_26, %alloc_27) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xbf16, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
        %subview_28 = memref.subview %alloc_25[0] [%91] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        %105 = arith.maxsi %97, %12 : index
        %106 = arith.minsi %96, %14 : index
        %107 = arith.maxsi %105, %106 : index
        %108 = affine.apply #map2()[%107, %105]
        %109 = affine.apply #map14()[%105, %11]
        %subview_29 = memref.subview %alloc_26[%109, 0] [%108, 128] [1, 1] : memref<64x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_30 = memref.subview %alloc_27[%109, 0] [%108, 128] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.store ins(%subview_28 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%subview_20 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
        hivm.hir.store ins(%subview_29 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_22 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
        hivm.hir.store ins(%subview_30 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_24 : memref<?x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}
