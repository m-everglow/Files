// -----// IR Dump Before PlanMemoryRegBase (hivm-plan-memory-regbase) //----- //
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
      %12 = memref.load %reinterpret_cast[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %13 = memref.load %reinterpret_cast_0[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %14 = memref.load %reinterpret_cast_1[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %15 = memref.load %reinterpret_cast_2[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
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
        %reinterpret_cast_3 = memref.reinterpret_cast %arg5 to offset: [%52], sizes: [128, 128], strides: [%4, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
        %cast = memref.cast %alloc : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
        %53 = affine.apply #map2()[%29, %51]
        %54 = arith.maxsi %53, %c0 : index
        %55 = arith.minsi %54, %c128 : index
        %56 = arith.subi %c0_i32, %31 : i32
        %57 = arith.maxsi %56, %c0_i32 : i32
        %58 = arith.index_cast %57 : i32 to index
        %59 = arith.minsi %58, %55 : index
        %60 = affine.apply #map2()[%55, %59]
        %61 = arith.cmpi slt, %60, %c128 : index
        %subview = memref.subview %reinterpret_cast_3[0, 0] [%60, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %62 = affine.apply #map3()[%55, %59]
        %63 = affine.apply #map4()[%59]
        %64 = affine.apply #map5()[%59]
        %subview_4 = memref.subview %alloc[0, %63, %64, 0] [8, %62, 16, 16] [1, 1, 1, 1] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %cast_5 = memref.cast %subview_4 : memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
        scf.if %61 {
          %collapse_shape = memref.collapse_shape %alloc [[0, 1, 2, 3]] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> into memref<16384xbf16, #hivm.address_space<cbuf>>
          hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<16384xbf16, #hivm.address_space<cbuf>>)
        } {hivm.unlikely_condition}
        hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_5 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
        %65 = arith.subi %43, %39 : i32
        %66 = arith.muli %47, %arg19 : i32
        %67 = arith.index_cast %66 : i32 to index
        %68 = arith.muli %47, %arg21 : i32
        %69 = arith.index_cast %68 : i32 to index
        %alloc_6 = memref.alloc() : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %alloc_7 = memref.alloc() : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_7 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = -1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_6 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = -1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
        %fixpipe_l1_0 = memref.alloc() : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>
        %fixpipe_l1_1 = memref.alloc() : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>
        %alloc_8 = memref.alloc() : memref<64x256xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_8 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x256xf32, #hivm.address_space<ub>>
        %alloc_10 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_11 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_11 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_10 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %70 = arith.addi %45, %c2_i32 : i32
        %71:2 = scf.for %arg28 = %c0_i32 to %70 step %c1_i32 iter_args(%arg29 = %c0_i32, %arg30 = %c0_i32) -> (i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          %72 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %72 {memref_ext.volatile} : i32
          %73 = arith.cmpi slt, %72, %c2_i32 : i32
          %74 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %74 {memref_ext.volatile} : i32
          %75 = arith.cmpi slt, %74, %c2_i32 : i32
          %76 = arith.andi %73, %75 : i1
          %77 = arith.cmpi slt, %arg29, %45 : i32
          %78 = arith.andi %76, %77 : i1
          %79 = scf.if %78 -> (i32) {
            %98 = arith.remsi %arg29, %c2_i32 : i32
            %99 = arith.cmpi eq, %98, %c0_i32 : i32
            %100 = arith.cmpi sge, %arg29, %39 : i32
            %101 = arith.extui %100 : i1 to i32
            %102 = arith.muli %101, %65 : i32
            %103 = arith.addi %arg29, %102 : i32
            %104 = arith.muli %103, %c256_i32 : i32
            %105 = arith.maxsi %104, %c0_i32 : i32
            %106 = arith.index_cast %105 : i32 to index
            %107 = arith.index_cast %arg18 : i32 to index
            %108 = affine.apply #map1()[%106, %107, %26, %67]
            %109 = arith.index_cast %17 : i32 to index
            %reinterpret_cast_12 = memref.reinterpret_cast %arg6 to offset: [%108], sizes: [256, 128], strides: [%107, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_13 = memref.alloc() : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>>
            %cast_14 = memref.cast %alloc_13 : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
            %110 = affine.apply #map2()[%109, %106]
            %111 = arith.maxsi %110, %c0 : index
            %112 = arith.minsi %111, %c256 : index
            %113 = arith.subi %c0_i32, %104 : i32
            %114 = arith.maxsi %113, %c0_i32 : i32
            %115 = arith.index_cast %114 : i32 to index
            %116 = arith.minsi %115, %112 : index
            %117 = affine.apply #map2()[%112, %116]
            %118 = arith.cmpi slt, %117, %c256 : index
            %subview_15 = memref.subview %reinterpret_cast_12[0, 0] [%117, 128] [1, 1] : memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %119 = affine.apply #map3()[%112, %116]
            %120 = affine.apply #map4()[%116]
            %121 = affine.apply #map5()[%116]
            %subview_16 = memref.subview %alloc_13[0, %120, %121, 0] [8, %119, 16, 16] [1, 1, 1, 1] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
            %cast_17 = memref.cast %subview_16 : memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
            scf.if %118 {
              %collapse_shape = memref.collapse_shape %alloc_13 [[0, 1, 2, 3]] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> into memref<32768xbf16, #hivm.address_space<cbuf>>
              hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<32768xbf16, #hivm.address_space<cbuf>>)
            } {hivm.unlikely_condition}
            hivm.hir.nd2nz {dst_continuous} ins(%subview_15 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_17 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
            %alloc_18 = memref.alloc() {alignment = 64 : i64} : memref<16x8x16x16xf32, #hivm.address_space<cc>>
            %cast_19 = memref.cast %alloc_18 : memref<16x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, normalized_in_L0C} ins(%cast, %cast_14, %true, %c128, %c128, %c256 : memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_19 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %99 {
              hivm.hir.fixpipe ins(%alloc_18 : memref<16x8x16x16xf32, #hivm.address_space<cc>>) outs(%fixpipe_l1_0 : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>)
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
              hivm.hir.l12ub ins(%fixpipe_l1_0 : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>) outs(%alloc_8 : memref<64x256xf32, #hivm.address_space<ub>>)
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 2
            } else {
              hivm.hir.fixpipe ins(%alloc_18 : memref<16x8x16x16xf32, #hivm.address_space<cc>>) outs(%fixpipe_l1_1 : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>)
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
              hivm.hir.l12ub ins(%fixpipe_l1_1 : memref<16x8x16x16xf32, #hivm.address_space<cbuf>>) outs(%alloc_8 : memref<64x256xf32, #hivm.address_space<ub>>)
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 2
            }
            %122 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %122 {memref_ext.volatile} : i32
            %123 = arith.addi %122, %c1_i32 : i32
            memref.store %123, %6[] : memref<i32, #hivm.address_space<ssbuf>>
            %124 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %124 {memref_ext.volatile} : i32
            %125 = arith.addi %124, %c1_i32 : i32
            memref.store %125, %7[] : memref<i32, #hivm.address_space<ssbuf>>
            %126 = arith.addi %arg29, %c1_i32 : i32
            scf.yield %126 : i32
          } else {
            scf.yield %arg29 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 4 : i32}
          %80 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %80 {memref_ext.volatile} : i32
          %81 = arith.cmpi sgt, %80, %c0_i32 : i32
          %82 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %82 {memref_ext.volatile} : i32
          %83 = arith.cmpi sgt, %82, %c0_i32 : i32
          %84 = arith.andi %81, %83 : i1
          %85 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %85 {memref_ext.volatile} : i32
          %86 = arith.cmpi slt, %85, %c2_i32 : i32
          %87 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %87 {memref_ext.volatile} : i32
          %88 = arith.cmpi slt, %87, %c2_i32 : i32
          %89 = arith.andi %86, %88 : i1
          %90 = arith.andi %84, %89 : i1
          %91 = arith.cmpi sge, %arg29, %45 : i32
          %92 = arith.cmpi sge, %arg29, %c2_i32 : i32
          %93 = arith.ori %91, %92 : i1
          %94 = arith.cmpi slt, %arg30, %45 : i32
          %95 = arith.andi %90, %93 : i1
          %96 = arith.andi %95, %94 : i1
          %97 = scf.if %96 -> (i32) {
            %98 = arith.remsi %arg30, %c2_i32 : i32
            %99 = arith.cmpi eq, %98, %c0_i32 : i32
            %100 = arith.cmpi sge, %arg30, %39 : i32
            %101 = arith.extui %100 : i1 to i32
            %102 = arith.muli %101, %65 : i32
            %103 = arith.addi %arg30, %102 : i32
            %104 = arith.muli %103, %c256_i32 : i32
            %105 = arith.maxsi %104, %c0_i32 : i32
            %106 = arith.index_cast %105 : i32 to index
            %107 = arith.index_cast %17 : i32 to index
            %108 = arith.subi %c0_i32, %104 : i32
            %109 = arith.maxsi %108, %c0_i32 : i32
            %110 = arith.index_cast %109 : i32 to index
            %111 = arith.index_cast %arg20 : i32 to index
            %112 = affine.apply #map1()[%106, %111, %28, %69]
            %reinterpret_cast_12 = memref.reinterpret_cast %arg7 to offset: [%112], sizes: [256, 128], strides: [%111, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_13 = memref.alloc() : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>>
            %cast_14 = memref.cast %alloc_13 : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
            %113 = affine.apply #map2()[%107, %106]
            %114 = arith.maxsi %113, %c0 : index
            %115 = arith.minsi %114, %c256 : index
            %116 = arith.minsi %110, %115 : index
            %117 = affine.apply #map2()[%115, %116]
            %118 = arith.cmpi slt, %117, %c256 : index
            %subview_15 = memref.subview %reinterpret_cast_12[0, 0] [%117, 128] [1, 1] : memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
            %119 = affine.apply #map3()[%115, %116]
            %120 = affine.apply #map4()[%116]
            %121 = affine.apply #map5()[%116]
            %subview_16 = memref.subview %alloc_13[0, %120, %121, 0] [8, %119, 16, 16] [1, 1, 1, 1] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
            %cast_17 = memref.cast %subview_16 : memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
            scf.if %118 {
              %collapse_shape = memref.collapse_shape %alloc_13 [[0, 1, 2, 3]] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> into memref<32768xbf16, #hivm.address_space<cbuf>>
              hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<32768xbf16, #hivm.address_space<cbuf>>)
            } {hivm.unlikely_condition}
            hivm.hir.nd2nz {dst_continuous} ins(%subview_15 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_17 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
            %122 = arith.select %99, %alloc_6, %alloc_7 : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
            scf.if %99 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
            }
            %alloc_18 = memref.alloc() {alignment = 64 : i64} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            %cast_19 = memref.cast %alloc_18 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, normalized_in_L0C} ins(%122, %cast_14, %true, %c128, %c256, %c128 : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_19 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %99 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_18 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_10 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 3
              hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_18 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_11 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 6
              hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
            }
            %123 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %123 {memref_ext.volatile} : i32
            %124 = arith.subi %123, %c1_i32 : i32
            memref.store %124, %10[] : memref<i32, #hivm.address_space<ssbuf>>
            %125 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %125 {memref_ext.volatile} : i32
            %126 = arith.subi %125, %c1_i32 : i32
            memref.store %126, %11[] : memref<i32, #hivm.address_space<ssbuf>>
            %127 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %127 {memref_ext.volatile} : i32
            %128 = arith.addi %127, %c1_i32 : i32
            memref.store %128, %8[] : memref<i32, #hivm.address_space<ssbuf>>
            %129 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %129 {memref_ext.volatile} : i32
            %130 = arith.addi %129, %c1_i32 : i32
            memref.store %130, %9[] : memref<i32, #hivm.address_space<ssbuf>>
            %131 = arith.addi %arg30, %c1_i32 : i32
            scf.yield %131 : i32
          } else {
            scf.yield %arg30 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 6 : i32}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %79, %97 : i32, i32
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
    %7 = arith.addi %5, %c8_i64 : i64
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
    call @_swa_fwd_kernel_mix_aiv_outlined_vf_5(%alloc, %alloc_0) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
    %reinterpret_cast = memref.reinterpret_cast %arg8 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %reinterpret_cast_1 = memref.reinterpret_cast %arg8 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %reinterpret_cast_2 = memref.reinterpret_cast %arg9 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %reinterpret_cast_3 = memref.reinterpret_cast %arg9 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %8 = arith.index_cast %arg11 : i32 to index
    %9 = arith.index_cast %arg13 : i32 to index
    %10 = arith.index_cast %4 : i64 to index
    %11 = affine.apply #map7()[%10]
    %12 = affine.apply #map8()[%10]
    annotation.mark %1 {logical_block_num} : i32
    %13 = affine.apply #map9()[%10]
    scf.for %arg26 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %14 = arith.remsi %arg26, %arg23 : i32
      %15 = hivm.hir.pointer_cast(%c0_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %16 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %15[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %16[] : memref<i32, #hivm.address_space<ssbuf>>
      %17 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %18 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %17[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %18[] : memref<i32, #hivm.address_space<ssbuf>>
      %19 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %20 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %19[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %20[] : memref<i32, #hivm.address_space<ssbuf>>
      %21 = hivm.hir.pointer_cast(%6) : memref<i32, #hivm.address_space<ssbuf>>
      %22 = hivm.hir.pointer_cast(%5) : memref<i32, #hivm.address_space<ssbuf>>
      %23 = hivm.hir.pointer_cast(%7) : memref<i32, #hivm.address_space<ssbuf>>
      %24 = memref.load %reinterpret_cast[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %25 = memref.load %reinterpret_cast_1[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %26 = memref.load %reinterpret_cast_2[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
      %27 = memref.load %reinterpret_cast_3[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
      %28 = arith.subi %25, %24 : i32
      %29 = arith.subi %27, %26 : i32
      %30 = arith.subi %29, %28 : i32
      %31 = arith.addi %28, %c127_i32 : i32
      %32 = arith.divsi %31, %c128_i32 : i32
      %33 = arith.muli %32, %c12_i32 : i32
      %34 = arith.remsi %14, %arg23 : i32
      %35 = arith.muli %24, %arg11 : i32
      %36 = arith.index_cast %35 : i32 to index
      %37 = arith.muli %24, %arg13 : i32
      %38 = arith.index_cast %37 : i32 to index
      %39 = arith.index_cast %24 : i32 to index
      %40 = arith.index_cast %28 : i32 to index
      scf.for %arg27 = %34 to %33 step %arg23  : i32 {
        %41 = arith.divsi %arg27, %c12_i32 : i32
        %42 = arith.muli %41, %c128_i32 : i32
        %43 = arith.addi %42, %c128_i32 : i32
        %44 = arith.minsi %43, %28 : i32
        %45 = arith.subi %44, %42 : i32
        %46 = arith.addi %42, %30 : i32
        %47 = arith.addi %46, %45 : i32
        %48 = arith.addi %47, %c255_i32 : i32
        %49 = arith.divsi %48, %c256_i32 : i32
        %50 = arith.minsi %49, %c1_i32 : i32
        %51 = arith.subi %46, %c1023_i32 : i32
        %52 = arith.maxsi %51, %c0_i32 : i32
        %53 = arith.divsi %52, %c256_i32 : i32
        %54 = arith.maxsi %50, %53 : i32
        %55 = arith.subi %49, %54 : i32
        %56 = arith.addi %50, %55 : i32
        %57 = arith.subi %54, %50 : i32
        %58 = arith.cmpi sge, %46, %29 : i32
        %59 = arith.extui %58 : i1 to i32
        %60 = arith.minsi %46, %c2176_i32 : i32
        %61 = arith.subi %c1_i32, %59 : i32
        %62 = arith.muli %61, %60 : i32
        %63 = arith.muli %59, %c2304_i32 : i32
        %64 = arith.addi %62, %63 : i32
        %65 = arith.subi %46, %64 : i32
        %66 = arith.cmpi ne, %65, %c0_i32 : i32
        %67 = arith.extui %66 : i1 to i32
        %68 = arith.index_cast %64 : i32 to index
        %alloc_4 = memref.alloc() : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %subview = memref.subview %alloc_4[0, %12, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %alloc_5 = memref.alloc() : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %subview_6 = memref.subview %alloc_5[0, %12, 0, 0] [16, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_5 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_4 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
        %alloc_7 = memref.alloc() : memref<64x256xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_7 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x256xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
        %alloc_9 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_9 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_10 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_10 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        %alloc_11 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_12 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_13 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_14 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_15 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        %alloc_16 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        %69 = arith.addi %56, %c2_i32 : i32
        %alloc_17 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
        func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_3(%alloc_17) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>) -> ()
        %alloc_18 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%alloc_0 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_18 : memref<64xf32, #hivm.address_space<ub>>)
        %alloc_19 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%alloc : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_19 : memref<64xf32, #hivm.address_space<ub>>)
        %70:7 = scf.for %arg28 = %c0_i32 to %69 step %c1_i32 iter_args(%arg29 = %alloc_18, %arg30 = %alloc_19, %arg31 = %alloc_17, %arg32 = %c0_i32, %arg33 = %c0_i32, %arg34 = %c0_i32, %arg35 = %c0_i32) -> (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          %107 = memref.load %22[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %107 {memref_ext.volatile} : i32
          %108 = arith.cmpi sgt, %107, %c0_i32 : i32
          %109 = memref.load %23[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %109 {memref_ext.volatile} : i32
          %110 = arith.cmpi slt, %109, %c2_i32 : i32
          %111 = arith.andi %108, %110 : i1
          %112 = arith.cmpi slt, %arg34, %c3_i32 : i32
          %113 = arith.cmpi slt, %arg35, %c3_i32 : i32
          %114 = arith.andi %112, %113 : i1
          %115 = arith.cmpi slt, %arg32, %56 : i32
          %116 = arith.andi %111, %114 : i1
          %117 = arith.andi %116, %115 : i1
          %118:4 = scf.if %117 -> (memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %128 = arith.remsi %arg32, %c2_i32 : i32
            %129 = arith.cmpi eq, %128, %c0_i32 : i32
            %130 = arith.select %129, %alloc_7, %alloc_7 : memref<64x256xf32, #hivm.address_space<ub>>
            scf.if %129 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 2
            }
            %131 = arith.cmpi sge, %arg32, %50 : i32
            %132 = arith.extui %131 : i1 to i32
            %133 = arith.muli %132, %57 : i32
            %134 = arith.addi %arg32, %133 : i32
            %135 = arith.muli %134, %c256_i32 : i32
            %136 = arith.cmpi slt, %135, %c4_i32 : i32
            %137 = arith.extui %136 : i1 to i32
            %138 = arith.subi %46, %135 : i32
            %139 = arith.cmpi sle, %138, %c1023_i32 : i32
            %140 = arith.extui %139 : i1 to i32
            %141 = arith.subi %c1_i32, %137 : i32
            %142 = arith.muli %137, %140 : i32
            %143 = arith.addi %141, %142 : i32
            %144 = arith.muli %67, %143 : i32
            %145 = arith.subi %c1_i32, %144 : i32
            %146 = arith.muli %145, %135 : i32
            %147 = arith.subi %135, %65 : i32
            %148 = arith.maxsi %147, %c5_i32 : i32
            %149 = arith.muli %144, %148 : i32
            %150 = arith.addi %146, %149 : i32
            %151 = arith.muli %150, %61 : i32
            %152 = arith.index_cast %151 : i32 to index
            %153 = affine.apply #map10()[%152, %68]
            %reinterpret_cast_32 = memref.reinterpret_cast %arg22 to offset: [%153], sizes: [128, 256], strides: [2816, 1] : memref<?xi8, #hivm.address_space<gm>> to memref<128x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>
            %subview_33 = memref.subview %reinterpret_cast_32[%11, 0] [64, 256] [1, 1] : memref<128x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_34 = memref.alloc() : memref<64x256xi8, #hivm.address_space<ub>>
            annotation.mark %alloc_34 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x256xi8, #hivm.address_space<ub>>
            hivm.hir.load ins(%subview_33 : memref<64x256xi8, strided<[2816, 1], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_34 : memref<64x256xi8, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
            %alloc_35 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_0(%alloc_34, %130, %arg10, %alloc_35, %130) {hivm.vector_function, no_inline} : (memref<64x256xi8, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>, f32, memref<64xf32, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>) -> ()
            %alloc_36 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_37 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_38 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_39 = memref.alloc() : memref<16x65x16x1xbf16, #hivm.address_space<ub>>
            %subview_40 = memref.subview %alloc_39[0, 0, 0, 0] [16, 64, 16, 1] [1, 1, 1, 1] : memref<16x65x16x1xbf16, #hivm.address_space<ub>> to memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_outlined_vf_1(%arg29, %alloc_35, %alloc_36, %alloc_37, %130, %alloc_38, %subview_40) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x256xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
            %expand_shape = memref.expand_shape %subview_40 [[0], [1, 2], [3]] output_shape [16, 4, 16, 16] : memref<16x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
            scf.if %129 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
              %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_41 = memref.collapse_shape %subview [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape : memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_41 : memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
              %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_41 = memref.collapse_shape %subview_6 [[0], [1, 2, 3]] : memref<16x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape : memref<16x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_41 : memref<16x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
            }
            %154 = arith.remsi %arg32, %c3_i32 : i32
            %155 = arith.cmpi eq, %154, %c0_i32 : i32
            scf.if %155 {
              hivm.hir.copy ins(%alloc_36 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_11 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              hivm.hir.copy ins(%alloc_38 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_14 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
            } else {
              %163 = arith.cmpi eq, %154, %c1_i32 : i32
              scf.if %163 {
                hivm.hir.copy ins(%alloc_36 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_12 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%alloc_38 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_15 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              } else {
                hivm.hir.copy ins(%alloc_36 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_13 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
                hivm.hir.copy ins(%alloc_38 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_16 : memref<64xf32, #hivm.address_space<ub>>) {tiled_op}
              }
            }
            %156 = memref.load %22[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %156 {memref_ext.volatile} : i32
            %157 = arith.subi %156, %c1_i32 : i32
            memref.store %157, %22[] : memref<i32, #hivm.address_space<ssbuf>>
            %158 = memref.load %23[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %158 {memref_ext.volatile} : i32
            %159 = arith.addi %158, %c1_i32 : i32
            memref.store %159, %23[] : memref<i32, #hivm.address_space<ssbuf>>
            %160 = arith.addi %arg34, %c1_i32 : i32
            %161 = arith.addi %arg35, %c1_i32 : i32
            %162 = arith.addi %arg32, %c1_i32 : i32
            scf.yield %alloc_37, %160, %161, %162 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg29, %arg34, %arg35, %arg32 : memref<64xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          %119 = memref.load %21[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %119 {memref_ext.volatile} : i32
          %120 = arith.cmpi sgt, %119, %c0_i32 : i32
          %121 = arith.cmpi sgt, %118#1, %c0_i32 : i32
          %122 = arith.cmpi sgt, %118#2, %c0_i32 : i32
          %123 = arith.andi %121, %122 : i1
          %124 = arith.cmpi slt, %arg33, %56 : i32
          %125 = arith.andi %120, %123 : i1
          %126 = arith.andi %125, %124 : i1
          %127:5 = scf.if %126 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32) {
            %128 = arith.remsi %arg33, %c2_i32 : i32
            %129 = arith.cmpi eq, %128, %c0_i32 : i32
            %130 = arith.remsi %arg33, %c3_i32 : i32
            %131 = arith.cmpi eq, %130, %c0_i32 : i32
            %132:2 = scf.if %131 -> (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) {
              scf.yield %alloc_14, %alloc_11 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            } else {
              %139 = arith.cmpi eq, %130, %c1_i32 : i32
              %140 = arith.select %139, %alloc_15, %alloc_16 : memref<64xf32, #hivm.address_space<ub>>
              %141 = arith.select %139, %alloc_12, %alloc_13 : memref<64xf32, #hivm.address_space<ub>>
              scf.yield %140, %141 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
            }
            %133 = arith.select %129, %alloc_9, %alloc_10 : memref<64x128xf32, #hivm.address_space<ub>>
            scf.if %129 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 3
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 6
            }
            %alloc_32 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
            %alloc_33 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
            func.call @_swa_fwd_kernel_mix_aiv_fused_2_outlined_merged_vf_0(%arg30, %132#1, %132#0, %alloc_32, %132#1, %133, %arg31, %alloc_33) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
            scf.if %129 {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
            } else {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
            } {ssbuffer.cross_buffer = 1 : i32}
            %134 = memref.load %21[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %134 {memref_ext.volatile} : i32
            %135 = arith.subi %134, %c1_i32 : i32
            memref.store %135, %21[] : memref<i32, #hivm.address_space<ssbuf>>
            %136 = arith.subi %118#1, %c1_i32 : i32
            %137 = arith.subi %118#2, %c1_i32 : i32
            %138 = arith.addi %arg33, %c1_i32 : i32
            scf.yield %alloc_32, %alloc_33, %136, %137, %138 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          } else {
            scf.yield %arg30, %arg31, %118#1, %118#2, %arg33 : memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32
          }
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %118#0, %127#0, %127#1, %118#3, %127#4, %127#2, %127#3 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, i32, i32, i32, i32
        }
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
        %71 = arith.remsi %arg27, %c12_i32 : i32
        %72 = arith.muli %71, %arg15 : i32
        %73 = arith.index_cast %72 : i32 to index
        %74 = arith.maxsi %42, %c0_i32 : i32
        %75 = arith.index_cast %74 : i32 to index
        %76 = affine.apply #map2()[%40, %75]
        %77 = arith.subi %c0_i32, %42 : i32
        %78 = arith.maxsi %77, %c0_i32 : i32
        %79 = arith.index_cast %78 : i32 to index
        %80 = arith.index_cast %42 : i32 to index
        %81 = affine.apply #map11()[%80, %73, %39]
        %82 = affine.apply #map12()[%80]
        %reinterpret_cast_20 = memref.reinterpret_cast %arg4 to offset: [%81], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %83 = arith.maxsi %80, %40 : index
        %84 = arith.minsi %82, %83 : index
        %85 = affine.apply #map2()[%84, %80]
        %86 = arith.minsi %11, %85 : index
        %87 = affine.apply #map13()[%86, %84, %80]
        %88 = arith.minsi %87, %c64 : index
        %subview_21 = memref.subview %reinterpret_cast_20[%11] [%88] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %89 = arith.muli %71, %arg12 : i32
        %90 = arith.index_cast %89 : i32 to index
        %91 = affine.apply #map1()[%75, %8, %36, %90]
        %reinterpret_cast_22 = memref.reinterpret_cast %arg2 to offset: [%91], sizes: [128, 128], strides: [%8, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %92 = arith.maxsi %76, %c0 : index
        %93 = arith.minsi %92, %c128 : index
        %94 = arith.minsi %79, %93 : index
        %95 = affine.apply #map2()[%93, %94]
        %96 = arith.minsi %11, %95 : index
        %97 = affine.apply #map13()[%96, %93, %94]
        %98 = arith.minsi %97, %c64 : index
        %subview_23 = memref.subview %reinterpret_cast_22[%11, 0] [%98, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %99 = arith.muli %71, %arg14 : i32
        %100 = arith.index_cast %99 : i32 to index
        %101 = affine.apply #map1()[%75, %9, %38, %100]
        %reinterpret_cast_24 = memref.reinterpret_cast %arg3 to offset: [%101], sizes: [128, 128], strides: [%9, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_25 = memref.subview %reinterpret_cast_24[%11, 0] [%98, 128] [1, 1] : memref<128x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_26 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
        %alloc_27 = memref.alloc() {alignment = 64 : i64} : memref<64x128xbf16, #hivm.address_space<ub>>
        %alloc_28 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
        func.call @_swa_fwd_kernel_mix_aiv_fused_4_outlined_merged_vf_0(%70#0, %70#1, %alloc_26, %70#1, %70#2, %alloc_27, %alloc_28) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xbf16, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
        %subview_29 = memref.subview %alloc_26[0] [%88] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        %102 = arith.maxsi %94, %11 : index
        %103 = arith.minsi %93, %13 : index
        %104 = arith.maxsi %102, %103 : index
        %105 = affine.apply #map2()[%104, %102]
        %106 = affine.apply #map14()[%102, %10]
        %subview_30 = memref.subview %alloc_27[%106, 0] [%105, 128] [1, 1] : memref<64x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_31 = memref.subview %alloc_28[%106, 0] [%105, 128] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.store ins(%subview_29 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%subview_21 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
        hivm.hir.store ins(%subview_30 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_23 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
        hivm.hir.store ins(%subview_31 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_25 : memref<?x128xf32, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) {autoblockify.dma, tiled_op}
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}


