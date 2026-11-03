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
    %c131072_i64 = arith.constant 131072 : i64
    %c425984_i64 = arith.constant 425984 : i64
    %c49664_i64 = arith.constant 49664 : i64
    %c165120_i64 = arith.constant 165120 : i64
    %c99584_i64 = arith.constant 99584 : i64
    %c294912_i64 = arith.constant 294912 : i64
    %c163840_i64 = arith.constant 163840 : i64
    %c32768_i64 = arith.constant 32768 : i64
    %c98304_i64 = arith.constant 98304 : i64
    %c0_i64 = arith.constant 0 : i64
    %c0_i64_0 = arith.constant 0 : i64
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
    %reinterpret_cast_1 = memref.reinterpret_cast %arg8 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %reinterpret_cast_2 = memref.reinterpret_cast %arg9 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %reinterpret_cast_3 = memref.reinterpret_cast %arg9 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %4 = arith.index_cast %arg16 : i32 to index
    scf.for %arg26 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %5 = arith.remsi %arg26, %arg23 : i32
      %6 = hivm.hir.pointer_cast(%c0_i64_0) : memref<i32, #hivm.address_space<ssbuf>>
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
      %15 = memref.load %reinterpret_cast_1[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %16 = memref.load %reinterpret_cast_2[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %17 = memref.load %reinterpret_cast_3[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
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
        %reinterpret_cast_4 = memref.reinterpret_cast %arg5 to offset: [%54], sizes: [128, 128], strides: [%4, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %55 = hivm.hir.pointer_cast(%c0_i64) : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
        %cast = memref.cast %55 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
        %56 = affine.apply #map2()[%31, %53]
        %57 = arith.maxsi %56, %c0 : index
        %58 = arith.minsi %57, %c128 : index
        %59 = arith.subi %c0_i32, %33 : i32
        %60 = arith.maxsi %59, %c0_i32 : i32
        %61 = arith.index_cast %60 : i32 to index
        %62 = arith.minsi %61, %58 : index
        %63 = affine.apply #map2()[%58, %62]
        %64 = arith.cmpi slt, %63, %c128 : index
        %subview = memref.subview %reinterpret_cast_4[0, 0] [%63, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %65 = affine.apply #map3()[%58, %62]
        %66 = affine.apply #map4()[%62]
        %67 = affine.apply #map5()[%62]
        %subview_5 = memref.subview %55[0, %66, %67, 0] [8, %65, 16, 16] [1, 1, 1, 1] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %cast_6 = memref.cast %subview_5 : memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
        scf.if %64 {
          %collapse_shape = memref.collapse_shape %55 [[0, 1, 2, 3]] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> into memref<16384xbf16, #hivm.address_space<cbuf>>
          hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<16384xbf16, #hivm.address_space<cbuf>>)
        } {hivm.unlikely_condition}
        hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_6 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
        %68 = arith.subi %45, %41 : i32
        %69 = arith.muli %49, %arg19 : i32
        %70 = arith.index_cast %69 : i32 to index
        %71 = arith.muli %49, %arg21 : i32
        %72 = arith.index_cast %71 : i32 to index
        %73 = hivm.hir.pointer_cast(%c98304_i64) : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %74 = hivm.hir.pointer_cast(%c32768_i64) : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %74 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = -1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %73 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = -1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
        %75 = hivm.hir.pointer_cast(%c163840_i64) : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>
        %76 = hivm.hir.pointer_cast(%c294912_i64) : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>
        %77 = hivm.hir.pointer_cast(%c99584_i64) : memref<64x256xf32, #hivm.address_space<ub>>
        annotation.mark %77 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index} : memref<64x256xf32, #hivm.address_space<ub>>
        %78 = hivm.hir.pointer_cast(%c165120_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        %79 = hivm.hir.pointer_cast(%c49664_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %79 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %78 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %80 = arith.addi %47, %c4_i32 : i32
        %81:3 = scf.for %arg28 = %c0_i32 to %80 step %c1_i32 iter_args(%arg29 = %c0_i32, %arg30 = %c0_i32, %arg31 = %c0_i32) -> (i32, i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          %82 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %82 {memref_ext.volatile} : i32
          %83 = arith.cmpi slt, %82, %c2_i32 : i32
          %84 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %84 {memref_ext.volatile} : i32
          %85 = arith.cmpi slt, %84, %c2_i32 : i32
          %86 = arith.andi %83, %85 : i1
          %87 = arith.cmpi slt, %arg29, %47 : i32
          %88 = arith.andi %86, %87 : i1
          %89 = scf.if %88 -> (i32) {
            %120 = arith.remsi %arg29, %c2_i32 : i32
            %121 = arith.cmpi eq, %120, %c0_i32 : i32
            %122 = arith.cmpi sge, %arg29, %41 : i32
            %123 = arith.extui %122 : i1 to i32
            %124 = arith.muli %123, %68 : i32
            %125 = arith.addi %arg29, %124 : i32
            %126 = arith.muli %125, %c256_i32 : i32
            %127 = arith.maxsi %126, %c0_i32 : i32
            %128 = arith.index_cast %127 : i32 to index
            %129 = arith.index_cast %arg18 : i32 to index
            %130 = affine.apply #map1()[%128, %129, %28, %70]
            %131 = arith.index_cast %19 : i32 to index
            %reinterpret_cast_7 = memref.reinterpret_cast %arg6 to offset: [%130], sizes: [256, 128], strides: [%129, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %132 = hivm.hir.pointer_cast(%c425984_i64) : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>>
            %cast_8 = memref.cast %132 : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
            %133 = affine.apply #map2()[%131, %128]
            %134 = arith.maxsi %133, %c0 : index
            %135 = arith.minsi %134, %c256 : index
            %136 = arith.subi %c0_i32, %126 : i32
            %137 = arith.maxsi %136, %c0_i32 : i32
            %138 = arith.index_cast %137 : i32 to index
            %139 = arith.minsi %138, %135 : index
            %140 = affine.apply #map2()[%135, %139]
            %141 = arith.cmpi slt, %140, %c256 : index
            %subview_9 = memref.subview %reinterpret_cast_7[0, 0] [%140, 128] [1, 1] : memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %142 = affine.apply #map3()[%135, %139]
            %143 = affine.apply #map4()[%139]
            %144 = affine.apply #map5()[%139]
            %subview_10 = memref.subview %132[0, %143, %144, 0] [8, %142, 16, 16] [1, 1, 1, 1] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
            %cast_11 = memref.cast %subview_10 : memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
            scf.if %141 {
              %collapse_shape = memref.collapse_shape %132 [[0, 1, 2, 3]] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> into memref<32768xbf16, #hivm.address_space<cbuf>>
              hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<32768xbf16, #hivm.address_space<cbuf>>)
            } {hivm.unlikely_condition}
            hivm.hir.nd2nz {dst_continuous} ins(%subview_9 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_11 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
            %145 = hivm.hir.pointer_cast(%c0_i64) : memref<16x8x16x16xf32, #hivm.address_space<cc>>
            %cast_12 = memref.cast %145 : memref<16x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, normalized_in_L0C} ins(%cast, %cast_8, %true, %c128, %c128, %c256 : memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_12 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %121 {
              hivm.hir.fixpipe ins(%145 : memref<16x8x16x16xf32, #hivm.address_space<cc>>) outs(%75 : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>)
            } else {
              hivm.hir.fixpipe ins(%145 : memref<16x8x16x16xf32, #hivm.address_space<cc>>) outs(%76 : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>)
            }
            %146 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %146 {memref_ext.volatile} : i32
            %147 = arith.addi %146, %c1_i32 : i32
            memref.store %147, %6[] : memref<i32, #hivm.address_space<ssbuf>>
            %148 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %148 {memref_ext.volatile} : i32
            %149 = arith.addi %148, %c1_i32 : i32
            memref.store %149, %7[] : memref<i32, #hivm.address_space<ssbuf>>
            %150 = arith.addi %arg29, %c1_i32 : i32
            scf.yield %150 : i32
          } else {
            scf.yield %arg29 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 4 : i32}
          %90 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %90 {memref_ext.volatile} : i32
          %91 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %91 {memref_ext.volatile} : i32
          %92 = memref.load %12[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %92 {memref_ext.volatile} : i32
          %93 = memref.load %13[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %93 {memref_ext.volatile} : i32
          %94 = arith.cmpi sgt, %90, %c0_i32 : i32
          %95 = arith.cmpi sgt, %91, %c0_i32 : i32
          %96 = arith.cmpi slt, %92, %c1_i32 : i32
          %97 = arith.cmpi slt, %93, %c1_i32 : i32
          %98 = arith.andi %94, %95 : i1
          %99 = arith.andi %96, %97 : i1
          %100 = arith.andi %98, %99 : i1
          %101 = scf.if %100 -> (i32) {
            %120 = arith.remsi %arg31, %c2_i32 : i32
            %121 = arith.cmpi eq, %120, %c0_i32 : i32
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_MTE1>] flag = 2
            scf.if %121 {
              %subview_7 = memref.subview %75[0, 0, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] : memref<16x8x16x16xf32, #hivm.address_space<cbuf>> to memref<16x4x16x16xf32, strided<[2048, 256, 16, 1]>, #hivm.address_space<cbuf>>
              %subview_8 = memref.subview %75[0, 4, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] : memref<16x8x16x16xf32, #hivm.address_space<cbuf>> to memref<16x4x16x16xf32, strided<[2048, 256, 16, 1], offset: 1024>, #hivm.address_space<cbuf>>
              hivm.hir.l12ub ins(%subview_7 : memref<16x4x16x16xf32, strided<[2048, 256, 16, 1]>, #hivm.address_space<cbuf>>) outs(%77 : memref<64x256xf32, #hivm.address_space<ub>>)
              hivm.hir.l12ub {sub_block_idx = 1 : i32} ins(%subview_8 : memref<16x4x16x16xf32, strided<[2048, 256, 16, 1], offset: 1024>, #hivm.address_space<cbuf>>) outs(%77 : memref<64x256xf32, #hivm.address_space<ub>>)
            } else {
              %subview_7 = memref.subview %76[0, 0, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] : memref<16x8x16x16xf32, #hivm.address_space<cbuf>> to memref<16x4x16x16xf32, strided<[2048, 256, 16, 1]>, #hivm.address_space<cbuf>>
              %subview_8 = memref.subview %76[0, 4, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] : memref<16x8x16x16xf32, #hivm.address_space<cbuf>> to memref<16x4x16x16xf32, strided<[2048, 256, 16, 1], offset: 1024>, #hivm.address_space<cbuf>>
              hivm.hir.l12ub ins(%subview_7 : memref<16x4x16x16xf32, strided<[2048, 256, 16, 1]>, #hivm.address_space<cbuf>>) outs(%77 : memref<64x256xf32, #hivm.address_space<ub>>)
              hivm.hir.l12ub {sub_block_idx = 1 : i32} ins(%subview_8 : memref<16x4x16x16xf32, strided<[2048, 256, 16, 1], offset: 1024>, #hivm.address_space<cbuf>>) outs(%77 : memref<64x256xf32, #hivm.address_space<ub>>)
            }
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_V>] flag = 2
            %122 = arith.subi %90, %c1_i32 : i32
            %123 = arith.subi %91, %c1_i32 : i32
            %124 = arith.addi %92, %c1_i32 : i32
            %125 = arith.addi %93, %c1_i32 : i32
            memref.store %122, %6[] : memref<i32, #hivm.address_space<ssbuf>>
            memref.store %123, %7[] : memref<i32, #hivm.address_space<ssbuf>>
            memref.store %124, %12[] : memref<i32, #hivm.address_space<ssbuf>>
            memref.store %125, %13[] : memref<i32, #hivm.address_space<ssbuf>>
            %126 = arith.addi %arg31, %c1_i32 : i32
            scf.yield %126 : i32
          } else {
            scf.yield %arg31 : i32
          } {ssbuffer.if = 20 : i32}
          %102 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %102 {memref_ext.volatile} : i32
          %103 = arith.cmpi sgt, %102, %c0_i32 : i32
          %104 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %104 {memref_ext.volatile} : i32
          %105 = arith.cmpi sgt, %104, %c0_i32 : i32
          %106 = arith.andi %103, %105 : i1
          %107 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %107 {memref_ext.volatile} : i32
          %108 = arith.cmpi slt, %107, %c2_i32 : i32
          %109 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %109 {memref_ext.volatile} : i32
          %110 = arith.cmpi slt, %109, %c2_i32 : i32
          %111 = arith.andi %108, %110 : i1
          %112 = arith.andi %106, %111 : i1
          %113 = arith.cmpi sge, %arg29, %47 : i32
          %114 = arith.cmpi sge, %arg29, %c2_i32 : i32
          %115 = arith.ori %113, %114 : i1
          %116 = arith.cmpi slt, %arg30, %47 : i32
          %117 = arith.andi %112, %115 : i1
          %118 = arith.andi %117, %116 : i1
          %119 = scf.if %118 -> (i32) {
            %120 = arith.remsi %arg30, %c2_i32 : i32
            %121 = arith.cmpi eq, %120, %c0_i32 : i32
            %122 = arith.cmpi sge, %arg30, %41 : i32
            %123 = arith.extui %122 : i1 to i32
            %124 = arith.muli %123, %68 : i32
            %125 = arith.addi %arg30, %124 : i32
            %126 = arith.muli %125, %c256_i32 : i32
            %127 = arith.maxsi %126, %c0_i32 : i32
            %128 = arith.index_cast %127 : i32 to index
            %129 = arith.index_cast %19 : i32 to index
            %130 = arith.subi %c0_i32, %126 : i32
            %131 = arith.maxsi %130, %c0_i32 : i32
            %132 = arith.index_cast %131 : i32 to index
            %133 = arith.index_cast %arg20 : i32 to index
            %134 = affine.apply #map1()[%128, %133, %30, %72]
            %reinterpret_cast_7 = memref.reinterpret_cast %arg7 to offset: [%134], sizes: [256, 128], strides: [%133, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %135 = hivm.hir.pointer_cast(%c425984_i64) : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>>
            %cast_8 = memref.cast %135 : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
            %136 = affine.apply #map2()[%129, %128]
            %137 = arith.maxsi %136, %c0 : index
            %138 = arith.minsi %137, %c256 : index
            %139 = arith.minsi %132, %138 : index
            %140 = affine.apply #map2()[%138, %139]
            %141 = arith.cmpi slt, %140, %c256 : index
            %subview_9 = memref.subview %reinterpret_cast_7[0, 0] [%140, 128] [1, 1] : memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %142 = affine.apply #map3()[%138, %139]
            %143 = affine.apply #map4()[%139]
            %144 = affine.apply #map5()[%139]
            %subview_10 = memref.subview %135[0, %143, %144, 0] [8, %142, 16, 16] [1, 1, 1, 1] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
            %cast_11 = memref.cast %subview_10 : memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
            scf.if %141 {
              %collapse_shape = memref.collapse_shape %135 [[0, 1, 2, 3]] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> into memref<32768xbf16, #hivm.address_space<cbuf>>
              hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<32768xbf16, #hivm.address_space<cbuf>>)
            } {hivm.unlikely_condition}
            hivm.hir.nd2nz {dst_continuous} ins(%subview_9 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_11 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
            %145 = arith.select %121, %73, %74 : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
            scf.if %121 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
            }
            %146 = hivm.hir.pointer_cast(%c131072_i64) : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            %cast_12 = memref.cast %146 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, normalized_in_L0C} ins(%145, %cast_8, %true, %c128, %c256, %c128 : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_12 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %121 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%146 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%78 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 3
              hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%146 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%79 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 6
              hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
            }
            %147 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %147 {memref_ext.volatile} : i32
            %148 = arith.subi %147, %c1_i32 : i32
            memref.store %148, %10[] : memref<i32, #hivm.address_space<ssbuf>>
            %149 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %149 {memref_ext.volatile} : i32
            %150 = arith.subi %149, %c1_i32 : i32
            memref.store %150, %11[] : memref<i32, #hivm.address_space<ssbuf>>
            %151 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %151 {memref_ext.volatile} : i32
            %152 = arith.addi %151, %c1_i32 : i32
            memref.store %152, %8[] : memref<i32, #hivm.address_space<ssbuf>>
            %153 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %153 {memref_ext.volatile} : i32
            %154 = arith.addi %153, %c1_i32 : i32
            memref.store %154, %9[] : memref<i32, #hivm.address_space<ssbuf>>
            %155 = arith.addi %arg30, %c1_i32 : i32
            scf.yield %155 : i32
          } else {
            scf.yield %arg30 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 6 : i32}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %89, %119, %101 : i32, i32, i32
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
    %c66304_i64 = arith.constant 66304 : i64
    %c49920_i64 = arith.constant 49920 : i64
    %c16384_i64 = arith.constant 16384 : i64
    %c82688_i64 = arith.constant 82688 : i64
    %c82432_i64 = arith.constant 82432 : i64
    %c0_i64 = arith.constant 0 : i64
    %c199680_i64 = arith.constant 199680 : i64
    %c199424_i64 = arith.constant 199424 : i64
    %c199936_i64 = arith.constant 199936 : i64
    %c198144_i64 = arith.constant 198144 : i64
    %c199168_i64 = arith.constant 199168 : i64
    %c198656_i64 = arith.constant 198656 : i64
    %c197888_i64 = arith.constant 197888 : i64
    %c198400_i64 = arith.constant 198400 : i64
    %c198912_i64 = arith.constant 198912 : i64
    %c49664_i64 = arith.constant 49664 : i64
    %c165120_i64 = arith.constant 165120 : i64
    %c99584_i64 = arith.constant 99584 : i64
    %c32768_i64 = arith.constant 32768 : i64
    %c98304_i64 = arith.constant 98304 : i64
    %c99328_i64 = arith.constant 99328 : i64
    %c99072_i64 = arith.constant 99072 : i64
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
    %c0_i64_0 = arith.constant 0 : i64
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
    %9 = hivm.hir.pointer_cast(%c99072_i64) : memref<64xf32, #hivm.address_space<ub>>
    %10 = hivm.hir.pointer_cast(%c99328_i64) : memref<64xf32, #hivm.address_space<ub>>
    call @_swa_fwd_kernel_mix_aiv_outlined_vf_5(%9, %10) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
    %reinterpret_cast = memref.reinterpret_cast %arg8 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %reinterpret_cast_1 = memref.reinterpret_cast %arg8 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %reinterpret_cast_2 = memref.reinterpret_cast %arg9 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %reinterpret_cast_3 = memref.reinterpret_cast %arg9 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %11 = arith.index_cast %arg11 : i32 to index
    %12 = arith.index_cast %arg13 : i32 to index
    %13 = arith.index_cast %4 : i64 to index
    %14 = affine.apply #map7()[%13]
    %15 = affine.apply #map8()[%13]
    annotation.mark %1 {logical_block_num} : i32
    %16 = affine.apply #map9()[%13]
    scf.for %arg26 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %17 = arith.remsi %arg26, %arg23 : i32
      %18 = hivm.hir.pointer_cast(%c0_i64_0) : memref<i32, #hivm.address_space<ssbuf>>
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
      %27 = hivm.hir.pointer_cast(%7) : memref<i32, #hivm.address_space<ssbuf>>
      %28 = hivm.hir.pointer_cast(%8) : memref<i32, #hivm.address_space<ssbuf>>
      %29 = memref.load %reinterpret_cast[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %30 = memref.load %reinterpret_cast_1[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %31 = memref.load %reinterpret_cast_2[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %32 = memref.load %reinterpret_cast_3[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %33 = arith.subi %30, %29 : i32
      %34 = arith.subi %32, %31 : i32
      %35 = arith.subi %34, %33 : i32
      %36 = arith.addi %33, %c127_i32 : i32
      %37 = arith.divsi %36, %c128_i32 : i32
      %38 = arith.muli %37, %c12_i32 : i32
      %39 = arith.remsi %17, %arg23 : i32
      %40 = arith.muli %29, %arg11 : i32
      %41 = arith.index_cast %40 : i32 to index
      %42 = arith.muli %29, %arg13 : i32
      %43 = arith.index_cast %42 : i32 to index
      %44 = arith.index_cast %29 : i32 to index
      %45 = arith.index_cast %33 : i32 to index
      scf.for %arg27 = %39 to %38 step %arg23  : i32 {
        %46 = arith.divsi %arg27, %c12_i32 : i32
        %47 = arith.muli %46, %c128_i32 : i32
        %48 = arith.addi %47, %c128_i32 : i32
        %49 = arith.minsi %48, %33 : i32
        %50 = arith.subi %49, %47 : i32
        %51 = arith.addi %47, %35 : i32
        %52 = arith.addi %51, %50 : i32
        %53 = arith.addi %52, %c255_i32 : i32
        %54 = arith.divsi %53, %c256_i32 : i32
        %55 = arith.minsi %54, %c1_i32 : i32
        %56 = arith.subi %51, %c1023_i32 : i32
        %57 = arith.maxsi %56, %c0_i32 : i32
        %58 = arith.divsi %57, %c256_i32 : i32
        %59 = arith.maxsi %55, %58 : i32
        %60 = arith.subi %54, %59 : i32
        %61 = arith.addi %55, %60 : i32
        %62 = arith.subi %59, %55 : i32
        %63 = arith.cmpi sge, %51, %34 : i32
        %64 = arith.extui %63 : i1 to i32
        %65 = arith.minsi %51, %c2176_i32 : i32
        %66 = arith.subi %c1_i32, %64 : i32
        %67 = arith.muli %66, %65 : i32
        %68 = arith.muli %64, %c2304_i32 : i32
        %69 = arith.addi %67, %68 : i32
        %70 = arith.subi %51, %69 : i32
        %71 = arith.cmpi ne, %70, %c0_i32 : i32
        %72 = arith.extui %71 : i1 to i32
        %73 = arith.index_cast %69 : i32 to index
        %74 = hivm.hir.pointer_cast(%c98304_i64) : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %subview = memref.subview %74[0, %15, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %75 = hivm.hir.pointer_cast(%c32768_i64) : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %subview_4 = memref.subview %75[0, %15, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %75 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %74 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %76 = hivm.hir.pointer_cast(%c99584_i64) : memref<64x256xf32, #hivm.address_space<ub>>
        annotation.mark %76 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, hivm.vf_inplace_source, tiledAlloc} : memref<64x256xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_MTE1>] flag = 2
        %77 = hivm.hir.pointer_cast(%c165120_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %77 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %78 = hivm.hir.pointer_cast(%c49664_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %78 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        %79 = hivm.hir.pointer_cast(%c198912_i64) : memref<64xf32, #hivm.address_space<ub>>
        %80 = hivm.hir.pointer_cast(%c198400_i64) : memref<64xf32, #hivm.address_space<ub>>
        %81 = hivm.hir.pointer_cast(%c197888_i64) : memref<64xf32, #hivm.address_space<ub>>
        %82 = hivm.hir.pointer_cast(%c198656_i64) : memref<64xf32, #hivm.address_space<ub>>
        %83 = hivm.hir.pointer_cast(%c199168_i64) : memref<64xf32, #hivm.address_space<ub>>
        %84 = hivm.hir.pointer_cast(%c198144_i64) : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        %85 = arith.addi %61, %c4_i32 : i32
        %86 = hivm.hir.pointer_cast(%c199936_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_3(%86) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>) -> ()
        %87 = hivm.hir.pointer_cast(%c199424_i64) : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%10 : memref<64xf32, #hivm.address_space<ub>>) outs(%87 : memref<64xf32, #hivm.address_space<ub>>)
        %88 = hivm.hir.pointer_cast(%c199680_i64) : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%9 : memref<64xf32, #hivm.address_space<ub>>) outs(%88 : memref<64xf32, #hivm.address_space<ub>>)
        %89:7 = scf.for %arg28 = %c0_i32 to %85 step %c1_i32 iter_args(%arg29 = %87, %arg30 = %88, %arg31 = %86, %arg32 = %c0_i32, %arg33 = %c0_i32, %arg34 = %c0_i32, %arg35 = %c0_i32) -> (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          %129 = memref.load %27[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %129 {memref_ext.volatile} : i32
          %130 = arith.cmpi sgt, %129, %c0_i32 : i32
          %131 = memref.load %28[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %131 {memref_ext.volatile} : i32
          %132 = arith.cmpi slt, %131, %c2_i32 : i32
          %133 = arith.andi %130, %132 : i1
          %134 = arith.cmpi slt, %arg34, %c3_i32 : i32
          %135 = arith.cmpi slt, %arg35, %c3_i32 : i32
          %136 = arith.andi %134, %135 : i1
          %137 = arith.cmpi slt, %arg32, %61 : i32
          %138 = arith.andi %133, %136 : i1
          %139 = arith.andi %138, %137 : i1
          %140:4 = scf.if %139 -> (memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %150 = arith.remsi %arg32, %c2_i32 : i32
            %151 = arith.cmpi eq, %150, %c0_i32 : i32
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_V>] flag = 2
            %152 = arith.cmpi sge, %arg32, %55 : i32
            %153 = arith.extui %152 : i1 to i32
            %154 = arith.muli %153, %62 : i32
            %155 = arith.addi %arg32, %154 : i32
            %156 = arith.muli %155, %c256_i32 : i32
            %157 = arith.cmpi slt, %156, %c4_i32 : i32
            %158 = arith.extui %157 : i1 to i32
            %159 = arith.subi %51, %156 : i32
            %160 = arith.cmpi sle, %159, %c1023_i32 : i32
            %161 = arith.extui %160 : i1 to i32
            %162 = arith.subi %c1_i32, %158 : i32
            %163 = arith.muli %158, %161 : i32
            %164 = arith.addi %162, %163 : i32
            %165 = arith.muli %72, %164 : i32
            %166 = arith.subi %c1_i32, %165 : i32
            %167 = arith.muli %166, %156 : i32
            %168 = arith.subi %156, %70 : i32
            %169 = arith.maxsi %168, %c5_i32 : i32
            %170 = arith.muli %165, %169 : i32
            %171 = arith.addi %167, %170 : i32
            %172 = arith.muli %171, %66 : i32
            %173 = arith.index_cast %172 : i32 to index
            %174 = affine.apply #map10()[%173, %73]
            %reinterpret_cast_14 = memref.reinterpret_cast %arg22 to offset: [%174], sizes: [128, 256], strides: [2816, 1] : memref<?xi8, #hivm.address_space<gm>> to memref<128x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>
            %subview_15 = memref.subview %reinterpret_cast_14[%14, 0] [64, 256] [1, 1] : memref<128x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>
            %175 = hivm.hir.pointer_cast(%c0_i64) : memref<64x256xi8, #hivm.address_space<ub>>
            annotation.mark %175 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x256xi8, #hivm.address_space<ub>>
            hivm.hir.load ins(%subview_15 : memref<64x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>) outs(%175 : memref<64x256xi8, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
            %176 = hivm.hir.pointer_cast(%c82432_i64) : memref<64xf32, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_0(%175, %76, %arg10, %176, %76) {hivm.vector_function, no_inline} : (memref<64x256xi8, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>, f32, memref<64xf32, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>) -> ()
            %177 = hivm.hir.pointer_cast(%c82432_i64) : memref<64xf32, #hivm.address_space<ub>>
            %178 = hivm.hir.pointer_cast(%c199424_i64) : memref<64xf32, #hivm.address_space<ub>>
            %179 = hivm.hir.pointer_cast(%c82688_i64) : memref<64xf32, #hivm.address_space<ub>>
            %180 = hivm.hir.pointer_cast(%c16384_i64) : memref<16x65x16x1xbf16, #hivm.address_space<ub>>
            %subview_16 = memref.subview %180[0, 0, 0, 0] [16, 64, 16, 1] [1, 1, 1, 1] : memref<16x65x16x1xbf16, #hivm.address_space<ub>> to memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_1(%arg29, %176, %177, %178, %76, %179, %subview_16) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
            %expand_shape = memref.expand_shape %subview_16 [[0], [1, 2], [3]] output_shape [16, 4, 16, 16] : memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
            scf.if %151 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
              %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_17 = memref.collapse_shape %subview [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape : memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_17 : memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
              %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_17 = memref.collapse_shape %subview_4 [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape : memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_17 : memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
            }
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_MTE1>] flag = 2
            %181 = arith.remsi %arg32, %c3_i32 : i32
            %182 = arith.cmpi eq, %181, %c0_i32 : i32
            scf.if %182 {
              hivm.hir.copy ins(%177 : memref<64xf32, #hivm.address_space<ub>>) outs(%79 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              hivm.hir.copy ins(%179 : memref<64xf32, #hivm.address_space<ub>>) outs(%82 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
            } else {
              %190 = arith.cmpi eq, %181, %c1_i32 : i32
              scf.if %190 {
                hivm.hir.copy ins(%177 : memref<64xf32, #hivm.address_space<ub>>) outs(%80 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%179 : memref<64xf32, #hivm.address_space<ub>>) outs(%83 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              } else {
                hivm.hir.copy ins(%177 : memref<64xf32, #hivm.address_space<ub>>) outs(%81 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%179 : memref<64xf32, #hivm.address_space<ub>>) outs(%84 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              }
            }
            %183 = memref.load %27[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %183 {memref_ext.volatile} : i32
            %184 = arith.subi %183, %c1_i32 : i32
            memref.store %184, %27[] : memref<i32, #hivm.address_space<ssbuf>>
            %185 = memref.load %28[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %185 {memref_ext.volatile} : i32
            %186 = arith.addi %185, %c1_i32 : i32
            memref.store %186, %28[] : memref<i32, #hivm.address_space<ssbuf>>
            %187 = arith.addi %arg34, %c1_i32 : i32
            %188 = arith.addi %arg35, %c1_i32 : i32
            %189 = arith.addi %arg32, %c1_i32 : i32
            scf.yield %178, %187, %188, %189 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg29, %arg34, %arg35, %arg32 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          %141 = memref.load %26[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %141 {memref_ext.volatile} : i32
          %142 = arith.cmpi sgt, %141, %c0_i32 : i32
          %143 = arith.cmpi sgt, %140#1, %c0_i32 : i32
          %144 = arith.cmpi sgt, %140#2, %c0_i32 : i32
          %145 = arith.andi %143, %144 : i1
          %146 = arith.cmpi slt, %arg33, %61 : i32
          %147 = arith.andi %142, %145 : i1
          %148 = arith.andi %147, %146 : i1
          %149:5 = scf.if %148 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %150 = arith.remsi %arg33, %c2_i32 : i32
            %151 = arith.cmpi eq, %150, %c0_i32 : i32
            %152 = arith.remsi %arg33, %c3_i32 : i32
            %153 = arith.cmpi eq, %152, %c0_i32 : i32
            %154:2 = scf.if %153 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) {
              scf.yield %82, %79 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            } else {
              %163 = arith.cmpi eq, %152, %c1_i32 : i32
              %164 = arith.select %163, %83, %84 : memref<64xf32, #hivm.address_space<ub>>
              %165 = arith.select %163, %80, %81 : memref<64xf32, #hivm.address_space<ub>>
              scf.yield %164, %165 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            }
            %155 = arith.select %151, %77, %78 : memref<64x128xf32, #hivm.address_space<ub>>
            scf.if %151 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 3
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 6
            }
            %156 = hivm.hir.pointer_cast(%c199680_i64) : memref<64xf32, #hivm.address_space<ub>>
            %157 = hivm.hir.pointer_cast(%c199936_i64) : memref<64x128xf32, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_fused_2_outlined_merged_vf_0(%arg30, %154#1, %154#0, %156, %154#1, %155, %arg31, %157) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
            scf.if %151 {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
            } else {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
            } {ssbuffer.cross_buffer = 1 : i32}
            %158 = memref.load %26[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %158 {memref_ext.volatile} : i32
            %159 = arith.subi %158, %c1_i32 : i32
            memref.store %159, %26[] : memref<i32, #hivm.address_space<ssbuf>>
            %160 = arith.subi %140#1, %c1_i32 : i32
            %161 = arith.subi %140#2, %c1_i32 : i32
            %162 = arith.addi %arg33, %c1_i32 : i32
            scf.yield %156, %157, %160, %161, %162 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg30, %arg31, %140#1, %140#2, %arg33 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %140#0, %149#0, %149#1, %140#3, %149#4, %149#2, %149#3 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32
        }
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
        %90 = arith.remsi %arg27, %c12_i32 : i32
        %91 = arith.muli %90, %arg15 : i32
        %92 = arith.index_cast %91 : i32 to index
        %93 = arith.maxsi %47, %c0_i32 : i32
        %94 = arith.index_cast %93 : i32 to index
        %95 = affine.apply #map2()[%45, %94]
        %96 = arith.subi %c0_i32, %47 : i32
        %97 = arith.maxsi %96, %c0_i32 : i32
        %98 = arith.index_cast %97 : i32 to index
        %99 = arith.index_cast %47 : i32 to index
        %100 = affine.apply #map11()[%99, %92, %44]
        %101 = affine.apply #map12()[%99]
        %reinterpret_cast_5 = memref.reinterpret_cast %arg4 to offset: [%100], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %102 = arith.maxsi %99, %45 : index
        %103 = arith.minsi %101, %102 : index
        %104 = affine.apply #map2()[%103, %99]
        %105 = arith.minsi %14, %104 : index
        %106 = affine.apply #map13()[%105, %103, %99]
        %107 = arith.minsi %106, %c64 : index
        %subview_6 = memref.subview %reinterpret_cast_5[%14] [%107] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %108 = arith.muli %90, %arg12 : i32
        %109 = arith.index_cast %108 : i32 to index
        %110 = affine.apply #map1()[%94, %11, %41, %109]
        %reinterpret_cast_7 = memref.reinterpret_cast %arg2 to offset: [%110], sizes: [128, 128], strides: [%11, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %111 = arith.maxsi %95, %c0 : index
        %112 = arith.minsi %111, %c128 : index
        %113 = arith.minsi %98, %112 : index
        %114 = affine.apply #map2()[%112, %113]
        %115 = arith.minsi %14, %114 : index
        %116 = affine.apply #map13()[%115, %112, %113]
        %117 = arith.minsi %116, %c64 : index
        %subview_8 = memref.subview %reinterpret_cast_7[%14, 0] [%117, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %118 = arith.muli %90, %arg14 : i32
        %119 = arith.index_cast %118 : i32 to index
        %120 = affine.apply #map1()[%94, %12, %43, %119]
        %reinterpret_cast_9 = memref.reinterpret_cast %arg3 to offset: [%120], sizes: [128, 128], strides: [%12, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_10 = memref.subview %reinterpret_cast_9[%14, 0] [%117, 128] [1, 1] : memref<128x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %121 = hivm.hir.pointer_cast(%c49664_i64) : memref<64xf32, #hivm.address_space<ub>>
        %122 = hivm.hir.pointer_cast(%c49920_i64) : memref<64x128xbf16, #hivm.address_space<ub>>
        %123 = hivm.hir.pointer_cast(%c66304_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        func.call @_swa_fwd_kernel_mix_aiv_fused_4_outlined_merged_vf_0(%89#0, %89#1, %121, %89#1, %89#2, %122, %123) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xbf16, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
        %subview_11 = memref.subview %121[0] [%107] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        %124 = arith.maxsi %113, %14 : index
        %125 = arith.minsi %112, %16 : index
        %126 = arith.maxsi %124, %125 : index
        %127 = affine.apply #map2()[%126, %124]
        %128 = affine.apply #map14()[%124, %13]
        %subview_12 = memref.subview %122[%128, 0] [%127, 128] [1, 1] : memref<64x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_13 = memref.subview %123[%128, 0] [%127, 128] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.store ins(%subview_11 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%subview_6 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
        hivm.hir.store ins(%subview_12 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_8 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
        hivm.hir.store ins(%subview_13 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_10 : memref<?x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}
