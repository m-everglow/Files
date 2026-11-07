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
    %c360448_i64 = arith.constant 360448 : i64
    %c294912_i64 = arith.constant 294912 : i64
    %c181504_i64 = arith.constant 181504 : i64
    %c163840_i64 = arith.constant 163840 : i64
    %c229376_i64 = arith.constant 229376 : i64
    %c115968_i64 = arith.constant 115968 : i64
    %c50432_i64 = arith.constant 50432 : i64
    %c32768_i64 = arith.constant 32768 : i64
    %c98304_i64 = arith.constant 98304 : i64
    %c0_i64 = arith.constant 0 : i64
    %c0_i64_0 = arith.constant 0 : i64
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
      %12 = memref.load %reinterpret_cast[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %13 = memref.load %reinterpret_cast_1[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %14 = memref.load %reinterpret_cast_2[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %15 = memref.load %reinterpret_cast_3[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %16 = arith.subi %13, %12 : i32
      %17 = arith.subi %15, %14 : i32
      %18 = arith.subi %17, %16 : i32
      %19 = arith.addi %16, %c127_i32 : i32
      %20 = arith.divsi %19, %c128_i32 : i32
      %21 = arith.muli %20, %c12_i32 : i32
      %22 = arith.remsi %5, %arg23 : i32
      %23 = arith.muli %12, %arg16 : i32
      %24 = arith.index_cast %23 : i32 to index
      %25 = arith.muli %14, %arg18 : i32
      %26 = arith.index_cast %25 : i32 to index
      %27 = arith.muli %14, %arg20 : i32
      %28 = arith.index_cast %27 : i32 to index
      %29 = arith.index_cast %16 : i32 to index
      scf.for %arg27 = %22 to %21 step %arg23  : i32 {
        %30 = arith.divsi %arg27, %c12_i32 : i32
        %31 = arith.muli %30, %c128_i32 : i32
        %32 = arith.addi %31, %c128_i32 : i32
        %33 = arith.minsi %32, %16 : i32
        %34 = arith.subi %33, %31 : i32
        %35 = arith.addi %31, %18 : i32
        %36 = arith.addi %35, %34 : i32
        %37 = arith.addi %36, %c255_i32 : i32
        %38 = arith.divsi %37, %c256_i32 : i32
        %39 = arith.minsi %38, %c1_i32 : i32
        %40 = arith.subi %35, %c1023_i32 : i32
        %41 = arith.maxsi %40, %c0_i32 : i32
        %42 = arith.divsi %41, %c256_i32 : i32
        %43 = arith.maxsi %39, %42 : i32
        %44 = arith.subi %38, %43 : i32
        %45 = arith.addi %39, %44 : i32
        %46 = arith.remsi %arg27, %c12_i32 : i32
        %47 = arith.divsi %46, %c3_i32 : i32
        %48 = arith.muli %46, %arg17 : i32
        %49 = arith.index_cast %48 : i32 to index
        %50 = arith.maxsi %31, %c0_i32 : i32
        %51 = arith.index_cast %50 : i32 to index
        %52 = affine.apply #map1()[%51, %4, %24, %49]
        %reinterpret_cast_4 = memref.reinterpret_cast %arg5 to offset: [%52], sizes: [128, 128], strides: [%4, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %53 = hivm.hir.pointer_cast(%c0_i64) : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
        %cast = memref.cast %53 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
        %54 = affine.apply #map2()[%29, %51]
        %55 = arith.maxsi %54, %c0 : index
        %56 = arith.minsi %55, %c128 : index
        %57 = arith.subi %c0_i32, %31 : i32
        %58 = arith.maxsi %57, %c0_i32 : i32
        %59 = arith.index_cast %58 : i32 to index
        %60 = arith.minsi %59, %56 : index
        %61 = affine.apply #map2()[%56, %60]
        %62 = arith.cmpi slt, %61, %c128 : index
        %subview = memref.subview %reinterpret_cast_4[0, 0] [%61, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %63 = affine.apply #map3()[%56, %60]
        %64 = affine.apply #map4()[%60]
        %65 = affine.apply #map5()[%60]
        %subview_5 = memref.subview %53[0, %64, %65, 0] [8, %63, 16, 16] [1, 1, 1, 1] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %cast_6 = memref.cast %subview_5 : memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
        scf.if %62 {
          %collapse_shape = memref.collapse_shape %53 [[0, 1, 2, 3]] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> into memref<16384xbf16, #hivm.address_space<cbuf>>
          hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<16384xbf16, #hivm.address_space<cbuf>>)
        } {hivm.unlikely_condition}
        hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_6 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
        %66 = arith.subi %43, %39 : i32
        %67 = arith.muli %47, %arg19 : i32
        %68 = arith.index_cast %67 : i32 to index
        %69 = arith.muli %47, %arg21 : i32
        %70 = arith.index_cast %69 : i32 to index
        %71 = hivm.hir.pointer_cast(%c98304_i64) : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %72 = hivm.hir.pointer_cast(%c32768_i64) : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %72 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = -1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %71 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = -1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
        %73 = hivm.hir.pointer_cast(%c50432_i64) : memref<64x256xf32, #hivm.address_space<ub>>
        %74 = hivm.hir.pointer_cast(%c115968_i64) : memref<64x256xf32, #hivm.address_space<ub>>
        annotation.mark %74 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x256xf32, #hivm.address_space<ub>>
        annotation.mark %73 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x256xf32, #hivm.address_space<ub>>
        %75 = hivm.hir.pointer_cast(%c229376_i64) : memref<128x128xf32, #hivm.address_space<cbuf>>
        %76 = hivm.hir.pointer_cast(%c163840_i64) : memref<128x128xf32, #hivm.address_space<cbuf>>
        %77 = hivm.hir.pointer_cast(%c181504_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %77 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index} : memref<64x128xf32, #hivm.address_space<ub>>
        %78 = arith.addi %45, %c2_i32 : i32
        %79:2 = scf.for %arg28 = %c0_i32 to %78 step %c1_i32 iter_args(%arg29 = %c0_i32, %arg30 = %c0_i32) -> (i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          %80 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %80 {memref_ext.volatile} : i32
          %81 = arith.cmpi slt, %80, %c2_i32 : i32
          %82 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %82 {memref_ext.volatile} : i32
          %83 = arith.cmpi slt, %82, %c2_i32 : i32
          %84 = arith.andi %81, %83 : i1
          %85 = arith.cmpi slt, %arg29, %45 : i32
          %86 = arith.andi %84, %85 : i1
          %87 = scf.if %86 -> (i32) {
            %106 = arith.remsi %arg29, %c2_i32 : i32
            %107 = arith.cmpi eq, %106, %c0_i32 : i32
            %108 = arith.cmpi sge, %arg29, %39 : i32
            %109 = arith.extui %108 : i1 to i32
            %110 = arith.muli %109, %66 : i32
            %111 = arith.addi %arg29, %110 : i32
            %112 = arith.muli %111, %c256_i32 : i32
            %113 = arith.maxsi %112, %c0_i32 : i32
            %114 = arith.index_cast %113 : i32 to index
            %115 = arith.index_cast %arg18 : i32 to index
            %116 = affine.apply #map1()[%114, %115, %26, %68]
            %117 = arith.index_cast %17 : i32 to index
            %reinterpret_cast_7 = memref.reinterpret_cast %arg6 to offset: [%116], sizes: [256, 128], strides: [%115, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %118 = hivm.hir.pointer_cast(%c294912_i64) : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>>
            %cast_8 = memref.cast %118 : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
            %119 = affine.apply #map2()[%117, %114]
            %120 = arith.maxsi %119, %c0 : index
            %121 = arith.minsi %120, %c256 : index
            %122 = arith.subi %c0_i32, %112 : i32
            %123 = arith.maxsi %122, %c0_i32 : i32
            %124 = arith.index_cast %123 : i32 to index
            %125 = arith.minsi %124, %121 : index
            %126 = affine.apply #map2()[%121, %125]
            %127 = arith.cmpi slt, %126, %c256 : index
            %subview_9 = memref.subview %reinterpret_cast_7[0, 0] [%126, 128] [1, 1] : memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %128 = affine.apply #map3()[%121, %125]
            %129 = affine.apply #map4()[%125]
            %130 = affine.apply #map5()[%125]
            %subview_10 = memref.subview %118[0, %129, %130, 0] [8, %128, 16, 16] [1, 1, 1, 1] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
            %cast_11 = memref.cast %subview_10 : memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
            scf.if %127 {
              %collapse_shape = memref.collapse_shape %118 [[0, 1, 2, 3]] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> into memref<32768xbf16, #hivm.address_space<cbuf>>
              hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<32768xbf16, #hivm.address_space<cbuf>>)
            } {hivm.unlikely_condition}
            hivm.hir.nd2nz {dst_continuous} ins(%subview_9 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_11 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
            %131 = hivm.hir.pointer_cast(%c0_i64) : memref<16x8x16x16xf32, #hivm.address_space<cc>>
            %cast_12 = memref.cast %131 : memref<16x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, normalized_in_L0C} ins(%cast, %cast_8, %true, %c128, %c128, %c256 : memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_12 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %107 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%131 : memref<16x8x16x16xf32, #hivm.address_space<cc>>) outs(%73 : memref<64x256xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%131 : memref<16x8x16x16xf32, #hivm.address_space<cc>>) outs(%74 : memref<64x256xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 5
            }
            %132 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %132 {memref_ext.volatile} : i32
            %133 = arith.addi %132, %c1_i32 : i32
            memref.store %133, %6[] : memref<i32, #hivm.address_space<ssbuf>>
            %134 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %134 {memref_ext.volatile} : i32
            %135 = arith.addi %134, %c1_i32 : i32
            memref.store %135, %7[] : memref<i32, #hivm.address_space<ssbuf>>
            %136 = arith.addi %arg29, %c1_i32 : i32
            scf.yield %136 : i32
          } else {
            scf.yield %arg29 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 4 : i32}
          %88 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %88 {memref_ext.volatile} : i32
          %89 = arith.cmpi sgt, %88, %c0_i32 : i32
          %90 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %90 {memref_ext.volatile} : i32
          %91 = arith.cmpi sgt, %90, %c0_i32 : i32
          %92 = arith.andi %89, %91 : i1
          %93 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %93 {memref_ext.volatile} : i32
          %94 = arith.cmpi slt, %93, %c2_i32 : i32
          %95 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %95 {memref_ext.volatile} : i32
          %96 = arith.cmpi slt, %95, %c2_i32 : i32
          %97 = arith.andi %94, %96 : i1
          %98 = arith.andi %92, %97 : i1
          %99 = arith.cmpi sge, %arg29, %45 : i32
          %100 = arith.cmpi sge, %arg29, %c2_i32 : i32
          %101 = arith.ori %99, %100 : i1
          %102 = arith.cmpi slt, %arg30, %45 : i32
          %103 = arith.andi %98, %101 : i1
          %104 = arith.andi %103, %102 : i1
          %105 = scf.if %104 -> (i32) {
            %106 = arith.remsi %arg30, %c2_i32 : i32
            %107 = arith.cmpi eq, %106, %c0_i32 : i32
            %108 = arith.cmpi sge, %arg30, %39 : i32
            %109 = arith.extui %108 : i1 to i32
            %110 = arith.muli %109, %66 : i32
            %111 = arith.addi %arg30, %110 : i32
            %112 = arith.muli %111, %c256_i32 : i32
            %113 = arith.maxsi %112, %c0_i32 : i32
            %114 = arith.index_cast %113 : i32 to index
            %115 = arith.index_cast %17 : i32 to index
            %116 = arith.subi %c0_i32, %112 : i32
            %117 = arith.maxsi %116, %c0_i32 : i32
            %118 = arith.index_cast %117 : i32 to index
            %119 = arith.index_cast %arg20 : i32 to index
            %120 = affine.apply #map1()[%114, %119, %28, %70]
            %reinterpret_cast_7 = memref.reinterpret_cast %arg7 to offset: [%120], sizes: [256, 128], strides: [%119, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %121 = hivm.hir.pointer_cast(%c360448_i64) : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>>
            %cast_8 = memref.cast %121 : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
            %122 = affine.apply #map2()[%115, %114]
            %123 = arith.maxsi %122, %c0 : index
            %124 = arith.minsi %123, %c256 : index
            %125 = arith.minsi %118, %124 : index
            %126 = affine.apply #map2()[%124, %125]
            %127 = arith.cmpi slt, %126, %c256 : index
            %subview_9 = memref.subview %reinterpret_cast_7[0, 0] [%126, 128] [1, 1] : memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %128 = affine.apply #map3()[%124, %125]
            %129 = affine.apply #map4()[%125]
            %130 = affine.apply #map5()[%125]
            %subview_10 = memref.subview %121[0, %129, %130, 0] [8, %128, 16, 16] [1, 1, 1, 1] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
            %cast_11 = memref.cast %subview_10 : memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
            scf.if %127 {
              %collapse_shape = memref.collapse_shape %121 [[0, 1, 2, 3]] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> into memref<32768xbf16, #hivm.address_space<cbuf>>
              hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<32768xbf16, #hivm.address_space<cbuf>>)
            } {hivm.unlikely_condition}
            hivm.hir.nd2nz {dst_continuous} ins(%subview_9 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_11 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
            %131 = arith.select %107, %71, %72 : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
            scf.if %107 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
            }
            %132 = hivm.hir.pointer_cast(%c131072_i64) : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            %cast_12 = memref.cast %132 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, normalized_in_L0C} ins(%131, %cast_8, %true, %c128, %c256, %c128 : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_12 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %107 {
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%132 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%75 : memref<128x128xf32, #hivm.address_space<cbuf>>)
            } else {
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%132 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%76 : memref<128x128xf32, #hivm.address_space<cbuf>>)
            }
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_MTE1>] flag = 3
            scf.if %107 {
              hivm.hir.l12ub {dual_dst_mode = #hivm.fixpipe_dual_dst_mode<ROW_SPLIT>} ins(%75 : memref<128x128xf32, #hivm.address_space<cbuf>>) outs(%77 : memref<64x128xf32, #hivm.address_space<ub>>)
            } else {
              hivm.hir.l12ub {dual_dst_mode = #hivm.fixpipe_dual_dst_mode<ROW_SPLIT>} ins(%76 : memref<128x128xf32, #hivm.address_space<cbuf>>) outs(%77 : memref<64x128xf32, #hivm.address_space<ub>>)
            }
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_V>] flag = 3
            scf.if %107 {
              hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            } else {
              hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
            } {ssbuffer.cross_buffer = 1 : i32}
            %133 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %133 {memref_ext.volatile} : i32
            %134 = arith.subi %133, %c1_i32 : i32
            memref.store %134, %10[] : memref<i32, #hivm.address_space<ssbuf>>
            %135 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %135 {memref_ext.volatile} : i32
            %136 = arith.subi %135, %c1_i32 : i32
            memref.store %136, %11[] : memref<i32, #hivm.address_space<ssbuf>>
            %137 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %137 {memref_ext.volatile} : i32
            %138 = arith.addi %137, %c1_i32 : i32
            memref.store %138, %8[] : memref<i32, #hivm.address_space<ssbuf>>
            %139 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %139 {memref_ext.volatile} : i32
            %140 = arith.addi %139, %c1_i32 : i32
            memref.store %140, %9[] : memref<i32, #hivm.address_space<ssbuf>>
            %141 = arith.addi %arg30, %c1_i32 : i32
            scf.yield %141 : i32
          } else {
            scf.yield %arg30 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 6 : i32}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %87, %105 : i32, i32
        } {fixpipe_for_mmad_result_already_inserted = true}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_MTE1>] flag = 3
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
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
    %c16384_i64 = arith.constant 16384 : i64
    %c216064_i64 = arith.constant 216064 : i64
    %c49664_i64 = arith.constant 49664 : i64
    %c0_i64 = arith.constant 0 : i64
    %c216320_i64 = arith.constant 216320 : i64
    %c215808_i64 = arith.constant 215808 : i64
    %c216576_i64 = arith.constant 216576 : i64
    %c215296_i64 = arith.constant 215296 : i64
    %c215552_i64 = arith.constant 215552 : i64
    %c215040_i64 = arith.constant 215040 : i64
    %c214528_i64 = arith.constant 214528 : i64
    %c214272_i64 = arith.constant 214272 : i64
    %c214784_i64 = arith.constant 214784 : i64
    %c181504_i64 = arith.constant 181504 : i64
    %c115968_i64 = arith.constant 115968 : i64
    %c50432_i64 = arith.constant 50432 : i64
    %c32768_i64 = arith.constant 32768 : i64
    %c98304_i64 = arith.constant 98304 : i64
    %c50176_i64 = arith.constant 50176 : i64
    %c49920_i64 = arith.constant 49920 : i64
    %c64 = arith.constant 64 : index
    %c28_i32 = arith.constant 28 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
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
    %7 = arith.addi %5, %c8_i64 : i64
    %8 = hivm.hir.pointer_cast(%c49920_i64) : memref<64xf32, #hivm.address_space<ub>>
    %9 = hivm.hir.pointer_cast(%c50176_i64) : memref<64xf32, #hivm.address_space<ub>>
    call @_swa_fwd_kernel_mix_aiv_outlined_vf_5(%8, %9) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
    %reinterpret_cast = memref.reinterpret_cast %arg8 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %reinterpret_cast_1 = memref.reinterpret_cast %arg8 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %reinterpret_cast_2 = memref.reinterpret_cast %arg9 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %reinterpret_cast_3 = memref.reinterpret_cast %arg9 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %10 = arith.index_cast %arg11 : i32 to index
    %11 = arith.index_cast %arg13 : i32 to index
    %12 = arith.index_cast %4 : i64 to index
    %13 = affine.apply #map7()[%12]
    %14 = affine.apply #map8()[%12]
    annotation.mark %1 {logical_block_num} : i32
    %15 = affine.apply #map9()[%12]
    scf.for %arg26 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %16 = arith.remsi %arg26, %arg23 : i32
      %17 = hivm.hir.pointer_cast(%c0_i64_0) : memref<i32, #hivm.address_space<ssbuf>>
      %18 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %17[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %18[] : memref<i32, #hivm.address_space<ssbuf>>
      %19 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %20 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %19[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %20[] : memref<i32, #hivm.address_space<ssbuf>>
      %21 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %22 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %21[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %22[] : memref<i32, #hivm.address_space<ssbuf>>
      %23 = hivm.hir.pointer_cast(%6) : memref<i32, #hivm.address_space<ssbuf>>
      %24 = hivm.hir.pointer_cast(%5) : memref<i32, #hivm.address_space<ssbuf>>
      %25 = hivm.hir.pointer_cast(%7) : memref<i32, #hivm.address_space<ssbuf>>
      %26 = memref.load %reinterpret_cast[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %27 = memref.load %reinterpret_cast_1[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %28 = memref.load %reinterpret_cast_2[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %29 = memref.load %reinterpret_cast_3[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %30 = arith.subi %27, %26 : i32
      %31 = arith.subi %29, %28 : i32
      %32 = arith.subi %31, %30 : i32
      %33 = arith.addi %30, %c127_i32 : i32
      %34 = arith.divsi %33, %c128_i32 : i32
      %35 = arith.muli %34, %c12_i32 : i32
      %36 = arith.remsi %16, %arg23 : i32
      %37 = arith.muli %26, %arg11 : i32
      %38 = arith.index_cast %37 : i32 to index
      %39 = arith.muli %26, %arg13 : i32
      %40 = arith.index_cast %39 : i32 to index
      %41 = arith.index_cast %26 : i32 to index
      %42 = arith.index_cast %30 : i32 to index
      scf.for %arg27 = %36 to %35 step %arg23  : i32 {
        %43 = arith.divsi %arg27, %c12_i32 : i32
        %44 = arith.muli %43, %c128_i32 : i32
        %45 = arith.addi %44, %c128_i32 : i32
        %46 = arith.minsi %45, %30 : i32
        %47 = arith.subi %46, %44 : i32
        %48 = arith.addi %44, %32 : i32
        %49 = arith.addi %48, %47 : i32
        %50 = arith.addi %49, %c255_i32 : i32
        %51 = arith.divsi %50, %c256_i32 : i32
        %52 = arith.minsi %51, %c1_i32 : i32
        %53 = arith.subi %48, %c1023_i32 : i32
        %54 = arith.maxsi %53, %c0_i32 : i32
        %55 = arith.divsi %54, %c256_i32 : i32
        %56 = arith.maxsi %52, %55 : i32
        %57 = arith.subi %51, %56 : i32
        %58 = arith.addi %52, %57 : i32
        %59 = arith.subi %56, %52 : i32
        %60 = arith.cmpi sge, %48, %31 : i32
        %61 = arith.extui %60 : i1 to i32
        %62 = arith.minsi %48, %c2176_i32 : i32
        %63 = arith.subi %c1_i32, %61 : i32
        %64 = arith.muli %63, %62 : i32
        %65 = arith.muli %61, %c2304_i32 : i32
        %66 = arith.addi %64, %65 : i32
        %67 = arith.subi %48, %66 : i32
        %68 = arith.cmpi ne, %67, %c0_i32 : i32
        %69 = arith.extui %68 : i1 to i32
        %70 = arith.index_cast %66 : i32 to index
        %71 = hivm.hir.pointer_cast(%c98304_i64) : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %subview = memref.subview %71[0, %14, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %72 = hivm.hir.pointer_cast(%c32768_i64) : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %subview_4 = memref.subview %72[0, %14, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %72 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %71 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %73 = hivm.hir.pointer_cast(%c50432_i64) : memref<64x256xf32, #hivm.address_space<ub>>
        annotation.mark %73 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x256xf32, #hivm.address_space<ub>>
        %74 = hivm.hir.pointer_cast(%c115968_i64) : memref<64x256xf32, #hivm.address_space<ub>>
        annotation.mark %74 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x256xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        %75 = hivm.hir.pointer_cast(%c181504_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %75 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_MTE1>] flag = 3
        %76 = hivm.hir.pointer_cast(%c214784_i64) : memref<64xf32, #hivm.address_space<ub>>
        %77 = hivm.hir.pointer_cast(%c214272_i64) : memref<64xf32, #hivm.address_space<ub>>
        %78 = hivm.hir.pointer_cast(%c214528_i64) : memref<64xf32, #hivm.address_space<ub>>
        %79 = hivm.hir.pointer_cast(%c215040_i64) : memref<64xf32, #hivm.address_space<ub>>
        %80 = hivm.hir.pointer_cast(%c215552_i64) : memref<64xf32, #hivm.address_space<ub>>
        %81 = hivm.hir.pointer_cast(%c215296_i64) : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        %82 = arith.addi %58, %c2_i32 : i32
        %83 = hivm.hir.pointer_cast(%c216576_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_3(%83) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>) -> ()
        %84 = hivm.hir.pointer_cast(%c215808_i64) : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%9 : memref<64xf32, #hivm.address_space<ub>>) outs(%84 : memref<64xf32, #hivm.address_space<ub>>)
        %85 = hivm.hir.pointer_cast(%c216320_i64) : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%8 : memref<64xf32, #hivm.address_space<ub>>) outs(%85 : memref<64xf32, #hivm.address_space<ub>>)
        %86:7 = scf.for %arg28 = %c0_i32 to %82 step %c1_i32 iter_args(%arg29 = %84, %arg30 = %85, %arg31 = %83, %arg32 = %c0_i32, %arg33 = %c0_i32, %arg34 = %c0_i32, %arg35 = %c0_i32) -> (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          %126 = memref.load %24[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %126 {memref_ext.volatile} : i32
          %127 = arith.cmpi sgt, %126, %c0_i32 : i32
          %128 = memref.load %25[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %128 {memref_ext.volatile} : i32
          %129 = arith.cmpi slt, %128, %c2_i32 : i32
          %130 = arith.andi %127, %129 : i1
          %131 = arith.cmpi slt, %arg34, %c3_i32 : i32
          %132 = arith.cmpi slt, %arg35, %c3_i32 : i32
          %133 = arith.andi %131, %132 : i1
          %134 = arith.cmpi slt, %arg32, %58 : i32
          %135 = arith.andi %130, %133 : i1
          %136 = arith.andi %135, %134 : i1
          %137:4 = scf.if %136 -> (memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %147 = arith.remsi %arg32, %c2_i32 : i32
            %148 = arith.cmpi eq, %147, %c0_i32 : i32
            %149 = arith.select %148, %73, %74 : memref<64x256xf32, #hivm.address_space<ub>>
            scf.if %148 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 5
            }
            %150 = arith.cmpi sge, %arg32, %52 : i32
            %151 = arith.extui %150 : i1 to i32
            %152 = arith.muli %151, %59 : i32
            %153 = arith.addi %arg32, %152 : i32
            %154 = arith.muli %153, %c256_i32 : i32
            %155 = arith.cmpi slt, %154, %c4_i32 : i32
            %156 = arith.extui %155 : i1 to i32
            %157 = arith.subi %48, %154 : i32
            %158 = arith.cmpi sle, %157, %c1023_i32 : i32
            %159 = arith.extui %158 : i1 to i32
            %160 = arith.subi %c1_i32, %156 : i32
            %161 = arith.muli %156, %159 : i32
            %162 = arith.addi %160, %161 : i32
            %163 = arith.muli %69, %162 : i32
            %164 = arith.subi %c1_i32, %163 : i32
            %165 = arith.muli %164, %154 : i32
            %166 = arith.subi %154, %67 : i32
            %167 = arith.maxsi %166, %c5_i32 : i32
            %168 = arith.muli %163, %167 : i32
            %169 = arith.addi %165, %168 : i32
            %170 = arith.muli %169, %63 : i32
            %171 = arith.index_cast %170 : i32 to index
            %172 = affine.apply #map10()[%171, %70]
            %reinterpret_cast_14 = memref.reinterpret_cast %arg22 to offset: [%172], sizes: [128, 256], strides: [2816, 1] : memref<?xi8, #hivm.address_space<gm>> to memref<128x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>
            %subview_15 = memref.subview %reinterpret_cast_14[%13, 0] [64, 256] [1, 1] : memref<128x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>
            %173 = hivm.hir.pointer_cast(%c0_i64) : memref<64x256xi8, #hivm.address_space<ub>>
            annotation.mark %173 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x256xi8, #hivm.address_space<ub>>
            hivm.hir.load ins(%subview_15 : memref<64x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>) outs(%173 : memref<64x256xi8, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
            %174 = hivm.hir.pointer_cast(%c49664_i64) : memref<64xf32, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_0(%173, %149, %arg10, %174, %149) {hivm.vector_function, no_inline} : (memref<64x256xi8, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>, f32, memref<64xf32, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>) -> ()
            %175 = hivm.hir.pointer_cast(%c49664_i64) : memref<64xf32, #hivm.address_space<ub>>
            %176 = hivm.hir.pointer_cast(%c215808_i64) : memref<64xf32, #hivm.address_space<ub>>
            %177 = hivm.hir.pointer_cast(%c216064_i64) : memref<64xf32, #hivm.address_space<ub>>
            %178 = hivm.hir.pointer_cast(%c16384_i64) : memref<16x65x16x1xbf16, #hivm.address_space<ub>>
            %subview_16 = memref.subview %178[0, 0, 0, 0] [16, 64, 16, 1] [1, 1, 1, 1] : memref<16x65x16x1xbf16, #hivm.address_space<ub>> to memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_1(%arg29, %174, %175, %176, %149, %177, %subview_16) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
            %expand_shape = memref.expand_shape %subview_16 [[0], [1, 2], [3]] output_shape [16, 4, 16, 16] : memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
            scf.if %148 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
              %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_17 = memref.collapse_shape %subview [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape : memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_17 : memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
              %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_17 = memref.collapse_shape %subview_4 [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape : memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_17 : memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
            }
            %179 = arith.remsi %arg32, %c3_i32 : i32
            %180 = arith.cmpi eq, %179, %c0_i32 : i32
            scf.if %180 {
              hivm.hir.copy ins(%175 : memref<64xf32, #hivm.address_space<ub>>) outs(%76 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              hivm.hir.copy ins(%177 : memref<64xf32, #hivm.address_space<ub>>) outs(%79 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
            } else {
              %188 = arith.cmpi eq, %179, %c1_i32 : i32
              scf.if %188 {
                hivm.hir.copy ins(%175 : memref<64xf32, #hivm.address_space<ub>>) outs(%77 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%177 : memref<64xf32, #hivm.address_space<ub>>) outs(%80 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              } else {
                hivm.hir.copy ins(%175 : memref<64xf32, #hivm.address_space<ub>>) outs(%78 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%177 : memref<64xf32, #hivm.address_space<ub>>) outs(%81 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              }
            }
            %181 = memref.load %24[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %181 {memref_ext.volatile} : i32
            %182 = arith.subi %181, %c1_i32 : i32
            memref.store %182, %24[] : memref<i32, #hivm.address_space<ssbuf>>
            %183 = memref.load %25[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %183 {memref_ext.volatile} : i32
            %184 = arith.addi %183, %c1_i32 : i32
            memref.store %184, %25[] : memref<i32, #hivm.address_space<ssbuf>>
            %185 = arith.addi %arg34, %c1_i32 : i32
            %186 = arith.addi %arg35, %c1_i32 : i32
            %187 = arith.addi %arg32, %c1_i32 : i32
            scf.yield %176, %185, %186, %187 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg29, %arg34, %arg35, %arg32 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          %138 = memref.load %23[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %138 {memref_ext.volatile} : i32
          %139 = arith.cmpi sgt, %138, %c0_i32 : i32
          %140 = arith.cmpi sgt, %137#1, %c0_i32 : i32
          %141 = arith.cmpi sgt, %137#2, %c0_i32 : i32
          %142 = arith.andi %140, %141 : i1
          %143 = arith.cmpi slt, %arg33, %58 : i32
          %144 = arith.andi %139, %142 : i1
          %145 = arith.andi %144, %143 : i1
          %146:5 = scf.if %145 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %147 = arith.remsi %arg33, %c3_i32 : i32
            %148 = arith.cmpi eq, %147, %c0_i32 : i32
            %149:2 = scf.if %148 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) {
              scf.yield %79, %76 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            } else {
              %157 = arith.cmpi eq, %147, %c1_i32 : i32
              %158 = arith.select %157, %80, %81 : memref<64xf32, #hivm.address_space<ub>>
              %159 = arith.select %157, %77, %78 : memref<64xf32, #hivm.address_space<ub>>
              scf.yield %158, %159 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            }
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_V>] flag = 3
            %150 = hivm.hir.pointer_cast(%c216320_i64) : memref<64xf32, #hivm.address_space<ub>>
            %151 = hivm.hir.pointer_cast(%c216576_i64) : memref<64x128xf32, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_fused_2_outlined_merged_vf_0(%arg30, %149#1, %149#0, %150, %149#1, %75, %arg31, %151) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_MTE1>] flag = 3
            %152 = memref.load %23[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %152 {memref_ext.volatile} : i32
            %153 = arith.subi %152, %c1_i32 : i32
            memref.store %153, %23[] : memref<i32, #hivm.address_space<ssbuf>>
            %154 = arith.subi %137#1, %c1_i32 : i32
            %155 = arith.subi %137#2, %c1_i32 : i32
            %156 = arith.addi %arg33, %c1_i32 : i32
            scf.yield %150, %151, %154, %155, %156 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg30, %arg31, %137#1, %137#2, %arg33 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %137#0, %146#0, %146#1, %137#3, %146#4, %146#2, %146#3 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32
        }
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
        %87 = arith.remsi %arg27, %c12_i32 : i32
        %88 = arith.muli %87, %arg15 : i32
        %89 = arith.index_cast %88 : i32 to index
        %90 = arith.maxsi %44, %c0_i32 : i32
        %91 = arith.index_cast %90 : i32 to index
        %92 = affine.apply #map2()[%42, %91]
        %93 = arith.subi %c0_i32, %44 : i32
        %94 = arith.maxsi %93, %c0_i32 : i32
        %95 = arith.index_cast %94 : i32 to index
        %96 = arith.index_cast %44 : i32 to index
        %97 = affine.apply #map11()[%96, %89, %41]
        %98 = affine.apply #map12()[%96]
        %reinterpret_cast_5 = memref.reinterpret_cast %arg4 to offset: [%97], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %99 = arith.maxsi %96, %42 : index
        %100 = arith.minsi %98, %99 : index
        %101 = affine.apply #map2()[%100, %96]
        %102 = arith.minsi %13, %101 : index
        %103 = affine.apply #map13()[%102, %100, %96]
        %104 = arith.minsi %103, %c64 : index
        %subview_6 = memref.subview %reinterpret_cast_5[%13] [%104] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %105 = arith.muli %87, %arg12 : i32
        %106 = arith.index_cast %105 : i32 to index
        %107 = affine.apply #map1()[%91, %10, %38, %106]
        %reinterpret_cast_7 = memref.reinterpret_cast %arg2 to offset: [%107], sizes: [128, 128], strides: [%10, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %108 = arith.maxsi %92, %c0 : index
        %109 = arith.minsi %108, %c128 : index
        %110 = arith.minsi %95, %109 : index
        %111 = affine.apply #map2()[%109, %110]
        %112 = arith.minsi %13, %111 : index
        %113 = affine.apply #map13()[%112, %109, %110]
        %114 = arith.minsi %113, %c64 : index
        %subview_8 = memref.subview %reinterpret_cast_7[%13, 0] [%114, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %115 = arith.muli %87, %arg14 : i32
        %116 = arith.index_cast %115 : i32 to index
        %117 = affine.apply #map1()[%91, %11, %40, %116]
        %reinterpret_cast_9 = memref.reinterpret_cast %arg3 to offset: [%117], sizes: [128, 128], strides: [%11, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_10 = memref.subview %reinterpret_cast_9[%13, 0] [%114, 128] [1, 1] : memref<128x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %118 = hivm.hir.pointer_cast(%c49664_i64) : memref<64xf32, #hivm.address_space<ub>>
        %119 = hivm.hir.pointer_cast(%c0_i64) : memref<64x128xbf16, #hivm.address_space<ub>>
        %120 = hivm.hir.pointer_cast(%c16384_i64) : memref<64x128xf32, #hivm.address_space<ub>>
        func.call @_swa_fwd_kernel_mix_aiv_fused_4_outlined_merged_vf_0(%86#0, %86#1, %118, %86#1, %86#2, %119, %120) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xbf16, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
        %subview_11 = memref.subview %118[0] [%104] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        %121 = arith.maxsi %110, %13 : index
        %122 = arith.minsi %109, %15 : index
        %123 = arith.maxsi %121, %122 : index
        %124 = affine.apply #map2()[%123, %121]
        %125 = affine.apply #map14()[%121, %12]
        %subview_12 = memref.subview %119[%125, 0] [%124, 128] [1, 1] : memref<64x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_13 = memref.subview %120[%125, 0] [%124, 128] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.store ins(%subview_11 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%subview_6 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
        hivm.hir.store ins(%subview_12 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_8 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
        hivm.hir.store ins(%subview_13 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_10 : memref<?x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}


warning: [hivm-plan-memory] There reused some dma buffers in ub address space, which may stall pipe. Not reusing dma buffer needs 2390016 bits while 2031616 bits available!
