#map = affine_map<()[s0] -> (s0 + 1)>
#map1 = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2 * 12288)>
#map2 = affine_map<()[s0, s1, s2] -> (s0 - s2 - s1 floordiv 12288)>
#map3 = affine_map<()[s0] -> (-s0 + (s0 floordiv 12288) * 12288 + 128)>
#map4 = affine_map<()[s0, s1] -> (s0 - s1)>
#map5 = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2)>
#map6 = affine_map<()[s0] -> (s0 + 128)>
#map7 = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2 * 6144)>
#map8 = affine_map<()[s0, s1, s2] -> (s0 - s2 - s1 floordiv 6144)>
#map9 = affine_map<()[s0] -> (-s0 + (s0 floordiv 6144) * 6144 + 64)>
#map10 = affine_map<()[s0, s1] -> ((s0 - s1) ceildiv 16)>
#map11 = affine_map<()[s0, s1] -> ((s0 - s1) ceildiv 8)>
#map12 = affine_map<(d0) -> (d0 floordiv 16)>
#map13 = affine_map<(d0) -> (d0 floordiv 8)>
#map14 = affine_map<(d0) -> (d0 mod 16)>
#map15 = affine_map<(d0) -> (d0 mod 8)>
#map16 = affine_map<()[s0] -> (s0 + 32)>
#map17 = affine_map<(d0) -> (d0 * 8)>
#map18 = affine_map<(d0) -> (d0, 0)>
#map19 = affine_map<(d0) -> (0, d0)>
#map20 = affine_map<()[s0, s1] -> (s0 + s1)>
#map21 = affine_map<(d0, d1) -> (0, d1)>
#map22 = affine_map<(d0, d1) -> (d1, d0)>
#map23 = affine_map<()[s0] -> (s0 * 16)>
#map24 = affine_map<()[s0] -> (s0 * 2)>
#map25 = affine_map<()[s0, s1, s2] -> (-s0 + s1 - s2)>
#map26 = affine_map<()[s0] -> (s0 * 16 + 16)>
#map27 = affine_map<()[s0, s1] -> (s0 - s1 * 16)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<MIX>, ssbuffer.insertionOptimization} {
  func.func @chunk_kda_bwd_kernel_intra_backup(%arg0: memref<?xi8> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg12: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg15: memref<?xi64> {tt.tensor_kind = 0 : i32}, %arg16: memref<?xi64> {tt.tensor_kind = 0 : i32}, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32) attributes {DirectlyUsedGMArgIdxList = [5, 5, 14, 5], SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, annotation.filter_passes = #annotation.filter_passes<"hivm-insert-anchors-and-backup,hivm-delayed-cross-core-gss,split-simt-module,hivm-merge-same-preload-scopes">, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<22xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.backup_function, hivm.func_core_type = #hivm.func_core_type<MIX>, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
    hivm.hir.anchor {id = 0 : i64}
    %c16 = arith.constant 16 : index
    %c8 = arith.constant 8 : index
    %c128_i32 = arith.constant 128 : i32
    %c32_i32 = arith.constant 32 : i32
    %c64_i32 = arith.constant 64 : i32
    %c2_i32 = arith.constant 2 : i32
    %c96_i32 = arith.constant 96 : i32
    %c0_i64 = arith.constant 0 : i64
    %cst = arith.constant 0.000000e+00 : f32
    %c32 = arith.constant 32 : index
    %c96_i64 = arith.constant 96 : i64
    %c0_i32 = arith.constant 0 : i32
    %c16_i32 = arith.constant 16 : i32
    %c32_i64 = arith.constant 32 : i64
    %c12288_i32 = arith.constant 12288 : i32
    %c31_i32 = arith.constant 31 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c128 = arith.constant 128 : index
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %cst_1 = arith.constant 0.693147182 : f32
    %cst_2 = arith.constant 0.000000e+00 : f16
    %cst_3 = arith.constant -1.000000e+00 : f16
    %cst_4 = arith.constant -1.000000e+00 : f32
    %true = arith.constant true
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg19, %arg20 : i32
    %1 = arith.muli %0, %arg21 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 1
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 8
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
    hivm.hir.anchor {id = 1 : i64}
    scf.for %arg22 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %4 = arith.remsi %arg22, %arg19 : i32
      %5 = arith.divsi %arg22, %arg19 : i32
      %6 = arith.remsi %5, %arg20 : i32
      %7 = arith.divsi %arg22, %0 : i32
      %8 = arith.remsi %7, %arg21 : i32
      %9 = tensor.empty() : tensor<32x128xf32>
      hivm.hir.anchor {id = 3 : i64}
      %10 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%cst : f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
      hivm.hir.anchor {id = 4 : i64}
      %11 = arith.remsi %8, %c96_i32 : i32
      %12 = arith.divsi %4, %c2_i32 : i32
      %13 = arith.remsi %4, %c2_i32 : i32
      %14 = arith.muli %arg17, %arg18 : i32
      %15 = arith.muli %6, %c2_i32 : i32
      %16 = arith.index_cast %15 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg16 to offset: [%16], sizes: [1], strides: [1] : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %17 = memref.load %reinterpret_cast[%c0] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<1xi64, strided<[1], offset: ?>>
      hivm.hir.anchor {id = 5 : i64}
      %18 = arith.trunci %17 : i64 to i32
      %19 = affine.apply #map()[%16]
      %reinterpret_cast_5 = memref.reinterpret_cast %arg16 to offset: [%19], sizes: [1], strides: [1] : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %20 = memref.load %reinterpret_cast_5[%c0] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<1xi64, strided<[1], offset: ?>>
      hivm.hir.anchor {id = 6 : i64}
      %21 = arith.trunci %20 : i64 to i32
      %22 = arith.index_cast %18 : i32 to index
      %reinterpret_cast_6 = memref.reinterpret_cast %arg15 to offset: [%22], sizes: [1], strides: [1] : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %23 = memref.load %reinterpret_cast_6[%c0] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<1xi64, strided<[1], offset: ?>>
      hivm.hir.anchor {id = 7 : i64}
      %24 = arith.trunci %23 : i64 to i32
      %25 = affine.apply #map()[%22]
      %reinterpret_cast_7 = memref.reinterpret_cast %arg15 to offset: [%25], sizes: [1], strides: [1] : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %26 = memref.load %reinterpret_cast_7[%c0] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<1xi64, strided<[1], offset: ?>>
      hivm.hir.anchor {id = 8 : i64}
      %27 = arith.trunci %26 : i64 to i32
      %28 = arith.subi %27, %24 : i32
      %29 = arith.muli %21, %c64_i32 : i32
      %30 = arith.muli %13, %c32_i32 : i32
      %31 = arith.addi %29, %30 : i32
      %32 = arith.cmpi sge, %31, %28 : i32
      scf.if %32 {
        hivm.hir.anchor {id = 9 : i64}
      } else {
        hivm.hir.anchor {id = 10 : i64}
        %33 = arith.muli %12, %c128_i32 : i32
        %34 = arith.muli %24, %c96_i32 : i32
        %35 = arith.addi %34, %11 : i32
        %36 = arith.extsi %35 : i32 to i64
        %37 = arith.muli %35, %c128_i32 : i32
        %38 = arith.index_cast %37 : i32 to index
        %39 = arith.muli %35, %c64_i32 : i32
        %40 = arith.index_cast %39 : i32 to index
        %41 = arith.muli %12, %14 : i32
        %42 = arith.addi %41, %24 : i32
        %43 = arith.muli %42, %c96_i32 : i32
        %44 = arith.addi %43, %11 : i32
        %45 = arith.extsi %28 : i32 to i64
        %46 = arith.maxsi %31, %c0_i32 : i32
        %47 = arith.index_cast %46 : i32 to index
        %48 = arith.maxsi %33, %c0_i32 : i32
        %49 = arith.index_cast %48 : i32 to index
        %50 = arith.index_cast %28 : i32 to index
        %51 = affine.apply #map1()[%49, %38, %47]
        %reinterpret_cast_8 = memref.reinterpret_cast %arg4 to offset: [%51], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %alloc = memref.alloc() : memref<32x128xf32>
        %52 = affine.apply #map2()[%50, %49, %47]
        %53 = arith.maxsi %52, %c0 : index
        %54 = arith.minsi %53, %c32 : index
        %55 = affine.apply #map3()[%49]
        %56 = arith.maxsi %55, %c0 : index
        %57 = arith.minsi %56, %c128 : index
        %58 = arith.subi %c0_i32, %31 : i32
        %59 = arith.maxsi %58, %c0_i32 : i32
        %60 = arith.index_cast %59 : i32 to index
        %61 = arith.minsi %60, %54 : index
        %62 = affine.apply #map4()[%54, %61]
        %63 = arith.subi %c0_i32, %33 : i32
        %64 = arith.maxsi %63, %c0_i32 : i32
        %65 = arith.index_cast %64 : i32 to index
        %66 = arith.minsi %65, %57 : index
        %67 = affine.apply #map4()[%57, %66]
        %68 = arith.cmpi slt, %62, %c32 : index
        %69 = arith.cmpi slt, %67, %c128 : index
        %70 = arith.ori %68, %69 : i1
        %subview = memref.subview %reinterpret_cast_8[0, 0] [%62, %67] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        %subview_9 = memref.subview %alloc[%61, %66] [%62, %67] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        %71 = arith.remui %66, %c8 : index
        hivm.hir.anchor {id = 11 : i64}
        hivm.hir.load ins(%subview : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_9 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %71 : index init_out_buffer = true init_condition = %70 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 12 : i64}
        %72 = bufferization.to_tensor %alloc restrict writable : memref<32x128xf32>
        %73 = arith.extsi %31 : i32 to i64
        %74 = arith.muli %73, %c96_i64 : i64
        %75 = arith.addi %36, %74 : i64
        %76 = arith.subi %45, %73 : i64
        %77 = arith.maxsi %76, %c0_i64 : i64
        %78 = arith.minsi %77, %c32_i64 : i64
        %79 = arith.minsi %78, %c32_i64 : i64
        %80 = tensor.empty() : tensor<32xf32>
        hivm.hir.anchor {id = 13 : i64}
        %81 = hivm.hir.stride_load ins(%arg5 : memref<?xf32>) outs(%80 : tensor<32xf32>) offset(%75 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%79 : i64]) {hivm.vf_mode = #hivm.vf_mode<SIMT>} -> tensor<32xf32>
        hivm.hir.anchor {id = 14 : i64}
        %82 = arith.cmpi sgt, %13, %c0_i32 : i32
        %83:2 = scf.if %82 -> (tensor<32x128xf32>, tensor<32x128xf32>) {
          hivm.hir.anchor {id = 15 : i64}
          %223 = arith.muli %31, %c12288_i32 : i32
          %224 = arith.index_cast %223 : i32 to index
          %225 = arith.index_cast %33 : i32 to index
          %226 = affine.apply #map5()[%225, %38, %224]
          %reinterpret_cast_88 = memref.reinterpret_cast %arg4 to offset: [%226], sizes: [128], strides: [1] : memref<?xf32> to memref<128xf32, strided<[1], offset: ?>>
          %alloc_89 = memref.alloc() : memref<128xf32>
          %227 = affine.apply #map6()[%225]
          %228 = arith.maxsi %225, %c128 : index
          %229 = arith.minsi %227, %228 : index
          %230 = affine.apply #map4()[%229, %225]
          %231 = arith.cmpi slt, %230, %c128 : index
          %subview_90 = memref.subview %reinterpret_cast_88[0] [%230] [1] : memref<128xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
          %subview_91 = memref.subview %alloc_89[0] [%230] [1] : memref<128xf32> to memref<?xf32, strided<[1]>>
          hivm.hir.anchor {id = 16 : i64}
          hivm.hir.load ins(%subview_90 : memref<?xf32, strided<[1], offset: ?>>) outs(%subview_91 : memref<?xf32, strided<[1]>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 init_out_buffer = true init_condition = %231 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
          hivm.hir.anchor {id = 17 : i64}
          %232 = bufferization.to_tensor %alloc_89 restrict writable : memref<128xf32>
          %expanded_92 = tensor.expand_shape %232 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
          %alloca = memref.alloca() {normalize_matmul_counter = 0 : i32} : memref<i32>
          hivm.hir.anchor {id = 18 : i64}
          memref.store %c0_i32, %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 19 : i64}
          %alloca_93 = memref.alloca() {normalize_matmul_counter = 1 : i32} : memref<i32>
          hivm.hir.anchor {id = 20 : i64}
          memref.store %c0_i32, %alloca_93[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 21 : i64}
          %233 = tensor.empty() : tensor<8x2x16x16xf32>
          %234:2 = scf.for %arg23 = %c0_i32 to %13 step %c1_i32 iter_args(%arg24 = %233, %arg25 = %233) -> (tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>)  : i32 {
            hivm.hir.anchor {id = 22 : i64}
            %alloc_96 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_96 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_97 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_97 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
            hivm.hir.anchor {id = 23 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 24 : i64}
              %249 = arith.muli %arg23, %c32_i32 : i32
              %250 = arith.addi %29, %249 : i32
              %251 = arith.maxsi %250, %c0_i32 : i32
              %252 = arith.index_cast %251 : i32 to index
              %253 = affine.apply #map1()[%49, %38, %252]
              %reinterpret_cast_98 = memref.reinterpret_cast %arg3 to offset: [%253], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[12288, 1], offset: ?>>
              %reinterpret_cast_99 = memref.reinterpret_cast %arg4 to offset: [%253], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
              %alloc_100 = memref.alloc() : memref<32x128xbf16>
              %254 = affine.apply #map2()[%50, %49, %252]
              %255 = arith.maxsi %254, %c0 : index
              %256 = arith.minsi %255, %c32 : index
              %257 = arith.subi %c0_i32, %250 : i32
              %258 = arith.maxsi %257, %c0_i32 : i32
              %259 = arith.index_cast %258 : i32 to index
              %260 = arith.minsi %259, %256 : index
              %261 = affine.apply #map4()[%256, %260]
              %262 = arith.cmpi slt, %261, %c32 : index
              %263 = arith.ori %262, %69 : i1
              %subview_101 = memref.subview %reinterpret_cast_98[0, 0] [%261, %67] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
              %subview_102 = memref.subview %alloc_100[%260, %66] [%261, %67] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
              %264 = arith.remui %66, %c16 : index
              hivm.hir.anchor {id = 25 : i64}
              hivm.hir.load ins(%subview_101 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_102 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %264 : index init_out_buffer = true init_condition = %263 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 26 : i64}
              %265 = bufferization.to_tensor %alloc_100 restrict writable : memref<32x128xbf16>
              %alloc_103 = memref.alloc() : memref<32x128xf32>
              %subview_104 = memref.subview %reinterpret_cast_99[0, 0] [%261, %67] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
              %subview_105 = memref.subview %alloc_103[%260, %66] [%261, %67] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 27 : i64}
              hivm.hir.load ins(%subview_104 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_105 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %71 : index init_out_buffer = true init_condition = %263 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 28 : i64}
              %266 = bufferization.to_tensor %alloc_103 restrict writable : memref<32x128xf32>
              hivm.hir.anchor {id = 29 : i64}
              %267 = hivm.hir.vsub ins(%expanded_92, %266 : tensor<1x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
              hivm.hir.anchor {id = 30 : i64}
              %268 = hivm.hir.vmul ins(%267, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 31 : i64}
              %269 = hivm.hir.vexp ins(%268 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 32 : i64}
              %270 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%265 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 33 : i64}
              %271 = hivm.hir.vmul ins(%270, %269 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 34 : i64}
              %expanded_106 = tensor.expand_shape %271 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
              %272 = tensor.empty() : tensor<16x32x8xf32>
              %273 = hivm.hir.vtranspose ins(%expanded_106 : tensor<32x16x8xf32>) outs(%272 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
              hivm.hir.anchor {id = 35 : i64}
              %expanded_107 = tensor.expand_shape %273 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
              annotation.mark %alloc_97 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 36 : i64}
              hivm.hir.copy ins(%expanded_107 : tensor<16x2x16x8xf32>) outs(%alloc_97 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 37 : i64}
              annotation.mark %alloc_96 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 38 : i64}
              hivm.hir.copy ins(%expanded_107 : tensor<16x2x16x8xf32>) outs(%alloc_96 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 39 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 40 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            %246 = bufferization.to_tensor %alloc_97 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %247 = bufferization.to_tensor %alloc_96 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 41 : i64}
            %248:2 = scope.scope : () -> (tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>) {
              hivm.hir.anchor {id = 42 : i64}
              %249 = arith.muli %arg23, %c32_i32 : i32
              %250 = arith.maxsi %249, %c0_i32 : i32
              %251 = arith.index_cast %250 : i32 to index
              %252 = affine.apply #map7()[%251, %40, %47]
              %reinterpret_cast_98 = memref.reinterpret_cast %arg6 to offset: [%252], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
              %reinterpret_cast_99 = memref.reinterpret_cast %arg7 to offset: [%252], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
              %253 = affine.apply #map8()[%50, %251, %47]
              %254 = arith.maxsi %253, %c0 : index
              %255 = arith.minsi %254, %c32 : index
              %256 = affine.apply #map9()[%251]
              %257 = arith.maxsi %256, %c0 : index
              %258 = arith.minsi %257, %c32 : index
              %259 = arith.minsi %60, %255 : index
              %260 = affine.apply #map4()[%255, %259]
              %261 = arith.subi %c0_i32, %249 : i32
              %262 = arith.maxsi %261, %c0_i32 : i32
              %263 = arith.index_cast %262 : i32 to index
              %264 = arith.minsi %263, %258 : index
              %265 = affine.apply #map4()[%258, %264]
              %266 = arith.cmpi slt, %260, %c32 : index
              %267 = arith.cmpi slt, %265, %c32 : index
              %268 = arith.ori %266, %267 : i1
              %subview_100 = memref.subview %reinterpret_cast_98[0, 0] [%260, %265] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
              %269 = affine.apply #map10()[%255, %259]
              %270 = affine.apply #map11()[%258, %264]
              %271 = affine.apply #map12(%259)
              %272 = affine.apply #map13(%264)
              %273 = affine.apply #map14(%259)
              %274 = affine.apply #map15(%264)
              %alloc_101 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_102 = memref.subview %alloc_101[%272, %271, %273, %274] [%270, %269, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 43 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_100 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_102 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %268 : i1
              hivm.hir.anchor {id = 44 : i64}
              %275 = bufferization.to_tensor %alloc_101 restrict writable : memref<4x2x16x8xf32>
              %subview_103 = memref.subview %reinterpret_cast_99[0, 0] [%260, %265] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
              %alloc_104 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_105 = memref.subview %alloc_104[%272, %271, %273, %274] [%270, %269, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 45 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_103 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_105 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %268 : i1
              hivm.hir.anchor {id = 46 : i64}
              %276 = bufferization.to_tensor %alloc_104 restrict writable : memref<4x2x16x8xf32>
              hivm.hir.anchor {id = 47 : i64}
              %277 = memref.load %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 48 : i64}
              %278 = arith.cmpi eq, %277, %c0_i32 : i32
              %279 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%275, %246, %278, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%arg24 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 49 : i64}
              %280 = arith.addi %277, %c1_i32 : i32
              memref.store %280, %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 50 : i64}
              %281 = memref.load %alloca_93[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 51 : i64}
              %282 = arith.cmpi eq, %281, %c0_i32 : i32
              %283 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%276, %247, %282, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%arg25 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 52 : i64}
              %284 = arith.addi %281, %c1_i32 : i32
              memref.store %284, %alloca_93[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 53 : i64}
              scope.return %279, %283 : tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 54 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
            scf.yield %248#0, %248#1 : tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop, may_not_exec, normalized_in_L0C = [0 : i32, 1 : i32]}
          hivm.hir.anchor {id = 55 : i64}
          %235 = memref.load %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 56 : i64}
          %236 = arith.cmpi eq, %235, %c0_i32 : i32
          %alloc_94 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_94 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>} : memref<32x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.anchor {id = 57 : i64}
          %237 = scf.if %236 -> (tensor<32x128xf32>) {
            hivm.hir.anchor {id = 58 : i64}
            scf.yield %10 : tensor<32x128xf32>
          } else {
            hivm.hir.anchor {id = 59 : i64}
            %memspacecast_96 = memref.memory_space_cast %alloc_94 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
            %246 = bufferization.to_tensor %memspacecast_96 restrict writable : memref<32x128xf32>
            hivm.hir.anchor {id = 60 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%234#0 : tensor<8x2x16x16xf32>) outs(%alloc_94 : memref<32x128xf32, #hivm.address_space<ub>>)
            hivm.hir.anchor {id = 61 : i64}
            scf.yield %246 : tensor<32x128xf32>
          } {fallback_not_exec}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 62 : i64}
          %238 = memref.load %alloca_93[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 63 : i64}
          %239 = arith.cmpi eq, %238, %c0_i32 : i32
          %alloc_95 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_95 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>} : memref<32x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
          hivm.hir.anchor {id = 64 : i64}
          %240 = scf.if %239 -> (tensor<32x128xf32>) {
            hivm.hir.anchor {id = 65 : i64}
            scf.yield %10 : tensor<32x128xf32>
          } else {
            hivm.hir.anchor {id = 66 : i64}
            %memspacecast_96 = memref.memory_space_cast %alloc_95 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
            %246 = bufferization.to_tensor %memspacecast_96 restrict writable : memref<32x128xf32>
            hivm.hir.anchor {id = 67 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%234#1 : tensor<8x2x16x16xf32>) outs(%alloc_95 : memref<32x128xf32, #hivm.address_space<ub>>)
            hivm.hir.anchor {id = 68 : i64}
            scf.yield %246 : tensor<32x128xf32>
          } {fallback_not_exec}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 69 : i64}
          %241 = hivm.hir.vsub ins(%72, %expanded_92 : tensor<32x128xf32>, tensor<1x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
          hivm.hir.anchor {id = 70 : i64}
          %242 = hivm.hir.vmul ins(%241, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 71 : i64}
          %243 = hivm.hir.vexp ins(%242 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 72 : i64}
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %244 = hivm.hir.vmul ins(%237, %243 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 73 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %245 = hivm.hir.vmul ins(%240, %243 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 74 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
          scf.yield %244, %245 : tensor<32x128xf32>, tensor<32x128xf32>
        } else {
          hivm.hir.anchor {id = 75 : i64}
          scf.yield %10, %10 : tensor<32x128xf32>, tensor<32x128xf32>
        }
        %84 = tensor.empty() : tensor<32xi32>
        hivm.hir.anchor {id = 76 : i64}
        %85 = hivm.hir.varange offset[%c0] strides[%c1] outs(%84 : tensor<32xi32>) -> tensor<32xi32>
        hivm.hir.anchor {id = 77 : i64}
        %reinterpret_cast_10 = memref.reinterpret_cast %arg2 to offset: [%51], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[12288, 1], offset: ?>>
        %reinterpret_cast_11 = memref.reinterpret_cast %arg3 to offset: [%51], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[12288, 1], offset: ?>>
        %alloc_12 = memref.alloc() : memref<32x128xbf16>
        %subview_13 = memref.subview %reinterpret_cast_10[0, 0] [%62, %67] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
        %subview_14 = memref.subview %alloc_12[%61, %66] [%62, %67] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        %86 = arith.remui %66, %c16 : index
        hivm.hir.anchor {id = 78 : i64}
        hivm.hir.load ins(%subview_13 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_14 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %86 : index init_out_buffer = true init_condition = %70 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 79 : i64}
        %87 = bufferization.to_tensor %alloc_12 restrict writable : memref<32x128xbf16>
        %alloc_15 = memref.alloc() : memref<32x128xbf16>
        %subview_16 = memref.subview %reinterpret_cast_11[0, 0] [%62, %67] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
        %subview_17 = memref.subview %alloc_15[%61, %66] [%62, %67] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 80 : i64}
        hivm.hir.load ins(%subview_16 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_17 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %86 : index init_out_buffer = true init_condition = %70 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 81 : i64}
        %88 = bufferization.to_tensor %alloc_15 restrict writable : memref<32x128xbf16>
        %89 = arith.subi %28, %31 : i32
        %90 = arith.subi %89, %c1_i32 : i32
        %91 = arith.minsi %90, %c16_i32 : i32
        %92 = arith.trunci %91 : i32 to i16
        %93 = arith.extsi %92 : i16 to i32
        %94 = tensor.empty() : tensor<1x128xi32>
        hivm.hir.anchor {id = 82 : i64}
        %95 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%93 : i32) outs(%94 : tensor<1x128xi32>) -> tensor<1x128xi32>
        hivm.hir.anchor {id = 83 : i64}
        %96 = tensor.empty() : tensor<1x128xf32>
        %97 = hivm.hir.vgather {hivm.vf_mode = #hivm.vf_mode<SIMT>} ins(%72 : tensor<32x128xf32>) indices(%95 : tensor<1x128xi32>) outs(%96 : tensor<1x128xf32>) gather_axis = 0 -> tensor<1x128xf32>
        hivm.hir.anchor {id = 84 : i64}
        %98 = arith.maxsi %30, %c0_i32 : i32
        %99 = arith.index_cast %98 : i32 to index
        %100 = affine.apply #map7()[%99, %40, %47]
        %reinterpret_cast_18 = memref.reinterpret_cast %arg6 to offset: [%100], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
        %reinterpret_cast_19 = memref.reinterpret_cast %arg7 to offset: [%100], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
        %alloc_20 = memref.alloc() : memref<32x32xf32>
        %101 = affine.apply #map8()[%50, %99, %47]
        %102 = arith.maxsi %101, %c0 : index
        %103 = arith.minsi %102, %c32 : index
        %104 = affine.apply #map9()[%99]
        %105 = arith.maxsi %104, %c0 : index
        %106 = arith.minsi %105, %c32 : index
        %107 = arith.minsi %60, %103 : index
        %108 = affine.apply #map4()[%103, %107]
        %109 = arith.subi %c0_i32, %30 : i32
        %110 = arith.maxsi %109, %c0_i32 : i32
        %111 = arith.index_cast %110 : i32 to index
        %112 = arith.minsi %111, %106 : index
        %113 = affine.apply #map4()[%106, %112]
        %114 = arith.cmpi slt, %108, %c32 : index
        %115 = arith.cmpi slt, %113, %c32 : index
        %116 = arith.ori %114, %115 : i1
        %subview_21 = memref.subview %reinterpret_cast_18[0, 0] [%108, %113] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
        %subview_22 = memref.subview %alloc_20[%107, %112] [%108, %113] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        %117 = arith.remui %112, %c8 : index
        hivm.hir.anchor {id = 85 : i64}
        hivm.hir.load ins(%subview_21 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_22 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %117 : index init_out_buffer = true init_condition = %116 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 86 : i64}
        %118 = bufferization.to_tensor %alloc_20 restrict writable : memref<32x32xf32>
        %alloc_23 = memref.alloc() : memref<32x32xf32>
        %subview_24 = memref.subview %reinterpret_cast_19[0, 0] [%108, %113] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
        %subview_25 = memref.subview %alloc_23[%107, %112] [%108, %113] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        hivm.hir.anchor {id = 87 : i64}
        hivm.hir.load ins(%subview_24 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_25 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %117 : index init_out_buffer = true init_condition = %116 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 88 : i64}
        %119 = bufferization.to_tensor %alloc_23 restrict writable : memref<32x32xf32>
        %expanded = tensor.expand_shape %85 [[0, 1]] output_shape [1, 32] : tensor<32xi32> into tensor<1x32xi32>
        %expanded_26 = tensor.expand_shape %85 [[0, 1]] output_shape [32, 1] : tensor<32xi32> into tensor<32x1xi32>
        %120 = tensor.empty() : tensor<32x32xi32>
        hivm.hir.anchor {id = 89 : i64}
        %121 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_26 : tensor<32x1xi32>) outs(%120 : tensor<32x32xi32>) broadcast_dims = [1] -> tensor<32x32xi32>
        hivm.hir.anchor {id = 90 : i64}
        %122 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded : tensor<1x32xi32>) outs(%120 : tensor<32x32xi32>) broadcast_dims = [0] -> tensor<32x32xi32>
        hivm.hir.anchor {id = 91 : i64}
        %123 = tensor.empty() : tensor<32x32xi1>
        %124 = hivm.hir.vcmp ins(%121, %122 : tensor<32x32xi32>, tensor<32x32xi32>) outs(%123 : tensor<32x32xi1>) compare_mode = <ge> -> tensor<32x32xi1>
        hivm.hir.anchor {id = 92 : i64}
        %125 = tensor.empty() : tensor<1x32xi32>
        %126 = hivm.hir.vadd ins(%expanded, %31 : tensor<1x32xi32>, i32) outs(%125 : tensor<1x32xi32>) -> tensor<1x32xi32>
        hivm.hir.anchor {id = 93 : i64}
        %127 = tensor.empty() : tensor<1x32xi1>
        %128 = hivm.hir.vcmp ins(%126, %28 : tensor<1x32xi32>, i32) outs(%127 : tensor<1x32xi1>) compare_mode = <lt> -> tensor<1x32xi1>
        hivm.hir.anchor {id = 94 : i64}
        %collapsed = tensor.collapse_shape %128 [[0, 1]] : tensor<1x32xi1> into tensor<32xi1>
        %129 = tensor.empty() : tensor<32xf16>
        %130 = hivm.hir.vsel ins(%collapsed, %cst_3, %cst_2 : tensor<32xi1>, f16, f16) outs(%129 : tensor<32xf16>) -> tensor<32xf16>
        hivm.hir.anchor {id = 95 : i64}
        %expanded_27 = tensor.expand_shape %130 [[0, 1]] output_shape [1, 32] : tensor<32xf16> into tensor<1x32xf16>
        %131 = tensor.empty() : tensor<32x32xf16>
        %132 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_27 : tensor<1x32xf16>) outs(%131 : tensor<32x32xf16>) broadcast_dims = [0] -> tensor<32x32xf16>
        hivm.hir.anchor {id = 96 : i64}
        %133 = hivm.hir.vcmp ins(%132, %cst_2 : tensor<32x32xf16>, f16) outs(%123 : tensor<32x32xi1>) compare_mode = <ne> -> tensor<32x32xi1>
        hivm.hir.anchor {id = 97 : i64}
        %134 = hivm.hir.vand ins(%124, %133 : tensor<32x32xi1>, tensor<32x32xi1>) outs(%123 : tensor<32x32xi1>) -> tensor<32x32xi1>
        hivm.hir.anchor {id = 98 : i64}
        %135 = tensor.empty() : tensor<32x32xf32>
        %136 = hivm.hir.vsel ins(%134, %118, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%135 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 99 : i64}
        %137 = hivm.hir.vsel ins(%134, %119, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%135 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 100 : i64}
        %138 = hivm.hir.vsub ins(%72, %97 : tensor<32x128xf32>, tensor<1x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
        hivm.hir.anchor {id = 101 : i64}
        %139 = arith.index_cast %31 : i32 to index
        %140 = affine.apply #map16()[%139]
        %141 = arith.maxsi %139, %50 : index
        %142 = arith.minsi %140, %141 : index
        %143 = affine.apply #map4()[%142, %139]
        %extracted_slice = tensor.extract_slice %138[0, 0] [%143, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x128xf32>
        hivm.hir.anchor {id = 102 : i64}
        %inserted_slice = tensor.insert_slice %extracted_slice into %10[0, 0] [%143, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<?x128xf32> into tensor<32x128xf32>
        hivm.hir.anchor {id = 103 : i64}
        %144 = hivm.hir.vmul ins(%inserted_slice, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 104 : i64}
        %145 = hivm.hir.vexp ins(%144 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 105 : i64}
        %146 = hivm.hir.vmul ins(%inserted_slice, %cst_4 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 106 : i64}
        %147 = hivm.hir.vmul ins(%146, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 107 : i64}
        %148 = hivm.hir.vexp ins(%147 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 108 : i64}
        %149 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%88 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 109 : i64}
        %150 = hivm.hir.vmul ins(%149, %148 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 110 : i64}
        %expanded_28 = tensor.expand_shape %150 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
        %151 = tensor.empty() : tensor<16x32x8xf32>
        %152 = hivm.hir.vtranspose ins(%expanded_28 : tensor<32x16x8xf32>) outs(%151 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
        hivm.hir.anchor {id = 111 : i64}
        %expanded_29 = tensor.expand_shape %152 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
        %alloc_30 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_30 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %153 = bufferization.to_tensor %alloc_30 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        hivm.hir.anchor {id = 112 : i64}
        hivm.hir.copy ins(%expanded_29 : tensor<16x2x16x8xf32>) outs(%alloc_30 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 113 : i64}
        %expanded_31 = tensor.expand_shape %136 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %154 = tensor.empty() : tensor<4x32x8xf32>
        %155 = hivm.hir.vtranspose ins(%expanded_31 : tensor<32x4x8xf32>) outs(%154 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 114 : i64}
        %expanded_32 = tensor.expand_shape %155 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_33 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_33 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %156 = bufferization.to_tensor %alloc_33 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 115 : i64}
        hivm.hir.copy ins(%expanded_32 : tensor<4x2x16x8xf32>) outs(%alloc_33 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 116 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %157 = tensor.empty() : tensor<8x2x16x16xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %158 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%156, %153, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%157 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 117 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        %alloc_34 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_34 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast = memref.memory_space_cast %alloc_34 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %159 = bufferization.to_tensor %memspacecast restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.anchor {id = 118 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%158 : tensor<8x2x16x16xf32>) outs(%alloc_34 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 119 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %160 = hivm.hir.vmul ins(%159, %145 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 120 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        %161 = hivm.hir.vadd ins(%83#0, %160 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 121 : i64}
        %alloc_35 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_35 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %162 = bufferization.to_tensor %alloc_35 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        hivm.hir.anchor {id = 122 : i64}
        hivm.hir.copy ins(%expanded_29 : tensor<16x2x16x8xf32>) outs(%alloc_35 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 123 : i64}
        %expanded_36 = tensor.expand_shape %137 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %163 = hivm.hir.vtranspose ins(%expanded_36 : tensor<32x4x8xf32>) outs(%154 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 124 : i64}
        %expanded_37 = tensor.expand_shape %163 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_38 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_38 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %164 = bufferization.to_tensor %alloc_38 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 125 : i64}
        hivm.hir.copy ins(%expanded_37 : tensor<4x2x16x8xf32>) outs(%alloc_38 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 126 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %165 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%164, %162, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%157 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 127 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        %alloc_39 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_39 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast_40 = memref.memory_space_cast %alloc_39 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %166 = bufferization.to_tensor %memspacecast_40 restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.anchor {id = 128 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%165 : tensor<8x2x16x16xf32>) outs(%alloc_39 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 129 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %167 = hivm.hir.vmul ins(%166, %145 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 130 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        %168 = hivm.hir.vadd ins(%83#1, %167 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 131 : i64}
        %169 = hivm.hir.vmul ins(%168, %149 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 132 : i64}
        %170 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%cst : f32) outs(%80 : tensor<32xf32>) -> tensor<32xf32>
        hivm.hir.anchor {id = 133 : i64}
        %expanded_41 = tensor.expand_shape %170 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
        %171 = hivm.hir.vreduce <sum> ins(%169 : tensor<32x128xf32>) outs(%expanded_41 : tensor<32x1xf32>) reduce_dims = [1] -> tensor<32x1xf32>
        hivm.hir.anchor {id = 134 : i64}
        %collapsed_42 = tensor.collapse_shape %171 [[0, 1]] : tensor<32x1xf32> into tensor<32xf32>
        %expanded_43 = tensor.expand_shape %81 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
        %172 = hivm.hir.vmul ins(%168, %expanded_43 : tensor<32x128xf32>, tensor<32x1xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [1] -> tensor<32x128xf32>
        hivm.hir.anchor {id = 135 : i64}
        %reinterpret_cast_44 = memref.reinterpret_cast %arg8 to offset: [%51], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %reinterpret_cast_45 = memref.reinterpret_cast %arg9 to offset: [%51], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %173 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%87 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 136 : i64}
        %174 = hivm.hir.vmul ins(%173, %161 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 137 : i64}
        %alloc_46 = memref.alloc() : memref<32x128xf32>
        %subview_47 = memref.subview %reinterpret_cast_44[0, 0] [%62, %67] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        %subview_48 = memref.subview %alloc_46[%61, %66] [%62, %67] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 138 : i64}
        hivm.hir.load ins(%subview_47 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_48 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %71 : index init_out_buffer = true init_condition = %70 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 139 : i64}
        %175 = bufferization.to_tensor %alloc_46 restrict writable : memref<32x128xf32>
        hivm.hir.anchor {id = 140 : i64}
        %176 = hivm.hir.vadd ins(%161, %175 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 141 : i64}
        %extracted_slice_49 = tensor.extract_slice %176[%61, %66] [%62, %67] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x?xf32>
        hivm.hir.anchor {id = 142 : i64}
        %subview_50 = memref.subview %reinterpret_cast_45[0, 0] [%62, %67] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        hivm.hir.store ins(%extracted_slice_49 : tensor<?x?xf32>) outs(%subview_50 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 143 : i64}
        %177 = arith.extsi %44 : i32 to i64
        %178 = arith.addi %177, %74 : i64
        hivm.hir.stride_store ins(%collapsed_42 : tensor<32xf32>) outs(%arg14 : memref<?xf32>) offset(%178 : i64) strides([%c96_i64 : i64]) numels([%79 : i64]) {hivm.vf_mode = #hivm.vf_mode<SIMT>}
        hivm.hir.anchor {id = 144 : i64}
        %179 = arith.subi %28, %29 : i32
        %180 = arith.addi %179, %c31_i32 : i32
        %181 = arith.divsi %180, %c32_i32 : i32
        %182 = arith.minsi %181, %c2_i32 : i32
        %183 = arith.subi %182, %c1_i32 : i32
        %184 = arith.cmpi slt, %13, %183 : i32
        %185 = scf.if %184 -> (tensor<32x128xf32>) {
          hivm.hir.anchor {id = 145 : i64}
          %223 = arith.addi %31, %c32_i32 : i32
          %224 = arith.minsi %223, %28 : i32
          %225 = arith.subi %224, %c1_i32 : i32
          %226 = arith.muli %225, %c12288_i32 : i32
          %227 = arith.index_cast %226 : i32 to index
          %228 = arith.index_cast %33 : i32 to index
          %229 = affine.apply #map5()[%228, %38, %227]
          %reinterpret_cast_88 = memref.reinterpret_cast %arg4 to offset: [%229], sizes: [128], strides: [1] : memref<?xf32> to memref<128xf32, strided<[1], offset: ?>>
          %alloc_89 = memref.alloc() : memref<128xf32>
          %230 = affine.apply #map6()[%228]
          %231 = arith.maxsi %228, %c128 : index
          %232 = arith.minsi %230, %231 : index
          %233 = affine.apply #map4()[%232, %228]
          %234 = arith.cmpi slt, %233, %c128 : index
          %subview_90 = memref.subview %reinterpret_cast_88[0] [%233] [1] : memref<128xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
          %subview_91 = memref.subview %alloc_89[0] [%233] [1] : memref<128xf32> to memref<?xf32, strided<[1]>>
          hivm.hir.anchor {id = 146 : i64}
          hivm.hir.load ins(%subview_90 : memref<?xf32, strided<[1], offset: ?>>) outs(%subview_91 : memref<?xf32, strided<[1]>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 init_out_buffer = true init_condition = %234 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
          hivm.hir.anchor {id = 147 : i64}
          %235 = bufferization.to_tensor %alloc_89 restrict writable : memref<128xf32>
          %236 = arith.addi %13, %c1_i32 : i32
          %expanded_92 = tensor.expand_shape %235 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
          hivm.hir.anchor {id = 148 : i64}
          %237 = scf.for %arg23 = %236 to %182 step %c1_i32 iter_args(%arg24 = %10) -> (tensor<32x128xf32>)  : i32 {
            hivm.hir.anchor {id = 149 : i64}
            %alloc_93 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_93 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<32x128xf32, #hivm.address_space<ub>>
            %alloc_94 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_94 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<32x128xf32, #hivm.address_space<ub>>
            %alloc_95 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_95 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_96 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_96 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            hivm.hir.anchor {id = 150 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 151 : i64}
              %247 = arith.muli %arg23, %c32_i32 : i32
              %248 = arith.addi %29, %247 : i32
              %249 = arith.maxsi %248, %c0_i32 : i32
              %250 = arith.index_cast %249 : i32 to index
              %251 = affine.apply #map1()[%49, %38, %250]
              %reinterpret_cast_97 = memref.reinterpret_cast %arg2 to offset: [%251], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[12288, 1], offset: ?>>
              %reinterpret_cast_98 = memref.reinterpret_cast %arg3 to offset: [%251], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[12288, 1], offset: ?>>
              %reinterpret_cast_99 = memref.reinterpret_cast %arg4 to offset: [%251], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
              %252 = arith.extsi %248 : i32 to i64
              %253 = arith.muli %252, %c96_i64 : i64
              %254 = arith.addi %36, %253 : i64
              %255 = arith.subi %45, %252 : i64
              %256 = arith.maxsi %255, %c0_i64 : i64
              %257 = arith.minsi %256, %c32_i64 : i64
              %258 = arith.minsi %257, %c32_i64 : i64
              hivm.hir.anchor {id = 152 : i64}
              %259 = hivm.hir.stride_load ins(%arg5 : memref<?xf32>) outs(%80 : tensor<32xf32>) offset(%254 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%258 : i64]) {hivm.vf_mode = #hivm.vf_mode<SIMT>} -> tensor<32xf32>
              hivm.hir.anchor {id = 153 : i64}
              %alloc_100 = memref.alloc() : memref<32x128xbf16>
              %260 = affine.apply #map2()[%50, %49, %250]
              %261 = arith.maxsi %260, %c0 : index
              %262 = arith.minsi %261, %c32 : index
              %263 = arith.subi %c0_i32, %248 : i32
              %264 = arith.maxsi %263, %c0_i32 : i32
              %265 = arith.index_cast %264 : i32 to index
              %266 = arith.minsi %265, %262 : index
              %267 = affine.apply #map4()[%262, %266]
              %268 = arith.cmpi slt, %267, %c32 : index
              %269 = arith.ori %268, %69 : i1
              %subview_101 = memref.subview %reinterpret_cast_97[0, 0] [%267, %67] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
              %subview_102 = memref.subview %alloc_100[%266, %66] [%267, %67] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 154 : i64}
              hivm.hir.load ins(%subview_101 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_102 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %86 : index init_out_buffer = true init_condition = %269 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 155 : i64}
              %270 = bufferization.to_tensor %alloc_100 restrict writable : memref<32x128xbf16>
              %alloc_103 = memref.alloc() : memref<32x128xbf16>
              %subview_104 = memref.subview %reinterpret_cast_98[0, 0] [%267, %67] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
              %subview_105 = memref.subview %alloc_103[%266, %66] [%267, %67] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 156 : i64}
              hivm.hir.load ins(%subview_104 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_105 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %86 : index init_out_buffer = true init_condition = %269 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 157 : i64}
              %271 = bufferization.to_tensor %alloc_103 restrict writable : memref<32x128xbf16>
              hivm.hir.anchor {id = 158 : i64}
              %272 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%271 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 159 : i64}
              %expanded_106 = tensor.expand_shape %259 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
              %273 = hivm.hir.vmul ins(%272, %expanded_106 : tensor<32x128xf32>, tensor<32x1xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [1] -> tensor<32x128xf32>
              hivm.hir.anchor {id = 160 : i64}
              %alloc_107 = memref.alloc() : memref<32x128xf32>
              %subview_108 = memref.subview %reinterpret_cast_99[0, 0] [%267, %67] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
              %subview_109 = memref.subview %alloc_107[%266, %66] [%267, %67] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 161 : i64}
              hivm.hir.load ins(%subview_108 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_109 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %71 : index init_out_buffer = true init_condition = %269 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 162 : i64}
              %274 = bufferization.to_tensor %alloc_107 restrict writable : memref<32x128xf32>
              hivm.hir.anchor {id = 163 : i64}
              %275 = hivm.hir.vsub ins(%274, %expanded_92 : tensor<32x128xf32>, tensor<1x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
              hivm.hir.anchor {id = 164 : i64}
              %276 = hivm.hir.vmul ins(%275, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 165 : i64}
              %277 = hivm.hir.vexp ins(%276 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 166 : i64}
              %278 = arith.index_cast %248 : i32 to index
              %279 = affine.apply #map16()[%278]
              %280 = arith.maxsi %278, %50 : index
              %281 = arith.minsi %279, %280 : index
              %282 = affine.apply #map4()[%281, %278]
              %extracted_slice_110 = tensor.extract_slice %277[0, 0] [%282, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x128xf32>
              hivm.hir.anchor {id = 167 : i64}
              %inserted_slice_111 = tensor.insert_slice %extracted_slice_110 into %10[0, 0] [%282, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<?x128xf32> into tensor<32x128xf32>
              hivm.hir.anchor {id = 168 : i64}
              %283 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%270 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 169 : i64}
              %284 = hivm.hir.vmul ins(%283, %inserted_slice_111 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 170 : i64}
              %285 = hivm.hir.vmul ins(%273, %inserted_slice_111 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 171 : i64}
              %expanded_112 = tensor.expand_shape %284 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
              %286 = hivm.hir.vtranspose ins(%expanded_112 : tensor<32x16x8xf32>) outs(%151 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
              hivm.hir.anchor {id = 172 : i64}
              %expanded_113 = tensor.expand_shape %286 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
              annotation.mark %alloc_96 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<14>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 173 : i64}
              hivm.hir.copy ins(%expanded_113 : tensor<16x2x16x8xf32>) outs(%alloc_96 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 174 : i64}
              %expanded_114 = tensor.expand_shape %285 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
              %287 = hivm.hir.vtranspose ins(%expanded_114 : tensor<32x16x8xf32>) outs(%151 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
              hivm.hir.anchor {id = 175 : i64}
              %expanded_115 = tensor.expand_shape %287 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
              annotation.mark %alloc_95 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<15>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 176 : i64}
              hivm.hir.copy ins(%expanded_115 : tensor<16x2x16x8xf32>) outs(%alloc_95 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 177 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 2 : i32, no_inline}
            hivm.hir.anchor {id = 178 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            %242 = bufferization.to_tensor %alloc_96 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %243 = bufferization.to_tensor %alloc_95 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 1
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 179 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 180 : i64}
              %247 = arith.muli %arg23, %c32_i32 : i32
              %248 = arith.addi %29, %247 : i32
              %249 = arith.maxsi %248, %c0_i32 : i32
              %250 = arith.index_cast %249 : i32 to index
              %251 = arith.subi %c0_i32, %248 : i32
              %252 = arith.maxsi %251, %c0_i32 : i32
              %253 = arith.index_cast %252 : i32 to index
              %254 = affine.apply #map7()[%99, %40, %250]
              %reinterpret_cast_97 = memref.reinterpret_cast %arg6 to offset: [%254], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
              %255 = affine.apply #map8()[%50, %99, %250]
              %256 = arith.maxsi %255, %c0 : index
              %257 = arith.minsi %256, %c32 : index
              %258 = arith.minsi %253, %257 : index
              %259 = affine.apply #map4()[%257, %258]
              %260 = arith.cmpi slt, %259, %c32 : index
              %261 = arith.ori %260, %115 : i1
              %subview_98 = memref.subview %reinterpret_cast_97[0, 0] [%259, %113] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
              %262 = affine.apply #map10()[%257, %258]
              %263 = affine.apply #map11()[%106, %112]
              %264 = affine.apply #map12(%258)
              %265 = affine.apply #map13(%112)
              %266 = affine.apply #map14(%258)
              %267 = affine.apply #map15(%112)
              %alloc_99 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_100 = memref.subview %alloc_99[%265, %264, %266, %267] [%263, %262, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 181 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_98 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_100 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %261 : i1
              hivm.hir.anchor {id = 182 : i64}
              %268 = bufferization.to_tensor %alloc_99 restrict writable : memref<4x2x16x8xf32>
              %reinterpret_cast_101 = memref.reinterpret_cast %arg7 to offset: [%254], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
              %subview_102 = memref.subview %reinterpret_cast_101[0, 0] [%259, %113] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
              %alloc_103 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_104 = memref.subview %alloc_103[%265, %264, %266, %267] [%263, %262, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 183 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_102 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_104 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %261 : i1
              hivm.hir.anchor {id = 184 : i64}
              %269 = bufferization.to_tensor %alloc_103 restrict writable : memref<4x2x16x8xf32>
              hivm.hir.anchor {id = 185 : i64}
              %270 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%268, %242, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%157 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 186 : i64}
              annotation.mark %alloc_94 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>} : memref<32x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 187 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%270 : tensor<8x2x16x16xf32>) outs(%alloc_94 : memref<32x128xf32, #hivm.address_space<ub>>)
              hivm.hir.anchor {id = 188 : i64}
              %271 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%269, %243, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%157 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 189 : i64}
              annotation.mark %alloc_93 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>} : memref<32x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 190 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%271 : tensor<8x2x16x16xf32>) outs(%alloc_93 : memref<32x128xf32, #hivm.address_space<ub>>)
              hivm.hir.anchor {id = 191 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 192 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            %244 = bufferization.to_tensor %alloc_94 restrict writable : memref<32x128xf32, #hivm.address_space<ub>>
            %245 = bufferization.to_tensor %alloc_93 restrict writable : memref<32x128xf32, #hivm.address_space<ub>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.anchor {id = 193 : i64}
            %246 = scope.scope : () -> tensor<32x128xf32> {
              hivm.hir.anchor {id = 194 : i64}
              %247 = hivm.hir.vadd ins(%244, %arg24 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 195 : i64}
              %248 = hivm.hir.vadd ins(%245, %247 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 196 : i64}
              scope.return %248 : tensor<32x128xf32>
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 197 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 1
            scf.yield %246 : tensor<32x128xf32>
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop}
          hivm.hir.anchor {id = 198 : i64}
          %238 = hivm.hir.vsub ins(%expanded_92, %72 : tensor<1x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
          hivm.hir.anchor {id = 199 : i64}
          %239 = hivm.hir.vmul ins(%238, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 200 : i64}
          %240 = hivm.hir.vexp ins(%239 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 201 : i64}
          %241 = hivm.hir.vmul ins(%237, %240 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 202 : i64}
          scf.yield %241 : tensor<32x128xf32>
        } else {
          hivm.hir.anchor {id = 203 : i64}
          scf.yield %10 : tensor<32x128xf32>
        }
        %alloc_51 = memref.alloc() : memref<32x128xbf16>
        %subview_52 = memref.subview %alloc_51[%61, %66] [%62, %67] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 204 : i64}
        hivm.hir.load ins(%subview_13 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_52 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %86 : index init_out_buffer = true init_condition = %70 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 205 : i64}
        %186 = bufferization.to_tensor %alloc_51 restrict writable : memref<32x128xbf16>
        hivm.hir.anchor {id = 206 : i64}
        %187 = hivm.hir.stride_load ins(%arg5 : memref<?xf32>) outs(%80 : tensor<32xf32>) offset(%75 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%79 : i64]) {hivm.vf_mode = #hivm.vf_mode<SIMT>} -> tensor<32xf32>
        hivm.hir.anchor {id = 207 : i64}
        %alloc_53 = memref.alloc() : memref<32x32xf32>
        %subview_54 = memref.subview %alloc_53[%107, %112] [%108, %113] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        hivm.hir.anchor {id = 208 : i64}
        hivm.hir.load ins(%subview_21 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_54 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %117 : index init_out_buffer = true init_condition = %116 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 209 : i64}
        %188 = bufferization.to_tensor %alloc_53 restrict writable : memref<32x32xf32>
        hivm.hir.anchor {id = 210 : i64}
        %189 = hivm.hir.vtranspose ins(%188 : tensor<32x32xf32>) outs(%135 : tensor<32x32xf32>) permutation = [1, 0] -> tensor<32x32xf32>
        hivm.hir.anchor {id = 211 : i64}
        %alloc_55 = memref.alloc() : memref<32x32xf32>
        %subview_56 = memref.subview %alloc_55[%107, %112] [%108, %113] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        hivm.hir.anchor {id = 212 : i64}
        hivm.hir.load ins(%subview_24 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_56 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %117 : index init_out_buffer = true init_condition = %116 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 213 : i64}
        %190 = bufferization.to_tensor %alloc_55 restrict writable : memref<32x32xf32>
        hivm.hir.anchor {id = 214 : i64}
        %191 = hivm.hir.vtranspose ins(%190 : tensor<32x32xf32>) outs(%135 : tensor<32x32xf32>) permutation = [1, 0] -> tensor<32x32xf32>
        hivm.hir.anchor {id = 215 : i64}
        %192 = hivm.hir.vcmp ins(%121, %122 : tensor<32x32xi32>, tensor<32x32xi32>) outs(%123 : tensor<32x32xi1>) compare_mode = <le> -> tensor<32x32xi1>
        hivm.hir.anchor {id = 216 : i64}
        %193 = hivm.hir.vsel ins(%192, %189, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%135 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 217 : i64}
        %194 = hivm.hir.vsel ins(%192, %191, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%135 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 218 : i64}
        %195 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%186 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 219 : i64}
        %196 = hivm.hir.vmul ins(%195, %145 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 220 : i64}
        %expanded_57 = tensor.expand_shape %187 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
        %197 = hivm.hir.vmul ins(%149, %expanded_57 : tensor<32x128xf32>, tensor<32x1xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [1] -> tensor<32x128xf32>
        hivm.hir.anchor {id = 221 : i64}
        %198 = hivm.hir.vmul ins(%197, %145 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 222 : i64}
        %expanded_58 = tensor.expand_shape %196 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
        %199 = hivm.hir.vtranspose ins(%expanded_58 : tensor<32x16x8xf32>) outs(%151 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
        hivm.hir.anchor {id = 223 : i64}
        %expanded_59 = tensor.expand_shape %199 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
        %alloc_60 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_60 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<16>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %200 = bufferization.to_tensor %alloc_60 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        hivm.hir.anchor {id = 224 : i64}
        hivm.hir.copy ins(%expanded_59 : tensor<16x2x16x8xf32>) outs(%alloc_60 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 225 : i64}
        %expanded_61 = tensor.expand_shape %193 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %201 = hivm.hir.vtranspose ins(%expanded_61 : tensor<32x4x8xf32>) outs(%154 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 226 : i64}
        %expanded_62 = tensor.expand_shape %201 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_63 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_63 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<17>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %202 = bufferization.to_tensor %alloc_63 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 227 : i64}
        hivm.hir.copy ins(%expanded_62 : tensor<4x2x16x8xf32>) outs(%alloc_63 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 228 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %203 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%202, %200, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%157 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 229 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        %alloc_64 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_64 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast_65 = memref.memory_space_cast %alloc_64 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %204 = bufferization.to_tensor %memspacecast_65 restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
        hivm.hir.anchor {id = 230 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%203 : tensor<8x2x16x16xf32>) outs(%alloc_64 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 231 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %205 = hivm.hir.vmul ins(%204, %148 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 232 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
        %206 = hivm.hir.vadd ins(%185, %205 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 233 : i64}
        %expanded_66 = tensor.expand_shape %198 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
        %207 = hivm.hir.vtranspose ins(%expanded_66 : tensor<32x16x8xf32>) outs(%151 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
        hivm.hir.anchor {id = 234 : i64}
        %expanded_67 = tensor.expand_shape %207 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
        %alloc_68 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_68 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<18>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %208 = bufferization.to_tensor %alloc_68 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        hivm.hir.anchor {id = 235 : i64}
        hivm.hir.copy ins(%expanded_67 : tensor<16x2x16x8xf32>) outs(%alloc_68 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 236 : i64}
        %expanded_69 = tensor.expand_shape %194 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %209 = hivm.hir.vtranspose ins(%expanded_69 : tensor<32x4x8xf32>) outs(%154 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 237 : i64}
        %expanded_70 = tensor.expand_shape %209 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_71 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_71 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<19>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %210 = bufferization.to_tensor %alloc_71 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 238 : i64}
        hivm.hir.copy ins(%expanded_70 : tensor<4x2x16x8xf32>) outs(%alloc_71 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 239 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %211 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%210, %208, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%157 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 240 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        %alloc_72 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_72 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast_73 = memref.memory_space_cast %alloc_72 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %212 = bufferization.to_tensor %memspacecast_73 restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
        hivm.hir.anchor {id = 241 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%211 : tensor<8x2x16x16xf32>) outs(%alloc_72 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 242 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %213 = hivm.hir.vmul ins(%212, %148 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 243 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 8
        %214 = hivm.hir.vadd ins(%206, %213 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 244 : i64}
        %reinterpret_cast_74 = memref.reinterpret_cast %arg10 to offset: [%51], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %reinterpret_cast_75 = memref.reinterpret_cast %arg11 to offset: [%51], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %reinterpret_cast_76 = memref.reinterpret_cast %arg12 to offset: [%51], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %reinterpret_cast_77 = memref.reinterpret_cast %arg13 to offset: [%51], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %215 = hivm.hir.vsub ins(%172, %214 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 245 : i64}
        %216 = hivm.hir.vmul ins(%215, %149 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 246 : i64}
        %alloc_78 = memref.alloc() : memref<32x128xf32>
        %subview_79 = memref.subview %reinterpret_cast_76[0, 0] [%62, %67] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        %subview_80 = memref.subview %alloc_78[%61, %66] [%62, %67] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 247 : i64}
        hivm.hir.load ins(%subview_79 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_80 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %71 : index init_out_buffer = true init_condition = %70 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 248 : i64}
        %217 = bufferization.to_tensor %alloc_78 restrict writable : memref<32x128xf32>
        hivm.hir.anchor {id = 249 : i64}
        %218 = hivm.hir.vadd ins(%216, %217 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 250 : i64}
        %219 = hivm.hir.vadd ins(%174, %218 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 251 : i64}
        %alloc_81 = memref.alloc() : memref<32x128xf32>
        %subview_82 = memref.subview %reinterpret_cast_74[0, 0] [%62, %67] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        %subview_83 = memref.subview %alloc_81[%61, %66] [%62, %67] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 252 : i64}
        hivm.hir.load ins(%subview_82 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_83 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %71 : index init_out_buffer = true init_condition = %70 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 253 : i64}
        %220 = bufferization.to_tensor %alloc_81 restrict writable : memref<32x128xf32>
        hivm.hir.anchor {id = 254 : i64}
        %221 = hivm.hir.vadd ins(%172, %220 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 255 : i64}
        %222 = hivm.hir.vadd ins(%221, %214 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 256 : i64}
        %extracted_slice_84 = tensor.extract_slice %222[%61, %66] [%62, %67] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x?xf32>
        hivm.hir.anchor {id = 257 : i64}
        %subview_85 = memref.subview %reinterpret_cast_75[0, 0] [%62, %67] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        hivm.hir.store ins(%extracted_slice_84 : tensor<?x?xf32>) outs(%subview_85 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 258 : i64}
        %extracted_slice_86 = tensor.extract_slice %219[%61, %66] [%62, %67] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x?xf32>
        hivm.hir.anchor {id = 259 : i64}
        %subview_87 = memref.subview %reinterpret_cast_77[0, 0] [%62, %67] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        hivm.hir.store ins(%extracted_slice_86 : tensor<?x?xf32>) outs(%subview_87 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 260 : i64}
      }
      hivm.hir.set_ctrl true at ctrl[60]
      hivm.hir.anchor {id = 261 : i64}
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 1
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
    hivm.hir.anchor {id = 262 : i64}
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_3_outlined_merged_vf_0(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>, %arg3: memref<16xf32, #hivm.address_space<ub>>, %arg4: memref<16x128xbf16, #hivm.address_space<ub>>, %arg5: memref<16x128xf32, #hivm.address_space<ub>>, %arg6: memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    scf.for %arg7 = %c0 to %c16 step %c1 {
      scf.for %arg8 = %c0 to %c16 step %c8 {
        %0 = affine.apply #map17(%arg8)
        %subview = memref.subview %arg0[%arg7, %0] [1, 64] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg7, %0] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
        %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = arith.extf %1 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
        %4 = arith.mulf %3, %2 : vector<1x64xf32>
        %subview_2 = memref.subview %arg2[%arg8, %arg7, 0] [8, 1, 8] [1, 1, 1] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> to memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
        %5 = vector.shape_cast %4 : vector<1x64xf32> to vector<8x1x8xf32>
        vector.transfer_write %5, %subview_2[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<8x1x8xf32>, memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
      } {unroll_for_vsstb}
    }
    scf.for %arg7 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg3[%arg7] [1] [1] : memref<16xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map18} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      scf.for %arg8 = %c0 to %c16 step %c8 {
        %1 = affine.apply #map17(%arg8)
        %subview_1 = memref.subview %arg4[%arg7, %1] [1, 64] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg5[%arg7, %1] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
        %3 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %4 = arith.extf %2 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
        %5 = arith.mulf %4, %0 : vector<1x64xf32>
        %6 = arith.mulf %5, %3 : vector<1x64xf32>
        %subview_3 = memref.subview %arg6[%arg8, %arg7, 0] [8, 1, 8] [1, 1, 1] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> to memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
        %7 = vector.shape_cast %6 : vector<1x64xf32> to vector<8x1x8xf32>
        vector.transfer_write %7, %subview_3[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<8x1x8xf32>, memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
      } {unroll_for_vsstb}
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg15: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg16: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32) attributes {DirectlyUsedGMArgIdxList = [5, 5, 14, 5], SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<22xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
    %c28_i32 = arith.constant 28 : i32
    %c1_i32 = arith.constant 1 : i32
    %true = arith.constant true
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %c31_i32 = arith.constant 31 : i32
    %c0_i32 = arith.constant 0 : i32
    %c32 = arith.constant 32 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c96_i32 = arith.constant 96 : i32
    %c2_i32 = arith.constant 2 : i32
    %c64_i32 = arith.constant 64 : i32
    %c32_i32 = arith.constant 32 : i32
    hivm.hir.anchor {id = 0 : i64}
    %0 = arith.muli %arg19, %arg20 : i32
    %1 = arith.muli %0, %arg21 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
    hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
    hivm.hir.anchor {id = 1 : i64}
    scf.for %arg22 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %4 = arith.remsi %arg22, %arg19 : i32
      %5 = arith.divsi %arg22, %arg19 : i32
      %6 = arith.remsi %5, %arg20 : i32
      %7 = arith.divsi %arg22, %0 : i32
      %8 = arith.remsi %7, %arg21 : i32
      hivm.hir.anchor {id = 3 : i64}
      hivm.hir.anchor {id = 4 : i64}
      %9 = arith.remsi %8, %c96_i32 : i32
      %10 = arith.remsi %4, %c2_i32 : i32
      %11 = arith.muli %6, %c2_i32 : i32
      %12 = arith.index_cast %11 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg16 to offset: [%12], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %13 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 5 : i64}
      %14 = arith.trunci %13 : i64 to i32
      %15 = affine.apply #map()[%12]
      %reinterpret_cast_0 = memref.reinterpret_cast %arg16 to offset: [%15], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %16 = memref.load %reinterpret_cast_0[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 6 : i64}
      %17 = arith.trunci %16 : i64 to i32
      %18 = arith.index_cast %14 : i32 to index
      %reinterpret_cast_1 = memref.reinterpret_cast %arg15 to offset: [%18], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %19 = memref.load %reinterpret_cast_1[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 7 : i64}
      %20 = arith.trunci %19 : i64 to i32
      %21 = affine.apply #map()[%18]
      %reinterpret_cast_2 = memref.reinterpret_cast %arg15 to offset: [%21], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %22 = memref.load %reinterpret_cast_2[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 8 : i64}
      %23 = arith.trunci %22 : i64 to i32
      %24 = arith.subi %23, %20 : i32
      %25 = arith.muli %17, %c64_i32 : i32
      %26 = arith.muli %10, %c32_i32 : i32
      %27 = arith.addi %25, %26 : i32
      %28 = arith.cmpi sge, %27, %24 : i32
      scf.if %28 {
        hivm.hir.anchor {id = 9 : i64}
      } else {
        hivm.hir.anchor {id = 10 : i64}
        %29 = arith.muli %20, %c96_i32 : i32
        %30 = arith.addi %29, %9 : i32
        %31 = arith.muli %30, %c64_i32 : i32
        %32 = arith.index_cast %31 : i32 to index
        %33 = arith.maxsi %27, %c0_i32 : i32
        %34 = arith.index_cast %33 : i32 to index
        %35 = arith.index_cast %24 : i32 to index
        %36 = arith.subi %c0_i32, %27 : i32
        %37 = arith.maxsi %36, %c0_i32 : i32
        %38 = arith.index_cast %37 : i32 to index
        hivm.hir.anchor {id = 11 : i64}
        hivm.hir.anchor {id = 12 : i64}
        hivm.hir.anchor {id = 13 : i64}
        hivm.hir.anchor {id = 14 : i64}
        %39 = arith.cmpi sgt, %10, %c0_i32 : i32
        scf.if %39 {
          hivm.hir.anchor {id = 15 : i64}
          hivm.hir.anchor {id = 16 : i64}
          hivm.hir.anchor {id = 17 : i64}
          %alloca = memref.alloca() {normalize_matmul_counter = 0 : i32} : memref<i32>
          hivm.hir.anchor {id = 18 : i64}
          memref.store %c0_i32, %alloca[] : memref<i32>
          hivm.hir.anchor {id = 19 : i64}
          %alloca_18 = memref.alloca() {normalize_matmul_counter = 1 : i32} : memref<i32>
          hivm.hir.anchor {id = 20 : i64}
          memref.store %c0_i32, %alloca_18[] : memref<i32>
          hivm.hir.anchor {id = 21 : i64}
          %alloc_19 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
          %alloc_20 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
          scf.for %arg23 = %c0_i32 to %10 step %c1_i32  : i32 {
            hivm.hir.anchor {id = 22 : i64}
            %alloc_23 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_23 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_24 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_24 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.anchor {id = 23 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 24 : i64}
              hivm.hir.anchor {id = 25 : i64}
              hivm.hir.anchor {id = 26 : i64}
              hivm.hir.anchor {id = 27 : i64}
              hivm.hir.anchor {id = 28 : i64}
              hivm.hir.anchor {id = 29 : i64}
              hivm.hir.anchor {id = 30 : i64}
              hivm.hir.anchor {id = 31 : i64}
              hivm.hir.anchor {id = 32 : i64}
              hivm.hir.anchor {id = 33 : i64}
              hivm.hir.anchor {id = 34 : i64}
              hivm.hir.anchor {id = 35 : i64}
              annotation.mark %alloc_24 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 36 : i64}
              hivm.hir.anchor {id = 37 : i64}
              annotation.mark %alloc_23 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 38 : i64}
              hivm.hir.anchor {id = 39 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 40 : i64}
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 41 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 42 : i64}
              %61 = arith.muli %arg23, %c32_i32 : i32
              %62 = arith.maxsi %61, %c0_i32 : i32
              %63 = arith.index_cast %62 : i32 to index
              %64 = affine.apply #map7()[%63, %32, %34]
              %reinterpret_cast_25 = memref.reinterpret_cast %arg6 to offset: [%64], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_26 = memref.reinterpret_cast %arg7 to offset: [%64], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %65 = affine.apply #map8()[%35, %63, %34]
              %66 = arith.maxsi %65, %c0 : index
              %67 = arith.minsi %66, %c32 : index
              %68 = affine.apply #map9()[%63]
              %69 = arith.maxsi %68, %c0 : index
              %70 = arith.minsi %69, %c32 : index
              %71 = arith.minsi %38, %67 : index
              %72 = affine.apply #map4()[%67, %71]
              %73 = arith.subi %c0_i32, %61 : i32
              %74 = arith.maxsi %73, %c0_i32 : i32
              %75 = arith.index_cast %74 : i32 to index
              %76 = arith.minsi %75, %70 : index
              %77 = affine.apply #map4()[%70, %76]
              %78 = arith.cmpi slt, %72, %c32 : index
              %79 = arith.cmpi slt, %77, %c32 : index
              %80 = arith.ori %78, %79 : i1
              %subview = memref.subview %reinterpret_cast_25[0, 0] [%72, %77] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %81 = affine.apply #map10()[%67, %71]
              %82 = affine.apply #map11()[%70, %76]
              %83 = affine.apply #map12(%71)
              %84 = affine.apply #map13(%76)
              %85 = affine.apply #map14(%71)
              %86 = affine.apply #map15(%76)
              %alloc_27 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_28 = memref.subview %alloc_27[%84, %83, %85, %86] [%82, %81, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 43 : i64}
              scf.if %80 {
                %collapse_shape = memref.collapse_shape %alloc_27 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_28 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 44 : i64}
              %subview_29 = memref.subview %reinterpret_cast_26[0, 0] [%72, %77] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %alloc_30 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_31 = memref.subview %alloc_30[%84, %83, %85, %86] [%82, %81, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 45 : i64}
              scf.if %80 {
                %collapse_shape = memref.collapse_shape %alloc_30 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_29 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_31 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 46 : i64}
              hivm.hir.anchor {id = 47 : i64}
              %87 = memref.load %alloca[] : memref<i32>
              hivm.hir.anchor {id = 48 : i64}
              %88 = arith.cmpi eq, %87, %c0_i32 : i32
              hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%alloc_27, %alloc_24, %88, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_19 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 49 : i64}
              %89 = arith.addi %87, %c1_i32 : i32
              memref.store %89, %alloca[] : memref<i32>
              hivm.hir.anchor {id = 50 : i64}
              %90 = memref.load %alloca_18[] : memref<i32>
              hivm.hir.anchor {id = 51 : i64}
              %91 = arith.cmpi eq, %90, %c0_i32 : i32
              hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%alloc_30, %alloc_23, %91, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_20 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 52 : i64}
              %92 = arith.addi %90, %c1_i32 : i32
              memref.store %92, %alloca_18[] : memref<i32>
              hivm.hir.anchor {id = 53 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 54 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop, may_not_exec, normalized_in_L0C = [0 : i32, 1 : i32]}
          hivm.hir.anchor {id = 55 : i64}
          %57 = memref.load %alloca[] : memref<i32>
          hivm.hir.anchor {id = 56 : i64}
          %58 = arith.cmpi eq, %57, %c0_i32 : i32
          %alloc_21 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_21 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.anchor {id = 57 : i64}
          scf.if %58 {
            hivm.hir.anchor {id = 58 : i64}
          } else {
            hivm.hir.anchor {id = 59 : i64}
            hivm.hir.anchor {id = 60 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_19 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_21 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.anchor {id = 61 : i64}
          }
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 62 : i64}
          %59 = memref.load %alloca_18[] : memref<i32>
          hivm.hir.anchor {id = 63 : i64}
          %60 = arith.cmpi eq, %59, %c0_i32 : i32
          %alloc_22 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_22 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
          hivm.hir.anchor {id = 64 : i64}
          scf.if %60 {
            hivm.hir.anchor {id = 65 : i64}
          } else {
            hivm.hir.anchor {id = 66 : i64}
            hivm.hir.anchor {id = 67 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_20 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_22 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.anchor {id = 68 : i64}
          }
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 69 : i64}
          hivm.hir.anchor {id = 70 : i64}
          hivm.hir.anchor {id = 71 : i64}
          hivm.hir.anchor {id = 72 : i64}
          hivm.hir.anchor {id = 73 : i64}
          hivm.hir.anchor {id = 74 : i64}
        } else {
          hivm.hir.anchor {id = 75 : i64}
        }
        hivm.hir.anchor {id = 76 : i64}
        hivm.hir.anchor {id = 77 : i64}
        hivm.hir.anchor {id = 78 : i64}
        hivm.hir.anchor {id = 79 : i64}
        hivm.hir.anchor {id = 80 : i64}
        hivm.hir.anchor {id = 81 : i64}
        hivm.hir.anchor {id = 82 : i64}
        hivm.hir.anchor {id = 83 : i64}
        hivm.hir.anchor {id = 84 : i64}
        %40 = arith.maxsi %26, %c0_i32 : i32
        %41 = arith.index_cast %40 : i32 to index
        %42 = affine.apply #map9()[%41]
        %43 = arith.maxsi %42, %c0 : index
        %44 = arith.minsi %43, %c32 : index
        %45 = arith.subi %c0_i32, %26 : i32
        %46 = arith.maxsi %45, %c0_i32 : i32
        %47 = arith.index_cast %46 : i32 to index
        %48 = arith.minsi %47, %44 : index
        %49 = affine.apply #map4()[%44, %48]
        %50 = arith.cmpi slt, %49, %c32 : index
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
        hivm.hir.anchor {id = 97 : i64}
        hivm.hir.anchor {id = 98 : i64}
        hivm.hir.anchor {id = 99 : i64}
        hivm.hir.anchor {id = 100 : i64}
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
        %alloc = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 112 : i64}
        hivm.hir.anchor {id = 113 : i64}
        hivm.hir.anchor {id = 114 : i64}
        %alloc_3 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_3 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 115 : i64}
        hivm.hir.anchor {id = 116 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_3, %alloc, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_4 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 117 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        %alloc_5 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_5 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.anchor {id = 118 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_4 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_5 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 119 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.anchor {id = 120 : i64}
        hivm.hir.anchor {id = 121 : i64}
        %alloc_6 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_6 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 122 : i64}
        hivm.hir.anchor {id = 123 : i64}
        hivm.hir.anchor {id = 124 : i64}
        %alloc_7 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_7 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 125 : i64}
        hivm.hir.anchor {id = 126 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_8 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_7, %alloc_6, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_8 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 127 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        %alloc_9 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_9 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.anchor {id = 128 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_8 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_9 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 129 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
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
        %51 = arith.subi %24, %25 : i32
        %52 = arith.addi %51, %c31_i32 : i32
        %53 = arith.divsi %52, %c32_i32 : i32
        %54 = arith.minsi %53, %c2_i32 : i32
        %55 = arith.subi %54, %c1_i32 : i32
        %56 = arith.cmpi slt, %10, %55 : i32
        scf.if %56 {
          hivm.hir.anchor {id = 145 : i64}
          hivm.hir.anchor {id = 146 : i64}
          hivm.hir.anchor {id = 147 : i64}
          %57 = arith.addi %10, %c1_i32 : i32
          hivm.hir.anchor {id = 148 : i64}
          scf.for %arg23 = %57 to %54 step %c1_i32  : i32 {
            hivm.hir.anchor {id = 149 : i64}
            %alloc_18 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_18 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_19 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_19 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_20 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_20 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_21 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.anchor {id = 150 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 151 : i64}
              hivm.hir.anchor {id = 152 : i64}
              hivm.hir.anchor {id = 153 : i64}
              hivm.hir.anchor {id = 154 : i64}
              hivm.hir.anchor {id = 155 : i64}
              hivm.hir.anchor {id = 156 : i64}
              hivm.hir.anchor {id = 157 : i64}
              hivm.hir.anchor {id = 158 : i64}
              hivm.hir.anchor {id = 159 : i64}
              hivm.hir.anchor {id = 160 : i64}
              hivm.hir.anchor {id = 161 : i64}
              hivm.hir.anchor {id = 162 : i64}
              hivm.hir.anchor {id = 163 : i64}
              hivm.hir.anchor {id = 164 : i64}
              hivm.hir.anchor {id = 165 : i64}
              hivm.hir.anchor {id = 166 : i64}
              hivm.hir.anchor {id = 167 : i64}
              hivm.hir.anchor {id = 168 : i64}
              hivm.hir.anchor {id = 169 : i64}
              hivm.hir.anchor {id = 170 : i64}
              hivm.hir.anchor {id = 171 : i64}
              hivm.hir.anchor {id = 172 : i64}
              annotation.mark %alloc_21 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<14>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 173 : i64}
              hivm.hir.anchor {id = 174 : i64}
              hivm.hir.anchor {id = 175 : i64}
              annotation.mark %alloc_20 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<15>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 176 : i64}
              hivm.hir.anchor {id = 177 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 2 : i32, no_inline}
            hivm.hir.anchor {id = 178 : i64}
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 1
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 179 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 180 : i64}
              %58 = arith.muli %arg23, %c32_i32 : i32
              %59 = arith.addi %25, %58 : i32
              %60 = arith.maxsi %59, %c0_i32 : i32
              %61 = arith.index_cast %60 : i32 to index
              %62 = arith.subi %c0_i32, %59 : i32
              %63 = arith.maxsi %62, %c0_i32 : i32
              %64 = arith.index_cast %63 : i32 to index
              %65 = affine.apply #map7()[%41, %32, %61]
              %reinterpret_cast_22 = memref.reinterpret_cast %arg6 to offset: [%65], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %66 = affine.apply #map8()[%35, %41, %61]
              %67 = arith.maxsi %66, %c0 : index
              %68 = arith.minsi %67, %c32 : index
              %69 = arith.minsi %64, %68 : index
              %70 = affine.apply #map4()[%68, %69]
              %71 = arith.cmpi slt, %70, %c32 : index
              %72 = arith.ori %71, %50 : i1
              %subview = memref.subview %reinterpret_cast_22[0, 0] [%70, %49] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %73 = affine.apply #map10()[%68, %69]
              %74 = affine.apply #map11()[%44, %48]
              %75 = affine.apply #map12(%69)
              %76 = affine.apply #map13(%48)
              %77 = affine.apply #map14(%69)
              %78 = affine.apply #map15(%48)
              %alloc_23 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_24 = memref.subview %alloc_23[%76, %75, %77, %78] [%74, %73, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 181 : i64}
              scf.if %72 {
                %collapse_shape = memref.collapse_shape %alloc_23 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_24 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 182 : i64}
              %reinterpret_cast_25 = memref.reinterpret_cast %arg7 to offset: [%65], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_26 = memref.subview %reinterpret_cast_25[0, 0] [%70, %49] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %alloc_27 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_28 = memref.subview %alloc_27[%76, %75, %77, %78] [%74, %73, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 183 : i64}
              scf.if %72 {
                %collapse_shape = memref.collapse_shape %alloc_27 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_26 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_28 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 184 : i64}
              hivm.hir.anchor {id = 185 : i64}
              %alloc_29 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
              hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_23, %alloc_21, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_29 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 186 : i64}
              annotation.mark %alloc_19 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 187 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_29 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_19 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.anchor {id = 188 : i64}
              %alloc_30 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
              hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_27, %alloc_20, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_30 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 189 : i64}
              annotation.mark %alloc_18 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 190 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_30 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_18 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.anchor {id = 191 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 192 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            hivm.hir.anchor {id = 193 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 194 : i64}
              hivm.hir.anchor {id = 195 : i64}
              hivm.hir.anchor {id = 196 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 197 : i64}
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop}
          hivm.hir.anchor {id = 198 : i64}
          hivm.hir.anchor {id = 199 : i64}
          hivm.hir.anchor {id = 200 : i64}
          hivm.hir.anchor {id = 201 : i64}
          hivm.hir.anchor {id = 202 : i64}
        } else {
          hivm.hir.anchor {id = 203 : i64}
        }
        hivm.hir.anchor {id = 204 : i64}
        hivm.hir.anchor {id = 205 : i64}
        hivm.hir.anchor {id = 206 : i64}
        hivm.hir.anchor {id = 207 : i64}
        hivm.hir.anchor {id = 208 : i64}
        hivm.hir.anchor {id = 209 : i64}
        hivm.hir.anchor {id = 210 : i64}
        hivm.hir.anchor {id = 211 : i64}
        hivm.hir.anchor {id = 212 : i64}
        hivm.hir.anchor {id = 213 : i64}
        hivm.hir.anchor {id = 214 : i64}
        hivm.hir.anchor {id = 215 : i64}
        hivm.hir.anchor {id = 216 : i64}
        hivm.hir.anchor {id = 217 : i64}
        hivm.hir.anchor {id = 218 : i64}
        hivm.hir.anchor {id = 219 : i64}
        hivm.hir.anchor {id = 220 : i64}
        hivm.hir.anchor {id = 221 : i64}
        hivm.hir.anchor {id = 222 : i64}
        hivm.hir.anchor {id = 223 : i64}
        %alloc_10 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_10 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<16>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 224 : i64}
        hivm.hir.anchor {id = 225 : i64}
        hivm.hir.anchor {id = 226 : i64}
        %alloc_11 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_11 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<17>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 227 : i64}
        hivm.hir.anchor {id = 228 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_12 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_11, %alloc_10, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_12 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 229 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        %alloc_13 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_13 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
        hivm.hir.anchor {id = 230 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_12 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_13 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 231 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.anchor {id = 232 : i64}
        hivm.hir.anchor {id = 233 : i64}
        hivm.hir.anchor {id = 234 : i64}
        %alloc_14 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_14 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<18>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 235 : i64}
        hivm.hir.anchor {id = 236 : i64}
        hivm.hir.anchor {id = 237 : i64}
        %alloc_15 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_15 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<19>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 238 : i64}
        hivm.hir.anchor {id = 239 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_16 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_15, %alloc_14, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_16 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 240 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        %alloc_17 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_17 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
        hivm.hir.anchor {id = 241 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_16 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_17 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 242 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.anchor {id = 243 : i64}
        hivm.hir.anchor {id = 244 : i64}
        hivm.hir.anchor {id = 245 : i64}
        hivm.hir.anchor {id = 246 : i64}
        hivm.hir.anchor {id = 247 : i64}
        hivm.hir.anchor {id = 248 : i64}
        hivm.hir.anchor {id = 249 : i64}
        hivm.hir.anchor {id = 250 : i64}
        hivm.hir.anchor {id = 251 : i64}
        hivm.hir.anchor {id = 252 : i64}
        hivm.hir.anchor {id = 253 : i64}
        hivm.hir.anchor {id = 254 : i64}
        hivm.hir.anchor {id = 255 : i64}
        hivm.hir.anchor {id = 256 : i64}
        hivm.hir.anchor {id = 257 : i64}
        hivm.hir.anchor {id = 258 : i64}
        hivm.hir.anchor {id = 259 : i64}
        hivm.hir.anchor {id = 260 : i64}
      }
      hivm.hir.set_ctrl true at ctrl[60]
      hivm.hir.anchor {id = 261 : i64}
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 1
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
    hivm.hir.anchor {id = 262 : i64}
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_0_outlined_vf_0(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>, %arg1: memref<128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>, %arg3: memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.693147182> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c16 step %c1 {
      scf.for %arg5 = %c0 to %c16 step %c8 {
        %0 = affine.apply #map17(%arg5)
        %subview = memref.subview %arg0[%arg4, %0] [1, 64] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg1[%0] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg2[%arg4, %0] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
        %2 = vector.transfer_read %subview_2[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map19} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = vector.transfer_read %subview_3[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %4 = arith.subf %2, %3 : vector<1x64xf32>
        %5 = arith.mulf %4, %cst : vector<1x64xf32>
        %6 = math.exp %5 : vector<1x64xf32>
        %7 = arith.extf %1 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
        %8 = arith.mulf %7, %6 : vector<1x64xf32>
        %subview_4 = memref.subview %arg3[%arg5, %arg4, 0] [8, 1, 8] [1, 1, 1] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> to memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
        %9 = vector.shape_cast %8 : vector<1x64xf32> to vector<8x1x8xf32>
        vector.transfer_write %9, %subview_4[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<8x1x8xf32>, memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
      } {unroll_for_vsstb}
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_1_outlined_vf_0(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>, %arg3: memref<16x128xf32, #hivm.address_space<ub>>, %arg4: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.693147182> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg5 = %c0 to %c16 step %c1 {
      scf.for %arg6 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg5, %arg6] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg6] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg2[%arg5, %arg6] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map19} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.subf %0, %1 : vector<1x64xf32>
        %3 = arith.mulf %2, %cst : vector<1x64xf32>
        %4 = math.exp %3 : vector<1x64xf32>
        vector.transfer_write %4, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg5 = %c0 to %c16 step %c1 {
      scf.for %arg6 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg3[%arg5, %arg6] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg5, %arg6] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg4[%arg5, %arg6] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_3_outlined_vf_0(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.693147182> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg4] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map19} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.subf %0, %1 : vector<1x64xf32>
        %3 = arith.mulf %2, %cst : vector<1x64xf32>
        %4 = math.exp %3 : vector<1x64xf32>
        vector.transfer_write %4, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_4_outlined_vf_0(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>, %arg3: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c16 step %c1 {
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg4, %arg5] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg4, %arg5] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg4, %arg5] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg3[%arg4, %arg5] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = arith.addf %1, %2 : vector<1x64xf32>
        %4 = arith.addf %0, %3 : vector<1x64xf32>
        vector.transfer_write %4, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_5_outlined_vf_0(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>, %arg3: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.693147182> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c16 step %c1 {
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg4, %arg5] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg5] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg2[%arg4, %arg5] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg3[%arg4, %arg5] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map19} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.transfer_read %subview_2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = arith.subf %1, %2 : vector<1x64xf32>
        %4 = arith.mulf %3, %cst : vector<1x64xf32>
        %5 = math.exp %4 : vector<1x64xf32>
        %6 = arith.mulf %0, %5 : vector<1x64xf32>
        vector.transfer_write %6, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_6_outlined_vf_0(%arg0: index, %arg1: memref<32x128xf32, #hivm.address_space<ub>>, %arg2: memref<1x128xf32, #hivm.address_space<ub>>, %arg3: memref<16x128xbf16, #hivm.address_space<ub>>, %arg4: memref<16x128xf32, #hivm.address_space<ub>>, %arg5: memref<16x128xf32, #hivm.address_space<ub>>, %arg6: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : bf16
    %cst_0 = arith.constant dense<0.693147182> : vector<1x64xf32>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg7 = %c0 to %c16 step %c1 {
      %0 = affine.apply #map20()[%arg7, %arg0]
      scf.for %arg8 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg1[%0, %arg8] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg2[0, %arg8] [1, 64] [1, 1] : memref<1x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg4[%arg7, %arg8] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.transfer_read %subview_2[%c0, %c0], %cst_1 {in_bounds = [true, true], permutation_map = #map21} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = arith.subf %1, %2 : vector<1x64xf32>
        vector.transfer_write %3, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_4 = memref.subview %arg5[%arg7, %arg8] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst_0, %subview_4[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_5 = memref.subview %arg3[%arg7, %arg8] [1, 64] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_6 = memref.subview %arg6[%arg7, %arg8] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_5[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
        %5 = arith.extf %4 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
        vector.transfer_write %5, %subview_6[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_6_outlined_vf_1(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>, %arg3: memref<16x128xf32, #hivm.address_space<ub>>, %arg4: memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.693147182> : vector<1x64xf32>
    %cst_0 = arith.constant dense<-1.000000e+00> : vector<1x64xf32>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg5 = %c0 to %c16 step %c1 {
      scf.for %arg6 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg5, %arg6] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg1[%arg5, %arg6] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = arith.mulf %0, %cst_0 : vector<1x64xf32>
        %2 = arith.mulf %1, %cst : vector<1x64xf32>
        %3 = math.exp %2 : vector<1x64xf32>
        vector.transfer_write %3, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg5 = %c0 to %c16 step %c1 {
      scf.for %arg6 = %c0 to %c16 step %c8 {
        %0 = affine.apply #map17(%arg6)
        %subview = memref.subview %arg0[%arg5, %0] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg3[%arg5, %0] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %1, %cst : vector<1x64xf32>
        %3 = math.exp %2 : vector<1x64xf32>
        vector.transfer_write %3, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg2[%arg5, %0] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_4 = memref.subview %arg1[%arg5, %0] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_3[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = vector.transfer_read %subview_4[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %6 = arith.mulf %4, %5 : vector<1x64xf32>
        %subview_5 = memref.subview %arg4[%arg6, %arg5, 0] [8, 1, 8] [1, 1, 1] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> to memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
        %7 = vector.shape_cast %6 : vector<1x64xf32> to vector<8x1x8xf32>
        vector.transfer_write %7, %subview_5[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<8x1x8xf32>, memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
      } {unroll_for_vsstb}
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_7_outlined_vf_0(%arg0: index, %arg1: memref<1x32xi32, #hivm.address_space<ub>>, %arg2: i32, %arg3: i32, %arg4: memref<1x16xi1, strided<[256, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %subview = memref.subview %arg1[0, %arg0] [1, 16] [1, 1] : memref<1x32xi32, #hivm.address_space<ub>> to memref<1x16xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
    %0 = vector.constant_mask [1, 16] : vector<1x64xi1>
    %1 = vector.transfer_read %subview[%c0, %c0], %c0_i32, %0 {in_bounds = [true, true]} : memref<1x16xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
    %2 = vector.broadcast %arg2 : i32 to vector<1x64xi32>
    %3 = arith.addi %1, %2 : vector<1x64xi32>
    %4 = vector.broadcast %arg3 : i32 to vector<1x64xi32>
    %5 = arith.cmpi slt, %3, %4 : vector<1x64xi32>
    vector.transfer_write %5, %arg4[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xi1>, memref<1x16xi1, strided<[256, 1]>, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_8_outlined_vf_0(%arg0: memref<32x32xi32, #hivm.address_space<ub>>, %arg1: index, %arg2: memref<32x32xi32, #hivm.address_space<ub>>, %arg3: memref<16xi1, strided<[1]>, #hivm.address_space<ub>>, %arg4: memref<32x16xf32, #hivm.address_space<ub>>, %arg5: memref<32x16xf32, #hivm.address_space<ub>>, %arg6: memref<32x16xf32, #hivm.address_space<ub>>, %arg7: memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant dense<0.000000e+00> : vector<1x64xf16>
    %cst_2 = arith.constant dense<-1.000000e+00> : vector<1x64xf16>
    %false = arith.constant false
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 16] : vector<1x64xi1>
    %1 = vector.constant_mask [16] : vector<64xi1>
    %2 = vector.transfer_read %arg3[%c0], %false, %1 {in_bounds = [true, true], permutation_map = #map19} : memref<16xi1, strided<[1]>, #hivm.address_space<ub>>, vector<1x64xi1>
    %3 = arith.select %2, %cst_2, %cst_1 : vector<1x64xi1>, vector<1x64xf16>
    %4 = arith.cmpf une, %3, %cst_1 : vector<1x64xf16>
    %5 = vector.constant_mask [2, 1, 8] : vector<8x1x8xi1>
    scf.for %arg8 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg6[%arg8, 0] [1, 16] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_3 = memref.subview %arg0[%arg8, %arg1] [1, 16] [1, 1] : memref<32x32xi32, #hivm.address_space<ub>> to memref<1x16xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_4 = memref.subview %arg2[%arg8, %arg1] [1, 16] [1, 1] : memref<32x32xi32, #hivm.address_space<ub>> to memref<1x16xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %6 = vector.transfer_read %subview_3[%c0, %c0], %c0_i32, %0 {in_bounds = [true, true]} : memref<1x16xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %7 = vector.transfer_read %subview_4[%c0, %c0], %c0_i32, %0 {in_bounds = [true, true]} : memref<1x16xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %8 = arith.cmpi sge, %6, %7 : vector<1x64xi32>
      %9 = arith.andi %8, %4 : vector<1x64xi1>
      %subview_5 = memref.subview %arg4[%arg8, 0] [1, 16] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
      %10 = vector.transfer_read %subview_5[%c0, %c0], %cst_0, %0 {in_bounds = [true, true]} : memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %11 = arith.select %9, %10, %cst : vector<1x64xi1>, vector<1x64xf32>
      vector.transfer_write %11, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_6 = memref.subview %arg7[0, %arg8, 0] [2, 1, 8] [1, 1, 1] : memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>> to memref<2x1x8xf32, strided<[264, 8, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_7 = memref.subview %arg5[%arg8, 0] [1, 16] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
      %12 = vector.transfer_read %subview_7[%c0, %c0], %cst_0, %0 {in_bounds = [true, true]} : memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %13 = arith.select %9, %12, %cst : vector<1x64xi1>, vector<1x64xf32>
      %14 = vector.shape_cast %13 : vector<1x64xf32> to vector<8x1x8xf32>
      vector.transfer_write %14, %subview_6[%c0, %c0, %c0], %5 {in_bounds = [true, true, true]} : vector<8x1x8xf32>, memref<2x1x8xf32, strided<[264, 8, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_9_outlined_vf_0(%arg0: memref<32x16xf32, #hivm.address_space<ub>>, %arg1: memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [2, 1, 8] : vector<8x1x8xi1>
    scf.for %arg2 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg1[0, %arg2, 0] [2, 1, 8] [1, 1, 1] : memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>> to memref<2x1x8xf32, strided<[264, 8, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg0[%arg2, 0] [1, 16] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, false]} : memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = vector.shape_cast %1 : vector<1x64xf32> to vector<8x1x8xf32>
      vector.transfer_write %2, %subview[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : vector<8x1x8xf32>, memref<2x1x8xf32, strided<[264, 8, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_10_outlined_vf_0(%arg0: memref<16xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>, %arg3: memref<16x128xf32, #hivm.address_space<ub>>, %arg4: memref<16xf32, #hivm.address_space<ub>>, %arg5: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg6 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg4[%arg6] [1] [1] : memref<16xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg0[%arg6] [1] [1] : memref<16xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview_1[%c0], %cst {in_bounds = [true, true], permutation_map = #map18} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = scf.for %arg7 = %c0 to %c128 step %c64 iter_args(%arg8 = %cst_0) -> (vector<1x64xf32>) {
        %subview_2 = memref.subview %arg1[%arg6, %arg7] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg2[%arg6, %arg7] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %6 = arith.addf %4, %5 : vector<1x64xf32>
        %subview_4 = memref.subview %arg3[%arg6, %arg7] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %7 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %8 = arith.mulf %6, %7 : vector<1x64xf32>
        %9 = arith.addf %8, %arg8 {reductionOp} : vector<1x64xf32>
        %subview_5 = memref.subview %arg5[%arg6, %arg7] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = arith.mulf %6, %0 : vector<1x64xf32>
        vector.transfer_write %10, %subview_5[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        scf.yield %9 : vector<1x64xf32>
      } {reductionLoop}
      %2 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true]} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1xf32>
      %3 = vector.multi_reduction <add>, %1, %2 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
      vector.transfer_write %3, %subview[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_11_outlined_vf_0(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
        %1 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.extf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
        %3 = arith.mulf %2, %1 : vector<1x64xf32>
        vector.transfer_write %3, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_12_outlined_vf_0(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16 step %c1 {
      scf.for %arg4 = %c0 to %c16 step %c8 {
        %0 = affine.apply #map17(%arg4)
        %subview = memref.subview %arg0[%arg3, %0] [1, 64] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg3, %0] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
        %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = arith.extf %1 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
        %4 = arith.mulf %3, %2 : vector<1x64xf32>
        %subview_2 = memref.subview %arg2[%arg4, %arg3, 0] [8, 1, 8] [1, 1, 1] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> to memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
        %5 = vector.shape_cast %4 : vector<1x64xf32> to vector<8x1x8xf32>
        vector.transfer_write %5, %subview_2[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<8x1x8xf32>, memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
      } {unroll_for_vsstb}
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_13_outlined_vf_0(%arg0: memref<16xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>, %arg3: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg0[%arg4] [1] [1] : memref<16xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map18} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %subview_0 = memref.subview %arg1[%arg4, %arg5] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg4, %arg5] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg3[%arg4, %arg5] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = arith.mulf %1, %0 : vector<1x64xf32>
        %4 = arith.mulf %3, %2 : vector<1x64xf32>
        vector.transfer_write %4, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_14_outlined_vf_0(%arg0: memref<16x32xi32, #hivm.address_space<ub>>, %arg1: memref<16x32xi32, #hivm.address_space<ub>>, %arg2: memref<16x32xf32, #hivm.address_space<ub>>, %arg3: memref<16x32xf32, #hivm.address_space<ub>>, %arg4: memref<16x32xf32, #hivm.address_space<ub>>, %arg5: memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 32] : vector<1x64xi1>
    %1 = vector.constant_mask [4, 1, 8] : vector<8x1x8xi1>
    scf.for %arg6 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg4[%arg6, 0] [1, 32] [1, 1] : memref<16x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg0[%arg6, 0] [1, 32] [1, 1] : memref<16x32xi32, #hivm.address_space<ub>> to memref<1x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg1[%arg6, 0] [1, 32] [1, 1] : memref<16x32xi32, #hivm.address_space<ub>> to memref<1x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %c0_i32, %0 {in_bounds = [true, true]} : memref<1x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %3 = vector.transfer_read %subview_2[%c0, %c0], %c0_i32, %0 {in_bounds = [true, true]} : memref<1x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %4 = arith.cmpi sle, %2, %3 : vector<1x64xi32>
      %subview_3 = memref.subview %arg2[%arg6, 0] [1, 32] [1, 1] : memref<16x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %5 = vector.transfer_read %subview_3[%c0, %c0], %cst_0, %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %6 = arith.select %4, %5, %cst : vector<1x64xi1>, vector<1x64xf32>
      vector.transfer_write %6, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_4 = memref.subview %arg5[0, %arg6, 0] [4, 1, 8] [1, 1, 1] : memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> to memref<4x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_5 = memref.subview %arg3[%arg6, 0] [1, 32] [1, 1] : memref<16x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %7 = vector.transfer_read %subview_5[%c0, %c0], %cst_0, %0 {in_bounds = [true, true]} : memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %8 = arith.select %4, %7, %cst : vector<1x64xi1>, vector<1x64xf32>
      %9 = vector.shape_cast %8 : vector<1x64xf32> to vector<8x1x8xf32>
      vector.transfer_write %9, %subview_4[%c0, %c0, %c0], %1 {in_bounds = [true, true, true]} : vector<8x1x8xf32>, memref<4x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_15_outlined_vf_0(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c16 step %c1 {
      scf.for %arg3 = %c0 to %c16 step %c8 {
        %0 = affine.apply #map17(%arg3)
        %subview = memref.subview %arg0[%arg2, %0] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg2, 0] [8, 1, 8] [1, 1, 1] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> to memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.shape_cast %1 : vector<1x64xf32> to vector<8x1x8xf32>
        vector.transfer_write %2, %subview_0[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<8x1x8xf32>, memref<8x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
      } {unroll_for_vsstb}
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_16_outlined_vf_0(%arg0: memref<16x32xf32, #hivm.address_space<ub>>, %arg1: memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [4, 1, 8] : vector<8x1x8xi1>
    scf.for %arg2 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg1[0, %arg2, 0] [4, 1, 8] [1, 1, 1] : memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> to memref<4x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg0[%arg2, 0] [1, 32] [1, 1] : memref<16x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, false]} : memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = vector.shape_cast %1 : vector<1x64xf32> to vector<8x1x8xf32>
      vector.transfer_write %2, %subview[%c0, %c0, %c0], %0 {in_bounds = [true, true, true]} : vector<8x1x8xf32>, memref<4x1x8xf32, strided<[136, 8, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_fused_17_outlined_vf_0(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>, %arg3: memref<16x128xf32, #hivm.address_space<ub>>, %arg4: memref<16x128xf32, #hivm.address_space<ub>>, %arg5: memref<16x128xf32, #hivm.address_space<ub>>, %arg6: memref<16x128xf32, #hivm.address_space<ub>>, %arg7: memref<16x128xf32, #hivm.address_space<ub>>, %arg8: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg9 = %c0 to %c16 step %c1 {
      scf.for %arg10 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg9, %arg10] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg9, %arg10] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg9, %arg10] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg3[%arg9, %arg10] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.addf %0, %1 : vector<1x64xf32>
        %subview_3 = memref.subview %arg4[%arg9, %arg10] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_4 = memref.subview %arg5[%arg9, %arg10] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_5 = memref.subview %arg7[%arg9, %arg10] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %3 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %4 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %6 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = arith.subf %4, %2 : vector<1x64xf32>
        %8 = arith.mulf %7, %5 : vector<1x64xf32>
        %9 = arith.addf %8, %6 : vector<1x64xf32>
        %10 = arith.addf %3, %9 : vector<1x64xf32>
        vector.transfer_write %10, %subview_5[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_6 = memref.subview %arg6[%arg9, %arg10] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_7 = memref.subview %arg8[%arg9, %arg10] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %11 = vector.transfer_read %subview_6[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %12 = arith.addf %4, %11 : vector<1x64xf32>
        %13 = arith.addf %12, %2 : vector<1x64xf32>
        vector.transfer_write %13, %subview_7[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_0(%arg0: memref<32x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_1(%arg0: memref<128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c128 step %c64 {
      %subview = memref.subview %arg0[%arg1] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_2(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 128] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_3(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      scf.for %arg2 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_4(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_5(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 128] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_6(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 128] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_7(%arg0: memref<32x16xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 16] : vector<1x64xi1>
    scf.for %arg1 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 16] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_8(%arg0: memref<32x16xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 16] : vector<1x64xi1>
    scf.for %arg1 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 16] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_9(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      scf.for %arg2 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_10(%arg0: memref<128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c128 step %c64 {
      %subview = memref.subview %arg0[%arg1] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_11(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 128] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_12(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 128] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_13(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      scf.for %arg2 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_14(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 128] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x128xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_15(%arg0: memref<32x16xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 16] : vector<1x64xi1>
    scf.for %arg1 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 16] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_16(%arg0: memref<32x16xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 16] : vector<1x64xi1>
    scf.for %arg1 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 16] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x16xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_17(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      scf.for %arg2 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_18(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      scf.for %arg2 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_19(%arg0: memref<32xi32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0> : vector<64xindex>
    %cst_0 = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63]> : vector<64xindex>
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [32] : vector<64xi1>
    %1 = arith.addi %cst, %cst_0 : vector<64xindex>
    %2 = arith.index_cast %1 : vector<64xindex> to vector<64xi32>
    vector.transfer_write %2, %arg0[%c0], %0 {in_bounds = [true]} : vector<64xi32>, memref<32xi32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_20(%arg0: i32, %arg1: memref<1x128xi32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %arg0 : i32 to vector<1x64xi32>
    scf.for %arg2 = %c0 to %c128 step %c64 {
      %subview = memref.subview %arg1[0, %arg2] [1, 64] [1, 1] : memref<1x128xi32, #hivm.address_space<ub>> to memref<1x64xi32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %0, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xi32>, memref<1x64xi32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_21(%arg0: memref<32xi32, #hivm.address_space<ub>>, %arg1: memref<32x32xi32, #hivm.address_space<ub>>, %arg2: memref<32x32xi32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 32] : vector<1x64xi1>
    %1 = vector.constant_mask [32] : vector<64xi1>
    %2 = vector.transfer_read %arg0[%c0], %c0_i32, %1 {in_bounds = [true, true], permutation_map = #map19} : memref<32xi32, #hivm.address_space<ub>>, vector<1x64xi32>
    scf.for %arg3 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg3] [1] [1] : memref<32xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg3, 0] [1, 32] [1, 1] : memref<32x32xi32, #hivm.address_space<ub>> to memref<1x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %3 = vector.transfer_read %subview[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map18} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      vector.transfer_write %3, %subview_0[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xi32>, memref<1x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg3, 0] [1, 32] [1, 1] : memref<32x32xi32, #hivm.address_space<ub>> to memref<1x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %2, %subview_1[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x64xi32>, memref<1x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_22(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_23(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.addf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_24(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_25(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.addf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_26(%arg0: memref<32x16xf32, #hivm.address_space<ub>>, %arg1: memref<16x32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [32, 1] : vector<64x1xi1>
    %1 = vector.constant_mask [1, 32] : vector<1x64xi1>
    scf.for %arg2 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg0[0, %arg2] [32, 1] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<32x1xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg2, 0] [1, 32] [1, 1] : memref<16x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview[%c0, %c0], %cst, %0 {in_bounds = [true, true], permutation_map = #map22} : memref<32x1xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      vector.transfer_write %2, %subview_0[%c0, %c0], %1 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_27(%arg0: memref<32x16xf32, #hivm.address_space<ub>>, %arg1: memref<16x32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [32, 1] : vector<64x1xi1>
    %1 = vector.constant_mask [1, 32] : vector<1x64xi1>
    scf.for %arg2 = %c0 to %c16 step %c1 {
      %subview = memref.subview %arg0[0, %arg2] [32, 1] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<32x1xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg2, 0] [1, 32] [1, 1] : memref<16x32xf32, #hivm.address_space<ub>> to memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview[%c0, %c0], %cst, %0 {in_bounds = [true, true], permutation_map = #map22} : memref<32x1xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      vector.transfer_write %2, %subview_0[%c0, %c0], %1 {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x32xf32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_28(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_29(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.addf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_30(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16 step %c1 {
      scf.for %arg4 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg2[%arg3, %arg4] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_31(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c16 step %c1 {
      scf.for %arg2 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg15: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg16: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32) attributes {DirectlyUsedGMArgIdxList = [5, 5, 14, 5], SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<22xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
    %c16_i64 = arith.constant 16 : i64
    %c16 = arith.constant 16 : index
    %c8 = arith.constant 8 : index
    %c128_i32 = arith.constant 128 : i32
    %c32_i32 = arith.constant 32 : i32
    %c64_i32 = arith.constant 64 : i32
    %c2_i32 = arith.constant 2 : i32
    %c96_i32 = arith.constant 96 : i32
    %c0_i64 = arith.constant 0 : i64
    %cst = arith.constant 0.000000e+00 : f32
    %c32 = arith.constant 32 : index
    %c96_i64 = arith.constant 96 : i64
    %c0_i32 = arith.constant 0 : i32
    %c16_i32 = arith.constant 16 : i32
    %c32_i64 = arith.constant 32 : i64
    %c12288_i32 = arith.constant 12288 : i32
    %c31_i32 = arith.constant 31 : i32
    %c128 = arith.constant 128 : index
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %c0 = arith.constant 0 : index
    %0 = arith.muli %arg19, %arg20 : i32
    %1 = arith.muli %0, %arg21 : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
    call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_31(%alloc) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
    %4 = arith.muli %arg17, %arg18 : i32
    %5 = hivm.hir.get_sub_block_idx -> i64
    %6 = arith.index_cast %5 : i64 to index
    %7 = affine.apply #map23()[%6]
    %8 = affine.apply #map24()[%6]
    hivm.hir.anchor {id = 0 : i64}
    annotation.mark %1 {logical_block_num} : i32
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 1
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
    hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 8
    hivm.hir.anchor {id = 1 : i64}
    scf.for %arg22 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %9 = arith.remsi %arg22, %arg19 : i32
      %10 = arith.divsi %arg22, %arg19 : i32
      %11 = arith.remsi %10, %arg20 : i32
      %12 = arith.divsi %arg22, %0 : i32
      %13 = arith.remsi %12, %arg21 : i32
      hivm.hir.anchor {id = 3 : i64}
      hivm.hir.anchor {id = 4 : i64}
      %14 = arith.remsi %13, %c96_i32 : i32
      %15 = arith.divsi %9, %c2_i32 : i32
      %16 = arith.remsi %9, %c2_i32 : i32
      %17 = arith.muli %11, %c2_i32 : i32
      %18 = arith.index_cast %17 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg16 to offset: [%18], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %19 = affine.apply #map()[%18]
      %20 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 5 : i64}
      %21 = arith.trunci %20 : i64 to i32
      %reinterpret_cast_1 = memref.reinterpret_cast %arg16 to offset: [%19], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %22 = memref.load %reinterpret_cast_1[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 6 : i64}
      %23 = arith.trunci %22 : i64 to i32
      %24 = arith.index_cast %21 : i32 to index
      %reinterpret_cast_2 = memref.reinterpret_cast %arg15 to offset: [%24], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %25 = affine.apply #map()[%24]
      %26 = memref.load %reinterpret_cast_2[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 7 : i64}
      %27 = arith.trunci %26 : i64 to i32
      %reinterpret_cast_3 = memref.reinterpret_cast %arg15 to offset: [%25], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %28 = memref.load %reinterpret_cast_3[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.anchor {id = 8 : i64}
      %29 = arith.trunci %28 : i64 to i32
      %30 = arith.subi %29, %27 : i32
      %31 = arith.muli %23, %c64_i32 : i32
      %32 = arith.muli %16, %c32_i32 : i32
      %33 = arith.addi %31, %32 : i32
      %34 = arith.cmpi sge, %33, %30 : i32
      scf.if %34 {
        hivm.hir.anchor {id = 9 : i64}
      } else {
        hivm.hir.anchor {id = 10 : i64}
        %35 = arith.muli %15, %c128_i32 : i32
        %36 = arith.muli %27, %c96_i32 : i32
        %37 = arith.addi %36, %14 : i32
        %38 = arith.extsi %37 : i32 to i64
        %39 = arith.muli %37, %c128_i32 : i32
        %40 = arith.index_cast %39 : i32 to index
        %41 = arith.muli %37, %c64_i32 : i32
        %42 = arith.index_cast %41 : i32 to index
        %43 = arith.muli %15, %4 : i32
        %44 = arith.addi %43, %27 : i32
        %45 = arith.muli %44, %c96_i32 : i32
        %46 = arith.addi %45, %14 : i32
        %47 = arith.extsi %30 : i32 to i64
        %48 = arith.maxsi %33, %c0_i32 : i32
        %49 = arith.index_cast %48 : i32 to index
        %50 = arith.maxsi %35, %c0_i32 : i32
        %51 = arith.index_cast %50 : i32 to index
        %52 = affine.apply #map3()[%51]
        %53 = affine.apply #map1()[%51, %40, %49]
        %54 = arith.index_cast %30 : i32 to index
        %55 = affine.apply #map2()[%54, %51, %49]
        %reinterpret_cast_4 = memref.reinterpret_cast %arg4 to offset: [%53], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_5 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        %56 = arith.maxsi %55, %c0 : index
        %57 = arith.minsi %56, %c32 : index
        %58 = arith.maxsi %52, %c0 : index
        %59 = arith.minsi %58, %c128 : index
        %60 = arith.subi %c0_i32, %33 : i32
        %61 = arith.maxsi %60, %c0_i32 : i32
        %62 = arith.index_cast %61 : i32 to index
        %63 = arith.minsi %62, %57 : index
        %64 = affine.apply #map4()[%57, %63]
        %65 = arith.subi %c0_i32, %35 : i32
        %66 = arith.maxsi %65, %c0_i32 : i32
        %67 = arith.index_cast %66 : i32 to index
        %68 = arith.minsi %67, %59 : index
        %69 = affine.apply #map4()[%59, %68]
        %70 = arith.cmpi slt, %64, %c32 : index
        %71 = arith.cmpi slt, %69, %c128 : index
        %72 = arith.ori %70, %71 : i1
        %subview = memref.subview %reinterpret_cast_4[0, 0] [%64, %69] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_6 = memref.subview %alloc_5[%63, %68] [%64, %69] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %73 = arith.remui %68, %c8 : index
        hivm.hir.anchor {id = 11 : i64}
        scf.if %72 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_0(%alloc_5) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_6 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %73 : index
        hivm.hir.anchor {id = 12 : i64}
        %subview_7 = memref.subview %alloc_5[%7, 0] [16, 128] [1, 1] {to_be_bubbled_slice} : memref<32x128xf32, #hivm.address_space<ub>> to memref<16x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %74 = arith.extsi %33 : i32 to i64
        %75 = arith.muli %74, %c96_i64 : i64
        %76 = arith.addi %38, %75 : i64
        %77 = arith.subi %47, %74 : i64
        %78 = arith.maxsi %77, %c0_i64 : i64
        %79 = arith.minsi %78, %c32_i64 : i64
        %80 = arith.minsi %79, %c32_i64 : i64
        hivm.hir.anchor {id = 13 : i64}
        %81 = arith.index_cast %7 : index to i64
        %82 = arith.muli %81, %c96_i64 : i64
        %83 = arith.addi %76, %82 : i64
        %84 = arith.subi %80, %81 : i64
        %85 = arith.maxsi %84, %c0_i64 : i64
        %86 = arith.minsi %85, %c16_i64 : i64
        %alloc_8 = memref.alloc() {alignment = 64 : i64} : memref<16xf32, #hivm.address_space<ub>>
        hivm.hir.stride_load ins(%arg5 : memref<?xf32, #hivm.address_space<gm>>) outs(%alloc_8 : memref<16xf32, #hivm.address_space<ub>>) offset(%83 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%86 : i64])
        hivm.hir.anchor {id = 14 : i64}
        %87 = arith.cmpi sgt, %16, %c0_i32 : i32
        %88:2 = scf.if %87 -> (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) {
          hivm.hir.anchor {id = 15 : i64}
          %152 = arith.muli %33, %c12288_i32 : i32
          %153 = arith.index_cast %152 : i32 to index
          %154 = arith.index_cast %35 : i32 to index
          %155 = affine.apply #map5()[%154, %40, %153]
          %156 = affine.apply #map6()[%154]
          %reinterpret_cast_148 = memref.reinterpret_cast %arg4 to offset: [%155], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %alloc_149 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
          %157 = arith.maxsi %154, %c128 : index
          %158 = arith.minsi %156, %157 : index
          %159 = affine.apply #map4()[%158, %154]
          %160 = arith.cmpi slt, %159, %c128 : index
          %subview_150 = memref.subview %reinterpret_cast_148[0] [%159] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %subview_151 = memref.subview %alloc_149[0] [%159] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 16 : i64}
          scf.if %160 {
            func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_1(%alloc_149) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          hivm.hir.load ins(%subview_150 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_151 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32
          hivm.hir.anchor {id = 17 : i64}
          %alloca = memref.alloca() {normalize_matmul_counter = 0 : i32} : memref<i32>
          hivm.hir.anchor {id = 18 : i64}
          memref.store %c0_i32, %alloca[] : memref<i32>
          hivm.hir.anchor {id = 19 : i64}
          %alloca_152 = memref.alloca() {normalize_matmul_counter = 1 : i32} : memref<i32>
          hivm.hir.anchor {id = 20 : i64}
          memref.store %c0_i32, %alloca_152[] : memref<i32>
          hivm.hir.anchor {id = 21 : i64}
          scf.for %arg23 = %c0_i32 to %16 step %c1_i32  : i32 {
            hivm.hir.anchor {id = 22 : i64}
            %alloc_159 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_160 = memref.subview %alloc_159[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_159 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_161 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_162 = memref.subview %alloc_161[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_161 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
            hivm.hir.anchor {id = 23 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 24 : i64}
              %167 = arith.muli %arg23, %c32_i32 : i32
              %168 = arith.addi %31, %167 : i32
              %169 = arith.maxsi %168, %c0_i32 : i32
              %170 = arith.index_cast %169 : i32 to index
              %171 = affine.apply #map1()[%51, %40, %170]
              %172 = affine.apply #map2()[%54, %51, %170]
              %reinterpret_cast_163 = memref.reinterpret_cast %arg3 to offset: [%171], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_164 = memref.reinterpret_cast %arg4 to offset: [%171], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %alloc_165 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
              %173 = arith.maxsi %172, %c0 : index
              %174 = arith.minsi %173, %c32 : index
              %175 = arith.subi %c0_i32, %168 : i32
              %176 = arith.maxsi %175, %c0_i32 : i32
              %177 = arith.index_cast %176 : i32 to index
              %178 = arith.minsi %177, %174 : index
              %179 = affine.apply #map4()[%174, %178]
              %180 = arith.cmpi slt, %179, %c32 : index
              %181 = arith.ori %180, %71 : i1
              %182 = arith.minsi %7, %179 : index
              %183 = affine.apply #map25()[%182, %174, %178]
              %184 = arith.minsi %183, %c16 : index
              %subview_166 = memref.subview %reinterpret_cast_163[%7, 0] [%184, %69] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %185 = affine.apply #map26()[%6]
              %186 = arith.maxsi %178, %7 : index
              %187 = arith.minsi %174, %185 : index
              %188 = arith.maxsi %186, %187 : index
              %189 = affine.apply #map4()[%188, %186]
              %190 = affine.apply #map27()[%186, %6]
              %subview_167 = memref.subview %alloc_165[%190, %68] [%189, %69] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              %191 = arith.remui %68, %c16 : index
              hivm.hir.anchor {id = 25 : i64}
              scf.if %181 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_2(%alloc_165) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_166 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_167 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %191 : index
              hivm.hir.anchor {id = 26 : i64}
              %alloc_168 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
              %subview_169 = memref.subview %reinterpret_cast_164[%7, 0] [%184, %69] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_170 = memref.subview %alloc_168[%190, %68] [%189, %69] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 27 : i64}
              scf.if %181 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_3(%alloc_168) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_169 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_170 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %73 : index
              hivm.hir.anchor {id = 28 : i64}
              hivm.hir.anchor {id = 29 : i64}
              hivm.hir.anchor {id = 30 : i64}
              hivm.hir.anchor {id = 31 : i64}
              hivm.hir.anchor {id = 32 : i64}
              hivm.hir.anchor {id = 33 : i64}
              hivm.hir.anchor {id = 34 : i64}
              hivm.hir.anchor {id = 35 : i64}
              %alloc_171 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
              %subview_172 = memref.subview %alloc_171[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_0_outlined_vf_0(%alloc_165, %alloc_149, %alloc_168, %subview_172) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
              %expand_shape_173 = memref.expand_shape %subview_172 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
              annotation.mark %alloc_161 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 36 : i64}
              %collapse_shape_174 = memref.collapse_shape %expand_shape_173 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
              %collapse_shape_175 = memref.collapse_shape %subview_162 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_174 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_175 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              hivm.hir.anchor {id = 37 : i64}
              annotation.mark %alloc_159 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 38 : i64}
              %collapse_shape_176 = memref.collapse_shape %subview_160 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_174 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_176 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              hivm.hir.anchor {id = 39 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 40 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 41 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 42 : i64}
              hivm.hir.anchor {id = 43 : i64}
              hivm.hir.anchor {id = 44 : i64}
              hivm.hir.anchor {id = 45 : i64}
              hivm.hir.anchor {id = 46 : i64}
              hivm.hir.anchor {id = 47 : i64}
              %167 = memref.load %alloca[] : memref<i32>
              hivm.hir.anchor {id = 48 : i64}
              hivm.hir.anchor {id = 49 : i64}
              %168 = arith.addi %167, %c1_i32 : i32
              memref.store %168, %alloca[] : memref<i32>
              hivm.hir.anchor {id = 50 : i64}
              %169 = memref.load %alloca_152[] : memref<i32>
              hivm.hir.anchor {id = 51 : i64}
              hivm.hir.anchor {id = 52 : i64}
              %170 = arith.addi %169, %c1_i32 : i32
              memref.store %170, %alloca_152[] : memref<i32>
              hivm.hir.anchor {id = 53 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 54 : i64}
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop, may_not_exec, normalized_in_L0C = [0 : i32, 1 : i32]}
          hivm.hir.anchor {id = 55 : i64}
          %161 = memref.load %alloca[] : memref<i32>
          hivm.hir.anchor {id = 56 : i64}
          %162 = arith.cmpi eq, %161, %c0_i32 : i32
          %alloc_153 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_153 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 57 : i64}
          %163 = scf.if %162 -> (memref<16x128xf32, #hivm.address_space<ub>>) {
            hivm.hir.anchor {id = 58 : i64}
            %alloc_159 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
            %collapse_shape_160 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            %collapse_shape_161 = memref.collapse_shape %alloc_159 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            hivm.hir.copy ins(%collapse_shape_160 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_161 : memref<2048xf32, #hivm.address_space<ub>>)
            scf.yield %alloc_159 : memref<16x128xf32, #hivm.address_space<ub>>
          } else {
            hivm.hir.anchor {id = 59 : i64}
            hivm.hir.anchor {id = 60 : i64}
            hivm.hir.anchor {id = 61 : i64}
            scf.yield %alloc_153 : memref<16x128xf32, #hivm.address_space<ub>>
          }
          hivm.hir.anchor {id = 62 : i64}
          %164 = memref.load %alloca_152[] : memref<i32>
          hivm.hir.anchor {id = 63 : i64}
          %165 = arith.cmpi eq, %164, %c0_i32 : i32
          %alloc_154 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_154 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 64 : i64}
          %166 = scf.if %165 -> (memref<16x128xf32, #hivm.address_space<ub>>) {
            hivm.hir.anchor {id = 65 : i64}
            %alloc_159 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
            %collapse_shape_160 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            %collapse_shape_161 = memref.collapse_shape %alloc_159 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            hivm.hir.copy ins(%collapse_shape_160 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_161 : memref<2048xf32, #hivm.address_space<ub>>)
            scf.yield %alloc_159 : memref<16x128xf32, #hivm.address_space<ub>>
          } else {
            hivm.hir.anchor {id = 66 : i64}
            hivm.hir.anchor {id = 67 : i64}
            hivm.hir.anchor {id = 68 : i64}
            scf.yield %alloc_154 : memref<16x128xf32, #hivm.address_space<ub>>
          }
          hivm.hir.anchor {id = 69 : i64}
          hivm.hir.anchor {id = 70 : i64}
          hivm.hir.anchor {id = 71 : i64}
          hivm.hir.anchor {id = 72 : i64}
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %alloc_155 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %alloc_156 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %cast_157 = memref.cast %subview_7 {fold_offset_into_ptr} : memref<16x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x128xf32, #hivm.address_space<ub>>
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_1_outlined_vf_0(%cast_157, %alloc_149, %alloc_155, %163, %alloc_156) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
          hivm.hir.anchor {id = 73 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %alloc_158 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_4(%166, %alloc_155, %alloc_158) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
          hivm.hir.anchor {id = 74 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
          scf.yield %alloc_156, %alloc_158 : memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>
        } else {
          hivm.hir.anchor {id = 75 : i64}
          %alloc_148 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_149 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          %collapse_shape_150 = memref.collapse_shape %alloc_148 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_149 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_150 : memref<2048xf32, #hivm.address_space<ub>>)
          %alloc_151 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_152 = memref.collapse_shape %alloc_151 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_149 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_152 : memref<2048xf32, #hivm.address_space<ub>>)
          scf.yield %alloc_148, %alloc_151 : memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>
        }
        hivm.hir.anchor {id = 76 : i64}
        %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<32xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_19(%alloc_9) {hivm.vector_function, no_inline} : (memref<32xi32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 77 : i64}
        %reinterpret_cast_10 = memref.reinterpret_cast %arg2 to offset: [%53], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_11 = memref.reinterpret_cast %arg3 to offset: [%53], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_12 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
        %89 = arith.minsi %7, %64 : index
        %90 = affine.apply #map25()[%89, %57, %63]
        %91 = arith.minsi %90, %c16 : index
        %subview_13 = memref.subview %reinterpret_cast_10[%7, 0] [%91, %69] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %92 = affine.apply #map26()[%6]
        %93 = arith.maxsi %63, %7 : index
        %94 = arith.minsi %57, %92 : index
        %95 = arith.maxsi %93, %94 : index
        %96 = affine.apply #map4()[%95, %93]
        %97 = affine.apply #map27()[%93, %6]
        %subview_14 = memref.subview %alloc_12[%97, %68] [%96, %69] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %98 = arith.remui %68, %c16 : index
        hivm.hir.anchor {id = 78 : i64}
        scf.if %72 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_5(%alloc_12) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_13 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_14 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %98 : index
        hivm.hir.anchor {id = 79 : i64}
        %alloc_15 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
        %subview_16 = memref.subview %reinterpret_cast_11[%7, 0] [%91, %69] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_17 = memref.subview %alloc_15[%97, %68] [%96, %69] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 80 : i64}
        scf.if %72 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_6(%alloc_15) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_16 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_17 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %98 : index
        hivm.hir.anchor {id = 81 : i64}
        %99 = arith.subi %30, %33 : i32
        %100 = arith.subi %99, %c1_i32 : i32
        %101 = arith.minsi %100, %c16_i32 : i32
        %102 = arith.trunci %101 : i32 to i16
        %103 = arith.extsi %102 : i16 to i32
        hivm.hir.anchor {id = 82 : i64}
        %alloc_18 = memref.alloc() {alignment = 64 : i64} : memref<1x128xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_20(%103, %alloc_18) {hivm.vector_function, no_inline} : (i32, memref<1x128xi32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 83 : i64}
        %alloc_19 = memref.alloc() {alignment = 64 : i64} : memref<1x128xf32, #hivm.address_space<ub>>
        hivm.hir.vgather {hivm.vf_mode = #hivm.vf_mode<SIMT>} ins(%alloc_5 : memref<32x128xf32, #hivm.address_space<ub>>) indices(%alloc_18 : memref<1x128xi32, #hivm.address_space<ub>>) outs(%alloc_19 : memref<1x128xf32, #hivm.address_space<ub>>) gather_axis = 0
        hivm.hir.anchor {id = 84 : i64}
        %104 = arith.maxsi %32, %c0_i32 : i32
        %105 = arith.index_cast %104 : i32 to index
        %106 = affine.apply #map7()[%105, %42, %49]
        %107 = affine.apply #map9()[%105]
        %108 = affine.apply #map8()[%54, %105, %49]
        %reinterpret_cast_20 = memref.reinterpret_cast %arg6 to offset: [%106], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_21 = memref.reinterpret_cast %arg7 to offset: [%106], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_22 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        %109 = arith.maxsi %108, %c0 : index
        %110 = arith.minsi %109, %c32 : index
        %111 = arith.maxsi %107, %c0 : index
        %112 = arith.minsi %111, %c32 : index
        %113 = arith.minsi %62, %110 : index
        %114 = affine.apply #map4()[%110, %113]
        %115 = arith.subi %c0_i32, %32 : i32
        %116 = arith.maxsi %115, %c0_i32 : i32
        %117 = arith.index_cast %116 : i32 to index
        %118 = arith.minsi %117, %112 : index
        %119 = affine.apply #map4()[%112, %118]
        %120 = arith.cmpi slt, %114, %c32 : index
        %121 = arith.cmpi slt, %119, %c32 : index
        %122 = arith.ori %120, %121 : i1
        %123 = arith.minsi %7, %119 : index
        %124 = affine.apply #map25()[%123, %112, %118]
        %125 = arith.minsi %124, %c16 : index
        %subview_23 = memref.subview %reinterpret_cast_20[0, %7] [%114, %125] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
        %126 = arith.maxsi %118, %7 : index
        %127 = arith.minsi %112, %92 : index
        %128 = arith.maxsi %126, %127 : index
        %129 = affine.apply #map4()[%128, %126]
        %130 = affine.apply #map27()[%126, %6]
        %subview_24 = memref.subview %alloc_22[%113, %130] [%114, %129] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        %131 = arith.remui %118, %c8 : index
        hivm.hir.anchor {id = 85 : i64}
        scf.if %122 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_7(%alloc_22) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_23 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_24 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %131 : index
        hivm.hir.anchor {id = 86 : i64}
        %alloc_25 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        %subview_26 = memref.subview %reinterpret_cast_21[0, %7] [%114, %125] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_27 = memref.subview %alloc_25[%113, %130] [%114, %129] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 87 : i64}
        scf.if %122 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_8(%alloc_25) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_26 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_27 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %131 : index
        hivm.hir.anchor {id = 88 : i64}
        %expand_shape = memref.expand_shape %alloc_9 [[0, 1]] output_shape [1, 32] : memref<32xi32, #hivm.address_space<ub>> into memref<1x32xi32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 89 : i64}
        hivm.hir.anchor {id = 90 : i64}
        %alloc_28 = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32, #hivm.address_space<ub>>
        %alloc_29 = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_21(%alloc_9, %alloc_28, %alloc_29) {hivm.vector_function, no_inline} : (memref<32xi32, #hivm.address_space<ub>>, memref<32x32xi32, #hivm.address_space<ub>>, memref<32x32xi32, #hivm.address_space<ub>>) -> ()
        %subview_30 = memref.subview %alloc_28[%7, 0] [16, 32] [1, 1] {to_be_bubbled_slice} : memref<32x32xi32, #hivm.address_space<ub>> to memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_31 = memref.subview %alloc_29[%7, 0] [16, 32] [1, 1] {to_be_bubbled_slice} : memref<32x32xi32, #hivm.address_space<ub>> to memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 91 : i64}
        hivm.hir.anchor {id = 92 : i64}
        hivm.hir.anchor {id = 93 : i64}
        %alloc_32 = memref.alloc() : memref<1x256x1xi1, #hivm.address_space<ub>>
        %subview_33 = memref.subview %alloc_32[0, 0, 0] [1, 16, 1] [1, 1, 1] : memref<1x256x1xi1, #hivm.address_space<ub>> to memref<1x16xi1, strided<[256, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_7_outlined_vf_0(%7, %expand_shape, %33, %30, %subview_33) {hivm.vector_function, no_inline} : (index, memref<1x32xi32, #hivm.address_space<ub>>, i32, i32, memref<1x16xi1, strided<[256, 1]>, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 94 : i64}
        %collapse_shape = memref.collapse_shape %subview_33 [[0, 1]] : memref<1x16xi1, strided<[256, 1]>, #hivm.address_space<ub>> into memref<16xi1, strided<[1]>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 95 : i64}
        hivm.hir.anchor {id = 96 : i64}
        hivm.hir.anchor {id = 97 : i64}
        hivm.hir.anchor {id = 98 : i64}
        hivm.hir.anchor {id = 99 : i64}
        hivm.hir.anchor {id = 100 : i64}
        hivm.hir.anchor {id = 101 : i64}
        %132 = arith.index_cast %33 : i32 to index
        %133 = affine.apply #map16()[%132]
        %134 = arith.maxsi %132, %54 : index
        %135 = arith.minsi %133, %134 : index
        %136 = affine.apply #map4()[%135, %132]
        %137 = arith.minsi %7, %136 : index
        %138 = affine.apply #map25()[%137, %135, %132]
        %139 = arith.minsi %138, %c16 : index
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
        %alloc_34 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_35 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_36 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_6_outlined_vf_0(%7, %alloc_5, %alloc_19, %alloc_15, %alloc_34, %alloc_35, %alloc_36) {hivm.vector_function, no_inline} : (index, memref<32x128xf32, #hivm.address_space<ub>>, memref<1x128xf32, #hivm.address_space<ub>>, memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        %subview_37 = memref.subview %alloc_34[0, 0] [%139, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
        %alloc_38 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %collapse_shape_39 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
        %collapse_shape_40 = memref.collapse_shape %alloc_38 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%collapse_shape_39 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_40 : memref<2048xf32, #hivm.address_space<ub>>)
        %subview_41 = memref.subview %alloc_38[0, 0] [%139, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
        %collapse_shape_42 = memref.collapse_shape %subview_37 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        %collapse_shape_43 = memref.collapse_shape %subview_41 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        hivm.hir.copy ins(%collapse_shape_42 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_43 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
        %alloc_44 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_45 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_46 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
        %subview_47 = memref.subview %alloc_46[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_6_outlined_vf_1(%alloc_38, %alloc_44, %alloc_36, %alloc_45, %subview_47) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_48 = memref.expand_shape %subview_47 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_49 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_50 = memref.subview %alloc_49[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_49 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        hivm.hir.anchor {id = 112 : i64}
        %collapse_shape_51 = memref.collapse_shape %expand_shape_48 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_52 = memref.collapse_shape %subview_50 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_51 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_52 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 113 : i64}
        hivm.hir.anchor {id = 114 : i64}
        %alloc_53 = memref.alloc() {alignment = 64 : i64} : memref<32x16xf32, #hivm.address_space<ub>>
        %alloc_54 = memref.alloc() : memref<2x33x8x1xf32, #hivm.address_space<ub>>
        %subview_55 = memref.subview %alloc_54[0, 0, 0, 0] [2, 32, 8, 1] [1, 1, 1, 1] : memref<2x33x8x1xf32, #hivm.address_space<ub>> to memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_8_outlined_vf_0(%alloc_28, %7, %alloc_29, %collapse_shape, %alloc_25, %alloc_22, %alloc_53, %subview_55) {hivm.vector_function, no_inline} : (memref<32x32xi32, #hivm.address_space<ub>>, index, memref<32x32xi32, #hivm.address_space<ub>>, memref<16xi1, strided<[1]>, #hivm.address_space<ub>>, memref<32x16xf32, #hivm.address_space<ub>>, memref<32x16xf32, #hivm.address_space<ub>>, memref<32x16xf32, #hivm.address_space<ub>>, memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_56 = memref.expand_shape %subview_55 [[0], [1, 2], [3]] output_shape [2, 2, 16, 8] : memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>> into memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_57 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_58 = memref.subview %alloc_57[%8, 0, 0, 0] [2, 2, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_57 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = 0 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 115 : i64}
        %collapse_shape_59 = memref.collapse_shape %expand_shape_56 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>> into memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>
        %collapse_shape_60 = memref.collapse_shape %subview_58 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_59 : memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_60 : memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 116 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 117 : i64}
        %alloc_61 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_61 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 118 : i64}
        hivm.hir.anchor {id = 119 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_62 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_22(%alloc_61, %alloc_45, %alloc_62) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 120 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        %alloc_63 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_23(%88#0, %alloc_62, %alloc_63) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 121 : i64}
        %alloc_64 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_65 = memref.subview %alloc_64[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_64 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        hivm.hir.anchor {id = 122 : i64}
        %collapse_shape_66 = memref.collapse_shape %subview_65 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_51 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_66 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 123 : i64}
        hivm.hir.anchor {id = 124 : i64}
        %alloc_67 = memref.alloc() : memref<2x33x8x1xf32, #hivm.address_space<ub>>
        %subview_68 = memref.subview %alloc_67[0, 0, 0, 0] [2, 32, 8, 1] [1, 1, 1, 1] : memref<2x33x8x1xf32, #hivm.address_space<ub>> to memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_9_outlined_vf_0(%alloc_53, %subview_68) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>, memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_69 = memref.expand_shape %subview_68 [[0], [1, 2], [3]] output_shape [2, 2, 16, 8] : memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>> into memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_70 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_71 = memref.subview %alloc_70[%8, 0, 0, 0] [2, 2, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_70 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = 0 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 125 : i64}
        %collapse_shape_72 = memref.collapse_shape %expand_shape_69 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>> into memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>
        %collapse_shape_73 = memref.collapse_shape %subview_71 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_72 : memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_73 : memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 126 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 127 : i64}
        %alloc_74 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_74 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 128 : i64}
        hivm.hir.anchor {id = 129 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_75 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_24(%alloc_74, %alloc_45, %alloc_75) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 130 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.anchor {id = 131 : i64}
        hivm.hir.anchor {id = 132 : i64}
        hivm.hir.anchor {id = 133 : i64}
        hivm.hir.anchor {id = 134 : i64}
        %alloc_76 = memref.alloc() {alignment = 64 : i64} : memref<16xf32, #hivm.address_space<ub>>
        %alloc_77 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_10_outlined_vf_0(%alloc_8, %88#1, %alloc_75, %alloc_36, %alloc_76, %alloc_77) {hivm.vector_function, no_inline} : (memref<16xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 135 : i64}
        %reinterpret_cast_78 = memref.reinterpret_cast %arg8 to offset: [%53], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_79 = memref.reinterpret_cast %arg9 to offset: [%53], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.anchor {id = 136 : i64}
        %alloc_80 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_11_outlined_vf_0(%alloc_12, %alloc_63, %alloc_80) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 137 : i64}
        %alloc_81 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        %subview_82 = memref.subview %reinterpret_cast_78[%7, 0] [%91, %69] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_83 = memref.subview %alloc_81[%97, %68] [%96, %69] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 138 : i64}
        scf.if %72 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_9(%alloc_81) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_82 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_83 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %73 : index
        hivm.hir.anchor {id = 139 : i64}
        hivm.hir.anchor {id = 140 : i64}
        %alloc_84 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_25(%alloc_63, %alloc_81, %alloc_84) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 141 : i64}
        %subview_85 = memref.subview %alloc_84[%97, %68] [%96, %69] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 142 : i64}
        %subview_86 = memref.subview %reinterpret_cast_79[%7, 0] [%91, %69] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_85 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_86 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        hivm.hir.anchor {id = 143 : i64}
        %140 = arith.extsi %46 : i32 to i64
        %141 = arith.addi %140, %75 : i64
        %142 = arith.addi %141, %82 : i64
        %143 = arith.minsi %84, %c16_i64 : i64
        %144 = arith.maxsi %143, %c0_i64 : i64
        hivm.hir.stride_store ins(%alloc_76 : memref<16xf32, #hivm.address_space<ub>>) outs(%arg14 : memref<?xf32, #hivm.address_space<gm>>) offset(%142 : i64) strides([%c96_i64 : i64]) numels([%144 : i64])
        hivm.hir.anchor {id = 144 : i64}
        %145 = arith.subi %30, %31 : i32
        %146 = arith.addi %145, %c31_i32 : i32
        %147 = arith.divsi %146, %c32_i32 : i32
        %148 = arith.minsi %147, %c2_i32 : i32
        %149 = arith.subi %148, %c1_i32 : i32
        %150 = arith.cmpi slt, %16, %149 : i32
        %151 = scf.if %150 -> (memref<16x128xf32, #hivm.address_space<ub>>) {
          hivm.hir.anchor {id = 145 : i64}
          %152 = arith.addi %33, %c32_i32 : i32
          %153 = arith.minsi %152, %30 : i32
          %154 = arith.subi %153, %c1_i32 : i32
          %155 = arith.muli %154, %c12288_i32 : i32
          %156 = arith.index_cast %155 : i32 to index
          %157 = arith.index_cast %35 : i32 to index
          %158 = affine.apply #map5()[%157, %40, %156]
          %159 = affine.apply #map6()[%157]
          %reinterpret_cast_148 = memref.reinterpret_cast %arg4 to offset: [%158], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %alloc_149 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
          %160 = arith.maxsi %157, %c128 : index
          %161 = arith.minsi %159, %160 : index
          %162 = affine.apply #map4()[%161, %157]
          %163 = arith.cmpi slt, %162, %c128 : index
          %subview_150 = memref.subview %reinterpret_cast_148[0] [%162] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %subview_151 = memref.subview %alloc_149[0] [%162] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 146 : i64}
          scf.if %163 {
            func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_10(%alloc_149) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          hivm.hir.load ins(%subview_150 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_151 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32
          hivm.hir.anchor {id = 147 : i64}
          %164 = arith.addi %16, %c1_i32 : i32
          hivm.hir.anchor {id = 148 : i64}
          %alloc_152 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_153 = memref.collapse_shape %alloc_152 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_39 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_153 : memref<2048xf32, #hivm.address_space<ub>>)
          %165 = scf.for %arg23 = %164 to %148 step %c1_i32 iter_args(%arg24 = %alloc_152) -> (memref<16x128xf32, #hivm.address_space<ub>>)  : i32 {
            hivm.hir.anchor {id = 149 : i64}
            %alloc_156 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_156 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_156 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_157 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_157 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_157 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_158 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_159 = memref.subview %alloc_158[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_158 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_160 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_161 = memref.subview %alloc_160[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_160 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            hivm.hir.anchor {id = 150 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 151 : i64}
              %167 = arith.muli %arg23, %c32_i32 : i32
              %168 = arith.addi %31, %167 : i32
              %169 = arith.maxsi %168, %c0_i32 : i32
              %170 = arith.index_cast %169 : i32 to index
              %171 = affine.apply #map1()[%51, %40, %170]
              %172 = affine.apply #map2()[%54, %51, %170]
              %reinterpret_cast_162 = memref.reinterpret_cast %arg2 to offset: [%171], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_163 = memref.reinterpret_cast %arg3 to offset: [%171], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_164 = memref.reinterpret_cast %arg4 to offset: [%171], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %173 = arith.extsi %168 : i32 to i64
              %174 = arith.muli %173, %c96_i64 : i64
              %175 = arith.addi %38, %174 : i64
              %176 = arith.subi %47, %173 : i64
              %177 = arith.maxsi %176, %c0_i64 : i64
              %178 = arith.minsi %177, %c32_i64 : i64
              %179 = arith.minsi %178, %c32_i64 : i64
              hivm.hir.anchor {id = 152 : i64}
              %180 = arith.addi %175, %82 : i64
              %181 = arith.subi %179, %81 : i64
              %182 = arith.maxsi %181, %c0_i64 : i64
              %183 = arith.minsi %182, %c16_i64 : i64
              %alloc_165 = memref.alloc() {alignment = 64 : i64} : memref<16xf32, #hivm.address_space<ub>>
              hivm.hir.stride_load ins(%arg5 : memref<?xf32, #hivm.address_space<gm>>) outs(%alloc_165 : memref<16xf32, #hivm.address_space<ub>>) offset(%180 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%183 : i64])
              hivm.hir.anchor {id = 153 : i64}
              %alloc_166 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
              %184 = arith.maxsi %172, %c0 : index
              %185 = arith.minsi %184, %c32 : index
              %186 = arith.subi %c0_i32, %168 : i32
              %187 = arith.maxsi %186, %c0_i32 : i32
              %188 = arith.index_cast %187 : i32 to index
              %189 = arith.minsi %188, %185 : index
              %190 = affine.apply #map4()[%185, %189]
              %191 = arith.cmpi slt, %190, %c32 : index
              %192 = arith.ori %191, %71 : i1
              %193 = arith.minsi %7, %190 : index
              %194 = affine.apply #map25()[%193, %185, %189]
              %195 = arith.minsi %194, %c16 : index
              %subview_167 = memref.subview %reinterpret_cast_162[%7, 0] [%195, %69] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %196 = arith.maxsi %189, %7 : index
              %197 = arith.minsi %185, %92 : index
              %198 = arith.maxsi %196, %197 : index
              %199 = affine.apply #map4()[%198, %196]
              %200 = affine.apply #map27()[%196, %6]
              %subview_168 = memref.subview %alloc_166[%200, %68] [%199, %69] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 154 : i64}
              scf.if %192 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_11(%alloc_166) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_167 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_168 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %98 : index
              hivm.hir.anchor {id = 155 : i64}
              %alloc_169 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
              %subview_170 = memref.subview %reinterpret_cast_163[%7, 0] [%195, %69] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_171 = memref.subview %alloc_169[%200, %68] [%199, %69] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 156 : i64}
              scf.if %192 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_12(%alloc_169) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_170 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_171 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %98 : index
              hivm.hir.anchor {id = 157 : i64}
              hivm.hir.anchor {id = 158 : i64}
              hivm.hir.anchor {id = 159 : i64}
              hivm.hir.anchor {id = 160 : i64}
              %alloc_172 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
              %subview_173 = memref.subview %reinterpret_cast_164[%7, 0] [%195, %69] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_174 = memref.subview %alloc_172[%200, %68] [%199, %69] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 161 : i64}
              scf.if %192 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_13(%alloc_172) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_173 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_174 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %73 : index
              hivm.hir.anchor {id = 162 : i64}
              hivm.hir.anchor {id = 163 : i64}
              hivm.hir.anchor {id = 164 : i64}
              hivm.hir.anchor {id = 165 : i64}
              hivm.hir.anchor {id = 166 : i64}
              %201 = arith.index_cast %168 : i32 to index
              %202 = affine.apply #map16()[%201]
              %203 = arith.maxsi %201, %54 : index
              %204 = arith.minsi %202, %203 : index
              %205 = affine.apply #map4()[%204, %201]
              %206 = arith.minsi %7, %205 : index
              %207 = affine.apply #map25()[%206, %204, %201]
              %208 = arith.minsi %207, %c16 : index
              hivm.hir.anchor {id = 167 : i64}
              hivm.hir.anchor {id = 168 : i64}
              hivm.hir.anchor {id = 169 : i64}
              hivm.hir.anchor {id = 170 : i64}
              hivm.hir.anchor {id = 171 : i64}
              hivm.hir.anchor {id = 172 : i64}
              %alloc_175 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_3_outlined_vf_0(%alloc_172, %alloc_149, %alloc_175) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              %subview_176 = memref.subview %alloc_175[0, 0] [%208, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
              %alloc_177 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
              %collapse_shape_178 = memref.collapse_shape %alloc_177 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
              hivm.hir.copy ins(%collapse_shape_39 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_178 : memref<2048xf32, #hivm.address_space<ub>>)
              %subview_179 = memref.subview %alloc_177[0, 0] [%208, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
              %collapse_shape_180 = memref.collapse_shape %subview_176 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
              %collapse_shape_181 = memref.collapse_shape %subview_179 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
              hivm.hir.copy ins(%collapse_shape_180 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_181 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
              %alloc_182 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
              %subview_183 = memref.subview %alloc_182[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
              annotation.mark %alloc_160 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<14>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              %alloc_184 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
              %subview_185 = memref.subview %alloc_184[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_3_outlined_merged_vf_0(%alloc_166, %alloc_177, %subview_183, %alloc_165, %alloc_169, %alloc_177, %subview_185) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>, memref<16xf32, #hivm.address_space<ub>>, memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
              hivm.hir.anchor {id = 173 : i64}
              hivm.hir.anchor {id = 174 : i64}
              hivm.hir.anchor {id = 175 : i64}
              %expand_shape_186 = memref.expand_shape %subview_183 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
              %collapse_shape_187 = memref.collapse_shape %expand_shape_186 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
              %collapse_shape_188 = memref.collapse_shape %subview_161 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_187 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_188 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              %expand_shape_189 = memref.expand_shape %subview_185 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
              annotation.mark %alloc_158 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<15>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 176 : i64}
              %collapse_shape_190 = memref.collapse_shape %expand_shape_189 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
              %collapse_shape_191 = memref.collapse_shape %subview_159 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_190 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_191 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              hivm.hir.anchor {id = 177 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 2 : i32, no_inline}
            hivm.hir.anchor {id = 178 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 179 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 180 : i64}
              hivm.hir.anchor {id = 181 : i64}
              hivm.hir.anchor {id = 182 : i64}
              hivm.hir.anchor {id = 183 : i64}
              hivm.hir.anchor {id = 184 : i64}
              hivm.hir.anchor {id = 185 : i64}
              hivm.hir.anchor {id = 186 : i64}
              hivm.hir.anchor {id = 187 : i64}
              hivm.hir.anchor {id = 188 : i64}
              hivm.hir.anchor {id = 189 : i64}
              hivm.hir.anchor {id = 190 : i64}
              hivm.hir.anchor {id = 191 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 192 : i64}
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.anchor {id = 193 : i64}
            %166 = scope.scope : () -> memref<16x128xf32, #hivm.address_space<ub>> {
              hivm.hir.anchor {id = 194 : i64}
              hivm.hir.anchor {id = 195 : i64}
              %alloc_162 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_4_outlined_vf_0(%alloc_156, %alloc_157, %arg24, %alloc_162) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              hivm.hir.anchor {id = 196 : i64}
              scope.return %alloc_162 : memref<16x128xf32, #hivm.address_space<ub>>
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 197 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 1
            scf.yield %166 : memref<16x128xf32, #hivm.address_space<ub>>
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop}
          hivm.hir.anchor {id = 198 : i64}
          hivm.hir.anchor {id = 199 : i64}
          hivm.hir.anchor {id = 200 : i64}
          hivm.hir.anchor {id = 201 : i64}
          %alloc_154 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %cast_155 = memref.cast %subview_7 {fold_offset_into_ptr} : memref<16x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x128xf32, #hivm.address_space<ub>>
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_5_outlined_vf_0(%165, %alloc_149, %cast_155, %alloc_154) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
          hivm.hir.anchor {id = 202 : i64}
          scf.yield %alloc_154 : memref<16x128xf32, #hivm.address_space<ub>>
        } else {
          hivm.hir.anchor {id = 203 : i64}
          %alloc_148 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_149 = memref.collapse_shape %alloc_148 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_39 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_149 : memref<2048xf32, #hivm.address_space<ub>>)
          scf.yield %alloc_148 : memref<16x128xf32, #hivm.address_space<ub>>
        }
        %alloc_87 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
        %subview_88 = memref.subview %alloc_87[%97, %68] [%96, %69] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 204 : i64}
        scf.if %72 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_14(%alloc_87) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_13 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_88 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %98 : index
        hivm.hir.anchor {id = 205 : i64}
        hivm.hir.anchor {id = 206 : i64}
        %alloc_89 = memref.alloc() {alignment = 64 : i64} : memref<16xf32, #hivm.address_space<ub>>
        hivm.hir.stride_load ins(%arg5 : memref<?xf32, #hivm.address_space<gm>>) outs(%alloc_89 : memref<16xf32, #hivm.address_space<ub>>) offset(%83 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%86 : i64])
        hivm.hir.anchor {id = 207 : i64}
        %alloc_90 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        %subview_91 = memref.subview %alloc_90[%113, %130] [%114, %129] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 208 : i64}
        scf.if %122 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_15(%alloc_90) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_23 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_91 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %131 : index
        hivm.hir.anchor {id = 209 : i64}
        hivm.hir.anchor {id = 210 : i64}
        %alloc_92 = memref.alloc() {alignment = 64 : i64} : memref<16x32xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_26(%alloc_90, %alloc_92) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 211 : i64}
        %alloc_93 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        %subview_94 = memref.subview %alloc_93[%113, %130] [%114, %129] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 212 : i64}
        scf.if %122 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_16(%alloc_93) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_26 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_94 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %131 : index
        hivm.hir.anchor {id = 213 : i64}
        hivm.hir.anchor {id = 214 : i64}
        %alloc_95 = memref.alloc() {alignment = 64 : i64} : memref<16x32xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_27(%alloc_93, %alloc_95) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 215 : i64}
        hivm.hir.anchor {id = 216 : i64}
        hivm.hir.anchor {id = 217 : i64}
        hivm.hir.anchor {id = 218 : i64}
        hivm.hir.anchor {id = 219 : i64}
        hivm.hir.anchor {id = 220 : i64}
        hivm.hir.anchor {id = 221 : i64}
        %alloc_96 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_13_outlined_vf_0(%alloc_89, %alloc_36, %alloc_45, %alloc_96) {hivm.vector_function, no_inline} : (memref<16xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 222 : i64}
        hivm.hir.anchor {id = 223 : i64}
        %alloc_97 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
        %subview_98 = memref.subview %alloc_97[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_12_outlined_vf_0(%alloc_87, %alloc_45, %subview_98) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_99 = memref.expand_shape %subview_98 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_100 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_101 = memref.subview %alloc_100[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_100 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<16>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        hivm.hir.anchor {id = 224 : i64}
        %collapse_shape_102 = memref.collapse_shape %expand_shape_99 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_103 = memref.collapse_shape %subview_101 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_102 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_103 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 225 : i64}
        hivm.hir.anchor {id = 226 : i64}
        %alloc_104 = memref.alloc() {alignment = 64 : i64} : memref<16x32xf32, #hivm.address_space<ub>>
        %alloc_105 = memref.alloc() : memref<4x17x8x1xf32, #hivm.address_space<ub>>
        %subview_106 = memref.subview %alloc_105[0, 0, 0, 0] [4, 16, 8, 1] [1, 1, 1, 1] : memref<4x17x8x1xf32, #hivm.address_space<ub>> to memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        %cast = memref.cast %subview_30 {fold_offset_into_ptr} : memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x32xi32, #hivm.address_space<ub>>
        %cast_107 = memref.cast %subview_31 {fold_offset_into_ptr} : memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x32xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_14_outlined_vf_0(%cast, %cast_107, %alloc_95, %alloc_92, %alloc_104, %subview_106) {hivm.vector_function, no_inline} : (memref<16x32xi32, #hivm.address_space<ub>>, memref<16x32xi32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>, memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_108 = memref.expand_shape %subview_106 [[0], [1, 2], [3]] output_shape [4, 1, 16, 8] : memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_109 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_110 = memref.subview %alloc_109[0, %6, 0, 0] [4, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_109 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<17>, hivm.tiling_dim = 1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 227 : i64}
        %collapse_shape_111 = memref.collapse_shape %expand_shape_108 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_112 = memref.collapse_shape %subview_110 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_111 : memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_112 : memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 228 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 229 : i64}
        %alloc_113 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_113 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 230 : i64}
        hivm.hir.anchor {id = 231 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_114 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_28(%alloc_113, %alloc_44, %alloc_114) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 232 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
        %alloc_115 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_29(%151, %alloc_114, %alloc_115) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 233 : i64}
        hivm.hir.anchor {id = 234 : i64}
        %alloc_116 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
        %subview_117 = memref.subview %alloc_116[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_15_outlined_vf_0(%alloc_96, %subview_117) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_118 = memref.expand_shape %subview_117 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_119 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_120 = memref.subview %alloc_119[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_119 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<18>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        hivm.hir.anchor {id = 235 : i64}
        %collapse_shape_121 = memref.collapse_shape %expand_shape_118 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_122 = memref.collapse_shape %subview_120 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_121 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_122 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 236 : i64}
        hivm.hir.anchor {id = 237 : i64}
        %alloc_123 = memref.alloc() : memref<4x17x8x1xf32, #hivm.address_space<ub>>
        %subview_124 = memref.subview %alloc_123[0, 0, 0, 0] [4, 16, 8, 1] [1, 1, 1, 1] : memref<4x17x8x1xf32, #hivm.address_space<ub>> to memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_16_outlined_vf_0(%alloc_104, %subview_124) {hivm.vector_function, no_inline} : (memref<16x32xf32, #hivm.address_space<ub>>, memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_125 = memref.expand_shape %subview_124 [[0], [1, 2], [3]] output_shape [4, 1, 16, 8] : memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_126 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_127 = memref.subview %alloc_126[0, %6, 0, 0] [4, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_126 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<19>, hivm.tiling_dim = 1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 238 : i64}
        %collapse_shape_128 = memref.collapse_shape %expand_shape_125 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_129 = memref.collapse_shape %subview_127 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_128 : memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_129 : memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 239 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 240 : i64}
        %alloc_130 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_130 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 241 : i64}
        hivm.hir.anchor {id = 242 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_131 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_30(%alloc_130, %alloc_44, %alloc_131) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 243 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 8
        hivm.hir.anchor {id = 244 : i64}
        %reinterpret_cast_132 = memref.reinterpret_cast %arg10 to offset: [%53], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_133 = memref.reinterpret_cast %arg11 to offset: [%53], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_134 = memref.reinterpret_cast %arg12 to offset: [%53], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_135 = memref.reinterpret_cast %arg13 to offset: [%53], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.anchor {id = 245 : i64}
        hivm.hir.anchor {id = 246 : i64}
        %alloc_136 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        %subview_137 = memref.subview %reinterpret_cast_134[%7, 0] [%91, %69] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_138 = memref.subview %alloc_136[%97, %68] [%96, %69] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 247 : i64}
        scf.if %72 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_17(%alloc_136) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_137 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_138 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %73 : index
        hivm.hir.anchor {id = 248 : i64}
        hivm.hir.anchor {id = 249 : i64}
        hivm.hir.anchor {id = 250 : i64}
        hivm.hir.anchor {id = 251 : i64}
        %alloc_139 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        %subview_140 = memref.subview %reinterpret_cast_132[%7, 0] [%91, %69] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_141 = memref.subview %alloc_139[%97, %68] [%96, %69] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 252 : i64}
        scf.if %72 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_18(%alloc_139) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_140 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_141 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %73 : index
        hivm.hir.anchor {id = 253 : i64}
        hivm.hir.anchor {id = 254 : i64}
        hivm.hir.anchor {id = 255 : i64}
        %alloc_142 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_143 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_17_outlined_vf_0(%alloc_80, %alloc_77, %alloc_115, %alloc_131, %alloc_36, %alloc_136, %alloc_139, %alloc_142, %alloc_143) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 256 : i64}
        %subview_144 = memref.subview %alloc_143[%97, %68] [%96, %69] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 257 : i64}
        %subview_145 = memref.subview %reinterpret_cast_133[%7, 0] [%91, %69] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_144 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_145 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        hivm.hir.anchor {id = 258 : i64}
        %subview_146 = memref.subview %alloc_142[%97, %68] [%96, %69] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 259 : i64}
        %subview_147 = memref.subview %reinterpret_cast_135[%7, 0] [%91, %69] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_146 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_147 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        hivm.hir.anchor {id = 260 : i64}
      }
      hivm.hir.set_ctrl true at ctrl[60]
      hivm.hir.anchor {id = 261 : i64}
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
    hivm.hir.anchor {id = 262 : i64}
    return
  }
}
