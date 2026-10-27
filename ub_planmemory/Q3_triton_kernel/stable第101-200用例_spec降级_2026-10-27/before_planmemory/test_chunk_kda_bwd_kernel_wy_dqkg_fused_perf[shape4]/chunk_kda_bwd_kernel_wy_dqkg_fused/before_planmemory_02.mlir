#map = affine_map<()[s0, s1] -> (s0 + s1 * 32)>
#map1 = affine_map<()[s0, s1] -> (s0 - s1)>
#map2 = affine_map<()[s0, s1] -> (s0 + s1 * 2048)>
#map3 = affine_map<()[s0, s1] -> ((s0 - s1) ceildiv 16)>
#map4 = affine_map<()[s0] -> (s0 floordiv 16)>
#map5 = affine_map<()[s0] -> (s0 mod 16)>
#map6 = affine_map<()[s0, s1] -> (s0 + s1 * 4096)>
#map7 = affine_map<()[s0] -> (s0 + 64)>
#map8 = affine_map<()[s0, s1] -> (s0 + s1)>
#map9 = affine_map<(d0) -> (d0, 0)>
#map10 = affine_map<(d0) -> (0, d0)>
#map11 = affine_map<()[s0] -> (s0 + 4)>
#map12 = affine_map<()[s0] -> (s0 + 8)>
#map13 = affine_map<()[s0] -> (s0 + 12)>
#map14 = affine_map<()[s0] -> (s0 + 16)>
#map15 = affine_map<()[s0] -> (s0 + 20)>
#map16 = affine_map<()[s0] -> (s0 + 24)>
#map17 = affine_map<()[s0] -> (s0 + 28)>
#map18 = affine_map<()[s0] -> (s0 + 32)>
#map19 = affine_map<()[s0] -> (s0 + 36)>
#map20 = affine_map<()[s0] -> (s0 + 40)>
#map21 = affine_map<()[s0] -> (s0 + 44)>
#map22 = affine_map<()[s0] -> (s0 + 48)>
#map23 = affine_map<()[s0] -> (s0 + 52)>
#map24 = affine_map<()[s0] -> (s0 + 56)>
#map25 = affine_map<()[s0] -> (s0 + 60)>
#map26 = affine_map<(d0) -> (d0 * 16)>
#map27 = affine_map<()[s0] -> (s0 + 2)>
#map28 = affine_map<()[s0] -> (s0 + 6)>
#map29 = affine_map<()[s0] -> (s0 + 10)>
#map30 = affine_map<()[s0] -> (s0 + 14)>
#map31 = affine_map<()[s0] -> (s0 + 18)>
#map32 = affine_map<()[s0] -> (s0 + 22)>
#map33 = affine_map<()[s0] -> (s0 + 26)>
#map34 = affine_map<()[s0] -> (s0 + 30)>
#map35 = affine_map<()[s0] -> (s0 * 2048)>
#map36 = affine_map<()[s0] -> (s0 * 2048 + 1024)>
#map37 = affine_map<()[s0] -> (s0 * 32)>
#map38 = affine_map<()[s0] -> (s0 * 64)>
#map39 = affine_map<()[s0] -> (s0 * 4)>
#map40 = affine_map<()[s0] -> (s0 * 2)>
#map41 = affine_map<()[s0] -> (s0 * 32 + 32)>
#map42 = affine_map<()[s0, s1, s2] -> (-s0 + s1 - s2)>
#map43 = affine_map<()[s0, s1] -> (s0 - s1 * 32)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<MIX>, ssbuffer.insertionOptimization} {
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_backup(%arg0: memref<?xi8> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xbf16> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg19: f32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, annotation.filter_passes = #annotation.filter_passes<"hivm-insert-anchors-and-backup,hivm-delayed-cross-core-gss,split-simt-module,hivm-merge-same-preload-scopes">, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<24xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.backup_function, hivm.func_core_type = #hivm.func_core_type<MIX>, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    hivm.hir.anchor {id = 0 : i64}
    %c8 = arith.constant 8 : index
    %c64_i32 = arith.constant 64 : i32
    %c32_i32 = arith.constant 32 : i32
    %c64 = arith.constant 64 : index
    %c32_i64 = arith.constant 32 : i64
    %c128_i64 = arith.constant 128 : i64
    %c64_i64 = arith.constant 64 : i64
    %c0_i32 = arith.constant 0 : i32
    %c4096_i64 = arith.constant 4096 : i64
    %cst = arith.constant 0.000000e+00 : f32
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
      %13 = arith.divsi %6, %c32_i32 : i32
      %14 = arith.remsi %6, %c32_i32 : i32
      %15 = arith.addi %arg20, %c63_i32 : i32
      %16 = arith.divsi %15, %c64_i32 : i32
      %17 = arith.muli %13, %16 : i32
      %18 = arith.addi %17, %4 : i32
      %19 = arith.extsi %18 : i32 to i64
      %20 = arith.muli %13, %arg20 : i32
      %21 = arith.extsi %20 : i32 to i64
      %22 = arith.muli %4, %c64_i32 : i32
      %23 = tensor.empty() : tensor<64xi32>
      %24 = hivm.hir.varange offset[%c0] strides[%c1] outs(%23 : tensor<64xi32>) -> tensor<64xi32>
      hivm.hir.anchor {id = 7 : i64}
      %25 = hivm.hir.vadd ins(%24, %22 : tensor<64xi32>, i32) outs(%23 : tensor<64xi32>) -> tensor<64xi32>
      hivm.hir.anchor {id = 8 : i64}
      %26 = tensor.empty() : tensor<64xi1>
      %27 = hivm.hir.vcmp ins(%25, %arg20 : tensor<64xi32>, i32) outs(%26 : tensor<64xi1>) compare_mode = <lt> -> tensor<64xi1>
      hivm.hir.anchor {id = 9 : i64}
      %28 = arith.addi %22, %c64_i32 : i32
      %29 = arith.minsi %arg20, %28 : i32
      %30 = arith.subi %29, %c1_i32 : i32
      %31 = hivm.hir.vcmp ins(%25, %30 : tensor<64xi32>, i32) outs(%26 : tensor<64xi1>) -> tensor<64xi1>
      hivm.hir.anchor {id = 10 : i64}
      %32 = arith.muli %21, %c32_i64 : i64
      %33 = arith.extsi %14 : i32 to i64
      %34 = arith.addi %32, %33 : i64
      %35 = arith.muli %34, %c128_i64 : i64
      %36 = arith.index_cast %35 : i64 to index
      %37 = arith.index_cast %34 : i64 to index
      %38 = arith.muli %34, %c64_i64 : i64
      %39 = arith.index_cast %38 : i64 to index
      %40 = arith.muli %19, %c32_i64 : i64
      %41 = arith.addi %40, %33 : i64
      %42 = arith.muli %41, %c16384_i64 : i64
      %43 = arith.index_cast %42 : i64 to index
      %44 = arith.maxsi %22, %c0_i32 : i32
      %45 = arith.index_cast %44 : i32 to index
      %46 = affine.apply #map()[%37, %45]
      %47 = arith.index_cast %arg20 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg7 to offset: [%46], sizes: [64], strides: [32] : memref<?xf32> to memref<64xf32, strided<[32], offset: ?>>
      %alloc = memref.alloc() : memref<64xf32>
      %48 = affine.apply #map1()[%47, %45]
      %49 = arith.maxsi %48, %c0 : index
      %50 = arith.minsi %49, %c64 : index
      %51 = arith.subi %c0_i32, %22 : i32
      %52 = arith.maxsi %51, %c0_i32 : i32
      %53 = arith.index_cast %52 : i32 to index
      %54 = arith.minsi %53, %50 : index
      %55 = affine.apply #map1()[%50, %54]
      %56 = arith.cmpi slt, %55, %c64 : index
      %subview = memref.subview %reinterpret_cast[0] [%55] [1] : memref<64xf32, strided<[32], offset: ?>> to memref<?xf32, strided<[32], offset: ?>>
      %subview_6 = memref.subview %alloc[%54] [%55] [1] : memref<64xf32> to memref<?xf32, strided<[1], offset: ?>>
      %57 = arith.remui %54, %c8 : index
      hivm.hir.anchor {id = 11 : i64}
      hivm.hir.load ins(%subview : memref<?xf32, strided<[32], offset: ?>>) outs(%subview_6 : memref<?xf32, strided<[1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %57 : index init_out_buffer = true init_condition = %56 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 12 : i64}
      %58 = bufferization.to_tensor %alloc restrict writable : memref<64xf32>
      %59 = affine.apply #map2()[%39, %45]
      %reinterpret_cast_7 = memref.reinterpret_cast %arg8 to offset: [%59], sizes: [64, 64], strides: [2048, 1] : memref<?xbf16> to memref<64x64xbf16, strided<[2048, 1], offset: ?>>
      %subview_8 = memref.subview %reinterpret_cast_7[0, 0] [%55, 64] [1, 1] : memref<64x64xbf16, strided<[2048, 1], offset: ?>> to memref<?x64xbf16, strided<[2048, 1], offset: ?>>
      %cast = memref.cast %subview_8 : memref<?x64xbf16, strided<[2048, 1], offset: ?>> to memref<?x?xbf16, strided<[2048, 1], offset: ?>>
      %60 = affine.apply #map3()[%50, %54]
      %61 = affine.apply #map4()[%54]
      %62 = affine.apply #map5()[%54]
      %alloc_9 = memref.alloc() : memref<4x4x16x16xbf16>
      %subview_10 = memref.subview %alloc_9[0, %61, %62, 0] [4, %60, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xbf16> to memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_11 = memref.cast %subview_10 : memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 13 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast : memref<?x?xbf16, strided<[2048, 1], offset: ?>>) outs(%cast_11 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %56 : i1
      hivm.hir.anchor {id = 14 : i64}
      %63 = bufferization.to_tensor %alloc_9 restrict writable : memref<4x4x16x16xbf16>
      %64 = affine.apply #map6()[%36, %45]
      %reinterpret_cast_12 = memref.reinterpret_cast %arg3 to offset: [%64], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_13 = memref.reinterpret_cast %arg6 to offset: [%64], sizes: [64, 128], strides: [4096, 1] : memref<?xf32> to memref<64x128xf32, strided<[4096, 1], offset: ?>>
      %alloc_14 = memref.alloc() : memref<64x128xbf16>
      %subview_15 = memref.subview %reinterpret_cast_12[0, 0] [%55, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %subview_16 = memref.subview %alloc_14[%54, 0] [%55, 128] [1, 1] : memref<64x128xbf16> to memref<?x128xbf16, strided<[128, 1], offset: ?>>
      hivm.hir.anchor {id = 15 : i64}
      hivm.hir.load ins(%subview_15 : memref<?x128xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_16 : memref<?x128xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 init_out_buffer = true init_condition = %56 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 16 : i64}
      %65 = bufferization.to_tensor %alloc_14 restrict writable : memref<64x128xbf16>
      %alloc_17 = memref.alloc() : memref<64x128xf32>
      %subview_18 = memref.subview %reinterpret_cast_13[0, 0] [%55, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>> to memref<?x128xf32, strided<[4096, 1], offset: ?>>
      %subview_19 = memref.subview %alloc_17[%54, 0] [%55, 128] [1, 1] : memref<64x128xf32> to memref<?x128xf32, strided<[128, 1], offset: ?>>
      hivm.hir.anchor {id = 17 : i64}
      hivm.hir.load ins(%subview_18 : memref<?x128xf32, strided<[4096, 1], offset: ?>>) outs(%subview_19 : memref<?x128xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 init_out_buffer = true init_condition = %56 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 18 : i64}
      %66 = bufferization.to_tensor %alloc_17 restrict writable : memref<64x128xf32>
      %67 = arith.extsi %30 : i32 to i64
      %68 = arith.muli %67, %c4096_i64 : i64
      %69 = arith.addi %35, %68 : i64
      %70 = arith.index_cast %69 : i64 to index
      %reinterpret_cast_20 = memref.reinterpret_cast %arg6 to offset: [%70], sizes: [128], strides: [1] : memref<?xf32> to memref<128xf32, strided<[1], offset: ?>>
      %alloc_21 = memref.alloc() : memref<128xf32>
      hivm.hir.anchor {id = 19 : i64}
      hivm.hir.load ins(%reinterpret_cast_20 : memref<128xf32, strided<[1], offset: ?>>) outs(%alloc_21 : memref<128xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 20 : i64}
      %71 = bufferization.to_tensor %alloc_21 restrict writable : memref<128xf32>
      %reinterpret_cast_22 = memref.reinterpret_cast %arg5 to offset: [%64], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_23 = memref.reinterpret_cast %arg10 to offset: [%64], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_24 = memref.reinterpret_cast %arg9 to offset: [%43], sizes: [128, 128], strides: [128, 1] : memref<?xf32> to memref<128x128xf32, strided<[128, 1], offset: ?>>
      %reinterpret_cast_25 = memref.reinterpret_cast %arg11 to offset: [%43], sizes: [128, 128], strides: [128, 1] : memref<?xf32> to memref<128x128xf32, strided<[128, 1], offset: ?>>
      %reinterpret_cast_26 = memref.reinterpret_cast %arg14 to offset: [%64], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %subview_27 = memref.subview %reinterpret_cast_22[0, 0] [%55, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %cast_28 = memref.cast %subview_27 : memref<?x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
      %alloc_29 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_30 = memref.subview %alloc_29[0, %61, %62, 0] [8, %60, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_31 = memref.cast %subview_30 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 21 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_28 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%cast_31 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %56 : i1
      hivm.hir.anchor {id = 22 : i64}
      %72 = bufferization.to_tensor %alloc_29 restrict writable : memref<8x4x16x16xbf16>
      %subview_32 = memref.subview %reinterpret_cast_23[0, 0] [%55, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %cast_33 = memref.cast %subview_32 : memref<?x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
      %alloc_34 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_35 = memref.subview %alloc_34[0, %61, %62, 0] [8, %60, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_36 = memref.cast %subview_35 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 23 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_33 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%cast_36 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %56 : i1
      hivm.hir.anchor {id = 24 : i64}
      %73 = bufferization.to_tensor %alloc_34 restrict writable : memref<8x4x16x16xbf16>
      %alloc_37 = memref.alloc() : memref<128x128xf32>
      hivm.hir.anchor {id = 25 : i64}
      hivm.hir.load ins(%reinterpret_cast_24 : memref<128x128xf32, strided<[128, 1], offset: ?>>) outs(%alloc_37 : memref<128x128xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 26 : i64}
      %74 = bufferization.to_tensor %alloc_37 restrict writable : memref<128x128xf32>
      %alloc_38 = memref.alloc() : memref<128x128xf32>
      hivm.hir.anchor {id = 27 : i64}
      hivm.hir.load ins(%reinterpret_cast_25 : memref<128x128xf32, strided<[128, 1], offset: ?>>) outs(%alloc_38 : memref<128x128xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 28 : i64}
      %75 = bufferization.to_tensor %alloc_38 restrict writable : memref<128x128xf32>
      %subview_39 = memref.subview %reinterpret_cast_26[0, 0] [%55, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %cast_40 = memref.cast %subview_39 : memref<?x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
      %alloc_41 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_42 = memref.subview %alloc_41[0, %61, %62, 0] [8, %60, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_43 = memref.cast %subview_42 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 29 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_40 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%cast_43 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %56 : i1
      hivm.hir.anchor {id = 30 : i64}
      %76 = bufferization.to_tensor %alloc_41 restrict writable : memref<8x4x16x16xbf16>
      %77 = tensor.empty() : tensor<128x128xf32>
      hivm.hir.anchor {id = 31 : i64}
      %78 = hivm.hir.vmul ins(%74, %75 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%77 : tensor<128x128xf32>) -> tensor<128x128xf32>
      hivm.hir.anchor {id = 32 : i64}
      %expanded = tensor.expand_shape %10 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
      %79 = hivm.hir.vreduce <sum> ins(%78 : tensor<128x128xf32>) outs(%expanded : tensor<1x128xf32>) reduce_dims = [0] -> tensor<1x128xf32>
      hivm.hir.anchor {id = 33 : i64}
      %collapsed = tensor.collapse_shape %79 [[0, 1]] : tensor<1x128xf32> into tensor<128xf32>
      %80 = tensor.empty() : tensor<128x128xbf16>
      %81 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%74 : tensor<128x128xf32>) outs(%80 : tensor<128x128xbf16>) -> tensor<128x128xbf16>
      hivm.hir.anchor {id = 34 : i64}
      %expanded_44 = tensor.expand_shape %81 [[0], [1, 2]] output_shape [128, 8, 16] : tensor<128x128xbf16> into tensor<128x8x16xbf16>
      %82 = tensor.empty() : tensor<8x128x16xbf16>
      %83 = hivm.hir.vtranspose ins(%expanded_44 : tensor<128x8x16xbf16>) outs(%82 : tensor<8x128x16xbf16>) permutation = [1, 0, 2] -> tensor<8x128x16xbf16>
      hivm.hir.anchor {id = 35 : i64}
      %expanded_45 = tensor.expand_shape %83 [[0], [1, 2], [3]] output_shape [8, 8, 16, 16] : tensor<8x128x16xbf16> into tensor<8x8x16x16xbf16>
      %alloc_46 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_46 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %84 = bufferization.to_tensor %alloc_46 restrict writable : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      hivm.hir.anchor {id = 36 : i64}
      hivm.hir.copy ins(%expanded_45 : tensor<8x8x16x16xbf16>) outs(%alloc_46 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 37 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %85 = tensor.empty() : tensor<8x4x16x16xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %86 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%73, %84, %true, %c64, %c128, %c128 : tensor<8x4x16x16xbf16>, tensor<8x8x16x16xbf16>, i1, index, index, index) outs(%85 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 38 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %alloc_47 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_47 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast = memref.memory_space_cast %alloc_47 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %87 = bufferization.to_tensor %memspacecast restrict writable : memref<64x128xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
      hivm.hir.anchor {id = 39 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%86 : tensor<8x4x16x16xf32>) outs(%alloc_47 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 40 : i64}
      %88 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%75 : tensor<128x128xf32>) outs(%80 : tensor<128x128xbf16>) -> tensor<128x128xbf16>
      hivm.hir.anchor {id = 41 : i64}
      %expanded_48 = tensor.expand_shape %88 [[0], [1, 2]] output_shape [128, 8, 16] : tensor<128x128xbf16> into tensor<128x8x16xbf16>
      %89 = hivm.hir.vtranspose ins(%expanded_48 : tensor<128x8x16xbf16>) outs(%82 : tensor<8x128x16xbf16>) permutation = [1, 0, 2] -> tensor<8x128x16xbf16>
      hivm.hir.anchor {id = 42 : i64}
      %expanded_49 = tensor.expand_shape %89 [[0], [1, 2], [3]] output_shape [8, 8, 16, 16] : tensor<8x128x16xbf16> into tensor<8x8x16x16xbf16>
      %alloc_50 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_50 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %90 = bufferization.to_tensor %alloc_50 restrict writable : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      hivm.hir.anchor {id = 43 : i64}
      hivm.hir.copy ins(%expanded_49 : tensor<8x8x16x16xbf16>) outs(%alloc_50 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 44 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %91 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%72, %90, %true, %c64, %c128, %c128 : tensor<8x4x16x16xbf16>, tensor<8x8x16x16xbf16>, i1, index, index, index) outs(%85 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 45 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      %alloc_51 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_51 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_52 = memref.memory_space_cast %alloc_51 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %92 = bufferization.to_tensor %memspacecast_52 restrict writable : memref<64x128xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 46 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%91 : tensor<8x4x16x16xf32>) outs(%alloc_51 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 47 : i64}
      %alloc_53 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_53 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %93 = bufferization.to_tensor %alloc_53 restrict writable : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      hivm.hir.anchor {id = 48 : i64}
      hivm.hir.copy ins(%expanded_45 : tensor<8x8x16x16xbf16>) outs(%alloc_53 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 49 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %94 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%76, %93, %true, %c64, %c128, %c128 : tensor<8x4x16x16xbf16>, tensor<8x8x16x16xbf16>, i1, index, index, index) outs(%85 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 50 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      %alloc_54 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_54 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_55 = memref.memory_space_cast %alloc_54 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %95 = bufferization.to_tensor %memspacecast_55 restrict writable : memref<64x128xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 51 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%94 : tensor<8x4x16x16xf32>) outs(%alloc_54 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 52 : i64}
      %reinterpret_cast_56 = memref.reinterpret_cast %arg4 to offset: [%64], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_57 = memref.reinterpret_cast %arg15 to offset: [%64], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %alloc_58 = memref.alloc() : memref<64x128xbf16>
      %subview_59 = memref.subview %reinterpret_cast_56[0, 0] [%55, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %cast_60 = memref.cast %subview_59 : memref<?x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
      %subview_61 = memref.subview %alloc_58[%54, 0] [%55, 128] [1, 1] : memref<64x128xbf16> to memref<?x128xbf16, strided<[128, 1], offset: ?>>
      %alloc_62 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_63 = memref.subview %alloc_62[0, %61, %62, 0] [8, %60, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_64 = memref.cast %subview_63 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 53 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_60 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%cast_64 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %56 : i1
      hivm.hir.anchor {id = 54 : i64}
      %96 = bufferization.to_tensor %alloc_62 restrict writable : memref<8x4x16x16xbf16>
      hivm.hir.anchor {id = 55 : i64}
      hivm.hir.load ins(%subview_59 : memref<?x128xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_61 : memref<?x128xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 init_out_buffer = true init_condition = %56 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 56 : i64}
      %97 = bufferization.to_tensor %alloc_58 restrict writable : memref<64x128xbf16>
      %98 = tensor.empty() : tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 57 : i64}
      %99 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, hivm.remain_in_l0c, normalized_in_L0C} ins(%76, %96, %true, %c64, %c128, %c64 : tensor<8x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%98 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 58 : i64}
      %100 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%63, %76, %true, %c64, %c64, %c128 : tensor<4x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%85 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 59 : i64}
      %alloc_65 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_65 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_66 = memref.memory_space_cast %alloc_65 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %101 = bufferization.to_tensor %memspacecast_66 restrict writable : memref<64x128xf32>
      hivm.hir.anchor {id = 60 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%100 : tensor<8x4x16x16xf32>) outs(%alloc_65 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 61 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %expanded_67 = tensor.expand_shape %58 [[0, 1]] output_shape [64, 1] : tensor<64xf32> into tensor<64x1xf32>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %102 = hivm.hir.vmul ins(%101, %expanded_67 : tensor<64x128xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 62 : i64}
      %103 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%97 : tensor<64x128xbf16>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 63 : i64}
      %104 = hivm.hir.vmul ins(%101, %103 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 64 : i64}
      %expanded_68 = tensor.expand_shape %12 [[0, 1]] output_shape [64, 1] : tensor<64xf32> into tensor<64x1xf32>
      %105 = hivm.hir.vreduce <sum> ins(%104 : tensor<64x128xf32>) outs(%expanded_68 : tensor<64x1xf32>) reduce_dims = [1] -> tensor<64x1xf32>
      hivm.hir.anchor {id = 65 : i64}
      %collapsed_69 = tensor.collapse_shape %105 [[0, 1]] : tensor<64x1xf32> into tensor<64xf32>
      %106 = tensor.empty() : tensor<64x128xbf16>
      %107 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%102 : tensor<64x128xf32>) outs(%106 : tensor<64x128xbf16>) -> tensor<64x128xbf16>
      hivm.hir.anchor {id = 66 : i64}
      %extracted_slice = tensor.extract_slice %107[%54, 0] [%55, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xbf16> to tensor<?x128xbf16>
      hivm.hir.anchor {id = 67 : i64}
      %subview_70 = memref.subview %reinterpret_cast_57[0, 0] [%55, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice : tensor<?x128xbf16>) outs(%subview_70 : memref<?x128xbf16, strided<[4096, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 68 : i64}
      %108 = hivm.hir.vmul ins(%66, %cst_2 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 69 : i64}
      %109 = hivm.hir.vexp ins(%108 : tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 70 : i64}
      %110 = hivm.hir.vmul ins(%109, %expanded_67 : tensor<64x128xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 71 : i64}
      %111 = hivm.hir.vmul ins(%71, %cst_2 : tensor<128xf32>, f32) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 72 : i64}
      %112 = hivm.hir.vexp ins(%111 : tensor<128xf32>) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 73 : i64}
      %113 = hivm.hir.vmul ins(%collapsed, %112 : tensor<128xf32>, tensor<128xf32>) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 74 : i64}
      %114 = hivm.hir.vmul ins(%87, %109 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 75 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
      %115 = hivm.hir.vmul ins(%114, %arg19 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 76 : i64}
      %expanded_71 = tensor.expand_shape %71 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
      %116 = hivm.hir.vsub ins(%expanded_71, %66 : tensor<1x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [0] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 77 : i64}
      %117 = hivm.hir.vmul ins(%116, %cst_2 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 78 : i64}
      %118 = hivm.hir.vexp ins(%117 : tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 79 : i64}
      %119 = arith.index_cast %22 : i32 to index
      %120 = affine.apply #map7()[%119]
      %121 = arith.maxsi %119, %47 : index
      %122 = arith.minsi %120, %121 : index
      %123 = affine.apply #map1()[%122, %119]
      %extracted_slice_72 = tensor.extract_slice %118[0, 0] [%123, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 80 : i64}
      %inserted_slice = tensor.insert_slice %extracted_slice_72 into %8[0, 0] [%123, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<?x128xf32> into tensor<64x128xf32>
      hivm.hir.anchor {id = 81 : i64}
      %124 = hivm.hir.vmul ins(%92, %inserted_slice : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 82 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
      %125 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%65 : tensor<64x128xbf16>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 83 : i64}
      %126 = hivm.hir.vmul ins(%125, %109 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 84 : i64}
      %127 = hivm.hir.vmul ins(%95, %cst_5 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 85 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
      %128 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%127 : tensor<64x128xf32>) outs(%106 : tensor<64x128xbf16>) -> tensor<64x128xbf16>
      hivm.hir.anchor {id = 86 : i64}
      %129 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%126 : tensor<64x128xf32>) outs(%106 : tensor<64x128xbf16>) -> tensor<64x128xbf16>
      hivm.hir.anchor {id = 87 : i64}
      %expanded_73 = tensor.expand_shape %128 [[0], [1, 2]] output_shape [64, 8, 16] : tensor<64x128xbf16> into tensor<64x8x16xbf16>
      %130 = tensor.empty() : tensor<8x64x16xbf16>
      %131 = hivm.hir.vtranspose ins(%expanded_73 : tensor<64x8x16xbf16>) outs(%130 : tensor<8x64x16xbf16>) permutation = [1, 0, 2] -> tensor<8x64x16xbf16>
      hivm.hir.anchor {id = 88 : i64}
      %expanded_74 = tensor.expand_shape %131 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : tensor<8x64x16xbf16> into tensor<8x4x16x16xbf16>
      %alloc_75 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_75 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %132 = bufferization.to_tensor %alloc_75 restrict writable : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      hivm.hir.anchor {id = 89 : i64}
      hivm.hir.copy ins(%expanded_74 : tensor<8x4x16x16xbf16>) outs(%alloc_75 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 90 : i64}
      %expanded_76 = tensor.expand_shape %129 [[0], [1, 2]] output_shape [64, 8, 16] : tensor<64x128xbf16> into tensor<64x8x16xbf16>
      %133 = hivm.hir.vtranspose ins(%expanded_76 : tensor<64x8x16xbf16>) outs(%130 : tensor<8x64x16xbf16>) permutation = [1, 0, 2] -> tensor<8x64x16xbf16>
      hivm.hir.anchor {id = 91 : i64}
      %expanded_77 = tensor.expand_shape %133 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : tensor<8x64x16xbf16> into tensor<8x4x16x16xbf16>
      %alloc_78 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_78 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %134 = bufferization.to_tensor %alloc_78 restrict writable : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 92 : i64}
      hivm.hir.copy ins(%expanded_77 : tensor<8x4x16x16xbf16>) outs(%alloc_78 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 93 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %135 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%132, %134, %false, %c64, %c128, %c64 : tensor<8x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%99 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 94 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      %alloc_79 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_79 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast_80 = memref.memory_space_cast %alloc_79 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %136 = bufferization.to_tensor %memspacecast_80 restrict writable : memref<64x64xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 95 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%135 : tensor<4x4x16x16xf32>) outs(%alloc_79 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 96 : i64}
      %alloc_81 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_81 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %137 = bufferization.to_tensor %alloc_81 restrict writable : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      hivm.hir.anchor {id = 97 : i64}
      hivm.hir.copy ins(%expanded_74 : tensor<8x4x16x16xbf16>) outs(%alloc_81 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 98 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %138 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%63, %137, %true, %c64, %c64, %c128 : tensor<4x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%85 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 99 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      %alloc_82 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_82 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_83 = memref.memory_space_cast %alloc_82 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %139 = bufferization.to_tensor %memspacecast_83 restrict writable : memref<64x128xf32>
      hivm.hir.anchor {id = 100 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%138 : tensor<8x4x16x16xf32>) outs(%alloc_82 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 101 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %140 = hivm.hir.vmul ins(%139, %126 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 102 : i64}
      %141 = hivm.hir.vreduce <sum> ins(%140 : tensor<64x128xf32>) outs(%expanded_68 : tensor<64x1xf32>) reduce_dims = [1] -> tensor<64x1xf32>
      hivm.hir.anchor {id = 103 : i64}
      %collapsed_84 = tensor.collapse_shape %141 [[0, 1]] : tensor<64x1xf32> into tensor<64xf32>
      %142 = hivm.hir.vadd ins(%collapsed_69, %collapsed_84 : tensor<64xf32>, tensor<64xf32>) outs(%11 : tensor<64xf32>) -> tensor<64xf32>
      hivm.hir.anchor {id = 104 : i64}
      %reinterpret_cast_85 = memref.reinterpret_cast %arg2 to offset: [%64], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %alloc_86 = memref.alloc() : memref<64x128xbf16>
      %subview_87 = memref.subview %reinterpret_cast_85[0, 0] [%55, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %subview_88 = memref.subview %alloc_86[%54, 0] [%55, 128] [1, 1] : memref<64x128xbf16> to memref<?x128xbf16, strided<[128, 1], offset: ?>>
      hivm.hir.anchor {id = 105 : i64}
      hivm.hir.load ins(%subview_87 : memref<?x128xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_88 : memref<?x128xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 init_out_buffer = true init_condition = %56 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 106 : i64}
      %143 = bufferization.to_tensor %alloc_86 restrict writable : memref<64x128xbf16>
      hivm.hir.anchor {id = 107 : i64}
      %144 = hivm.hir.vmul ins(%125, %124 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 108 : i64}
      %145 = hivm.hir.vreduce <sum> ins(%144 : tensor<64x128xf32>) outs(%expanded : tensor<1x128xf32>) reduce_dims = [0] -> tensor<1x128xf32>
      hivm.hir.anchor {id = 109 : i64}
      %collapsed_89 = tensor.collapse_shape %145 [[0, 1]] : tensor<1x128xf32> into tensor<128xf32>
      %146 = hivm.hir.vadd ins(%113, %collapsed_89 : tensor<128xf32>, tensor<128xf32>) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 110 : i64}
      %147 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%143 : tensor<64x128xbf16>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 111 : i64}
      %148 = hivm.hir.vmul ins(%147, %115 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 112 : i64}
      %149 = hivm.hir.vsub ins(%148, %144 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 113 : i64}
      %expanded_90 = tensor.expand_shape %31 [[0, 1]] output_shape [64, 1] : tensor<64xi1> into tensor<64x1xi1>
      %150 = tensor.empty() : tensor<64x1xf32>
      %151 = hivm.hir.vsel ins(%expanded_90, %cst_1, %cst : tensor<64x1xi1>, f32, f32) outs(%150 : tensor<64x1xf32>) -> tensor<64x1xf32>
      hivm.hir.anchor {id = 114 : i64}
      %expanded_91 = tensor.expand_shape %146 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
      %152 = hivm.hir.vmul ins(%151, %expanded_91 : tensor<64x1xf32>, tensor<1x128xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [0, 1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 115 : i64}
      %153 = hivm.hir.vadd ins(%149, %152 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 116 : i64}
      %154 = hivm.hir.vmul ins(%140, %expanded_67 : tensor<64x128xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 117 : i64}
      %155 = hivm.hir.vadd ins(%153, %154 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 118 : i64}
      %156 = hivm.hir.vmul ins(%139, %110 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 119 : i64}
      %157 = hivm.hir.vadd ins(%124, %156 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 120 : i64}
      %reinterpret_cast_92 = memref.reinterpret_cast %arg12 to offset: [%64], sizes: [64, 128], strides: [4096, 1] : memref<?xf32> to memref<64x128xf32, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_93 = memref.reinterpret_cast %arg13 to offset: [%64], sizes: [64, 128], strides: [4096, 1] : memref<?xf32> to memref<64x128xf32, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_94 = memref.reinterpret_cast %arg16 to offset: [%64], sizes: [64, 128], strides: [4096, 1] : memref<?xf32> to memref<64x128xf32, strided<[4096, 1], offset: ?>>
      %extracted_slice_95 = tensor.extract_slice %115[%54, 0] [%55, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 121 : i64}
      %subview_96 = memref.subview %reinterpret_cast_92[0, 0] [%55, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>> to memref<?x128xf32, strided<[4096, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_95 : tensor<?x128xf32>) outs(%subview_96 : memref<?x128xf32, strided<[4096, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 122 : i64}
      %extracted_slice_97 = tensor.extract_slice %157[%54, 0] [%55, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 123 : i64}
      %subview_98 = memref.subview %reinterpret_cast_93[0, 0] [%55, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>> to memref<?x128xf32, strided<[4096, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_97 : tensor<?x128xf32>) outs(%subview_98 : memref<?x128xf32, strided<[4096, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 124 : i64}
      %extracted_slice_99 = tensor.extract_slice %155[%54, 0] [%55, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 125 : i64}
      %subview_100 = memref.subview %reinterpret_cast_94[0, 0] [%55, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>> to memref<?x128xf32, strided<[4096, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_99 : tensor<?x128xf32>) outs(%subview_100 : memref<?x128xf32, strided<[4096, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 126 : i64}
      %expanded_101 = tensor.expand_shape %25 [[0, 1]] output_shape [64, 1] : tensor<64xi32> into tensor<64x1xi32>
      %158 = tensor.empty() : tensor<64x64xi32>
      %159 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_101 : tensor<64x1xi32>) outs(%158 : tensor<64x64xi32>) broadcast_dims = [1] -> tensor<64x64xi32>
      hivm.hir.anchor {id = 127 : i64}
      %expanded_102 = tensor.expand_shape %25 [[0, 1]] output_shape [1, 64] : tensor<64xi32> into tensor<1x64xi32>
      %160 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_102 : tensor<1x64xi32>) outs(%158 : tensor<64x64xi32>) broadcast_dims = [0] -> tensor<64x64xi32>
      hivm.hir.anchor {id = 128 : i64}
      %161 = tensor.empty() : tensor<64x64xi1>
      %162 = hivm.hir.vcmp ins(%159, %160 : tensor<64x64xi32>, tensor<64x64xi32>) outs(%161 : tensor<64x64xi1>) compare_mode = <gt> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 129 : i64}
      %163 = tensor.empty() : tensor<64xf16>
      %164 = hivm.hir.vsel ins(%27, %cst_4, %cst_3 : tensor<64xi1>, f16, f16) outs(%163 : tensor<64xf16>) -> tensor<64xf16>
      hivm.hir.anchor {id = 130 : i64}
      %expanded_103 = tensor.expand_shape %164 [[0, 1]] output_shape [64, 1] : tensor<64xf16> into tensor<64x1xf16>
      %165 = tensor.empty() : tensor<64x64xf16>
      %166 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_103 : tensor<64x1xf16>) outs(%165 : tensor<64x64xf16>) broadcast_dims = [1] -> tensor<64x64xf16>
      hivm.hir.anchor {id = 131 : i64}
      %167 = hivm.hir.vcmp ins(%166, %cst_3 : tensor<64x64xf16>, f16) outs(%161 : tensor<64x64xi1>) compare_mode = <ne> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 132 : i64}
      %expanded_104 = tensor.expand_shape %164 [[0, 1]] output_shape [1, 64] : tensor<64xf16> into tensor<1x64xf16>
      %168 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_104 : tensor<1x64xf16>) outs(%165 : tensor<64x64xf16>) broadcast_dims = [0] -> tensor<64x64xf16>
      hivm.hir.anchor {id = 133 : i64}
      %169 = hivm.hir.vcmp ins(%168, %cst_3 : tensor<64x64xf16>, f16) outs(%161 : tensor<64x64xi1>) compare_mode = <ne> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 134 : i64}
      %170 = hivm.hir.vand ins(%167, %169 : tensor<64x64xi1>, tensor<64x64xi1>) outs(%161 : tensor<64x64xi1>) -> tensor<64x64xi1>
      hivm.hir.anchor {id = 135 : i64}
      %171 = hivm.hir.vand ins(%162, %170 : tensor<64x64xi1>, tensor<64x64xi1>) outs(%161 : tensor<64x64xi1>) -> tensor<64x64xi1>
      hivm.hir.anchor {id = 136 : i64}
      %expanded_105 = tensor.expand_shape %58 [[0, 1]] output_shape [1, 64] : tensor<64xf32> into tensor<1x64xf32>
      %172 = tensor.empty() : tensor<64x64xf32>
      %173 = hivm.hir.vmul ins(%136, %expanded_105 : tensor<64x64xf32>, tensor<1x64xf32>) outs(%172 : tensor<64x64xf32>) broadcast = [0] -> tensor<64x64xf32>
      hivm.hir.anchor {id = 137 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
      %174 = hivm.hir.vsel ins(%171, %173, %cst : tensor<64x64xi1>, tensor<64x64xf32>, f32) outs(%172 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 138 : i64}
      %175 = tensor.empty() : tensor<64x64xbf16>
      %176 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%174 : tensor<64x64xf32>) outs(%175 : tensor<64x64xbf16>) -> tensor<64x64xbf16>
      hivm.hir.anchor {id = 139 : i64}
      %expanded_106 = tensor.expand_shape %176 [[0], [1, 2]] output_shape [64, 4, 16] : tensor<64x64xbf16> into tensor<64x4x16xbf16>
      %177 = tensor.empty() : tensor<4x64x16xbf16>
      %178 = hivm.hir.vtranspose ins(%expanded_106 : tensor<64x4x16xbf16>) outs(%177 : tensor<4x64x16xbf16>) permutation = [1, 0, 2] -> tensor<4x64x16xbf16>
      hivm.hir.anchor {id = 140 : i64}
      %expanded_107 = tensor.expand_shape %178 [[0], [1, 2], [3]] output_shape [4, 4, 16, 16] : tensor<4x64x16xbf16> into tensor<4x4x16x16xbf16>
      %alloc_108 = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_108 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      %179 = bufferization.to_tensor %alloc_108 restrict writable : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      hivm.hir.anchor {id = 141 : i64}
      hivm.hir.copy ins(%expanded_107 : tensor<4x4x16x16xbf16>) outs(%alloc_108 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 142 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %180 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%179, %63, %true, %c64, %c64, %c64 : tensor<4x4x16x16xbf16>, tensor<4x4x16x16xbf16>, i1, index, index, index) outs(%98 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 143 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      %181 = tensor.empty() : tensor<4x4x16x16xbf16>
      %182 = hivm.hir.fixpipe {pre_quant = #hivm.fixpipe_pre_quant_mode<F322BF16>} ins(%180 : tensor<4x4x16x16xf32>) outs(%181 : tensor<4x4x16x16xbf16>) -> tensor<4x4x16x16xbf16>
      hivm.hir.anchor {id = 144 : i64}
      %183 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%63, %182, %true, %c64, %c64, %c64 : tensor<4x4x16x16xbf16>, tensor<4x4x16x16xbf16>, i1, index, index, index) outs(%98 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 145 : i64}
      %alloc_109 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_109 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast_110 = memref.memory_space_cast %alloc_109 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %184 = bufferization.to_tensor %memspacecast_110 restrict writable : memref<64x64xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.anchor {id = 146 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%183 : tensor<4x4x16x16xf32>) outs(%alloc_109 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 147 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %185 = hivm.hir.vmul ins(%184, %cst_5 : tensor<64x64xf32>, f32) outs(%172 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 148 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
      %186 = hivm.hir.vsel ins(%171, %185, %cst : tensor<64x64xi1>, tensor<64x64xf32>, f32) outs(%172 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 149 : i64}
      %reinterpret_cast_111 = memref.reinterpret_cast %arg18 to offset: [%59], sizes: [64, 64], strides: [2048, 1] : memref<?xf32> to memref<64x64xf32, strided<[2048, 1], offset: ?>>
      %reinterpret_cast_112 = memref.reinterpret_cast %arg17 to offset: [%46], sizes: [64], strides: [32] : memref<?xf32> to memref<64xf32, strided<[32], offset: ?>>
      %extracted_slice_113 = tensor.extract_slice %186[%54, 0] [%55, 64] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x64xf32> to tensor<?x64xf32>
      hivm.hir.anchor {id = 150 : i64}
      %subview_114 = memref.subview %reinterpret_cast_111[0, 0] [%55, 64] [1, 1] : memref<64x64xf32, strided<[2048, 1], offset: ?>> to memref<?x64xf32, strided<[2048, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_113 : tensor<?x64xf32>) outs(%subview_114 : memref<?x64xf32, strided<[2048, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 151 : i64}
      %extracted_slice_115 = tensor.extract_slice %142[%54] [%55] [1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64xf32> to tensor<?xf32>
      hivm.hir.anchor {id = 152 : i64}
      %subview_116 = memref.subview %reinterpret_cast_112[0] [%55] [1] : memref<64xf32, strided<[32], offset: ?>> to memref<?xf32, strided<[32], offset: ?>>
      hivm.hir.store ins(%extracted_slice_115 : tensor<?xf32>) outs(%subview_116 : memref<?xf32, strided<[32], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 153 : i64}
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
    hivm.hir.anchor {id = 154 : i64}
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
      %5 = affine.apply #map8()[%arg18, %arg0]
      %subview = memref.subview %arg1[%5] [1] [1] : memref<64xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %6 = vector.transfer_read %subview[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map9} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
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
        %12 = vector.transfer_read %subview_8[%c0], %cst_3 {in_bounds = [true, true], permutation_map = #map10} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %13 = vector.transfer_read %subview_9[%c0], %cst_3 {in_bounds = [true, true], permutation_map = #map10} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg19: f32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<24xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c28_i32 = arith.constant 28 : i32
    %false = arith.constant false
    %true = arith.constant true
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : bf16
    %c0_i32 = arith.constant 0 : i32
    %c64_i64 = arith.constant 64 : i64
    %c128_i64 = arith.constant 128 : i64
    %c32_i64 = arith.constant 32 : i64
    %c64 = arith.constant 64 : index
    %c32_i32 = arith.constant 32 : i32
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
      %8 = arith.divsi %7, %c32_i32 : i32
      %9 = arith.remsi %7, %c32_i32 : i32
      %10 = arith.muli %8, %arg20 : i32
      %11 = arith.extsi %10 : i32 to i64
      %12 = arith.muli %5, %c64_i32 : i32
      hivm.hir.anchor {id = 7 : i64}
      hivm.hir.anchor {id = 8 : i64}
      hivm.hir.anchor {id = 9 : i64}
      hivm.hir.anchor {id = 10 : i64}
      %13 = arith.muli %11, %c32_i64 : i64
      %14 = arith.extsi %9 : i32 to i64
      %15 = arith.addi %13, %14 : i64
      %16 = arith.muli %15, %c128_i64 : i64
      %17 = arith.index_cast %16 : i64 to index
      %18 = arith.muli %15, %c64_i64 : i64
      %19 = arith.index_cast %18 : i64 to index
      %20 = arith.maxsi %12, %c0_i32 : i32
      %21 = arith.index_cast %20 : i32 to index
      %22 = affine.apply #map1()[%4, %21]
      %23 = arith.maxsi %22, %c0 : index
      %24 = arith.minsi %23, %c64 : index
      %25 = arith.subi %c0_i32, %12 : i32
      %26 = arith.maxsi %25, %c0_i32 : i32
      %27 = arith.index_cast %26 : i32 to index
      %28 = arith.minsi %27, %24 : index
      %29 = affine.apply #map1()[%24, %28]
      %30 = arith.cmpi slt, %29, %c64 : index
      hivm.hir.anchor {id = 11 : i64}
      hivm.hir.anchor {id = 12 : i64}
      %31 = affine.apply #map2()[%19, %21]
      %reinterpret_cast = memref.reinterpret_cast %arg8 to offset: [%31], sizes: [64, 64], strides: [2048, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x64xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
      %subview = memref.subview %reinterpret_cast[0, 0] [%29, 64] [1, 1] : memref<64x64xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
      %cast = memref.cast %subview : memref<?x64xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
      %32 = affine.apply #map3()[%24, %28]
      %33 = affine.apply #map4()[%28]
      %34 = affine.apply #map5()[%28]
      %alloc = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_0 = memref.subview %alloc[0, %33, %34, 0] [4, %32, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_1 = memref.cast %subview_0 : memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 13 : i64}
      scf.if %30 {
        %collapse_shape = memref.collapse_shape %alloc [[0, 1, 2, 3]] : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<4096xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<4096xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast : memref<?x?xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_1 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 14 : i64}
      %35 = affine.apply #map6()[%17, %21]
      hivm.hir.anchor {id = 15 : i64}
      hivm.hir.anchor {id = 16 : i64}
      hivm.hir.anchor {id = 17 : i64}
      hivm.hir.anchor {id = 18 : i64}
      hivm.hir.anchor {id = 19 : i64}
      hivm.hir.anchor {id = 20 : i64}
      %reinterpret_cast_2 = memref.reinterpret_cast %arg5 to offset: [%35], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_3 = memref.reinterpret_cast %arg10 to offset: [%35], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_4 = memref.reinterpret_cast %arg14 to offset: [%35], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_5 = memref.subview %reinterpret_cast_2[0, 0] [%29, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_6 = memref.cast %subview_5 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_7 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_8 = memref.subview %alloc_7[0, %33, %34, 0] [8, %32, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_9 = memref.cast %subview_8 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 21 : i64}
      scf.if %30 {
        %collapse_shape = memref.collapse_shape %alloc_7 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_6 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_9 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 22 : i64}
      %subview_10 = memref.subview %reinterpret_cast_3[0, 0] [%29, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_11 = memref.cast %subview_10 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_12 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_13 = memref.subview %alloc_12[0, %33, %34, 0] [8, %32, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_14 = memref.cast %subview_13 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 23 : i64}
      scf.if %30 {
        %collapse_shape = memref.collapse_shape %alloc_12 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_11 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_14 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 24 : i64}
      hivm.hir.anchor {id = 25 : i64}
      hivm.hir.anchor {id = 26 : i64}
      hivm.hir.anchor {id = 27 : i64}
      hivm.hir.anchor {id = 28 : i64}
      %subview_15 = memref.subview %reinterpret_cast_4[0, 0] [%29, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_16 = memref.cast %subview_15 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_17 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_18 = memref.subview %alloc_17[0, %33, %34, 0] [8, %32, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_19 = memref.cast %subview_18 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 29 : i64}
      scf.if %30 {
        %collapse_shape = memref.collapse_shape %alloc_17 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_16 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_19 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 30 : i64}
      hivm.hir.anchor {id = 31 : i64}
      hivm.hir.anchor {id = 32 : i64}
      hivm.hir.anchor {id = 33 : i64}
      hivm.hir.anchor {id = 34 : i64}
      hivm.hir.anchor {id = 35 : i64}
      %alloc_20 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_20 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 36 : i64}
      hivm.hir.anchor {id = 37 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_21 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_12, %alloc_20, %true, %c64, %c128, %c128 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_21 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 38 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %alloc_22 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_22 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
      hivm.hir.anchor {id = 39 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_21 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_22 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 40 : i64}
      hivm.hir.anchor {id = 41 : i64}
      hivm.hir.anchor {id = 42 : i64}
      %alloc_23 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_23 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 43 : i64}
      hivm.hir.anchor {id = 44 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_24 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_7, %alloc_23, %true, %c64, %c128, %c128 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_24 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 45 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      %alloc_25 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_25 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 46 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_24 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_25 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 47 : i64}
      %alloc_26 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_26 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 48 : i64}
      hivm.hir.anchor {id = 49 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_27 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_17, %alloc_26, %true, %c64, %c128, %c128 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_27 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 50 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      %alloc_28 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_28 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 51 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_27 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_28 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 52 : i64}
      %reinterpret_cast_29 = memref.reinterpret_cast %arg4 to offset: [%35], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_30 = memref.subview %reinterpret_cast_29[0, 0] [%29, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_31 = memref.cast %subview_30 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_32 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_33 = memref.subview %alloc_32[0, %33, %34, 0] [8, %32, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_34 = memref.cast %subview_33 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 53 : i64}
      scf.if %30 {
        %collapse_shape = memref.collapse_shape %alloc_32 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_31 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_34 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 54 : i64}
      hivm.hir.anchor {id = 55 : i64}
      hivm.hir.anchor {id = 56 : i64}
      hivm.hir.anchor {id = 57 : i64}
      %alloc_35 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, hivm.remain_in_l0c, normalized_in_L0C} ins(%alloc_17, %alloc_32, %true, %c64, %c128, %c64 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_35 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 58 : i64}
      %alloc_36 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_17, %true, %c64, %c64, %c128 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_36 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 59 : i64}
      %alloc_37 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_37 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 60 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_36 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_37 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 61 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
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
      hivm.hir.anchor {id = 88 : i64}
      %alloc_38 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_38 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = -1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 89 : i64}
      hivm.hir.anchor {id = 90 : i64}
      hivm.hir.anchor {id = 91 : i64}
      %alloc_39 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_39 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = -1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 92 : i64}
      hivm.hir.anchor {id = 93 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_38, %alloc_39, %false, %c64, %c128, %c64 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_35 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 94 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      %alloc_40 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_40 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 95 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_35 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_40 : memref<64x32xf32, #hivm.address_space<ub>>) dual_dst_mode = <COLUMN_SPLIT>
      hivm.hir.anchor {id = 96 : i64}
      %alloc_41 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_41 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = -1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 97 : i64}
      hivm.hir.anchor {id = 98 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_42 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_41, %true, %c64, %c64, %c128 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_42 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 99 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      %alloc_43 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_43 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 100 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_42 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_43 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 101 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
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
      hivm.hir.anchor {id = 140 : i64}
      %alloc_44 = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_44 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = -1 : index} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 141 : i64}
      hivm.hir.anchor {id = 142 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_45 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_44, %alloc, %true, %c64, %c64, %c64 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_45 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 143 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      %alloc_46 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.fixpipe {pre_quant = #hivm.fixpipe_pre_quant_mode<F322BF16>} ins(%alloc_45 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_46 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 144 : i64}
      %alloc_47 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_46, %true, %c64, %c64, %c64 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_47 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 145 : i64}
      %alloc_48 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_48 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.anchor {id = 146 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_47 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_48 : memref<64x32xf32, #hivm.address_space<ub>>) dual_dst_mode = <COLUMN_SPLIT>
      hivm.hir.anchor {id = 147 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 148 : i64}
      hivm.hir.anchor {id = 149 : i64}
      hivm.hir.anchor {id = 150 : i64}
      hivm.hir.anchor {id = 151 : i64}
      hivm.hir.anchor {id = 152 : i64}
      hivm.hir.anchor {id = 153 : i64}
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.anchor {id = 154 : i64}
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
        %1 = affine.apply #map11()[%arg3]
        %subview_0 = memref.subview %arg0[%1, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = affine.apply #map12()[%arg3]
        %subview_1 = memref.subview %arg0[%3, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = affine.apply #map13()[%arg3]
        %subview_2 = memref.subview %arg0[%5, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %6 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = affine.apply #map14()[%arg3]
        %subview_3 = memref.subview %arg0[%7, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %8 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %9 = affine.apply #map15()[%arg3]
        %subview_4 = memref.subview %arg0[%9, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = affine.apply #map16()[%arg3]
        %subview_5 = memref.subview %arg0[%11, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %12 = vector.transfer_read %subview_5[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %13 = affine.apply #map17()[%arg3]
        %subview_6 = memref.subview %arg0[%13, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %14 = vector.transfer_read %subview_6[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %15 = affine.apply #map18()[%arg3]
        %subview_7 = memref.subview %arg0[%15, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %16 = vector.transfer_read %subview_7[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %17 = affine.apply #map19()[%arg3]
        %subview_8 = memref.subview %arg0[%17, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %18 = vector.transfer_read %subview_8[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %19 = affine.apply #map20()[%arg3]
        %subview_9 = memref.subview %arg0[%19, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %20 = vector.transfer_read %subview_9[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %21 = affine.apply #map21()[%arg3]
        %subview_10 = memref.subview %arg0[%21, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %22 = vector.transfer_read %subview_10[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %23 = affine.apply #map22()[%arg3]
        %subview_11 = memref.subview %arg0[%23, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %24 = vector.transfer_read %subview_11[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %25 = affine.apply #map23()[%arg3]
        %subview_12 = memref.subview %arg0[%25, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %26 = vector.transfer_read %subview_12[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %27 = affine.apply #map24()[%arg3]
        %subview_13 = memref.subview %arg0[%27, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %28 = vector.transfer_read %subview_13[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %29 = affine.apply #map25()[%arg3]
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_6_outlined_vf_0(%arg0: memref<32xf32, #hivm.address_space<ub>>, %arg1: memref<32x128xf32, #hivm.address_space<ub>>, %arg2: memref<32x128xf32, #hivm.address_space<ub>>, %arg3: memref<32x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg4] [1] [1] : memref<32xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map9} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
        %0 = vector.transfer_read %subview[%c0], %cst_1 {in_bounds = [true, true], permutation_map = #map10} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
        %0 = affine.apply #map26(%arg3)
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
        %0 = affine.apply #map26(%arg3)
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
        %1 = affine.apply #map27()[%arg3]
        %subview_0 = memref.subview %arg0[%1, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = affine.apply #map11()[%arg3]
        %subview_1 = memref.subview %arg0[%3, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = affine.apply #map28()[%arg3]
        %subview_2 = memref.subview %arg0[%5, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %6 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = affine.apply #map12()[%arg3]
        %subview_3 = memref.subview %arg0[%7, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %8 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %9 = affine.apply #map29()[%arg3]
        %subview_4 = memref.subview %arg0[%9, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = affine.apply #map13()[%arg3]
        %subview_5 = memref.subview %arg0[%11, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %12 = vector.transfer_read %subview_5[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %13 = affine.apply #map30()[%arg3]
        %subview_6 = memref.subview %arg0[%13, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %14 = vector.transfer_read %subview_6[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %15 = affine.apply #map14()[%arg3]
        %subview_7 = memref.subview %arg0[%15, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %16 = vector.transfer_read %subview_7[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %17 = affine.apply #map31()[%arg3]
        %subview_8 = memref.subview %arg0[%17, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %18 = vector.transfer_read %subview_8[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %19 = affine.apply #map15()[%arg3]
        %subview_9 = memref.subview %arg0[%19, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %20 = vector.transfer_read %subview_9[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %21 = affine.apply #map32()[%arg3]
        %subview_10 = memref.subview %arg0[%21, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %22 = vector.transfer_read %subview_10[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %23 = affine.apply #map16()[%arg3]
        %subview_11 = memref.subview %arg0[%23, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %24 = vector.transfer_read %subview_11[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %25 = affine.apply #map33()[%arg3]
        %subview_12 = memref.subview %arg0[%25, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %26 = vector.transfer_read %subview_12[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %27 = affine.apply #map17()[%arg3]
        %subview_13 = memref.subview %arg0[%27, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %28 = vector.transfer_read %subview_13[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %29 = affine.apply #map34()[%arg3]
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
    %1 = vector.transfer_read %subview_1[%c0], %c0_i32, %0 {in_bounds = [true, true], permutation_map = #map10} : memref<32xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
    %2 = vector.constant_mask [1, 32] : vector<1x64xi1>
    %3 = vector.transfer_read %subview[%c0], %cst, %0 {in_bounds = [true, true], permutation_map = #map10} : memref<32xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
    %4 = arith.cmpf une, %3, %cst_0 : vector<1x64xf16>
    scf.for %arg7 = %c0 to %c64 step %c1 {
      %subview_2 = memref.subview %arg6[%arg7, 0] [1, 32] [1, 1] : memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_3 = memref.subview %arg0[%arg7] [1] [1] : memref<64xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %5 = vector.transfer_read %subview_3[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map9} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %6 = arith.cmpi sgt, %5, %1 : vector<1x64xi32>
      %subview_4 = memref.subview %arg3[%arg7] [1] [1] : memref<64xf16, #hivm.address_space<ub>> to memref<1xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %7 = vector.transfer_read %subview_4[%c0], %cst {in_bounds = [true, true], permutation_map = #map9} : memref<1xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
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
    %2 = vector.transfer_read %arg1[%c0], %cst, %1 {in_bounds = [true, true], permutation_map = #map10} : memref<32xf32, #hivm.address_space<ub>>, vector<1x64xf32>
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_0(%arg0: memref<32xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [32] : vector<64xi1>
    vector.transfer_write %cst, %arg0[%c0], %0 {in_bounds = [true]} : vector<64xf32>, memref<32xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_1(%arg0: memref<32x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_2(%arg0: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_4(%arg0: memref<32x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_5(%arg0: memref<64x128xf32, #hivm.address_space<ub>>, %arg1: memref<64x128xf32, #hivm.address_space<ub>>, %arg2: memref<64x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_6(%arg0: memref<64x128xf32, #hivm.address_space<ub>>, %arg1: memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c64 step %c1 {
      scf.for %arg3 = %c0 to %c8 step %c4 {
        %0 = affine.apply #map26(%arg3)
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_7(%arg0: memref<64x128xf32, #hivm.address_space<ub>>, %arg1: memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c64 step %c1 {
      scf.for %arg3 = %c0 to %c8 step %c4 {
        %0 = affine.apply #map26(%arg3)
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_8(%arg0: memref<32xf32, #hivm.address_space<ub>>, %arg1: memref<32xf32, #hivm.address_space<ub>>, %arg2: memref<32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [32] : vector<64xi1>
    %1 = vector.transfer_read %arg0[%c0], %cst, %0 {in_bounds = [true]} : memref<32xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = vector.transfer_read %arg1[%c0], %cst, %0 {in_bounds = [true]} : memref<32xf32, #hivm.address_space<ub>>, vector<64xf32>
    %3 = arith.addf %1, %2 : vector<64xf32>
    vector.transfer_write %3, %arg2[%c0], %0 {in_bounds = [true]} : vector<64xf32>, memref<32xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_9(%arg0: memref<32x128xf32, #hivm.address_space<ub>>, %arg1: memref<32x128xf32, #hivm.address_space<ub>>, %arg2: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_10(%arg0: memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, %arg1: memref<64x32xf32, #hivm.address_space<ub>>, %arg2: memref<64x32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %false = arith.constant false
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 32] : vector<1x64xi1>
    scf.for %arg3 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg2[%arg3, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg0[%arg3, 0] [1, 32] [1, 1] : memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg1[%arg3, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_1[%c0, %c0], %false, %0 {in_bounds = [true, true]} : memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi1>
      %2 = vector.transfer_read %subview_2[%c0, %c0], %cst_0, %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %3 = arith.select %1, %2, %cst : vector<1x64xi1>, vector<1x64xf32>
      vector.transfer_write %3, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg19: f32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<24xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c8 = arith.constant 8 : index
    %c64_i32 = arith.constant 64 : i32
    %c32_i32 = arith.constant 32 : i32
    %c64 = arith.constant 64 : index
    %c32_i64 = arith.constant 32 : i64
    %c128_i64 = arith.constant 128 : i64
    %c64_i64 = arith.constant 64 : i64
    %c0_i32 = arith.constant 0 : i32
    %c4096_i64 = arith.constant 4096 : i64
    %cst = arith.constant 0.000000e+00 : f32
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
    %4 = arith.addi %arg20, %c63_i32 : i32
    %5 = arith.divsi %4, %c64_i32 : i32
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64xi32, #hivm.address_space<ub>>
    call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_merged_vf_0(%alloc, %alloc_1) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<128xf32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>) -> ()
    %6 = arith.index_cast %arg20 : i32 to index
    %7 = arith.index_cast %2 : i64 to index
    %8 = affine.apply #map35()[%7]
    %view = memref.view %arg1[%8][] : memref<?xi8, #hivm.address_space<gm>> to memref<2x128xf32, #hivm.address_space<gm>>
    %9 = affine.apply #map36()[%7]
    %view_2 = memref.view %arg1[%9][] : memref<?xi8, #hivm.address_space<gm>> to memref<2x128xf32, #hivm.address_space<gm>>
    %10 = hivm.hir.get_sub_block_idx -> i64
    %11 = arith.index_cast %10 : i64 to index
    %12 = affine.apply #map37()[%11]
    %13 = affine.apply #map38()[%11]
    %14 = affine.apply #map39()[%11]
    %15 = affine.apply #map40()[%11]
    hivm.hir.anchor {id = 0 : i64}
    annotation.mark %1 {logical_block_num} : i32
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.anchor {id = 1 : i64}
    %16 = affine.apply #map41()[%11]
    %subview = memref.subview %view[%11, 0] [1, 128] [1, 1] : memref<2x128xf32, #hivm.address_space<gm>> to memref<1x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
    %subview_3 = memref.subview %view_2[%11, 0] [1, 128] [1, 1] : memref<2x128xf32, #hivm.address_space<gm>> to memref<1x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
    scf.for %arg24 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %17 = arith.remsi %arg24, %arg21 : i32
      %18 = arith.divsi %arg24, %arg21 : i32
      %19 = arith.remsi %18, %arg22 : i32
      hivm.hir.anchor {id = 3 : i64}
      hivm.hir.anchor {id = 4 : i64}
      hivm.hir.anchor {id = 5 : i64}
      hivm.hir.anchor {id = 6 : i64}
      %20 = arith.divsi %19, %c32_i32 : i32
      %21 = arith.remsi %19, %c32_i32 : i32
      %22 = arith.muli %20, %5 : i32
      %23 = arith.addi %22, %17 : i32
      %24 = arith.extsi %23 : i32 to i64
      %25 = arith.muli %20, %arg20 : i32
      %26 = arith.extsi %25 : i32 to i64
      %27 = arith.muli %17, %c64_i32 : i32
      hivm.hir.anchor {id = 7 : i64}
      %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<64xi32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_0_outlined_vf_0(%alloc_1, %27, %alloc_4) {hivm.vector_function, no_inline} : (memref<64xi32, #hivm.address_space<ub>>, i32, memref<64xi32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 8 : i64}
      hivm.hir.anchor {id = 9 : i64}
      %28 = arith.addi %27, %c64_i32 : i32
      %29 = arith.minsi %arg20, %28 : i32
      %30 = arith.subi %29, %c1_i32 : i32
      hivm.hir.anchor {id = 10 : i64}
      %31 = arith.muli %26, %c32_i64 : i64
      %32 = arith.extsi %21 : i32 to i64
      %33 = arith.addi %31, %32 : i64
      %34 = arith.muli %33, %c128_i64 : i64
      %35 = arith.index_cast %34 : i64 to index
      %36 = arith.index_cast %33 : i64 to index
      %37 = arith.muli %33, %c64_i64 : i64
      %38 = arith.index_cast %37 : i64 to index
      %39 = arith.muli %24, %c32_i64 : i64
      %40 = arith.addi %39, %32 : i64
      %41 = arith.muli %40, %c16384_i64 : i64
      %42 = arith.index_cast %41 : i64 to index
      %43 = arith.maxsi %27, %c0_i32 : i32
      %44 = arith.index_cast %43 : i32 to index
      %45 = affine.apply #map()[%36, %44]
      %46 = affine.apply #map6()[%35, %44]
      %47 = affine.apply #map2()[%38, %44]
      %48 = affine.apply #map1()[%6, %44]
      %reinterpret_cast = memref.reinterpret_cast %arg7 to offset: [%45], sizes: [64], strides: [32] : memref<?xf32, #hivm.address_space<gm>> to memref<64xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
      %alloc_5 = memref.alloc() : memref<32xf32, #hivm.address_space<ub>>
      %49 = arith.maxsi %48, %c0 : index
      %50 = arith.minsi %49, %c64 : index
      %51 = arith.subi %c0_i32, %27 : i32
      %52 = arith.maxsi %51, %c0_i32 : i32
      %53 = arith.index_cast %52 : i32 to index
      %54 = arith.minsi %53, %50 : index
      %55 = affine.apply #map1()[%50, %54]
      %56 = arith.cmpi slt, %55, %c64 : index
      %57 = arith.minsi %12, %55 : index
      %58 = affine.apply #map42()[%57, %50, %54]
      %59 = arith.minsi %58, %c32 : index
      %subview_6 = memref.subview %reinterpret_cast[%12] [%59] [1] : memref<64xf32, strided<[32], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
      %60 = arith.maxsi %54, %12 : index
      %61 = arith.minsi %50, %16 : index
      %62 = arith.maxsi %60, %61 : index
      %63 = affine.apply #map1()[%62, %60]
      %64 = affine.apply #map43()[%60, %11]
      %subview_7 = memref.subview %alloc_5[%64] [%63] [1] : memref<32xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %65 = arith.remui %54, %c8 : index
      hivm.hir.anchor {id = 11 : i64}
      scf.if %56 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_0(%alloc_5) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_6 : memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>) outs(%subview_7 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %65 : index
      hivm.hir.anchor {id = 12 : i64}
      hivm.hir.anchor {id = 13 : i64}
      hivm.hir.anchor {id = 14 : i64}
      %reinterpret_cast_8 = memref.reinterpret_cast %arg3 to offset: [%46], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_9 = memref.reinterpret_cast %arg6 to offset: [%46], sizes: [64, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_10 = memref.alloc() : memref<32x128xbf16, #hivm.address_space<ub>>
      %subview_11 = memref.subview %reinterpret_cast_8[%12, 0] [%59, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_12 = memref.subview %alloc_10[%64, 0] [%63, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 15 : i64}
      scf.if %56 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_1(%alloc_10) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_11 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_12 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16
      hivm.hir.anchor {id = 16 : i64}
      %alloc_13 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      %subview_14 = memref.subview %reinterpret_cast_9[%12, 0] [%59, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_15 = memref.subview %alloc_13[%64, 0] [%63, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 17 : i64}
      scf.if %56 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_2(%alloc_13) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_14 : memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_15 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32
      hivm.hir.anchor {id = 18 : i64}
      %66 = arith.extsi %30 : i32 to i64
      %67 = arith.muli %66, %c4096_i64 : i64
      %68 = arith.addi %34, %67 : i64
      %69 = arith.index_cast %68 : i64 to index
      %reinterpret_cast_16 = memref.reinterpret_cast %arg6 to offset: [%69], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %alloc_17 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_17 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 19 : i64}
      hivm.hir.load ins(%reinterpret_cast_16 : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_17 : memref<128xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 20 : i64}
      %reinterpret_cast_18 = memref.reinterpret_cast %arg9 to offset: [%42], sizes: [128, 128], strides: [128, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_19 = memref.subview %reinterpret_cast_18[%13, 0] [64, 128] [1, 1] : memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_20 = memref.reinterpret_cast %arg11 to offset: [%42], sizes: [128, 128], strides: [128, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_21 = memref.subview %reinterpret_cast_20[%13, 0] [64, 128] [1, 1] : memref<128x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 21 : i64}
      hivm.hir.anchor {id = 22 : i64}
      hivm.hir.anchor {id = 23 : i64}
      hivm.hir.anchor {id = 24 : i64}
      %alloc_22 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_22 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 25 : i64}
      %collapse_shape = memref.collapse_shape %subview_19 [[0, 1]] : memref<64x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<8192xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %collapse_shape_23 = memref.collapse_shape %alloc_22 [[0, 1]] : memref<64x128xf32, #hivm.address_space<ub>> into memref<8192xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape : memref<8192xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%collapse_shape_23 : memref<8192xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 26 : i64}
      %alloc_24 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_24 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 27 : i64}
      %collapse_shape_25 = memref.collapse_shape %subview_21 [[0, 1]] : memref<64x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<8192xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %collapse_shape_26 = memref.collapse_shape %alloc_24 [[0, 1]] : memref<64x128xf32, #hivm.address_space<ub>> into memref<8192xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape_25 : memref<8192xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%collapse_shape_26 : memref<8192xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 28 : i64}
      hivm.hir.anchor {id = 29 : i64}
      hivm.hir.anchor {id = 30 : i64}
      hivm.hir.anchor {id = 31 : i64}
      %alloc_27 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_5(%alloc_22, %alloc_24, %alloc_27) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 32 : i64}
      %alloc_28 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_28 : memref<128xf32, #hivm.address_space<ub>>)
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_2_outlined_vf_0(%alloc_27, %alloc_28) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.pipe_barrier[<PIPE_MTE2>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %collapse_shape_29 = memref.collapse_shape %subview [[0, 1]] : memref<1x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%alloc_28 : memref<128xf32, #hivm.address_space<ub>>) outs(%collapse_shape_29 : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.pipe_barrier[<PIPE_MTE3>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %alloc_30 = memref.alloc() : memref<2x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_30 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<2x128xf32, #hivm.address_space<ub>>
      %collapse_shape_31 = memref.collapse_shape %view [[0, 1]] : memref<2x128xf32, #hivm.address_space<gm>> into memref<256xf32, #hivm.address_space<gm>>
      %collapse_shape_32 = memref.collapse_shape %alloc_30 [[0, 1]] : memref<2x128xf32, #hivm.address_space<ub>> into memref<256xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape_31 : memref<256xf32, #hivm.address_space<gm>>) outs(%collapse_shape_32 : memref<256xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst>
      %alloc_33 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_33 : memref<128xf32, #hivm.address_space<ub>>)
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_3_outlined_vf_0(%alloc_30, %alloc_33) {hivm.vector_function, no_inline} : (memref<2x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 33 : i64}
      hivm.hir.anchor {id = 34 : i64}
      hivm.hir.anchor {id = 35 : i64}
      %alloc_34 = memref.alloc() : memref<8x65x16x1xbf16, #hivm.address_space<ub>>
      %subview_35 = memref.subview %alloc_34[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xbf16, #hivm.address_space<ub>> to memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_6(%alloc_22, %subview_35) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape = memref.expand_shape %subview_35 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_36 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_37 = memref.subview %alloc_36[0, %14, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_36 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      hivm.hir.anchor {id = 36 : i64}
      %collapse_shape_38 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_39 = memref.collapse_shape %subview_37 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_38 : memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_39 : memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 37 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 38 : i64}
      %alloc_40 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_40 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 39 : i64}
      hivm.hir.anchor {id = 40 : i64}
      hivm.hir.anchor {id = 41 : i64}
      hivm.hir.anchor {id = 42 : i64}
      %alloc_41 = memref.alloc() : memref<8x65x16x1xbf16, #hivm.address_space<ub>>
      %subview_42 = memref.subview %alloc_41[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xbf16, #hivm.address_space<ub>> to memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_7(%alloc_24, %subview_42) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_43 = memref.expand_shape %subview_42 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_44 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_45 = memref.subview %alloc_44[0, %14, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_44 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      hivm.hir.anchor {id = 43 : i64}
      %collapse_shape_46 = memref.collapse_shape %expand_shape_43 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_47 = memref.collapse_shape %subview_45 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_46 : memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_47 : memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 44 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 45 : i64}
      %alloc_48 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_48 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 46 : i64}
      hivm.hir.anchor {id = 47 : i64}
      %alloc_49 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_50 = memref.subview %alloc_49[0, %14, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_49 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      hivm.hir.anchor {id = 48 : i64}
      %collapse_shape_51 = memref.collapse_shape %subview_50 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_38 : memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_51 : memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 49 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 50 : i64}
      %alloc_52 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_52 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 51 : i64}
      hivm.hir.anchor {id = 52 : i64}
      %reinterpret_cast_53 = memref.reinterpret_cast %arg4 to offset: [%46], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_54 = memref.reinterpret_cast %arg15 to offset: [%46], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_55 = memref.alloc() : memref<32x128xbf16, #hivm.address_space<ub>>
      %subview_56 = memref.subview %reinterpret_cast_53[%12, 0] [%59, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_57 = memref.subview %alloc_55[%64, 0] [%63, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 53 : i64}
      hivm.hir.anchor {id = 54 : i64}
      hivm.hir.anchor {id = 55 : i64}
      scf.if %56 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_3(%alloc_55) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_56 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_57 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16
      hivm.hir.anchor {id = 56 : i64}
      hivm.hir.anchor {id = 57 : i64}
      hivm.hir.anchor {id = 58 : i64}
      hivm.hir.anchor {id = 59 : i64}
      %alloc_58 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_58 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 60 : i64}
      hivm.hir.anchor {id = 61 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 62 : i64}
      hivm.hir.anchor {id = 63 : i64}
      hivm.hir.anchor {id = 64 : i64}
      %alloc_59 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_7_outlined_vf_0(%alloc_58, %alloc_55, %alloc_59) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xbf16, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 65 : i64}
      %alloc_60 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_61 = memref.alloc() {alignment = 64 : i64} : memref<32x128xbf16, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_6_outlined_vf_0(%alloc_5, %alloc_58, %alloc_60, %alloc_61) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 66 : i64}
      %subview_62 = memref.subview %alloc_61[%64, 0] [%63, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 67 : i64}
      %subview_63 = memref.subview %reinterpret_cast_54[%12, 0] [%59, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_62 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_63 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.anchor {id = 68 : i64}
      hivm.hir.anchor {id = 69 : i64}
      hivm.hir.anchor {id = 70 : i64}
      hivm.hir.anchor {id = 71 : i64}
      hivm.hir.anchor {id = 72 : i64}
      hivm.hir.anchor {id = 73 : i64}
      %alloc_64 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_9_outlined_vf_0(%alloc_33, %alloc_17, %alloc_64) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 74 : i64}
      %alloc_65 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_0(%alloc_13, %alloc_65) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      %alloc_66 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_67 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_68 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_1(%alloc_65, %alloc_60, %alloc_40, %alloc_66, %alloc_67, %alloc_68) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 75 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
      %alloc_69 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_10_outlined_vf_0(%alloc_68, %arg19, %alloc_69) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, f32, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 76 : i64}
      hivm.hir.anchor {id = 77 : i64}
      hivm.hir.anchor {id = 78 : i64}
      hivm.hir.anchor {id = 79 : i64}
      %70 = arith.index_cast %27 : i32 to index
      %71 = affine.apply #map7()[%70]
      %72 = arith.maxsi %70, %6 : index
      %73 = arith.minsi %71, %72 : index
      %74 = affine.apply #map1()[%73, %70]
      %75 = arith.minsi %12, %74 : index
      %76 = affine.apply #map42()[%75, %73, %70]
      %77 = arith.minsi %76, %c32 : index
      hivm.hir.anchor {id = 80 : i64}
      hivm.hir.anchor {id = 81 : i64}
      %alloc_70 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_71 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_0(%alloc_17, %alloc_13, %alloc_70, %alloc_71) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      %subview_72 = memref.subview %alloc_70[0, 0] [%77, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
      %subview_73 = memref.subview %alloc_71[0, 0] [%77, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
      %collapse_shape_74 = memref.collapse_shape %subview_72 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
      %collapse_shape_75 = memref.collapse_shape %subview_73 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
      hivm.hir.copy ins(%collapse_shape_74 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_75 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
      %alloc_76 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_1(%alloc_48, %alloc_71, %alloc_76) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 82 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 83 : i64}
      %alloc_77 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_78 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_12_outlined_vf_0(%alloc_10, %alloc_77, %alloc_65, %alloc_78) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 84 : i64}
      %alloc_79 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_13_outlined_vf_0(%alloc_52, %alloc_79) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 85 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 86 : i64}
      hivm.hir.anchor {id = 87 : i64}
      hivm.hir.anchor {id = 88 : i64}
      %alloc_80 = memref.alloc() : memref<8x33x16x1xbf16, #hivm.address_space<ub>>
      %subview_81 = memref.subview %alloc_80[0, 0, 0, 0] [8, 32, 16, 1] [1, 1, 1, 1] : memref<8x33x16x1xbf16, #hivm.address_space<ub>> to memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_14_outlined_vf_0(%alloc_79, %subview_81) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_82 = memref.expand_shape %subview_81 [[0], [1, 2], [3]] output_shape [8, 2, 16, 16] : memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> into memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_83 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_84 = memref.subview %alloc_83[0, %15, 0, 0] [8, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_83 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = 1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      hivm.hir.anchor {id = 89 : i64}
      %collapse_shape_85 = memref.collapse_shape %expand_shape_82 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>
      %collapse_shape_86 = memref.collapse_shape %subview_84 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_85 : memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_86 : memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 90 : i64}
      hivm.hir.anchor {id = 91 : i64}
      %alloc_87 = memref.alloc() : memref<8x33x16x1xbf16, #hivm.address_space<ub>>
      %subview_88 = memref.subview %alloc_87[0, 0, 0, 0] [8, 32, 16, 1] [1, 1, 1, 1] : memref<8x33x16x1xbf16, #hivm.address_space<ub>> to memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_15_outlined_vf_0(%alloc_78, %subview_88) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_89 = memref.expand_shape %subview_88 [[0], [1, 2], [3]] output_shape [8, 2, 16, 16] : memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> into memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_90 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_91 = memref.subview %alloc_90[0, %15, 0, 0] [8, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_90 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = 1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 92 : i64}
      %collapse_shape_92 = memref.collapse_shape %expand_shape_89 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>
      %collapse_shape_93 = memref.collapse_shape %subview_91 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_92 : memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_93 : memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 93 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 94 : i64}
      %alloc_94 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_94 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 95 : i64}
      hivm.hir.anchor {id = 96 : i64}
      %alloc_95 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_96 = memref.subview %alloc_95[0, %15, 0, 0] [8, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_95 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = 1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      hivm.hir.anchor {id = 97 : i64}
      %collapse_shape_97 = memref.collapse_shape %subview_96 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_85 : memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_97 : memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 98 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 99 : i64}
      %alloc_98 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_98 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 100 : i64}
      hivm.hir.anchor {id = 101 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 102 : i64}
      %alloc_99 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_0(%alloc_98, %alloc_78, %alloc_99) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      %alloc_100 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_1(%alloc_99, %alloc_100) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 103 : i64}
      %alloc_101 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_8(%alloc_59, %alloc_100, %alloc_101) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 104 : i64}
      %reinterpret_cast_102 = memref.reinterpret_cast %arg2 to offset: [%46], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_103 = memref.alloc() : memref<32x128xbf16, #hivm.address_space<ub>>
      %subview_104 = memref.subview %reinterpret_cast_102[%12, 0] [%59, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_105 = memref.subview %alloc_103[%64, 0] [%63, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 105 : i64}
      scf.if %56 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_4(%alloc_103) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_104 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_105 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16
      hivm.hir.anchor {id = 106 : i64}
      hivm.hir.anchor {id = 107 : i64}
      %alloc_106 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_9(%alloc_77, %alloc_76, %alloc_106) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 108 : i64}
      %alloc_107 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %collapse_shape_108 = memref.collapse_shape %alloc_106 [[0, 1]] : memref<32x128xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
      %collapse_shape_109 = memref.collapse_shape %alloc_107 [[0, 1]] : memref<32x128xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%collapse_shape_108 : memref<4096xf32, #hivm.address_space<ub>>) outs(%collapse_shape_109 : memref<4096xf32, #hivm.address_space<ub>>)
      %alloc_110 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_110 : memref<128xf32, #hivm.address_space<ub>>)
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_17_outlined_vf_0(%alloc_107, %alloc_110) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.pipe_barrier[<PIPE_MTE2>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %collapse_shape_111 = memref.collapse_shape %subview_3 [[0, 1]] : memref<1x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%alloc_110 : memref<128xf32, #hivm.address_space<ub>>) outs(%collapse_shape_111 : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.pipe_barrier[<PIPE_MTE3>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %alloc_112 = memref.alloc() : memref<2x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_112 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<2x128xf32, #hivm.address_space<ub>>
      %collapse_shape_113 = memref.collapse_shape %view_2 [[0, 1]] : memref<2x128xf32, #hivm.address_space<gm>> into memref<256xf32, #hivm.address_space<gm>>
      %collapse_shape_114 = memref.collapse_shape %alloc_112 [[0, 1]] : memref<2x128xf32, #hivm.address_space<ub>> into memref<256xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape_113 : memref<256xf32, #hivm.address_space<gm>>) outs(%collapse_shape_114 : memref<256xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst>
      %alloc_115 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_115 : memref<128xf32, #hivm.address_space<ub>>)
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_18_outlined_vf_0(%alloc_112, %alloc_115) {hivm.vector_function, no_inline} : (memref<2x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 109 : i64}
      hivm.hir.anchor {id = 110 : i64}
      hivm.hir.anchor {id = 111 : i64}
      hivm.hir.anchor {id = 112 : i64}
      hivm.hir.anchor {id = 113 : i64}
      hivm.hir.anchor {id = 114 : i64}
      hivm.hir.anchor {id = 115 : i64}
      hivm.hir.anchor {id = 116 : i64}
      hivm.hir.anchor {id = 117 : i64}
      %alloc_116 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_117 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %reinterpret_cast_118 = memref.reinterpret_cast %arg12 to offset: [%46], sizes: [64, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_119 = memref.reinterpret_cast %arg13 to offset: [%46], sizes: [64, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_120 = memref.reinterpret_cast %arg16 to offset: [%46], sizes: [64, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_121 = memref.subview %alloc_69[%64, 0] [%63, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_122 = memref.subview %reinterpret_cast_118[%12, 0] [%59, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_121 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_122 : memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      %subview_123 = memref.subview %reinterpret_cast_119[%12, 0] [%59, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_124 = memref.subview %reinterpret_cast_120[%12, 0] [%59, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_125 = memref.alloc() {alignment = 64 : i64} : memref<64xf16, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_1_outlined_merged_merged_vf_0(%12, %alloc_4, %alloc_103, %alloc_69, %alloc_106, %alloc_64, %alloc_115, %alloc_99, %alloc_60, %30, %alloc_116, %alloc_76, %alloc_98, %alloc_67, %alloc_117, %alloc_4, %arg20, %alloc_125) {hivm.vector_function, no_inline, ptc_simdvf} : (index, memref<64xi32, #hivm.address_space<ub>>, memref<32x128xbf16, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, i32, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>, i32, memref<64xf16, #hivm.address_space<ub>>) -> ()
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
      %subview_126 = memref.subview %alloc_117[%64, 0] [%63, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.store ins(%subview_126 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_123 : memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      %subview_127 = memref.subview %alloc_116[%64, 0] [%63, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.store ins(%subview_127 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_124 : memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      %alloc_128 = memref.alloc() : memref<64x256x1xi1, #hivm.address_space<ub>>
      %subview_129 = memref.subview %alloc_128[0, 0, 0] [64, 32, 1] [1, 1, 1] : memref<64x256x1xi1, #hivm.address_space<ub>> to memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_20_outlined_vf_1(%alloc_4, %alloc_4, %12, %alloc_125, %alloc_125, %12, %subview_129) {hivm.vector_function, no_inline} : (memref<64xi32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>, index, memref<64xf16, #hivm.address_space<ub>>, memref<64xf16, #hivm.address_space<ub>>, index, memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 136 : i64}
      %alloc_130 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_21_outlined_vf_0(%alloc_94, %alloc_5, %alloc_130) {hivm.vector_function, no_inline} : (memref<64x32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 137 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 138 : i64}
      hivm.hir.anchor {id = 139 : i64}
      hivm.hir.anchor {id = 140 : i64}
      %alloc_131 = memref.alloc() : memref<2x65x16x1xbf16, #hivm.address_space<ub>>
      %subview_132 = memref.subview %alloc_131[0, 0, 0, 0] [2, 64, 16, 1] [1, 1, 1, 1] : memref<2x65x16x1xbf16, #hivm.address_space<ub>> to memref<2x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_22_outlined_vf_0(%subview_129, %alloc_130, %subview_132) {hivm.vector_function, no_inline} : (memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>, memref<2x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_133 = memref.expand_shape %subview_132 [[0], [1, 2], [3]] output_shape [2, 4, 16, 16] : memref<2x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<2x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_134 = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_135 = memref.subview %alloc_134[%15, 0, 0, 0] [2, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<2x4x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_134 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = 0 : index} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      hivm.hir.anchor {id = 141 : i64}
      %collapse_shape_136 = memref.collapse_shape %expand_shape_133 [[0], [1, 2, 3]] : memref<2x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<2x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_137 = memref.collapse_shape %subview_135 [[0], [1, 2, 3]] : memref<2x4x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x1024xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_136 : memref<2x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_137 : memref<2x1024xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 142 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 143 : i64}
      hivm.hir.anchor {id = 144 : i64}
      hivm.hir.anchor {id = 145 : i64}
      %alloc_138 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_138 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 146 : i64}
      hivm.hir.anchor {id = 147 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %alloc_139 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_23_outlined_vf_0(%alloc_138, %alloc_139) {hivm.vector_function, no_inline} : (memref<64x32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 148 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
      %alloc_140 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_10(%subview_129, %alloc_139, %alloc_140) {hivm.vector_function, no_inline} : (memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 149 : i64}
      %reinterpret_cast_141 = memref.reinterpret_cast %arg18 to offset: [%47], sizes: [64, 64], strides: [2048, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x64xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_142 = memref.reinterpret_cast %arg17 to offset: [%45], sizes: [64], strides: [32] : memref<?xf32, #hivm.address_space<gm>> to memref<64xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
      %subview_143 = memref.subview %alloc_140[%54, 0] [%55, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<?x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 150 : i64}
      %subview_144 = memref.subview %reinterpret_cast_141[0, %12] [%55, 32] [1, 1] : memref<64x64xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_143 : memref<?x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_144 : memref<?x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.anchor {id = 151 : i64}
      %subview_145 = memref.subview %alloc_101[%64] [%63] [1] : memref<32xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 152 : i64}
      %subview_146 = memref.subview %reinterpret_cast_142[%12] [%59] [1] : memref<64xf32, strided<[32], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_145 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_146 : memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.anchor {id = 153 : i64}
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.anchor {id = 154 : i64}
    return
  }
}
