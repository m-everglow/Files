#map = affine_map<()[s0, s1] -> (s0 + s1 * 4)>
#map1 = affine_map<()[s0, s1] -> (s0 - s1)>
#map2 = affine_map<()[s0, s1] -> (s0 + s1 * 256)>
#map3 = affine_map<()[s0, s1] -> ((s0 - s1) ceildiv 16)>
#map4 = affine_map<()[s0] -> (s0 floordiv 16)>
#map5 = affine_map<()[s0] -> (s0 mod 16)>
#map6 = affine_map<()[s0] -> (s0 + 64)>
#map7 = affine_map<(d0) -> (0, d0)>
#map8 = affine_map<()[s0, s1] -> (s0 + s1)>
#map9 = affine_map<(d0) -> (d0, 0)>
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
#map25 = affine_map<()[s0] -> (s0 + 2)>
#map26 = affine_map<()[s0] -> (s0 + 6)>
#map27 = affine_map<()[s0] -> (s0 + 10)>
#map28 = affine_map<()[s0] -> (s0 + 14)>
#map29 = affine_map<()[s0] -> (s0 + 18)>
#map30 = affine_map<()[s0] -> (s0 + 22)>
#map31 = affine_map<()[s0] -> (s0 + 26)>
#map32 = affine_map<()[s0] -> (s0 + 30)>
#map33 = affine_map<()[s0] -> (s0 * 512)>
#map34 = affine_map<()[s0] -> (s0 * 32)>
#map35 = affine_map<()[s0] -> (s0 * 2)>
#map36 = affine_map<()[s0] -> (s0 * 32 + 32)>
#map37 = affine_map<()[s0, s1, s2] -> (-s0 + s1 - s2)>
#map38 = affine_map<()[s0, s1] -> (s0 - s1 * 32)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<MIX>, ssbuffer.insertionOptimization} {
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_backup(%arg0: memref<?xi8> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xf16> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg19: f32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, annotation.filter_passes = #annotation.filter_passes<"hivm-insert-anchors-and-backup,hivm-delayed-cross-core-gss,split-simt-module,hivm-merge-same-preload-scopes">, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<24xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.backup_function, hivm.func_core_type = #hivm.func_core_type<MIX>, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    hivm.hir.anchor {id = 0 : i64}
    %c8 = arith.constant 8 : index
    %c64_i32 = arith.constant 64 : i32
    %c4_i32 = arith.constant 4 : i32
    %c64 = arith.constant 64 : index
    %c4_i64 = arith.constant 4 : i64
    %c64_i64 = arith.constant 64 : i64
    %c256_i64 = arith.constant 256 : i64
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f16
    %c4096_i64 = arith.constant 4096 : i64
    %c63_i32 = arith.constant 63 : i32
    %c0 = arith.constant 0 : index
    %cst_1 = arith.constant 1.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %cst_2 = arith.constant 0.693147182 : f32
    %cst_3 = arith.constant -1.000000e+00 : f16
    %cst_4 = arith.constant -1.000000e+00 : f32
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
      %7 = tensor.empty() : tensor<64x64xf32>
      hivm.hir.anchor {id = 3 : i64}
      %8 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%cst : f32) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 4 : i64}
      %9 = tensor.empty() : tensor<64xf32>
      %10 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%cst : f32) outs(%9 : tensor<64xf32>) -> tensor<64xf32>
      hivm.hir.anchor {id = 5 : i64}
      %11 = arith.divsi %6, %c4_i32 : i32
      %12 = arith.remsi %6, %c4_i32 : i32
      %13 = arith.addi %arg20, %c63_i32 : i32
      %14 = arith.divsi %13, %c64_i32 : i32
      %15 = arith.muli %11, %14 : i32
      %16 = arith.addi %15, %4 : i32
      %17 = arith.extsi %16 : i32 to i64
      %18 = arith.muli %11, %arg20 : i32
      %19 = arith.extsi %18 : i32 to i64
      %20 = arith.muli %4, %c64_i32 : i32
      %21 = tensor.empty() : tensor<64xi32>
      %22 = hivm.hir.varange offset[%c0] strides[%c1] outs(%21 : tensor<64xi32>) -> tensor<64xi32>
      hivm.hir.anchor {id = 6 : i64}
      %23 = hivm.hir.vadd ins(%22, %20 : tensor<64xi32>, i32) outs(%21 : tensor<64xi32>) -> tensor<64xi32>
      hivm.hir.anchor {id = 7 : i64}
      %24 = tensor.empty() : tensor<64xi1>
      %25 = hivm.hir.vcmp ins(%23, %arg20 : tensor<64xi32>, i32) outs(%24 : tensor<64xi1>) compare_mode = <lt> -> tensor<64xi1>
      hivm.hir.anchor {id = 8 : i64}
      %26 = arith.addi %20, %c64_i32 : i32
      %27 = arith.minsi %arg20, %26 : i32
      %28 = arith.subi %27, %c1_i32 : i32
      %29 = hivm.hir.vcmp ins(%23, %28 : tensor<64xi32>, i32) outs(%24 : tensor<64xi1>) -> tensor<64xi1>
      hivm.hir.anchor {id = 9 : i64}
      %30 = arith.muli %19, %c4_i64 : i64
      %31 = arith.extsi %12 : i32 to i64
      %32 = arith.addi %30, %31 : i64
      %33 = arith.muli %32, %c64_i64 : i64
      %34 = arith.index_cast %33 : i64 to index
      %35 = arith.index_cast %32 : i64 to index
      %36 = arith.muli %17, %c4_i64 : i64
      %37 = arith.addi %36, %31 : i64
      %38 = arith.muli %37, %c4096_i64 : i64
      %39 = arith.index_cast %38 : i64 to index
      %40 = arith.maxsi %20, %c0_i32 : i32
      %41 = arith.index_cast %40 : i32 to index
      %42 = affine.apply #map()[%35, %41]
      %43 = arith.index_cast %arg20 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg7 to offset: [%42], sizes: [64], strides: [4] : memref<?xf32> to memref<64xf32, strided<[4], offset: ?>>
      %alloc = memref.alloc() : memref<64xf32>
      %44 = affine.apply #map1()[%43, %41]
      %45 = arith.maxsi %44, %c0 : index
      %46 = arith.minsi %45, %c64 : index
      %47 = arith.subi %c0_i32, %20 : i32
      %48 = arith.maxsi %47, %c0_i32 : i32
      %49 = arith.index_cast %48 : i32 to index
      %50 = arith.minsi %49, %46 : index
      %51 = affine.apply #map1()[%46, %50]
      %52 = arith.cmpi slt, %51, %c64 : index
      %subview = memref.subview %reinterpret_cast[0] [%51] [1] : memref<64xf32, strided<[4], offset: ?>> to memref<?xf32, strided<[4], offset: ?>>
      %subview_5 = memref.subview %alloc[%50] [%51] [1] : memref<64xf32> to memref<?xf32, strided<[1], offset: ?>>
      %53 = arith.remui %50, %c8 : index
      hivm.hir.anchor {id = 10 : i64}
      hivm.hir.load ins(%subview : memref<?xf32, strided<[4], offset: ?>>) outs(%subview_5 : memref<?xf32, strided<[1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %53 : index init_out_buffer = true init_condition = %52 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 11 : i64}
      %54 = bufferization.to_tensor %alloc restrict writable : memref<64xf32>
      %55 = affine.apply #map2()[%34, %41]
      %reinterpret_cast_6 = memref.reinterpret_cast %arg8 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf16> to memref<64x64xf16, strided<[256, 1], offset: ?>>
      %subview_7 = memref.subview %reinterpret_cast_6[0, 0] [%51, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>> to memref<?x64xf16, strided<[256, 1], offset: ?>>
      %cast = memref.cast %subview_7 : memref<?x64xf16, strided<[256, 1], offset: ?>> to memref<?x?xf16, strided<[256, 1], offset: ?>>
      %56 = affine.apply #map3()[%46, %50]
      %57 = affine.apply #map4()[%50]
      %58 = affine.apply #map5()[%50]
      %alloc_8 = memref.alloc() : memref<4x4x16x16xf16>
      %subview_9 = memref.subview %alloc_8[0, %57, %58, 0] [4, %56, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xf16> to memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_10 = memref.cast %subview_9 : memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 12 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast : memref<?x?xf16, strided<[256, 1], offset: ?>>) outs(%cast_10 : memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : f16 init_condition = %52 : i1
      hivm.hir.anchor {id = 13 : i64}
      %59 = bufferization.to_tensor %alloc_8 restrict writable : memref<4x4x16x16xf16>
      %reinterpret_cast_11 = memref.reinterpret_cast %arg3 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf16> to memref<64x64xf16, strided<[256, 1], offset: ?>>
      %reinterpret_cast_12 = memref.reinterpret_cast %arg6 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf32> to memref<64x64xf32, strided<[256, 1], offset: ?>>
      %alloc_13 = memref.alloc() : memref<64x64xf16>
      %subview_14 = memref.subview %reinterpret_cast_11[0, 0] [%51, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>> to memref<?x64xf16, strided<[256, 1], offset: ?>>
      %subview_15 = memref.subview %alloc_13[%50, 0] [%51, 64] [1, 1] : memref<64x64xf16> to memref<?x64xf16, strided<[64, 1], offset: ?>>
      hivm.hir.anchor {id = 14 : i64}
      hivm.hir.load ins(%subview_14 : memref<?x64xf16, strided<[256, 1], offset: ?>>) outs(%subview_15 : memref<?x64xf16, strided<[64, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : f16 init_out_buffer = true init_condition = %52 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 15 : i64}
      %60 = bufferization.to_tensor %alloc_13 restrict writable : memref<64x64xf16>
      %alloc_16 = memref.alloc() : memref<64x64xf32>
      %subview_17 = memref.subview %reinterpret_cast_12[0, 0] [%51, 64] [1, 1] : memref<64x64xf32, strided<[256, 1], offset: ?>> to memref<?x64xf32, strided<[256, 1], offset: ?>>
      %subview_18 = memref.subview %alloc_16[%50, 0] [%51, 64] [1, 1] : memref<64x64xf32> to memref<?x64xf32, strided<[64, 1], offset: ?>>
      hivm.hir.anchor {id = 16 : i64}
      hivm.hir.load ins(%subview_17 : memref<?x64xf32, strided<[256, 1], offset: ?>>) outs(%subview_18 : memref<?x64xf32, strided<[64, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 init_out_buffer = true init_condition = %52 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 17 : i64}
      %61 = bufferization.to_tensor %alloc_16 restrict writable : memref<64x64xf32>
      %62 = arith.extsi %28 : i32 to i64
      %63 = arith.muli %62, %c256_i64 : i64
      %64 = arith.addi %33, %63 : i64
      %65 = arith.index_cast %64 : i64 to index
      %reinterpret_cast_19 = memref.reinterpret_cast %arg6 to offset: [%65], sizes: [64], strides: [1] : memref<?xf32> to memref<64xf32, strided<[1], offset: ?>>
      %alloc_20 = memref.alloc() : memref<64xf32>
      hivm.hir.anchor {id = 18 : i64}
      hivm.hir.load ins(%reinterpret_cast_19 : memref<64xf32, strided<[1], offset: ?>>) outs(%alloc_20 : memref<64xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 19 : i64}
      %66 = bufferization.to_tensor %alloc_20 restrict writable : memref<64xf32>
      %reinterpret_cast_21 = memref.reinterpret_cast %arg5 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf16> to memref<64x64xf16, strided<[256, 1], offset: ?>>
      %reinterpret_cast_22 = memref.reinterpret_cast %arg10 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf16> to memref<64x64xf16, strided<[256, 1], offset: ?>>
      %reinterpret_cast_23 = memref.reinterpret_cast %arg9 to offset: [%39], sizes: [64, 64], strides: [64, 1] : memref<?xf32> to memref<64x64xf32, strided<[64, 1], offset: ?>>
      %reinterpret_cast_24 = memref.reinterpret_cast %arg11 to offset: [%39], sizes: [64, 64], strides: [64, 1] : memref<?xf32> to memref<64x64xf32, strided<[64, 1], offset: ?>>
      %reinterpret_cast_25 = memref.reinterpret_cast %arg14 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf16> to memref<64x64xf16, strided<[256, 1], offset: ?>>
      %subview_26 = memref.subview %reinterpret_cast_21[0, 0] [%51, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>> to memref<?x64xf16, strided<[256, 1], offset: ?>>
      %cast_27 = memref.cast %subview_26 : memref<?x64xf16, strided<[256, 1], offset: ?>> to memref<?x?xf16, strided<[256, 1], offset: ?>>
      %alloc_28 = memref.alloc() : memref<4x4x16x16xf16>
      %subview_29 = memref.subview %alloc_28[0, %57, %58, 0] [4, %56, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xf16> to memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_30 = memref.cast %subview_29 : memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 20 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_27 : memref<?x?xf16, strided<[256, 1], offset: ?>>) outs(%cast_30 : memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : f16 init_condition = %52 : i1
      hivm.hir.anchor {id = 21 : i64}
      %67 = bufferization.to_tensor %alloc_28 restrict writable : memref<4x4x16x16xf16>
      %subview_31 = memref.subview %reinterpret_cast_22[0, 0] [%51, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>> to memref<?x64xf16, strided<[256, 1], offset: ?>>
      %cast_32 = memref.cast %subview_31 : memref<?x64xf16, strided<[256, 1], offset: ?>> to memref<?x?xf16, strided<[256, 1], offset: ?>>
      %alloc_33 = memref.alloc() : memref<4x4x16x16xf16>
      %subview_34 = memref.subview %alloc_33[0, %57, %58, 0] [4, %56, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xf16> to memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_35 = memref.cast %subview_34 : memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 22 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_32 : memref<?x?xf16, strided<[256, 1], offset: ?>>) outs(%cast_35 : memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : f16 init_condition = %52 : i1
      hivm.hir.anchor {id = 23 : i64}
      %68 = bufferization.to_tensor %alloc_33 restrict writable : memref<4x4x16x16xf16>
      %alloc_36 = memref.alloc() : memref<64x64xf32>
      hivm.hir.anchor {id = 24 : i64}
      hivm.hir.load ins(%reinterpret_cast_23 : memref<64x64xf32, strided<[64, 1], offset: ?>>) outs(%alloc_36 : memref<64x64xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 25 : i64}
      %69 = bufferization.to_tensor %alloc_36 restrict writable : memref<64x64xf32>
      %alloc_37 = memref.alloc() : memref<64x64xf32>
      hivm.hir.anchor {id = 26 : i64}
      hivm.hir.load ins(%reinterpret_cast_24 : memref<64x64xf32, strided<[64, 1], offset: ?>>) outs(%alloc_37 : memref<64x64xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 27 : i64}
      %70 = bufferization.to_tensor %alloc_37 restrict writable : memref<64x64xf32>
      %subview_38 = memref.subview %reinterpret_cast_25[0, 0] [%51, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>> to memref<?x64xf16, strided<[256, 1], offset: ?>>
      %cast_39 = memref.cast %subview_38 : memref<?x64xf16, strided<[256, 1], offset: ?>> to memref<?x?xf16, strided<[256, 1], offset: ?>>
      %alloc_40 = memref.alloc() : memref<4x4x16x16xf16>
      %subview_41 = memref.subview %alloc_40[0, %57, %58, 0] [4, %56, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xf16> to memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_42 = memref.cast %subview_41 : memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 28 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_39 : memref<?x?xf16, strided<[256, 1], offset: ?>>) outs(%cast_42 : memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : f16 init_condition = %52 : i1
      hivm.hir.anchor {id = 29 : i64}
      %71 = bufferization.to_tensor %alloc_40 restrict writable : memref<4x4x16x16xf16>
      hivm.hir.anchor {id = 30 : i64}
      %72 = hivm.hir.vmul ins(%69, %70 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 31 : i64}
      %expanded = tensor.expand_shape %10 [[0, 1]] output_shape [1, 64] : tensor<64xf32> into tensor<1x64xf32>
      %73 = hivm.hir.vreduce <sum> ins(%72 : tensor<64x64xf32>) outs(%expanded : tensor<1x64xf32>) reduce_dims = [0] -> tensor<1x64xf32>
      hivm.hir.anchor {id = 32 : i64}
      %collapsed = tensor.collapse_shape %73 [[0, 1]] : tensor<1x64xf32> into tensor<64xf32>
      %74 = tensor.empty() : tensor<64x64xf16>
      %75 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%69 : tensor<64x64xf32>) outs(%74 : tensor<64x64xf16>) -> tensor<64x64xf16>
      hivm.hir.anchor {id = 33 : i64}
      %expanded_43 = tensor.expand_shape %75 [[0], [1, 2]] output_shape [64, 4, 16] : tensor<64x64xf16> into tensor<64x4x16xf16>
      %76 = tensor.empty() : tensor<4x64x16xf16>
      %77 = hivm.hir.vtranspose ins(%expanded_43 : tensor<64x4x16xf16>) outs(%76 : tensor<4x64x16xf16>) permutation = [1, 0, 2] -> tensor<4x64x16xf16>
      hivm.hir.anchor {id = 34 : i64}
      %expanded_44 = tensor.expand_shape %77 [[0], [1, 2], [3]] output_shape [4, 4, 16, 16] : tensor<4x64x16xf16> into tensor<4x4x16x16xf16>
      %alloc_45 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_45 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %78 = bufferization.to_tensor %alloc_45 restrict writable : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      hivm.hir.anchor {id = 35 : i64}
      hivm.hir.copy ins(%expanded_44 : tensor<4x4x16x16xf16>) outs(%alloc_45 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 36 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %79 = tensor.empty() : tensor<4x4x16x16xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %80 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%68, %78, %true, %c64, %c64, %c64 : tensor<4x4x16x16xf16>, tensor<4x4x16x16xf16>, i1, index, index, index) outs(%79 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 37 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %alloc_46 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_46 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast = memref.memory_space_cast %alloc_46 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %81 = bufferization.to_tensor %memspacecast restrict writable : memref<64x64xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
      hivm.hir.anchor {id = 38 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%80 : tensor<4x4x16x16xf32>) outs(%alloc_46 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 39 : i64}
      %82 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%70 : tensor<64x64xf32>) outs(%74 : tensor<64x64xf16>) -> tensor<64x64xf16>
      hivm.hir.anchor {id = 40 : i64}
      %expanded_47 = tensor.expand_shape %82 [[0], [1, 2]] output_shape [64, 4, 16] : tensor<64x64xf16> into tensor<64x4x16xf16>
      %83 = hivm.hir.vtranspose ins(%expanded_47 : tensor<64x4x16xf16>) outs(%76 : tensor<4x64x16xf16>) permutation = [1, 0, 2] -> tensor<4x64x16xf16>
      hivm.hir.anchor {id = 41 : i64}
      %expanded_48 = tensor.expand_shape %83 [[0], [1, 2], [3]] output_shape [4, 4, 16, 16] : tensor<4x64x16xf16> into tensor<4x4x16x16xf16>
      %alloc_49 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_49 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %84 = bufferization.to_tensor %alloc_49 restrict writable : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      hivm.hir.anchor {id = 42 : i64}
      hivm.hir.copy ins(%expanded_48 : tensor<4x4x16x16xf16>) outs(%alloc_49 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 43 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %85 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%67, %84, %true, %c64, %c64, %c64 : tensor<4x4x16x16xf16>, tensor<4x4x16x16xf16>, i1, index, index, index) outs(%79 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 44 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      %alloc_50 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_50 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast_51 = memref.memory_space_cast %alloc_50 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %86 = bufferization.to_tensor %memspacecast_51 restrict writable : memref<64x64xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 45 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%85 : tensor<4x4x16x16xf32>) outs(%alloc_50 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 46 : i64}
      %alloc_52 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_52 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %87 = bufferization.to_tensor %alloc_52 restrict writable : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      hivm.hir.anchor {id = 47 : i64}
      hivm.hir.copy ins(%expanded_44 : tensor<4x4x16x16xf16>) outs(%alloc_52 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 48 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %88 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%71, %87, %true, %c64, %c64, %c64 : tensor<4x4x16x16xf16>, tensor<4x4x16x16xf16>, i1, index, index, index) outs(%79 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 49 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      %reinterpret_cast_53 = memref.reinterpret_cast %arg4 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf16> to memref<64x64xf16, strided<[256, 1], offset: ?>>
      %reinterpret_cast_54 = memref.reinterpret_cast %arg15 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf16> to memref<64x64xf16, strided<[256, 1], offset: ?>>
      %alloc_55 = memref.alloc() : memref<64x64xf16>
      %subview_56 = memref.subview %reinterpret_cast_53[0, 0] [%51, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>> to memref<?x64xf16, strided<[256, 1], offset: ?>>
      %cast_57 = memref.cast %subview_56 : memref<?x64xf16, strided<[256, 1], offset: ?>> to memref<?x?xf16, strided<[256, 1], offset: ?>>
      %subview_58 = memref.subview %alloc_55[%50, 0] [%51, 64] [1, 1] : memref<64x64xf16> to memref<?x64xf16, strided<[64, 1], offset: ?>>
      %alloc_59 = memref.alloc() : memref<4x4x16x16xf16>
      %subview_60 = memref.subview %alloc_59[0, %57, %58, 0] [4, %56, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xf16> to memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_61 = memref.cast %subview_60 : memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 50 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_57 : memref<?x?xf16, strided<[256, 1], offset: ?>>) outs(%cast_61 : memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : f16 init_condition = %52 : i1
      hivm.hir.anchor {id = 51 : i64}
      %89 = bufferization.to_tensor %alloc_59 restrict writable : memref<4x4x16x16xf16>
      hivm.hir.anchor {id = 52 : i64}
      hivm.hir.load ins(%subview_56 : memref<?x64xf16, strided<[256, 1], offset: ?>>) outs(%subview_58 : memref<?x64xf16, strided<[64, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : f16 init_out_buffer = true init_condition = %52 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 53 : i64}
      %90 = bufferization.to_tensor %alloc_55 restrict writable : memref<64x64xf16>
      hivm.hir.anchor {id = 54 : i64}
      %91 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, hivm.remain_in_l0c, normalized_in_L0C} ins(%71, %89, %true, %c64, %c64, %c64 : tensor<4x4x16x16xf16>, tensor<4x4x16x16xf16>, i1, index, index, index) outs(%79 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 55 : i64}
      %92 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%59, %71, %true, %c64, %c64, %c64 : tensor<4x4x16x16xf16>, tensor<4x4x16x16xf16>, i1, index, index, index) outs(%79 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 56 : i64}
      %alloc_62 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_62 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast_63 = memref.memory_space_cast %alloc_62 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %93 = bufferization.to_tensor %memspacecast_63 restrict writable : memref<64x64xf32>
      hivm.hir.anchor {id = 57 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%92 : tensor<4x4x16x16xf32>) outs(%alloc_62 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 58 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %expanded_64 = tensor.expand_shape %54 [[0, 1]] output_shape [64, 1] : tensor<64xf32> into tensor<64x1xf32>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %94 = hivm.hir.vmul ins(%93, %expanded_64 : tensor<64x64xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x64xf32>) broadcast = [1] -> tensor<64x64xf32>
      hivm.hir.anchor {id = 59 : i64}
      %95 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%90 : tensor<64x64xf16>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 60 : i64}
      %96 = hivm.hir.vmul ins(%93, %95 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 61 : i64}
      %expanded_65 = tensor.expand_shape %10 [[0, 1]] output_shape [64, 1] : tensor<64xf32> into tensor<64x1xf32>
      %97 = hivm.hir.vreduce <sum> ins(%96 : tensor<64x64xf32>) outs(%expanded_65 : tensor<64x1xf32>) reduce_dims = [1] -> tensor<64x1xf32>
      hivm.hir.anchor {id = 62 : i64}
      %collapsed_66 = tensor.collapse_shape %97 [[0, 1]] : tensor<64x1xf32> into tensor<64xf32>
      %98 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%94 : tensor<64x64xf32>) outs(%74 : tensor<64x64xf16>) -> tensor<64x64xf16>
      hivm.hir.anchor {id = 63 : i64}
      %extracted_slice = tensor.extract_slice %98[%50, 0] [%51, 64] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x64xf16> to tensor<?x64xf16>
      hivm.hir.anchor {id = 64 : i64}
      %subview_67 = memref.subview %reinterpret_cast_54[0, 0] [%51, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>> to memref<?x64xf16, strided<[256, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice : tensor<?x64xf16>) outs(%subview_67 : memref<?x64xf16, strided<[256, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 65 : i64}
      %99 = hivm.hir.vmul ins(%61, %cst_2 : tensor<64x64xf32>, f32) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 66 : i64}
      %100 = hivm.hir.vexp ins(%99 : tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 67 : i64}
      %101 = hivm.hir.vmul ins(%100, %expanded_64 : tensor<64x64xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x64xf32>) broadcast = [1] -> tensor<64x64xf32>
      hivm.hir.anchor {id = 68 : i64}
      %102 = hivm.hir.vmul ins(%66, %cst_2 : tensor<64xf32>, f32) outs(%9 : tensor<64xf32>) -> tensor<64xf32>
      hivm.hir.anchor {id = 69 : i64}
      %103 = hivm.hir.vexp ins(%102 : tensor<64xf32>) outs(%9 : tensor<64xf32>) -> tensor<64xf32>
      hivm.hir.anchor {id = 70 : i64}
      %104 = hivm.hir.vmul ins(%collapsed, %103 : tensor<64xf32>, tensor<64xf32>) outs(%9 : tensor<64xf32>) -> tensor<64xf32>
      hivm.hir.anchor {id = 71 : i64}
      %105 = hivm.hir.vmul ins(%81, %100 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 72 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
      %106 = hivm.hir.vmul ins(%105, %arg19 : tensor<64x64xf32>, f32) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 73 : i64}
      %expanded_68 = tensor.expand_shape %66 [[0, 1]] output_shape [1, 64] : tensor<64xf32> into tensor<1x64xf32>
      %107 = hivm.hir.vsub ins(%expanded_68, %61 : tensor<1x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) broadcast = [0] -> tensor<64x64xf32>
      hivm.hir.anchor {id = 74 : i64}
      %108 = hivm.hir.vmul ins(%107, %cst_2 : tensor<64x64xf32>, f32) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 75 : i64}
      %109 = hivm.hir.vexp ins(%108 : tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 76 : i64}
      %110 = tensor.empty() : tensor<64xf16>
      %111 = hivm.hir.vsel ins(%25, %cst_3, %cst_0 : tensor<64xi1>, f16, f16) outs(%110 : tensor<64xf16>) -> tensor<64xf16>
      hivm.hir.anchor {id = 77 : i64}
      %expanded_69 = tensor.expand_shape %111 [[0, 1]] output_shape [64, 1] : tensor<64xf16> into tensor<64x1xf16>
      %112 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_69 : tensor<64x1xf16>) outs(%74 : tensor<64x64xf16>) broadcast_dims = [1] -> tensor<64x64xf16>
      hivm.hir.anchor {id = 78 : i64}
      %113 = tensor.empty() : tensor<64x64xi1>
      %114 = hivm.hir.vcmp ins(%112, %cst_0 : tensor<64x64xf16>, f16) outs(%113 : tensor<64x64xi1>) compare_mode = <ne> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 79 : i64}
      %115 = arith.index_cast %20 : i32 to index
      %116 = affine.apply #map6()[%115]
      %117 = arith.maxsi %115, %43 : index
      %118 = arith.minsi %116, %117 : index
      %119 = affine.apply #map1()[%118, %115]
      %extracted_slice_70 = tensor.extract_slice %109[0, 0] [%119, 64] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x64xf32> to tensor<?x64xf32>
      hivm.hir.anchor {id = 80 : i64}
      %inserted_slice = tensor.insert_slice %extracted_slice_70 into %8[0, 0] [%119, 64] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<?x64xf32> into tensor<64x64xf32>
      hivm.hir.anchor {id = 81 : i64}
      %120 = hivm.hir.vmul ins(%86, %inserted_slice : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 82 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
      %121 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%60 : tensor<64x64xf16>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 83 : i64}
      %122 = hivm.hir.vmul ins(%121, %100 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 84 : i64}
      %alloc_71 = memref.alloc() : memref<64x64xf16, #hivm.address_space<ub>>
      annotation.mark %alloc_71 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>} : memref<64x64xf16, #hivm.address_space<ub>>
      %memspacecast_72 = memref.memory_space_cast %alloc_71 : memref<64x64xf16, #hivm.address_space<ub>> to memref<64x64xf16>
      %123 = bufferization.to_tensor %memspacecast_72 restrict writable : memref<64x64xf16>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 85 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, pre_quant = #hivm.fixpipe_pre_quant_mode<F322F16>} ins(%88 : tensor<4x4x16x16xf32>) outs(%alloc_71 : memref<64x64xf16, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 86 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %124 = hivm.hir.vmul ins(%123, %cst_3 : tensor<64x64xf16>, f16) outs(%74 : tensor<64x64xf16>) -> tensor<64x64xf16>
      hivm.hir.anchor {id = 87 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
      %125 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%122 : tensor<64x64xf32>) outs(%74 : tensor<64x64xf16>) -> tensor<64x64xf16>
      hivm.hir.anchor {id = 88 : i64}
      %expanded_73 = tensor.expand_shape %125 [[0], [1, 2]] output_shape [64, 4, 16] : tensor<64x64xf16> into tensor<64x4x16xf16>
      %126 = hivm.hir.vtranspose ins(%expanded_73 : tensor<64x4x16xf16>) outs(%76 : tensor<4x64x16xf16>) permutation = [1, 0, 2] -> tensor<4x64x16xf16>
      hivm.hir.anchor {id = 89 : i64}
      %expanded_74 = tensor.expand_shape %126 [[0], [1, 2], [3]] output_shape [4, 4, 16, 16] : tensor<4x64x16xf16> into tensor<4x4x16x16xf16>
      %alloc_75 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_75 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %127 = bufferization.to_tensor %alloc_75 restrict writable : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      hivm.hir.anchor {id = 90 : i64}
      hivm.hir.copy ins(%expanded_74 : tensor<4x4x16x16xf16>) outs(%alloc_75 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 91 : i64}
      %expanded_76 = tensor.expand_shape %124 [[0], [1, 2]] output_shape [64, 4, 16] : tensor<64x64xf16> into tensor<64x4x16xf16>
      %128 = hivm.hir.vtranspose ins(%expanded_76 : tensor<64x4x16xf16>) outs(%76 : tensor<4x64x16xf16>) permutation = [1, 0, 2] -> tensor<4x64x16xf16>
      hivm.hir.anchor {id = 92 : i64}
      %expanded_77 = tensor.expand_shape %128 [[0], [1, 2], [3]] output_shape [4, 4, 16, 16] : tensor<4x64x16xf16> into tensor<4x4x16x16xf16>
      %alloc_78 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_78 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %129 = bufferization.to_tensor %alloc_78 restrict writable : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 93 : i64}
      hivm.hir.copy ins(%expanded_77 : tensor<4x4x16x16xf16>) outs(%alloc_78 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 94 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %130 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%129, %127, %false, %c64, %c64, %c64 : tensor<4x4x16x16xf16>, tensor<4x4x16x16xf16>, i1, index, index, index) outs(%91 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 95 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      %alloc_79 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_79 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast_80 = memref.memory_space_cast %alloc_79 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %131 = bufferization.to_tensor %memspacecast_80 restrict writable : memref<64x64xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 96 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%130 : tensor<4x4x16x16xf32>) outs(%alloc_79 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 97 : i64}
      %alloc_81 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_81 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %132 = bufferization.to_tensor %alloc_81 restrict writable : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      hivm.hir.anchor {id = 98 : i64}
      hivm.hir.copy ins(%expanded_77 : tensor<4x4x16x16xf16>) outs(%alloc_81 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 99 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %133 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%59, %132, %true, %c64, %c64, %c64 : tensor<4x4x16x16xf16>, tensor<4x4x16x16xf16>, i1, index, index, index) outs(%79 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 100 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      %alloc_82 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_82 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast_83 = memref.memory_space_cast %alloc_82 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %134 = bufferization.to_tensor %memspacecast_83 restrict writable : memref<64x64xf32>
      hivm.hir.anchor {id = 101 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%133 : tensor<4x4x16x16xf32>) outs(%alloc_82 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 102 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %135 = hivm.hir.vmul ins(%134, %122 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 103 : i64}
      %136 = hivm.hir.vreduce <sum> ins(%135 : tensor<64x64xf32>) outs(%expanded_65 : tensor<64x1xf32>) reduce_dims = [1] -> tensor<64x1xf32>
      hivm.hir.anchor {id = 104 : i64}
      %collapsed_84 = tensor.collapse_shape %136 [[0, 1]] : tensor<64x1xf32> into tensor<64xf32>
      %137 = hivm.hir.vadd ins(%collapsed_66, %collapsed_84 : tensor<64xf32>, tensor<64xf32>) outs(%9 : tensor<64xf32>) -> tensor<64xf32>
      hivm.hir.anchor {id = 105 : i64}
      %reinterpret_cast_85 = memref.reinterpret_cast %arg2 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf16> to memref<64x64xf16, strided<[256, 1], offset: ?>>
      %alloc_86 = memref.alloc() : memref<64x64xf16>
      %subview_87 = memref.subview %reinterpret_cast_85[0, 0] [%51, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>> to memref<?x64xf16, strided<[256, 1], offset: ?>>
      %subview_88 = memref.subview %alloc_86[%50, 0] [%51, 64] [1, 1] : memref<64x64xf16> to memref<?x64xf16, strided<[64, 1], offset: ?>>
      hivm.hir.anchor {id = 106 : i64}
      hivm.hir.load ins(%subview_87 : memref<?x64xf16, strided<[256, 1], offset: ?>>) outs(%subview_88 : memref<?x64xf16, strided<[64, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : f16 init_out_buffer = true init_condition = %52 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 107 : i64}
      %138 = bufferization.to_tensor %alloc_86 restrict writable : memref<64x64xf16>
      hivm.hir.anchor {id = 108 : i64}
      %139 = hivm.hir.vmul ins(%121, %120 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 109 : i64}
      %140 = hivm.hir.vreduce <sum> ins(%139 : tensor<64x64xf32>) outs(%expanded : tensor<1x64xf32>) reduce_dims = [0] -> tensor<1x64xf32>
      hivm.hir.anchor {id = 110 : i64}
      %collapsed_89 = tensor.collapse_shape %140 [[0, 1]] : tensor<1x64xf32> into tensor<64xf32>
      %141 = hivm.hir.vadd ins(%104, %collapsed_89 : tensor<64xf32>, tensor<64xf32>) outs(%9 : tensor<64xf32>) -> tensor<64xf32>
      hivm.hir.anchor {id = 111 : i64}
      %142 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%138 : tensor<64x64xf16>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 112 : i64}
      %143 = hivm.hir.vmul ins(%142, %106 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 113 : i64}
      %144 = hivm.hir.vsub ins(%143, %139 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 114 : i64}
      %expanded_90 = tensor.expand_shape %29 [[0, 1]] output_shape [64, 1] : tensor<64xi1> into tensor<64x1xi1>
      %145 = tensor.empty() : tensor<64x1xf32>
      %146 = hivm.hir.vsel ins(%expanded_90, %cst_1, %cst : tensor<64x1xi1>, f32, f32) outs(%145 : tensor<64x1xf32>) -> tensor<64x1xf32>
      hivm.hir.anchor {id = 115 : i64}
      %expanded_91 = tensor.expand_shape %141 [[0, 1]] output_shape [1, 64] : tensor<64xf32> into tensor<1x64xf32>
      %147 = hivm.hir.vmul ins(%146, %expanded_91 : tensor<64x1xf32>, tensor<1x64xf32>) outs(%7 : tensor<64x64xf32>) broadcast = [0, 1] -> tensor<64x64xf32>
      hivm.hir.anchor {id = 116 : i64}
      %148 = hivm.hir.vadd ins(%144, %147 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 117 : i64}
      %149 = hivm.hir.vmul ins(%135, %expanded_64 : tensor<64x64xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x64xf32>) broadcast = [1] -> tensor<64x64xf32>
      hivm.hir.anchor {id = 118 : i64}
      %150 = hivm.hir.vadd ins(%148, %149 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 119 : i64}
      %151 = hivm.hir.vmul ins(%134, %101 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 120 : i64}
      %152 = hivm.hir.vadd ins(%120, %151 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 121 : i64}
      %reinterpret_cast_92 = memref.reinterpret_cast %arg12 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf32> to memref<64x64xf32, strided<[256, 1], offset: ?>>
      %reinterpret_cast_93 = memref.reinterpret_cast %arg13 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf32> to memref<64x64xf32, strided<[256, 1], offset: ?>>
      %reinterpret_cast_94 = memref.reinterpret_cast %arg16 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf32> to memref<64x64xf32, strided<[256, 1], offset: ?>>
      %extracted_slice_95 = tensor.extract_slice %106[%50, 0] [%51, 64] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x64xf32> to tensor<?x64xf32>
      hivm.hir.anchor {id = 122 : i64}
      %subview_96 = memref.subview %reinterpret_cast_92[0, 0] [%51, 64] [1, 1] : memref<64x64xf32, strided<[256, 1], offset: ?>> to memref<?x64xf32, strided<[256, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_95 : tensor<?x64xf32>) outs(%subview_96 : memref<?x64xf32, strided<[256, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 123 : i64}
      %extracted_slice_97 = tensor.extract_slice %152[%50, 0] [%51, 64] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x64xf32> to tensor<?x64xf32>
      hivm.hir.anchor {id = 124 : i64}
      %subview_98 = memref.subview %reinterpret_cast_93[0, 0] [%51, 64] [1, 1] : memref<64x64xf32, strided<[256, 1], offset: ?>> to memref<?x64xf32, strided<[256, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_97 : tensor<?x64xf32>) outs(%subview_98 : memref<?x64xf32, strided<[256, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 125 : i64}
      %extracted_slice_99 = tensor.extract_slice %150[%50, 0] [%51, 64] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x64xf32> to tensor<?x64xf32>
      hivm.hir.anchor {id = 126 : i64}
      %subview_100 = memref.subview %reinterpret_cast_94[0, 0] [%51, 64] [1, 1] : memref<64x64xf32, strided<[256, 1], offset: ?>> to memref<?x64xf32, strided<[256, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_99 : tensor<?x64xf32>) outs(%subview_100 : memref<?x64xf32, strided<[256, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 127 : i64}
      %expanded_101 = tensor.expand_shape %23 [[0, 1]] output_shape [64, 1] : tensor<64xi32> into tensor<64x1xi32>
      %153 = tensor.empty() : tensor<64x64xi32>
      %154 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_101 : tensor<64x1xi32>) outs(%153 : tensor<64x64xi32>) broadcast_dims = [1] -> tensor<64x64xi32>
      hivm.hir.anchor {id = 128 : i64}
      %expanded_102 = tensor.expand_shape %23 [[0, 1]] output_shape [1, 64] : tensor<64xi32> into tensor<1x64xi32>
      %155 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_102 : tensor<1x64xi32>) outs(%153 : tensor<64x64xi32>) broadcast_dims = [0] -> tensor<64x64xi32>
      hivm.hir.anchor {id = 129 : i64}
      %156 = hivm.hir.vcmp ins(%154, %155 : tensor<64x64xi32>, tensor<64x64xi32>) outs(%113 : tensor<64x64xi1>) compare_mode = <gt> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 130 : i64}
      %expanded_103 = tensor.expand_shape %111 [[0, 1]] output_shape [1, 64] : tensor<64xf16> into tensor<1x64xf16>
      %157 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_103 : tensor<1x64xf16>) outs(%74 : tensor<64x64xf16>) broadcast_dims = [0] -> tensor<64x64xf16>
      hivm.hir.anchor {id = 131 : i64}
      %158 = hivm.hir.vcmp ins(%157, %cst_0 : tensor<64x64xf16>, f16) outs(%113 : tensor<64x64xi1>) compare_mode = <ne> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 132 : i64}
      %159 = hivm.hir.vand ins(%114, %158 : tensor<64x64xi1>, tensor<64x64xi1>) outs(%113 : tensor<64x64xi1>) -> tensor<64x64xi1>
      hivm.hir.anchor {id = 133 : i64}
      %160 = hivm.hir.vand ins(%156, %159 : tensor<64x64xi1>, tensor<64x64xi1>) outs(%113 : tensor<64x64xi1>) -> tensor<64x64xi1>
      hivm.hir.anchor {id = 134 : i64}
      %expanded_104 = tensor.expand_shape %54 [[0, 1]] output_shape [1, 64] : tensor<64xf32> into tensor<1x64xf32>
      %161 = hivm.hir.vmul ins(%131, %expanded_104 : tensor<64x64xf32>, tensor<1x64xf32>) outs(%7 : tensor<64x64xf32>) broadcast = [0] -> tensor<64x64xf32>
      hivm.hir.anchor {id = 135 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
      %162 = hivm.hir.vsel ins(%160, %161, %cst : tensor<64x64xi1>, tensor<64x64xf32>, f32) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 136 : i64}
      %163 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%162 : tensor<64x64xf32>) outs(%74 : tensor<64x64xf16>) -> tensor<64x64xf16>
      hivm.hir.anchor {id = 137 : i64}
      %expanded_105 = tensor.expand_shape %163 [[0], [1, 2]] output_shape [64, 4, 16] : tensor<64x64xf16> into tensor<64x4x16xf16>
      %164 = hivm.hir.vtranspose ins(%expanded_105 : tensor<64x4x16xf16>) outs(%76 : tensor<4x64x16xf16>) permutation = [1, 0, 2] -> tensor<4x64x16xf16>
      hivm.hir.anchor {id = 138 : i64}
      %expanded_106 = tensor.expand_shape %164 [[0], [1, 2], [3]] output_shape [4, 4, 16, 16] : tensor<4x64x16xf16> into tensor<4x4x16x16xf16>
      %alloc_107 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_107 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %165 = bufferization.to_tensor %alloc_107 restrict writable : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      hivm.hir.anchor {id = 139 : i64}
      hivm.hir.copy ins(%expanded_106 : tensor<4x4x16x16xf16>) outs(%alloc_107 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 140 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %166 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%165, %59, %true, %c64, %c64, %c64 : tensor<4x4x16x16xf16>, tensor<4x4x16x16xf16>, i1, index, index, index) outs(%79 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 141 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      %167 = tensor.empty() : tensor<4x4x16x16xf16>
      %168 = hivm.hir.fixpipe {pre_quant = #hivm.fixpipe_pre_quant_mode<F322F16>} ins(%166 : tensor<4x4x16x16xf32>) outs(%167 : tensor<4x4x16x16xf16>) -> tensor<4x4x16x16xf16>
      hivm.hir.anchor {id = 142 : i64}
      %169 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%59, %168, %true, %c64, %c64, %c64 : tensor<4x4x16x16xf16>, tensor<4x4x16x16xf16>, i1, index, index, index) outs(%79 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 143 : i64}
      %alloc_108 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_108 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast_109 = memref.memory_space_cast %alloc_108 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %170 = bufferization.to_tensor %memspacecast_109 restrict writable : memref<64x64xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.anchor {id = 144 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%169 : tensor<4x4x16x16xf32>) outs(%alloc_108 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 145 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %171 = hivm.hir.vmul ins(%170, %cst_4 : tensor<64x64xf32>, f32) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 146 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
      %172 = hivm.hir.vsel ins(%160, %171, %cst : tensor<64x64xi1>, tensor<64x64xf32>, f32) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 147 : i64}
      %reinterpret_cast_110 = memref.reinterpret_cast %arg18 to offset: [%55], sizes: [64, 64], strides: [256, 1] : memref<?xf32> to memref<64x64xf32, strided<[256, 1], offset: ?>>
      %reinterpret_cast_111 = memref.reinterpret_cast %arg17 to offset: [%42], sizes: [64], strides: [4] : memref<?xf32> to memref<64xf32, strided<[4], offset: ?>>
      %extracted_slice_112 = tensor.extract_slice %172[%50, 0] [%51, 64] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x64xf32> to tensor<?x64xf32>
      hivm.hir.anchor {id = 148 : i64}
      %subview_113 = memref.subview %reinterpret_cast_110[0, 0] [%51, 64] [1, 1] : memref<64x64xf32, strided<[256, 1], offset: ?>> to memref<?x64xf32, strided<[256, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_112 : tensor<?x64xf32>) outs(%subview_113 : memref<?x64xf32, strided<[256, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 149 : i64}
      %extracted_slice_114 = tensor.extract_slice %137[%50] [%51] [1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64xf32> to tensor<?xf32>
      hivm.hir.anchor {id = 150 : i64}
      %subview_115 = memref.subview %reinterpret_cast_111[0] [%51] [1] : memref<64xf32, strided<[4], offset: ?>> to memref<?xf32, strided<[4], offset: ?>>
      hivm.hir.store ins(%extracted_slice_114 : tensor<?xf32>) outs(%subview_115 : memref<?xf32, strided<[4], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_1_outlined_merged_merged_merged_vf_0(%arg0: index, %arg1: memref<64xi32, #hivm.address_space<ub>>, %arg2: memref<32x64xf16, #hivm.address_space<ub>>, %arg3: memref<32x64xf32, #hivm.address_space<ub>>, %arg4: memref<32x64xf32, #hivm.address_space<ub>>, %arg5: memref<64xf32, #hivm.address_space<ub>>, %arg6: memref<64xf32, #hivm.address_space<ub>>, %arg7: memref<32x64xf32, #hivm.address_space<ub>>, %arg8: memref<32x64xf32, #hivm.address_space<ub>>, %arg9: i32, %arg10: memref<32x64xf32, #hivm.address_space<ub>>, %arg11: memref<32x64xf32, #hivm.address_space<ub>>, %arg12: memref<32x64xf32, #hivm.address_space<ub>>, %arg13: memref<32x64xf32, #hivm.address_space<ub>>, %arg14: memref<32x64xf32, #hivm.address_space<ub>>, %arg15: memref<64xi32, #hivm.address_space<ub>>, %arg16: memref<64xi32, #hivm.address_space<ub>>, %arg17: index, %arg18: memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, %arg19: memref<64xf16, #hivm.address_space<ub>>, %arg20: index, %arg21: memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, %arg22: memref<64x32xf32, #hivm.address_space<ub>>, %arg23: memref<32xf32, #hivm.address_space<ub>>, %arg24: memref<64x32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
    %false = arith.constant false
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf16>
    %c64 = arith.constant 64 : index
    %cst_0 = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_1 = arith.constant dense<1.000000e+00> : vector<1x64xf32>
    %c0_i32 = arith.constant 0 : i32
    %cst_2 = arith.constant 0.000000e+00 : f32
    %cst_3 = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg5[%c0], %cst_2 {in_bounds = [true, true], permutation_map = #map7} : memref<64xf32, #hivm.address_space<ub>>, vector<1x64xf32>
    %1 = vector.transfer_read %arg6[%c0], %cst_2 {in_bounds = [true, true], permutation_map = #map7} : memref<64xf32, #hivm.address_space<ub>>, vector<1x64xf32>
    %2 = arith.addf %0, %1 : vector<1x64xf32>
    %3 = vector.broadcast %arg9 : i32 to vector<1x64xi32>
    scf.for %arg25 = %c0 to %c32 step %c1 {
      %10 = affine.apply #map8()[%arg25, %arg0]
      %subview_5 = memref.subview %arg1[%10] [1] [1] : memref<64xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_6 = memref.subview %arg2[%arg25, 0] [1, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_7 = memref.subview %arg3[%arg25, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_8 = memref.subview %arg4[%arg25, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_9 = memref.subview %arg7[%arg25, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_10 = memref.subview %arg8[%arg25, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_11 = memref.subview %arg10[%arg25, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %11 = vector.transfer_read %subview_6[%c0, %c0], %cst_3 {in_bounds = [true, true]} : memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
      %12 = vector.transfer_read %subview_7[%c0, %c0], %cst_2 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %13 = vector.transfer_read %subview_8[%c0, %c0], %cst_2 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %14 = vector.transfer_read %subview_5[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map9} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %15 = vector.transfer_read %subview_9[%c0, %c0], %cst_2 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %16 = vector.transfer_read %subview_10[%c0, %c0], %cst_2 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %17 = arith.mulf %15, %16 : vector<1x64xf32>
      %18 = arith.cmpi eq, %14, %3 : vector<1x64xi32>
      %19 = arith.select %18, %cst_1, %cst_0 : vector<1x64xi1>, vector<1x64xf32>
      %20 = arith.mulf %19, %2 : vector<1x64xf32>
      %21 = arith.extf %11 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf16> to vector<1x64xf32>
      %22 = arith.mulf %21, %12 : vector<1x64xf32>
      %23 = arith.subf %22, %13 : vector<1x64xf32>
      %24 = arith.addf %23, %20 : vector<1x64xf32>
      %25 = arith.addf %24, %17 : vector<1x64xf32>
      vector.transfer_write %25, %subview_11[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    scf.for %arg25 = %c0 to %c32 step %c1 {
      %subview_5 = memref.subview %arg11[%arg25, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_6 = memref.subview %arg12[%arg25, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_7 = memref.subview %arg13[%arg25, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_8 = memref.subview %arg14[%arg25, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %10 = vector.transfer_read %subview_5[%c0, %c0], %cst_2 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %11 = vector.transfer_read %subview_6[%c0, %c0], %cst_2 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %12 = vector.transfer_read %subview_7[%c0, %c0], %cst_2 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %13 = arith.mulf %11, %12 : vector<1x64xf32>
      %14 = arith.addf %10, %13 : vector<1x64xf32>
      vector.transfer_write %14, %subview_8[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    %subview = memref.subview %arg19[%arg20] [32] [1] : memref<64xf16, #hivm.address_space<ub>> to memref<32xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>
    %subview_4 = memref.subview %arg16[%arg17] [32] [1] : memref<64xi32, #hivm.address_space<ub>> to memref<32xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    %4 = vector.constant_mask [32] : vector<64xi1>
    %5 = vector.transfer_read %subview_4[%c0], %c0_i32, %4 {in_bounds = [true, true], permutation_map = #map7} : memref<32xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
    %6 = vector.constant_mask [1, 32] : vector<1x64xi1>
    %7 = vector.transfer_read %subview[%c0], %cst_3, %4 {in_bounds = [true, true], permutation_map = #map7} : memref<32xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
    %8 = arith.cmpf une, %7, %cst : vector<1x64xf16>
    scf.for %arg25 = %c0 to %c64 step %c1 {
      %subview_5 = memref.subview %arg21[%arg25, 0] [1, 32] [1, 1] : memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_6 = memref.subview %arg15[%arg25] [1] [1] : memref<64xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %10 = vector.transfer_read %subview_6[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map9} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %11 = arith.cmpi sgt, %10, %5 : vector<1x64xi32>
      %subview_7 = memref.subview %arg18[%arg25, 0] [1, 32] [1, 1] : memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %12 = vector.transfer_read %subview_7[%c0, %c0], %false, %6 {in_bounds = [true, true]} : memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi1>
      %13 = arith.andi %12, %8 : vector<1x64xi1>
      %14 = arith.andi %11, %13 : vector<1x64xi1>
      vector.transfer_write %14, %subview_5[%c0, %c0], %6 {in_bounds = [true, true]} : vector<1x64xi1>, memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
    }
    %9 = vector.transfer_read %arg23[%c0], %cst_2, %4 {in_bounds = [true, true], permutation_map = #map7} : memref<32xf32, #hivm.address_space<ub>>, vector<1x64xf32>
    scf.for %arg25 = %c0 to %c64 step %c1 {
      %subview_5 = memref.subview %arg22[%arg25, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_6 = memref.subview %arg24[%arg25, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %10 = vector.transfer_read %subview_5[%c0, %c0], %cst_2, %6 {in_bounds = [true, true]} : memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %11 = arith.mulf %10, %9 : vector<1x64xf32>
      vector.transfer_write %11, %subview_6[%c0, %c0], %6 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg19: f32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<24xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c28_i32 = arith.constant 28 : i32
    %false = arith.constant false
    %true = arith.constant true
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f16
    %c0_i32 = arith.constant 0 : i32
    %c64_i64 = arith.constant 64 : i64
    %c4_i64 = arith.constant 4 : i64
    %c64 = arith.constant 64 : index
    %c4_i32 = arith.constant 4 : i32
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
      %8 = arith.divsi %7, %c4_i32 : i32
      %9 = arith.remsi %7, %c4_i32 : i32
      %10 = arith.muli %8, %arg20 : i32
      %11 = arith.extsi %10 : i32 to i64
      %12 = arith.muli %5, %c64_i32 : i32
      hivm.hir.anchor {id = 6 : i64}
      hivm.hir.anchor {id = 7 : i64}
      hivm.hir.anchor {id = 8 : i64}
      hivm.hir.anchor {id = 9 : i64}
      %13 = arith.muli %11, %c4_i64 : i64
      %14 = arith.extsi %9 : i32 to i64
      %15 = arith.addi %13, %14 : i64
      %16 = arith.muli %15, %c64_i64 : i64
      %17 = arith.index_cast %16 : i64 to index
      %18 = arith.maxsi %12, %c0_i32 : i32
      %19 = arith.index_cast %18 : i32 to index
      %20 = affine.apply #map1()[%4, %19]
      %21 = arith.maxsi %20, %c0 : index
      %22 = arith.minsi %21, %c64 : index
      %23 = arith.subi %c0_i32, %12 : i32
      %24 = arith.maxsi %23, %c0_i32 : i32
      %25 = arith.index_cast %24 : i32 to index
      %26 = arith.minsi %25, %22 : index
      %27 = affine.apply #map1()[%22, %26]
      %28 = arith.cmpi slt, %27, %c64 : index
      hivm.hir.anchor {id = 10 : i64}
      hivm.hir.anchor {id = 11 : i64}
      %29 = affine.apply #map2()[%17, %19]
      %reinterpret_cast = memref.reinterpret_cast %arg8 to offset: [%29], sizes: [64, 64], strides: [256, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %subview = memref.subview %reinterpret_cast[0, 0] [%27, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %cast = memref.cast %subview : memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %30 = affine.apply #map3()[%22, %26]
      %31 = affine.apply #map4()[%26]
      %32 = affine.apply #map5()[%26]
      %alloc = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_0 = memref.subview %alloc[0, %31, %32, 0] [4, %30, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_1 = memref.cast %subview_0 : memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 12 : i64}
      scf.if %28 {
        %collapse_shape = memref.collapse_shape %alloc [[0, 1, 2, 3]] : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> into memref<4096xf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : f16) outs(%collapse_shape : memref<4096xf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast : memref<?x?xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_1 : memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 13 : i64}
      hivm.hir.anchor {id = 14 : i64}
      hivm.hir.anchor {id = 15 : i64}
      hivm.hir.anchor {id = 16 : i64}
      hivm.hir.anchor {id = 17 : i64}
      hivm.hir.anchor {id = 18 : i64}
      hivm.hir.anchor {id = 19 : i64}
      %reinterpret_cast_2 = memref.reinterpret_cast %arg5 to offset: [%29], sizes: [64, 64], strides: [256, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_3 = memref.reinterpret_cast %arg10 to offset: [%29], sizes: [64, 64], strides: [256, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_4 = memref.reinterpret_cast %arg14 to offset: [%29], sizes: [64, 64], strides: [256, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_5 = memref.subview %reinterpret_cast_2[0, 0] [%27, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_6 = memref.cast %subview_5 : memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_7 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_7 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_8 = memref.subview %alloc_7[0, %31, %32, 0] [4, %30, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_9 = memref.cast %subview_8 : memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 20 : i64}
      scf.if %28 {
        %collapse_shape = memref.collapse_shape %alloc_7 [[0, 1, 2, 3]] : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> into memref<4096xf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : f16) outs(%collapse_shape : memref<4096xf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_6 : memref<?x?xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_9 : memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 21 : i64}
      %subview_10 = memref.subview %reinterpret_cast_3[0, 0] [%27, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_11 = memref.cast %subview_10 : memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_12 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_12 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_13 = memref.subview %alloc_12[0, %31, %32, 0] [4, %30, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_14 = memref.cast %subview_13 : memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 22 : i64}
      scf.if %28 {
        %collapse_shape = memref.collapse_shape %alloc_12 [[0, 1, 2, 3]] : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> into memref<4096xf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : f16) outs(%collapse_shape : memref<4096xf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_11 : memref<?x?xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_14 : memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 23 : i64}
      hivm.hir.anchor {id = 24 : i64}
      hivm.hir.anchor {id = 25 : i64}
      hivm.hir.anchor {id = 26 : i64}
      hivm.hir.anchor {id = 27 : i64}
      %subview_15 = memref.subview %reinterpret_cast_4[0, 0] [%27, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_16 = memref.cast %subview_15 : memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_17 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_17 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_18 = memref.subview %alloc_17[0, %31, %32, 0] [4, %30, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_19 = memref.cast %subview_18 : memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 28 : i64}
      scf.if %28 {
        %collapse_shape = memref.collapse_shape %alloc_17 [[0, 1, 2, 3]] : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> into memref<4096xf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : f16) outs(%collapse_shape : memref<4096xf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_16 : memref<?x?xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_19 : memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 29 : i64}
      hivm.hir.anchor {id = 30 : i64}
      hivm.hir.anchor {id = 31 : i64}
      hivm.hir.anchor {id = 32 : i64}
      hivm.hir.anchor {id = 33 : i64}
      hivm.hir.anchor {id = 34 : i64}
      %alloc_20 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_20 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = -1 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 35 : i64}
      hivm.hir.anchor {id = 36 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_21 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_12, %alloc_20, %true, %c64, %c64, %c64 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_21 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 37 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %alloc_22 = memref.alloc() : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_22 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x64xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
      hivm.hir.anchor {id = 38 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_21 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_22 : memref<32x64xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 39 : i64}
      hivm.hir.anchor {id = 40 : i64}
      hivm.hir.anchor {id = 41 : i64}
      %alloc_23 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_23 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = -1 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 42 : i64}
      hivm.hir.anchor {id = 43 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_24 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_24 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_7, %alloc_23, %true, %c64, %c64, %c64 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_24 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 44 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      %alloc_25 = memref.alloc() : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_25 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x64xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 45 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_24 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_25 : memref<32x64xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 46 : i64}
      %alloc_26 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_26 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = -1 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 47 : i64}
      hivm.hir.anchor {id = 48 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_27 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_27 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_17, %alloc_26, %true, %c64, %c64, %c64 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_27 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 49 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      %reinterpret_cast_28 = memref.reinterpret_cast %arg4 to offset: [%29], sizes: [64, 64], strides: [256, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_29 = memref.subview %reinterpret_cast_28[0, 0] [%27, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_30 = memref.cast %subview_29 : memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_31 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_31 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_32 = memref.subview %alloc_31[0, %31, %32, 0] [4, %30, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_33 = memref.cast %subview_32 : memref<4x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 50 : i64}
      scf.if %28 {
        %collapse_shape = memref.collapse_shape %alloc_31 [[0, 1, 2, 3]] : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> into memref<4096xf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : f16) outs(%collapse_shape : memref<4096xf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_30 : memref<?x?xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_33 : memref<?x?x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 51 : i64}
      hivm.hir.anchor {id = 52 : i64}
      hivm.hir.anchor {id = 53 : i64}
      hivm.hir.anchor {id = 54 : i64}
      %alloc_34 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_34 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, hivm.remain_in_l0c, normalized_in_L0C} ins(%alloc_17, %alloc_31, %true, %c64, %c64, %c64 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_34 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 55 : i64}
      %alloc_35 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_35 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_17, %true, %c64, %c64, %c64 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_35 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 56 : i64}
      %alloc_36 = memref.alloc() : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_36 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x64xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 57 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_35 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_36 : memref<32x64xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 58 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 59 : i64}
      hivm.hir.anchor {id = 60 : i64}
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
      %alloc_37 = memref.alloc() : memref<32x64xf16, #hivm.address_space<ub>>
      annotation.mark %alloc_37 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x64xf16, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 85 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, pre_quant = #hivm.fixpipe_pre_quant_mode<F322F16>} ins(%alloc_27 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_37 : memref<32x64xf16, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 86 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 87 : i64}
      hivm.hir.anchor {id = 88 : i64}
      hivm.hir.anchor {id = 89 : i64}
      %alloc_38 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_38 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = -1 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 90 : i64}
      hivm.hir.anchor {id = 91 : i64}
      hivm.hir.anchor {id = 92 : i64}
      %alloc_39 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_39 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = -1 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 93 : i64}
      hivm.hir.anchor {id = 94 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_39, %alloc_38, %false, %c64, %c64, %c64 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_34 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 95 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      %alloc_40 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_40 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 96 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_34 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_40 : memref<64x32xf32, #hivm.address_space<ub>>) dual_dst_mode = <COLUMN_SPLIT>
      hivm.hir.anchor {id = 97 : i64}
      %alloc_41 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_41 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = -1 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 98 : i64}
      hivm.hir.anchor {id = 99 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_42 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_42 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_41, %true, %c64, %c64, %c64 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_42 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 100 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      %alloc_43 = memref.alloc() : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_43 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x64xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 101 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_42 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_43 : memref<32x64xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 102 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
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
      %alloc_44 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_44 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = -1 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 139 : i64}
      hivm.hir.anchor {id = 140 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_45 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_45 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_44, %alloc, %true, %c64, %c64, %c64 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_45 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 141 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      %alloc_46 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.fixpipe {pre_quant = #hivm.fixpipe_pre_quant_mode<F322F16>} ins(%alloc_45 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_46 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 142 : i64}
      %alloc_47 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_47 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_46, %true, %c64, %c64, %c64 : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_47 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 143 : i64}
      %alloc_48 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_48 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.anchor {id = 144 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_47 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_48 : memref<64x32xf32, #hivm.address_space<ub>>) dual_dst_mode = <COLUMN_SPLIT>
      hivm.hir.anchor {id = 145 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 146 : i64}
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
    %c512 = arith.constant 512 : index
    return %c512 : index
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_2_outlined_vf_0(%arg0: memref<64xi32, #hivm.address_space<ub>>, %arg1: i32, %arg2: memref<64xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf16>
    %cst_0 = arith.constant dense<-1.000000e+00> : vector<64xf16>
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %c0_i32 {in_bounds = [true]} : memref<64xi32, #hivm.address_space<ub>>, vector<64xi32>
    %1 = vector.broadcast %arg1 : i32 to vector<64xi32>
    %2 = arith.cmpi slt, %0, %1 : vector<64xi32>
    %3 = arith.select %2, %cst_0, %cst : vector<64xi1>, vector<64xf16>
    vector.transfer_write %3, %arg2[%c0] {in_bounds = [true]} : vector<64xf16>, memref<64xf16, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_2_outlined_vf_1(%arg0: memref<64xf16, #hivm.address_space<ub>>, %arg1: memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %cst_0 = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 32] : vector<1x128xi1>
    scf.for %arg2 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg2] [1] [1] : memref<64xf16, #hivm.address_space<ub>> to memref<1xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg2, 0] [1, 32] [1, 1] : memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map9} : memref<1xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x128xf16>
      %2 = arith.cmpf une, %1, %cst : vector<1x128xf16>
      vector.transfer_write %2, %subview_1[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x128xi1>, memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_3_outlined_vf_0(%arg0: memref<64x64xf32, #hivm.address_space<ub>>, %arg1: index, %arg2: memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 32] : vector<1x64xi1>
    %1 = vector.constant_mask [2, 1, 16] : vector<4x1x16xi1>
    scf.for %arg3 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg2[0, %arg3, 0] [2, 1, 16] [1, 1, 1] : memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<2x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg0[%arg3, %arg1] [1, 32] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_0[%c0, %c0], %cst, %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %3 = arith.truncf %2 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
      %4 = vector.shape_cast %3 : vector<1x64xf16> to vector<4x1x16xf16>
      vector.transfer_write %4, %subview[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : vector<4x1x16xf16>, memref<2x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_4_outlined_vf_0(%arg0: memref<64x64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c4 = arith.constant 4 : index
    scf.for %arg2 = %c0 to %c4 step %c1 {
      %subview_4 = memref.subview %arg0[%arg2, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %9 = vector.transfer_read %subview_4[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %10 = affine.apply #map10()[%arg2]
      %subview_5 = memref.subview %arg0[%10, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %11 = vector.transfer_read %subview_5[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %12 = affine.apply #map11()[%arg2]
      %subview_6 = memref.subview %arg0[%12, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %13 = vector.transfer_read %subview_6[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %14 = affine.apply #map12()[%arg2]
      %subview_7 = memref.subview %arg0[%14, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %15 = vector.transfer_read %subview_7[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %16 = affine.apply #map13()[%arg2]
      %subview_8 = memref.subview %arg0[%16, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %17 = vector.transfer_read %subview_8[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %18 = affine.apply #map14()[%arg2]
      %subview_9 = memref.subview %arg0[%18, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %19 = vector.transfer_read %subview_9[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %20 = affine.apply #map15()[%arg2]
      %subview_10 = memref.subview %arg0[%20, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %21 = vector.transfer_read %subview_10[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %22 = affine.apply #map16()[%arg2]
      %subview_11 = memref.subview %arg0[%22, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %23 = vector.transfer_read %subview_11[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %24 = affine.apply #map17()[%arg2]
      %subview_12 = memref.subview %arg0[%24, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %25 = vector.transfer_read %subview_12[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %26 = affine.apply #map18()[%arg2]
      %subview_13 = memref.subview %arg0[%26, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %27 = vector.transfer_read %subview_13[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %28 = affine.apply #map19()[%arg2]
      %subview_14 = memref.subview %arg0[%28, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %29 = vector.transfer_read %subview_14[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %30 = affine.apply #map20()[%arg2]
      %subview_15 = memref.subview %arg0[%30, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %31 = vector.transfer_read %subview_15[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %32 = affine.apply #map21()[%arg2]
      %subview_16 = memref.subview %arg0[%32, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %33 = vector.transfer_read %subview_16[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %34 = affine.apply #map22()[%arg2]
      %subview_17 = memref.subview %arg0[%34, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %35 = vector.transfer_read %subview_17[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %36 = affine.apply #map23()[%arg2]
      %subview_18 = memref.subview %arg0[%36, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %37 = vector.transfer_read %subview_18[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %38 = affine.apply #map24()[%arg2]
      %subview_19 = memref.subview %arg0[%38, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %39 = vector.transfer_read %subview_19[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %40 = arith.addf %9, %25 : vector<1x64xf32>
      %41 = arith.addf %11, %27 : vector<1x64xf32>
      %42 = arith.addf %13, %29 : vector<1x64xf32>
      %43 = arith.addf %15, %31 : vector<1x64xf32>
      %44 = arith.addf %17, %33 : vector<1x64xf32>
      %45 = arith.addf %19, %35 : vector<1x64xf32>
      %46 = arith.addf %21, %37 : vector<1x64xf32>
      %47 = arith.addf %23, %39 : vector<1x64xf32>
      %48 = arith.addf %40, %44 : vector<1x64xf32>
      %49 = arith.addf %41, %45 : vector<1x64xf32>
      %50 = arith.addf %42, %46 : vector<1x64xf32>
      %51 = arith.addf %43, %47 : vector<1x64xf32>
      %52 = arith.addf %48, %50 : vector<1x64xf32>
      %53 = arith.addf %49, %51 : vector<1x64xf32>
      %54 = arith.addf %52, %53 : vector<1x64xf32>
      vector.transfer_write %54, %subview_4[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    %subview = memref.subview %arg0[0, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1]>, #hivm.address_space<ub>>
    %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1]>, #hivm.address_space<ub>>, vector<1x64xf32>
    %subview_1 = memref.subview %arg0[1, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: 64>, #hivm.address_space<ub>>
    %1 = vector.transfer_read %subview_1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: 64>, #hivm.address_space<ub>>, vector<1x64xf32>
    %subview_2 = memref.subview %arg0[2, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: 128>, #hivm.address_space<ub>>
    %2 = vector.transfer_read %subview_2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: 128>, #hivm.address_space<ub>>, vector<1x64xf32>
    %subview_3 = memref.subview %arg0[3, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: 192>, #hivm.address_space<ub>>
    %3 = vector.transfer_read %subview_3[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: 192>, #hivm.address_space<ub>>, vector<1x64xf32>
    %4 = arith.addf %0, %2 : vector<1x64xf32>
    %5 = arith.addf %1, %3 : vector<1x64xf32>
    %6 = arith.addf %4, %5 : vector<1x64xf32>
    %7 = vector.shape_cast %6 : vector<1x64xf32> to vector<64xf32>
    %8 = arith.addf %7, %cst : vector<64xf32>
    vector.transfer_write %8, %arg1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_5_outlined_vf_0(%arg0: memref<64x64xf32, #hivm.address_space<ub>>, %arg1: index, %arg2: memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[0, %arg1] [64, 32] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x32xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    %0 = vector.constant_mask [1, 32] : vector<1x64xi1>
    %1 = vector.constant_mask [2, 1, 16] : vector<4x1x16xi1>
    scf.for %arg3 = %c0 to %c64 step %c1 {
      %subview_0 = memref.subview %arg2[0, %arg3, 0] [2, 1, 16] [1, 1, 1] : memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<2x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %subview[%arg3, 0] [1, 32] [1, 1] : memref<64x32xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>> to memref<1x32xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %cst, %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %3 = arith.truncf %2 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
      %4 = vector.shape_cast %3 : vector<1x64xf16> to vector<4x1x16xf16>
      vector.transfer_write %4, %subview_0[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : vector<4x1x16xf16>, memref<2x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_6_outlined_vf_0(%arg0: memref<32xf32, #hivm.address_space<ub>>, %arg1: memref<32x64xf32, #hivm.address_space<ub>>, %arg2: memref<32x64xf32, #hivm.address_space<ub>>, %arg3: memref<32x64xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg4] [1] [1] : memref<32xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg2[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map9} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      vector.transfer_write %0, %subview_0[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg3[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.mulf %1, %0 : vector<1x64xf32>
      %3 = arith.truncf %2 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
      vector.transfer_write %3, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf16>, memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_7_outlined_vf_0(%arg0: memref<32x64xf32, #hivm.address_space<ub>>, %arg1: memref<32x64xf16, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>, %arg3: index, %arg4: memref<32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 0.000000e+00 : f16
    %subview = memref.subview %arg2[%arg3] [32] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<32xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    scf.for %arg5 = %c0 to %c32 step %c1 {
      %subview_2 = memref.subview %subview[%arg5] [1] [1] : memref<32xf32, strided<[1], offset: ?>, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_3 = memref.subview %arg0[%arg5, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_4 = memref.subview %arg1[%arg5, 0] [1, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_3[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %3 = vector.transfer_read %subview_4[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
      %4 = arith.extf %3 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf16> to vector<1x64xf32>
      %5 = arith.mulf %2, %4 : vector<1x64xf32>
      %6 = arith.addf %5, %cst {reductionOp} : vector<1x64xf32>
      %7 = vector.transfer_read %subview_2[%c0], %cst_0 {in_bounds = [true]} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1xf32>
      %8 = vector.multi_reduction <add>, %6, %7 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
      vector.transfer_write %8, %subview_2[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    %0 = vector.constant_mask [32] : vector<64xi1>
    %1 = vector.transfer_read %subview[%c0], %cst_0, %0 : memref<32xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
    vector.transfer_write %1, %arg4[%c0], %0 : vector<64xf32>, memref<32xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_0(%arg0: memref<32x64xf32, #hivm.address_space<ub>>, %arg1: memref<32x64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.693147182> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg2, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg2, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = arith.mulf %0, %cst : vector<1x64xf32>
      %2 = math.exp %1 : vector<1x64xf32>
      vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_1(%arg0: memref<32x64xf32, #hivm.address_space<ub>>, %arg1: memref<32x64xf32, #hivm.address_space<ub>>, %arg2: memref<32x64xf32, #hivm.address_space<ub>>, %arg3: memref<32x64xf32, #hivm.address_space<ub>>, %arg4: memref<32x64xf32, #hivm.address_space<ub>>, %arg5: memref<32x64xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<0.693147182> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg6 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg3[%arg6, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst_0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg0[%arg6, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg1[%arg6, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_3 = memref.subview %arg4[%arg6, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.mulf %0, %1 : vector<1x64xf32>
      vector.transfer_write %2, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_4 = memref.subview %arg2[%arg6, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_5 = memref.subview %arg5[%arg6, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %3 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %4 = arith.mulf %3, %0 : vector<1x64xf32>
      vector.transfer_write %4, %subview_5[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_9_outlined_vf_0(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.693147182> : vector<64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %cst_0 {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %1 = vector.transfer_read %arg1[%c0], %cst_0 {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = arith.mulf %1, %cst : vector<64xf32>
    %3 = math.exp %2 : vector<64xf32>
    %4 = arith.mulf %0, %3 : vector<64xf32>
    vector.transfer_write %4, %arg2[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_10_outlined_vf_0(%arg0: memref<32x64xf32, #hivm.address_space<ub>>, %arg1: f32, %arg2: memref<32x64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %arg1 : f32 to vector<1x64xf32>
    scf.for %arg3 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg3, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg2[%arg3, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.mulf %1, %0 : vector<1x64xf32>
      vector.transfer_write %2, %subview_0[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_0(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<32x64xf32, #hivm.address_space<ub>>, %arg2: memref<32x64xf32, #hivm.address_space<ub>>, %arg3: memref<32x64xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.693147182> : vector<1x64xf32>
    %cst_0 = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %cst_1 {in_bounds = [true, true], permutation_map = #map7} : memref<64xf32, #hivm.address_space<ub>>, vector<1x64xf32>
    scf.for %arg4 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg1[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg2[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.subf %0, %1 : vector<1x64xf32>
      %3 = arith.mulf %2, %cst : vector<1x64xf32>
      %4 = math.exp %3 : vector<1x64xf32>
      vector.transfer_write %4, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_3 = memref.subview %arg3[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst_0, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_1(%arg0: memref<32x64xf32, #hivm.address_space<ub>>, %arg1: memref<32x64xf32, #hivm.address_space<ub>>, %arg2: memref<32x64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg3, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg3, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg3, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.mulf %0, %1 : vector<1x64xf32>
      vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_12_outlined_vf_0(%arg0: memref<32x64xf16, #hivm.address_space<ub>>, %arg1: memref<32x64xf32, #hivm.address_space<ub>>, %arg2: memref<32x64xf32, #hivm.address_space<ub>>, %arg3: memref<32x64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
      %1 = arith.extf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf16> to vector<1x64xf32>
      vector.transfer_write %1, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    scf.for %arg4 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg1[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg3[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.mulf %0, %1 : vector<1x64xf32>
      vector.transfer_write %2, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_13_outlined_vf_0(%arg0: memref<32x64xf16, #hivm.address_space<ub>>, %arg1: memref<32x64xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<-1.000000e+00> : vector<1x128xf16>
    %cst_0 = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 64] : vector<1x128xi1>
    scf.for %arg2 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg2, 0] [1, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg2, 0] [1, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0, %c0], %cst_0, %0 {in_bounds = [true, true]} : memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x128xf16>
      %2 = arith.mulf %1, %cst : vector<1x128xf16>
      vector.transfer_write %2, %subview_1[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_14_outlined_vf_0(%arg0: memref<32x64xf32, #hivm.address_space<ub>>, %arg1: memref<4x32x16xf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg2, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = arith.truncf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
      %subview_0 = memref.subview %arg1[0, %arg2, 0] [4, 1, 16] [1, 1, 1] : memref<4x32x16xf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> to memref<4x1x16xf16, strided<[528, 16, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.shape_cast %1 : vector<1x64xf16> to vector<4x1x16xf16>
      vector.transfer_write %2, %subview_0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<4x1x16xf16>, memref<4x1x16xf16, strided<[528, 16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_15_outlined_vf_0(%arg0: memref<32x64xf16, #hivm.address_space<ub>>, %arg1: memref<4x32x16xf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [4, 1, 16] : vector<8x1x16xi1>
    scf.for %arg2 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg1[0, %arg2, 0] [4, 1, 16] [1, 1, 1] : memref<4x32x16xf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> to memref<4x1x16xf16, strided<[528, 16, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg0[%arg2, 0] [1, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, false]} : memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x128xf16>
      %2 = vector.shape_cast %1 : vector<1x128xf16> to vector<8x1x16xf16>
      vector.transfer_write %2, %subview[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : vector<8x1x16xf16>, memref<4x1x16xf16, strided<[528, 16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_0(%arg0: memref<32x64xf32, #hivm.address_space<ub>>, %arg1: memref<32x64xf32, #hivm.address_space<ub>>, %arg2: memref<32x64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg3, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg3, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg3, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.mulf %0, %1 : vector<1x64xf32>
      vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_1(%arg0: memref<32x64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: index, %arg3: memref<32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg1[%arg2] [32] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<32xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    scf.for %arg4 = %c0 to %c32 step %c1 {
      %subview_1 = memref.subview %subview[%arg4] [1] [1] : memref<32xf32, strided<[1], offset: ?>, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg0[%arg4, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %3 = arith.addf %2, %cst {reductionOp} : vector<1x64xf32>
      %4 = vector.transfer_read %subview_1[%c0], %cst_0 {in_bounds = [true]} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1xf32>
      %5 = vector.multi_reduction <add>, %3, %4 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
      vector.transfer_write %5, %subview_1[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    %0 = vector.constant_mask [32] : vector<64xi1>
    %1 = vector.transfer_read %subview[%c0], %cst_0, %0 : memref<32xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
    vector.transfer_write %1, %arg3[%c0], %0 : vector<64xf32>, memref<32xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_17_outlined_vf_0(%arg0: memref<32x64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c2 = arith.constant 2 : index
    scf.for %arg2 = %c0 to %c2 step %c1 {
      %subview_2 = memref.subview %arg0[%arg2, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %5 = vector.transfer_read %subview_2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %6 = affine.apply #map25()[%arg2]
      %subview_3 = memref.subview %arg0[%6, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %7 = vector.transfer_read %subview_3[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %8 = affine.apply #map10()[%arg2]
      %subview_4 = memref.subview %arg0[%8, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %9 = vector.transfer_read %subview_4[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %10 = affine.apply #map26()[%arg2]
      %subview_5 = memref.subview %arg0[%10, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %11 = vector.transfer_read %subview_5[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %12 = affine.apply #map11()[%arg2]
      %subview_6 = memref.subview %arg0[%12, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %13 = vector.transfer_read %subview_6[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %14 = affine.apply #map27()[%arg2]
      %subview_7 = memref.subview %arg0[%14, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %15 = vector.transfer_read %subview_7[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %16 = affine.apply #map12()[%arg2]
      %subview_8 = memref.subview %arg0[%16, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %17 = vector.transfer_read %subview_8[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %18 = affine.apply #map28()[%arg2]
      %subview_9 = memref.subview %arg0[%18, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %19 = vector.transfer_read %subview_9[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %20 = affine.apply #map13()[%arg2]
      %subview_10 = memref.subview %arg0[%20, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %21 = vector.transfer_read %subview_10[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %22 = affine.apply #map29()[%arg2]
      %subview_11 = memref.subview %arg0[%22, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %23 = vector.transfer_read %subview_11[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %24 = affine.apply #map14()[%arg2]
      %subview_12 = memref.subview %arg0[%24, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %25 = vector.transfer_read %subview_12[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %26 = affine.apply #map30()[%arg2]
      %subview_13 = memref.subview %arg0[%26, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %27 = vector.transfer_read %subview_13[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %28 = affine.apply #map15()[%arg2]
      %subview_14 = memref.subview %arg0[%28, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %29 = vector.transfer_read %subview_14[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %30 = affine.apply #map31()[%arg2]
      %subview_15 = memref.subview %arg0[%30, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %31 = vector.transfer_read %subview_15[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %32 = affine.apply #map16()[%arg2]
      %subview_16 = memref.subview %arg0[%32, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %33 = vector.transfer_read %subview_16[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %34 = affine.apply #map32()[%arg2]
      %subview_17 = memref.subview %arg0[%34, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %35 = vector.transfer_read %subview_17[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %36 = arith.addf %5, %21 : vector<1x64xf32>
      %37 = arith.addf %7, %23 : vector<1x64xf32>
      %38 = arith.addf %9, %25 : vector<1x64xf32>
      %39 = arith.addf %11, %27 : vector<1x64xf32>
      %40 = arith.addf %13, %29 : vector<1x64xf32>
      %41 = arith.addf %15, %31 : vector<1x64xf32>
      %42 = arith.addf %17, %33 : vector<1x64xf32>
      %43 = arith.addf %19, %35 : vector<1x64xf32>
      %44 = arith.addf %36, %40 : vector<1x64xf32>
      %45 = arith.addf %37, %41 : vector<1x64xf32>
      %46 = arith.addf %38, %42 : vector<1x64xf32>
      %47 = arith.addf %39, %43 : vector<1x64xf32>
      %48 = arith.addf %44, %46 : vector<1x64xf32>
      %49 = arith.addf %45, %47 : vector<1x64xf32>
      %50 = arith.addf %48, %49 : vector<1x64xf32>
      vector.transfer_write %50, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    %subview = memref.subview %arg0[0, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1]>, #hivm.address_space<ub>>
    %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1]>, #hivm.address_space<ub>>, vector<1x64xf32>
    %subview_1 = memref.subview %arg0[1, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: 64>, #hivm.address_space<ub>>
    %1 = vector.transfer_read %subview_1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: 64>, #hivm.address_space<ub>>, vector<1x64xf32>
    %2 = arith.addf %0, %1 : vector<1x64xf32>
    %3 = vector.shape_cast %2 : vector<1x64xf32> to vector<64xf32>
    %4 = arith.addf %3, %cst : vector<64xf32>
    vector.transfer_write %4, %arg1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_18_outlined_vf_0(%arg0: memref<2x64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[0, 0] [1, 64] [1, 1] : memref<2x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1]>, #hivm.address_space<ub>>
    %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1]>, #hivm.address_space<ub>>, vector<1x64xf32>
    %subview_1 = memref.subview %arg0[1, 0] [1, 64] [1, 1] : memref<2x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: 64>, #hivm.address_space<ub>>
    %1 = vector.transfer_read %subview_1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: 64>, #hivm.address_space<ub>>, vector<1x64xf32>
    %2 = arith.addf %0, %1 : vector<1x64xf32>
    %3 = vector.shape_cast %2 : vector<1x64xf32> to vector<64xf32>
    %4 = arith.addf %3, %cst : vector<64xf32>
    vector.transfer_write %4, %arg1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_22_outlined_vf_0(%arg0: memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, %arg1: memref<64x32xf32, #hivm.address_space<ub>>, %arg2: memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %false = arith.constant false
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 32] : vector<1x64xi1>
    %1 = vector.constant_mask [2, 1, 16] : vector<4x1x16xi1>
    scf.for %arg3 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg2[0, %arg3, 0] [2, 1, 16] [1, 1, 1] : memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<2x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg0[%arg3, 0] [1, 32] [1, 1] : memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg1[%arg3, 0] [1, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %false, %0 {in_bounds = [true, true]} : memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi1>
      %3 = vector.transfer_read %subview_2[%c0, %c0], %cst_0, %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %4 = arith.select %2, %3, %cst : vector<1x64xi1>, vector<1x64xf32>
      %5 = arith.truncf %4 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
      %6 = vector.shape_cast %5 : vector<1x64xf16> to vector<4x1x16xf16>
      vector.transfer_write %6, %subview[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : vector<4x1x16xf16>, memref<2x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_1(%arg0: memref<32x64xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 64] : vector<1x128xi1>
    scf.for %arg1 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_2(%arg0: memref<32x64xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_3(%arg0: memref<32x64xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 64] : vector<1x128xi1>
    scf.for %arg1 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_4(%arg0: memref<32x64xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 64] : vector<1x128xi1>
    scf.for %arg1 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_5(%arg0: memref<64x64xf32, #hivm.address_space<ub>>, %arg1: memref<64x64xf32, #hivm.address_space<ub>>, %arg2: memref<64x64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg3, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg3, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg3, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.mulf %0, %1 : vector<1x64xf32>
      vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_6(%arg0: memref<32xf32, #hivm.address_space<ub>>, %arg1: memref<32xf32, #hivm.address_space<ub>>, %arg2: memref<32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [32] : vector<64xi1>
    %1 = vector.transfer_read %arg0[%c0], %cst, %0 {in_bounds = [true]} : memref<32xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = vector.transfer_read %arg1[%c0], %cst, %0 {in_bounds = [true]} : memref<32xf32, #hivm.address_space<ub>>, vector<64xf32>
    %3 = arith.addf %1, %2 : vector<64xf32>
    vector.transfer_write %3, %arg2[%c0], %0 {in_bounds = [true]} : vector<64xf32>, memref<32xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_7(%arg0: memref<32x64xf32, #hivm.address_space<ub>>, %arg1: memref<32x64xf32, #hivm.address_space<ub>>, %arg2: memref<32x64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg3, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg3, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg3, 0] [1, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.mulf %0, %1 : vector<1x64xf32>
      vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_8(%arg0: memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, %arg1: memref<64x32xf32, #hivm.address_space<ub>>, %arg2: memref<64x32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_9(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xi32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0> : vector<64xindex>
    %cst_0 = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63]> : vector<64xindex>
    %cst_1 = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c0 = arith.constant 0 : index
    vector.transfer_write %cst_1, %arg0[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    %0 = arith.addi %cst, %cst_0 : vector<64xindex>
    %1 = arith.index_cast %0 : vector<64xindex> to vector<64xi32>
    vector.transfer_write %1, %arg1[%c0] {in_bounds = [true]} : vector<64xi32>, memref<64xi32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg19: f32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<24xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c8 = arith.constant 8 : index
    %c64_i32 = arith.constant 64 : i32
    %c4_i32 = arith.constant 4 : i32
    %c64 = arith.constant 64 : index
    %c4_i64 = arith.constant 4 : i64
    %c64_i64 = arith.constant 64 : i64
    %c256_i64 = arith.constant 256 : i64
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f16
    %c4096_i64 = arith.constant 4096 : i64
    %c63_i32 = arith.constant 63 : i32
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg21, %arg22 : i32
    %1 = arith.muli %0, %arg23 : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %4 = arith.addi %arg20, %c63_i32 : i32
    %5 = arith.divsi %4, %c64_i32 : i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64xi32, #hivm.address_space<ub>>
    call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_9(%alloc, %alloc_1) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>) -> ()
    %6 = arith.index_cast %arg20 : i32 to index
    %7 = arith.index_cast %2 : i64 to index
    %8 = affine.apply #map33()[%7]
    %view = memref.view %arg1[%8][] : memref<?xi8, #hivm.address_space<gm>> to memref<2x64xf32, #hivm.address_space<gm>>
    %9 = hivm.hir.get_sub_block_idx -> i64
    %10 = arith.index_cast %9 : i64 to index
    %11 = affine.apply #map34()[%10]
    %12 = affine.apply #map35()[%10]
    hivm.hir.anchor {id = 0 : i64}
    annotation.mark %1 {logical_block_num} : i32
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.anchor {id = 1 : i64}
    %13 = affine.apply #map36()[%10]
    %subview = memref.subview %view[%10, 0] [1, 64] [1, 1] : memref<2x64xf32, #hivm.address_space<gm>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
    scf.for %arg24 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %14 = arith.remsi %arg24, %arg21 : i32
      %15 = arith.divsi %arg24, %arg21 : i32
      %16 = arith.remsi %15, %arg22 : i32
      hivm.hir.anchor {id = 3 : i64}
      hivm.hir.anchor {id = 4 : i64}
      hivm.hir.anchor {id = 5 : i64}
      %17 = arith.divsi %16, %c4_i32 : i32
      %18 = arith.remsi %16, %c4_i32 : i32
      %19 = arith.muli %17, %5 : i32
      %20 = arith.addi %19, %14 : i32
      %21 = arith.extsi %20 : i32 to i64
      %22 = arith.muli %17, %arg20 : i32
      %23 = arith.extsi %22 : i32 to i64
      %24 = arith.muli %14, %c64_i32 : i32
      hivm.hir.anchor {id = 6 : i64}
      %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<64xi32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_0_outlined_vf_0(%alloc_1, %24, %alloc_2) {hivm.vector_function, no_inline} : (memref<64xi32, #hivm.address_space<ub>>, i32, memref<64xi32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 7 : i64}
      hivm.hir.anchor {id = 8 : i64}
      %25 = arith.addi %24, %c64_i32 : i32
      %26 = arith.minsi %arg20, %25 : i32
      %27 = arith.subi %26, %c1_i32 : i32
      hivm.hir.anchor {id = 9 : i64}
      %28 = arith.muli %23, %c4_i64 : i64
      %29 = arith.extsi %18 : i32 to i64
      %30 = arith.addi %28, %29 : i64
      %31 = arith.muli %30, %c64_i64 : i64
      %32 = arith.index_cast %31 : i64 to index
      %33 = arith.index_cast %30 : i64 to index
      %34 = arith.muli %21, %c4_i64 : i64
      %35 = arith.addi %34, %29 : i64
      %36 = arith.muli %35, %c4096_i64 : i64
      %37 = arith.index_cast %36 : i64 to index
      %38 = arith.maxsi %24, %c0_i32 : i32
      %39 = arith.index_cast %38 : i32 to index
      %40 = affine.apply #map()[%33, %39]
      %41 = affine.apply #map2()[%32, %39]
      %42 = affine.apply #map1()[%6, %39]
      %reinterpret_cast = memref.reinterpret_cast %arg7 to offset: [%40], sizes: [64], strides: [4] : memref<?xf32, #hivm.address_space<gm>> to memref<64xf32, strided<[4], offset: ?>, #hivm.address_space<gm>>
      %alloc_3 = memref.alloc() : memref<32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_3 {hivm.multi_buffer = 2 : i32} : memref<32xf32, #hivm.address_space<ub>>
      %43 = arith.maxsi %42, %c0 : index
      %44 = arith.minsi %43, %c64 : index
      %45 = arith.subi %c0_i32, %24 : i32
      %46 = arith.maxsi %45, %c0_i32 : i32
      %47 = arith.index_cast %46 : i32 to index
      %48 = arith.minsi %47, %44 : index
      %49 = affine.apply #map1()[%44, %48]
      %50 = arith.cmpi slt, %49, %c64 : index
      %51 = arith.minsi %11, %49 : index
      %52 = affine.apply #map37()[%51, %44, %48]
      %53 = arith.minsi %52, %c32 : index
      %subview_4 = memref.subview %reinterpret_cast[%11] [%53] [1] : memref<64xf32, strided<[4], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[4], offset: ?>, #hivm.address_space<gm>>
      %54 = arith.maxsi %48, %11 : index
      %55 = arith.minsi %44, %13 : index
      %56 = arith.maxsi %54, %55 : index
      %57 = affine.apply #map1()[%56, %54]
      %58 = affine.apply #map38()[%54, %10]
      %subview_5 = memref.subview %alloc_3[%58] [%57] [1] : memref<32xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %59 = arith.remui %48, %c8 : index
      hivm.hir.anchor {id = 10 : i64}
      scf.if %50 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_0(%alloc_3) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_4 : memref<?xf32, strided<[4], offset: ?>, #hivm.address_space<gm>>) outs(%subview_5 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index
      hivm.hir.anchor {id = 11 : i64}
      hivm.hir.anchor {id = 12 : i64}
      hivm.hir.anchor {id = 13 : i64}
      %reinterpret_cast_6 = memref.reinterpret_cast %arg3 to offset: [%41], sizes: [64, 64], strides: [256, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_7 = memref.reinterpret_cast %arg6 to offset: [%41], sizes: [64, 64], strides: [256, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_8 = memref.alloc() : memref<32x64xf16, #hivm.address_space<ub>>
      annotation.mark %alloc_8 {hivm.multi_buffer = 2 : i32} : memref<32x64xf16, #hivm.address_space<ub>>
      %subview_9 = memref.subview %reinterpret_cast_6[%11, 0] [%53, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_10 = memref.subview %alloc_8[%58, 0] [%57, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<?x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 14 : i64}
      scf.if %50 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_1(%alloc_8) {hivm.vector_function, no_inline} : (memref<32x64xf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_9 : memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_10 : memref<?x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : f16
      hivm.hir.anchor {id = 15 : i64}
      %alloc_11 = memref.alloc() : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_11 {hivm.multi_buffer = 2 : i32} : memref<32x64xf32, #hivm.address_space<ub>>
      %subview_12 = memref.subview %reinterpret_cast_7[%11, 0] [%53, 64] [1, 1] : memref<64x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_13 = memref.subview %alloc_11[%58, 0] [%57, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 16 : i64}
      scf.if %50 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_2(%alloc_11) {hivm.vector_function, no_inline} : (memref<32x64xf32, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_12 : memref<?x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_13 : memref<?x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32
      hivm.hir.anchor {id = 17 : i64}
      %60 = arith.extsi %27 : i32 to i64
      %61 = arith.muli %60, %c256_i64 : i64
      %62 = arith.addi %31, %61 : i64
      %63 = arith.index_cast %62 : i64 to index
      %reinterpret_cast_14 = memref.reinterpret_cast %arg6 to offset: [%63], sizes: [64], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %alloc_15 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_15 {hivm.multi_buffer = 2 : i32} : memref<64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_15 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 18 : i64}
      hivm.hir.load ins(%reinterpret_cast_14 : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_15 : memref<64xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 19 : i64}
      %reinterpret_cast_16 = memref.reinterpret_cast %arg9 to offset: [%37], sizes: [64, 64], strides: [64, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_17 = memref.reinterpret_cast %arg11 to offset: [%37], sizes: [64, 64], strides: [64, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 20 : i64}
      hivm.hir.anchor {id = 21 : i64}
      hivm.hir.anchor {id = 22 : i64}
      hivm.hir.anchor {id = 23 : i64}
      %alloc_18 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_18 {hivm.multi_buffer = 2 : i32} : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_18 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x64xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 24 : i64}
      %collapse_shape = memref.collapse_shape %reinterpret_cast_16 [[0, 1]] : memref<64x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<gm>> into memref<4096xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %collapse_shape_19 = memref.collapse_shape %alloc_18 [[0, 1]] : memref<64x64xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape : memref<4096xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%collapse_shape_19 : memref<4096xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 25 : i64}
      %alloc_20 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_20 {hivm.multi_buffer = 2 : i32} : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_20 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x64xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 26 : i64}
      %collapse_shape_21 = memref.collapse_shape %reinterpret_cast_17 [[0, 1]] : memref<64x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<gm>> into memref<4096xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %collapse_shape_22 = memref.collapse_shape %alloc_20 [[0, 1]] : memref<64x64xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape_21 : memref<4096xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%collapse_shape_22 : memref<4096xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 27 : i64}
      hivm.hir.anchor {id = 28 : i64}
      hivm.hir.anchor {id = 29 : i64}
      hivm.hir.anchor {id = 30 : i64}
      %alloc_23 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_5(%alloc_18, %alloc_20, %alloc_23) {hivm.vector_function, no_inline} : (memref<64x64xf32, #hivm.address_space<ub>>, memref<64x64xf32, #hivm.address_space<ub>>, memref<64x64xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 31 : i64}
      %alloc_24 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_4_outlined_vf_0(%alloc_23, %alloc_24) {hivm.vector_function, no_inline} : (memref<64x64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 32 : i64}
      hivm.hir.anchor {id = 33 : i64}
      hivm.hir.anchor {id = 34 : i64}
      %alloc_25 = memref.alloc() : memref<2x65x16x1xf16, #hivm.address_space<ub>>
      %subview_26 = memref.subview %alloc_25[0, 0, 0, 0] [2, 64, 16, 1] [1, 1, 1, 1] : memref<2x65x16x1xf16, #hivm.address_space<ub>> to memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_3_outlined_vf_0(%alloc_18, %11, %subview_26) {hivm.vector_function, no_inline} : (memref<64x64xf32, #hivm.address_space<ub>>, index, memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape = memref.expand_shape %subview_26 [[0], [1, 2], [3]] output_shape [2, 4, 16, 16] : memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<2x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_27 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_28 = memref.subview %alloc_27[%12, 0, 0, 0] [2, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<2x4x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_27 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = 0 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      hivm.hir.anchor {id = 35 : i64}
      %collapse_shape_29 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<2x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<2x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_30 = memref.collapse_shape %subview_28 [[0], [1, 2, 3]] : memref<2x4x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x1024xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_29 : memref<2x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_30 : memref<2x1024xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 36 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 37 : i64}
      %alloc_31 = memref.alloc() : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_31 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x64xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 38 : i64}
      hivm.hir.anchor {id = 39 : i64}
      hivm.hir.anchor {id = 40 : i64}
      hivm.hir.anchor {id = 41 : i64}
      %alloc_32 = memref.alloc() : memref<2x65x16x1xf16, #hivm.address_space<ub>>
      %subview_33 = memref.subview %alloc_32[0, 0, 0, 0] [2, 64, 16, 1] [1, 1, 1, 1] : memref<2x65x16x1xf16, #hivm.address_space<ub>> to memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_5_outlined_vf_0(%alloc_20, %11, %subview_33) {hivm.vector_function, no_inline} : (memref<64x64xf32, #hivm.address_space<ub>>, index, memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_34 = memref.expand_shape %subview_33 [[0], [1, 2], [3]] output_shape [2, 4, 16, 16] : memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<2x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_35 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_36 = memref.subview %alloc_35[%12, 0, 0, 0] [2, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<2x4x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_35 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = 0 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      hivm.hir.anchor {id = 42 : i64}
      %collapse_shape_37 = memref.collapse_shape %expand_shape_34 [[0], [1, 2, 3]] : memref<2x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<2x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_38 = memref.collapse_shape %subview_36 [[0], [1, 2, 3]] : memref<2x4x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x1024xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_37 : memref<2x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_38 : memref<2x1024xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 43 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 44 : i64}
      %alloc_39 = memref.alloc() : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_39 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x64xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 45 : i64}
      hivm.hir.anchor {id = 46 : i64}
      %alloc_40 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_41 = memref.subview %alloc_40[%12, 0, 0, 0] [2, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<2x4x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_40 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = 0 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      hivm.hir.anchor {id = 47 : i64}
      %collapse_shape_42 = memref.collapse_shape %subview_41 [[0], [1, 2, 3]] : memref<2x4x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x1024xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_29 : memref<2x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_42 : memref<2x1024xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 48 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 49 : i64}
      %reinterpret_cast_43 = memref.reinterpret_cast %arg4 to offset: [%41], sizes: [64, 64], strides: [256, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_44 = memref.reinterpret_cast %arg15 to offset: [%41], sizes: [64, 64], strides: [256, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_45 = memref.alloc() : memref<32x64xf16, #hivm.address_space<ub>>
      annotation.mark %alloc_45 {hivm.multi_buffer = 2 : i32} : memref<32x64xf16, #hivm.address_space<ub>>
      %subview_46 = memref.subview %reinterpret_cast_43[%11, 0] [%53, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_47 = memref.subview %alloc_45[%58, 0] [%57, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<?x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 50 : i64}
      hivm.hir.anchor {id = 51 : i64}
      hivm.hir.anchor {id = 52 : i64}
      scf.if %50 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_3(%alloc_45) {hivm.vector_function, no_inline} : (memref<32x64xf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_46 : memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_47 : memref<?x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : f16
      hivm.hir.anchor {id = 53 : i64}
      hivm.hir.anchor {id = 54 : i64}
      hivm.hir.anchor {id = 55 : i64}
      hivm.hir.anchor {id = 56 : i64}
      %alloc_48 = memref.alloc() : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_48 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x64xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 57 : i64}
      hivm.hir.anchor {id = 58 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 59 : i64}
      hivm.hir.anchor {id = 60 : i64}
      hivm.hir.anchor {id = 61 : i64}
      %alloc_49 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_49 : memref<64xf32, #hivm.address_space<ub>>)
      %alloc_50 = memref.alloc() : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_7_outlined_vf_0(%alloc_48, %alloc_45, %alloc_49, %11, %alloc_50) {hivm.vector_function, no_inline} : (memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf16, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, index, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 62 : i64}
      %alloc_51 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      %alloc_52 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf16, #hivm.address_space<ub>>
      annotation.mark %alloc_52 {hivm.multi_buffer = 2 : i32} : memref<32x64xf16, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_6_outlined_vf_0(%alloc_3, %alloc_48, %alloc_51, %alloc_52) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf16, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 63 : i64}
      %subview_53 = memref.subview %alloc_52[%58, 0] [%57, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<?x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 64 : i64}
      %subview_54 = memref.subview %reinterpret_cast_44[%11, 0] [%53, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_53 : memref<?x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_54 : memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.anchor {id = 65 : i64}
      hivm.hir.anchor {id = 66 : i64}
      hivm.hir.anchor {id = 67 : i64}
      hivm.hir.anchor {id = 68 : i64}
      hivm.hir.anchor {id = 69 : i64}
      hivm.hir.anchor {id = 70 : i64}
      %alloc_55 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_9_outlined_vf_0(%alloc_24, %alloc_15, %alloc_55) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 71 : i64}
      %alloc_56 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_0(%alloc_11, %alloc_56) {hivm.vector_function, no_inline} : (memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>) -> ()
      %alloc_57 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      %alloc_58 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      %alloc_59 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_1(%alloc_56, %alloc_51, %alloc_31, %alloc_57, %alloc_58, %alloc_59) {hivm.vector_function, no_inline} : (memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 72 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
      %alloc_60 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_60 {hivm.multi_buffer = 2 : i32} : memref<32x64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_10_outlined_vf_0(%alloc_59, %arg19, %alloc_60) {hivm.vector_function, no_inline} : (memref<32x64xf32, #hivm.address_space<ub>>, f32, memref<32x64xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 73 : i64}
      hivm.hir.anchor {id = 74 : i64}
      hivm.hir.anchor {id = 75 : i64}
      hivm.hir.anchor {id = 76 : i64}
      hivm.hir.anchor {id = 77 : i64}
      hivm.hir.anchor {id = 78 : i64}
      %alloc_61 = memref.alloc() {alignment = 64 : i64} : memref<64xf16, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_2_outlined_vf_0(%alloc_2, %arg20, %alloc_61) {hivm.vector_function, no_inline} : (memref<64xi32, #hivm.address_space<ub>>, i32, memref<64xf16, #hivm.address_space<ub>>) -> ()
      %alloc_62 = memref.alloc() : memref<64x256x1xi1, #hivm.address_space<ub>>
      %subview_63 = memref.subview %alloc_62[0, 0, 0] [64, 32, 1] [1, 1, 1] : memref<64x256x1xi1, #hivm.address_space<ub>> to memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_2_outlined_vf_1(%alloc_61, %subview_63) {hivm.vector_function, no_inline} : (memref<64xf16, #hivm.address_space<ub>>, memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 79 : i64}
      %64 = arith.index_cast %24 : i32 to index
      %65 = affine.apply #map6()[%64]
      %66 = arith.maxsi %64, %6 : index
      %67 = arith.minsi %65, %66 : index
      %68 = affine.apply #map1()[%67, %64]
      %69 = arith.minsi %11, %68 : index
      %70 = affine.apply #map37()[%69, %67, %64]
      %71 = arith.minsi %70, %c32 : index
      hivm.hir.anchor {id = 80 : i64}
      hivm.hir.anchor {id = 81 : i64}
      %alloc_64 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      %alloc_65 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_0(%alloc_15, %alloc_11, %alloc_64, %alloc_65) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>) -> ()
      %subview_66 = memref.subview %alloc_64[0, 0] [%71, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<?x64xf32, strided<[64, 1]>, #hivm.address_space<ub>>
      %subview_67 = memref.subview %alloc_65[0, 0] [%71, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<?x64xf32, strided<[64, 1]>, #hivm.address_space<ub>>
      %collapse_shape_68 = memref.collapse_shape %subview_66 [[0, 1]] : memref<?x64xf32, strided<[64, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
      %collapse_shape_69 = memref.collapse_shape %subview_67 [[0, 1]] : memref<?x64xf32, strided<[64, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
      hivm.hir.copy ins(%collapse_shape_68 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_69 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
      %alloc_70 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_1(%alloc_39, %alloc_65, %alloc_70) {hivm.vector_function, no_inline} : (memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 82 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 83 : i64}
      %alloc_71 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      %alloc_72 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_12_outlined_vf_0(%alloc_8, %alloc_71, %alloc_56, %alloc_72) {hivm.vector_function, no_inline} : (memref<32x64xf16, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 84 : i64}
      %alloc_73 = memref.alloc() : memref<32x64xf16, #hivm.address_space<ub>>
      annotation.mark %alloc_73 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x64xf16, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 85 : i64}
      hivm.hir.anchor {id = 86 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %alloc_74 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf16, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_13_outlined_vf_0(%alloc_73, %alloc_74) {hivm.vector_function, no_inline} : (memref<32x64xf16, #hivm.address_space<ub>>, memref<32x64xf16, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 87 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 88 : i64}
      hivm.hir.anchor {id = 89 : i64}
      %alloc_75 = memref.alloc() : memref<4x33x16x1xf16, #hivm.address_space<ub>>
      %subview_76 = memref.subview %alloc_75[0, 0, 0, 0] [4, 32, 16, 1] [1, 1, 1, 1] : memref<4x33x16x1xf16, #hivm.address_space<ub>> to memref<4x32x16xf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_14_outlined_vf_0(%alloc_72, %subview_76) {hivm.vector_function, no_inline} : (memref<32x64xf32, #hivm.address_space<ub>>, memref<4x32x16xf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_77 = memref.expand_shape %subview_76 [[0], [1, 2], [3]] output_shape [4, 2, 16, 16] : memref<4x32x16xf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> into memref<4x2x16x16xf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_78 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_79 = memref.subview %alloc_78[0, %12, 0, 0] [4, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<4x2x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_78 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = 1 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      hivm.hir.anchor {id = 90 : i64}
      %collapse_shape_80 = memref.collapse_shape %expand_shape_77 [[0], [1, 2, 3]] : memref<4x2x16x16xf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>> into memref<4x512xf16, strided<[528, 1]>, #hivm.address_space<ub>>
      %collapse_shape_81 = memref.collapse_shape %subview_79 [[0], [1, 2, 3]] : memref<4x2x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<4x512xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_80 : memref<4x512xf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_81 : memref<4x512xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 91 : i64}
      hivm.hir.anchor {id = 92 : i64}
      %alloc_82 = memref.alloc() : memref<4x33x16x1xf16, #hivm.address_space<ub>>
      %subview_83 = memref.subview %alloc_82[0, 0, 0, 0] [4, 32, 16, 1] [1, 1, 1, 1] : memref<4x33x16x1xf16, #hivm.address_space<ub>> to memref<4x32x16xf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_15_outlined_vf_0(%alloc_74, %subview_83) {hivm.vector_function, no_inline} : (memref<32x64xf16, #hivm.address_space<ub>>, memref<4x32x16xf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_84 = memref.expand_shape %subview_83 [[0], [1, 2], [3]] output_shape [4, 2, 16, 16] : memref<4x32x16xf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> into memref<4x2x16x16xf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_85 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_86 = memref.subview %alloc_85[0, %12, 0, 0] [4, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<4x2x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_85 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = 1 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 93 : i64}
      %collapse_shape_87 = memref.collapse_shape %expand_shape_84 [[0], [1, 2, 3]] : memref<4x2x16x16xf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>> into memref<4x512xf16, strided<[528, 1]>, #hivm.address_space<ub>>
      %collapse_shape_88 = memref.collapse_shape %subview_86 [[0], [1, 2, 3]] : memref<4x2x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<4x512xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_87 : memref<4x512xf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_88 : memref<4x512xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 94 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 95 : i64}
      %alloc_89 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_89 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 96 : i64}
      hivm.hir.anchor {id = 97 : i64}
      %alloc_90 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_91 = memref.subview %alloc_90[0, %12, 0, 0] [4, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<4x2x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_90 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = 1 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      hivm.hir.anchor {id = 98 : i64}
      %collapse_shape_92 = memref.collapse_shape %subview_91 [[0], [1, 2, 3]] : memref<4x2x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<4x512xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_87 : memref<4x512xf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_92 : memref<4x512xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 99 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 100 : i64}
      %alloc_93 = memref.alloc() : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_93 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x64xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 101 : i64}
      hivm.hir.anchor {id = 102 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 103 : i64}
      %alloc_94 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_0(%alloc_93, %alloc_72, %alloc_94) {hivm.vector_function, no_inline} : (memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>) -> ()
      %alloc_95 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_95 : memref<64xf32, #hivm.address_space<ub>>)
      %alloc_96 = memref.alloc() : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_1(%alloc_94, %alloc_95, %11, %alloc_96) {hivm.vector_function, no_inline} : (memref<32x64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, index, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 104 : i64}
      %alloc_97 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_97 {hivm.multi_buffer = 2 : i32} : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_6(%alloc_50, %alloc_96, %alloc_97) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 105 : i64}
      %reinterpret_cast_98 = memref.reinterpret_cast %arg2 to offset: [%41], sizes: [64, 64], strides: [256, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_99 = memref.alloc() : memref<32x64xf16, #hivm.address_space<ub>>
      annotation.mark %alloc_99 {hivm.multi_buffer = 2 : i32} : memref<32x64xf16, #hivm.address_space<ub>>
      %subview_100 = memref.subview %reinterpret_cast_98[%11, 0] [%53, 64] [1, 1] : memref<64x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_101 = memref.subview %alloc_99[%58, 0] [%57, 64] [1, 1] : memref<32x64xf16, #hivm.address_space<ub>> to memref<?x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 106 : i64}
      scf.if %50 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_4(%alloc_99) {hivm.vector_function, no_inline} : (memref<32x64xf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_100 : memref<?x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_101 : memref<?x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : f16
      hivm.hir.anchor {id = 107 : i64}
      hivm.hir.anchor {id = 108 : i64}
      %alloc_102 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_7(%alloc_71, %alloc_70, %alloc_102) {hivm.vector_function, no_inline} : (memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 109 : i64}
      %alloc_103 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      %collapse_shape_104 = memref.collapse_shape %alloc_102 [[0, 1]] : memref<32x64xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
      %collapse_shape_105 = memref.collapse_shape %alloc_103 [[0, 1]] : memref<32x64xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%collapse_shape_104 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_105 : memref<2048xf32, #hivm.address_space<ub>>)
      %alloc_106 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_106 {hivm.multi_buffer = 2 : i32} : memref<64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_17_outlined_vf_0(%alloc_103, %alloc_106) {hivm.vector_function, no_inline} : (memref<32x64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.pipe_barrier[<PIPE_MTE2>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %collapse_shape_107 = memref.collapse_shape %subview [[0, 1]] : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<gm>> into memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%alloc_106 : memref<64xf32, #hivm.address_space<ub>>) outs(%collapse_shape_107 : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.pipe_barrier[<PIPE_MTE3>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %alloc_108 = memref.alloc() : memref<2x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_108 {hivm.multi_buffer = 2 : i32} : memref<2x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_108 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<2x64xf32, #hivm.address_space<ub>>
      %collapse_shape_109 = memref.collapse_shape %view [[0, 1]] : memref<2x64xf32, #hivm.address_space<gm>> into memref<128xf32, #hivm.address_space<gm>>
      %collapse_shape_110 = memref.collapse_shape %alloc_108 [[0, 1]] : memref<2x64xf32, #hivm.address_space<ub>> into memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape_109 : memref<128xf32, #hivm.address_space<gm>>) outs(%collapse_shape_110 : memref<128xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst>
      %alloc_111 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_18_outlined_vf_0(%alloc_108, %alloc_111) {hivm.vector_function, no_inline} : (memref<2x64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 110 : i64}
      hivm.hir.anchor {id = 111 : i64}
      hivm.hir.anchor {id = 112 : i64}
      hivm.hir.anchor {id = 113 : i64}
      hivm.hir.anchor {id = 114 : i64}
      hivm.hir.anchor {id = 115 : i64}
      hivm.hir.anchor {id = 116 : i64}
      hivm.hir.anchor {id = 117 : i64}
      hivm.hir.anchor {id = 118 : i64}
      %alloc_112 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_112 {hivm.multi_buffer = 2 : i32} : memref<32x64xf32, #hivm.address_space<ub>>
      %alloc_113 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_113 {hivm.multi_buffer = 2 : i32} : memref<32x64xf32, #hivm.address_space<ub>>
      %reinterpret_cast_114 = memref.reinterpret_cast %arg12 to offset: [%41], sizes: [64, 64], strides: [256, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_115 = memref.reinterpret_cast %arg13 to offset: [%41], sizes: [64, 64], strides: [256, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_116 = memref.reinterpret_cast %arg16 to offset: [%41], sizes: [64, 64], strides: [256, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_117 = memref.subview %alloc_60[%58, 0] [%57, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_118 = memref.subview %reinterpret_cast_114[%11, 0] [%53, 64] [1, 1] : memref<64x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_117 : memref<?x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_118 : memref<?x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      %subview_119 = memref.subview %reinterpret_cast_115[%11, 0] [%53, 64] [1, 1] : memref<64x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_120 = memref.subview %reinterpret_cast_116[%11, 0] [%53, 64] [1, 1] : memref<64x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_121 = memref.alloc() : memref<64x256x1xi1, #hivm.address_space<ub>>
      %subview_122 = memref.subview %alloc_121[0, 0, 0] [64, 32, 1] [1, 1, 1] : memref<64x256x1xi1, #hivm.address_space<ub>> to memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>
      %alloc_123 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_1_outlined_merged_merged_merged_vf_0(%11, %alloc_2, %alloc_99, %alloc_60, %alloc_102, %alloc_55, %alloc_111, %alloc_94, %alloc_51, %27, %alloc_112, %alloc_70, %alloc_93, %alloc_58, %alloc_113, %alloc_2, %alloc_2, %11, %subview_63, %alloc_61, %11, %subview_122, %alloc_89, %alloc_3, %alloc_123) {hivm.vector_function, no_inline, ptc_simdvf} : (index, memref<64xi32, #hivm.address_space<ub>>, memref<32x64xf16, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, i32, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<32x64xf32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>, index, memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<64xf16, #hivm.address_space<ub>>, index, memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
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
      %subview_124 = memref.subview %alloc_113[%58, 0] [%57, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.store ins(%subview_124 : memref<?x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_119 : memref<?x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      %subview_125 = memref.subview %alloc_112[%58, 0] [%57, 64] [1, 1] : memref<32x64xf32, #hivm.address_space<ub>> to memref<?x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.store ins(%subview_125 : memref<?x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_120 : memref<?x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.anchor {id = 135 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 136 : i64}
      hivm.hir.anchor {id = 137 : i64}
      hivm.hir.anchor {id = 138 : i64}
      %alloc_126 = memref.alloc() : memref<2x65x16x1xf16, #hivm.address_space<ub>>
      %subview_127 = memref.subview %alloc_126[0, 0, 0, 0] [2, 64, 16, 1] [1, 1, 1, 1] : memref<2x65x16x1xf16, #hivm.address_space<ub>> to memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_22_outlined_vf_0(%subview_122, %alloc_123, %subview_127) {hivm.vector_function, no_inline} : (memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>, memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_128 = memref.expand_shape %subview_127 [[0], [1, 2], [3]] output_shape [2, 4, 16, 16] : memref<2x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<2x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_129 = memref.alloc() : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      %subview_130 = memref.subview %alloc_129[%12, 0, 0, 0] [2, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>> to memref<2x4x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_129 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = 0 : index} : memref<4x4x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      hivm.hir.anchor {id = 139 : i64}
      %collapse_shape_131 = memref.collapse_shape %expand_shape_128 [[0], [1, 2, 3]] : memref<2x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<2x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_132 = memref.collapse_shape %subview_130 [[0], [1, 2, 3]] : memref<2x4x16x16xf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x1024xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_131 : memref<2x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_132 : memref<2x1024xf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 140 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 141 : i64}
      hivm.hir.anchor {id = 142 : i64}
      hivm.hir.anchor {id = 143 : i64}
      %alloc_133 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_133 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 144 : i64}
      hivm.hir.anchor {id = 145 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %alloc_134 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_23_outlined_vf_0(%alloc_133, %alloc_134) {hivm.vector_function, no_inline} : (memref<64x32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 146 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
      %alloc_135 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_135 {hivm.multi_buffer = 2 : i32} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_8(%subview_122, %alloc_134, %alloc_135) {hivm.vector_function, no_inline} : (memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 147 : i64}
      %reinterpret_cast_136 = memref.reinterpret_cast %arg18 to offset: [%41], sizes: [64, 64], strides: [256, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_137 = memref.reinterpret_cast %arg17 to offset: [%40], sizes: [64], strides: [4] : memref<?xf32, #hivm.address_space<gm>> to memref<64xf32, strided<[4], offset: ?>, #hivm.address_space<gm>>
      %subview_138 = memref.subview %alloc_135[%48, 0] [%49, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<?x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 148 : i64}
      %subview_139 = memref.subview %reinterpret_cast_136[0, %11] [%49, 32] [1, 1] : memref<64x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x32xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_138 : memref<?x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_139 : memref<?x32xf32, strided<[256, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.anchor {id = 149 : i64}
      %subview_140 = memref.subview %alloc_97[%58] [%57] [1] : memref<32xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 150 : i64}
      %subview_141 = memref.subview %reinterpret_cast_137[%11] [%53] [1] : memref<64xf32, strided<[4], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[4], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_140 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_141 : memref<?xf32, strided<[4], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
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
