#map = affine_map<()[s0] -> (s0 + 1)>
#map1 = affine_map<()[s0, s1] -> (s0 + s1 * 32)>
#map2 = affine_map<()[s0, s1] -> (s0 - s1)>
#map3 = affine_map<()[s0, s1] -> (s0 + s1 * 2048)>
#map4 = affine_map<()[s0, s1] -> ((s0 - s1) ceildiv 16)>
#map5 = affine_map<()[s0] -> (s0 floordiv 16)>
#map6 = affine_map<()[s0] -> (s0 mod 16)>
#map7 = affine_map<()[s0, s1] -> (s0 + s1 * 4096)>
#map8 = affine_map<()[s0] -> (s0 + 64)>
#map9 = affine_map<()[s0, s1] -> (s0 + s1)>
#map10 = affine_map<(d0) -> (d0, 0)>
#map11 = affine_map<(d0) -> (0, d0)>
#map12 = affine_map<()[s0] -> (s0 + 4)>
#map13 = affine_map<()[s0] -> (s0 + 8)>
#map14 = affine_map<()[s0] -> (s0 + 12)>
#map15 = affine_map<()[s0] -> (s0 + 16)>
#map16 = affine_map<()[s0] -> (s0 + 20)>
#map17 = affine_map<()[s0] -> (s0 + 24)>
#map18 = affine_map<()[s0] -> (s0 + 28)>
#map19 = affine_map<()[s0] -> (s0 + 32)>
#map20 = affine_map<()[s0] -> (s0 + 36)>
#map21 = affine_map<()[s0] -> (s0 + 40)>
#map22 = affine_map<()[s0] -> (s0 + 44)>
#map23 = affine_map<()[s0] -> (s0 + 48)>
#map24 = affine_map<()[s0] -> (s0 + 52)>
#map25 = affine_map<()[s0] -> (s0 + 56)>
#map26 = affine_map<()[s0] -> (s0 + 60)>
#map27 = affine_map<(d0) -> (d0 * 16)>
#map28 = affine_map<()[s0] -> (s0 + 2)>
#map29 = affine_map<()[s0] -> (s0 + 6)>
#map30 = affine_map<()[s0] -> (s0 + 10)>
#map31 = affine_map<()[s0] -> (s0 + 14)>
#map32 = affine_map<()[s0] -> (s0 + 18)>
#map33 = affine_map<()[s0] -> (s0 + 22)>
#map34 = affine_map<()[s0] -> (s0 + 26)>
#map35 = affine_map<()[s0] -> (s0 + 30)>
#map36 = affine_map<()[s0] -> (s0 * 2048)>
#map37 = affine_map<()[s0] -> (s0 * 2048 + 1024)>
#map38 = affine_map<()[s0] -> (s0 * 32)>
#map39 = affine_map<()[s0] -> (s0 * 64)>
#map40 = affine_map<()[s0] -> (s0 * 4)>
#map41 = affine_map<()[s0] -> (s0 * 2)>
#map42 = affine_map<()[s0] -> (s0 * 32 + 32)>
#map43 = affine_map<()[s0, s1, s2] -> (-s0 + s1 - s2)>
#map44 = affine_map<()[s0, s1] -> (s0 - s1 * 32)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<MIX>, ssbuffer.insertionOptimization} {
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_backup(%arg0: memref<?xi8> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xbf16> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg19: memref<?xi64> {tt.tensor_kind = 0 : i32}, %arg20: memref<?xi64> {tt.tensor_kind = 0 : i32}, %arg21: f32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, annotation.filter_passes = #annotation.filter_passes<"hivm-insert-anchors-and-backup,hivm-delayed-cross-core-gss,split-simt-module,hivm-merge-same-preload-scopes">, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<26xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.backup_function, hivm.func_core_type = #hivm.func_core_type<MIX>, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    hivm.hir.anchor {id = 0 : i64}
    %c8 = arith.constant 8 : index
    %c64_i32 = arith.constant 64 : i32
    %c2_i32 = arith.constant 2 : i32
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
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c128 = arith.constant 128 : index
    %cst_1 = arith.constant 1.000000e+00 : f32
    %cst_2 = arith.constant 0.693147182 : f32
    %cst_3 = arith.constant 0.000000e+00 : f16
    %cst_4 = arith.constant -1.000000e+00 : f16
    %cst_5 = arith.constant -1.000000e+00 : f32
    %true = arith.constant true
    %false = arith.constant false
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg23, %arg24 : i32
    %1 = arith.muli %0, %arg25 : i32
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
    scf.for %arg26 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %4 = arith.remsi %arg26, %arg23 : i32
      %5 = arith.divsi %arg26, %arg23 : i32
      %6 = arith.remsi %5, %arg24 : i32
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
      %13 = arith.remsi %6, %c32_i32 : i32
      %14 = arith.extsi %4 : i32 to i64
      %15 = arith.muli %4, %c2_i32 : i32
      %16 = arith.index_cast %15 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg20 to offset: [%16], sizes: [1], strides: [1] : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %17 = memref.load %reinterpret_cast[%c0] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<1xi64, strided<[1], offset: ?>>
      hivm.hir.anchor {id = 7 : i64}
      %18 = arith.trunci %17 : i64 to i32
      %19 = affine.apply #map()[%16]
      %reinterpret_cast_6 = memref.reinterpret_cast %arg20 to offset: [%19], sizes: [1], strides: [1] : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %20 = memref.load %reinterpret_cast_6[%c0] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<1xi64, strided<[1], offset: ?>>
      hivm.hir.anchor {id = 8 : i64}
      %21 = arith.trunci %20 : i64 to i32
      %22 = arith.index_cast %18 : i32 to index
      %reinterpret_cast_7 = memref.reinterpret_cast %arg19 to offset: [%22], sizes: [1], strides: [1] : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %23 = memref.load %reinterpret_cast_7[%c0] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<1xi64, strided<[1], offset: ?>>
      hivm.hir.anchor {id = 9 : i64}
      %24 = affine.apply #map()[%22]
      %reinterpret_cast_8 = memref.reinterpret_cast %arg19 to offset: [%24], sizes: [1], strides: [1] : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %25 = memref.load %reinterpret_cast_8[%c0] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<1xi64, strided<[1], offset: ?>>
      hivm.hir.anchor {id = 10 : i64}
      %26 = arith.subi %25, %23 : i64
      %27 = arith.trunci %26 : i64 to i32
      %28 = arith.muli %21, %c64_i32 : i32
      %29 = tensor.empty() : tensor<64xi32>
      %30 = hivm.hir.varange offset[%c0] strides[%c1] outs(%29 : tensor<64xi32>) -> tensor<64xi32>
      hivm.hir.anchor {id = 11 : i64}
      %31 = hivm.hir.vadd ins(%30, %28 : tensor<64xi32>, i32) outs(%29 : tensor<64xi32>) -> tensor<64xi32>
      hivm.hir.anchor {id = 12 : i64}
      %32 = tensor.empty() : tensor<64xi1>
      %33 = hivm.hir.vcmp ins(%31, %27 : tensor<64xi32>, i32) outs(%32 : tensor<64xi1>) compare_mode = <lt> -> tensor<64xi1>
      hivm.hir.anchor {id = 13 : i64}
      %34 = arith.addi %28, %c64_i32 : i32
      %35 = arith.minsi %27, %34 : i32
      %36 = arith.subi %35, %c1_i32 : i32
      %37 = hivm.hir.vcmp ins(%31, %36 : tensor<64xi32>, i32) outs(%32 : tensor<64xi1>) -> tensor<64xi1>
      hivm.hir.anchor {id = 14 : i64}
      %38 = arith.muli %23, %c32_i64 : i64
      %39 = arith.extsi %13 : i32 to i64
      %40 = arith.addi %38, %39 : i64
      %41 = arith.muli %40, %c128_i64 : i64
      %42 = arith.index_cast %41 : i64 to index
      %43 = arith.index_cast %40 : i64 to index
      %44 = arith.muli %40, %c64_i64 : i64
      %45 = arith.index_cast %44 : i64 to index
      %46 = arith.muli %14, %c32_i64 : i64
      %47 = arith.addi %46, %39 : i64
      %48 = arith.muli %47, %c16384_i64 : i64
      %49 = arith.index_cast %48 : i64 to index
      %50 = arith.maxsi %28, %c0_i32 : i32
      %51 = arith.index_cast %50 : i32 to index
      %52 = affine.apply #map1()[%43, %51]
      %53 = arith.index_cast %27 : i32 to index
      %reinterpret_cast_9 = memref.reinterpret_cast %arg7 to offset: [%52], sizes: [64], strides: [32] : memref<?xf32> to memref<64xf32, strided<[32], offset: ?>>
      %alloc = memref.alloc() : memref<64xf32>
      %54 = affine.apply #map2()[%53, %51]
      %55 = arith.maxsi %54, %c0 : index
      %56 = arith.minsi %55, %c64 : index
      %57 = arith.subi %c0_i32, %28 : i32
      %58 = arith.maxsi %57, %c0_i32 : i32
      %59 = arith.index_cast %58 : i32 to index
      %60 = arith.minsi %59, %56 : index
      %61 = affine.apply #map2()[%56, %60]
      %62 = arith.cmpi slt, %61, %c64 : index
      %subview = memref.subview %reinterpret_cast_9[0] [%61] [1] : memref<64xf32, strided<[32], offset: ?>> to memref<?xf32, strided<[32], offset: ?>>
      %subview_10 = memref.subview %alloc[%60] [%61] [1] : memref<64xf32> to memref<?xf32, strided<[1], offset: ?>>
      %63 = arith.remui %60, %c8 : index
      hivm.hir.anchor {id = 15 : i64}
      hivm.hir.load ins(%subview : memref<?xf32, strided<[32], offset: ?>>) outs(%subview_10 : memref<?xf32, strided<[1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %63 : index init_out_buffer = true init_condition = %62 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 16 : i64}
      %64 = bufferization.to_tensor %alloc restrict writable : memref<64xf32>
      %65 = affine.apply #map3()[%45, %51]
      %reinterpret_cast_11 = memref.reinterpret_cast %arg8 to offset: [%65], sizes: [64, 64], strides: [2048, 1] : memref<?xbf16> to memref<64x64xbf16, strided<[2048, 1], offset: ?>>
      %subview_12 = memref.subview %reinterpret_cast_11[0, 0] [%61, 64] [1, 1] : memref<64x64xbf16, strided<[2048, 1], offset: ?>> to memref<?x64xbf16, strided<[2048, 1], offset: ?>>
      %cast = memref.cast %subview_12 : memref<?x64xbf16, strided<[2048, 1], offset: ?>> to memref<?x?xbf16, strided<[2048, 1], offset: ?>>
      %66 = affine.apply #map4()[%56, %60]
      %67 = affine.apply #map5()[%60]
      %68 = affine.apply #map6()[%60]
      %alloc_13 = memref.alloc() : memref<4x4x16x16xbf16>
      %subview_14 = memref.subview %alloc_13[0, %67, %68, 0] [4, %66, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xbf16> to memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_15 = memref.cast %subview_14 : memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 17 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast : memref<?x?xbf16, strided<[2048, 1], offset: ?>>) outs(%cast_15 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %62 : i1
      hivm.hir.anchor {id = 18 : i64}
      %69 = bufferization.to_tensor %alloc_13 restrict writable : memref<4x4x16x16xbf16>
      %70 = affine.apply #map7()[%42, %51]
      %reinterpret_cast_16 = memref.reinterpret_cast %arg3 to offset: [%70], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_17 = memref.reinterpret_cast %arg6 to offset: [%70], sizes: [64, 128], strides: [4096, 1] : memref<?xf32> to memref<64x128xf32, strided<[4096, 1], offset: ?>>
      %alloc_18 = memref.alloc() : memref<64x128xbf16>
      %subview_19 = memref.subview %reinterpret_cast_16[0, 0] [%61, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %subview_20 = memref.subview %alloc_18[%60, 0] [%61, 128] [1, 1] : memref<64x128xbf16> to memref<?x128xbf16, strided<[128, 1], offset: ?>>
      hivm.hir.anchor {id = 19 : i64}
      hivm.hir.load ins(%subview_19 : memref<?x128xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_20 : memref<?x128xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 init_out_buffer = true init_condition = %62 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 20 : i64}
      %71 = bufferization.to_tensor %alloc_18 restrict writable : memref<64x128xbf16>
      %alloc_21 = memref.alloc() : memref<64x128xf32>
      %subview_22 = memref.subview %reinterpret_cast_17[0, 0] [%61, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>> to memref<?x128xf32, strided<[4096, 1], offset: ?>>
      %subview_23 = memref.subview %alloc_21[%60, 0] [%61, 128] [1, 1] : memref<64x128xf32> to memref<?x128xf32, strided<[128, 1], offset: ?>>
      hivm.hir.anchor {id = 21 : i64}
      hivm.hir.load ins(%subview_22 : memref<?x128xf32, strided<[4096, 1], offset: ?>>) outs(%subview_23 : memref<?x128xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 init_out_buffer = true init_condition = %62 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 22 : i64}
      %72 = bufferization.to_tensor %alloc_21 restrict writable : memref<64x128xf32>
      %73 = arith.extsi %36 : i32 to i64
      %74 = arith.muli %73, %c4096_i64 : i64
      %75 = arith.addi %41, %74 : i64
      %76 = arith.index_cast %75 : i64 to index
      %reinterpret_cast_24 = memref.reinterpret_cast %arg6 to offset: [%76], sizes: [128], strides: [1] : memref<?xf32> to memref<128xf32, strided<[1], offset: ?>>
      %alloc_25 = memref.alloc() : memref<128xf32>
      hivm.hir.anchor {id = 23 : i64}
      hivm.hir.load ins(%reinterpret_cast_24 : memref<128xf32, strided<[1], offset: ?>>) outs(%alloc_25 : memref<128xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 24 : i64}
      %77 = bufferization.to_tensor %alloc_25 restrict writable : memref<128xf32>
      %reinterpret_cast_26 = memref.reinterpret_cast %arg5 to offset: [%70], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_27 = memref.reinterpret_cast %arg10 to offset: [%70], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_28 = memref.reinterpret_cast %arg14 to offset: [%70], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %subview_29 = memref.subview %reinterpret_cast_26[0, 0] [%61, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %cast_30 = memref.cast %subview_29 : memref<?x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
      %alloc_31 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_32 = memref.subview %alloc_31[0, %67, %68, 0] [8, %66, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_33 = memref.cast %subview_32 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 25 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_30 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%cast_33 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %62 : i1
      hivm.hir.anchor {id = 26 : i64}
      %78 = bufferization.to_tensor %alloc_31 restrict writable : memref<8x4x16x16xbf16>
      %subview_34 = memref.subview %reinterpret_cast_27[0, 0] [%61, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %cast_35 = memref.cast %subview_34 : memref<?x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
      %alloc_36 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_37 = memref.subview %alloc_36[0, %67, %68, 0] [8, %66, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_38 = memref.cast %subview_37 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 27 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_35 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%cast_38 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %62 : i1
      hivm.hir.anchor {id = 28 : i64}
      %79 = bufferization.to_tensor %alloc_36 restrict writable : memref<8x4x16x16xbf16>
      %reinterpret_cast_39 = memref.reinterpret_cast %arg9 to offset: [%49], sizes: [128, 128], strides: [128, 1] : memref<?xf32> to memref<128x128xf32, strided<[128, 1], offset: ?>>
      %alloc_40 = memref.alloc() : memref<128x128xf32>
      hivm.hir.anchor {id = 29 : i64}
      hivm.hir.load ins(%reinterpret_cast_39 : memref<128x128xf32, strided<[128, 1], offset: ?>>) outs(%alloc_40 : memref<128x128xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 30 : i64}
      %80 = bufferization.to_tensor %alloc_40 restrict writable : memref<128x128xf32>
      %81 = tensor.empty() : tensor<128x128xf32>
      hivm.hir.anchor {id = 31 : i64}
      %82 = hivm.hir.vtranspose ins(%80 : tensor<128x128xf32>) outs(%81 : tensor<128x128xf32>) permutation = [1, 0] -> tensor<128x128xf32>
      hivm.hir.anchor {id = 32 : i64}
      %reinterpret_cast_41 = memref.reinterpret_cast %arg11 to offset: [%49], sizes: [128, 128], strides: [128, 1] : memref<?xf32> to memref<128x128xf32, strided<[128, 1], offset: ?>>
      %alloc_42 = memref.alloc() : memref<128x128xf32>
      hivm.hir.anchor {id = 33 : i64}
      hivm.hir.load ins(%reinterpret_cast_41 : memref<128x128xf32, strided<[128, 1], offset: ?>>) outs(%alloc_42 : memref<128x128xf32>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 34 : i64}
      %83 = bufferization.to_tensor %alloc_42 restrict writable : memref<128x128xf32>
      hivm.hir.anchor {id = 35 : i64}
      %84 = hivm.hir.vtranspose ins(%83 : tensor<128x128xf32>) outs(%81 : tensor<128x128xf32>) permutation = [1, 0] -> tensor<128x128xf32>
      hivm.hir.anchor {id = 36 : i64}
      %subview_43 = memref.subview %reinterpret_cast_28[0, 0] [%61, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %cast_44 = memref.cast %subview_43 : memref<?x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
      %alloc_45 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_46 = memref.subview %alloc_45[0, %67, %68, 0] [8, %66, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_47 = memref.cast %subview_46 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 37 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_44 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%cast_47 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %62 : i1
      hivm.hir.anchor {id = 38 : i64}
      %85 = bufferization.to_tensor %alloc_45 restrict writable : memref<8x4x16x16xbf16>
      hivm.hir.anchor {id = 39 : i64}
      %86 = hivm.hir.vmul ins(%82, %84 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%81 : tensor<128x128xf32>) -> tensor<128x128xf32>
      hivm.hir.anchor {id = 40 : i64}
      %expanded = tensor.expand_shape %10 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
      %87 = hivm.hir.vreduce <sum> ins(%86 : tensor<128x128xf32>) outs(%expanded : tensor<1x128xf32>) reduce_dims = [0] -> tensor<1x128xf32>
      hivm.hir.anchor {id = 41 : i64}
      %collapsed = tensor.collapse_shape %87 [[0, 1]] : tensor<1x128xf32> into tensor<128xf32>
      %88 = tensor.empty() : tensor<128x128xbf16>
      %89 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%82 : tensor<128x128xf32>) outs(%88 : tensor<128x128xbf16>) -> tensor<128x128xbf16>
      hivm.hir.anchor {id = 42 : i64}
      %expanded_48 = tensor.expand_shape %89 [[0], [1, 2]] output_shape [128, 8, 16] : tensor<128x128xbf16> into tensor<128x8x16xbf16>
      %90 = tensor.empty() : tensor<8x128x16xbf16>
      %91 = hivm.hir.vtranspose ins(%expanded_48 : tensor<128x8x16xbf16>) outs(%90 : tensor<8x128x16xbf16>) permutation = [1, 0, 2] -> tensor<8x128x16xbf16>
      hivm.hir.anchor {id = 43 : i64}
      %expanded_49 = tensor.expand_shape %91 [[0], [1, 2], [3]] output_shape [8, 8, 16, 16] : tensor<8x128x16xbf16> into tensor<8x8x16x16xbf16>
      %alloc_50 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_50 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %92 = bufferization.to_tensor %alloc_50 restrict writable : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      hivm.hir.anchor {id = 44 : i64}
      hivm.hir.copy ins(%expanded_49 : tensor<8x8x16x16xbf16>) outs(%alloc_50 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 45 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %93 = tensor.empty() : tensor<8x4x16x16xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %94 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%79, %92, %true, %c64, %c128, %c128 : tensor<8x4x16x16xbf16>, tensor<8x8x16x16xbf16>, i1, index, index, index) outs(%93 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 46 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %alloc_51 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_51 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast = memref.memory_space_cast %alloc_51 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %95 = bufferization.to_tensor %memspacecast restrict writable : memref<64x128xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
      hivm.hir.anchor {id = 47 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%94 : tensor<8x4x16x16xf32>) outs(%alloc_51 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 48 : i64}
      %96 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%84 : tensor<128x128xf32>) outs(%88 : tensor<128x128xbf16>) -> tensor<128x128xbf16>
      hivm.hir.anchor {id = 49 : i64}
      %expanded_52 = tensor.expand_shape %96 [[0], [1, 2]] output_shape [128, 8, 16] : tensor<128x128xbf16> into tensor<128x8x16xbf16>
      %97 = hivm.hir.vtranspose ins(%expanded_52 : tensor<128x8x16xbf16>) outs(%90 : tensor<8x128x16xbf16>) permutation = [1, 0, 2] -> tensor<8x128x16xbf16>
      hivm.hir.anchor {id = 50 : i64}
      %expanded_53 = tensor.expand_shape %97 [[0], [1, 2], [3]] output_shape [8, 8, 16, 16] : tensor<8x128x16xbf16> into tensor<8x8x16x16xbf16>
      %alloc_54 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_54 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %98 = bufferization.to_tensor %alloc_54 restrict writable : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      hivm.hir.anchor {id = 51 : i64}
      hivm.hir.copy ins(%expanded_53 : tensor<8x8x16x16xbf16>) outs(%alloc_54 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 52 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %99 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%78, %98, %true, %c64, %c128, %c128 : tensor<8x4x16x16xbf16>, tensor<8x8x16x16xbf16>, i1, index, index, index) outs(%93 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 53 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      %alloc_55 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_55 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_56 = memref.memory_space_cast %alloc_55 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %100 = bufferization.to_tensor %memspacecast_56 restrict writable : memref<64x128xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 54 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%99 : tensor<8x4x16x16xf32>) outs(%alloc_55 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 55 : i64}
      %alloc_57 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_57 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %101 = bufferization.to_tensor %alloc_57 restrict writable : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      hivm.hir.anchor {id = 56 : i64}
      hivm.hir.copy ins(%expanded_49 : tensor<8x8x16x16xbf16>) outs(%alloc_57 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 57 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %102 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%85, %101, %true, %c64, %c128, %c128 : tensor<8x4x16x16xbf16>, tensor<8x8x16x16xbf16>, i1, index, index, index) outs(%93 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 58 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      %alloc_58 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_58 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_59 = memref.memory_space_cast %alloc_58 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %103 = bufferization.to_tensor %memspacecast_59 restrict writable : memref<64x128xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 59 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%102 : tensor<8x4x16x16xf32>) outs(%alloc_58 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 60 : i64}
      %reinterpret_cast_60 = memref.reinterpret_cast %arg4 to offset: [%70], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_61 = memref.reinterpret_cast %arg15 to offset: [%70], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %alloc_62 = memref.alloc() : memref<64x128xbf16>
      %subview_63 = memref.subview %reinterpret_cast_60[0, 0] [%61, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %cast_64 = memref.cast %subview_63 : memref<?x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
      %subview_65 = memref.subview %alloc_62[%60, 0] [%61, 128] [1, 1] : memref<64x128xbf16> to memref<?x128xbf16, strided<[128, 1], offset: ?>>
      %alloc_66 = memref.alloc() : memref<8x4x16x16xbf16>
      %subview_67 = memref.subview %alloc_66[0, %67, %68, 0] [8, %66, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      %cast_68 = memref.cast %subview_67 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>
      hivm.hir.anchor {id = 61 : i64}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_64 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%cast_68 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>>) init_out_buffer = true pad_value = %cst_0 : bf16 init_condition = %62 : i1
      hivm.hir.anchor {id = 62 : i64}
      %104 = bufferization.to_tensor %alloc_66 restrict writable : memref<8x4x16x16xbf16>
      hivm.hir.anchor {id = 63 : i64}
      hivm.hir.load ins(%subview_63 : memref<?x128xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_65 : memref<?x128xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 init_out_buffer = true init_condition = %62 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 64 : i64}
      %105 = bufferization.to_tensor %alloc_62 restrict writable : memref<64x128xbf16>
      %106 = tensor.empty() : tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 65 : i64}
      %107 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, hivm.remain_in_l0c, normalized_in_L0C} ins(%85, %104, %true, %c64, %c128, %c64 : tensor<8x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%106 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 66 : i64}
      %108 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%69, %85, %true, %c64, %c64, %c128 : tensor<4x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%93 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 67 : i64}
      %alloc_69 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_69 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_70 = memref.memory_space_cast %alloc_69 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %109 = bufferization.to_tensor %memspacecast_70 restrict writable : memref<64x128xf32>
      hivm.hir.anchor {id = 68 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%108 : tensor<8x4x16x16xf32>) outs(%alloc_69 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 69 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %expanded_71 = tensor.expand_shape %64 [[0, 1]] output_shape [64, 1] : tensor<64xf32> into tensor<64x1xf32>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %110 = hivm.hir.vmul ins(%109, %expanded_71 : tensor<64x128xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 70 : i64}
      %111 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%105 : tensor<64x128xbf16>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 71 : i64}
      %112 = hivm.hir.vmul ins(%109, %111 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 72 : i64}
      %expanded_72 = tensor.expand_shape %12 [[0, 1]] output_shape [64, 1] : tensor<64xf32> into tensor<64x1xf32>
      %113 = hivm.hir.vreduce <sum> ins(%112 : tensor<64x128xf32>) outs(%expanded_72 : tensor<64x1xf32>) reduce_dims = [1] -> tensor<64x1xf32>
      hivm.hir.anchor {id = 73 : i64}
      %collapsed_73 = tensor.collapse_shape %113 [[0, 1]] : tensor<64x1xf32> into tensor<64xf32>
      %114 = tensor.empty() : tensor<64x128xbf16>
      %115 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%110 : tensor<64x128xf32>) outs(%114 : tensor<64x128xbf16>) -> tensor<64x128xbf16>
      hivm.hir.anchor {id = 74 : i64}
      %extracted_slice = tensor.extract_slice %115[%60, 0] [%61, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xbf16> to tensor<?x128xbf16>
      hivm.hir.anchor {id = 75 : i64}
      %subview_74 = memref.subview %reinterpret_cast_61[0, 0] [%61, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice : tensor<?x128xbf16>) outs(%subview_74 : memref<?x128xbf16, strided<[4096, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 76 : i64}
      %116 = hivm.hir.vmul ins(%72, %cst_2 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 77 : i64}
      %117 = hivm.hir.vexp ins(%116 : tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 78 : i64}
      %118 = hivm.hir.vmul ins(%117, %expanded_71 : tensor<64x128xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 79 : i64}
      %119 = hivm.hir.vmul ins(%77, %cst_2 : tensor<128xf32>, f32) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 80 : i64}
      %120 = hivm.hir.vexp ins(%119 : tensor<128xf32>) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 81 : i64}
      %121 = hivm.hir.vmul ins(%collapsed, %120 : tensor<128xf32>, tensor<128xf32>) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 82 : i64}
      %122 = hivm.hir.vmul ins(%95, %117 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 83 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
      %123 = hivm.hir.vmul ins(%122, %arg21 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 84 : i64}
      %expanded_75 = tensor.expand_shape %77 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
      %124 = hivm.hir.vsub ins(%expanded_75, %72 : tensor<1x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [0] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 85 : i64}
      %125 = hivm.hir.vmul ins(%124, %cst_2 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 86 : i64}
      %126 = hivm.hir.vexp ins(%125 : tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 87 : i64}
      %127 = arith.index_cast %28 : i32 to index
      %128 = affine.apply #map8()[%127]
      %129 = arith.maxsi %127, %53 : index
      %130 = arith.minsi %128, %129 : index
      %131 = affine.apply #map2()[%130, %127]
      %extracted_slice_76 = tensor.extract_slice %126[0, 0] [%131, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 88 : i64}
      %inserted_slice = tensor.insert_slice %extracted_slice_76 into %8[0, 0] [%131, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<?x128xf32> into tensor<64x128xf32>
      hivm.hir.anchor {id = 89 : i64}
      %132 = hivm.hir.vmul ins(%100, %inserted_slice : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 90 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
      %133 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%71 : tensor<64x128xbf16>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 91 : i64}
      %134 = hivm.hir.vmul ins(%133, %117 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 92 : i64}
      %135 = hivm.hir.vmul ins(%103, %cst_5 : tensor<64x128xf32>, f32) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 93 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
      %136 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%135 : tensor<64x128xf32>) outs(%114 : tensor<64x128xbf16>) -> tensor<64x128xbf16>
      hivm.hir.anchor {id = 94 : i64}
      %137 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%134 : tensor<64x128xf32>) outs(%114 : tensor<64x128xbf16>) -> tensor<64x128xbf16>
      hivm.hir.anchor {id = 95 : i64}
      %expanded_77 = tensor.expand_shape %136 [[0], [1, 2]] output_shape [64, 8, 16] : tensor<64x128xbf16> into tensor<64x8x16xbf16>
      %138 = tensor.empty() : tensor<8x64x16xbf16>
      %139 = hivm.hir.vtranspose ins(%expanded_77 : tensor<64x8x16xbf16>) outs(%138 : tensor<8x64x16xbf16>) permutation = [1, 0, 2] -> tensor<8x64x16xbf16>
      hivm.hir.anchor {id = 96 : i64}
      %expanded_78 = tensor.expand_shape %139 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : tensor<8x64x16xbf16> into tensor<8x4x16x16xbf16>
      %alloc_79 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_79 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %140 = bufferization.to_tensor %alloc_79 restrict writable : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      hivm.hir.anchor {id = 97 : i64}
      hivm.hir.copy ins(%expanded_78 : tensor<8x4x16x16xbf16>) outs(%alloc_79 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 98 : i64}
      %expanded_80 = tensor.expand_shape %137 [[0], [1, 2]] output_shape [64, 8, 16] : tensor<64x128xbf16> into tensor<64x8x16xbf16>
      %141 = hivm.hir.vtranspose ins(%expanded_80 : tensor<64x8x16xbf16>) outs(%138 : tensor<8x64x16xbf16>) permutation = [1, 0, 2] -> tensor<8x64x16xbf16>
      hivm.hir.anchor {id = 99 : i64}
      %expanded_81 = tensor.expand_shape %141 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : tensor<8x64x16xbf16> into tensor<8x4x16x16xbf16>
      %alloc_82 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_82 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %142 = bufferization.to_tensor %alloc_82 restrict writable : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 100 : i64}
      hivm.hir.copy ins(%expanded_81 : tensor<8x4x16x16xbf16>) outs(%alloc_82 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 101 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %143 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%140, %142, %false, %c64, %c128, %c64 : tensor<8x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%107 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 102 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      %alloc_83 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_83 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast_84 = memref.memory_space_cast %alloc_83 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %144 = bufferization.to_tensor %memspacecast_84 restrict writable : memref<64x64xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 103 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%143 : tensor<4x4x16x16xf32>) outs(%alloc_83 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 104 : i64}
      %alloc_85 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_85 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %145 = bufferization.to_tensor %alloc_85 restrict writable : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      hivm.hir.anchor {id = 105 : i64}
      hivm.hir.copy ins(%expanded_78 : tensor<8x4x16x16xbf16>) outs(%alloc_85 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 106 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %146 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%69, %145, %true, %c64, %c64, %c128 : tensor<4x4x16x16xbf16>, tensor<8x4x16x16xbf16>, i1, index, index, index) outs(%93 : tensor<8x4x16x16xf32>) -> tensor<8x4x16x16xf32>
      hivm.hir.anchor {id = 107 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      %alloc_86 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_86 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>} : memref<64x128xf32, #hivm.address_space<ub>>
      %memspacecast_87 = memref.memory_space_cast %alloc_86 : memref<64x128xf32, #hivm.address_space<ub>> to memref<64x128xf32>
      %147 = bufferization.to_tensor %memspacecast_87 restrict writable : memref<64x128xf32>
      hivm.hir.anchor {id = 108 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%146 : tensor<8x4x16x16xf32>) outs(%alloc_86 : memref<64x128xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 109 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %148 = hivm.hir.vmul ins(%147, %134 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 110 : i64}
      %149 = hivm.hir.vreduce <sum> ins(%148 : tensor<64x128xf32>) outs(%expanded_72 : tensor<64x1xf32>) reduce_dims = [1] -> tensor<64x1xf32>
      hivm.hir.anchor {id = 111 : i64}
      %collapsed_88 = tensor.collapse_shape %149 [[0, 1]] : tensor<64x1xf32> into tensor<64xf32>
      %150 = hivm.hir.vadd ins(%collapsed_73, %collapsed_88 : tensor<64xf32>, tensor<64xf32>) outs(%11 : tensor<64xf32>) -> tensor<64xf32>
      hivm.hir.anchor {id = 112 : i64}
      %reinterpret_cast_89 = memref.reinterpret_cast %arg2 to offset: [%70], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
      %alloc_90 = memref.alloc() : memref<64x128xbf16>
      %subview_91 = memref.subview %reinterpret_cast_89[0, 0] [%61, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>>
      %subview_92 = memref.subview %alloc_90[%60, 0] [%61, 128] [1, 1] : memref<64x128xbf16> to memref<?x128xbf16, strided<[128, 1], offset: ?>>
      hivm.hir.anchor {id = 113 : i64}
      hivm.hir.load ins(%subview_91 : memref<?x128xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_92 : memref<?x128xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 init_out_buffer = true init_condition = %62 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 114 : i64}
      %151 = bufferization.to_tensor %alloc_90 restrict writable : memref<64x128xbf16>
      hivm.hir.anchor {id = 115 : i64}
      %152 = hivm.hir.vmul ins(%133, %132 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 116 : i64}
      %153 = hivm.hir.vreduce <sum> ins(%152 : tensor<64x128xf32>) outs(%expanded : tensor<1x128xf32>) reduce_dims = [0] -> tensor<1x128xf32>
      hivm.hir.anchor {id = 117 : i64}
      %collapsed_93 = tensor.collapse_shape %153 [[0, 1]] : tensor<1x128xf32> into tensor<128xf32>
      %154 = hivm.hir.vadd ins(%121, %collapsed_93 : tensor<128xf32>, tensor<128xf32>) outs(%9 : tensor<128xf32>) -> tensor<128xf32>
      hivm.hir.anchor {id = 118 : i64}
      %155 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%151 : tensor<64x128xbf16>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 119 : i64}
      %156 = hivm.hir.vmul ins(%155, %123 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 120 : i64}
      %157 = hivm.hir.vsub ins(%156, %152 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 121 : i64}
      %expanded_94 = tensor.expand_shape %37 [[0, 1]] output_shape [64, 1] : tensor<64xi1> into tensor<64x1xi1>
      %158 = tensor.empty() : tensor<64x1xf32>
      %159 = hivm.hir.vsel ins(%expanded_94, %cst_1, %cst : tensor<64x1xi1>, f32, f32) outs(%158 : tensor<64x1xf32>) -> tensor<64x1xf32>
      hivm.hir.anchor {id = 122 : i64}
      %expanded_95 = tensor.expand_shape %154 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
      %160 = hivm.hir.vmul ins(%159, %expanded_95 : tensor<64x1xf32>, tensor<1x128xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [0, 1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 123 : i64}
      %161 = hivm.hir.vadd ins(%157, %160 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 124 : i64}
      %162 = hivm.hir.vmul ins(%148, %expanded_71 : tensor<64x128xf32>, tensor<64x1xf32>) outs(%7 : tensor<64x128xf32>) broadcast = [1] -> tensor<64x128xf32>
      hivm.hir.anchor {id = 125 : i64}
      %163 = hivm.hir.vadd ins(%161, %162 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 126 : i64}
      %164 = hivm.hir.vmul ins(%147, %118 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 127 : i64}
      %165 = hivm.hir.vadd ins(%132, %164 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%7 : tensor<64x128xf32>) -> tensor<64x128xf32>
      hivm.hir.anchor {id = 128 : i64}
      %reinterpret_cast_96 = memref.reinterpret_cast %arg12 to offset: [%70], sizes: [64, 128], strides: [4096, 1] : memref<?xf32> to memref<64x128xf32, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_97 = memref.reinterpret_cast %arg13 to offset: [%70], sizes: [64, 128], strides: [4096, 1] : memref<?xf32> to memref<64x128xf32, strided<[4096, 1], offset: ?>>
      %reinterpret_cast_98 = memref.reinterpret_cast %arg16 to offset: [%70], sizes: [64, 128], strides: [4096, 1] : memref<?xf32> to memref<64x128xf32, strided<[4096, 1], offset: ?>>
      %extracted_slice_99 = tensor.extract_slice %123[%60, 0] [%61, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 129 : i64}
      %subview_100 = memref.subview %reinterpret_cast_96[0, 0] [%61, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>> to memref<?x128xf32, strided<[4096, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_99 : tensor<?x128xf32>) outs(%subview_100 : memref<?x128xf32, strided<[4096, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 130 : i64}
      %extracted_slice_101 = tensor.extract_slice %165[%60, 0] [%61, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 131 : i64}
      %subview_102 = memref.subview %reinterpret_cast_97[0, 0] [%61, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>> to memref<?x128xf32, strided<[4096, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_101 : tensor<?x128xf32>) outs(%subview_102 : memref<?x128xf32, strided<[4096, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 132 : i64}
      %extracted_slice_103 = tensor.extract_slice %163[%60, 0] [%61, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x128xf32> to tensor<?x128xf32>
      hivm.hir.anchor {id = 133 : i64}
      %subview_104 = memref.subview %reinterpret_cast_98[0, 0] [%61, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>> to memref<?x128xf32, strided<[4096, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_103 : tensor<?x128xf32>) outs(%subview_104 : memref<?x128xf32, strided<[4096, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 134 : i64}
      %expanded_105 = tensor.expand_shape %31 [[0, 1]] output_shape [64, 1] : tensor<64xi32> into tensor<64x1xi32>
      %166 = tensor.empty() : tensor<64x64xi32>
      %167 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_105 : tensor<64x1xi32>) outs(%166 : tensor<64x64xi32>) broadcast_dims = [1] -> tensor<64x64xi32>
      hivm.hir.anchor {id = 135 : i64}
      %expanded_106 = tensor.expand_shape %31 [[0, 1]] output_shape [1, 64] : tensor<64xi32> into tensor<1x64xi32>
      %168 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_106 : tensor<1x64xi32>) outs(%166 : tensor<64x64xi32>) broadcast_dims = [0] -> tensor<64x64xi32>
      hivm.hir.anchor {id = 136 : i64}
      %169 = tensor.empty() : tensor<64x64xi1>
      %170 = hivm.hir.vcmp ins(%167, %168 : tensor<64x64xi32>, tensor<64x64xi32>) outs(%169 : tensor<64x64xi1>) compare_mode = <gt> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 137 : i64}
      %171 = tensor.empty() : tensor<64xf16>
      %172 = hivm.hir.vsel ins(%33, %cst_4, %cst_3 : tensor<64xi1>, f16, f16) outs(%171 : tensor<64xf16>) -> tensor<64xf16>
      hivm.hir.anchor {id = 138 : i64}
      %expanded_107 = tensor.expand_shape %172 [[0, 1]] output_shape [64, 1] : tensor<64xf16> into tensor<64x1xf16>
      %173 = tensor.empty() : tensor<64x64xf16>
      %174 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_107 : tensor<64x1xf16>) outs(%173 : tensor<64x64xf16>) broadcast_dims = [1] -> tensor<64x64xf16>
      hivm.hir.anchor {id = 139 : i64}
      %175 = hivm.hir.vcmp ins(%174, %cst_3 : tensor<64x64xf16>, f16) outs(%169 : tensor<64x64xi1>) compare_mode = <ne> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 140 : i64}
      %expanded_108 = tensor.expand_shape %172 [[0, 1]] output_shape [1, 64] : tensor<64xf16> into tensor<1x64xf16>
      %176 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_108 : tensor<1x64xf16>) outs(%173 : tensor<64x64xf16>) broadcast_dims = [0] -> tensor<64x64xf16>
      hivm.hir.anchor {id = 141 : i64}
      %177 = hivm.hir.vcmp ins(%176, %cst_3 : tensor<64x64xf16>, f16) outs(%169 : tensor<64x64xi1>) compare_mode = <ne> -> tensor<64x64xi1>
      hivm.hir.anchor {id = 142 : i64}
      %178 = hivm.hir.vand ins(%175, %177 : tensor<64x64xi1>, tensor<64x64xi1>) outs(%169 : tensor<64x64xi1>) -> tensor<64x64xi1>
      hivm.hir.anchor {id = 143 : i64}
      %179 = hivm.hir.vand ins(%170, %178 : tensor<64x64xi1>, tensor<64x64xi1>) outs(%169 : tensor<64x64xi1>) -> tensor<64x64xi1>
      hivm.hir.anchor {id = 144 : i64}
      %expanded_109 = tensor.expand_shape %64 [[0, 1]] output_shape [1, 64] : tensor<64xf32> into tensor<1x64xf32>
      %180 = tensor.empty() : tensor<64x64xf32>
      %181 = hivm.hir.vmul ins(%144, %expanded_109 : tensor<64x64xf32>, tensor<1x64xf32>) outs(%180 : tensor<64x64xf32>) broadcast = [0] -> tensor<64x64xf32>
      hivm.hir.anchor {id = 145 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
      %182 = hivm.hir.vsel ins(%179, %181, %cst : tensor<64x64xi1>, tensor<64x64xf32>, f32) outs(%180 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 146 : i64}
      %183 = tensor.empty() : tensor<64x64xbf16>
      %184 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%182 : tensor<64x64xf32>) outs(%183 : tensor<64x64xbf16>) -> tensor<64x64xbf16>
      hivm.hir.anchor {id = 147 : i64}
      %expanded_110 = tensor.expand_shape %184 [[0], [1, 2]] output_shape [64, 4, 16] : tensor<64x64xbf16> into tensor<64x4x16xbf16>
      %185 = tensor.empty() : tensor<4x64x16xbf16>
      %186 = hivm.hir.vtranspose ins(%expanded_110 : tensor<64x4x16xbf16>) outs(%185 : tensor<4x64x16xbf16>) permutation = [1, 0, 2] -> tensor<4x64x16xbf16>
      hivm.hir.anchor {id = 148 : i64}
      %expanded_111 = tensor.expand_shape %186 [[0], [1, 2], [3]] output_shape [4, 4, 16, 16] : tensor<4x64x16xbf16> into tensor<4x4x16x16xbf16>
      %alloc_112 = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_112 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      %187 = bufferization.to_tensor %alloc_112 restrict writable : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      hivm.hir.anchor {id = 149 : i64}
      hivm.hir.copy ins(%expanded_111 : tensor<4x4x16x16xbf16>) outs(%alloc_112 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 150 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %188 = hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%187, %69, %true, %c64, %c64, %c64 : tensor<4x4x16x16xbf16>, tensor<4x4x16x16xbf16>, i1, index, index, index) outs(%106 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 151 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      %189 = tensor.empty() : tensor<4x4x16x16xbf16>
      %190 = hivm.hir.fixpipe {pre_quant = #hivm.fixpipe_pre_quant_mode<F322BF16>} ins(%188 : tensor<4x4x16x16xf32>) outs(%189 : tensor<4x4x16x16xbf16>) -> tensor<4x4x16x16xbf16>
      hivm.hir.anchor {id = 152 : i64}
      %191 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%69, %190, %true, %c64, %c64, %c64 : tensor<4x4x16x16xbf16>, tensor<4x4x16x16xbf16>, i1, index, index, index) outs(%106 : tensor<4x4x16x16xf32>) -> tensor<4x4x16x16xf32>
      hivm.hir.anchor {id = 153 : i64}
      %alloc_113 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_113 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>} : memref<64x64xf32, #hivm.address_space<ub>>
      %memspacecast_114 = memref.memory_space_cast %alloc_113 : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
      %192 = bufferization.to_tensor %memspacecast_114 restrict writable : memref<64x64xf32>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.anchor {id = 154 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%191 : tensor<4x4x16x16xf32>) outs(%alloc_113 : memref<64x64xf32, #hivm.address_space<ub>>)
      hivm.hir.anchor {id = 155 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %193 = hivm.hir.vmul ins(%192, %cst_5 : tensor<64x64xf32>, f32) outs(%180 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 156 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
      %194 = hivm.hir.vsel ins(%179, %193, %cst : tensor<64x64xi1>, tensor<64x64xf32>, f32) outs(%180 : tensor<64x64xf32>) -> tensor<64x64xf32>
      hivm.hir.anchor {id = 157 : i64}
      %reinterpret_cast_115 = memref.reinterpret_cast %arg18 to offset: [%65], sizes: [64, 64], strides: [2048, 1] : memref<?xf32> to memref<64x64xf32, strided<[2048, 1], offset: ?>>
      %reinterpret_cast_116 = memref.reinterpret_cast %arg17 to offset: [%52], sizes: [64], strides: [32] : memref<?xf32> to memref<64xf32, strided<[32], offset: ?>>
      %extracted_slice_117 = tensor.extract_slice %194[%60, 0] [%61, 64] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64x64xf32> to tensor<?x64xf32>
      hivm.hir.anchor {id = 158 : i64}
      %subview_118 = memref.subview %reinterpret_cast_115[0, 0] [%61, 64] [1, 1] : memref<64x64xf32, strided<[2048, 1], offset: ?>> to memref<?x64xf32, strided<[2048, 1], offset: ?>>
      hivm.hir.store ins(%extracted_slice_117 : tensor<?x64xf32>) outs(%subview_118 : memref<?x64xf32, strided<[2048, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 159 : i64}
      %extracted_slice_119 = tensor.extract_slice %150[%60] [%61] [1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<64xf32> to tensor<?xf32>
      hivm.hir.anchor {id = 160 : i64}
      %subview_120 = memref.subview %reinterpret_cast_116[0] [%61] [1] : memref<64xf32, strided<[32], offset: ?>> to memref<?xf32, strided<[32], offset: ?>>
      hivm.hir.store ins(%extracted_slice_119 : tensor<?xf32>) outs(%subview_120 : memref<?xf32, strided<[32], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
      hivm.hir.anchor {id = 161 : i64}
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
    hivm.hir.anchor {id = 162 : i64}
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
      %5 = affine.apply #map9()[%arg18, %arg0]
      %subview = memref.subview %arg1[%5] [1] [1] : memref<64xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %6 = vector.transfer_read %subview[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map10} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
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
        %12 = vector.transfer_read %subview_8[%c0], %cst_3 {in_bounds = [true, true], permutation_map = #map11} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %13 = vector.transfer_read %subview_9[%c0], %cst_3 {in_bounds = [true, true], permutation_map = #map11} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg19: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg20: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg21: f32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<26xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
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
    %c2_i32 = arith.constant 2 : i32
    %c64_i32 = arith.constant 64 : i32
    hivm.hir.anchor {id = 0 : i64}
    %0 = arith.muli %arg23, %arg24 : i32
    %1 = arith.muli %0, %arg25 : i32
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
    scf.for %arg26 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %4 = arith.remsi %arg26, %arg23 : i32
      %5 = arith.divsi %arg26, %arg23 : i32
      %6 = arith.remsi %5, %arg24 : i32
      hivm.hir.anchor {id = 3 : i64}
      hivm.hir.anchor {id = 4 : i64}
      hivm.hir.anchor {id = 5 : i64}
      hivm.hir.anchor {id = 6 : i64}
      %7 = arith.remsi %6, %c32_i32 : i32
      %8 = arith.muli %4, %c2_i32 : i32
      %9 = arith.index_cast %8 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg20 to offset: [%9], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %10 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 7 : i64}
      %11 = arith.trunci %10 : i64 to i32
      %12 = affine.apply #map()[%9]
      %reinterpret_cast_0 = memref.reinterpret_cast %arg20 to offset: [%12], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %13 = memref.load %reinterpret_cast_0[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 8 : i64}
      %14 = arith.trunci %13 : i64 to i32
      %15 = arith.index_cast %11 : i32 to index
      %reinterpret_cast_1 = memref.reinterpret_cast %arg19 to offset: [%15], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %16 = memref.load %reinterpret_cast_1[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 9 : i64}
      %17 = affine.apply #map()[%15]
      %reinterpret_cast_2 = memref.reinterpret_cast %arg19 to offset: [%17], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %18 = memref.load %reinterpret_cast_2[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 10 : i64}
      %19 = arith.subi %18, %16 : i64
      %20 = arith.trunci %19 : i64 to i32
      %21 = arith.muli %14, %c64_i32 : i32
      hivm.hir.anchor {id = 11 : i64}
      hivm.hir.anchor {id = 12 : i64}
      hivm.hir.anchor {id = 13 : i64}
      hivm.hir.anchor {id = 14 : i64}
      %22 = arith.muli %16, %c32_i64 : i64
      %23 = arith.extsi %7 : i32 to i64
      %24 = arith.addi %22, %23 : i64
      %25 = arith.muli %24, %c128_i64 : i64
      %26 = arith.index_cast %25 : i64 to index
      %27 = arith.muli %24, %c64_i64 : i64
      %28 = arith.index_cast %27 : i64 to index
      %29 = arith.maxsi %21, %c0_i32 : i32
      %30 = arith.index_cast %29 : i32 to index
      %31 = arith.index_cast %20 : i32 to index
      %32 = affine.apply #map2()[%31, %30]
      %33 = arith.maxsi %32, %c0 : index
      %34 = arith.minsi %33, %c64 : index
      %35 = arith.subi %c0_i32, %21 : i32
      %36 = arith.maxsi %35, %c0_i32 : i32
      %37 = arith.index_cast %36 : i32 to index
      %38 = arith.minsi %37, %34 : index
      %39 = affine.apply #map2()[%34, %38]
      %40 = arith.cmpi slt, %39, %c64 : index
      hivm.hir.anchor {id = 15 : i64}
      hivm.hir.anchor {id = 16 : i64}
      %41 = affine.apply #map3()[%28, %30]
      %reinterpret_cast_3 = memref.reinterpret_cast %arg8 to offset: [%41], sizes: [64, 64], strides: [2048, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x64xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
      %subview = memref.subview %reinterpret_cast_3[0, 0] [%39, 64] [1, 1] : memref<64x64xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
      %cast = memref.cast %subview : memref<?x64xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
      %42 = affine.apply #map4()[%34, %38]
      %43 = affine.apply #map5()[%38]
      %44 = affine.apply #map6()[%38]
      %alloc = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_4 = memref.subview %alloc[0, %43, %44, 0] [4, %42, 16, 16] [1, 1, 1, 1] : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_5 = memref.cast %subview_4 : memref<4x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 17 : i64}
      scf.if %40 {
        %collapse_shape = memref.collapse_shape %alloc [[0, 1, 2, 3]] : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<4096xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<4096xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast : memref<?x?xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_5 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 18 : i64}
      %45 = affine.apply #map7()[%26, %30]
      hivm.hir.anchor {id = 19 : i64}
      hivm.hir.anchor {id = 20 : i64}
      hivm.hir.anchor {id = 21 : i64}
      hivm.hir.anchor {id = 22 : i64}
      hivm.hir.anchor {id = 23 : i64}
      hivm.hir.anchor {id = 24 : i64}
      %reinterpret_cast_6 = memref.reinterpret_cast %arg5 to offset: [%45], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_7 = memref.reinterpret_cast %arg10 to offset: [%45], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_8 = memref.reinterpret_cast %arg14 to offset: [%45], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_9 = memref.subview %reinterpret_cast_6[0, 0] [%39, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_10 = memref.cast %subview_9 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_11 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_11 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_12 = memref.subview %alloc_11[0, %43, %44, 0] [8, %42, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_13 = memref.cast %subview_12 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 25 : i64}
      scf.if %40 {
        %collapse_shape = memref.collapse_shape %alloc_11 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_10 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_13 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 26 : i64}
      %subview_14 = memref.subview %reinterpret_cast_7[0, 0] [%39, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_15 = memref.cast %subview_14 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_16 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_16 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_17 = memref.subview %alloc_16[0, %43, %44, 0] [8, %42, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_18 = memref.cast %subview_17 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 27 : i64}
      scf.if %40 {
        %collapse_shape = memref.collapse_shape %alloc_16 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_15 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_18 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 28 : i64}
      hivm.hir.anchor {id = 29 : i64}
      hivm.hir.anchor {id = 30 : i64}
      hivm.hir.anchor {id = 31 : i64}
      hivm.hir.anchor {id = 32 : i64}
      hivm.hir.anchor {id = 33 : i64}
      hivm.hir.anchor {id = 34 : i64}
      hivm.hir.anchor {id = 35 : i64}
      hivm.hir.anchor {id = 36 : i64}
      %subview_19 = memref.subview %reinterpret_cast_8[0, 0] [%39, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_20 = memref.cast %subview_19 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_21 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_22 = memref.subview %alloc_21[0, %43, %44, 0] [8, %42, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_23 = memref.cast %subview_22 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 37 : i64}
      scf.if %40 {
        %collapse_shape = memref.collapse_shape %alloc_21 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_20 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_23 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 38 : i64}
      hivm.hir.anchor {id = 39 : i64}
      hivm.hir.anchor {id = 40 : i64}
      hivm.hir.anchor {id = 41 : i64}
      hivm.hir.anchor {id = 42 : i64}
      hivm.hir.anchor {id = 43 : i64}
      %alloc_24 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_24 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 44 : i64}
      hivm.hir.anchor {id = 45 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_25 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_25 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_16, %alloc_24, %true, %c64, %c128, %c128 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_25 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 46 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      %alloc_26 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_26 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
      hivm.hir.anchor {id = 47 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_25 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_26 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 48 : i64}
      hivm.hir.anchor {id = 49 : i64}
      hivm.hir.anchor {id = 50 : i64}
      %alloc_27 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_27 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 51 : i64}
      hivm.hir.anchor {id = 52 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_28 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_28 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_11, %alloc_27, %true, %c64, %c128, %c128 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_28 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 53 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      %alloc_29 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_29 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 54 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_28 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_29 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 55 : i64}
      %alloc_30 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_30 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 56 : i64}
      hivm.hir.anchor {id = 57 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_31 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_31 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_21, %alloc_30, %true, %c64, %c128, %c128 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_31 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 58 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      %alloc_32 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_32 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 59 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_31 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_32 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 60 : i64}
      %reinterpret_cast_33 = memref.reinterpret_cast %arg4 to offset: [%45], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_34 = memref.subview %reinterpret_cast_33[0, 0] [%39, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %cast_35 = memref.cast %subview_34 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_36 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_36 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_37 = memref.subview %alloc_36[0, %43, %44, 0] [8, %42, 16, 16] [1, 1, 1, 1] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_38 = memref.cast %subview_37 : memref<8x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 61 : i64}
      scf.if %40 {
        %collapse_shape = memref.collapse_shape %alloc_36 [[0, 1, 2, 3]] : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> into memref<8192xbf16, #hivm.address_space<cbuf>>
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<8192xbf16, #hivm.address_space<cbuf>>)
      } {hivm.unlikely_condition}
      hivm.hir.nd2nz {dst_continuous} ins(%cast_35 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_38 : memref<?x?x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 62 : i64}
      hivm.hir.anchor {id = 63 : i64}
      hivm.hir.anchor {id = 64 : i64}
      hivm.hir.anchor {id = 65 : i64}
      %alloc_39 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_39 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, hivm.remain_in_l0c, normalized_in_L0C} ins(%alloc_21, %alloc_36, %true, %c64, %c128, %c64 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_39 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 66 : i64}
      %alloc_40 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_40 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_21, %true, %c64, %c64, %c128 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_40 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 67 : i64}
      %alloc_41 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_41 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 68 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_40 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_41 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 69 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
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
      hivm.hir.anchor {id = 89 : i64}
      hivm.hir.anchor {id = 90 : i64}
      hivm.hir.anchor {id = 91 : i64}
      hivm.hir.anchor {id = 92 : i64}
      hivm.hir.anchor {id = 93 : i64}
      hivm.hir.anchor {id = 94 : i64}
      hivm.hir.anchor {id = 95 : i64}
      hivm.hir.anchor {id = 96 : i64}
      %alloc_42 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_42 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = -1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 97 : i64}
      hivm.hir.anchor {id = 98 : i64}
      hivm.hir.anchor {id = 99 : i64}
      %alloc_43 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_43 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = -1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 100 : i64}
      hivm.hir.anchor {id = 101 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_42, %alloc_43, %false, %c64, %c128, %c64 : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_39 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 102 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      %alloc_44 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_44 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 103 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_39 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_44 : memref<64x32xf32, #hivm.address_space<ub>>) dual_dst_mode = <COLUMN_SPLIT>
      hivm.hir.anchor {id = 104 : i64}
      %alloc_45 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_45 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = -1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 105 : i64}
      hivm.hir.anchor {id = 106 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_46 = memref.alloc() {alignment = 64 : i64} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_46 {hivm.multi_buffer = 2 : i32} : memref<8x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_45, %true, %c64, %c64, %c128 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_46 : memref<8x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 107 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      %alloc_47 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_47 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 108 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_46 : memref<8x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_47 : memref<32x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
      hivm.hir.anchor {id = 109 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
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
      hivm.hir.anchor {id = 141 : i64}
      hivm.hir.anchor {id = 142 : i64}
      hivm.hir.anchor {id = 143 : i64}
      hivm.hir.anchor {id = 144 : i64}
      hivm.hir.anchor {id = 145 : i64}
      hivm.hir.anchor {id = 146 : i64}
      hivm.hir.anchor {id = 147 : i64}
      hivm.hir.anchor {id = 148 : i64}
      %alloc_48 = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_48 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = -1 : index} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 149 : i64}
      hivm.hir.anchor {id = 150 : i64}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      %alloc_49 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_49 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_48, %alloc, %true, %c64, %c64, %c64 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_49 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 151 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      %alloc_50 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.fixpipe {pre_quant = #hivm.fixpipe_pre_quant_mode<F322BF16>} ins(%alloc_49 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_50 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>)
      hivm.hir.anchor {id = 152 : i64}
      %alloc_51 = memref.alloc() {alignment = 64 : i64} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      annotation.mark %alloc_51 {hivm.multi_buffer = 2 : i32} : memref<4x4x16x16xf32, #hivm.address_space<cc>>
      hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc, %alloc_50, %true, %c64, %c64, %c64 : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_51 : memref<4x4x16x16xf32, #hivm.address_space<cc>>)
      hivm.hir.anchor {id = 153 : i64}
      %alloc_52 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_52 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.anchor {id = 154 : i64}
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_51 : memref<4x4x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_52 : memref<64x32xf32, #hivm.address_space<ub>>) dual_dst_mode = <COLUMN_SPLIT>
      hivm.hir.anchor {id = 155 : i64}
      hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 156 : i64}
      hivm.hir.anchor {id = 157 : i64}
      hivm.hir.anchor {id = 158 : i64}
      hivm.hir.anchor {id = 159 : i64}
      hivm.hir.anchor {id = 160 : i64}
      hivm.hir.anchor {id = 161 : i64}
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.anchor {id = 162 : i64}
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
        %1 = affine.apply #map12()[%arg3]
        %subview_0 = memref.subview %arg0[%1, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = affine.apply #map13()[%arg3]
        %subview_1 = memref.subview %arg0[%3, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = affine.apply #map14()[%arg3]
        %subview_2 = memref.subview %arg0[%5, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %6 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = affine.apply #map15()[%arg3]
        %subview_3 = memref.subview %arg0[%7, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %8 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %9 = affine.apply #map16()[%arg3]
        %subview_4 = memref.subview %arg0[%9, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = affine.apply #map17()[%arg3]
        %subview_5 = memref.subview %arg0[%11, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %12 = vector.transfer_read %subview_5[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %13 = affine.apply #map18()[%arg3]
        %subview_6 = memref.subview %arg0[%13, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %14 = vector.transfer_read %subview_6[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %15 = affine.apply #map19()[%arg3]
        %subview_7 = memref.subview %arg0[%15, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %16 = vector.transfer_read %subview_7[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %17 = affine.apply #map20()[%arg3]
        %subview_8 = memref.subview %arg0[%17, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %18 = vector.transfer_read %subview_8[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %19 = affine.apply #map21()[%arg3]
        %subview_9 = memref.subview %arg0[%19, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %20 = vector.transfer_read %subview_9[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %21 = affine.apply #map22()[%arg3]
        %subview_10 = memref.subview %arg0[%21, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %22 = vector.transfer_read %subview_10[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %23 = affine.apply #map23()[%arg3]
        %subview_11 = memref.subview %arg0[%23, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %24 = vector.transfer_read %subview_11[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %25 = affine.apply #map24()[%arg3]
        %subview_12 = memref.subview %arg0[%25, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %26 = vector.transfer_read %subview_12[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %27 = affine.apply #map25()[%arg3]
        %subview_13 = memref.subview %arg0[%27, %arg2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %28 = vector.transfer_read %subview_13[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %29 = affine.apply #map26()[%arg3]
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
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map10} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
        %0 = vector.transfer_read %subview[%c0], %cst_1 {in_bounds = [true, true], permutation_map = #map11} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
        %0 = affine.apply #map27(%arg3)
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
        %0 = affine.apply #map27(%arg3)
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
        %1 = affine.apply #map28()[%arg3]
        %subview_0 = memref.subview %arg0[%1, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = affine.apply #map12()[%arg3]
        %subview_1 = memref.subview %arg0[%3, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = affine.apply #map29()[%arg3]
        %subview_2 = memref.subview %arg0[%5, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %6 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = affine.apply #map13()[%arg3]
        %subview_3 = memref.subview %arg0[%7, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %8 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %9 = affine.apply #map30()[%arg3]
        %subview_4 = memref.subview %arg0[%9, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = affine.apply #map14()[%arg3]
        %subview_5 = memref.subview %arg0[%11, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %12 = vector.transfer_read %subview_5[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %13 = affine.apply #map31()[%arg3]
        %subview_6 = memref.subview %arg0[%13, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %14 = vector.transfer_read %subview_6[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %15 = affine.apply #map15()[%arg3]
        %subview_7 = memref.subview %arg0[%15, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %16 = vector.transfer_read %subview_7[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %17 = affine.apply #map32()[%arg3]
        %subview_8 = memref.subview %arg0[%17, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %18 = vector.transfer_read %subview_8[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %19 = affine.apply #map16()[%arg3]
        %subview_9 = memref.subview %arg0[%19, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %20 = vector.transfer_read %subview_9[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %21 = affine.apply #map33()[%arg3]
        %subview_10 = memref.subview %arg0[%21, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %22 = vector.transfer_read %subview_10[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %23 = affine.apply #map17()[%arg3]
        %subview_11 = memref.subview %arg0[%23, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %24 = vector.transfer_read %subview_11[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %25 = affine.apply #map34()[%arg3]
        %subview_12 = memref.subview %arg0[%25, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %26 = vector.transfer_read %subview_12[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %27 = affine.apply #map18()[%arg3]
        %subview_13 = memref.subview %arg0[%27, %arg2] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %28 = vector.transfer_read %subview_13[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %29 = affine.apply #map35()[%arg3]
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
    %1 = vector.transfer_read %subview_1[%c0], %c0_i32, %0 {in_bounds = [true, true], permutation_map = #map11} : memref<32xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
    %2 = vector.constant_mask [1, 32] : vector<1x64xi1>
    %3 = vector.transfer_read %subview[%c0], %cst, %0 {in_bounds = [true, true], permutation_map = #map11} : memref<32xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
    %4 = arith.cmpf une, %3, %cst_0 : vector<1x64xf16>
    scf.for %arg7 = %c0 to %c64 step %c1 {
      %subview_2 = memref.subview %arg6[%arg7, 0] [1, 32] [1, 1] : memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x32xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_3 = memref.subview %arg0[%arg7] [1] [1] : memref<64xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %5 = vector.transfer_read %subview_3[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map10} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %6 = arith.cmpi sgt, %5, %1 : vector<1x64xi32>
      %subview_4 = memref.subview %arg3[%arg7] [1] [1] : memref<64xf16, #hivm.address_space<ub>> to memref<1xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %7 = vector.transfer_read %subview_4[%c0], %cst {in_bounds = [true, true], permutation_map = #map10} : memref<1xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
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
    %2 = vector.transfer_read %arg1[%c0], %cst, %1 {in_bounds = [true, true], permutation_map = #map11} : memref<32xf32, #hivm.address_space<ub>>, vector<1x64xf32>
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
        %0 = affine.apply #map27(%arg3)
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
        %0 = affine.apply #map27(%arg3)
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
  func.func @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg15: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg16: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg17: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg18: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg19: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg20: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg21: f32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<26xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c8 = arith.constant 8 : index
    %c64_i32 = arith.constant 64 : i32
    %c2_i32 = arith.constant 2 : i32
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
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg23, %arg24 : i32
    %1 = arith.muli %0, %arg25 : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64xi32, #hivm.address_space<ub>>
    call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_merged_vf_0(%alloc, %alloc_1) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<128xf32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>) -> ()
    %4 = arith.index_cast %2 : i64 to index
    %5 = affine.apply #map36()[%4]
    %view = memref.view %arg1[%5][] : memref<?xi8, #hivm.address_space<gm>> to memref<2x128xf32, #hivm.address_space<gm>>
    %6 = affine.apply #map37()[%4]
    %view_2 = memref.view %arg1[%6][] : memref<?xi8, #hivm.address_space<gm>> to memref<2x128xf32, #hivm.address_space<gm>>
    %7 = hivm.hir.get_sub_block_idx -> i64
    %8 = arith.index_cast %7 : i64 to index
    %9 = affine.apply #map38()[%8]
    %10 = affine.apply #map39()[%8]
    %11 = affine.apply #map40()[%8]
    %12 = affine.apply #map41()[%8]
    hivm.hir.anchor {id = 0 : i64}
    annotation.mark %1 {logical_block_num} : i32
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.anchor {id = 1 : i64}
    %13 = affine.apply #map42()[%8]
    %subview = memref.subview %view[%8, 0] [1, 128] [1, 1] : memref<2x128xf32, #hivm.address_space<gm>> to memref<1x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
    %subview_3 = memref.subview %view_2[%8, 0] [1, 128] [1, 1] : memref<2x128xf32, #hivm.address_space<gm>> to memref<1x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>>
    scf.for %arg26 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %14 = arith.remsi %arg26, %arg23 : i32
      %15 = arith.divsi %arg26, %arg23 : i32
      %16 = arith.remsi %15, %arg24 : i32
      hivm.hir.anchor {id = 3 : i64}
      hivm.hir.anchor {id = 4 : i64}
      hivm.hir.anchor {id = 5 : i64}
      hivm.hir.anchor {id = 6 : i64}
      %17 = arith.remsi %16, %c32_i32 : i32
      %18 = arith.extsi %14 : i32 to i64
      %19 = arith.muli %14, %c2_i32 : i32
      %20 = arith.index_cast %19 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg20 to offset: [%20], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %21 = affine.apply #map()[%20]
      %22 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 7 : i64}
      %23 = arith.trunci %22 : i64 to i32
      %reinterpret_cast_4 = memref.reinterpret_cast %arg20 to offset: [%21], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %24 = memref.load %reinterpret_cast_4[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 8 : i64}
      %25 = arith.trunci %24 : i64 to i32
      %26 = arith.index_cast %23 : i32 to index
      %reinterpret_cast_5 = memref.reinterpret_cast %arg19 to offset: [%26], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %27 = affine.apply #map()[%26]
      %28 = memref.load %reinterpret_cast_5[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 9 : i64}
      %reinterpret_cast_6 = memref.reinterpret_cast %arg19 to offset: [%27], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %29 = memref.load %reinterpret_cast_6[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 10 : i64}
      %30 = arith.subi %29, %28 : i64
      %31 = arith.trunci %30 : i64 to i32
      %32 = arith.muli %25, %c64_i32 : i32
      hivm.hir.anchor {id = 11 : i64}
      %alloc_7 = memref.alloc() {alignment = 64 : i64} : memref<64xi32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_0_outlined_vf_0(%alloc_1, %32, %alloc_7) {hivm.vector_function, no_inline} : (memref<64xi32, #hivm.address_space<ub>>, i32, memref<64xi32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 12 : i64}
      hivm.hir.anchor {id = 13 : i64}
      %33 = arith.addi %32, %c64_i32 : i32
      %34 = arith.minsi %31, %33 : i32
      %35 = arith.subi %34, %c1_i32 : i32
      hivm.hir.anchor {id = 14 : i64}
      %36 = arith.muli %28, %c32_i64 : i64
      %37 = arith.extsi %17 : i32 to i64
      %38 = arith.addi %36, %37 : i64
      %39 = arith.muli %38, %c128_i64 : i64
      %40 = arith.index_cast %39 : i64 to index
      %41 = arith.index_cast %38 : i64 to index
      %42 = arith.muli %38, %c64_i64 : i64
      %43 = arith.index_cast %42 : i64 to index
      %44 = arith.muli %18, %c32_i64 : i64
      %45 = arith.addi %44, %37 : i64
      %46 = arith.muli %45, %c16384_i64 : i64
      %47 = arith.index_cast %46 : i64 to index
      %48 = arith.maxsi %32, %c0_i32 : i32
      %49 = arith.index_cast %48 : i32 to index
      %50 = affine.apply #map1()[%41, %49]
      %51 = affine.apply #map7()[%40, %49]
      %52 = affine.apply #map3()[%43, %49]
      %53 = arith.index_cast %31 : i32 to index
      %54 = affine.apply #map2()[%53, %49]
      %reinterpret_cast_8 = memref.reinterpret_cast %arg7 to offset: [%50], sizes: [64], strides: [32] : memref<?xf32, #hivm.address_space<gm>> to memref<64xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
      %alloc_9 = memref.alloc() : memref<32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_9 {hivm.multi_buffer = 2 : i32} : memref<32xf32, #hivm.address_space<ub>>
      %55 = arith.maxsi %54, %c0 : index
      %56 = arith.minsi %55, %c64 : index
      %57 = arith.subi %c0_i32, %32 : i32
      %58 = arith.maxsi %57, %c0_i32 : i32
      %59 = arith.index_cast %58 : i32 to index
      %60 = arith.minsi %59, %56 : index
      %61 = affine.apply #map2()[%56, %60]
      %62 = arith.cmpi slt, %61, %c64 : index
      %63 = arith.minsi %9, %61 : index
      %64 = affine.apply #map43()[%63, %56, %60]
      %65 = arith.minsi %64, %c32 : index
      %subview_10 = memref.subview %reinterpret_cast_8[%9] [%65] [1] : memref<64xf32, strided<[32], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
      %66 = arith.maxsi %60, %9 : index
      %67 = arith.minsi %56, %13 : index
      %68 = arith.maxsi %66, %67 : index
      %69 = affine.apply #map2()[%68, %66]
      %70 = affine.apply #map44()[%66, %8]
      %subview_11 = memref.subview %alloc_9[%70] [%69] [1] : memref<32xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %71 = arith.remui %60, %c8 : index
      hivm.hir.anchor {id = 15 : i64}
      scf.if %62 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_0(%alloc_9) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_10 : memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>) outs(%subview_11 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %71 : index
      hivm.hir.anchor {id = 16 : i64}
      hivm.hir.anchor {id = 17 : i64}
      hivm.hir.anchor {id = 18 : i64}
      %reinterpret_cast_12 = memref.reinterpret_cast %arg3 to offset: [%51], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_13 = memref.reinterpret_cast %arg6 to offset: [%51], sizes: [64, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_14 = memref.alloc() : memref<32x128xbf16, #hivm.address_space<ub>>
      annotation.mark %alloc_14 {hivm.multi_buffer = 2 : i32} : memref<32x128xbf16, #hivm.address_space<ub>>
      %subview_15 = memref.subview %reinterpret_cast_12[%9, 0] [%65, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_16 = memref.subview %alloc_14[%70, 0] [%69, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 19 : i64}
      scf.if %62 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_1(%alloc_14) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_15 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_16 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16
      hivm.hir.anchor {id = 20 : i64}
      %alloc_17 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_17 {hivm.multi_buffer = 2 : i32} : memref<32x128xf32, #hivm.address_space<ub>>
      %subview_18 = memref.subview %reinterpret_cast_13[%9, 0] [%65, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_19 = memref.subview %alloc_17[%70, 0] [%69, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 21 : i64}
      scf.if %62 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_2(%alloc_17) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_18 : memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_19 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32
      hivm.hir.anchor {id = 22 : i64}
      %72 = arith.extsi %35 : i32 to i64
      %73 = arith.muli %72, %c4096_i64 : i64
      %74 = arith.addi %39, %73 : i64
      %75 = arith.index_cast %74 : i64 to index
      %reinterpret_cast_20 = memref.reinterpret_cast %arg6 to offset: [%75], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %alloc_21 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32} : memref<128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_21 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 23 : i64}
      hivm.hir.load ins(%reinterpret_cast_20 : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_21 : memref<128xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 24 : i64}
      hivm.hir.anchor {id = 25 : i64}
      hivm.hir.anchor {id = 26 : i64}
      hivm.hir.anchor {id = 27 : i64}
      hivm.hir.anchor {id = 28 : i64}
      hivm.hir.anchor {id = 29 : i64}
      %reinterpret_cast_22 = memref.reinterpret_cast %arg9 to offset: [%47], sizes: [128, 128], strides: [1, 128] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[1, 128], offset: ?>, #hivm.address_space<gm>>
      %subview_23 = memref.subview %reinterpret_cast_22[%10, 0] [64, 128] [1, 1] : memref<128x128xf32, strided<[1, 128], offset: ?>, #hivm.address_space<gm>> to memref<64x128xf32, strided<[1, 128], offset: ?>, #hivm.address_space<gm>>
      %alloc_24 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_24 {hivm.multi_buffer = 2 : i32} : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_24 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x128xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%subview_23 : memref<64x128xf32, strided<[1, 128], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_24 : memref<64x128xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 30 : i64}
      hivm.hir.anchor {id = 31 : i64}
      hivm.hir.anchor {id = 32 : i64}
      hivm.hir.anchor {id = 33 : i64}
      %reinterpret_cast_25 = memref.reinterpret_cast %arg11 to offset: [%47], sizes: [128, 128], strides: [1, 128] : memref<?xf32, #hivm.address_space<gm>> to memref<128x128xf32, strided<[1, 128], offset: ?>, #hivm.address_space<gm>>
      %subview_26 = memref.subview %reinterpret_cast_25[%10, 0] [64, 128] [1, 1] : memref<128x128xf32, strided<[1, 128], offset: ?>, #hivm.address_space<gm>> to memref<64x128xf32, strided<[1, 128], offset: ?>, #hivm.address_space<gm>>
      %alloc_27 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_27 {hivm.multi_buffer = 2 : i32} : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_27 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64x128xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%subview_26 : memref<64x128xf32, strided<[1, 128], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_27 : memref<64x128xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
      hivm.hir.anchor {id = 34 : i64}
      hivm.hir.anchor {id = 35 : i64}
      hivm.hir.anchor {id = 36 : i64}
      hivm.hir.anchor {id = 37 : i64}
      hivm.hir.anchor {id = 38 : i64}
      hivm.hir.anchor {id = 39 : i64}
      %alloc_28 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_5(%alloc_24, %alloc_27, %alloc_28) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 40 : i64}
      %alloc_29 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_29 {hivm.multi_buffer = 2 : i32} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_29 : memref<128xf32, #hivm.address_space<ub>>)
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_2_outlined_vf_0(%alloc_28, %alloc_29) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.pipe_barrier[<PIPE_MTE2>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE2>, <PIPE_MTE3>] flag = 15 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %collapse_shape = memref.collapse_shape %subview [[0, 1]] : memref<1x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<gm>> into memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%alloc_29 : memref<128xf32, #hivm.address_space<ub>>) outs(%collapse_shape : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.pipe_barrier[<PIPE_MTE3>]
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE2>] flag = 14 sync_instr_mode = <INTER_SUBBLOCK_SYNCHRONIZATION>
      %alloc_30 = memref.alloc() : memref<2x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_30 {hivm.multi_buffer = 2 : i32} : memref<2x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_30 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<2x128xf32, #hivm.address_space<ub>>
      %collapse_shape_31 = memref.collapse_shape %view [[0, 1]] : memref<2x128xf32, #hivm.address_space<gm>> into memref<256xf32, #hivm.address_space<gm>>
      %collapse_shape_32 = memref.collapse_shape %alloc_30 [[0, 1]] : memref<2x128xf32, #hivm.address_space<ub>> into memref<256xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape_31 : memref<256xf32, #hivm.address_space<gm>>) outs(%collapse_shape_32 : memref<256xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst>
      %alloc_33 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_33 : memref<128xf32, #hivm.address_space<ub>>)
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_3_outlined_vf_0(%alloc_30, %alloc_33) {hivm.vector_function, no_inline} : (memref<2x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 41 : i64}
      hivm.hir.anchor {id = 42 : i64}
      hivm.hir.anchor {id = 43 : i64}
      %alloc_34 = memref.alloc() : memref<8x65x16x1xbf16, #hivm.address_space<ub>>
      %subview_35 = memref.subview %alloc_34[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xbf16, #hivm.address_space<ub>> to memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_6(%alloc_24, %subview_35) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape = memref.expand_shape %subview_35 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_36 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_37 = memref.subview %alloc_36[0, %11, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_36 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      hivm.hir.anchor {id = 44 : i64}
      %collapse_shape_38 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_39 = memref.collapse_shape %subview_37 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_38 : memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_39 : memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 45 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 46 : i64}
      %alloc_40 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_40 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 47 : i64}
      hivm.hir.anchor {id = 48 : i64}
      hivm.hir.anchor {id = 49 : i64}
      hivm.hir.anchor {id = 50 : i64}
      %alloc_41 = memref.alloc() : memref<8x65x16x1xbf16, #hivm.address_space<ub>>
      %subview_42 = memref.subview %alloc_41[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xbf16, #hivm.address_space<ub>> to memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_7(%alloc_27, %subview_42) {hivm.vector_function, no_inline} : (memref<64x128xf32, #hivm.address_space<ub>>, memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_43 = memref.expand_shape %subview_42 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_44 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_45 = memref.subview %alloc_44[0, %11, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_44 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
      hivm.hir.anchor {id = 51 : i64}
      %collapse_shape_46 = memref.collapse_shape %expand_shape_43 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_47 = memref.collapse_shape %subview_45 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_46 : memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_47 : memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 52 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 53 : i64}
      %alloc_48 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_48 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 54 : i64}
      hivm.hir.anchor {id = 55 : i64}
      %alloc_49 = memref.alloc() : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_50 = memref.subview %alloc_49[0, %11, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_49 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
      hivm.hir.anchor {id = 56 : i64}
      %collapse_shape_51 = memref.collapse_shape %subview_50 [[0], [1, 2, 3]] : memref<8x4x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_38 : memref<8x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_51 : memref<8x1024xbf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 57 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 58 : i64}
      %alloc_52 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_52 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 59 : i64}
      hivm.hir.anchor {id = 60 : i64}
      %reinterpret_cast_53 = memref.reinterpret_cast %arg4 to offset: [%51], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_54 = memref.reinterpret_cast %arg15 to offset: [%51], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_55 = memref.alloc() : memref<32x128xbf16, #hivm.address_space<ub>>
      annotation.mark %alloc_55 {hivm.multi_buffer = 2 : i32} : memref<32x128xbf16, #hivm.address_space<ub>>
      %subview_56 = memref.subview %reinterpret_cast_53[%9, 0] [%65, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_57 = memref.subview %alloc_55[%70, 0] [%69, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 61 : i64}
      hivm.hir.anchor {id = 62 : i64}
      hivm.hir.anchor {id = 63 : i64}
      scf.if %62 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_3(%alloc_55) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_56 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_57 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16
      hivm.hir.anchor {id = 64 : i64}
      hivm.hir.anchor {id = 65 : i64}
      hivm.hir.anchor {id = 66 : i64}
      hivm.hir.anchor {id = 67 : i64}
      %alloc_58 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_58 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 68 : i64}
      hivm.hir.anchor {id = 69 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 70 : i64}
      hivm.hir.anchor {id = 71 : i64}
      hivm.hir.anchor {id = 72 : i64}
      %alloc_59 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_7_outlined_vf_0(%alloc_58, %alloc_55, %alloc_59) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xbf16, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 73 : i64}
      %alloc_60 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_61 = memref.alloc() {alignment = 64 : i64} : memref<32x128xbf16, #hivm.address_space<ub>>
      annotation.mark %alloc_61 {hivm.multi_buffer = 2 : i32} : memref<32x128xbf16, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_6_outlined_vf_0(%alloc_9, %alloc_58, %alloc_60, %alloc_61) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 74 : i64}
      %subview_62 = memref.subview %alloc_61[%70, 0] [%69, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 75 : i64}
      %subview_63 = memref.subview %reinterpret_cast_54[%9, 0] [%65, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_62 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_63 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.anchor {id = 76 : i64}
      hivm.hir.anchor {id = 77 : i64}
      hivm.hir.anchor {id = 78 : i64}
      hivm.hir.anchor {id = 79 : i64}
      hivm.hir.anchor {id = 80 : i64}
      hivm.hir.anchor {id = 81 : i64}
      %alloc_64 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_9_outlined_vf_0(%alloc_33, %alloc_21, %alloc_64) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 82 : i64}
      %alloc_65 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_0(%alloc_17, %alloc_65) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      %alloc_66 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_67 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_68 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_8_outlined_vf_1(%alloc_65, %alloc_60, %alloc_40, %alloc_66, %alloc_67, %alloc_68) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 83 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
      %alloc_69 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_69 {hivm.multi_buffer = 2 : i32} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_10_outlined_vf_0(%alloc_68, %arg21, %alloc_69) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, f32, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 84 : i64}
      hivm.hir.anchor {id = 85 : i64}
      hivm.hir.anchor {id = 86 : i64}
      hivm.hir.anchor {id = 87 : i64}
      %76 = arith.index_cast %32 : i32 to index
      %77 = affine.apply #map8()[%76]
      %78 = arith.maxsi %76, %53 : index
      %79 = arith.minsi %77, %78 : index
      %80 = affine.apply #map2()[%79, %76]
      %81 = arith.minsi %9, %80 : index
      %82 = affine.apply #map43()[%81, %79, %76]
      %83 = arith.minsi %82, %c32 : index
      hivm.hir.anchor {id = 88 : i64}
      hivm.hir.anchor {id = 89 : i64}
      %alloc_70 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_71 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_0(%alloc_21, %alloc_17, %alloc_70, %alloc_71) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      %subview_72 = memref.subview %alloc_70[0, 0] [%83, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
      %subview_73 = memref.subview %alloc_71[0, 0] [%83, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
      %collapse_shape_74 = memref.collapse_shape %subview_72 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
      %collapse_shape_75 = memref.collapse_shape %subview_73 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
      hivm.hir.copy ins(%collapse_shape_74 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_75 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
      %alloc_76 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_11_outlined_vf_1(%alloc_48, %alloc_71, %alloc_76) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 90 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.anchor {id = 91 : i64}
      %alloc_77 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_78 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_12_outlined_vf_0(%alloc_14, %alloc_77, %alloc_65, %alloc_78) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 92 : i64}
      %alloc_79 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_13_outlined_vf_0(%alloc_52, %alloc_79) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 93 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
      hivm.hir.anchor {id = 94 : i64}
      hivm.hir.anchor {id = 95 : i64}
      hivm.hir.anchor {id = 96 : i64}
      %alloc_80 = memref.alloc() : memref<8x33x16x1xbf16, #hivm.address_space<ub>>
      %subview_81 = memref.subview %alloc_80[0, 0, 0, 0] [8, 32, 16, 1] [1, 1, 1, 1] : memref<8x33x16x1xbf16, #hivm.address_space<ub>> to memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_14_outlined_vf_0(%alloc_79, %subview_81) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_82 = memref.expand_shape %subview_81 [[0], [1, 2], [3]] output_shape [8, 2, 16, 16] : memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> into memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_83 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_84 = memref.subview %alloc_83[0, %12, 0, 0] [8, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_83 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = 1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      hivm.hir.anchor {id = 97 : i64}
      %collapse_shape_85 = memref.collapse_shape %expand_shape_82 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>
      %collapse_shape_86 = memref.collapse_shape %subview_84 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_85 : memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_86 : memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 98 : i64}
      hivm.hir.anchor {id = 99 : i64}
      %alloc_87 = memref.alloc() : memref<8x33x16x1xbf16, #hivm.address_space<ub>>
      %subview_88 = memref.subview %alloc_87[0, 0, 0, 0] [8, 32, 16, 1] [1, 1, 1, 1] : memref<8x33x16x1xbf16, #hivm.address_space<ub>> to memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_15_outlined_vf_0(%alloc_78, %subview_88) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_89 = memref.expand_shape %subview_88 [[0], [1, 2], [3]] output_shape [8, 2, 16, 16] : memref<8x32x16xbf16, strided<[528, 16, 1]>, #hivm.address_space<ub>> into memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_90 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_91 = memref.subview %alloc_90[0, %12, 0, 0] [8, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_90 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = 1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.anchor {id = 100 : i64}
      %collapse_shape_92 = memref.collapse_shape %expand_shape_89 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[528, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>
      %collapse_shape_93 = memref.collapse_shape %subview_91 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_92 : memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_93 : memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 101 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 102 : i64}
      %alloc_94 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_94 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 103 : i64}
      hivm.hir.anchor {id = 104 : i64}
      %alloc_95 = memref.alloc() : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_96 = memref.subview %alloc_95[0, %12, 0, 0] [8, 2, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_95 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = 1 : index} : memref<8x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
      hivm.hir.anchor {id = 105 : i64}
      %collapse_shape_97 = memref.collapse_shape %subview_96 [[0], [1, 2, 3]] : memref<8x2x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_85 : memref<8x512xbf16, strided<[528, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_97 : memref<8x512xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 106 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 107 : i64}
      %alloc_98 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_98 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<32x128xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 108 : i64}
      hivm.hir.anchor {id = 109 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      hivm.hir.anchor {id = 110 : i64}
      %alloc_99 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_0(%alloc_98, %alloc_78, %alloc_99) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      %alloc_100 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_16_outlined_vf_1(%alloc_99, %alloc_100) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 111 : i64}
      %alloc_101 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_101 {hivm.multi_buffer = 2 : i32} : memref<32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_8(%alloc_59, %alloc_100, %alloc_101) {hivm.vector_function, no_inline} : (memref<32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 112 : i64}
      %reinterpret_cast_102 = memref.reinterpret_cast %arg2 to offset: [%51], sizes: [64, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_103 = memref.alloc() : memref<32x128xbf16, #hivm.address_space<ub>>
      annotation.mark %alloc_103 {hivm.multi_buffer = 2 : i32} : memref<32x128xbf16, #hivm.address_space<ub>>
      %subview_104 = memref.subview %reinterpret_cast_102[%9, 0] [%65, 128] [1, 1] : memref<64x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_105 = memref.subview %alloc_103[%70, 0] [%69, 128] [1, 1] : memref<32x128xbf16, #hivm.address_space<ub>> to memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 113 : i64}
      scf.if %62 {
        func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_4(%alloc_103) {hivm.vector_function, no_inline} : (memref<32x128xbf16, #hivm.address_space<ub>>) -> ()
      } {hivm.unlikely_condition}
      hivm.hir.load ins(%subview_104 : memref<?x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_105 : memref<?x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16
      hivm.hir.anchor {id = 114 : i64}
      hivm.hir.anchor {id = 115 : i64}
      %alloc_106 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_9(%alloc_77, %alloc_76, %alloc_106) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 116 : i64}
      %alloc_107 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      %collapse_shape_108 = memref.collapse_shape %alloc_106 [[0, 1]] : memref<32x128xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
      %collapse_shape_109 = memref.collapse_shape %alloc_107 [[0, 1]] : memref<32x128xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%collapse_shape_108 : memref<4096xf32, #hivm.address_space<ub>>) outs(%collapse_shape_109 : memref<4096xf32, #hivm.address_space<ub>>)
      %alloc_110 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_110 {hivm.multi_buffer = 2 : i32} : memref<128xf32, #hivm.address_space<ub>>
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
      annotation.mark %alloc_112 {hivm.multi_buffer = 2 : i32} : memref<2x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_112 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<2x128xf32, #hivm.address_space<ub>>
      %collapse_shape_113 = memref.collapse_shape %view_2 [[0, 1]] : memref<2x128xf32, #hivm.address_space<gm>> into memref<256xf32, #hivm.address_space<gm>>
      %collapse_shape_114 = memref.collapse_shape %alloc_112 [[0, 1]] : memref<2x128xf32, #hivm.address_space<ub>> into memref<256xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%collapse_shape_113 : memref<256xf32, #hivm.address_space<gm>>) outs(%collapse_shape_114 : memref<256xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst>
      %alloc_115 = memref.alloc() {alignment = 64 : i64} : memref<128xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<128xf32, #hivm.address_space<ub>>) outs(%alloc_115 : memref<128xf32, #hivm.address_space<ub>>)
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_18_outlined_vf_0(%alloc_112, %alloc_115) {hivm.vector_function, no_inline} : (memref<2x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 117 : i64}
      hivm.hir.anchor {id = 118 : i64}
      hivm.hir.anchor {id = 119 : i64}
      hivm.hir.anchor {id = 120 : i64}
      hivm.hir.anchor {id = 121 : i64}
      hivm.hir.anchor {id = 122 : i64}
      hivm.hir.anchor {id = 123 : i64}
      hivm.hir.anchor {id = 124 : i64}
      hivm.hir.anchor {id = 125 : i64}
      %alloc_116 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_116 {hivm.multi_buffer = 2 : i32} : memref<32x128xf32, #hivm.address_space<ub>>
      %alloc_117 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_117 {hivm.multi_buffer = 2 : i32} : memref<32x128xf32, #hivm.address_space<ub>>
      %reinterpret_cast_118 = memref.reinterpret_cast %arg12 to offset: [%51], sizes: [64, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_119 = memref.reinterpret_cast %arg13 to offset: [%51], sizes: [64, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_120 = memref.reinterpret_cast %arg16 to offset: [%51], sizes: [64, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_121 = memref.subview %alloc_69[%70, 0] [%69, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_122 = memref.subview %reinterpret_cast_118[%9, 0] [%65, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_121 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_122 : memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      %subview_123 = memref.subview %reinterpret_cast_119[%9, 0] [%65, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %subview_124 = memref.subview %reinterpret_cast_120[%9, 0] [%65, 128] [1, 1] : memref<64x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
      %alloc_125 = memref.alloc() {alignment = 64 : i64} : memref<64xf16, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_1_outlined_merged_merged_vf_0(%9, %alloc_7, %alloc_103, %alloc_69, %alloc_106, %alloc_64, %alloc_115, %alloc_99, %alloc_60, %35, %alloc_116, %alloc_76, %alloc_98, %alloc_67, %alloc_117, %alloc_7, %31, %alloc_125) {hivm.vector_function, no_inline, ptc_simdvf} : (index, memref<64xi32, #hivm.address_space<ub>>, memref<32x128xbf16, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, i32, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<32x128xf32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>, i32, memref<64xf16, #hivm.address_space<ub>>) -> ()
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
      hivm.hir.anchor {id = 141 : i64}
      hivm.hir.anchor {id = 142 : i64}
      hivm.hir.anchor {id = 143 : i64}
      %subview_126 = memref.subview %alloc_117[%70, 0] [%69, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.store ins(%subview_126 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_123 : memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      %subview_127 = memref.subview %alloc_116[%70, 0] [%69, 128] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.store ins(%subview_127 : memref<?x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_124 : memref<?x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      %alloc_128 = memref.alloc() : memref<64x256x1xi1, #hivm.address_space<ub>>
      %subview_129 = memref.subview %alloc_128[0, 0, 0] [64, 32, 1] [1, 1, 1] : memref<64x256x1xi1, #hivm.address_space<ub>> to memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_20_outlined_vf_1(%alloc_7, %alloc_7, %9, %alloc_125, %alloc_125, %9, %subview_129) {hivm.vector_function, no_inline} : (memref<64xi32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>, index, memref<64xf16, #hivm.address_space<ub>>, memref<64xf16, #hivm.address_space<ub>>, index, memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 144 : i64}
      %alloc_130 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_21_outlined_vf_0(%alloc_94, %alloc_9, %alloc_130) {hivm.vector_function, no_inline} : (memref<64x32xf32, #hivm.address_space<ub>>, memref<32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 145 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.anchor {id = 146 : i64}
      hivm.hir.anchor {id = 147 : i64}
      hivm.hir.anchor {id = 148 : i64}
      %alloc_131 = memref.alloc() : memref<2x65x16x1xbf16, #hivm.address_space<ub>>
      %subview_132 = memref.subview %alloc_131[0, 0, 0, 0] [2, 64, 16, 1] [1, 1, 1, 1] : memref<2x65x16x1xbf16, #hivm.address_space<ub>> to memref<2x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_22_outlined_vf_0(%subview_129, %alloc_130, %subview_132) {hivm.vector_function, no_inline} : (memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>, memref<2x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
      %expand_shape_133 = memref.expand_shape %subview_132 [[0], [1, 2], [3]] output_shape [2, 4, 16, 16] : memref<2x64x16xbf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<2x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
      %alloc_134 = memref.alloc() : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      %subview_135 = memref.subview %alloc_134[%12, 0, 0, 0] [2, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>> to memref<2x4x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      annotation.mark %alloc_134 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = 0 : index} : memref<4x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
      hivm.hir.anchor {id = 149 : i64}
      %collapse_shape_136 = memref.collapse_shape %expand_shape_133 [[0], [1, 2, 3]] : memref<2x4x16x16xbf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<2x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>
      %collapse_shape_137 = memref.collapse_shape %subview_135 [[0], [1, 2, 3]] : memref<2x4x16x16xbf16, strided<[1024, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x1024xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>
      hivm.hir.copy ins(%collapse_shape_136 : memref<2x1024xbf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_137 : memref<2x1024xbf16, strided<[1024, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
      hivm.hir.anchor {id = 150 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
      hivm.hir.anchor {id = 151 : i64}
      hivm.hir.anchor {id = 152 : i64}
      hivm.hir.anchor {id = 153 : i64}
      %alloc_138 = memref.alloc() : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_138 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 1 : index, tiledAlloc} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 154 : i64}
      hivm.hir.anchor {id = 155 : i64}
      hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
      %alloc_139 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_fused_23_outlined_vf_0(%alloc_138, %alloc_139) {hivm.vector_function, no_inline} : (memref<64x32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 156 : i64}
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
      %alloc_140 = memref.alloc() {alignment = 64 : i64} : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_140 {hivm.multi_buffer = 2 : i32} : memref<64x32xf32, #hivm.address_space<ub>>
      func.call @chunk_kda_bwd_kernel_wy_dqkg_fused_mix_aiv_outlined_vf_10(%subview_129, %alloc_139, %alloc_140) {hivm.vector_function, no_inline} : (memref<64x32xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>, memref<64x32xf32, #hivm.address_space<ub>>) -> ()
      hivm.hir.anchor {id = 157 : i64}
      %reinterpret_cast_141 = memref.reinterpret_cast %arg18 to offset: [%52], sizes: [64, 64], strides: [2048, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<64x64xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
      %reinterpret_cast_142 = memref.reinterpret_cast %arg17 to offset: [%50], sizes: [64], strides: [32] : memref<?xf32, #hivm.address_space<gm>> to memref<64xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
      %subview_143 = memref.subview %alloc_140[%60, 0] [%61, 32] [1, 1] : memref<64x32xf32, #hivm.address_space<ub>> to memref<?x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 158 : i64}
      %subview_144 = memref.subview %reinterpret_cast_141[0, %9] [%61, 32] [1, 1] : memref<64x64xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_143 : memref<?x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_144 : memref<?x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.anchor {id = 159 : i64}
      %subview_145 = memref.subview %alloc_101[%70] [%69] [1] : memref<32xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      hivm.hir.anchor {id = 160 : i64}
      %subview_146 = memref.subview %reinterpret_cast_142[%9] [%65] [1] : memref<64xf32, strided<[32], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_145 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_146 : memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
      hivm.hir.anchor {id = 161 : i64}
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 3
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.anchor {id = 162 : i64}
    return
  }
}
