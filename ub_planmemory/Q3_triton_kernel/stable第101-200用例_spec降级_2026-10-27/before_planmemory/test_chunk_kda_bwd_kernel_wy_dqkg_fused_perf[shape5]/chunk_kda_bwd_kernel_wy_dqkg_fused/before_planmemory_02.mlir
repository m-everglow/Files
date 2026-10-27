#map = affine_map<()[s0, s1] -> (s0 + s1 * 6144)>
#map1 = affine_map<()[s0, s1] -> (s0 - s1)>
#map2 = affine_map<()[s0, s1] -> ((s0 - s1) ceildiv 16)>
#map3 = affine_map<()[s0] -> (s0 floordiv 16)>
#map4 = affine_map<()[s0] -> (s0 mod 16)>
#map5 = affine_map<()[s0, s1] -> (s0 + s1 * 12288)>
#map6 = affine_map<()[s0] -> (s0 + 64)>
#map7 = affine_map<()[s0, s1] -> (s0 + s1)>
#map8 = affine_map<(d0) -> (d0, 0)>
#map9 = affine_map<(d0) -> (0, d0)>
#map10 = affine_map<()[s0] -> (s0 + 4)>
#map11 = affine_map<()[s0] -> (s0 + 8)>
#map12 = affine_map<()[s0] -> (s0 + 12)>
#map13 = affine_map<()[s0] -> (s0 + 16)>
#map14 = affine_map<()[s0] -> (s0 + 20)>
#map15 = affine_map<()[s0] -> (s0 + 24)>
#map16 = affine_map<()[s0] -> (s0 + 28)>
#map17 = affine_map<()[s0] -> (s0 + 32)>
#map18 = affine_map<()[s0] -> (s0 + 36)>
#map19 = affine_map<()[s0] -> (s0 + 40)>
#map20 = affine_map<()[s0] -> (s0 + 44)>
#map21 = affine_map<()[s0] -> (s0 + 48)>
#map22 = affine_map<()[s0] -> (s0 + 52)>
#map23 = affine_map<()[s0] -> (s0 + 56)>
#map24 = affine_map<()[s0] -> (s0 + 60)>
#map25 = affine_map<(d0) -> (d0 * 16)>
#map26 = affine_map<()[s0] -> (s0 + 2)>
#map27 = affine_map<()[s0] -> (s0 + 6)>
#map28 = affine_map<()[s0] -> (s0 + 10)>
#map29 = affine_map<()[s0] -> (s0 + 14)>
#map30 = affine_map<()[s0] -> (s0 + 18)>
#map31 = affine_map<()[s0] -> (s0 + 22)>
#map32 = affine_map<()[s0] -> (s0 + 26)>
#map33 = affine_map<()[s0] -> (s0 + 30)>
#map34 = affine_map<()[s0] -> (s0 * 2048)>
#map35 = affine_map<()[s0] -> (s0 * 2048 + 1024)>
#map36 = affine_map<()[s0] -> (s0 * 32)>
#map37 = affine_map<()[s0] -> (s0 * 64)>
#map38 = affine_map<()[s0] -> (s0 * 4)>
#map39 = affine_map<()[s0] -> (s0 * 2)>
#map40 = affine_map<()[s0] -> (s0 * 32 + 32)>
#map41 = affine_map<()[s0, s1, s2] -> (-s0 + s1 - s2)>
#map42 = affine_map<()[s0, s1] -> (s0 - s1 * 32)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<MIX>, ssbuffer.insertionOptimization} {
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_backup(%arg0: memref<?xi8> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xbf16> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg19: f32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32) attributes {DirectlyUsedGMArgIdxList = [17, 7], SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, annotation.filter_passes = #annotation.filter_passes<"hivm-insert-anchors-and-backup,hivm-delayed-cross-core-gss,split-simt-module,hivm-merge-same-preload-scopes">, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<24xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.backup_function, hivm.func_core_type = #hivm.func_core_type<MIX>, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
    hivm.hir.anchor {id = 0 : i64}
    %c64_i32 = arith.constant 64 : i32
    %c96_i32 = arith.constant 96 : i32
    %c0_i64 = arith.constant 0 : i64
    %cst = arith.constant 0.000000e+00 : f32
    %c64 = arith.constant 64 : index
    %c96_i64 = arith.constant 96 : i64
    %c128_i64 = arith.constant 128 : i64
    %c64_i64 = arith.constant 64 : i64
    %c0_i32 = arith.constant 0 : i32
    %c12288_i64 = arith.constant 12288 : i64
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %c16384_i64 = arith.constant 16384 : i64
    %c63_i32 = arith.constant 63 : i32
    %c0 = arith.constant 0 : index
    %c128 = arith.constant 128 : index
    %cst_1 = arith.constant 1.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %cst_2 = arith.constant 0.693147182 : f32
    %cst_3 = arith.constant 0.000000e+00 : f16
    %cst_4 = arith.constant -1.000000e+00 : f16
    %cst_5 = arith.constant -1.000000e+00 : f32
    %true = arith.constant true
    %false = arith.constant false
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg21, %arg22 : i32
    %1 = arith.muli %0, %arg23 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.anchor {id = 1 : i64}
    scf.for %arg24 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %4 = arith.remsi %arg24, %arg21 : i32
      %5 = arith.divsi %arg24, %arg21 : i32
      %6 = arith.remsi %5, %arg22 : i32
      %7 = tensor.empty() : tensor<64x128xf32>
      hivm.hir.anchor {id = 3 : i64}
      %8 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%cst : f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 4 : i64}
      %9 = tensor.empty() : tensor<128xf32>
      %10 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%cst : f32) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 5 : i64}
      %11 = tensor.empty() : tensor<64xf32>
      %12 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%cst : f32) outs(%11 : tensor<64xf32>) -> tensor<64xf32>
      hivm.hir.anchor {id = 6 : i64}
      %13 = arith.divsi %6, %c96_i32 : i32
      %14 = arith.remsi %6, %c96_i32 : i32
      %15 = arith.extsi %arg20 : i32 to i64
      %16 = arith.addi %arg20, %c63_i32 : i32
      %17 = arith.divsi %16, %c64_i32 : i32
      %18 = arith.muli %13, %17 : i32
      %19 = arith.addi %18, %4 : i32
      %20 = arith.extsi %19 : i32 to i64
      %21 = arith.muli %13, %arg20 : i32
      %22 = arith.extsi %21 : i32 to i64
      %23 = arith.muli %4, %c64_i32 : i32
      %24 = tensor.empty() : tensor<64xi32>
      %25 = hivm.hir.varange offset[%c0] strides[%c1] outs(%24 : tensor<64xi32>) -> tensor<64xi32>
      hivm.hir.anchor {id = 7 : i64}
      %26 = arith.extsi %23 : i32 to i64
      %27 = hivm.hir.vadd ins(%25, %23 : tensor<64xi32>, i32) outs(%24 : tensor<64xi32>) -> tensor<64xi32>
      hivm.hir.anchor {id = 8 : i64}
      %28 = tensor.empty() : tensor<64xi1>
      %29 = hivm.hir.vcmp ins(%27, %arg20 : tensor<64xi32>, i32) outs(%28 : tensor<64xi1>) compare_mode = <lt> -> tensor<64xi1>
      hivm.hir.anchor {id = 9 : i64}
      %30 = arith.addi %23, %c64_i32 : i32
      %31 = arith.minsi %arg20, %30 : i32
      %32 = arith.subi %31, %c1_i32 : i32
      %33 = hivm.hir.vcmp ins(%27, %32 : tensor<64xi32>, i32) outs(%28 : tensor<64xi1>) -> tensor<64xi1>
      hivm.hir.anchor {id = 10 : i64}
      %34 = arith.muli %22, %c96_i64 : i64
      %35 = arith.extsi %14 : i32 to i64
      %36 = arith.addi %34, %35 : i64
      %37 = arith.muli %36, %c128_i64 : i64
      %38 = arith.index_cast %37 : i64 to index
      %39 = arith.muli %36, %c64_i64 : i64
      %40 = arith.index_cast %39 : i64 to index
      %41 = arith.muli %20, %c96_i64 : i64
      %42 = arith.addi %41, %35 : i64
      %43 = arith.muli %42, %c16384_i64 : i64
      %44 = arith.index_cast %43 : i64 to index
      %45 = arith.muli %26, %c96_i64 : i64
      %46 = arith.addi %36, %45 : i64
      %47 = arith.subi %15, %26 : i64
      %48 = arith.maxsi %47, %c0_i64 : i64
      %49 = arith.minsi %48, %c64_i64 : i64
      %50 = arith.minsi %49, %c64_i64 : i64
      %51 = hivm.hir.stride_load ins(%arg7 : memref<?xf32>) outs(%11 : tensor<64xf32>) offset(%46 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%50 : i64]) {hivm.vf_mode = #hivm.vf_mode<SIMT>} -> tensor<64xf32>
      hivm.hir.anchor {id = 11 : i64}
      %52 = arith.maxsi %23, %c0_i32 : i32
      %53 = arith.index_cast %52 : i32 to index
      %54 = affine.apply #map()[%40, %53]
      %55 = arith.index_cast %arg20 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg8 to offset: [%54], sizes: [64, 64], strides: [6144, 1] : memref<?xbf16> to memref<64x64xbf16, strided<[6144, 1], offset: ?>>
      %56 = affine.apply #map1()[%55, %53]
      %57 = arith.maxsi %56, %c0 : index
      %58 = arith.minsi %57, %c64 : index
      %59 = arith.subi %c0_i32, %23 : i32
      %60 = arith.maxsi %59, %c0_i32 : i32
      %61 = arith.index_cast %60 : i32 to index
      %62 = arith.minsi %61, %58 : index
      %63 = affine.apply #map1()[%58, %62]
      %64 = arith.cmpi slt, %63, %c64 : index
      %subview = memref.subview %reinterpret_cast[0, 0] [%63, 64] [1, 1] : memref<64x64xbf16, strided<[6144, 1], offset: ?>> to memref<?x64xbf16, strided<[6144, 1], offset: ?>>
      %cast = memref.cast %subview : memref<?x64xbf16, strided<[6144, 1], offset: ?>> to memref<?x?xbf16, strided<[6144, 1], offset: ?>>
      %65 = affine.apply #map2()[%58, %62]
      %66 = affine.apply #map3()[%62]
      %67 = affine.apply #map4()[%62]
      %alloc = memref.alloc() : memref<4x4x16x16xbf16>
      %subview_6 = memref.subview %alloc[0, %66, %67, 0] [4, %65, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xbf16> to memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_7 = memref.cast %subview_6 : memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 12 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast : memref<?x?xbf16, strided<[6144, 1], offset: ?>>) outs(%cast_7 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %64 : i1
      hivm.hir.anchor {id = 13 : i64}
      %68 = bufferization.to_tensor %alloc restrict writable : memref<4x4x16x16xbf16>
      %69 = affine.apply #map5()[%38, %53]
      %reinterpret_cast_8 = memref.reinterpret_cast %arg3 to offset: [%69], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[12288, 1], offset: ?>>
      %reinterpret_cast_9 = memref.reinterpret_cast %arg6 to offset: [%69], sizes: [64, 128], strides: [12288, 1] : memref<?xf32> to memref<64x128xf32, strided<[12288, 1], offset: ?>>
      %alloc_10 = memref.alloc() : memref<64x128xbf16>
      %subview_11 = memref.subview %reinterpret_cast_8[0, 0] [%63, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>>
      %subview_12 = memref.subview %alloc_10[%62, 0] [%63, 128] [1, 1] : memref<64x128xbf16> to memref<?x128xbf16, strided<[128, 1], offset: ?>>
      hivm.hir.anchor {id = 14 : i64}
      hivm.hir.load ins(%subview_11 : memref<?x128xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_12 : memref<?x128xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 init_out_buffer = true init_condition = %64 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 15 : i64}
      %70 = bufferization.to_tensor %alloc_10 restrict writable : memref<64x128xbf16>
      %alloc_13 = memref.alloc() : memref<64x128xf32>
      %subview_14 = memref.subview %reinterpret_cast_9[0, 0] [%63, 128] [1, 1] : memref<64x128xf32, strided<[12288, 1], offset: ?>> to memref<?x128xf32, strided<[12288, 1], offset: ?>>
      %subview_15 = memref.subview %alloc_13[%62, 0] [%63, 128] [1, 1] : memref<64x128xf32> to memref<?x128xf32, strided<[128, 1], offset: ?>>
      hivm.hir.anchor {id = 16 : i64}
      hivm.hir.load ins(%subview_14 : memref<?x128xf32, strided<[12288, 1], offset: ?>>) outs(%subview_15 : memref<?x128xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 init_out_buffer = true init_condition = %64 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 17 : i64}
      %71 = bufferization.to_tensor %alloc_13 restrict writable : memref<64x128xf32>
      %72 = arith.extsi %32 : i32 to i64
      %73 = arith.muli %72, %c12288_i64 : i64
      %74 = arith.addi %37, %73 : i64
      %75 = arith.index_cast %74 : i64 to index
      %reinterpret_cast_16 = memref.reinterpret_cast %arg6 to offset: [%75], sizes: [128], strides: [1] : memref<?xf32> to memref<128xf32, strided<[1], offset: ?>>
      %alloc_17 = memref.alloc() : memref<128xf32>
      hivm.hir.anchor {id = 18 : i64}
      hivm.hir.load ins(%reinterpret_cast_16 : memref<128xf32, strided<[1], offset: ?>>) outs(%alloc_17 : memref<128xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 19 : i64}
      %76 = bufferization.to_tensor %alloc_17 restrict writable : memref<128xf32>
      %reinterpret_cast_18 = memref.reinterpret_cast %arg5 to offset: [%69], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[12288, 1], offset: ?>>
      %reinterpret_cast_19 = memref.reinterpret_cast %arg10 to offset: [%69], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[12288, 1], offset: ?>>
      %reinterpret_cast_20 = memref.reinterpret_cast %arg9 to offset: [%44], sizes: [128, 128], strides: [128, 1] : memref<?xf32> to memref<128x128xf32, strided<[128, 1], offset: ?>>
      %reinterpret_cast_21 = memref.reinterpret_cast %arg11 to offset: [%44], sizes: [128, 128], strides: [128, 1] : memref<?xf32> to memref<128x128xf32, strided<[128, 1], offset: ?>>
      %reinterpret_cast_22 = memref.reinterpret_cast %arg14 to offset: [%69], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[12288, 1], offset: ?>>
      %subview_23 = memref.subview %reinterpret_cast_18[0, 0] [%63, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>>
      %cast_24 = memref.cast %subview_23 : memref<?x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
      %alloc_25 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_26 = memref.subview %alloc_25[0, %66, %67, 0] [8, %65, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_27 = memref.cast %subview_26 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 20 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_24 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%cast_27 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %64 : i1
      hivm.hir.anchor {id = 21 : i64}
      %77 = bufferization.to_tensor %alloc_25 restrict writable : memref<8x4x16x16xbf16>
      %subview_28 = memref.subview %reinterpret_cast_19[0, 0] [%63, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>>
      %cast_29 = memref.cast %subview_28 : memref<?x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
      %alloc_30 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_31 = memref.subview %alloc_30[0, %66, %67, 0] [8, %65, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_32 = memref.cast %subview_31 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 22 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_29 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%cast_32 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %64 : i1
      hivm.hir.anchor {id = 23 : i64}
      %78 = bufferization.to_tensor %alloc_30 restrict writable : memref<8x4x16x16xbf16>
      %alloc_33 = memref.alloc() : memref<128x128xf32>
      hivm.hir.anchor {id = 24 : i64}
      hivm.hir.load ins(%reinterpret_cast_20 : memref<128x128xf32, strided<[128, 1], offset: ?>>) outs(%alloc_33 : memref<128x128xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 25 : i64}
      %79 = bufferization.to_tensor %alloc_33 restrict writable : memref<128x128xf32>
      %alloc_34 = memref.alloc() : memref<128x128xf32>
      hivm.hir.anchor {id = 26 : i64}
      hivm.hir.load ins(%reinterpret_cast_21 : memref<128x128xf32, strided<[128, 1], offset: ?>>) outs(%alloc_34 : memref<128x128xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 27 : i64}
      %80 = bufferization.to_tensor %alloc_34 restrict writable : memref<128x128xf32>
      %subview_35 = memref.subview %reinterpret_cast_22[0, 0] [%63, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>>
      %cast_36 = memref.cast %subview_35 : memref<?x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
      %alloc_37 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_38 = memref.subview %alloc_37[0, %66, %67, 0] [8, %65, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_39 = memref.cast %subview_38 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 28 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_36 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%cast_39 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %64 : i1
      hivm.hir.anchor {id = 29 : i64}
      %81 = bufferization.to_tensor %alloc_37 restrict writable : memref<8x4x16x16xbf16>
      %82 = tensor.empty() : tensor<128x128xf32>
      hivm.hir.anchor {id = 30 : i64}
      %83 = hivm.hir.vmul ins(%79, %80 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%82 : tensor<128x128xf32>) -> tensor<128x128xf32>
      hivm.hir.anchor {id = 31 : i64}
      %expanded = tensor.expand_shape %10 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
      %84 = hivm.hir.vreduce <sum> ins(%83 : tensor<128x128xf32>) outs(%expanded : tensor<1x128xf32>) reduce_dims = [0] -> tensor<1x128xf32>
      hivm.hir.anchor {id = 32 : i64}
      %collapsed = tensor.collapse_shape %84 [[0, 1]] : tensor<1x128xf32> into tensor<128xf32>
      %85 = tensor.empty() : tensor<128x128xbf16>
      %86 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%79 : tensor<128x128xf32>) outs(%85 : tensor<128x128xbf16>) -> tensor<128x128xbf16>
      hivm.hir.anchor {id = 33 : i64}
      %expanded_40 = tensor.expand_shape %86 [[0], [1, 2]] output_shape [128, 8, 16] : tensor<128x128xbf16> into tensor<128x8x16xbf16>
      %87 = tensor.empty() : tensor<8x128x16xbf16>
      %88 = hivm.hir.vtranspose ins(%expanded_40 : tensor<128x8x16xbf16>) outs(%87 : tensor<8x128x16xbf16>) permutation = [1, 0, 2] -> tensor<8x128x16xbf16>
      hivm.hir.anchor {id = 34 : i64}
      %expanded_41 = tensor.expand_shape %88 [[0], [1, 2], [3]] output_shape [8, 8, 16, 16] : tensor<8x128x16xbf16> into tensor<8x8x16x16xbf16>
      %alloc_42 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_42 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %89 = bufferization.to_tensor %alloc_42 restrict writable : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      hivm.hir.anchor {id = 35 : i64}
      hivm.hir.copy ins(%expanded_41 : tensor<8x8x16x16xbf16>) outs(%alloc_42 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 36 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %90 = tensor.empty() : tensor<8x4x16x16xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %91 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%78, %89, %true, %c64, %c128, %c128 : tensor<8x4x16x16xbf16>, tensor<8x8x16x16xbf16>, i1, index, index, index) outs(%90 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 37 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %alloc_43 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_43 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast = memref.memory_space_cast %alloc_43 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %92 = bufferization.to_tensor %memspacecast restrict writable : memref<64x128xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
      hivm.hir.anchor {id = 38 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%91 : tensor<8x4x16x16xf32>) outs(%alloc_43 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 39 : i64}
      %93 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%80 : tensor<128x128xf32>) outs(%85 : tensor<128x128xbf16>) -> tensor<128x128xbf16>
      hivm.hir.anchor {id = 40 : i64}
      %expanded_44 = tensor.expand_shape %93 [[0], [1, 2]] output_shape [128, 8, 16] : tensor<128x128xbf16> into tensor<128x8x16xbf16>
      %94 = hivm.hir.vtranspose ins(%expanded_44 : tensor<128x8x16xbf16>) outs(%87 : tensor<8x128x16xbf16>) permutation = [1, 0, 2] -> tensor<8x128x16xbf16>
      hivm.hir.anchor {id = 41 : i64}
      %expanded_45 = tensor.expand_shape %94 [[0], [1, 2], [3]] output_shape [8, 8, 16, 16] : tensor<8x128x16xbf16> into tensor<8x8x16x16xbf16>
      %alloc_46 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_46 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %95 = bufferization.to_tensor %alloc_46 restrict writable : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      hivm.hir.anchor {id = 42 : i64}
      hivm.hir.copy ins(%expanded_45 : tensor<8x8x16x16xbf16>) outs(%alloc_46 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 43 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %96 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%77, %95, %true, %c64, %c128, %c128 : tensor<8x4x16x16xbf16>, tensor<8x8x16x16xbf16>, i1, index, index, index) outs(%90 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 44 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      %alloc_47 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_47 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_48 = memref.memory_space_cast %alloc_47 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %97 = bufferization.to_tensor %memspacecast_48 restrict writable : memref<64x128xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 45 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%96 : tensor<8x4x16x16xf32>) outs(%alloc_47 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 46 : i64}
      %alloc_49 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_49 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %98 = bufferization.to_tensor %alloc_49 restrict writable : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      hivm.hir.anchor {id = 47 : i64}
      hivm.hir.copy ins(%expanded_41 : tensor<8x8x16x16xbf16>) outs(%alloc_49 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 48 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %99 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%81, %98, %true, %c64, %c128, %c128 : tensor<8x4x16x16xbf16>, tensor<8x8x16x16xbf16>, i1, index, index, index) outs(%90 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 49 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      %alloc_50 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_50 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_51 = memref.memory_space_cast %alloc_50 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %100 = bufferization.to_tensor %memspacecast_51 restrict writable : memref<64x128xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 50 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%99 : tensor<8x4x16x16xf32>) outs(%alloc_50 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 51 : i64}
      %reinterpret_cast_52 = memref.reinterpret_cast %arg4 to offset: [%69], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[12288, 1], offset: ?>>
      %reinterpret_cast_53 = memref.reinterpret_cast %arg15 to offset: [%69], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[12288, 1], offset: ?>>
      %alloc_54 = memref.alloc() : memref<64x128xbf16>
      %subview_55 = memref.subview %reinterpret_cast_52[0, 0] [%63, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>>
      %cast_56 = memref.cast %subview_55 : memref<?x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
      %subview_57 = memref.subview %alloc_54[%62, 0] [%63, 128] [1, 1] : memref<64x128xbf16> to memref<?x128xbf16, strided<[128, 1], offset: ?>>
      %alloc_58 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_59 = memref.subview %alloc_58[0, %66, %67, 0] [8, %65, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_60 = memref.cast %subview_59 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 52 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_56 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%cast_60 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %64 : i1
      hivm.hir.anchor {id = 53 : i64}
      %101 = bufferization.to_tensor %alloc_58 restrict writable : memref<8x4x16x16xbf16>
      hivm.hir.anchor {id = 54 : i64}
      hivm.hir.load ins(%subview_55 : memref<?x128xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_57 : memref<?x128xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 init_out_buffer = true init_condition = %64 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 55 : i64}
      %102 = bufferization.to_tensor %alloc_54 restrict writable : memref<64x128xbf16>
      %103 = tensor.empty() : tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 56 : i64}
      %104 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, hivm.remain_in_l0c, normalized_in_L0C} ins(%81, %101, %true, %c64, %c128, %c64 : tensor<8x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%103 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 57 : i64}
      %105 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%68, %81, %true, %c64, %c64, %c128 : tensor<4x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%90 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 58 : i64}
      %alloc_61 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_61 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_62 = memref.memory_space_cast %alloc_61 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %106 = bufferization.to_tensor %memspacecast_62 restrict writable : memref<64x128xf32>
      hivm.hir.anchor {id = 59 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%105 : tensor<8x4x16x16xf32>) outs(%alloc_61 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 60 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %expanded_63 = tensor.expand_shape %51 [[0, 1]] output_shape [64, 1] : tensor<64xf32> into tensor<64x1xf32>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %107 = hivm.hir.vmul ins(%106, %expanded_63 : tensor<64x128xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 61 : i64}
      %108 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%102 : tensor<64x128xbf16>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 62 : i64}
      %109 = hivm.hir.vmul ins(%106, %108 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 63 : i64}
      %expanded_64 = tensor.expand_shape %12 [[0, 1]] output_shape [64, 1] : tensor<64xf32> into tensor<64x1xf32>
      %110 = hivm.hir.vreduce <sum> ins(%109 : tensor<64x128xf32>) outs(%expanded_64 : tensor<64x1xf32>) reduce_dims = [1] -> tensor<64x1xf32>
      hivm.hir.anchor {id = 64 : i64}
      %collapsed_65 = tensor.collapse_shape %110 [[0, 1]] : tensor<64x1xf32> into tensor<64xf32>
      %111 = tensor.empty() : tensor<64x128xbf16>
      %112 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%107 : tensor<64x128xf32>) outs(%111 : tensor<64x128xbf16>) -> tensor<64x128xbf16>
      hivm.hir.anchor {id = 65 : i64}
      %extracted_slice = tensor.extract_slice %112[%62, 0] [%63, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xbf16> to tensor<?x128xbf16>
      hivm.hir.anchor {id = 66 : i64}
      %subview_66 = memref.subview %reinterpret_cast_53[0, 0] [%63, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice : tensor<?x128xbf16>) outs(%subview_66 : memref<?x128xbf16, strided<[12288, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 67 : i64}
      %113 = hivm.hir.vmul ins(%71, %cst_2 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 68 : i64}
      %114 = hivm.hir.vexp ins(%113 : tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 69 : i64}
      %115 = hivm.hir.vmul ins(%114, %expanded_63 : tensor<64x128xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 70 : i64}
      %116 = hivm.hir.vmul ins(%76, %cst_2 : tensor<128xf32>, f32) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 71 : i64}
      %117 = hivm.hir.vexp ins(%116 : tensor<128xf32>) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 72 : i64}
      %118 = hivm.hir.vmul ins(%collapsed, %117 : tensor<128xf32>, tensor<128xf32>) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 73 : i64}
      %119 = hivm.hir.vmul ins(%92, %114 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 74 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
      %120 = hivm.hir.vmul ins(%119, %arg19 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 75 : i64}
      %expanded_67 = tensor.expand_shape %76 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
      %121 = hivm.hir.vsub ins(%expanded_67, %71 : tensor<1x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [0] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 76 : i64}
      %122 = hivm.hir.vmul ins(%121, %cst_2 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 77 : i64}
      %123 = hivm.hir.vexp ins(%122 : tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 78 : i64}
      %124 = arith.index_cast %23 : i32 to index
      %125 = affine.apply #map6()[%124]
      %126 = arith.maxsi %124, %55 : index
      %127 = arith.minsi %125, %126 : index
      %128 = affine.apply #map1()[%127, %124]
      %extracted_slice_68 = tensor.extract_slice %123[0, 0] [%128, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 79 : i64}
      %inserted_slice = tensor.insert_slice %extracted_slice_68 into %8[0, 0] [%128, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<?x128xf32> into tensor<64x128xf32>
      hivm.hir.anchor {id = 80 : i64}
      %129 = hivm.hir.vmul ins(%97, %inserted_slice : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 81 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
      %130 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%70 : tensor<64x128xbf16>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 82 : i64}
      %131 = hivm.hir.vmul ins(%130, %114 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 83 : i64}
      %132 = hivm.hir.vmul ins(%100, %cst_5 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 84 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
      %133 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%132 : tensor<64x128xf32>) outs(%111 : tensor<64x128xbf16>) -> tensor<64x128xbf16>
      hivm.hir.anchor {id = 85 : i64}
      %134 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%131 : tensor<64x128xf32>) outs(%111 : tensor<64x128xbf16>) -> tensor<64x128xbf16>
      hivm.hir.anchor {id = 86 : i64}
      %expanded_69 = tensor.expand_shape %133 [[0], [1, 2]] output_shape [64, 8, 16] : tensor<64x128xbf16> into tensor<64x8x16xbf16>
      %135 = tensor.empty() : tensor<8x64x16xbf16>
      %136 = hivm.hir.vtranspose ins(%expanded_69 : tensor<64x8x16xbf16>) outs(%135 : tensor<8x64x16xbf16>) permutation = [1, 0, 2] -> tensor<8x64x16xbf16>
      hivm.hir.anchor {id = 87 : i64}
      %expanded_70 = tensor.expand_shape %136 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : tensor<8x64x16xbf16> into tensor<8x4x16x16xbf16>
      %alloc_71 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_71 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %137 = bufferization.to_tensor %alloc_71 restrict writable : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      hivm.hir.anchor {id = 88 : i64}
      hivm.hir.copy ins(%expanded_70 : tensor<8x4x16x16xbf16>) outs(%alloc_71 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 89 : i64}
      %expanded_72 = tensor.expand_shape %134 [[0], [1, 2]] output_shape [64, 8, 16] : tensor<64x128xbf16> into tensor<64x8x16xbf16>
      %138 = hivm.hir.vtranspose ins(%expanded_72 : tensor<64x8x16xbf16>) outs(%135 : tensor<8x64x16xbf16>) permutation = [1, 0, 2] -> tensor<8x64x16xbf16>
      hivm.hir.anchor {id = 90 : i64}
      %expanded_73 = tensor.expand_shape %138 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : tensor<8x64x16xbf16> into tensor<8x4x16x16xbf16>
      %alloc_74 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_74 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %139 = bufferization.to_tensor %alloc_74 restrict writable : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 91 : i64}
      hivm.hir.copy ins(%expanded_73 : tensor<8x4x16x16xbf16>) outs(%alloc_74 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 92 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %140 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%137, %139, %false, %c64, %c128, %c64 : tensor<8x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%104 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 93 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      %alloc_75 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_75 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast_76 = memref.memory_space_cast %alloc_75 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %141 = bufferization.to_tensor %memspacecast_76 restrict writable : memref<64x64xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 94 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%140 : tensor<4x4x16x16xf32>) outs(%alloc_75 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 95 : i64}
      %alloc_77 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_77 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %142 = bufferization.to_tensor %alloc_77 restrict writable : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      hivm.hir.anchor {id = 96 : i64}
      hivm.hir.copy ins(%expanded_70 : tensor<8x4x16x16xbf16>) outs(%alloc_77 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 97 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %143 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%68, %142, %true, %c64, %c64, %c128 : tensor<4x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%90 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 98 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      %alloc_78 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_78 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_79 = memref.memory_space_cast %alloc_78 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %144 = bufferization.to_tensor %memspacecast_79 restrict writable : memref<64x128xf32>
      hivm.hir.anchor {id = 99 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%143 : tensor<8x4x16x16xf32>) outs(%alloc_78 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 100 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %145 = hivm.hir.vmul ins(%144, %131 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 101 : i64}
      %146 = hivm.hir.vreduce <sum> ins(%145 : tensor<64x128xf32>) outs(%expanded_64 : tensor<64x1xf32>) reduce_dims = [1] -> tensor<64x1xf32>
      hivm.hir.anchor {id = 102 : i64}
      %collapsed_80 = tensor.collapse_shape %146 [[0, 1]] : tensor<64x1xf32> into tensor<64xf32>
      %147 = hivm.hir.vadd ins(%collapsed_65, %collapsed_80 : tensor<64xf32>, tensor<64xf32>) outs(%11 : tensor<64xf32>) -> tensor<64xf32>
      hivm.hir.anchor {id = 103 : i64}
      %reinterpret_cast_81 = memref.reinterpret_cast %arg2 to offset: [%69], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[12288, 1], offset: ?>>
      %alloc_82 = memref.alloc() : memref<64x128xbf16>
      %subview_83 = memref.subview %reinterpret_cast_81[0, 0] [%63, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>>
      %subview_84 = memref.subview %alloc_82[%62, 0] [%63, 128] [1, 1] : memref<64x128xbf16> to memref<?x128xbf16, strided<[128, 1], offset: ?>>
      hivm.hir.anchor {id = 104 : i64}
      hivm.hir.load ins(%subview_83 : memref<?x128xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_84 : memref<?x128xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 init_out_buffer = true init_condition = %64 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 105 : i64}
      %148 = bufferization.to_tensor %alloc_82 restrict writable : memref<64x128xbf16>
      hivm.hir.anchor {id = 106 : i64}
      %149 = hivm.hir.vmul ins(%130, %129 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 107 : i64}
      %150 = hivm.hir.vreduce <sum> ins(%149 : tensor<64x128xf32>) outs(%expanded : tensor<1x128xf32>) reduce_dims = [0] -> tensor<1x128xf32>
      hivm.hir.anchor {id = 108 : i64}
      %collapsed_85 = tensor.collapse_shape %150 [[0, 1]] : tensor<1x128xf32> into tensor<128xf32>
      %151 = hivm.hir.vadd ins(%118, %collapsed_85 : tensor<128xf32>, tensor<128xf32>) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 109 : i64}
      %152 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%148 : tensor<64x128xbf16>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 110 : i64}
      %153 = hivm.hir.vmul ins(%152, %120 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 111 : i64}
      %154 = hivm.hir.vsub ins(%153, %149 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 112 : i64}
      %expanded_86 = tensor.expand_shape %33 [[0, 1]] output_shape [64, 1] : tensor<64xi1> into tensor<64x1xi1>
      %155 = tensor.empty() : tensor<64x1xf32>
      %156 = hivm.hir.vsel ins(%expanded_86, %cst_1, %cst : tensor<64x1xi1>, f32, f32) outs(%155 : tensor<64x1xf32>) -> tensor<64x1xf32>
      hivm.hir.anchor {id = 113 : i64}
      %expanded_87 = tensor.expand_shape %151 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
      %157 = hivm.hir.vmul ins(%156, %expanded_87 : tensor<64x1xf32>, tensor<1x128xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [0, 1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 114 : i64}
      %158 = hivm.hir.vadd ins(%154, %157 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 115 : i64}
      %159 = hivm.hir.vmul ins(%145, %expanded_63 : tensor<64x128xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 116 : i64}
      %160 = hivm.hir.vadd ins(%158, %159 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 117 : i64}
      %161 = hivm.hir.vmul ins(%144, %115 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 118 : i64}
      %162 = hivm.hir.vadd ins(%129, %161 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 119 : i64}
      %reinterpret_cast_88 = memref.reinterpret_cast %arg12 to offset: [%69], sizes: [64, 128], strides: [12288, 1] : memref<?xf32> to memref<64x128xf32, strided<[12288, 1], offset: ?>>
      %reinterpret_cast_89 = memref.reinterpret_cast %arg13 to offset: [%69], sizes: [64, 128], strides: [12288, 1] : memref<?xf32> to memref<64x128xf32, strided<[12288, 1], offset: ?>>
      %reinterpret_cast_90 = memref.reinterpret_cast %arg16 to offset: [%69], sizes: [64, 128], strides: [12288, 1] : memref<?xf32> to memref<64x128xf32, strided<[12288, 1], offset: ?>>
      %extracted_slice_91 = tensor.extract_slice %120[%62, 0] [%63, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 120 : i64}
      %subview_92 = memref.subview %reinterpret_cast_88[0, 0] [%63, 128] [1, 1] : memref<64x128xf32, strided<[12288, 1], offset: ?>> to memref<?x128xf32, strided<[12288, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_91 : tensor<?x128xf32>) outs(%subview_92 : memref<?x128xf32, strided<[12288, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 121 : i64}
      %extracted_slice_93 = tensor.extract_slice %162[%62, 0] [%63, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 122 : i64}
      %subview_94 = memref.subview %reinterpret_cast_89[0, 0] [%63, 128] [1, 1] : memref<64x128xf32, strided<[12288, 1], offset: ?>> to memref<?x128xf32, strided<[12288, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_93 : tensor<?x128xf32>) outs(%subview_94 : memref<?x128xf32, strided<[12288, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 123 : i64}
      %extracted_slice_95 = tensor.extract_slice %160[%62, 0] [%63, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 124 : i64}
      %subview_96 = memref.subview %reinterpret_cast_90[0, 0] [%63, 128] [1, 1] : memref<64x128xf32, strided<[12288, 1], offset: ?>> to memref<?x128xf32, strided<[12288, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_95 : tensor<?x128xf32>) outs(%subview_96 : memref<?x128xf32, strided<[12288, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 125 : i64}
      %expanded_97 = tensor.expand_shape %27 [[0, 1]] output_shape [64, 1] : tensor<64xi32> into tensor<64x1xi32>
      %163 = tensor.empty() : tensor<64x64xi32>
      %164 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_97 : tensor<64x1xi32>) outs(%163 : tensor<64x64xi32>) broadcast_dims = [1] -> tensor<64x64xi32>
      hivm.hir.anchor {id = 126 : i64}
      %expanded_98 = tensor.expand_shape %27 [[0, 1]] output_shape [1, 64] : tensor<64xi32> into tensor<1x64xi32>
      %165 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_98 : tensor<1x64xi32>) outs(%163 : tensor<64x64xi32>) broadcast_dims = [0] -> tensor<64x64xi32>
      hivm.hir.anchor {id = 127 : i64}
      %166 = tensor.empty() : tensor<64x64xi1>
      %167 = hivm.hir.vcmp ins(%164, %165 : tensor<64x64xi32>, tensor<64x64xi32>) outs(%166 : tensor<64x64xi1>) compare_mode = <gt> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 128 : i64}
      %168 = tensor.empty() : tensor<64xf16>
      %169 = hivm.hir.vsel ins(%29, %cst_4, %cst_3 : tensor<64xi1>, f16, f16) outs(%168 : tensor<64xf16>) -> tensor<64xf16>
      hivm.hir.anchor {id = 129 : i64}
      %expanded_99 = tensor.expand_shape %169 [[0, 1]] output_shape [64, 1] : tensor<64xf16> into tensor<64x1xf16>
      %170 = tensor.empty() : tensor<64x64xf16>
      %171 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_99 : tensor<64x1xf16>) outs(%170 : tensor<64x64xf16>) broadcast_dims = [1] -> tensor<64x64xf16>
      hivm.hir.anchor {id = 130 : i64}
      %172 = hivm.hir.vcmp ins(%171, %cst_3 : tensor<64x64xf16>, f16) outs(%166 : tensor<64x64xi1>) compare_mode = <ne> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 131 : i64}
      %expanded_100 = tensor.expand_shape %169 [[0, 1]] output_shape [1, 64] : tensor<64xf16> into tensor<1x64xf16>
      %173 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_100 : tensor<1x64xf16>) outs(%170 : tensor<64x64xf16>) broadcast_dims = [0] -> tensor<64x64xf16>
      hivm.hir.anchor {id = 132 : i64}
      %174 = hivm.hir.vcmp ins(%173, %cst_3 : tensor<64x64xf16>, f16) outs(%166 : tensor<64x64xi1>) compare_mode = <ne> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 133 : i64}
      %175 = hivm.hir.vand ins(%172, %174 : tensor<64x64xi1>, tensor<64x64xi1>) outs(%166 : tensor<64x64xi1>) -> tensor<64x64xi1>
      hivm.hir.anchor {id = 134 : i64}
      %176 = hivm.hir.vand ins(%167, %175 : tensor<64x64xi1>, tensor<64x64xi1>) outs(%166 : tensor<64x64xi1>) -> tensor<64x64xi1>
      hivm.hir.anchor {id = 135 : i64}
      %expanded_101 = tensor.expand_shape %51 [[0, 1]] output_shape [1, 64] : tensor<64xf32> into tensor<1x64xf32>
      %177 = tensor.empty() : tensor<64x64xf32>
      %178 = hivm.hir.vmul ins(%141, %expanded_101 : tensor<64x64xf32>, tensor<1x64xf32>) outs(%177 : tensor<64x64xf32>) broadcast = [0] -> tensor<64x64xf32>
      hivm.hir.anchor {id = 136 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
      %179 = hivm.hir.vsel ins(%176, %178, %cst : tensor<64x64xi1>, tensor<64x64xf32>, f32) outs(%177 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 137 : i64}
      %180 = tensor.empty() : tensor<64x64xbf16>
      %181 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%179 : tensor<64x64xf32>) outs(%180 : tensor<64x64xbf16>) -> tensor<64x64xbf16>
      hivm.hir.anchor {id = 138 : i64}
      %expanded_102 = tensor.expand_shape %181 [[0], [1, 2]] output_shape [64, 4, 16] : tensor<64x64xbf16> into tensor<64x4x16xbf16>
      %182 = tensor.empty() : tensor<4x64x16xbf16>
      %183 = hivm.hir.vtranspose ins(%expanded_102 : tensor<64x4x16xbf16>) outs(%182 : tensor<4x64x16xbf16>) permutation = [1, 0, 2] -> tensor<4x64x16xbf16>
      hivm.hir.anchor {id = 139 : i64}
      %expanded_103 = tensor.expand_shape %183 [[0], [1, 2], [3]] output_shape [4, 4, 16, 16] : tensor<4x64x16xbf16> into tensor<4x4x16x16xbf16>
      %alloc_104 = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_104 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      %184 = bufferization.to_tensor %alloc_104 restrict writable : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      hivm.hir.anchor {id = 140 : i64}
      hivm.hir.copy ins(%expanded_103 : tensor<4x4x16x16xbf16>) outs(%alloc_104 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 141 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %185 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%184, %68, %true, %c64, %c64, %c64 : tensor<4x4x16x16xbf16>, tensor<4x4x16x16xbf16>, i1, index, index, index) outs(%103 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 142 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      %186 = tensor.empty() : tensor<4x4x16x16xbf16>
      %187 = hivm.hir.fixpipe {pre_quant = #hivm.fixpipe_pre_quant_mode<F322BF16>} ins(%185 : tensor<4x4x16x16xf32>) outs(%186 : tensor<4x4x16x16xbf16>) -> tensor<4x4x16x16xbf16>
      hivm.hir.anchor {id = 143 : i64}
      %188 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%68, %187, %true, %c64, %c64, %c64 : tensor<4x4x16x16xbf16>, tensor<4x4x16x16xbf16>, i1, index, index, index) outs(%103 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 144 : i64}
      %alloc_105 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_105 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast_106 = memref.memory_space_cast %alloc_105 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %189 = bufferization.to_tensor %memspacecast_106 restrict writable : memref<64x64xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.anchor {id = 145 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%188 : tensor<4x4x16x16xf32>) outs(%alloc_105 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 146 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %190 = hivm.hir.vmul ins(%189, %cst_5 : tensor<64x64xf32>, f32) outs(%177 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 147 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
      %191 = hivm.hir.vsel ins(%176, %190, %cst : tensor<64x64xi1>, tensor<64x64xf32>, f32) outs(%177 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 148 : i64}
      %reinterpret_cast_107 = memref.reinterpret_cast %arg18 to offset: [%54], sizes: [64, 64], strides: [6144, 1] : memref<?xf32> to memref<64x64xf32, strided<[6144, 1], offset: ?>>
      %extracted_slice_108 = tensor.extract_slice %191[%62, 0] [%63, 64] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x64xf32> to tensor<?x64xf32>
      hivm.hir.anchor {id = 149 : i64}
      %subview_109 = memref.subview %reinterpret_cast_107[0, 0] [%63, 64] [1, 1] : memref<64x64xf32, strided<[6144, 1], offset: ?>> to memref<?x64xf32, strided<[6144, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_108 : tensor<?x64xf32>) outs(%subview_109 : memref<?x64xf32, strided<[6144, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 150 : i64}
      hivm.hir.stride_store ins(%147 : tensor<64xf32>) outs(%arg17 : memref<?xf32>) offset(%46 : i64) strides([%c96_i64 : i64]) numels([%50 : i64]) {hivm.vf_mode = #hivm.vf_mode<SIMT>}
      hivm.hir.anchor {id = 151 : i64}
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.anchor {id = 152 : i64}
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_1_outlined_merged_merged_vf_0(%arg0: index, %arg1: memref<64xi32, #hivm.address_space<ub>>, %arg2: memref<32x128xbf16, #hivm.address_space<ub>>, %arg3: memref<32x128xf32, #hivm.address_space<ub>>, %arg4: memref<32x128xf32, #hivm.address_space<ub>>, %arg5: memref<128xf32, #hivm.address_space<ub>>, %arg6: memref<128xf32, #hivm.address_space<ub>>, %arg7: memref<32x128xf32, #hivm.address_space<ub>>, %arg8: memref<32x128xf32, #hivm.address_space<ub>>, %arg9: i32, %arg10: memref<32x128xf32, #hivm.address_space<ub>>, %arg11: memref<32x128xf32, #hivm.address_space<ub>>, %arg12: memref<32x128xf32, #hivm.address_space<ub>>, %arg13: memref<32x128xf32, #hivm.address_space<ub>>, %arg14: memref<32x128xf32, #hivm.address_space<ub>>, %arg15: memref<64xi32, #hivm.address_space<ub>>, %arg16: i32, %arg17: memref<64xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
    %cst = arith.constant dense<-1.000000e+00> : vector<64xf16>
    %cst_0 = arith.constant dense<0.000000e+00> : vector<64xf16>
    %cst_1 = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_2 = arith.constant dense<1.000000e+00> : vector<1x64xf32>
    %c0_i32 = arith.constant 0 : i32
    %cst_3 = arith.constant 0.000000e+00 : f32
    %cst_4 = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %arg9 : i32 to vector<1x64xi32>
    scf.for %arg18 = %c0 to %c32 step %c1 {
      %5 = affine.apply #map7()[%arg18, %arg0]
      %subview = memref.subview %arg1[%5] [1] [1] : memref<64xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %6 = vector.transfer_read %subview[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map8} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %7 = arith.cmpi eq, %6, %0 : vector<1x64xi32>
      %8 = arith.select %7, %cst_2, %cst_1 : vector<1x64xi1>, vector<1x64xf32>
      scf.for %arg19 = %c0 to %c128 step %c64 {
        %subview_5 = memref.subview %arg2[%arg18, %arg19] [1, 64] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_6 = memref.subview %arg3[%arg18, %arg19] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_7 = memref.subview %arg4[%arg18, %arg19] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_8 = memref.subview %arg5[%arg19] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_9 = memref.subview %arg6[%arg19] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_10 = memref.subview %arg7[%arg18, %arg19] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_11 = memref.subview %arg8[%arg18, %arg19] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_12 = memref.subview %arg10[%arg18, %arg19] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %9 = vector.transfer_read %subview_5[%c0, %c0], %cst_4 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
        %10 = vector.transfer_read %subview_6[%c0, %c0], %cst_3 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = vector.transfer_read %subview_7[%c0, %c0], %cst_3 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %12 = vector.transfer_read %subview_8[%c0], %cst_3 {in_bounds = [true, true], permutation_map = #map9} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %13 = vector.transfer_read %subview_9[%c0], %cst_3 {in_bounds = [true, true], permutation_map = #map9} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %14 = vector.transfer_read %subview_10[%c0, %c0], %cst_3 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %15 = vector.transfer_read %subview_11[%c0, %c0], %cst_3 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %16 = arith.mulf %14, %15 : vector<1x64xf32>
        %17 = arith.addf %12, %13 : vector<1x64xf32>
        %18 = arith.mulf %8, %17 : vector<1x64xf32>
        %19 = arith.extf %9 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
        %20 = arith.mulf %19, %10 : vector<1x64xf32>
        %21 = arith.subf %20, %11 : vector<1x64xf32>
        %22 = arith.addf %21, %18 : vector<1x64xf32>
        %23 = arith.addf %22, %16 : vector<1x64xf32>
        vector.transfer_write %23, %subview_12[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg18 = %c0 to %c32 step %c1 {
      scf.for %arg19 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg11[%arg18, %arg19] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_5 = memref.subview %arg12[%arg18, %arg19] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_6 = memref.subview %arg13[%arg18, %arg19] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_7 = memref.subview %arg14[%arg18, %arg19] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %5 = vector.transfer_read %subview[%c0, %c0], %cst_3 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %6 = vector.transfer_read %subview_5[%c0, %c0], %cst_3 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = vector.transfer_read %subview_6[%c0, %c0], %cst_3 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %8 = arith.mulf %6, %7 : vector<1x64xf32>
        %9 = arith.addf %5, %8 : vector<1x64xf32>
        vector.transfer_write %9, %subview_7[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    %1 = vector.transfer_read %arg15[%c0], %c0_i32 {in_bounds = [true]} : memref<64xi32, #hivm.address_space<ub>>, vector<64xi32>
    %2 = vector.broadcast %arg16 : i32 to vector<64xi32>
    %3 = arith.cmpi slt, %1, %2 : vector<64xi32>
    %4 = arith.select %3, %cst, %cst_0 : vector<64xi1>, vector<64xf16>
    vector.transfer_write %4, %arg17[%c0] {in_bounds = [true]} : vector<64xf16>, memref<64xf16, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_merged_vf_0(%arg0: memref<128xf32, #hivm.address_space<ub>>, %arg1: memref<64xi32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
    %cst = arith.constant dense<0> : vector<64xindex>
    %cst_0 = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63]> : vector<64xindex>
    %cst_1 = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c128 step %c64 {
      %subview = memref.subview %arg0[%arg2] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst_1, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    %0 = arith.addi %cst, %cst_0 : vector<64xindex>
    %1 = arith.index_cast %0 : vector<64xindex> to vector<64xi32>
    vector.transfer_write %1, %arg1[%c0] {in_bounds = [true]} : vector<64xi32>, memref<64xi32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg19: f32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32) attributes {DirectlyUsedGMArgIdxList = [17, 7], SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<24xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
    %c28_i32 = arith.constant 28 : i32
    %false = arith.constant false
    %true = arith.constant true
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : bf16
    %c0_i32 = arith.constant 0 : i32
    %c64_i64 = arith.constant 64 : i64
    %c128_i64 = arith.constant 128 : i64
    %c96_i64 = arith.constant 96 : i64
    %c64 = arith.constant 64 : index
    %c96_i32 = arith.constant 96 : i32
    %c64_i32 = arith.constant 64 : i32
    hivm.hir.anchor {id = 0 : i64}
    %0 = arith.muli %arg21, %arg22 : i32
    %1 = arith.muli %0, %arg23 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.anchor {id = 1 : i64}
    %4 = arith.index_cast %arg20 : i32 to index
    scf.for %arg24 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %5 = arith.remsi %arg24, %arg21 : i32
      %6 = arith.divsi %arg24, %arg21 : i32
      %7 = arith.remsi %6, %arg22 : i32
      hivm.hir.anchor {id = 3 : i64}
      hivm.hir.anchor {id = 4 : i64}
      hivm.hir.anchor {id = 5 : i64}
      hivm.hir.anchor {id = 6 : i64}
      %8 = arith.divsi %7, %c96_i32 : i32
      %9 = arith.remsi %7, %c96_i32 : i32
      %10 = arith.muli %8, %arg20 : i32
      %11 = arith.extsi %10 : i32 to i64
      %12 = arith.muli %5, %c64_i32 : i32
      hivm.hir.anchor {id = 7 : i64}
      hivm.hir.anchor {id = 8 : i64}
      hivm.hir.anchor {id = 9 : i64}
      hivm.hir.anchor {id = 10 : i64}
      %13 = arith.muli %11, %c96_i64 : i64
      %14 = arith.extsi %9 : i32 to i64
      %15 = arith.addi %13, %14 : i64
      %16 = arith.muli %15, %c128_i64 : i64
      %17 = arith.index_cast %16 : i64 to index
      %18 = arith.muli %15, %c64_i64 : i64
      %19 = arith.index_cast %18 : i64 to index
      hivm.hir.anchor {id = 11 : i64}
      %20 = arith.maxsi %12, %c0_i32 : i32
      %21 = arith.index_cast %20 : i32 to index
      %22 = affine.apply #map()[%19, %21]
      %reinterpret_cast = memref.reinterpret_cast %arg8 to offset: [%22], sizes: [64, 64], strides: [6144, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x64xbf16, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
      %23 = affine.apply #map1()[%4, %21]
      %24 = arith.maxsi %23, %c0 : index
      %25 = arith.minsi %24, %c64 : index
      %26 = arith.subi %c0_i32, %12 : i32
      %27 = arith.maxsi %26, %c0_i32 : i32
      %28 = arith.index_cast %27 : i32 to index
      %29 = arith.minsi %28, %25 : index
      %30 = affine.apply #map1()[%25, %29]
      %31 = arith.cmpi slt, %30, %c64 : index
      %subview = memref.subview %reinterpret_cast[0, 0] [%30, 64] [1, 1] : memref<64x64xbf16, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xbf16, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
      %cast = memref.cast %subview : memref<?x64xbf16, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
      %32 = affine.apply #map2()[%25, %29]
      %33 = affine.apply #map3()[%29]
      %34 = affine.apply #map4()[%29]
      %alloc = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_0 = memref.subview %alloc[0, %33, %34, 0] [4, %32, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_1 = memref.cast %subview_0 : memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 12 : i64}
      scf.if %31 {
        %collapse_shape = memref.collapse_shape %alloc [[0, 1, 2, 3]] : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<4096xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<4096xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast : memref<?x?xbf16, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_1 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 13 : i64}
      %35 = affine.apply #map5()[%17, %21]
      hivm.hir.anchor {id = 14 : i64}
      hivm.hir.anchor {id = 15 : i64}
      hivm.hir.anchor {id = 16 : i64}
      hivm.hir.anchor {id = 17 : i64}
      hivm.hir.anchor {id = 18 : i64}
      hivm.hir.anchor {id = 19 : i64}
      %reinterpret_cast_2 = memref.reinterpret_cast %arg5 to offset: [%35], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_3 = memref.reinterpret_cast %arg10 to offset: [%35], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_4 = memref.reinterpret_cast %arg14 to offset: [%35], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_5 = memref.subview %reinterpret_cast_2[0, 0] [%30, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_6 = memref.cast %subview_5 : memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_7 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_8 = memref.subview %alloc_7[0, %33, %34, 0] [8, %32, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_9 = memref.cast %subview_8 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 20 : i64}
      scf.if %31 {
        %collapse_shape = memref.collapse_shape %alloc_7 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_6 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_9 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 21 : i64}
      %subview_10 = memref.subview %reinterpret_cast_3[0, 0] [%30, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_11 = memref.cast %subview_10 : memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_12 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_13 = memref.subview %alloc_12[0, %33, %34, 0] [8, %32, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_14 = memref.cast %subview_13 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 22 : i64}
      scf.if %31 {
        %collapse_shape = memref.collapse_shape %alloc_12 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_11 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_14 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 23 : i64}
      hivm.hir.anchor {id = 24 : i64}
      hivm.hir.anchor {id = 25 : i64}
      hivm.hir.anchor {id = 26 : i64}
      hivm.hir.anchor {id = 27 : i64}
      %subview_15 = memref.subview %reinterpret_cast_4[0, 0] [%30, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_16 = memref.cast %subview_15 : memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_17 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_18 = memref.subview %alloc_17[0, %33, %34, 0] [8, %32, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_19 = memref.cast %subview_18 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 28 : i64}
      scf.if %31 {
        %collapse_shape = memref.collapse_shape %alloc_17 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_16 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_19 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 29 : i64}
      hivm.hir.anchor {id = 30 : i64}
      hivm.hir.anchor {id = 31 : i64}
      hivm.hir.anchor {id = 32 : i64}
      hivm.hir.anchor {id = 33 : i64}
      hivm.hir.anchor {id = 34 : i64}
      %alloc_20 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_20 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 35 : i64}
      hivm.hir.anchor {id = 36 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_21 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_12, %alloc_20, %true, %c64, %c128, %c128 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_21 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 37 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %alloc_22 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_22 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
      hivm.hir.anchor {id = 38 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_21 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_22 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 39 : i64}
      hivm.hir.anchor {id = 40 : i64}
      hivm.hir.anchor {id = 41 : i64}
      %alloc_23 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_23 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 42 : i64}
      hivm.hir.anchor {id = 43 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_24 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_7, %alloc_23, %true, %c64, %c128, %c128 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_24 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 44 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      %alloc_25 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_25 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 45 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_24 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_25 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 46 : i64}
      %alloc_26 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_26 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 47 : i64}
      hivm.hir.anchor {id = 48 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_27 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_17, %alloc_26, %true, %c64, %c128, %c128 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_27 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 49 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      %alloc_28 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_28 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 50 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_27 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_28 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 51 : i64}
      %reinterpret_cast_29 = memref.reinterpret_cast %arg4 to offset: [%35], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_30 = memref.subview %reinterpret_cast_29[0, 0] [%30, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_31 = memref.cast %subview_30 : memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_32 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_33 = memref.subview %alloc_32[0, %33, %34, 0] [8, %32, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_34 = memref.cast %subview_33 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 52 : i64}
      scf.if %31 {
        %collapse_shape = memref.collapse_shape %alloc_32 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_31 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_34 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 53 : i64}
      hivm.hir.anchor {id = 54 : i64}
      hivm.hir.anchor {id = 55 : i64}
      hivm.hir.anchor {id = 56 : i64}
      %alloc_35 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, hivm.remain_in_l0c, normalized_in_L0C} ins(%alloc_17, %alloc_32, %true, %c64, %c128, %c64 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_35 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 57 : i64}
      %alloc_36 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_17, %true, %c64, %c64, %c128 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_36 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 58 : i64}
      %alloc_37 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_37 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 59 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_36 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_37 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 60 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 61 : i64}
      hivm.hir.anchor {id = 62 : i64}
      hivm.hir.anchor {id = 63 : i64}
      hivm.hir.anchor {id = 64 : i64}
      hivm.hir.anchor {id = 65 : i64}
      hivm.hir.anchor {id = 66 : i64}
      hivm.hir.anchor {id = 67 : i64}
      hivm.hir.anchor {id = 68 : i64}
      hivm.hir.anchor {id = 69 : i64}
      hivm.hir.anchor {id = 70 : i64}
      hivm.hir.anchor {id = 71 : i64}
      hivm.hir.anchor {id = 72 : i64}
      hivm.hir.anchor {id = 73 : i64}
      hivm.hir.anchor {id = 74 : i64}
      hivm.hir.anchor {id = 75 : i64}
      hivm.hir.anchor {id = 76 : i64}
      hivm.hir.anchor {id = 77 : i64}
      hivm.hir.anchor {id = 78 : i64}
      hivm.hir.anchor {id = 79 : i64}
      hivm.hir.anchor {id = 80 : i64}
      hivm.hir.anchor {id = 81 : i64}
      hivm.hir.anchor {id = 82 : i64}
      hivm.hir.anchor {id = 83 : i64}
      hivm.hir.anchor {id = 84 : i64}
      hivm.hir.anchor {id = 85 : i64}
      hivm.hir.anchor {id = 86 : i64}
      hivm.hir.anchor {id = 87 : i64}
      %alloc_38 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_38 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = -1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 88 : i64}
      hivm.hir.anchor {id = 89 : i64}
      hivm.hir.anchor {id = 90 : i64}
      %alloc_39 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_39 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = -1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 91 : i64}
      hivm.hir.anchor {id = 92 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_38, %alloc_39, %false, %c64, %c128, %c64 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_35 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 93 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      %alloc_40 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_40 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 94 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_35 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_40 : memref<64x32xf32, #hivm.address_space<ub>>) dual_dst_mode = <COLUMN_SPLIT>
      hivm.hir.anchor {id = 95 : i64}
      %alloc_41 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_41 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = -1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 96 : i64}
      hivm.hir.anchor {id = 97 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_42 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_41, %true, %c64, %c64, %c128 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_42 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 98 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      %alloc_43 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_43 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 99 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_42 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_43 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 100 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 101 : i64}
      hivm.hir.anchor {id = 102 : i64}
      hivm.hir.anchor {id = 103 : i64}
      hivm.hir.anchor {id = 104 : i64}
      hivm.hir.anchor {id = 105 : i64}
      hivm.hir.anchor {id = 106 : i64}
      hivm.hir.anchor {id = 107 : i64}
      hivm.hir.anchor {id = 108 : i64}
      hivm.hir.anchor {id = 109 : i64}
      hivm.hir.anchor {id = 110 : i64}
      hivm.hir.anchor {id = 111 : i64}
      hivm.hir.anchor {id = 112 : i64}
      hivm.hir.anchor {id = 113 : i64}
      hivm.hir.anchor {id = 114 : i64}
      hivm.hir.anchor {id = 115 : i64}
      hivm.hir.anchor {id = 116 : i64}
      hivm.hir.anchor {id = 117 : i64}
      hivm.hir.anchor {id = 118 : i64}
      hivm.hir.anchor {id = 119 : i64}
      hivm.hir.anchor {id = 120 : i64}
      hivm.hir.anchor {id = 121 : i64}
      hivm.hir.anchor {id = 122 : i64}
      hivm.hir.anchor {id = 123 : i64}
      hivm.hir.anchor {id = 124 : i64}
      hivm.hir.anchor {id = 125 : i64}
      hivm.hir.anchor {id = 126 : i64}
      hivm.hir.anchor {id = 127 : i64}
      hivm.hir.anchor {id = 128 : i64}
      hivm.hir.anchor {id = 129 : i64}
      hivm.hir.anchor {id = 130 : i64}
      hivm.hir.anchor {id = 131 : i64}
      hivm.hir.anchor {id = 132 : i64}
      hivm.hir.anchor {id = 133 : i64}
      hivm.hir.anchor {id = 134 : i64}
      hivm.hir.anchor {id = 135 : i64}
      hivm.hir.anchor {id = 136 : i64}
      hivm.hir.anchor {id = 137 : i64}
      hivm.hir.anchor {id = 138 : i64}
      hivm.hir.anchor {id = 139 : i64}
      %alloc_44 = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_44 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = -1 : index} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 140 : i64}
      hivm.hir.anchor {id = 141 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_45 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_44, %alloc, %true, %c64, %c64, %c64 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_45 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 142 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      %alloc_46 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.fixpipe {pre_quant = #hivm.fixpipe_pre_quant_mode<F322BF16>} ins(%alloc_45 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_46 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 143 : i64}
      %alloc_47 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_46, %true, %c64, %c64, %c64 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_47 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 144 : i64}
      %alloc_48 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_48 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.anchor {id = 145 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_47 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_48 : memref<64x32xf32, #hivm.address_space<ub>>) dual_dst_mode = <COLUMN_SPLIT>
      hivm.hir.anchor {id = 146 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 147 : i64}
      hivm.hir.anchor {id = 148 : i64}
      hivm.hir.anchor {id = 149 : i64}
      hivm.hir.anchor {id = 150 : i64}
      hivm.hir.anchor {id = 151 : i64}
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.anchor {id = 152 : i64}
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_infer_workspace_shape_function() -> index attributes {hacc.function_kind = #hacc.function_kind<HOST>, hacc.host_func_type = #hacc.host_func_type<infer_workspace_shape_function>} {
    %c2048 = arith.constant 2048 : index
    return %c2048 : index
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_0_outlined_vf_0(%arg0: memref<64xi32, #hivm.address_space<ub>>, %arg1: i32, %arg2: memref<64xi32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %c0_i32 {in_bounds = [true]} : memref<64xi32, #hivm.address_space<ub>>, vector<64xi32>
    %1 = vector.broadcast %arg1 : i32 to vector<64xi32>
    %2 = arith.addi %0, %1 : vector<64xi32>
    vector.transfer_write %2, %arg2[%c0] {in_bounds = [true]} : vector<64xi32>, memref<64xi32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_2_outlined_vf_0(%arg0: memref<64x128xf32, #hivm.address_space<ub>>, %arg1: memref<128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c4 = arith.constant 4 : index
    scf.for %arg2 = %c0 to %c128 step %c64 {
      scf.for %arg3 = %c0 to %c4 step %c1 {
        %subview = memref.subview %arg0[%arg3, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = affine.apply #map10()[%arg3]
        %subview_0 = memref.subview %arg0[%1, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = affine.apply #map11()[%arg3]
        %subview_1 = memref.subview %arg0[%3, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = affine.apply #map12()[%arg3]
        %subview_2 = memref.subview %arg0[%5, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %6 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = affine.apply #map13()[%arg3]
        %subview_3 = memref.subview %arg0[%7, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %8 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %9 = affine.apply #map14()[%arg3]
        %subview_4 = memref.subview %arg0[%9, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = affine.apply #map15()[%arg3]
        %subview_5 = memref.subview %arg0[%11, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %12 = vector.transfer_read %subview_5[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %13 = affine.apply #map16()[%arg3]
        %subview_6 = memref.subview %arg0[%13, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %14 = vector.transfer_read %subview_6[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %15 = affine.apply #map17()[%arg3]
        %subview_7 = memref.subview %arg0[%15, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %16 = vector.transfer_read %subview_7[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %17 = affine.apply #map18()[%arg3]
        %subview_8 = memref.subview %arg0[%17, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %18 = vector.transfer_read %subview_8[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %19 = affine.apply #map19()[%arg3]
        %subview_9 = memref.subview %arg0[%19, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %20 = vector.transfer_read %subview_9[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %21 = affine.apply #map20()[%arg3]
        %subview_10 = memref.subview %arg0[%21, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %22 = vector.transfer_read %subview_10[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %23 = affine.apply #map21()[%arg3]
        %subview_11 = memref.subview %arg0[%23, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %24 = vector.transfer_read %subview_11[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %25 = affine.apply #map22()[%arg3]
        %subview_12 = memref.subview %arg0[%25, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %26 = vector.transfer_read %subview_12[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %27 = affine.apply #map23()[%arg3]
        %subview_13 = memref.subview %arg0[%27, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %28 = vector.transfer_read %subview_13[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %29 = affine.apply #map24()[%arg3]
        %subview_14 = memref.subview %arg0[%29, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %30 = vector.transfer_read %subview_14[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %31 = arith.addf %0, %16 : vector<1x64xf32>
        %32 = arith.addf %2, %18 : vector<1x64xf32>
        %33 = arith.addf %4, %20 : vector<1x64xf32>
        %34 = arith.addf %6, %22 : vector<1x64xf32>
        %35 = arith.addf %8, %24 : vector<1x64xf32>
        %36 = arith.addf %10, %26 : vector<1x64xf32>
        %37 = arith.addf %12, %28 : vector<1x64xf32>
        %38 = arith.addf %14, %30 : vector<1x64xf32>
        %39 = arith.addf %31, %35 : vector<1x64xf32>
        %40 = arith.addf %32, %36 : vector<1x64xf32>
        %41 = arith.addf %33, %37 : vector<1x64xf32>
        %42 = arith.addf %34, %38 : vector<1x64xf32>
        %43 = arith.addf %39, %41 : vector<1x64xf32>
        %44 = arith.addf %40, %42 : vector<1x64xf32>
        %45 = arith.addf %43, %44 : vector<1x64xf32>
        vector.transfer_write %45, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg2 = %c0 to %c128 step %c64 {
      %subview = memref.subview %arg0[0, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_0 = memref.subview %arg0[1, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_1 = memref.subview %arg0[2, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_2 = memref.subview %arg0[3, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %3 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %4 = arith.addf %0, %2 : vector<1x64xf32>
      %5 = arith.addf %1, %3 : vector<1x64xf32>
      %6 = arith.addf %4, %5 : vector<1x64xf32>
      %7 = vector.shape_cast %6 : vector<1x64xf32> to vector<64xf32>
      %subview_3 = memref.subview %arg1[%arg2] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %8 = vector.transfer_read %subview_3[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %9 = arith.addf %7, %8 : vector<64xf32>
      vector.transfer_write %9, %subview_3[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_3_outlined_vf_0(%arg0: memref<2x128xf32, #hivm.address_space<ub>>, %arg1: memref<128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg2 = %c0 to %c128 step %c64 {
      %subview = memref.subview %arg0[0, %arg2] [1, 64] [1, 1] : memref<2x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_0 = memref.subview %arg0[1, %arg2] [1, 64] [1, 1] : memref<2x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.addf %0, %1 : vector<1x64xf32>
      %3 = vector.shape_cast %2 : vector<1x64xf32> to vector<64xf32>
      %subview_1 = memref.subview %arg1[%arg2] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %4 = vector.transfer_read %subview_1[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %5 = arith.addf %3, %4 : vector<64xf32>
      vector.transfer_write %5, %subview_1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_4_outlined_vf_0(%arg0: memref<64x128xf32, #hivm.address_space<ub>>, %arg1: memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c64 step %c1 {
      scf.for %arg3 = %c0 to %c8 step %c4 {
        %0 = affine.apply #map25(%arg3)
        %subview = memref.subview %arg0[%arg2, %0] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.truncf %1 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
        %subview_0 = memref.subview %arg1[%arg3, %arg2, 0] [4, 1, 16] [1, 1, 1] : memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<4x1x16xbf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
        %3 = vector.shape_cast %2 : vector<1x64xbf16> to vector<4x1x16xbf16>
        vector.transfer_write %3, %subview_0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<4x1x16xbf16>, memref<4x1x16xbf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
      } {unroll_for_vsstb}
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_5_outlined_vf_0(%arg0: memref<64x128xf32, #hivm.address_space<ub>>, %arg1: memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c64 step %c1 {
      scf.for %arg3 = %c0 to %c8 step %c4 {
        %0 = affine.apply #map25(%arg3)
        %subview = memref.subview %arg0[%arg2, %0] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.truncf %1 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
        %subview_0 = memref.subview %arg1[%arg3, %arg2, 0] [4, 1, 16] [1, 1, 1] : memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<4x1x16xbf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
        %3 = vector.shape_cast %2 : vector<1x64xbf16> to vector<4x1x16xbf16>
        vector.transfer_write %3, %subview_0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<4x1x16xbf16>, memref<4x1x16xbf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
      } {unroll_for_vsstb}
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_6_outlined_vf_0(%arg0: memref<32xf32, #hivm.address_space<ub>>, %arg1: memref<32x128xf32, #hivm.address_space<ub>>, %arg2: memref<32x128xf32, #hivm.address_space<ub>>, %arg3: memref<32x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg4] [1] [1] : memref<32xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map8} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %subview_0 = memref.subview %arg2[%arg4, %arg5] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %0, %subview_0[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg4, %arg5] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg3[%arg4, %arg5] [1, 64] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %1, %0 : vector<1x64xf32>
        %3 = arith.truncf %2 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
        vector.transfer_write %3, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xbf16>, memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_7_outlined_vf_0(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<32x128xbf16, #hivm.address_space<ub>>, %arg2: memref<32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : bf16
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg2[%arg3] [1] [1] : memref<32xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = scf.for %arg4 = %c0 to %c128 step %c64 iter_args(%arg5 = %cst_1) -> (vector<1x64xf32>) {
        %subview_2 = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %3 = vector.transfer_read %subview_2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %4 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
        %5 = arith.extf %4 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
        %6 = arith.mulf %3, %5 : vector<1x64xf32>
        %7 = arith.addf %6, %arg5 {reductionOp} : vector<1x64xf32>
        scf.yield %7 : vector<1x64xf32>
      } {reductionLoop}
      %1 = vector.transfer_read %subview[%c0], %cst_0 {in_bounds = [true]} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1xf32>
      %2 = vector.multi_reduction <add>, %0, %1 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
      vector.transfer_write %2, %subview[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_0(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.693147182> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c32 step %c1 {
      scf.for %arg3 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg2, %arg3] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg2, %arg3] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = arith.mulf %0, %cst : vector<1x64xf32>
        %2 = math.exp %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_1(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<32x128xf32, #hivm.address_space<ub>>, %arg2: memref<32x128xf32, #hivm.address_space<ub>>, %arg3: memref<32x128xf32, #hivm.address_space<ub>>, %arg4: memref<32x128xf32, #hivm.address_space<ub>>, %arg5: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<0.693147182> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg6 = %c0 to %c32 step %c1 {
      scf.for %arg7 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg3[%arg6, %arg7] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst_0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg0[%arg6, %arg7] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg1[%arg6, %arg7] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg4[%arg6, %arg7] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_4 = memref.subview %arg2[%arg6, %arg7] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_5 = memref.subview %arg5[%arg6, %arg7] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %3 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %4 = arith.mulf %3, %0 : vector<1x64xf32>
        vector.transfer_write %4, %subview_5[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_9_outlined_vf_0(%arg0: memref<128xf32, #hivm.address_space<ub>>, %arg1: memref<128xf32, #hivm.address_space<ub>>, %arg2: memref<128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.693147182> : vector<64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c128 step %c64 {
      %subview = memref.subview %arg0[%arg3] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg3] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg2[%arg3] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst_0 {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %1 = vector.transfer_read %subview_1[%c0], %cst_0 {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %2 = arith.mulf %1, %cst : vector<64xf32>
      %3 = math.exp %2 : vector<64xf32>
      %4 = arith.mulf %0, %3 : vector<64xf32>
      vector.transfer_write %4, %subview_2[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_10_outlined_vf_0(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: f32, %arg2: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %arg1 : f32 to vector<1x64xf32>
    scf.for %arg3 = %c0 to %c32 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %1, %0 : vector<1x64xf32>
        vector.transfer_write %2, %subview_0[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_0(%arg0: memref<128xf32, #hivm.address_space<ub>>, %arg1: memref<32x128xf32, #hivm.address_space<ub>>, %arg2: memref<32x128xf32, #hivm.address_space<ub>>, %arg3: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.693147182> : vector<1x64xf32>
    %cst_0 = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c32 step %c1 {
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg5] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg1[%arg4, %arg5] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg2[%arg4, %arg5] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0], %cst_1 {in_bounds = [true, true], permutation_map = #map9} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_2[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.subf %0, %1 : vector<1x64xf32>
        %3 = arith.mulf %2, %cst : vector<1x64xf32>
        %4 = math.exp %3 : vector<1x64xf32>
        vector.transfer_write %4, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_4 = memref.subview %arg3[%arg4, %arg5] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst_0, %subview_4[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_1(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<32x128xf32, #hivm.address_space<ub>>, %arg2: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c32 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_12_outlined_vf_0(%arg0: memref<32x128xbf16, #hivm.address_space<ub>>, %arg1: memref<32x128xf32, #hivm.address_space<ub>>, %arg2: memref<32x128xf32, #hivm.address_space<ub>>, %arg3: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c32 step %c1 {
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg4, %arg5] [1, 64] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg4, %arg5] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
        %1 = arith.extf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
        vector.transfer_write %1, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg4 = %c0 to %c32 step %c1 {
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg1[%arg4, %arg5] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg4, %arg5] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg3[%arg4, %arg5] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_13_outlined_vf_0(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<-1.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c32 step %c1 {
      scf.for %arg3 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg2, %arg3] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg2, %arg3] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = arith.mulf %0, %cst : vector<1x64xf32>
        vector.transfer_write %1, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_14_outlined_vf_0(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c32 step %c1 {
      scf.for %arg3 = %c0 to %c8 step %c4 {
        %0 = affine.apply #map25(%arg3)
        %subview = memref.subview %arg0[%arg2, %0] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.truncf %1 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
        %subview_0 = memref.subview %arg1[%arg3, %arg2, 0] [4, 1, 16] [1, 1, 1] : memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> to memref<4x1x16xbf16, strided<[528, 16, 1], offset: ?>, #hivm.address_space<ub>>
        %3 = vector.shape_cast %2 : vector<1x64xbf16> to vector<4x1x16xbf16>
        vector.transfer_write %3, %subview_0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<4x1x16xbf16>, memref<4x1x16xbf16, strided<[528, 16, 1], offset: ?>, #hivm.address_space<ub>>
      } {unroll_for_vsstb}
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_15_outlined_vf_0(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c32 step %c1 {
      scf.for %arg3 = %c0 to %c8 step %c4 {
        %0 = affine.apply #map25(%arg3)
        %subview = memref.subview %arg0[%arg2, %0] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.truncf %1 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
        %subview_0 = memref.subview %arg1[%arg3, %arg2, 0] [4, 1, 16] [1, 1, 1] : memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> to memref<4x1x16xbf16, strided<[528, 16, 1], offset: ?>, #hivm.address_space<ub>>
        %3 = vector.shape_cast %2 : vector<1x64xbf16> to vector<4x1x16xbf16>
        vector.transfer_write %3, %subview_0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<4x1x16xbf16>, memref<4x1x16xbf16, strided<[528, 16, 1], offset: ?>, #hivm.address_space<ub>>
      } {unroll_for_vsstb}
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_0(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<32x128xf32, #hivm.address_space<ub>>, %arg2: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c32 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_1(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg1[%arg2] [1] [1] : memref<32xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = scf.for %arg3 = %c0 to %c128 step %c64 iter_args(%arg4 = %cst_0) -> (vector<1x64xf32>) {
        %subview_1 = memref.subview %arg0[%arg2, %arg3] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %3 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %4 = arith.addf %3, %arg4 {reductionOp} : vector<1x64xf32>
        scf.yield %4 : vector<1x64xf32>
      } {reductionLoop}
      %1 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true]} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1xf32>
      %2 = vector.multi_reduction <add>, %0, %1 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
      vector.transfer_write %2, %subview[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_17_outlined_vf_0(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c2 = arith.constant 2 : index
    scf.for %arg2 = %c0 to %c128 step %c64 {
      scf.for %arg3 = %c0 to %c2 step %c1 {
        %subview = memref.subview %arg0[%arg3, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = affine.apply #map26()[%arg3]
        %subview_0 = memref.subview %arg0[%1, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = affine.apply #map10()[%arg3]
        %subview_1 = memref.subview %arg0[%3, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = affine.apply #map27()[%arg3]
        %subview_2 = memref.subview %arg0[%5, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %6 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = affine.apply #map11()[%arg3]
        %subview_3 = memref.subview %arg0[%7, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %8 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %9 = affine.apply #map28()[%arg3]
        %subview_4 = memref.subview %arg0[%9, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = affine.apply #map12()[%arg3]
        %subview_5 = memref.subview %arg0[%11, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %12 = vector.transfer_read %subview_5[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %13 = affine.apply #map29()[%arg3]
        %subview_6 = memref.subview %arg0[%13, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %14 = vector.transfer_read %subview_6[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %15 = affine.apply #map13()[%arg3]
        %subview_7 = memref.subview %arg0[%15, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %16 = vector.transfer_read %subview_7[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %17 = affine.apply #map30()[%arg3]
        %subview_8 = memref.subview %arg0[%17, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %18 = vector.transfer_read %subview_8[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %19 = affine.apply #map14()[%arg3]
        %subview_9 = memref.subview %arg0[%19, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %20 = vector.transfer_read %subview_9[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %21 = affine.apply #map31()[%arg3]
        %subview_10 = memref.subview %arg0[%21, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %22 = vector.transfer_read %subview_10[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %23 = affine.apply #map15()[%arg3]
        %subview_11 = memref.subview %arg0[%23, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %24 = vector.transfer_read %subview_11[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %25 = affine.apply #map32()[%arg3]
        %subview_12 = memref.subview %arg0[%25, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %26 = vector.transfer_read %subview_12[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %27 = affine.apply #map16()[%arg3]
        %subview_13 = memref.subview %arg0[%27, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %28 = vector.transfer_read %subview_13[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %29 = affine.apply #map33()[%arg3]
        %subview_14 = memref.subview %arg0[%29, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %30 = vector.transfer_read %subview_14[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %31 = arith.addf %0, %16 : vector<1x64xf32>
        %32 = arith.addf %2, %18 : vector<1x64xf32>
        %33 = arith.addf %4, %20 : vector<1x64xf32>
        %34 = arith.addf %6, %22 : vector<1x64xf32>
        %35 = arith.addf %8, %24 : vector<1x64xf32>
        %36 = arith.addf %10, %26 : vector<1x64xf32>
        %37 = arith.addf %12, %28 : vector<1x64xf32>
        %38 = arith.addf %14, %30 : vector<1x64xf32>
        %39 = arith.addf %31, %35 : vector<1x64xf32>
        %40 = arith.addf %32, %36 : vector<1x64xf32>
        %41 = arith.addf %33, %37 : vector<1x64xf32>
        %42 = arith.addf %34, %38 : vector<1x64xf32>
        %43 = arith.addf %39, %41 : vector<1x64xf32>
        %44 = arith.addf %40, %42 : vector<1x64xf32>
        %45 = arith.addf %43, %44 : vector<1x64xf32>
        vector.transfer_write %45, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg2 = %c0 to %c128 step %c64 {
      %subview = memref.subview %arg0[0, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_0 = memref.subview %arg0[1, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.addf %0, %1 : vector<1x64xf32>
      %3 = vector.shape_cast %2 : vector<1x64xf32> to vector<64xf32>
      %subview_1 = memref.subview %arg1[%arg2] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %4 = vector.transfer_read %subview_1[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %5 = arith.addf %3, %4 : vector<64xf32>
      vector.transfer_write %5, %subview_1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_18_outlined_vf_0(%arg0: memref<2x128xf32, #hivm.address_space<ub>>, %arg1: memref<128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg2 = %c0 to %c128 step %c64 {
      %subview = memref.subview %arg0[0, %arg2] [1, 64] [1, 1] : memref<2x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_0 = memref.subview %arg0[1, %arg2] [1, 64] [1, 1] : memref<2x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.addf %0, %1 : vector<1x64xf32>
      %3 = vector.shape_cast %2 : vector<1x64xf32> to vector<64xf32>
      %subview_1 = memref.subview %arg1[%arg2] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %4 = vector.transfer_read %subview_1[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %5 = arith.addf %3, %4 : vector<64xf32>
      vector.transfer_write %5, %subview_1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_20_outlined_vf_1(%arg0: memref<64xi32, #hivm.address_space<ub>>, %arg1: memref<64xi32, #hivm.address_space<ub>>, %arg2: index, %arg3: memref<64xf16, #hivm.address_space<ub>>, %arg4: memref<64xf16, #hivm.address_space<ub>>, %arg5: index, %arg6: memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c1 = arith.constant 1 : index
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant 0.000000e+00 : f16
    %cst_0 = arith.constant dense<0.000000e+00> : vector<1x64xf16>
    %subview = memref.subview %arg4[%arg5] [32] [1] : memref<64xf16, #hivm.address_space<ub>> to memref<32xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>
    %subview_1 = memref.subview %arg1[%arg2] [32] [1] : memref<64xi32, #hivm.address_space<ub>> to memref<32xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    %0 = vector.constant_mask [32] : vector<64xi1>
    %1 = vector.transfer_read %subview_1[%c0], %c0_i32, %0 {in_bounds = [true, true], permutation_map = #map9} : memref<32xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
    %2 = vector.constant_mask [1, 32] : vector<1x64xi1>
    %3 = vector.transfer_read %subview[%c0], %cst, %0 {in_bounds = [true, true], permutation_map = #map9} : memref<32xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
    %4 = arith.cmpf une, %3, %cst_0 : vector<1x64xf16>
    scf.for %arg7 = %c0 to %c64 step %c1 {
      %subview_2 = memref.subview %arg6[%arg7, 0] [1, 32] [1, 1] : memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_3 = memref.subview %arg0[%arg7] [1] [1] : memref<64xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %5 = vector.transfer_read %subview_3[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map8} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %6 = arith.cmpi sgt, %5, %1 : vector<1x64xi32>
      %subview_4 = memref.subview %arg3[%arg7] [1] [1] : memref<64xf16, #hivm.address_space<ub>> to memref<1xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %7 = vector.transfer_read %subview_4[%c0], %cst {in_bounds = [true, true], permutation_map = #map8} : memref<1xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
      %8 = arith.cmpf une, %7, %cst_0 : vector<1x64xf16>
      %9 = arith.andi %8, %4 : vector<1x64xi1>
      %10 = arith.andi %6, %9 : vector<1x64xi1>
      vector.transfer_write %10, %subview_2[%c0, %c0], %2 {in_bounds = [true, true]} : vector<1x64xi1>, memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_21_outlined_vf_0(%arg0: memref<64x32xf32, #hivm.address_space<ub>>, %arg1: memref<32xf32, #hivm.address_space<ub>>, %arg2: memref<64x32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 32] : vector<1x64xi1>
    %1 = vector.constant_mask [32] : vector<64xi1>
    %2 = vector.transfer_read %arg1[%c0], %cst, %1 {in_bounds = [true, true], permutation_map = #map9} : memref<32xf32, #hivm.address_space<ub>>, vector<1x64xf32>
    scf.for %arg3 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg3, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg2[%arg3, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %3 = vector.transfer_read %subview[%c0, %c0], %cst, %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %4 = arith.mulf %3, %2 : vector<1x64xf32>
      vector.transfer_write %4, %subview_0[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_22_outlined_vf_0(%arg0: memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, %arg1: memref<64x32xf32, #hivm.address_space<ub>>, %arg2: memref<2x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %false = arith.constant false
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 32] : vector<1x64xi1>
    %1 = vector.constant_mask [2, 1, 16] : vector<4x1x16xi1>
    scf.for %arg3 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg2[0, %arg3, 0] [2, 1, 16] [1, 1, 1] : memref<2x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<2x1x16xbf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg0[%arg3, 0] [1, 32] [1, 1] : memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg1[%arg3, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %false, %0 {in_bounds = [true, true]} : memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi1>
      %3 = vector.transfer_read %subview_2[%c0, %c0], %cst_0, %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %4 = arith.select %2, %3, %cst : vector<1x64xi1>, vector<1x64xf32>
      %5 = arith.truncf %4 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
      %6 = vector.shape_cast %5 : vector<1x64xbf16> to vector<4x1x16xbf16>
      vector.transfer_write %6, %subview[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : vector<4x1x16xbf16>, memref<2x1x16xbf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_23_outlined_vf_0(%arg0: memref<64x32xf32, #hivm.address_space<ub>>, %arg1: memref<64x32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<-1.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 32] : vector<1x64xi1>
    scf.for %arg2 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg2, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg2, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0, %c0], %cst_0, %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.mulf %1, %cst : vector<1x64xf32>
      vector.transfer_write %2, %subview_1[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_0(%arg0: memref<32x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_1(%arg0: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c32 step %c1 {
      scf.for %arg2 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_2(%arg0: memref<32x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_3(%arg0: memref<32x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_4(%arg0: memref<64x128xf32, #hivm.address_space<ub>>, %arg1: memref<64x128xf32, #hivm.address_space<ub>>, %arg2: memref<64x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c64 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_5(%arg0: memref<32xf32, #hivm.address_space<ub>>, %arg1: memref<32xf32, #hivm.address_space<ub>>, %arg2: memref<32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [32] : vector<64xi1>
    %1 = vector.transfer_read %arg0[%c0], %cst, %0 {in_bounds = [true]} : memref<32xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = vector.transfer_read %arg1[%c0], %cst, %0 {in_bounds = [true]} : memref<32xf32, #hivm.address_space<ub>>, vector<64xf32>
    %3 = arith.addf %1, %2 : vector<64xf32>
    vector.transfer_write %3, %arg2[%c0], %0 {in_bounds = [true]} : vector<64xf32>, memref<32xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_6(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<32x128xf32, #hivm.address_space<ub>>, %arg2: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c32 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_7(%arg0: memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, %arg1: memref<64x32xf32, #hivm.address_space<ub>>, %arg2: memref<64x32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %false = arith.constant false
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 32] : vector<1x64xi1>
    scf.for %arg3 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg3, 0] [1, 32] [1, 1] : memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg3, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg2[%arg3, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0, %c0], %false, %0 {in_bounds = [true, true]} : memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi1>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %cst_0, %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %3 = arith.select %1, %2, %cst : vector<1x64xi1>, vector<1x64xf32>
      vector.transfer_write %3, %subview_2[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg19: f32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32) attributes {DirectlyUsedGMArgIdxList = [17, 7], SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<24xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
    %c0 = arith.constant 0 : index
    %c32_i64 = arith.constant 32 : i64
    %c32 = arith.constant 32 : index
    %c64_i32 = arith.constant 64 : i32
    %c96_i32 = arith.constant 96 : i32
    %c0_i64 = arith.constant 0 : i64
    %cst = arith.constant 0.000000e+00 : f32
    %c64 = arith.constant 64 : index
    %c96_i64 = arith.constant 96 : i64
    %c128_i64 = arith.constant 128 : i64
    %c64_i64 = arith.constant 64 : i64
    %c0_i32 = arith.constant 0 : i32
    %c12288_i64 = arith.constant 12288 : i64
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %c16384_i64 = arith.constant 16384 : i64
    %c63_i32 = arith.constant 63 : i32
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg21, %arg22 : i32
    %1 = arith.muli %0, %arg23 : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
    %4 = arith.extsi %arg20 : i32 to i64
    %5 = arith.addi %arg20, %c63_i32 : i32
    %6 = arith.divsi %5, %c64_i32 : i32
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64xi32, #hivm.address_space<ub>>
    call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_merged_vf_0(%alloc, %alloc_1) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<128xf32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>) -> ()
    %7 = arith.index_cast %arg20 : i32 to index
    %8 = arith.index_cast %2 : i64 to index
    %9 = affine.apply #map34()[%8]
    %view = memref.view %arg1[%9][] : memref<?xi8, #hivm.address_space<gm>> to memref<2x128xf32, #hivm.address_space<gm>>
    %10 = affine.apply #map35()[%8]
    %view_2 = memref.view %arg1[%10][] : memref<?xi8, #hivm.address_space<gm>> to memref<2x128xf32, #hivm.address_space<gm>>
    %11 = hivm.hir.get_sub_block_idx -> i64
    %12 = arith.index_cast %11 : i64 to index
    %13 = affine.apply #map36()[%12]
    %14 = affine.apply #map37()[%12]
    %15 = affine.apply #map38()[%12]
    %16 = affine.apply #map39()[%12]
    hivm.hir.anchor {id = 0 : i64}
    annotation.mark %1 {logical_block_num} : i32
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.anchor {id = 1 : i64}
    %17 = arith.index_cast %13 : index to i64
    %18 = arith.muli %17, %c96_i64 : i64
    %19 = affine.apply #map40()[%12]
    %subview = memref.subview %view[%12, 0] [1, 128] [1, 1] : memref<2x128xf32, #hivm.address_space<gm>> to memref<1x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
    %subview_3 = memref.subview %view_2[%12, 0] [1, 128] [1, 1] : memref<2x128xf32, #hivm.address_space<gm>> to memref<1x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
    scf.for %arg24 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %20 = arith.remsi %arg24, %arg21 : i32
      %21 = arith.divsi %arg24, %arg21 : i32
      %22 = arith.remsi %21, %arg22 : i32
      hivm.hir.anchor {id = 3 : i64}
      hivm.hir.anchor {id = 4 : i64}
      hivm.hir.anchor {id = 5 : i64}
      hivm.hir.anchor {id = 6 : i64}
      %23 = arith.divsi %22, %c96_i32 : i32
      %24 = arith.remsi %22, %c96_i32 : i32
      %25 = arith.muli %23, %6 : i32
      %26 = arith.addi %25, %20 : i32
      %27 = arith.extsi %26 : i32 to i64
      %28 = arith.muli %23, %arg20 : i32
      %29 = arith.extsi %28 : i32 to i64
      %30 = arith.muli %20, %c64_i32 : i32
      hivm.hir.anchor {id = 7 : i64}
      %31 = arith.extsi %30 : i32 to i64
      %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<64xi32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_0_outlined_vf_0(%alloc_1, %30, %alloc_4) {hivm.vector_function, no_inline} : (memref<64xi32, #hivm.address_space<ub>>, i32, memref<64xi32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 8 : i64}
      hivm.hir.anchor {id = 9 : i64}
      %32 = arith.addi %30, %c64_i32 : i32
      %33 = arith.minsi %arg20, %32 : i32
      %34 = arith.subi %33, %c1_i32 : i32
      hivm.hir.anchor {id = 10 : i64}
      %35 = arith.muli %29, %c96_i64 : i64
      %36 = arith.extsi %24 : i32 to i64
      %37 = arith.addi %35, %36 : i64
      %38 = arith.muli %37, %c128_i64 : i64
      %39 = arith.index_cast %38 : i64 to index
      %40 = arith.muli %37, %c64_i64 : i64
      %41 = arith.index_cast %40 : i64 to index
      %42 = arith.muli %27, %c96_i64 : i64
      %43 = arith.addi %42, %36 : i64
      %44 = arith.muli %43, %c16384_i64 : i64
      %45 = arith.index_cast %44 : i64 to index
      %46 = arith.muli %31, %c96_i64 : i64
      %47 = arith.addi %37, %46 : i64
      %48 = arith.subi %4, %31 : i64
      %49 = arith.maxsi %48, %c0_i64 : i64
      %50 = arith.minsi %49, %c64_i64 : i64
      %51 = arith.minsi %50, %c64_i64 : i64
      %52 = arith.addi %47, %18 : i64
      %53 = arith.subi %51, %17 : i64
      %54 = arith.maxsi %53, %c0_i64 : i64
      %55 = arith.minsi %54, %c32_i64 : i64
      %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, #hivm.address_space<ub>>
      hivm.hir.stride_load ins(%arg7 : memref<?xf32, #hivm.address_space<gm>>) outs(%alloc_5 : memref<32xf32, #hivm.address_space<ub>>) offset(%52 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%55 : i64])
      hivm.hir.anchor {id = 11 : i64}
      %56 = arith.maxsi %30, %c0_i32 : i32
      %57 = arith.index_cast %56 : i32 to index
      %58 = affine.apply #map()[%41, %57]
      %59 = affine.apply #map5()[%39, %57]
      %60 = affine.apply #map1()[%7, %57]
      %61 = arith.maxsi %60, %c0 : index
      %62 = arith.minsi %61, %c64 : index
      %63 = arith.subi %c0_i32, %30 : i32
      %64 = arith.maxsi %63, %c0_i32 : i32
      %65 = arith.index_cast %64 : i32 to index
      %66 = arith.minsi %65, %62 : index
      %67 = affine.apply #map1()[%62, %66]
      %68 = arith.cmpi slt, %67, %c64 : index
      hivm.hir.anchor {id = 12 : i64}
      hivm.hir.anchor {id = 13 : i64}
      %reinterpret_cast = memref.reinterpret_cast %arg3 to offset: [%59], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_6 = memref.reinterpret_cast %arg6 to offset: [%59], sizes: [64, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_7 = memref.alloc() : memref<32x128xbf16, #hivm.address_space<ub>>
      %69 = arith.minsi %13, %67 : index
      %70 = affine.apply #map41()[%69, %62, %66]
      %71 = arith.minsi %70, %c32 : index
      %subview_8 = memref.subview %reinterpret_cast[%13, 0] [%71, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %72 = arith.maxsi %66, %13 : index
      %73 = arith.minsi %62, %19 : index
      %74 = arith.maxsi %72, %73 : index
      %75 = affine.apply #map1()[%74, %72]
      %76 = affine.apply #map42()[%72, %12]
      %subview_9 = memref.subview %alloc_7[%76, 0] [%75, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 14 : i64}
      scf.if %68 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_0(%alloc_7) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_8 : memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_9 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16
      hivm.hir.anchor {id = 15 : i64}
      %alloc_10 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      %subview_11 = memref.subview %reinterpret_cast_6[%13, 0] [%71, 128] [1, 1] : memref<64x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_12 = memref.subview %alloc_10[%76, 0] [%75, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 16 : i64}
      scf.if %68 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_1(%alloc_10) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_11 : memref<?x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_12 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32
      hivm.hir.anchor {id = 17 : i64}
      %77 = arith.extsi %34 : i32 to i64
      %78 = arith.muli %77, %c12288_i64 : i64
      %79 = arith.addi %38, %78 : i64
      %80 = arith.index_cast %79 : i64 to index
      %reinterpret_cast_13 = memref.reinterpret_cast %arg6 to offset: [%80], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %alloc_14 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_14 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 18 : i64}
      hivm.hir.load ins(%reinterpret_cast_13 : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_14 : memref<128xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 19 : i64}
      %reinterpret_cast_15 = memref.reinterpret_cast %arg9 to offset: [%45], sizes: [128, 128], strides: [128, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_16 = memref.subview %reinterpret_cast_15[%14, 0] [64, 128] [1, 1] : memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_17 = memref.reinterpret_cast %arg11 to offset: [%45], sizes: [128, 128], strides: [128, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_18 = memref.subview %reinterpret_cast_17[%14, 0] [64, 128] [1, 1] : memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 20 : i64}
      hivm.hir.anchor {id = 21 : i64}
      hivm.hir.anchor {id = 22 : i64}
      hivm.hir.anchor {id = 23 : i64}
      %alloc_19 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_19 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 24 : i64}
      %collapse_shape = memref.collapse_shape %subview_16 [[0, 1]] : memref<64x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<8192xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %collapse_shape_20 = memref.collapse_shape %alloc_19 [[0, 1]] : memref<64x128xf32, #hivm.address_space<ub>> into memref<8192xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape : memref<8192xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%collapse_shape_20 : memref<8192xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 25 : i64}
      %alloc_21 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_21 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 26 : i64}
      %collapse_shape_22 = memref.collapse_shape %subview_18 [[0, 1]] : memref<64x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<8192xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %collapse_shape_23 = memref.collapse_shape %alloc_21 [[0, 1]] : memref<64x128xf32, #hivm.address_space<ub>> into memref<8192xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape_22 : memref<8192xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%collapse_shape_23 : memref<8192xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 27 : i64}
      hivm.hir.anchor {id = 28 : i64}
      hivm.hir.anchor {id = 29 : i64}
      hivm.hir.anchor {id = 30 : i64}
      %alloc_24 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_4(%alloc_19, %alloc_21, %alloc_24) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 31 : i64}
      %alloc_25 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_25 : memref<128xf32, #hivm.address_space<ub>>)
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_2_outlined_vf_0(%alloc_24, %alloc_25) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.pipe_barrier[<PIPE_MTE2>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %collapse_shape_26 = memref.collapse_shape %subview [[0, 1]] : memref<1x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%alloc_25 : memref<128xf32, #hivm.address_space<ub>>) outs(%collapse_shape_26 : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.pipe_barrier[<PIPE_MTE3>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %alloc_27 = memref.alloc() : memref<2x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_27 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<2x128xf32, #hivm.address_space<ub>>
      %collapse_shape_28 = memref.collapse_shape %view [[0, 1]] : memref<2x128xf32, #hivm.address_space<gm>> into memref<256xf32, #hivm.address_space<gm>>
      %collapse_shape_29 = memref.collapse_shape %alloc_27 [[0, 1]] : memref<2x128xf32, #hivm.address_space<ub>> into memref<256xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape_28 : memref<256xf32, #hivm.address_space<gm>>) outs(%collapse_shape_29 : memref<256xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst>
      %alloc_30 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_30 : memref<128xf32, #hivm.address_space<ub>>)
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_3_outlined_vf_0(%alloc_27, %alloc_30) {hivm.vector_function, no_inline} : (memref<2x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 32 : i64}
      hivm.hir.anchor {id = 33 : i64}
      hivm.hir.anchor {id = 34 : i64}
      %alloc_31 = memref.alloc() : memref<8x65x16x1xbf16, #hivm.address_space<ub>>
      %subview_32 = memref.subview %alloc_31[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xbf16, #hivm.address_space<ub>> to memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_4_outlined_vf_0(%alloc_19, %subview_32) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape = memref.expand_shape %subview_32 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_33 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_34 = memref.subview %alloc_33[0, %15, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_33 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      hivm.hir.anchor {id = 35 : i64}
      %collapse_shape_35 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_36 = memref.collapse_shape %subview_34 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_35 : memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_36 : memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 36 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 37 : i64}
      %alloc_37 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_37 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 38 : i64}
      hivm.hir.anchor {id = 39 : i64}
      hivm.hir.anchor {id = 40 : i64}
      hivm.hir.anchor {id = 41 : i64}
      %alloc_38 = memref.alloc() : memref<8x65x16x1xbf16, #hivm.address_space<ub>>
      %subview_39 = memref.subview %alloc_38[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xbf16, #hivm.address_space<ub>> to memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_5_outlined_vf_0(%alloc_21, %subview_39) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_40 = memref.expand_shape %subview_39 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_41 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_42 = memref.subview %alloc_41[0, %15, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_41 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      hivm.hir.anchor {id = 42 : i64}
      %collapse_shape_43 = memref.collapse_shape %expand_shape_40 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_44 = memref.collapse_shape %subview_42 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_43 : memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_44 : memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 43 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 44 : i64}
      %alloc_45 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_45 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 45 : i64}
      hivm.hir.anchor {id = 46 : i64}
      %alloc_46 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_47 = memref.subview %alloc_46[0, %15, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_46 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      hivm.hir.anchor {id = 47 : i64}
      %collapse_shape_48 = memref.collapse_shape %subview_47 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_35 : memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_48 : memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 48 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 49 : i64}
      %alloc_49 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_49 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 50 : i64}
      hivm.hir.anchor {id = 51 : i64}
      %reinterpret_cast_50 = memref.reinterpret_cast %arg4 to offset: [%59], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_51 = memref.reinterpret_cast %arg15 to offset: [%59], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_52 = memref.alloc() : memref<32x128xbf16, #hivm.address_space<ub>>
      %subview_53 = memref.subview %reinterpret_cast_50[%13, 0] [%71, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_54 = memref.subview %alloc_52[%76, 0] [%75, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 52 : i64}
      hivm.hir.anchor {id = 53 : i64}
      hivm.hir.anchor {id = 54 : i64}
      scf.if %68 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_2(%alloc_52) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_53 : memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_54 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16
      hivm.hir.anchor {id = 55 : i64}
      hivm.hir.anchor {id = 56 : i64}
      hivm.hir.anchor {id = 57 : i64}
      hivm.hir.anchor {id = 58 : i64}
      %alloc_55 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_55 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 59 : i64}
      hivm.hir.anchor {id = 60 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 61 : i64}
      hivm.hir.anchor {id = 62 : i64}
      hivm.hir.anchor {id = 63 : i64}
      %alloc_56 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_7_outlined_vf_0(%alloc_55, %alloc_52, %alloc_56) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xbf16, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 64 : i64}
      %alloc_57 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_58 = memref.alloc() {alignment = 64 : i64} : memref<32x128xbf16, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_6_outlined_vf_0(%alloc_5, %alloc_55, %alloc_57, %alloc_58) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 65 : i64}
      %subview_59 = memref.subview %alloc_58[%76, 0] [%75, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 66 : i64}
      %subview_60 = memref.subview %reinterpret_cast_51[%13, 0] [%71, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_59 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_60 : memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.anchor {id = 67 : i64}
      hivm.hir.anchor {id = 68 : i64}
      hivm.hir.anchor {id = 69 : i64}
      hivm.hir.anchor {id = 70 : i64}
      hivm.hir.anchor {id = 71 : i64}
      hivm.hir.anchor {id = 72 : i64}
      %alloc_61 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_9_outlined_vf_0(%alloc_30, %alloc_14, %alloc_61) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 73 : i64}
      %alloc_62 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_0(%alloc_10, %alloc_62) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      %alloc_63 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_64 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_65 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_1(%alloc_62, %alloc_57, %alloc_37, %alloc_63, %alloc_64, %alloc_65) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 74 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
      %alloc_66 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_10_outlined_vf_0(%alloc_65, %arg19, %alloc_66) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, f32, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 75 : i64}
      hivm.hir.anchor {id = 76 : i64}
      hivm.hir.anchor {id = 77 : i64}
      hivm.hir.anchor {id = 78 : i64}
      %81 = arith.index_cast %30 : i32 to index
      %82 = affine.apply #map6()[%81]
      %83 = arith.maxsi %81, %7 : index
      %84 = arith.minsi %82, %83 : index
      %85 = affine.apply #map1()[%84, %81]
      %86 = arith.minsi %13, %85 : index
      %87 = affine.apply #map41()[%86, %84, %81]
      %88 = arith.minsi %87, %c32 : index
      hivm.hir.anchor {id = 79 : i64}
      hivm.hir.anchor {id = 80 : i64}
      %alloc_67 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_68 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_0(%alloc_14, %alloc_10, %alloc_67, %alloc_68) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      %subview_69 = memref.subview %alloc_67[0, 0] [%88, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
      %subview_70 = memref.subview %alloc_68[0, 0] [%88, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
      %collapse_shape_71 = memref.collapse_shape %subview_69 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
      %collapse_shape_72 = memref.collapse_shape %subview_70 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
      hivm.hir.copy ins(%collapse_shape_71 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_72 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
      %alloc_73 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_1(%alloc_45, %alloc_68, %alloc_73) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 81 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 82 : i64}
      %alloc_74 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_75 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_12_outlined_vf_0(%alloc_7, %alloc_74, %alloc_62, %alloc_75) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 83 : i64}
      %alloc_76 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_13_outlined_vf_0(%alloc_49, %alloc_76) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 84 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 85 : i64}
      hivm.hir.anchor {id = 86 : i64}
      hivm.hir.anchor {id = 87 : i64}
      %alloc_77 = memref.alloc() : memref<8x33x16x1xbf16, #hivm.address_space<ub>>
      %subview_78 = memref.subview %alloc_77[0, 0, 0, 0] [8, 32, 16, 1] [1, 1, 1, 1] : memref<8x33x16x1xbf16, #hivm.address_space<ub>> to memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_14_outlined_vf_0(%alloc_76, %subview_78) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_79 = memref.expand_shape %subview_78 [[0], [1, 2], [3]] output_shape [8, 2, 16, 16] : memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> into memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_80 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_81 = memref.subview %alloc_80[0, %16, 0, 0] [8, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_80 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = 1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      hivm.hir.anchor {id = 88 : i64}
      %collapse_shape_82 = memref.collapse_shape %expand_shape_79 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>
      %collapse_shape_83 = memref.collapse_shape %subview_81 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_82 : memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_83 : memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 89 : i64}
      hivm.hir.anchor {id = 90 : i64}
      %alloc_84 = memref.alloc() : memref<8x33x16x1xbf16, #hivm.address_space<ub>>
      %subview_85 = memref.subview %alloc_84[0, 0, 0, 0] [8, 32, 16, 1] [1, 1, 1, 1] : memref<8x33x16x1xbf16, #hivm.address_space<ub>> to memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_15_outlined_vf_0(%alloc_75, %subview_85) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_86 = memref.expand_shape %subview_85 [[0], [1, 2], [3]] output_shape [8, 2, 16, 16] : memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> into memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_87 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_88 = memref.subview %alloc_87[0, %16, 0, 0] [8, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_87 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = 1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 91 : i64}
      %collapse_shape_89 = memref.collapse_shape %expand_shape_86 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>
      %collapse_shape_90 = memref.collapse_shape %subview_88 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_89 : memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_90 : memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 92 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 93 : i64}
      %alloc_91 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_91 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 94 : i64}
      hivm.hir.anchor {id = 95 : i64}
      %alloc_92 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_93 = memref.subview %alloc_92[0, %16, 0, 0] [8, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_92 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = 1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      hivm.hir.anchor {id = 96 : i64}
      %collapse_shape_94 = memref.collapse_shape %subview_93 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_82 : memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_94 : memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 97 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 98 : i64}
      %alloc_95 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_95 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 99 : i64}
      hivm.hir.anchor {id = 100 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 101 : i64}
      %alloc_96 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_0(%alloc_95, %alloc_75, %alloc_96) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      %alloc_97 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_1(%alloc_96, %alloc_97) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 102 : i64}
      %alloc_98 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_5(%alloc_56, %alloc_97, %alloc_98) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 103 : i64}
      %reinterpret_cast_99 = memref.reinterpret_cast %arg2 to offset: [%59], sizes: [64, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_100 = memref.alloc() : memref<32x128xbf16, #hivm.address_space<ub>>
      %subview_101 = memref.subview %reinterpret_cast_99[%13, 0] [%71, 128] [1, 1] : memref<64x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_102 = memref.subview %alloc_100[%76, 0] [%75, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 104 : i64}
      scf.if %68 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_3(%alloc_100) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_101 : memref<?x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_102 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16
      hivm.hir.anchor {id = 105 : i64}
      hivm.hir.anchor {id = 106 : i64}
      %alloc_103 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_6(%alloc_74, %alloc_73, %alloc_103) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 107 : i64}
      %alloc_104 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %collapse_shape_105 = memref.collapse_shape %alloc_103 [[0, 1]] : memref<32x128xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
      %collapse_shape_106 = memref.collapse_shape %alloc_104 [[0, 1]] : memref<32x128xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%collapse_shape_105 : memref<4096xf32, #hivm.address_space<ub>>) outs(%collapse_shape_106 : memref<4096xf32, #hivm.address_space<ub>>)
      %alloc_107 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_107 : memref<128xf32, #hivm.address_space<ub>>)
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_17_outlined_vf_0(%alloc_104, %alloc_107) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.pipe_barrier[<PIPE_MTE2>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %collapse_shape_108 = memref.collapse_shape %subview_3 [[0, 1]] : memref<1x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%alloc_107 : memref<128xf32, #hivm.address_space<ub>>) outs(%collapse_shape_108 : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.pipe_barrier[<PIPE_MTE3>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %alloc_109 = memref.alloc() : memref<2x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_109 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<2x128xf32, #hivm.address_space<ub>>
      %collapse_shape_110 = memref.collapse_shape %view_2 [[0, 1]] : memref<2x128xf32, #hivm.address_space<gm>> into memref<256xf32, #hivm.address_space<gm>>
      %collapse_shape_111 = memref.collapse_shape %alloc_109 [[0, 1]] : memref<2x128xf32, #hivm.address_space<ub>> into memref<256xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape_110 : memref<256xf32, #hivm.address_space<gm>>) outs(%collapse_shape_111 : memref<256xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst>
      %alloc_112 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_112 : memref<128xf32, #hivm.address_space<ub>>)
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_18_outlined_vf_0(%alloc_109, %alloc_112) {hivm.vector_function, no_inline} : (memref<2x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 108 : i64}
      hivm.hir.anchor {id = 109 : i64}
      hivm.hir.anchor {id = 110 : i64}
      hivm.hir.anchor {id = 111 : i64}
      hivm.hir.anchor {id = 112 : i64}
      hivm.hir.anchor {id = 113 : i64}
      hivm.hir.anchor {id = 114 : i64}
      hivm.hir.anchor {id = 115 : i64}
      hivm.hir.anchor {id = 116 : i64}
      %alloc_113 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_114 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %reinterpret_cast_115 = memref.reinterpret_cast %arg12 to offset: [%59], sizes: [64, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_116 = memref.reinterpret_cast %arg13 to offset: [%59], sizes: [64, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_117 = memref.reinterpret_cast %arg16 to offset: [%59], sizes: [64, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_118 = memref.subview %alloc_66[%76, 0] [%75, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_119 = memref.subview %reinterpret_cast_115[%13, 0] [%71, 128] [1, 1] : memref<64x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_118 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_119 : memref<?x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      %subview_120 = memref.subview %reinterpret_cast_116[%13, 0] [%71, 128] [1, 1] : memref<64x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_121 = memref.subview %reinterpret_cast_117[%13, 0] [%71, 128] [1, 1] : memref<64x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_122 = memref.alloc() {alignment = 64 : i64} : memref<64xf16, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_1_outlined_merged_merged_vf_0(%13, %alloc_4, %alloc_100, %alloc_66, %alloc_103, %alloc_61, %alloc_112, %alloc_96, %alloc_57, %34, %alloc_113, %alloc_73, %alloc_95, %alloc_64, %alloc_114, %alloc_4, %arg20, %alloc_122) {hivm.vector_function, no_inline, ptc_simdvf} : (index, memref<64xi32, #hivm.address_space<ub>>, memref<32x128xbf16, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, i32, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>, i32, memref<64xf16, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 117 : i64}
      hivm.hir.anchor {id = 118 : i64}
      hivm.hir.anchor {id = 119 : i64}
      hivm.hir.anchor {id = 120 : i64}
      hivm.hir.anchor {id = 121 : i64}
      hivm.hir.anchor {id = 122 : i64}
      hivm.hir.anchor {id = 123 : i64}
      hivm.hir.anchor {id = 124 : i64}
      hivm.hir.anchor {id = 125 : i64}
      hivm.hir.anchor {id = 126 : i64}
      hivm.hir.anchor {id = 127 : i64}
      hivm.hir.anchor {id = 128 : i64}
      hivm.hir.anchor {id = 129 : i64}
      hivm.hir.anchor {id = 130 : i64}
      hivm.hir.anchor {id = 131 : i64}
      hivm.hir.anchor {id = 132 : i64}
      hivm.hir.anchor {id = 133 : i64}
      hivm.hir.anchor {id = 134 : i64}
      %subview_123 = memref.subview %alloc_114[%76, 0] [%75, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.store ins(%subview_123 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_120 : memref<?x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      %subview_124 = memref.subview %alloc_113[%76, 0] [%75, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.store ins(%subview_124 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_121 : memref<?x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      %alloc_125 = memref.alloc() : memref<64x256x1xi1, #hivm.address_space<ub>>
      %subview_126 = memref.subview %alloc_125[0, 0, 0] [64, 32, 1] [1, 1, 1] : memref<64x256x1xi1, #hivm.address_space<ub>> to memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_20_outlined_vf_1(%alloc_4, %alloc_4, %13, %alloc_122, %alloc_122, %13, %subview_126) {hivm.vector_function, no_inline} : (memref<64xi32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>, index, memref<64xf16, #hivm.address_space<ub>>, memref<64xf16, #hivm.address_space<ub>>, index, memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 135 : i64}
      %alloc_127 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_21_outlined_vf_0(%alloc_91, %alloc_5, %alloc_127) {hivm.vector_function, no_inline} : (memref<64x32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 136 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 137 : i64}
      hivm.hir.anchor {id = 138 : i64}
      hivm.hir.anchor {id = 139 : i64}
      %alloc_128 = memref.alloc() : memref<2x65x16x1xbf16, #hivm.address_space<ub>>
      %subview_129 = memref.subview %alloc_128[0, 0, 0, 0] [2, 64, 16, 1] [1, 1, 1, 1] : memref<2x65x16x1xbf16, #hivm.address_space<ub>> to memref<2x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_22_outlined_vf_0(%subview_126, %alloc_127, %subview_129) {hivm.vector_function, no_inline} : (memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>, memref<2x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_130 = memref.expand_shape %subview_129 [[0], [1, 2], [3]] output_shape [2, 4, 16, 16] : memref<2x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<2x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_131 = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_132 = memref.subview %alloc_131[%16, 0, 0, 0] [2, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<2x4x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_131 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = 0 : index} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      hivm.hir.anchor {id = 140 : i64}
      %collapse_shape_133 = memref.collapse_shape %expand_shape_130 [[0], [1, 2, 3]] : memref<2x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<2x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_134 = memref.collapse_shape %subview_132 [[0], [1, 2, 3]] : memref<2x4x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x1024xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_133 : memref<2x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_134 : memref<2x1024xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 141 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 142 : i64}
      hivm.hir.anchor {id = 143 : i64}
      hivm.hir.anchor {id = 144 : i64}
      %alloc_135 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_135 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 145 : i64}
      hivm.hir.anchor {id = 146 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %alloc_136 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_23_outlined_vf_0(%alloc_135, %alloc_136) {hivm.vector_function, no_inline} : (memref<64x32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 147 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
      %alloc_137 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_7(%subview_126, %alloc_136, %alloc_137) {hivm.vector_function, no_inline} : (memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 148 : i64}
      %reinterpret_cast_138 = memref.reinterpret_cast %arg18 to offset: [%58], sizes: [64, 64], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x64xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_139 = memref.subview %alloc_137[%66, 0] [%67, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<?x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 149 : i64}
      %subview_140 = memref.subview %reinterpret_cast_138[0, %13] [%67, 32] [1, 1] : memref<64x64xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_139 : memref<?x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_140 : memref<?x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.anchor {id = 150 : i64}
      %89 = arith.minsi %53, %c32_i64 : i64
      %90 = arith.maxsi %89, %c0_i64 : i64
      hivm.hir.stride_store ins(%alloc_98 : memref<32xf32, #hivm.address_space<ub>>) outs(%arg17 : memref<?xf32, #hivm.address_space<gm>>) offset(%52 : i64) strides([%c96_i64 : i64]) numels([%90 : i64])
      hivm.hir.anchor {id = 151 : i64}
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.anchor {id = 152 : i64}
    return
  }
}
