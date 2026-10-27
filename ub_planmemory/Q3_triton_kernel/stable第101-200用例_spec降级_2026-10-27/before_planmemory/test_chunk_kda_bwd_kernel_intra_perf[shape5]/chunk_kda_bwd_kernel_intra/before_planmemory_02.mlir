#map = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2 * 12288)>
#map1 = affine_map<()[s0, s1, s2] -> (s0 - s2 - s1 floordiv 12288)>
#map2 = affine_map<()[s0] -> (-s0 + (s0 floordiv 12288) * 12288 + 128)>
#map3 = affine_map<()[s0, s1] -> (s0 - s1)>
#map4 = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2)>
#map5 = affine_map<()[s0] -> (s0 + 128)>
#map6 = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2 * 6144)>
#map7 = affine_map<()[s0, s1, s2] -> (s0 - s2 - s1 floordiv 6144)>
#map8 = affine_map<()[s0] -> (-s0 + (s0 floordiv 6144) * 6144 + 64)>
#map9 = affine_map<()[s0, s1] -> ((s0 - s1) ceildiv 16)>
#map10 = affine_map<()[s0, s1] -> ((s0 - s1) ceildiv 8)>
#map11 = affine_map<(d0) -> (d0 floordiv 16)>
#map12 = affine_map<(d0) -> (d0 floordiv 8)>
#map13 = affine_map<(d0) -> (d0 mod 16)>
#map14 = affine_map<(d0) -> (d0 mod 8)>
#map15 = affine_map<()[s0] -> (s0 + 32)>
#map16 = affine_map<(d0) -> (d0 * 8)>
#map17 = affine_map<(d0) -> (d0, 0)>
#map18 = affine_map<(d0) -> (0, d0)>
#map19 = affine_map<()[s0, s1] -> (s0 + s1)>
#map20 = affine_map<(d0, d1) -> (0, d1)>
#map21 = affine_map<(d0, d1) -> (d1, d0)>
#map22 = affine_map<()[s0] -> (s0 * 16)>
#map23 = affine_map<()[s0] -> (s0 * 2)>
#map24 = affine_map<()[s0, s1, s2] -> (-s0 + s1 - s2)>
#map25 = affine_map<()[s0] -> (s0 * 16 + 16)>
#map26 = affine_map<()[s0, s1] -> (s0 - s1 * 16)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<MIX>, ssbuffer.insertionOptimization} {
  func.func @chunk_kda_bwd_kernel_intra_backup(%arg0: memref<?xi8> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg12: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32) attributes {DirectlyUsedGMArgIdxList = [5, 5, 14, 5], SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, annotation.filter_passes = #annotation.filter_passes<"hivm-insert-anchors-and-backup,hivm-delayed-cross-core-gss,split-simt-module,hivm-merge-same-preload-scopes">, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<20xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.backup_function, hivm.func_core_type = #hivm.func_core_type<MIX>, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
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
    %c128 = arith.constant 128 : index
    %cst_0 = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %cst_1 = arith.constant 0.693147182 : f32
    %cst_2 = arith.constant 0.000000e+00 : f16
    %cst_3 = arith.constant -1.000000e+00 : f16
    %cst_4 = arith.constant -1.000000e+00 : f32
    %true = arith.constant true
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg17, %arg18 : i32
    %1 = arith.muli %0, %arg19 : i32
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
    scf.for %arg20 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %4 = arith.remsi %arg20, %arg17 : i32
      %5 = arith.divsi %arg20, %arg17 : i32
      %6 = arith.remsi %5, %arg18 : i32
      %7 = arith.divsi %arg20, %0 : i32
      %8 = arith.remsi %7, %arg19 : i32
      %9 = tensor.empty() : tensor<32x128xf32>
      hivm.hir.anchor {id = 3 : i64}
      %10 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%cst : f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
      hivm.hir.anchor {id = 4 : i64}
      %11 = arith.divsi %8, %c96_i32 : i32
      %12 = arith.remsi %8, %c96_i32 : i32
      %13 = arith.divsi %4, %c2_i32 : i32
      %14 = arith.remsi %4, %c2_i32 : i32
      %15 = arith.extsi %arg16 : i32 to i64
      %16 = arith.muli %arg15, %arg16 : i32
      %17 = arith.muli %11, %arg16 : i32
      %18 = arith.muli %6, %c64_i32 : i32
      %19 = arith.muli %14, %c32_i32 : i32
      %20 = arith.addi %18, %19 : i32
      %21 = arith.cmpi sge, %20, %arg16 : i32
      scf.if %21 {
        hivm.hir.anchor {id = 5 : i64}
      } else {
        hivm.hir.anchor {id = 6 : i64}
        %22 = arith.muli %13, %c128_i32 : i32
        %23 = arith.muli %17, %c96_i32 : i32
        %24 = arith.addi %23, %12 : i32
        %25 = arith.extsi %24 : i32 to i64
        %26 = arith.muli %24, %c128_i32 : i32
        %27 = arith.index_cast %26 : i32 to index
        %28 = arith.muli %24, %c64_i32 : i32
        %29 = arith.index_cast %28 : i32 to index
        %30 = arith.muli %13, %16 : i32
        %31 = arith.addi %30, %17 : i32
        %32 = arith.muli %31, %c96_i32 : i32
        %33 = arith.addi %32, %12 : i32
        %34 = arith.maxsi %20, %c0_i32 : i32
        %35 = arith.index_cast %34 : i32 to index
        %36 = arith.maxsi %22, %c0_i32 : i32
        %37 = arith.index_cast %36 : i32 to index
        %38 = arith.index_cast %arg16 : i32 to index
        %39 = affine.apply #map()[%37, %27, %35]
        %reinterpret_cast = memref.reinterpret_cast %arg4 to offset: [%39], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %alloc = memref.alloc() : memref<32x128xf32>
        %40 = affine.apply #map1()[%38, %37, %35]
        %41 = arith.maxsi %40, %c0 : index
        %42 = arith.minsi %41, %c32 : index
        %43 = affine.apply #map2()[%37]
        %44 = arith.maxsi %43, %c0 : index
        %45 = arith.minsi %44, %c128 : index
        %46 = arith.subi %c0_i32, %20 : i32
        %47 = arith.maxsi %46, %c0_i32 : i32
        %48 = arith.index_cast %47 : i32 to index
        %49 = arith.minsi %48, %42 : index
        %50 = affine.apply #map3()[%42, %49]
        %51 = arith.subi %c0_i32, %22 : i32
        %52 = arith.maxsi %51, %c0_i32 : i32
        %53 = arith.index_cast %52 : i32 to index
        %54 = arith.minsi %53, %45 : index
        %55 = affine.apply #map3()[%45, %54]
        %56 = arith.cmpi slt, %50, %c32 : index
        %57 = arith.cmpi slt, %55, %c128 : index
        %58 = arith.ori %56, %57 : i1
        %subview = memref.subview %reinterpret_cast[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        %subview_5 = memref.subview %alloc[%49, %54] [%50, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        %59 = arith.remui %54, %c8 : index
        hivm.hir.anchor {id = 7 : i64}
        hivm.hir.load ins(%subview : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_5 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 8 : i64}
        %60 = bufferization.to_tensor %alloc restrict writable : memref<32x128xf32>
        %61 = arith.extsi %20 : i32 to i64
        %62 = arith.muli %61, %c96_i64 : i64
        %63 = arith.addi %25, %62 : i64
        %64 = arith.subi %15, %61 : i64
        %65 = arith.maxsi %64, %c0_i64 : i64
        %66 = arith.minsi %65, %c32_i64 : i64
        %67 = arith.minsi %66, %c32_i64 : i64
        %68 = tensor.empty() : tensor<32xf32>
        hivm.hir.anchor {id = 9 : i64}
        %69 = hivm.hir.stride_load ins(%arg5 : memref<?xf32>) outs(%68 : tensor<32xf32>) offset(%63 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%67 : i64]) {hivm.vf_mode = #hivm.vf_mode<SIMT>} -> tensor<32xf32>
        hivm.hir.anchor {id = 10 : i64}
        %70 = arith.cmpi sgt, %14, %c0_i32 : i32
        %71:2 = scf.if %70 -> (tensor<32x128xf32>, tensor<32x128xf32>) {
          hivm.hir.anchor {id = 11 : i64}
          %211 = arith.muli %20, %c12288_i32 : i32
          %212 = arith.index_cast %211 : i32 to index
          %213 = arith.index_cast %22 : i32 to index
          %214 = affine.apply #map4()[%213, %27, %212]
          %reinterpret_cast_84 = memref.reinterpret_cast %arg4 to offset: [%214], sizes: [128], strides: [1] : memref<?xf32> to memref<128xf32, strided<[1], offset: ?>>
          %alloc_85 = memref.alloc() : memref<128xf32>
          %215 = affine.apply #map5()[%213]
          %216 = arith.maxsi %213, %c128 : index
          %217 = arith.minsi %215, %216 : index
          %218 = affine.apply #map3()[%217, %213]
          %219 = arith.cmpi slt, %218, %c128 : index
          %subview_86 = memref.subview %reinterpret_cast_84[0] [%218] [1] : memref<128xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
          %subview_87 = memref.subview %alloc_85[0] [%218] [1] : memref<128xf32> to memref<?xf32, strided<[1]>>
          hivm.hir.anchor {id = 12 : i64}
          hivm.hir.load ins(%subview_86 : memref<?xf32, strided<[1], offset: ?>>) outs(%subview_87 : memref<?xf32, strided<[1]>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 init_out_buffer = true init_condition = %219 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
          hivm.hir.anchor {id = 13 : i64}
          %220 = bufferization.to_tensor %alloc_85 restrict writable : memref<128xf32>
          %expanded_88 = tensor.expand_shape %220 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
          %alloca = memref.alloca() {normalize_matmul_counter = 0 : i32} : memref<i32>
          hivm.hir.anchor {id = 14 : i64}
          memref.store %c0_i32, %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 15 : i64}
          %alloca_89 = memref.alloca() {normalize_matmul_counter = 1 : i32} : memref<i32>
          hivm.hir.anchor {id = 16 : i64}
          memref.store %c0_i32, %alloca_89[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 17 : i64}
          %221 = tensor.empty() : tensor<8x2x16x16xf32>
          %222:2 = scf.for %arg21 = %c0_i32 to %14 step %c1_i32 iter_args(%arg22 = %221, %arg23 = %221) -> (tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>)  : i32 {
            hivm.hir.anchor {id = 18 : i64}
            %alloc_92 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_92 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_93 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_93 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
            hivm.hir.anchor {id = 19 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 20 : i64}
              %237 = arith.muli %arg21, %c32_i32 : i32
              %238 = arith.addi %18, %237 : i32
              %239 = arith.maxsi %238, %c0_i32 : i32
              %240 = arith.index_cast %239 : i32 to index
              %241 = affine.apply #map()[%37, %27, %240]
              %reinterpret_cast_94 = memref.reinterpret_cast %arg3 to offset: [%241], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[12288, 1], offset: ?>>
              %reinterpret_cast_95 = memref.reinterpret_cast %arg4 to offset: [%241], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
              %alloc_96 = memref.alloc() : memref<32x128xbf16>
              %242 = affine.apply #map1()[%38, %37, %240]
              %243 = arith.maxsi %242, %c0 : index
              %244 = arith.minsi %243, %c32 : index
              %245 = arith.subi %c0_i32, %238 : i32
              %246 = arith.maxsi %245, %c0_i32 : i32
              %247 = arith.index_cast %246 : i32 to index
              %248 = arith.minsi %247, %244 : index
              %249 = affine.apply #map3()[%244, %248]
              %250 = arith.cmpi slt, %249, %c32 : index
              %251 = arith.ori %250, %57 : i1
              %subview_97 = memref.subview %reinterpret_cast_94[0, 0] [%249, %55] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
              %subview_98 = memref.subview %alloc_96[%248, %54] [%249, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
              %252 = arith.remui %54, %c16 : index
              hivm.hir.anchor {id = 21 : i64}
              hivm.hir.load ins(%subview_97 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_98 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %252 : index init_out_buffer = true init_condition = %251 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 22 : i64}
              %253 = bufferization.to_tensor %alloc_96 restrict writable : memref<32x128xbf16>
              %alloc_99 = memref.alloc() : memref<32x128xf32>
              %subview_100 = memref.subview %reinterpret_cast_95[0, 0] [%249, %55] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
              %subview_101 = memref.subview %alloc_99[%248, %54] [%249, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 23 : i64}
              hivm.hir.load ins(%subview_100 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_101 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %251 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 24 : i64}
              %254 = bufferization.to_tensor %alloc_99 restrict writable : memref<32x128xf32>
              hivm.hir.anchor {id = 25 : i64}
              %255 = hivm.hir.vsub ins(%expanded_88, %254 : tensor<1x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
              hivm.hir.anchor {id = 26 : i64}
              %256 = hivm.hir.vmul ins(%255, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 27 : i64}
              %257 = hivm.hir.vexp ins(%256 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 28 : i64}
              %258 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%253 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 29 : i64}
              %259 = hivm.hir.vmul ins(%258, %257 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 30 : i64}
              %expanded_102 = tensor.expand_shape %259 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
              %260 = tensor.empty() : tensor<16x32x8xf32>
              %261 = hivm.hir.vtranspose ins(%expanded_102 : tensor<32x16x8xf32>) outs(%260 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
              hivm.hir.anchor {id = 31 : i64}
              %expanded_103 = tensor.expand_shape %261 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
              annotation.mark %alloc_93 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 32 : i64}
              hivm.hir.copy ins(%expanded_103 : tensor<16x2x16x8xf32>) outs(%alloc_93 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 33 : i64}
              annotation.mark %alloc_92 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 34 : i64}
              hivm.hir.copy ins(%expanded_103 : tensor<16x2x16x8xf32>) outs(%alloc_92 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 35 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 36 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            %234 = bufferization.to_tensor %alloc_93 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %235 = bufferization.to_tensor %alloc_92 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 37 : i64}
            %236:2 = scope.scope : () -> (tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>) {
              hivm.hir.anchor {id = 38 : i64}
              %237 = arith.muli %arg21, %c32_i32 : i32
              %238 = arith.maxsi %237, %c0_i32 : i32
              %239 = arith.index_cast %238 : i32 to index
              %240 = affine.apply #map6()[%239, %29, %35]
              %reinterpret_cast_94 = memref.reinterpret_cast %arg6 to offset: [%240], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
              %reinterpret_cast_95 = memref.reinterpret_cast %arg7 to offset: [%240], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
              %241 = affine.apply #map7()[%38, %239, %35]
              %242 = arith.maxsi %241, %c0 : index
              %243 = arith.minsi %242, %c32 : index
              %244 = affine.apply #map8()[%239]
              %245 = arith.maxsi %244, %c0 : index
              %246 = arith.minsi %245, %c32 : index
              %247 = arith.minsi %48, %243 : index
              %248 = affine.apply #map3()[%243, %247]
              %249 = arith.subi %c0_i32, %237 : i32
              %250 = arith.maxsi %249, %c0_i32 : i32
              %251 = arith.index_cast %250 : i32 to index
              %252 = arith.minsi %251, %246 : index
              %253 = affine.apply #map3()[%246, %252]
              %254 = arith.cmpi slt, %248, %c32 : index
              %255 = arith.cmpi slt, %253, %c32 : index
              %256 = arith.ori %254, %255 : i1
              %subview_96 = memref.subview %reinterpret_cast_94[0, 0] [%248, %253] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
              %257 = affine.apply #map9()[%243, %247]
              %258 = affine.apply #map10()[%246, %252]
              %259 = affine.apply #map11(%247)
              %260 = affine.apply #map12(%252)
              %261 = affine.apply #map13(%247)
              %262 = affine.apply #map14(%252)
              %alloc_97 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_98 = memref.subview %alloc_97[%260, %259, %261, %262] [%258, %257, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 39 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_96 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_98 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %256 : i1
              hivm.hir.anchor {id = 40 : i64}
              %263 = bufferization.to_tensor %alloc_97 restrict writable : memref<4x2x16x8xf32>
              %subview_99 = memref.subview %reinterpret_cast_95[0, 0] [%248, %253] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
              %alloc_100 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_101 = memref.subview %alloc_100[%260, %259, %261, %262] [%258, %257, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 41 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_99 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_101 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %256 : i1
              hivm.hir.anchor {id = 42 : i64}
              %264 = bufferization.to_tensor %alloc_100 restrict writable : memref<4x2x16x8xf32>
              hivm.hir.anchor {id = 43 : i64}
              %265 = memref.load %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 44 : i64}
              %266 = arith.cmpi eq, %265, %c0_i32 : i32
              %267 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%263, %234, %266, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%arg22 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 45 : i64}
              %268 = arith.addi %265, %c1_i32 : i32
              memref.store %268, %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 46 : i64}
              %269 = memref.load %alloca_89[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 47 : i64}
              %270 = arith.cmpi eq, %269, %c0_i32 : i32
              %271 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%264, %235, %270, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%arg23 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 48 : i64}
              %272 = arith.addi %269, %c1_i32 : i32
              memref.store %272, %alloca_89[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 49 : i64}
              scope.return %267, %271 : tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 50 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
            scf.yield %236#0, %236#1 : tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop, may_not_exec, normalized_in_L0C = [0 : i32, 1 : i32]}
          hivm.hir.anchor {id = 51 : i64}
          %223 = memref.load %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 52 : i64}
          %224 = arith.cmpi eq, %223, %c0_i32 : i32
          %alloc_90 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_90 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>} : memref<32x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.anchor {id = 53 : i64}
          %225 = scf.if %224 -> (tensor<32x128xf32>) {
            hivm.hir.anchor {id = 54 : i64}
            scf.yield %10 : tensor<32x128xf32>
          } else {
            hivm.hir.anchor {id = 55 : i64}
            %memspacecast_92 = memref.memory_space_cast %alloc_90 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
            %234 = bufferization.to_tensor %memspacecast_92 restrict writable : memref<32x128xf32>
            hivm.hir.anchor {id = 56 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%222#0 : tensor<8x2x16x16xf32>) outs(%alloc_90 : memref<32x128xf32, #hivm.address_space<ub>>)
            hivm.hir.anchor {id = 57 : i64}
            scf.yield %234 : tensor<32x128xf32>
          } {fallback_not_exec}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 58 : i64}
          %226 = memref.load %alloca_89[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 59 : i64}
          %227 = arith.cmpi eq, %226, %c0_i32 : i32
          %alloc_91 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_91 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>} : memref<32x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
          hivm.hir.anchor {id = 60 : i64}
          %228 = scf.if %227 -> (tensor<32x128xf32>) {
            hivm.hir.anchor {id = 61 : i64}
            scf.yield %10 : tensor<32x128xf32>
          } else {
            hivm.hir.anchor {id = 62 : i64}
            %memspacecast_92 = memref.memory_space_cast %alloc_91 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
            %234 = bufferization.to_tensor %memspacecast_92 restrict writable : memref<32x128xf32>
            hivm.hir.anchor {id = 63 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%222#1 : tensor<8x2x16x16xf32>) outs(%alloc_91 : memref<32x128xf32, #hivm.address_space<ub>>)
            hivm.hir.anchor {id = 64 : i64}
            scf.yield %234 : tensor<32x128xf32>
          } {fallback_not_exec}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 65 : i64}
          %229 = hivm.hir.vsub ins(%60, %expanded_88 : tensor<32x128xf32>, tensor<1x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
          hivm.hir.anchor {id = 66 : i64}
          %230 = hivm.hir.vmul ins(%229, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 67 : i64}
          %231 = hivm.hir.vexp ins(%230 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 68 : i64}
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %232 = hivm.hir.vmul ins(%225, %231 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 69 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %233 = hivm.hir.vmul ins(%228, %231 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 70 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
          scf.yield %232, %233 : tensor<32x128xf32>, tensor<32x128xf32>
        } else {
          hivm.hir.anchor {id = 71 : i64}
          scf.yield %10, %10 : tensor<32x128xf32>, tensor<32x128xf32>
        }
        %72 = tensor.empty() : tensor<32xi32>
        hivm.hir.anchor {id = 72 : i64}
        %73 = hivm.hir.varange offset[%c0] strides[%c1] outs(%72 : tensor<32xi32>) -> tensor<32xi32>
        hivm.hir.anchor {id = 73 : i64}
        %reinterpret_cast_6 = memref.reinterpret_cast %arg2 to offset: [%39], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[12288, 1], offset: ?>>
        %reinterpret_cast_7 = memref.reinterpret_cast %arg3 to offset: [%39], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[12288, 1], offset: ?>>
        %alloc_8 = memref.alloc() : memref<32x128xbf16>
        %subview_9 = memref.subview %reinterpret_cast_6[0, 0] [%50, %55] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
        %subview_10 = memref.subview %alloc_8[%49, %54] [%50, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        %74 = arith.remui %54, %c16 : index
        hivm.hir.anchor {id = 74 : i64}
        hivm.hir.load ins(%subview_9 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_10 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %74 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 75 : i64}
        %75 = bufferization.to_tensor %alloc_8 restrict writable : memref<32x128xbf16>
        %alloc_11 = memref.alloc() : memref<32x128xbf16>
        %subview_12 = memref.subview %reinterpret_cast_7[0, 0] [%50, %55] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
        %subview_13 = memref.subview %alloc_11[%49, %54] [%50, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 76 : i64}
        hivm.hir.load ins(%subview_12 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_13 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %74 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 77 : i64}
        %76 = bufferization.to_tensor %alloc_11 restrict writable : memref<32x128xbf16>
        %77 = arith.subi %arg16, %20 : i32
        %78 = arith.subi %77, %c1_i32 : i32
        %79 = arith.minsi %78, %c16_i32 : i32
        %80 = arith.trunci %79 : i32 to i16
        %81 = arith.extsi %80 : i16 to i32
        %82 = tensor.empty() : tensor<1x128xi32>
        hivm.hir.anchor {id = 78 : i64}
        %83 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%81 : i32) outs(%82 : tensor<1x128xi32>) -> tensor<1x128xi32>
        hivm.hir.anchor {id = 79 : i64}
        %84 = tensor.empty() : tensor<1x128xf32>
        %85 = hivm.hir.vgather {hivm.vf_mode = #hivm.vf_mode<SIMT>} ins(%60 : tensor<32x128xf32>) indices(%83 : tensor<1x128xi32>) outs(%84 : tensor<1x128xf32>) gather_axis = 0 -> tensor<1x128xf32>
        hivm.hir.anchor {id = 80 : i64}
        %86 = arith.maxsi %19, %c0_i32 : i32
        %87 = arith.index_cast %86 : i32 to index
        %88 = affine.apply #map6()[%87, %29, %35]
        %reinterpret_cast_14 = memref.reinterpret_cast %arg6 to offset: [%88], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
        %reinterpret_cast_15 = memref.reinterpret_cast %arg7 to offset: [%88], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
        %alloc_16 = memref.alloc() : memref<32x32xf32>
        %89 = affine.apply #map7()[%38, %87, %35]
        %90 = arith.maxsi %89, %c0 : index
        %91 = arith.minsi %90, %c32 : index
        %92 = affine.apply #map8()[%87]
        %93 = arith.maxsi %92, %c0 : index
        %94 = arith.minsi %93, %c32 : index
        %95 = arith.minsi %48, %91 : index
        %96 = affine.apply #map3()[%91, %95]
        %97 = arith.subi %c0_i32, %19 : i32
        %98 = arith.maxsi %97, %c0_i32 : i32
        %99 = arith.index_cast %98 : i32 to index
        %100 = arith.minsi %99, %94 : index
        %101 = affine.apply #map3()[%94, %100]
        %102 = arith.cmpi slt, %96, %c32 : index
        %103 = arith.cmpi slt, %101, %c32 : index
        %104 = arith.ori %102, %103 : i1
        %subview_17 = memref.subview %reinterpret_cast_14[0, 0] [%96, %101] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
        %subview_18 = memref.subview %alloc_16[%95, %100] [%96, %101] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        %105 = arith.remui %100, %c8 : index
        hivm.hir.anchor {id = 81 : i64}
        hivm.hir.load ins(%subview_17 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_18 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %105 : index init_out_buffer = true init_condition = %104 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 82 : i64}
        %106 = bufferization.to_tensor %alloc_16 restrict writable : memref<32x32xf32>
        %alloc_19 = memref.alloc() : memref<32x32xf32>
        %subview_20 = memref.subview %reinterpret_cast_15[0, 0] [%96, %101] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
        %subview_21 = memref.subview %alloc_19[%95, %100] [%96, %101] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        hivm.hir.anchor {id = 83 : i64}
        hivm.hir.load ins(%subview_20 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_21 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %105 : index init_out_buffer = true init_condition = %104 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 84 : i64}
        %107 = bufferization.to_tensor %alloc_19 restrict writable : memref<32x32xf32>
        %expanded = tensor.expand_shape %73 [[0, 1]] output_shape [1, 32] : tensor<32xi32> into tensor<1x32xi32>
        %expanded_22 = tensor.expand_shape %73 [[0, 1]] output_shape [32, 1] : tensor<32xi32> into tensor<32x1xi32>
        %108 = tensor.empty() : tensor<32x32xi32>
        hivm.hir.anchor {id = 85 : i64}
        %109 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_22 : tensor<32x1xi32>) outs(%108 : tensor<32x32xi32>) broadcast_dims = [1] -> tensor<32x32xi32>
        hivm.hir.anchor {id = 86 : i64}
        %110 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded : tensor<1x32xi32>) outs(%108 : tensor<32x32xi32>) broadcast_dims = [0] -> tensor<32x32xi32>
        hivm.hir.anchor {id = 87 : i64}
        %111 = tensor.empty() : tensor<32x32xi1>
        %112 = hivm.hir.vcmp ins(%109, %110 : tensor<32x32xi32>, tensor<32x32xi32>) outs(%111 : tensor<32x32xi1>) compare_mode = <ge> -> tensor<32x32xi1>
        hivm.hir.anchor {id = 88 : i64}
        %113 = tensor.empty() : tensor<1x32xi32>
        %114 = hivm.hir.vadd ins(%expanded, %20 : tensor<1x32xi32>, i32) outs(%113 : tensor<1x32xi32>) -> tensor<1x32xi32>
        hivm.hir.anchor {id = 89 : i64}
        %115 = tensor.empty() : tensor<1x32xi1>
        %116 = hivm.hir.vcmp ins(%114, %arg16 : tensor<1x32xi32>, i32) outs(%115 : tensor<1x32xi1>) compare_mode = <lt> -> tensor<1x32xi1>
        hivm.hir.anchor {id = 90 : i64}
        %collapsed = tensor.collapse_shape %116 [[0, 1]] : tensor<1x32xi1> into tensor<32xi1>
        %117 = tensor.empty() : tensor<32xf16>
        %118 = hivm.hir.vsel ins(%collapsed, %cst_3, %cst_2 : tensor<32xi1>, f16, f16) outs(%117 : tensor<32xf16>) -> tensor<32xf16>
        hivm.hir.anchor {id = 91 : i64}
        %expanded_23 = tensor.expand_shape %118 [[0, 1]] output_shape [1, 32] : tensor<32xf16> into tensor<1x32xf16>
        %119 = tensor.empty() : tensor<32x32xf16>
        %120 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_23 : tensor<1x32xf16>) outs(%119 : tensor<32x32xf16>) broadcast_dims = [0] -> tensor<32x32xf16>
        hivm.hir.anchor {id = 92 : i64}
        %121 = hivm.hir.vcmp ins(%120, %cst_2 : tensor<32x32xf16>, f16) outs(%111 : tensor<32x32xi1>) compare_mode = <ne> -> tensor<32x32xi1>
        hivm.hir.anchor {id = 93 : i64}
        %122 = hivm.hir.vand ins(%112, %121 : tensor<32x32xi1>, tensor<32x32xi1>) outs(%111 : tensor<32x32xi1>) -> tensor<32x32xi1>
        hivm.hir.anchor {id = 94 : i64}
        %123 = tensor.empty() : tensor<32x32xf32>
        %124 = hivm.hir.vsel ins(%122, %106, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%123 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 95 : i64}
        %125 = hivm.hir.vsel ins(%122, %107, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%123 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 96 : i64}
        %126 = hivm.hir.vsub ins(%60, %85 : tensor<32x128xf32>, tensor<1x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
        hivm.hir.anchor {id = 97 : i64}
        %127 = arith.index_cast %20 : i32 to index
        %128 = affine.apply #map15()[%127]
        %129 = arith.maxsi %127, %38 : index
        %130 = arith.minsi %128, %129 : index
        %131 = affine.apply #map3()[%130, %127]
        %extracted_slice = tensor.extract_slice %126[0, 0] [%131, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x128xf32>
        hivm.hir.anchor {id = 98 : i64}
        %inserted_slice = tensor.insert_slice %extracted_slice into %10[0, 0] [%131, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<?x128xf32> into tensor<32x128xf32>
        hivm.hir.anchor {id = 99 : i64}
        %132 = hivm.hir.vmul ins(%inserted_slice, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 100 : i64}
        %133 = hivm.hir.vexp ins(%132 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 101 : i64}
        %134 = hivm.hir.vmul ins(%inserted_slice, %cst_4 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 102 : i64}
        %135 = hivm.hir.vmul ins(%134, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 103 : i64}
        %136 = hivm.hir.vexp ins(%135 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 104 : i64}
        %137 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%76 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 105 : i64}
        %138 = hivm.hir.vmul ins(%137, %136 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 106 : i64}
        %expanded_24 = tensor.expand_shape %138 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
        %139 = tensor.empty() : tensor<16x32x8xf32>
        %140 = hivm.hir.vtranspose ins(%expanded_24 : tensor<32x16x8xf32>) outs(%139 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
        hivm.hir.anchor {id = 107 : i64}
        %expanded_25 = tensor.expand_shape %140 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
        %alloc_26 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_26 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %141 = bufferization.to_tensor %alloc_26 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        hivm.hir.anchor {id = 108 : i64}
        hivm.hir.copy ins(%expanded_25 : tensor<16x2x16x8xf32>) outs(%alloc_26 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 109 : i64}
        %expanded_27 = tensor.expand_shape %124 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %142 = tensor.empty() : tensor<4x32x8xf32>
        %143 = hivm.hir.vtranspose ins(%expanded_27 : tensor<32x4x8xf32>) outs(%142 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 110 : i64}
        %expanded_28 = tensor.expand_shape %143 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_29 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_29 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %144 = bufferization.to_tensor %alloc_29 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 111 : i64}
        hivm.hir.copy ins(%expanded_28 : tensor<4x2x16x8xf32>) outs(%alloc_29 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 112 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %145 = tensor.empty() : tensor<8x2x16x16xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %146 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%144, %141, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 113 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        %alloc_30 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_30 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast = memref.memory_space_cast %alloc_30 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %147 = bufferization.to_tensor %memspacecast restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.anchor {id = 114 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%146 : tensor<8x2x16x16xf32>) outs(%alloc_30 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 115 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %148 = hivm.hir.vmul ins(%147, %133 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 116 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        %149 = hivm.hir.vadd ins(%71#0, %148 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 117 : i64}
        %alloc_31 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_31 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %150 = bufferization.to_tensor %alloc_31 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        hivm.hir.anchor {id = 118 : i64}
        hivm.hir.copy ins(%expanded_25 : tensor<16x2x16x8xf32>) outs(%alloc_31 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 119 : i64}
        %expanded_32 = tensor.expand_shape %125 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %151 = hivm.hir.vtranspose ins(%expanded_32 : tensor<32x4x8xf32>) outs(%142 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 120 : i64}
        %expanded_33 = tensor.expand_shape %151 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_34 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_34 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %152 = bufferization.to_tensor %alloc_34 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 121 : i64}
        hivm.hir.copy ins(%expanded_33 : tensor<4x2x16x8xf32>) outs(%alloc_34 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 122 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %153 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%152, %150, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 123 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        %alloc_35 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_35 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast_36 = memref.memory_space_cast %alloc_35 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %154 = bufferization.to_tensor %memspacecast_36 restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.anchor {id = 124 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%153 : tensor<8x2x16x16xf32>) outs(%alloc_35 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 125 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %155 = hivm.hir.vmul ins(%154, %133 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 126 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        %156 = hivm.hir.vadd ins(%71#1, %155 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 127 : i64}
        %157 = hivm.hir.vmul ins(%156, %137 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 128 : i64}
        %158 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%cst : f32) outs(%68 : tensor<32xf32>) -> tensor<32xf32>
        hivm.hir.anchor {id = 129 : i64}
        %expanded_37 = tensor.expand_shape %158 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
        %159 = hivm.hir.vreduce <sum> ins(%157 : tensor<32x128xf32>) outs(%expanded_37 : tensor<32x1xf32>) reduce_dims = [1] -> tensor<32x1xf32>
        hivm.hir.anchor {id = 130 : i64}
        %collapsed_38 = tensor.collapse_shape %159 [[0, 1]] : tensor<32x1xf32> into tensor<32xf32>
        %expanded_39 = tensor.expand_shape %69 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
        %160 = hivm.hir.vmul ins(%156, %expanded_39 : tensor<32x128xf32>, tensor<32x1xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [1] -> tensor<32x128xf32>
        hivm.hir.anchor {id = 131 : i64}
        %reinterpret_cast_40 = memref.reinterpret_cast %arg8 to offset: [%39], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %reinterpret_cast_41 = memref.reinterpret_cast %arg9 to offset: [%39], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %161 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%75 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 132 : i64}
        %162 = hivm.hir.vmul ins(%161, %149 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 133 : i64}
        %alloc_42 = memref.alloc() : memref<32x128xf32>
        %subview_43 = memref.subview %reinterpret_cast_40[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        %subview_44 = memref.subview %alloc_42[%49, %54] [%50, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 134 : i64}
        hivm.hir.load ins(%subview_43 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_44 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 135 : i64}
        %163 = bufferization.to_tensor %alloc_42 restrict writable : memref<32x128xf32>
        hivm.hir.anchor {id = 136 : i64}
        %164 = hivm.hir.vadd ins(%149, %163 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 137 : i64}
        %extracted_slice_45 = tensor.extract_slice %164[%49, %54] [%50, %55] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x?xf32>
        hivm.hir.anchor {id = 138 : i64}
        %subview_46 = memref.subview %reinterpret_cast_41[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        hivm.hir.store ins(%extracted_slice_45 : tensor<?x?xf32>) outs(%subview_46 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 139 : i64}
        %165 = arith.extsi %33 : i32 to i64
        %166 = arith.addi %165, %62 : i64
        hivm.hir.stride_store ins(%collapsed_38 : tensor<32xf32>) outs(%arg14 : memref<?xf32>) offset(%166 : i64) strides([%c96_i64 : i64]) numels([%67 : i64]) {hivm.vf_mode = #hivm.vf_mode<SIMT>}
        hivm.hir.anchor {id = 140 : i64}
        %167 = arith.subi %arg16, %18 : i32
        %168 = arith.addi %167, %c31_i32 : i32
        %169 = arith.divsi %168, %c32_i32 : i32
        %170 = arith.minsi %169, %c2_i32 : i32
        %171 = arith.subi %170, %c1_i32 : i32
        %172 = arith.cmpi slt, %14, %171 : i32
        %173 = scf.if %172 -> (tensor<32x128xf32>) {
          hivm.hir.anchor {id = 141 : i64}
          %211 = arith.addi %20, %c32_i32 : i32
          %212 = arith.minsi %211, %arg16 : i32
          %213 = arith.subi %212, %c1_i32 : i32
          %214 = arith.muli %213, %c12288_i32 : i32
          %215 = arith.index_cast %214 : i32 to index
          %216 = arith.index_cast %22 : i32 to index
          %217 = affine.apply #map4()[%216, %27, %215]
          %reinterpret_cast_84 = memref.reinterpret_cast %arg4 to offset: [%217], sizes: [128], strides: [1] : memref<?xf32> to memref<128xf32, strided<[1], offset: ?>>
          %alloc_85 = memref.alloc() : memref<128xf32>
          %218 = affine.apply #map5()[%216]
          %219 = arith.maxsi %216, %c128 : index
          %220 = arith.minsi %218, %219 : index
          %221 = affine.apply #map3()[%220, %216]
          %222 = arith.cmpi slt, %221, %c128 : index
          %subview_86 = memref.subview %reinterpret_cast_84[0] [%221] [1] : memref<128xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
          %subview_87 = memref.subview %alloc_85[0] [%221] [1] : memref<128xf32> to memref<?xf32, strided<[1]>>
          hivm.hir.anchor {id = 142 : i64}
          hivm.hir.load ins(%subview_86 : memref<?xf32, strided<[1], offset: ?>>) outs(%subview_87 : memref<?xf32, strided<[1]>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 init_out_buffer = true init_condition = %222 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
          hivm.hir.anchor {id = 143 : i64}
          %223 = bufferization.to_tensor %alloc_85 restrict writable : memref<128xf32>
          %224 = arith.addi %14, %c1_i32 : i32
          %expanded_88 = tensor.expand_shape %223 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
          hivm.hir.anchor {id = 144 : i64}
          %225 = scf.for %arg21 = %224 to %170 step %c1_i32 iter_args(%arg22 = %10) -> (tensor<32x128xf32>)  : i32 {
            hivm.hir.anchor {id = 145 : i64}
            %alloc_89 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_89 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<32x128xf32, #hivm.address_space<ub>>
            %alloc_90 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_90 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<32x128xf32, #hivm.address_space<ub>>
            %alloc_91 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_91 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_92 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_92 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            hivm.hir.anchor {id = 146 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 147 : i64}
              %235 = arith.muli %arg21, %c32_i32 : i32
              %236 = arith.addi %18, %235 : i32
              %237 = arith.maxsi %236, %c0_i32 : i32
              %238 = arith.index_cast %237 : i32 to index
              %239 = affine.apply #map()[%37, %27, %238]
              %reinterpret_cast_93 = memref.reinterpret_cast %arg2 to offset: [%239], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[12288, 1], offset: ?>>
              %reinterpret_cast_94 = memref.reinterpret_cast %arg3 to offset: [%239], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[12288, 1], offset: ?>>
              %reinterpret_cast_95 = memref.reinterpret_cast %arg4 to offset: [%239], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
              %240 = arith.extsi %236 : i32 to i64
              %241 = arith.muli %240, %c96_i64 : i64
              %242 = arith.addi %25, %241 : i64
              %243 = arith.subi %15, %240 : i64
              %244 = arith.maxsi %243, %c0_i64 : i64
              %245 = arith.minsi %244, %c32_i64 : i64
              %246 = arith.minsi %245, %c32_i64 : i64
              hivm.hir.anchor {id = 148 : i64}
              %247 = hivm.hir.stride_load ins(%arg5 : memref<?xf32>) outs(%68 : tensor<32xf32>) offset(%242 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%246 : i64]) {hivm.vf_mode = #hivm.vf_mode<SIMT>} -> tensor<32xf32>
              hivm.hir.anchor {id = 149 : i64}
              %alloc_96 = memref.alloc() : memref<32x128xbf16>
              %248 = affine.apply #map1()[%38, %37, %238]
              %249 = arith.maxsi %248, %c0 : index
              %250 = arith.minsi %249, %c32 : index
              %251 = arith.subi %c0_i32, %236 : i32
              %252 = arith.maxsi %251, %c0_i32 : i32
              %253 = arith.index_cast %252 : i32 to index
              %254 = arith.minsi %253, %250 : index
              %255 = affine.apply #map3()[%250, %254]
              %256 = arith.cmpi slt, %255, %c32 : index
              %257 = arith.ori %256, %57 : i1
              %subview_97 = memref.subview %reinterpret_cast_93[0, 0] [%255, %55] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
              %subview_98 = memref.subview %alloc_96[%254, %54] [%255, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 150 : i64}
              hivm.hir.load ins(%subview_97 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_98 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %74 : index init_out_buffer = true init_condition = %257 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 151 : i64}
              %258 = bufferization.to_tensor %alloc_96 restrict writable : memref<32x128xbf16>
              %alloc_99 = memref.alloc() : memref<32x128xbf16>
              %subview_100 = memref.subview %reinterpret_cast_94[0, 0] [%255, %55] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>>
              %subview_101 = memref.subview %alloc_99[%254, %54] [%255, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 152 : i64}
              hivm.hir.load ins(%subview_100 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_101 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %74 : index init_out_buffer = true init_condition = %257 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 153 : i64}
              %259 = bufferization.to_tensor %alloc_99 restrict writable : memref<32x128xbf16>
              hivm.hir.anchor {id = 154 : i64}
              %260 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%259 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 155 : i64}
              %expanded_102 = tensor.expand_shape %247 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
              %261 = hivm.hir.vmul ins(%260, %expanded_102 : tensor<32x128xf32>, tensor<32x1xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [1] -> tensor<32x128xf32>
              hivm.hir.anchor {id = 156 : i64}
              %alloc_103 = memref.alloc() : memref<32x128xf32>
              %subview_104 = memref.subview %reinterpret_cast_95[0, 0] [%255, %55] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
              %subview_105 = memref.subview %alloc_103[%254, %54] [%255, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 157 : i64}
              hivm.hir.load ins(%subview_104 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_105 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %257 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 158 : i64}
              %262 = bufferization.to_tensor %alloc_103 restrict writable : memref<32x128xf32>
              hivm.hir.anchor {id = 159 : i64}
              %263 = hivm.hir.vsub ins(%262, %expanded_88 : tensor<32x128xf32>, tensor<1x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
              hivm.hir.anchor {id = 160 : i64}
              %264 = hivm.hir.vmul ins(%263, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 161 : i64}
              %265 = hivm.hir.vexp ins(%264 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 162 : i64}
              %266 = arith.index_cast %236 : i32 to index
              %267 = affine.apply #map15()[%266]
              %268 = arith.maxsi %266, %38 : index
              %269 = arith.minsi %267, %268 : index
              %270 = affine.apply #map3()[%269, %266]
              %extracted_slice_106 = tensor.extract_slice %265[0, 0] [%270, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x128xf32>
              hivm.hir.anchor {id = 163 : i64}
              %inserted_slice_107 = tensor.insert_slice %extracted_slice_106 into %10[0, 0] [%270, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<?x128xf32> into tensor<32x128xf32>
              hivm.hir.anchor {id = 164 : i64}
              %271 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%258 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 165 : i64}
              %272 = hivm.hir.vmul ins(%271, %inserted_slice_107 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 166 : i64}
              %273 = hivm.hir.vmul ins(%261, %inserted_slice_107 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 167 : i64}
              %expanded_108 = tensor.expand_shape %272 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
              %274 = hivm.hir.vtranspose ins(%expanded_108 : tensor<32x16x8xf32>) outs(%139 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
              hivm.hir.anchor {id = 168 : i64}
              %expanded_109 = tensor.expand_shape %274 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
              annotation.mark %alloc_92 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<14>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 169 : i64}
              hivm.hir.copy ins(%expanded_109 : tensor<16x2x16x8xf32>) outs(%alloc_92 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 170 : i64}
              %expanded_110 = tensor.expand_shape %273 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
              %275 = hivm.hir.vtranspose ins(%expanded_110 : tensor<32x16x8xf32>) outs(%139 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
              hivm.hir.anchor {id = 171 : i64}
              %expanded_111 = tensor.expand_shape %275 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
              annotation.mark %alloc_91 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<15>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 172 : i64}
              hivm.hir.copy ins(%expanded_111 : tensor<16x2x16x8xf32>) outs(%alloc_91 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 173 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 2 : i32, no_inline}
            hivm.hir.anchor {id = 174 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            %230 = bufferization.to_tensor %alloc_92 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %231 = bufferization.to_tensor %alloc_91 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 1
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 175 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 176 : i64}
              %235 = arith.muli %arg21, %c32_i32 : i32
              %236 = arith.addi %18, %235 : i32
              %237 = arith.maxsi %236, %c0_i32 : i32
              %238 = arith.index_cast %237 : i32 to index
              %239 = arith.subi %c0_i32, %236 : i32
              %240 = arith.maxsi %239, %c0_i32 : i32
              %241 = arith.index_cast %240 : i32 to index
              %242 = affine.apply #map6()[%87, %29, %238]
              %reinterpret_cast_93 = memref.reinterpret_cast %arg6 to offset: [%242], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
              %243 = affine.apply #map7()[%38, %87, %238]
              %244 = arith.maxsi %243, %c0 : index
              %245 = arith.minsi %244, %c32 : index
              %246 = arith.minsi %241, %245 : index
              %247 = affine.apply #map3()[%245, %246]
              %248 = arith.cmpi slt, %247, %c32 : index
              %249 = arith.ori %248, %103 : i1
              %subview_94 = memref.subview %reinterpret_cast_93[0, 0] [%247, %101] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
              %250 = affine.apply #map9()[%245, %246]
              %251 = affine.apply #map10()[%94, %100]
              %252 = affine.apply #map11(%246)
              %253 = affine.apply #map12(%100)
              %254 = affine.apply #map13(%246)
              %255 = affine.apply #map14(%100)
              %alloc_95 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_96 = memref.subview %alloc_95[%253, %252, %254, %255] [%251, %250, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 177 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_94 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_96 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %249 : i1
              hivm.hir.anchor {id = 178 : i64}
              %256 = bufferization.to_tensor %alloc_95 restrict writable : memref<4x2x16x8xf32>
              %reinterpret_cast_97 = memref.reinterpret_cast %arg7 to offset: [%242], sizes: [32, 32], strides: [6144, 1] : memref<?xf32> to memref<32x32xf32, strided<[6144, 1], offset: ?>>
              %subview_98 = memref.subview %reinterpret_cast_97[0, 0] [%247, %101] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>> to memref<?x?xf32, strided<[6144, 1], offset: ?>>
              %alloc_99 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_100 = memref.subview %alloc_99[%253, %252, %254, %255] [%251, %250, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 179 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_98 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_100 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %249 : i1
              hivm.hir.anchor {id = 180 : i64}
              %257 = bufferization.to_tensor %alloc_99 restrict writable : memref<4x2x16x8xf32>
              hivm.hir.anchor {id = 181 : i64}
              %258 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%256, %230, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 182 : i64}
              annotation.mark %alloc_90 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>} : memref<32x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 183 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%258 : tensor<8x2x16x16xf32>) outs(%alloc_90 : memref<32x128xf32, #hivm.address_space<ub>>)
              hivm.hir.anchor {id = 184 : i64}
              %259 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%257, %231, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 185 : i64}
              annotation.mark %alloc_89 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>} : memref<32x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 186 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%259 : tensor<8x2x16x16xf32>) outs(%alloc_89 : memref<32x128xf32, #hivm.address_space<ub>>)
              hivm.hir.anchor {id = 187 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 188 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            %232 = bufferization.to_tensor %alloc_90 restrict writable : memref<32x128xf32, #hivm.address_space<ub>>
            %233 = bufferization.to_tensor %alloc_89 restrict writable : memref<32x128xf32, #hivm.address_space<ub>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.anchor {id = 189 : i64}
            %234 = scope.scope : () -> tensor<32x128xf32> {
              hivm.hir.anchor {id = 190 : i64}
              %235 = hivm.hir.vadd ins(%232, %arg22 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 191 : i64}
              %236 = hivm.hir.vadd ins(%233, %235 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 192 : i64}
              scope.return %236 : tensor<32x128xf32>
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 193 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 1
            scf.yield %234 : tensor<32x128xf32>
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop}
          hivm.hir.anchor {id = 194 : i64}
          %226 = hivm.hir.vsub ins(%expanded_88, %60 : tensor<1x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
          hivm.hir.anchor {id = 195 : i64}
          %227 = hivm.hir.vmul ins(%226, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 196 : i64}
          %228 = hivm.hir.vexp ins(%227 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 197 : i64}
          %229 = hivm.hir.vmul ins(%225, %228 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 198 : i64}
          scf.yield %229 : tensor<32x128xf32>
        } else {
          hivm.hir.anchor {id = 199 : i64}
          scf.yield %10 : tensor<32x128xf32>
        }
        %alloc_47 = memref.alloc() : memref<32x128xbf16>
        %subview_48 = memref.subview %alloc_47[%49, %54] [%50, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 200 : i64}
        hivm.hir.load ins(%subview_9 : memref<?x?xbf16, strided<[12288, 1], offset: ?>>) outs(%subview_48 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %74 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 201 : i64}
        %174 = bufferization.to_tensor %alloc_47 restrict writable : memref<32x128xbf16>
        hivm.hir.anchor {id = 202 : i64}
        %175 = hivm.hir.stride_load ins(%arg5 : memref<?xf32>) outs(%68 : tensor<32xf32>) offset(%63 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%67 : i64]) {hivm.vf_mode = #hivm.vf_mode<SIMT>} -> tensor<32xf32>
        hivm.hir.anchor {id = 203 : i64}
        %alloc_49 = memref.alloc() : memref<32x32xf32>
        %subview_50 = memref.subview %alloc_49[%95, %100] [%96, %101] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        hivm.hir.anchor {id = 204 : i64}
        hivm.hir.load ins(%subview_17 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_50 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %105 : index init_out_buffer = true init_condition = %104 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 205 : i64}
        %176 = bufferization.to_tensor %alloc_49 restrict writable : memref<32x32xf32>
        hivm.hir.anchor {id = 206 : i64}
        %177 = hivm.hir.vtranspose ins(%176 : tensor<32x32xf32>) outs(%123 : tensor<32x32xf32>) permutation = [1, 0] -> tensor<32x32xf32>
        hivm.hir.anchor {id = 207 : i64}
        %alloc_51 = memref.alloc() : memref<32x32xf32>
        %subview_52 = memref.subview %alloc_51[%95, %100] [%96, %101] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        hivm.hir.anchor {id = 208 : i64}
        hivm.hir.load ins(%subview_20 : memref<?x?xf32, strided<[6144, 1], offset: ?>>) outs(%subview_52 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %105 : index init_out_buffer = true init_condition = %104 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 209 : i64}
        %178 = bufferization.to_tensor %alloc_51 restrict writable : memref<32x32xf32>
        hivm.hir.anchor {id = 210 : i64}
        %179 = hivm.hir.vtranspose ins(%178 : tensor<32x32xf32>) outs(%123 : tensor<32x32xf32>) permutation = [1, 0] -> tensor<32x32xf32>
        hivm.hir.anchor {id = 211 : i64}
        %180 = hivm.hir.vcmp ins(%109, %110 : tensor<32x32xi32>, tensor<32x32xi32>) outs(%111 : tensor<32x32xi1>) compare_mode = <le> -> tensor<32x32xi1>
        hivm.hir.anchor {id = 212 : i64}
        %181 = hivm.hir.vsel ins(%180, %177, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%123 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 213 : i64}
        %182 = hivm.hir.vsel ins(%180, %179, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%123 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 214 : i64}
        %183 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%174 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 215 : i64}
        %184 = hivm.hir.vmul ins(%183, %133 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 216 : i64}
        %expanded_53 = tensor.expand_shape %175 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
        %185 = hivm.hir.vmul ins(%137, %expanded_53 : tensor<32x128xf32>, tensor<32x1xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [1] -> tensor<32x128xf32>
        hivm.hir.anchor {id = 217 : i64}
        %186 = hivm.hir.vmul ins(%185, %133 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 218 : i64}
        %expanded_54 = tensor.expand_shape %184 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
        %187 = hivm.hir.vtranspose ins(%expanded_54 : tensor<32x16x8xf32>) outs(%139 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
        hivm.hir.anchor {id = 219 : i64}
        %expanded_55 = tensor.expand_shape %187 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
        %alloc_56 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_56 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<16>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %188 = bufferization.to_tensor %alloc_56 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        hivm.hir.anchor {id = 220 : i64}
        hivm.hir.copy ins(%expanded_55 : tensor<16x2x16x8xf32>) outs(%alloc_56 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 221 : i64}
        %expanded_57 = tensor.expand_shape %181 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %189 = hivm.hir.vtranspose ins(%expanded_57 : tensor<32x4x8xf32>) outs(%142 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 222 : i64}
        %expanded_58 = tensor.expand_shape %189 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_59 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_59 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<17>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %190 = bufferization.to_tensor %alloc_59 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 223 : i64}
        hivm.hir.copy ins(%expanded_58 : tensor<4x2x16x8xf32>) outs(%alloc_59 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 224 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %191 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%190, %188, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 225 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        %alloc_60 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_60 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast_61 = memref.memory_space_cast %alloc_60 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %192 = bufferization.to_tensor %memspacecast_61 restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
        hivm.hir.anchor {id = 226 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%191 : tensor<8x2x16x16xf32>) outs(%alloc_60 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 227 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %193 = hivm.hir.vmul ins(%192, %136 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 228 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
        %194 = hivm.hir.vadd ins(%173, %193 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 229 : i64}
        %expanded_62 = tensor.expand_shape %186 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
        %195 = hivm.hir.vtranspose ins(%expanded_62 : tensor<32x16x8xf32>) outs(%139 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
        hivm.hir.anchor {id = 230 : i64}
        %expanded_63 = tensor.expand_shape %195 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
        %alloc_64 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_64 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<18>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %196 = bufferization.to_tensor %alloc_64 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        hivm.hir.anchor {id = 231 : i64}
        hivm.hir.copy ins(%expanded_63 : tensor<16x2x16x8xf32>) outs(%alloc_64 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 232 : i64}
        %expanded_65 = tensor.expand_shape %182 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %197 = hivm.hir.vtranspose ins(%expanded_65 : tensor<32x4x8xf32>) outs(%142 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 233 : i64}
        %expanded_66 = tensor.expand_shape %197 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_67 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_67 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<19>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %198 = bufferization.to_tensor %alloc_67 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 234 : i64}
        hivm.hir.copy ins(%expanded_66 : tensor<4x2x16x8xf32>) outs(%alloc_67 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 235 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %199 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%198, %196, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 236 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        %alloc_68 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_68 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast_69 = memref.memory_space_cast %alloc_68 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %200 = bufferization.to_tensor %memspacecast_69 restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
        hivm.hir.anchor {id = 237 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%199 : tensor<8x2x16x16xf32>) outs(%alloc_68 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 238 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %201 = hivm.hir.vmul ins(%200, %136 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 239 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 8
        %202 = hivm.hir.vadd ins(%194, %201 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 240 : i64}
        %reinterpret_cast_70 = memref.reinterpret_cast %arg10 to offset: [%39], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %reinterpret_cast_71 = memref.reinterpret_cast %arg11 to offset: [%39], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %reinterpret_cast_72 = memref.reinterpret_cast %arg12 to offset: [%39], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %reinterpret_cast_73 = memref.reinterpret_cast %arg13 to offset: [%39], sizes: [32, 128], strides: [12288, 1] : memref<?xf32> to memref<32x128xf32, strided<[12288, 1], offset: ?>>
        %203 = hivm.hir.vsub ins(%160, %202 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 241 : i64}
        %204 = hivm.hir.vmul ins(%203, %137 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 242 : i64}
        %alloc_74 = memref.alloc() : memref<32x128xf32>
        %subview_75 = memref.subview %reinterpret_cast_72[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        %subview_76 = memref.subview %alloc_74[%49, %54] [%50, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 243 : i64}
        hivm.hir.load ins(%subview_75 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_76 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 244 : i64}
        %205 = bufferization.to_tensor %alloc_74 restrict writable : memref<32x128xf32>
        hivm.hir.anchor {id = 245 : i64}
        %206 = hivm.hir.vadd ins(%204, %205 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 246 : i64}
        %207 = hivm.hir.vadd ins(%162, %206 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 247 : i64}
        %alloc_77 = memref.alloc() : memref<32x128xf32>
        %subview_78 = memref.subview %reinterpret_cast_70[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        %subview_79 = memref.subview %alloc_77[%49, %54] [%50, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 248 : i64}
        hivm.hir.load ins(%subview_78 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) outs(%subview_79 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 249 : i64}
        %208 = bufferization.to_tensor %alloc_77 restrict writable : memref<32x128xf32>
        hivm.hir.anchor {id = 250 : i64}
        %209 = hivm.hir.vadd ins(%160, %208 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 251 : i64}
        %210 = hivm.hir.vadd ins(%209, %202 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 252 : i64}
        %extracted_slice_80 = tensor.extract_slice %210[%49, %54] [%50, %55] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x?xf32>
        hivm.hir.anchor {id = 253 : i64}
        %subview_81 = memref.subview %reinterpret_cast_71[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        hivm.hir.store ins(%extracted_slice_80 : tensor<?x?xf32>) outs(%subview_81 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 254 : i64}
        %extracted_slice_82 = tensor.extract_slice %207[%49, %54] [%50, %55] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x?xf32>
        hivm.hir.anchor {id = 255 : i64}
        %subview_83 = memref.subview %reinterpret_cast_73[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>> to memref<?x?xf32, strided<[12288, 1], offset: ?>>
        hivm.hir.store ins(%extracted_slice_82 : tensor<?x?xf32>) outs(%subview_83 : memref<?x?xf32, strided<[12288, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 256 : i64}
      }
      hivm.hir.set_ctrl true at ctrl[60]
      hivm.hir.anchor {id = 257 : i64}
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
    hivm.hir.anchor {id = 258 : i64}
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
        %0 = affine.apply #map16(%arg8)
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
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map17} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      scf.for %arg8 = %c0 to %c16 step %c8 {
        %1 = affine.apply #map16(%arg8)
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32) attributes {DirectlyUsedGMArgIdxList = [5, 5, 14, 5], SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<20xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
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
    %0 = arith.muli %arg17, %arg18 : i32
    %1 = arith.muli %0, %arg19 : i32
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
    scf.for %arg20 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %4 = arith.remsi %arg20, %arg17 : i32
      %5 = arith.divsi %arg20, %arg17 : i32
      %6 = arith.remsi %5, %arg18 : i32
      %7 = arith.divsi %arg20, %0 : i32
      %8 = arith.remsi %7, %arg19 : i32
      hivm.hir.anchor {id = 3 : i64}
      hivm.hir.anchor {id = 4 : i64}
      %9 = arith.divsi %8, %c96_i32 : i32
      %10 = arith.remsi %8, %c96_i32 : i32
      %11 = arith.remsi %4, %c2_i32 : i32
      %12 = arith.muli %9, %arg16 : i32
      %13 = arith.muli %6, %c64_i32 : i32
      %14 = arith.muli %11, %c32_i32 : i32
      %15 = arith.addi %13, %14 : i32
      %16 = arith.cmpi sge, %15, %arg16 : i32
      scf.if %16 {
        hivm.hir.anchor {id = 5 : i64}
      } else {
        hivm.hir.anchor {id = 6 : i64}
        %17 = arith.muli %12, %c96_i32 : i32
        %18 = arith.addi %17, %10 : i32
        %19 = arith.muli %18, %c64_i32 : i32
        %20 = arith.index_cast %19 : i32 to index
        %21 = arith.maxsi %15, %c0_i32 : i32
        %22 = arith.index_cast %21 : i32 to index
        %23 = arith.index_cast %arg16 : i32 to index
        %24 = arith.subi %c0_i32, %15 : i32
        %25 = arith.maxsi %24, %c0_i32 : i32
        %26 = arith.index_cast %25 : i32 to index
        hivm.hir.anchor {id = 7 : i64}
        hivm.hir.anchor {id = 8 : i64}
        hivm.hir.anchor {id = 9 : i64}
        hivm.hir.anchor {id = 10 : i64}
        %27 = arith.cmpi sgt, %11, %c0_i32 : i32
        scf.if %27 {
          hivm.hir.anchor {id = 11 : i64}
          hivm.hir.anchor {id = 12 : i64}
          hivm.hir.anchor {id = 13 : i64}
          %alloca = memref.alloca() {normalize_matmul_counter = 0 : i32} : memref<i32>
          hivm.hir.anchor {id = 14 : i64}
          memref.store %c0_i32, %alloca[] : memref<i32>
          hivm.hir.anchor {id = 15 : i64}
          %alloca_15 = memref.alloca() {normalize_matmul_counter = 1 : i32} : memref<i32>
          hivm.hir.anchor {id = 16 : i64}
          memref.store %c0_i32, %alloca_15[] : memref<i32>
          hivm.hir.anchor {id = 17 : i64}
          %alloc_16 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
          annotation.mark %alloc_16 {hivm.multi_buffer = 2 : i32} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
          %alloc_17 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
          annotation.mark %alloc_17 {hivm.multi_buffer = 2 : i32} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
          scf.for %arg21 = %c0_i32 to %11 step %c1_i32  : i32 {
            hivm.hir.anchor {id = 18 : i64}
            %alloc_20 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_20 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_21 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.anchor {id = 19 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 20 : i64}
              hivm.hir.anchor {id = 21 : i64}
              hivm.hir.anchor {id = 22 : i64}
              hivm.hir.anchor {id = 23 : i64}
              hivm.hir.anchor {id = 24 : i64}
              hivm.hir.anchor {id = 25 : i64}
              hivm.hir.anchor {id = 26 : i64}
              hivm.hir.anchor {id = 27 : i64}
              hivm.hir.anchor {id = 28 : i64}
              hivm.hir.anchor {id = 29 : i64}
              hivm.hir.anchor {id = 30 : i64}
              hivm.hir.anchor {id = 31 : i64}
              annotation.mark %alloc_21 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 32 : i64}
              hivm.hir.anchor {id = 33 : i64}
              annotation.mark %alloc_20 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 34 : i64}
              hivm.hir.anchor {id = 35 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 36 : i64}
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 37 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 38 : i64}
              %49 = arith.muli %arg21, %c32_i32 : i32
              %50 = arith.maxsi %49, %c0_i32 : i32
              %51 = arith.index_cast %50 : i32 to index
              %52 = affine.apply #map6()[%51, %20, %22]
              %reinterpret_cast = memref.reinterpret_cast %arg6 to offset: [%52], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_22 = memref.reinterpret_cast %arg7 to offset: [%52], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %53 = affine.apply #map7()[%23, %51, %22]
              %54 = arith.maxsi %53, %c0 : index
              %55 = arith.minsi %54, %c32 : index
              %56 = affine.apply #map8()[%51]
              %57 = arith.maxsi %56, %c0 : index
              %58 = arith.minsi %57, %c32 : index
              %59 = arith.minsi %26, %55 : index
              %60 = affine.apply #map3()[%55, %59]
              %61 = arith.subi %c0_i32, %49 : i32
              %62 = arith.maxsi %61, %c0_i32 : i32
              %63 = arith.index_cast %62 : i32 to index
              %64 = arith.minsi %63, %58 : index
              %65 = affine.apply #map3()[%58, %64]
              %66 = arith.cmpi slt, %60, %c32 : index
              %67 = arith.cmpi slt, %65, %c32 : index
              %68 = arith.ori %66, %67 : i1
              %subview = memref.subview %reinterpret_cast[0, 0] [%60, %65] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %69 = affine.apply #map9()[%55, %59]
              %70 = affine.apply #map10()[%58, %64]
              %71 = affine.apply #map11(%59)
              %72 = affine.apply #map12(%64)
              %73 = affine.apply #map13(%59)
              %74 = affine.apply #map14(%64)
              %alloc_23 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              annotation.mark %alloc_23 {hivm.multi_buffer = 2 : i32} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_24 = memref.subview %alloc_23[%72, %71, %73, %74] [%70, %69, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 39 : i64}
              scf.if %68 {
                %collapse_shape = memref.collapse_shape %alloc_23 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_24 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 40 : i64}
              %subview_25 = memref.subview %reinterpret_cast_22[0, 0] [%60, %65] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %alloc_26 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              annotation.mark %alloc_26 {hivm.multi_buffer = 2 : i32} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_27 = memref.subview %alloc_26[%72, %71, %73, %74] [%70, %69, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 41 : i64}
              scf.if %68 {
                %collapse_shape = memref.collapse_shape %alloc_26 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_25 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_27 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 42 : i64}
              hivm.hir.anchor {id = 43 : i64}
              %75 = memref.load %alloca[] : memref<i32>
              hivm.hir.anchor {id = 44 : i64}
              %76 = arith.cmpi eq, %75, %c0_i32 : i32
              hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%alloc_23, %alloc_21, %76, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_16 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 45 : i64}
              %77 = arith.addi %75, %c1_i32 : i32
              memref.store %77, %alloca[] : memref<i32>
              hivm.hir.anchor {id = 46 : i64}
              %78 = memref.load %alloca_15[] : memref<i32>
              hivm.hir.anchor {id = 47 : i64}
              %79 = arith.cmpi eq, %78, %c0_i32 : i32
              hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%alloc_26, %alloc_20, %79, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_17 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 48 : i64}
              %80 = arith.addi %78, %c1_i32 : i32
              memref.store %80, %alloca_15[] : memref<i32>
              hivm.hir.anchor {id = 49 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 50 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop, may_not_exec, normalized_in_L0C = [0 : i32, 1 : i32]}
          hivm.hir.anchor {id = 51 : i64}
          %45 = memref.load %alloca[] : memref<i32>
          hivm.hir.anchor {id = 52 : i64}
          %46 = arith.cmpi eq, %45, %c0_i32 : i32
          %alloc_18 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_18 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.anchor {id = 53 : i64}
          scf.if %46 {
            hivm.hir.anchor {id = 54 : i64}
          } else {
            hivm.hir.anchor {id = 55 : i64}
            hivm.hir.anchor {id = 56 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_16 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_18 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.anchor {id = 57 : i64}
          }
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 58 : i64}
          %47 = memref.load %alloca_15[] : memref<i32>
          hivm.hir.anchor {id = 59 : i64}
          %48 = arith.cmpi eq, %47, %c0_i32 : i32
          %alloc_19 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_19 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
          hivm.hir.anchor {id = 60 : i64}
          scf.if %48 {
            hivm.hir.anchor {id = 61 : i64}
          } else {
            hivm.hir.anchor {id = 62 : i64}
            hivm.hir.anchor {id = 63 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_17 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_19 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.anchor {id = 64 : i64}
          }
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 65 : i64}
          hivm.hir.anchor {id = 66 : i64}
          hivm.hir.anchor {id = 67 : i64}
          hivm.hir.anchor {id = 68 : i64}
          hivm.hir.anchor {id = 69 : i64}
          hivm.hir.anchor {id = 70 : i64}
        } else {
          hivm.hir.anchor {id = 71 : i64}
        }
        hivm.hir.anchor {id = 72 : i64}
        hivm.hir.anchor {id = 73 : i64}
        hivm.hir.anchor {id = 74 : i64}
        hivm.hir.anchor {id = 75 : i64}
        hivm.hir.anchor {id = 76 : i64}
        hivm.hir.anchor {id = 77 : i64}
        hivm.hir.anchor {id = 78 : i64}
        hivm.hir.anchor {id = 79 : i64}
        hivm.hir.anchor {id = 80 : i64}
        %28 = arith.maxsi %14, %c0_i32 : i32
        %29 = arith.index_cast %28 : i32 to index
        %30 = affine.apply #map8()[%29]
        %31 = arith.maxsi %30, %c0 : index
        %32 = arith.minsi %31, %c32 : index
        %33 = arith.subi %c0_i32, %14 : i32
        %34 = arith.maxsi %33, %c0_i32 : i32
        %35 = arith.index_cast %34 : i32 to index
        %36 = arith.minsi %35, %32 : index
        %37 = affine.apply #map3()[%32, %36]
        %38 = arith.cmpi slt, %37, %c32 : index
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
        %alloc = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 108 : i64}
        hivm.hir.anchor {id = 109 : i64}
        hivm.hir.anchor {id = 110 : i64}
        %alloc_0 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_0 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 111 : i64}
        hivm.hir.anchor {id = 112 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        annotation.mark %alloc_1 {hivm.multi_buffer = 2 : i32} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_0, %alloc, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_1 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 113 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        %alloc_2 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_2 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.anchor {id = 114 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_1 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_2 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 115 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.anchor {id = 116 : i64}
        hivm.hir.anchor {id = 117 : i64}
        %alloc_3 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_3 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 118 : i64}
        hivm.hir.anchor {id = 119 : i64}
        hivm.hir.anchor {id = 120 : i64}
        %alloc_4 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_4 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 121 : i64}
        hivm.hir.anchor {id = 122 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        annotation.mark %alloc_5 {hivm.multi_buffer = 2 : i32} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_4, %alloc_3, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_5 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 123 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        %alloc_6 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_6 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.anchor {id = 124 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_5 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_6 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 125 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
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
        %39 = arith.subi %arg16, %13 : i32
        %40 = arith.addi %39, %c31_i32 : i32
        %41 = arith.divsi %40, %c32_i32 : i32
        %42 = arith.minsi %41, %c2_i32 : i32
        %43 = arith.subi %42, %c1_i32 : i32
        %44 = arith.cmpi slt, %11, %43 : i32
        scf.if %44 {
          hivm.hir.anchor {id = 141 : i64}
          hivm.hir.anchor {id = 142 : i64}
          hivm.hir.anchor {id = 143 : i64}
          %45 = arith.addi %11, %c1_i32 : i32
          hivm.hir.anchor {id = 144 : i64}
          scf.for %arg21 = %45 to %42 step %c1_i32  : i32 {
            hivm.hir.anchor {id = 145 : i64}
            %alloc_15 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_15 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_16 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_16 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_17 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_17 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_18 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_18 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.anchor {id = 146 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 147 : i64}
              hivm.hir.anchor {id = 148 : i64}
              hivm.hir.anchor {id = 149 : i64}
              hivm.hir.anchor {id = 150 : i64}
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
              annotation.mark %alloc_18 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<14>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 169 : i64}
              hivm.hir.anchor {id = 170 : i64}
              hivm.hir.anchor {id = 171 : i64}
              annotation.mark %alloc_17 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<15>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 172 : i64}
              hivm.hir.anchor {id = 173 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 2 : i32, no_inline}
            hivm.hir.anchor {id = 174 : i64}
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 1
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 175 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 176 : i64}
              %46 = arith.muli %arg21, %c32_i32 : i32
              %47 = arith.addi %13, %46 : i32
              %48 = arith.maxsi %47, %c0_i32 : i32
              %49 = arith.index_cast %48 : i32 to index
              %50 = arith.subi %c0_i32, %47 : i32
              %51 = arith.maxsi %50, %c0_i32 : i32
              %52 = arith.index_cast %51 : i32 to index
              %53 = affine.apply #map6()[%29, %20, %49]
              %reinterpret_cast = memref.reinterpret_cast %arg6 to offset: [%53], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %54 = affine.apply #map7()[%23, %29, %49]
              %55 = arith.maxsi %54, %c0 : index
              %56 = arith.minsi %55, %c32 : index
              %57 = arith.minsi %52, %56 : index
              %58 = affine.apply #map3()[%56, %57]
              %59 = arith.cmpi slt, %58, %c32 : index
              %60 = arith.ori %59, %38 : i1
              %subview = memref.subview %reinterpret_cast[0, 0] [%58, %37] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %61 = affine.apply #map9()[%56, %57]
              %62 = affine.apply #map10()[%32, %36]
              %63 = affine.apply #map11(%57)
              %64 = affine.apply #map12(%36)
              %65 = affine.apply #map13(%57)
              %66 = affine.apply #map14(%36)
              %alloc_19 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              annotation.mark %alloc_19 {hivm.multi_buffer = 2 : i32} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_20 = memref.subview %alloc_19[%64, %63, %65, %66] [%62, %61, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 177 : i64}
              scf.if %60 {
                %collapse_shape = memref.collapse_shape %alloc_19 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_20 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 178 : i64}
              %reinterpret_cast_21 = memref.reinterpret_cast %arg7 to offset: [%53], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_22 = memref.subview %reinterpret_cast_21[0, 0] [%58, %37] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
              %alloc_23 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              annotation.mark %alloc_23 {hivm.multi_buffer = 2 : i32} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_24 = memref.subview %alloc_23[%64, %63, %65, %66] [%62, %61, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 179 : i64}
              scf.if %60 {
                %collapse_shape = memref.collapse_shape %alloc_23 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_22 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_24 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 180 : i64}
              hivm.hir.anchor {id = 181 : i64}
              %alloc_25 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
              annotation.mark %alloc_25 {hivm.multi_buffer = 2 : i32} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
              hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_19, %alloc_18, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_25 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 182 : i64}
              annotation.mark %alloc_16 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 183 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_25 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_16 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.anchor {id = 184 : i64}
              %alloc_26 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
              annotation.mark %alloc_26 {hivm.multi_buffer = 2 : i32} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
              hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_23, %alloc_17, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_26 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 185 : i64}
              annotation.mark %alloc_15 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 186 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_26 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_15 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.anchor {id = 187 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 188 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            hivm.hir.anchor {id = 189 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 190 : i64}
              hivm.hir.anchor {id = 191 : i64}
              hivm.hir.anchor {id = 192 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 193 : i64}
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop}
          hivm.hir.anchor {id = 194 : i64}
          hivm.hir.anchor {id = 195 : i64}
          hivm.hir.anchor {id = 196 : i64}
          hivm.hir.anchor {id = 197 : i64}
          hivm.hir.anchor {id = 198 : i64}
        } else {
          hivm.hir.anchor {id = 199 : i64}
        }
        hivm.hir.anchor {id = 200 : i64}
        hivm.hir.anchor {id = 201 : i64}
        hivm.hir.anchor {id = 202 : i64}
        hivm.hir.anchor {id = 203 : i64}
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
        %alloc_7 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_7 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<16>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 220 : i64}
        hivm.hir.anchor {id = 221 : i64}
        hivm.hir.anchor {id = 222 : i64}
        %alloc_8 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_8 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<17>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 223 : i64}
        hivm.hir.anchor {id = 224 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        annotation.mark %alloc_9 {hivm.multi_buffer = 2 : i32} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_8, %alloc_7, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_9 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 225 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        %alloc_10 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_10 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
        hivm.hir.anchor {id = 226 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_9 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_10 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 227 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.anchor {id = 228 : i64}
        hivm.hir.anchor {id = 229 : i64}
        hivm.hir.anchor {id = 230 : i64}
        %alloc_11 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_11 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<18>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 231 : i64}
        hivm.hir.anchor {id = 232 : i64}
        hivm.hir.anchor {id = 233 : i64}
        %alloc_12 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_12 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<19>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 234 : i64}
        hivm.hir.anchor {id = 235 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_13 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        annotation.mark %alloc_13 {hivm.multi_buffer = 2 : i32} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_12, %alloc_11, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_13 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 236 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        %alloc_14 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_14 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
        hivm.hir.anchor {id = 237 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_13 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_14 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 238 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.anchor {id = 239 : i64}
        hivm.hir.anchor {id = 240 : i64}
        hivm.hir.anchor {id = 241 : i64}
        hivm.hir.anchor {id = 242 : i64}
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
      }
      hivm.hir.set_ctrl true at ctrl[60]
      hivm.hir.anchor {id = 257 : i64}
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 1
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
    hivm.hir.anchor {id = 258 : i64}
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
        %0 = affine.apply #map16(%arg5)
        %subview = memref.subview %arg0[%arg4, %0] [1, 64] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg1[%0] [64] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg2[%arg4, %0] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
        %2 = vector.transfer_read %subview_2[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map18} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
        %1 = vector.transfer_read %subview_1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map18} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
        %1 = vector.transfer_read %subview_1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map18} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
        %1 = vector.transfer_read %subview_1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map18} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
      %0 = affine.apply #map19()[%arg7, %arg0]
      scf.for %arg8 = %c0 to %c128 step %c64 {
        %subview = memref.subview %arg1[%0, %arg8] [1, 64] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg2[0, %arg8] [1, 64] [1, 1] : memref<1x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg4[%arg7, %arg8] [1, 64] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %1 = vector.transfer_read %subview[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.transfer_read %subview_2[%c0, %c0], %cst_1 {in_bounds = [true, true], permutation_map = #map20} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
        %0 = affine.apply #map16(%arg6)
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
    %2 = vector.transfer_read %arg3[%c0], %false, %1 {in_bounds = [true, true], permutation_map = #map18} : memref<16xi1, strided<[1]>, #hivm.address_space<ub>>, vector<1x64xi1>
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
      %0 = vector.transfer_read %subview_1[%c0], %cst {in_bounds = [true, true], permutation_map = #map17} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
        %0 = affine.apply #map16(%arg4)
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
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map17} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
        %0 = affine.apply #map16(%arg3)
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
    %2 = vector.transfer_read %arg0[%c0], %c0_i32, %1 {in_bounds = [true, true], permutation_map = #map18} : memref<32xi32, #hivm.address_space<ub>>, vector<1x64xi32>
    scf.for %arg3 = %c0 to %c32 step %c1 {
      %subview = memref.subview %arg0[%arg3] [1] [1] : memref<32xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg3, 0] [1, 32] [1, 1] : memref<32x32xi32, #hivm.address_space<ub>> to memref<1x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
      %3 = vector.transfer_read %subview[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map17} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
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
      %2 = vector.transfer_read %subview[%c0, %c0], %cst, %0 {in_bounds = [true, true], permutation_map = #map21} : memref<32x1xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
      %2 = vector.transfer_read %subview[%c0, %c0], %cst, %0 {in_bounds = [true, true], permutation_map = #map21} : memref<32x1xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32) attributes {DirectlyUsedGMArgIdxList = [5, 5, 14, 5], SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<20xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
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
    %0 = arith.muli %arg17, %arg18 : i32
    %1 = arith.muli %0, %arg19 : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
    call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_31(%alloc) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
    %4 = arith.extsi %arg16 : i32 to i64
    %5 = arith.muli %arg15, %arg16 : i32
    %6 = hivm.hir.get_sub_block_idx -> i64
    %7 = arith.index_cast %6 : i64 to index
    %8 = affine.apply #map22()[%7]
    %9 = affine.apply #map23()[%7]
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
    scf.for %arg20 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %10 = arith.remsi %arg20, %arg17 : i32
      %11 = arith.divsi %arg20, %arg17 : i32
      %12 = arith.remsi %11, %arg18 : i32
      %13 = arith.divsi %arg20, %0 : i32
      %14 = arith.remsi %13, %arg19 : i32
      hivm.hir.anchor {id = 3 : i64}
      hivm.hir.anchor {id = 4 : i64}
      %15 = arith.divsi %14, %c96_i32 : i32
      %16 = arith.remsi %14, %c96_i32 : i32
      %17 = arith.divsi %10, %c2_i32 : i32
      %18 = arith.remsi %10, %c2_i32 : i32
      %19 = arith.muli %15, %arg16 : i32
      %20 = arith.muli %12, %c64_i32 : i32
      %21 = arith.muli %18, %c32_i32 : i32
      %22 = arith.addi %20, %21 : i32
      %23 = arith.cmpi sge, %22, %arg16 : i32
      scf.if %23 {
        hivm.hir.anchor {id = 5 : i64}
      } else {
        hivm.hir.anchor {id = 6 : i64}
        %24 = arith.muli %17, %c128_i32 : i32
        %25 = arith.muli %19, %c96_i32 : i32
        %26 = arith.addi %25, %16 : i32
        %27 = arith.extsi %26 : i32 to i64
        %28 = arith.muli %26, %c128_i32 : i32
        %29 = arith.index_cast %28 : i32 to index
        %30 = arith.muli %26, %c64_i32 : i32
        %31 = arith.index_cast %30 : i32 to index
        %32 = arith.muli %17, %5 : i32
        %33 = arith.addi %32, %19 : i32
        %34 = arith.muli %33, %c96_i32 : i32
        %35 = arith.addi %34, %16 : i32
        %36 = arith.maxsi %22, %c0_i32 : i32
        %37 = arith.index_cast %36 : i32 to index
        %38 = arith.maxsi %24, %c0_i32 : i32
        %39 = arith.index_cast %38 : i32 to index
        %40 = affine.apply #map2()[%39]
        %41 = affine.apply #map()[%39, %29, %37]
        %42 = arith.index_cast %arg16 : i32 to index
        %43 = affine.apply #map1()[%42, %39, %37]
        %reinterpret_cast = memref.reinterpret_cast %arg4 to offset: [%41], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_1 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_1 {hivm.multi_buffer = 2 : i32} : memref<32x128xf32, #hivm.address_space<ub>>
        %44 = arith.maxsi %43, %c0 : index
        %45 = arith.minsi %44, %c32 : index
        %46 = arith.maxsi %40, %c0 : index
        %47 = arith.minsi %46, %c128 : index
        %48 = arith.subi %c0_i32, %22 : i32
        %49 = arith.maxsi %48, %c0_i32 : i32
        %50 = arith.index_cast %49 : i32 to index
        %51 = arith.minsi %50, %45 : index
        %52 = affine.apply #map3()[%45, %51]
        %53 = arith.subi %c0_i32, %24 : i32
        %54 = arith.maxsi %53, %c0_i32 : i32
        %55 = arith.index_cast %54 : i32 to index
        %56 = arith.minsi %55, %47 : index
        %57 = affine.apply #map3()[%47, %56]
        %58 = arith.cmpi slt, %52, %c32 : index
        %59 = arith.cmpi slt, %57, %c128 : index
        %60 = arith.ori %58, %59 : i1
        %subview = memref.subview %reinterpret_cast[0, 0] [%52, %57] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_2 = memref.subview %alloc_1[%51, %56] [%52, %57] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %61 = arith.remui %56, %c8 : index
        hivm.hir.anchor {id = 7 : i64}
        scf.if %60 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_0(%alloc_1) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_2 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %61 : index
        hivm.hir.anchor {id = 8 : i64}
        %subview_3 = memref.subview %alloc_1[%8, 0] [16, 128] [1, 1] {to_be_bubbled_slice} : memref<32x128xf32, #hivm.address_space<ub>> to memref<16x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %62 = arith.extsi %22 : i32 to i64
        %63 = arith.muli %62, %c96_i64 : i64
        %64 = arith.addi %27, %63 : i64
        %65 = arith.subi %4, %62 : i64
        %66 = arith.maxsi %65, %c0_i64 : i64
        %67 = arith.minsi %66, %c32_i64 : i64
        %68 = arith.minsi %67, %c32_i64 : i64
        hivm.hir.anchor {id = 9 : i64}
        %69 = arith.index_cast %8 : index to i64
        %70 = arith.muli %69, %c96_i64 : i64
        %71 = arith.addi %64, %70 : i64
        %72 = arith.subi %68, %69 : i64
        %73 = arith.maxsi %72, %c0_i64 : i64
        %74 = arith.minsi %73, %c16_i64 : i64
        %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<16xf32, #hivm.address_space<ub>>
        hivm.hir.stride_load ins(%arg5 : memref<?xf32, #hivm.address_space<gm>>) outs(%alloc_4 : memref<16xf32, #hivm.address_space<ub>>) offset(%71 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%74 : i64])
        hivm.hir.anchor {id = 10 : i64}
        %75 = arith.cmpi sgt, %18, %c0_i32 : i32
        %76:2 = scf.if %75 -> (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) {
          hivm.hir.anchor {id = 11 : i64}
          %140 = arith.muli %22, %c12288_i32 : i32
          %141 = arith.index_cast %140 : i32 to index
          %142 = arith.index_cast %24 : i32 to index
          %143 = affine.apply #map4()[%142, %29, %141]
          %144 = affine.apply #map5()[%142]
          %reinterpret_cast_144 = memref.reinterpret_cast %arg4 to offset: [%143], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %alloc_145 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_145 {hivm.multi_buffer = 2 : i32} : memref<128xf32, #hivm.address_space<ub>>
          %145 = arith.maxsi %142, %c128 : index
          %146 = arith.minsi %144, %145 : index
          %147 = affine.apply #map3()[%146, %142]
          %148 = arith.cmpi slt, %147, %c128 : index
          %subview_146 = memref.subview %reinterpret_cast_144[0] [%147] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %subview_147 = memref.subview %alloc_145[0] [%147] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 12 : i64}
          scf.if %148 {
            func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_1(%alloc_145) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          hivm.hir.load ins(%subview_146 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_147 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32
          hivm.hir.anchor {id = 13 : i64}
          %alloca = memref.alloca() {normalize_matmul_counter = 0 : i32} : memref<i32>
          hivm.hir.anchor {id = 14 : i64}
          memref.store %c0_i32, %alloca[] : memref<i32>
          hivm.hir.anchor {id = 15 : i64}
          %alloca_148 = memref.alloca() {normalize_matmul_counter = 1 : i32} : memref<i32>
          hivm.hir.anchor {id = 16 : i64}
          memref.store %c0_i32, %alloca_148[] : memref<i32>
          hivm.hir.anchor {id = 17 : i64}
          scf.for %arg21 = %c0_i32 to %18 step %c1_i32  : i32 {
            hivm.hir.anchor {id = 18 : i64}
            %alloc_155 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_156 = memref.subview %alloc_155[0, %7, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_155 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_157 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_158 = memref.subview %alloc_157[0, %7, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_157 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
            hivm.hir.anchor {id = 19 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 20 : i64}
              %155 = arith.muli %arg21, %c32_i32 : i32
              %156 = arith.addi %20, %155 : i32
              %157 = arith.maxsi %156, %c0_i32 : i32
              %158 = arith.index_cast %157 : i32 to index
              %159 = affine.apply #map()[%39, %29, %158]
              %160 = affine.apply #map1()[%42, %39, %158]
              %reinterpret_cast_159 = memref.reinterpret_cast %arg3 to offset: [%159], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_160 = memref.reinterpret_cast %arg4 to offset: [%159], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %alloc_161 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
              annotation.mark %alloc_161 {hivm.multi_buffer = 2 : i32} : memref<16x128xbf16, #hivm.address_space<ub>>
              %161 = arith.maxsi %160, %c0 : index
              %162 = arith.minsi %161, %c32 : index
              %163 = arith.subi %c0_i32, %156 : i32
              %164 = arith.maxsi %163, %c0_i32 : i32
              %165 = arith.index_cast %164 : i32 to index
              %166 = arith.minsi %165, %162 : index
              %167 = affine.apply #map3()[%162, %166]
              %168 = arith.cmpi slt, %167, %c32 : index
              %169 = arith.ori %168, %59 : i1
              %170 = arith.minsi %8, %167 : index
              %171 = affine.apply #map24()[%170, %162, %166]
              %172 = arith.minsi %171, %c16 : index
              %subview_162 = memref.subview %reinterpret_cast_159[%8, 0] [%172, %57] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %173 = affine.apply #map25()[%7]
              %174 = arith.maxsi %166, %8 : index
              %175 = arith.minsi %162, %173 : index
              %176 = arith.maxsi %174, %175 : index
              %177 = affine.apply #map3()[%176, %174]
              %178 = affine.apply #map26()[%174, %7]
              %subview_163 = memref.subview %alloc_161[%178, %56] [%177, %57] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              %179 = arith.remui %56, %c16 : index
              hivm.hir.anchor {id = 21 : i64}
              scf.if %169 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_2(%alloc_161) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_162 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_163 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %179 : index
              hivm.hir.anchor {id = 22 : i64}
              %alloc_164 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
              annotation.mark %alloc_164 {hivm.multi_buffer = 2 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
              %subview_165 = memref.subview %reinterpret_cast_160[%8, 0] [%172, %57] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_166 = memref.subview %alloc_164[%178, %56] [%177, %57] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 23 : i64}
              scf.if %169 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_3(%alloc_164) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_165 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_166 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %61 : index
              hivm.hir.anchor {id = 24 : i64}
              hivm.hir.anchor {id = 25 : i64}
              hivm.hir.anchor {id = 26 : i64}
              hivm.hir.anchor {id = 27 : i64}
              hivm.hir.anchor {id = 28 : i64}
              hivm.hir.anchor {id = 29 : i64}
              hivm.hir.anchor {id = 30 : i64}
              hivm.hir.anchor {id = 31 : i64}
              %alloc_167 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
              %subview_168 = memref.subview %alloc_167[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_0_outlined_vf_0(%alloc_161, %alloc_145, %alloc_164, %subview_168) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
              %expand_shape_169 = memref.expand_shape %subview_168 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
              annotation.mark %alloc_157 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 32 : i64}
              %collapse_shape_170 = memref.collapse_shape %expand_shape_169 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
              %collapse_shape_171 = memref.collapse_shape %subview_158 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_170 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_171 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              hivm.hir.anchor {id = 33 : i64}
              annotation.mark %alloc_155 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 34 : i64}
              %collapse_shape_172 = memref.collapse_shape %subview_156 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_170 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_172 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              hivm.hir.anchor {id = 35 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 36 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 37 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 38 : i64}
              hivm.hir.anchor {id = 39 : i64}
              hivm.hir.anchor {id = 40 : i64}
              hivm.hir.anchor {id = 41 : i64}
              hivm.hir.anchor {id = 42 : i64}
              hivm.hir.anchor {id = 43 : i64}
              %155 = memref.load %alloca[] : memref<i32>
              hivm.hir.anchor {id = 44 : i64}
              hivm.hir.anchor {id = 45 : i64}
              %156 = arith.addi %155, %c1_i32 : i32
              memref.store %156, %alloca[] : memref<i32>
              hivm.hir.anchor {id = 46 : i64}
              %157 = memref.load %alloca_148[] : memref<i32>
              hivm.hir.anchor {id = 47 : i64}
              hivm.hir.anchor {id = 48 : i64}
              %158 = arith.addi %157, %c1_i32 : i32
              memref.store %158, %alloca_148[] : memref<i32>
              hivm.hir.anchor {id = 49 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 50 : i64}
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop, may_not_exec, normalized_in_L0C = [0 : i32, 1 : i32]}
          hivm.hir.anchor {id = 51 : i64}
          %149 = memref.load %alloca[] : memref<i32>
          hivm.hir.anchor {id = 52 : i64}
          %150 = arith.cmpi eq, %149, %c0_i32 : i32
          %alloc_149 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_149 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 53 : i64}
          %151 = scf.if %150 -> (memref<16x128xf32, #hivm.address_space<ub>>) {
            hivm.hir.anchor {id = 54 : i64}
            %alloc_155 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
            %collapse_shape_156 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            %collapse_shape_157 = memref.collapse_shape %alloc_155 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            hivm.hir.copy ins(%collapse_shape_156 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_157 : memref<2048xf32, #hivm.address_space<ub>>)
            scf.yield %alloc_155 : memref<16x128xf32, #hivm.address_space<ub>>
          } else {
            hivm.hir.anchor {id = 55 : i64}
            hivm.hir.anchor {id = 56 : i64}
            hivm.hir.anchor {id = 57 : i64}
            scf.yield %alloc_149 : memref<16x128xf32, #hivm.address_space<ub>>
          }
          hivm.hir.anchor {id = 58 : i64}
          %152 = memref.load %alloca_148[] : memref<i32>
          hivm.hir.anchor {id = 59 : i64}
          %153 = arith.cmpi eq, %152, %c0_i32 : i32
          %alloc_150 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_150 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 60 : i64}
          %154 = scf.if %153 -> (memref<16x128xf32, #hivm.address_space<ub>>) {
            hivm.hir.anchor {id = 61 : i64}
            %alloc_155 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
            %collapse_shape_156 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            %collapse_shape_157 = memref.collapse_shape %alloc_155 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            hivm.hir.copy ins(%collapse_shape_156 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_157 : memref<2048xf32, #hivm.address_space<ub>>)
            scf.yield %alloc_155 : memref<16x128xf32, #hivm.address_space<ub>>
          } else {
            hivm.hir.anchor {id = 62 : i64}
            hivm.hir.anchor {id = 63 : i64}
            hivm.hir.anchor {id = 64 : i64}
            scf.yield %alloc_150 : memref<16x128xf32, #hivm.address_space<ub>>
          }
          hivm.hir.anchor {id = 65 : i64}
          hivm.hir.anchor {id = 66 : i64}
          hivm.hir.anchor {id = 67 : i64}
          hivm.hir.anchor {id = 68 : i64}
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %alloc_151 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %alloc_152 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %cast_153 = memref.cast %subview_3 {fold_offset_into_ptr} : memref<16x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x128xf32, #hivm.address_space<ub>>
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_1_outlined_vf_0(%cast_153, %alloc_145, %alloc_151, %151, %alloc_152) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
          hivm.hir.anchor {id = 69 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %alloc_154 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_4(%154, %alloc_151, %alloc_154) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
          hivm.hir.anchor {id = 70 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
          scf.yield %alloc_152, %alloc_154 : memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>
        } else {
          hivm.hir.anchor {id = 71 : i64}
          %alloc_144 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_145 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          %collapse_shape_146 = memref.collapse_shape %alloc_144 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_145 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_146 : memref<2048xf32, #hivm.address_space<ub>>)
          %alloc_147 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_148 = memref.collapse_shape %alloc_147 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_145 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_148 : memref<2048xf32, #hivm.address_space<ub>>)
          scf.yield %alloc_144, %alloc_147 : memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>
        }
        hivm.hir.anchor {id = 72 : i64}
        %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<32xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_19(%alloc_5) {hivm.vector_function, no_inline} : (memref<32xi32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 73 : i64}
        %reinterpret_cast_6 = memref.reinterpret_cast %arg2 to offset: [%41], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_7 = memref.reinterpret_cast %arg3 to offset: [%41], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_8 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
        annotation.mark %alloc_8 {hivm.multi_buffer = 2 : i32} : memref<16x128xbf16, #hivm.address_space<ub>>
        %77 = arith.minsi %8, %52 : index
        %78 = affine.apply #map24()[%77, %45, %51]
        %79 = arith.minsi %78, %c16 : index
        %subview_9 = memref.subview %reinterpret_cast_6[%8, 0] [%79, %57] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %80 = affine.apply #map25()[%7]
        %81 = arith.maxsi %51, %8 : index
        %82 = arith.minsi %45, %80 : index
        %83 = arith.maxsi %81, %82 : index
        %84 = affine.apply #map3()[%83, %81]
        %85 = affine.apply #map26()[%81, %7]
        %subview_10 = memref.subview %alloc_8[%85, %56] [%84, %57] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %86 = arith.remui %56, %c16 : index
        hivm.hir.anchor {id = 74 : i64}
        scf.if %60 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_5(%alloc_8) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_9 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_10 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %86 : index
        hivm.hir.anchor {id = 75 : i64}
        %alloc_11 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
        annotation.mark %alloc_11 {hivm.multi_buffer = 2 : i32} : memref<16x128xbf16, #hivm.address_space<ub>>
        %subview_12 = memref.subview %reinterpret_cast_7[%8, 0] [%79, %57] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_13 = memref.subview %alloc_11[%85, %56] [%84, %57] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 76 : i64}
        scf.if %60 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_6(%alloc_11) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_12 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_13 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %86 : index
        hivm.hir.anchor {id = 77 : i64}
        %87 = arith.subi %arg16, %22 : i32
        %88 = arith.subi %87, %c1_i32 : i32
        %89 = arith.minsi %88, %c16_i32 : i32
        %90 = arith.trunci %89 : i32 to i16
        %91 = arith.extsi %90 : i16 to i32
        hivm.hir.anchor {id = 78 : i64}
        %alloc_14 = memref.alloc() {alignment = 64 : i64} : memref<1x128xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_20(%91, %alloc_14) {hivm.vector_function, no_inline} : (i32, memref<1x128xi32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 79 : i64}
        %alloc_15 = memref.alloc() {alignment = 64 : i64} : memref<1x128xf32, #hivm.address_space<ub>>
        hivm.hir.vgather {hivm.vf_mode = #hivm.vf_mode<SIMT>} ins(%alloc_1 : memref<32x128xf32, #hivm.address_space<ub>>) indices(%alloc_14 : memref<1x128xi32, #hivm.address_space<ub>>) outs(%alloc_15 : memref<1x128xf32, #hivm.address_space<ub>>) gather_axis = 0
        hivm.hir.anchor {id = 80 : i64}
        %92 = arith.maxsi %21, %c0_i32 : i32
        %93 = arith.index_cast %92 : i32 to index
        %94 = affine.apply #map6()[%93, %31, %37]
        %95 = affine.apply #map8()[%93]
        %96 = affine.apply #map7()[%42, %93, %37]
        %reinterpret_cast_16 = memref.reinterpret_cast %arg6 to offset: [%94], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_17 = memref.reinterpret_cast %arg7 to offset: [%94], sizes: [32, 32], strides: [6144, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_18 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_18 {hivm.multi_buffer = 2 : i32} : memref<32x16xf32, #hivm.address_space<ub>>
        %97 = arith.maxsi %96, %c0 : index
        %98 = arith.minsi %97, %c32 : index
        %99 = arith.maxsi %95, %c0 : index
        %100 = arith.minsi %99, %c32 : index
        %101 = arith.minsi %50, %98 : index
        %102 = affine.apply #map3()[%98, %101]
        %103 = arith.subi %c0_i32, %21 : i32
        %104 = arith.maxsi %103, %c0_i32 : i32
        %105 = arith.index_cast %104 : i32 to index
        %106 = arith.minsi %105, %100 : index
        %107 = affine.apply #map3()[%100, %106]
        %108 = arith.cmpi slt, %102, %c32 : index
        %109 = arith.cmpi slt, %107, %c32 : index
        %110 = arith.ori %108, %109 : i1
        %111 = arith.minsi %8, %107 : index
        %112 = affine.apply #map24()[%111, %100, %106]
        %113 = arith.minsi %112, %c16 : index
        %subview_19 = memref.subview %reinterpret_cast_16[0, %8] [%102, %113] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
        %114 = arith.maxsi %106, %8 : index
        %115 = arith.minsi %100, %80 : index
        %116 = arith.maxsi %114, %115 : index
        %117 = affine.apply #map3()[%116, %114]
        %118 = affine.apply #map26()[%114, %7]
        %subview_20 = memref.subview %alloc_18[%101, %118] [%102, %117] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        %119 = arith.remui %106, %c8 : index
        hivm.hir.anchor {id = 81 : i64}
        scf.if %110 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_7(%alloc_18) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_19 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_20 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %119 : index
        hivm.hir.anchor {id = 82 : i64}
        %alloc_21 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32} : memref<32x16xf32, #hivm.address_space<ub>>
        %subview_22 = memref.subview %reinterpret_cast_17[0, %8] [%102, %113] [1, 1] : memref<32x32xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_23 = memref.subview %alloc_21[%101, %118] [%102, %117] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 83 : i64}
        scf.if %110 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_8(%alloc_21) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_22 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_23 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %119 : index
        hivm.hir.anchor {id = 84 : i64}
        %expand_shape = memref.expand_shape %alloc_5 [[0, 1]] output_shape [1, 32] : memref<32xi32, #hivm.address_space<ub>> into memref<1x32xi32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 85 : i64}
        hivm.hir.anchor {id = 86 : i64}
        %alloc_24 = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32, #hivm.address_space<ub>>
        %alloc_25 = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_21(%alloc_5, %alloc_24, %alloc_25) {hivm.vector_function, no_inline} : (memref<32xi32, #hivm.address_space<ub>>, memref<32x32xi32, #hivm.address_space<ub>>, memref<32x32xi32, #hivm.address_space<ub>>) -> ()
        %subview_26 = memref.subview %alloc_24[%8, 0] [16, 32] [1, 1] {to_be_bubbled_slice} : memref<32x32xi32, #hivm.address_space<ub>> to memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_27 = memref.subview %alloc_25[%8, 0] [16, 32] [1, 1] {to_be_bubbled_slice} : memref<32x32xi32, #hivm.address_space<ub>> to memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 87 : i64}
        hivm.hir.anchor {id = 88 : i64}
        hivm.hir.anchor {id = 89 : i64}
        %alloc_28 = memref.alloc() : memref<1x256x1xi1, #hivm.address_space<ub>>
        %subview_29 = memref.subview %alloc_28[0, 0, 0] [1, 16, 1] [1, 1, 1] : memref<1x256x1xi1, #hivm.address_space<ub>> to memref<1x16xi1, strided<[256, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_7_outlined_vf_0(%8, %expand_shape, %22, %arg16, %subview_29) {hivm.vector_function, no_inline} : (index, memref<1x32xi32, #hivm.address_space<ub>>, i32, i32, memref<1x16xi1, strided<[256, 1]>, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 90 : i64}
        %collapse_shape = memref.collapse_shape %subview_29 [[0, 1]] : memref<1x16xi1, strided<[256, 1]>, #hivm.address_space<ub>> into memref<16xi1, strided<[1]>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 91 : i64}
        hivm.hir.anchor {id = 92 : i64}
        hivm.hir.anchor {id = 93 : i64}
        hivm.hir.anchor {id = 94 : i64}
        hivm.hir.anchor {id = 95 : i64}
        hivm.hir.anchor {id = 96 : i64}
        hivm.hir.anchor {id = 97 : i64}
        %120 = arith.index_cast %22 : i32 to index
        %121 = affine.apply #map15()[%120]
        %122 = arith.maxsi %120, %42 : index
        %123 = arith.minsi %121, %122 : index
        %124 = affine.apply #map3()[%123, %120]
        %125 = arith.minsi %8, %124 : index
        %126 = affine.apply #map24()[%125, %123, %120]
        %127 = arith.minsi %126, %c16 : index
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
        %alloc_30 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_31 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_32 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_6_outlined_vf_0(%8, %alloc_1, %alloc_15, %alloc_11, %alloc_30, %alloc_31, %alloc_32) {hivm.vector_function, no_inline} : (index, memref<32x128xf32, #hivm.address_space<ub>>, memref<1x128xf32, #hivm.address_space<ub>>, memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        %subview_33 = memref.subview %alloc_30[0, 0] [%127, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
        %alloc_34 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %collapse_shape_35 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
        %collapse_shape_36 = memref.collapse_shape %alloc_34 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%collapse_shape_35 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_36 : memref<2048xf32, #hivm.address_space<ub>>)
        %subview_37 = memref.subview %alloc_34[0, 0] [%127, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
        %collapse_shape_38 = memref.collapse_shape %subview_33 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        %collapse_shape_39 = memref.collapse_shape %subview_37 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        hivm.hir.copy ins(%collapse_shape_38 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_39 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
        %alloc_40 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_41 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_42 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
        %subview_43 = memref.subview %alloc_42[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_6_outlined_vf_1(%alloc_34, %alloc_40, %alloc_32, %alloc_41, %subview_43) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_44 = memref.expand_shape %subview_43 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_45 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_46 = memref.subview %alloc_45[0, %7, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_45 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        hivm.hir.anchor {id = 108 : i64}
        %collapse_shape_47 = memref.collapse_shape %expand_shape_44 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_48 = memref.collapse_shape %subview_46 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_47 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_48 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 109 : i64}
        hivm.hir.anchor {id = 110 : i64}
        %alloc_49 = memref.alloc() {alignment = 64 : i64} : memref<32x16xf32, #hivm.address_space<ub>>
        %alloc_50 = memref.alloc() : memref<2x33x8x1xf32, #hivm.address_space<ub>>
        %subview_51 = memref.subview %alloc_50[0, 0, 0, 0] [2, 32, 8, 1] [1, 1, 1, 1] : memref<2x33x8x1xf32, #hivm.address_space<ub>> to memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_8_outlined_vf_0(%alloc_24, %8, %alloc_25, %collapse_shape, %alloc_21, %alloc_18, %alloc_49, %subview_51) {hivm.vector_function, no_inline} : (memref<32x32xi32, #hivm.address_space<ub>>, index, memref<32x32xi32, #hivm.address_space<ub>>, memref<16xi1, strided<[1]>, #hivm.address_space<ub>>, memref<32x16xf32, #hivm.address_space<ub>>, memref<32x16xf32, #hivm.address_space<ub>>, memref<32x16xf32, #hivm.address_space<ub>>, memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_52 = memref.expand_shape %subview_51 [[0], [1, 2], [3]] output_shape [2, 2, 16, 8] : memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>> into memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_53 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_54 = memref.subview %alloc_53[%9, 0, 0, 0] [2, 2, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_53 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = 0 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 111 : i64}
        %collapse_shape_55 = memref.collapse_shape %expand_shape_52 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>> into memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>
        %collapse_shape_56 = memref.collapse_shape %subview_54 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_55 : memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_56 : memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 112 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 113 : i64}
        %alloc_57 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_57 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 114 : i64}
        hivm.hir.anchor {id = 115 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_58 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_22(%alloc_57, %alloc_41, %alloc_58) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 116 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        %alloc_59 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_23(%76#0, %alloc_58, %alloc_59) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 117 : i64}
        %alloc_60 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_61 = memref.subview %alloc_60[0, %7, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_60 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        hivm.hir.anchor {id = 118 : i64}
        %collapse_shape_62 = memref.collapse_shape %subview_61 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_47 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_62 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 119 : i64}
        hivm.hir.anchor {id = 120 : i64}
        %alloc_63 = memref.alloc() : memref<2x33x8x1xf32, #hivm.address_space<ub>>
        %subview_64 = memref.subview %alloc_63[0, 0, 0, 0] [2, 32, 8, 1] [1, 1, 1, 1] : memref<2x33x8x1xf32, #hivm.address_space<ub>> to memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_9_outlined_vf_0(%alloc_49, %subview_64) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>, memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_65 = memref.expand_shape %subview_64 [[0], [1, 2], [3]] output_shape [2, 2, 16, 8] : memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>> into memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_66 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_67 = memref.subview %alloc_66[%9, 0, 0, 0] [2, 2, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_66 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = 0 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 121 : i64}
        %collapse_shape_68 = memref.collapse_shape %expand_shape_65 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>> into memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>
        %collapse_shape_69 = memref.collapse_shape %subview_67 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_68 : memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_69 : memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 122 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 123 : i64}
        %alloc_70 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_70 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 124 : i64}
        hivm.hir.anchor {id = 125 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_71 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_24(%alloc_70, %alloc_41, %alloc_71) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 126 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.anchor {id = 127 : i64}
        hivm.hir.anchor {id = 128 : i64}
        hivm.hir.anchor {id = 129 : i64}
        hivm.hir.anchor {id = 130 : i64}
        %alloc_72 = memref.alloc() {alignment = 64 : i64} : memref<16xf32, #hivm.address_space<ub>>
        %alloc_73 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_10_outlined_vf_0(%alloc_4, %76#1, %alloc_71, %alloc_32, %alloc_72, %alloc_73) {hivm.vector_function, no_inline} : (memref<16xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 131 : i64}
        %reinterpret_cast_74 = memref.reinterpret_cast %arg8 to offset: [%41], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_75 = memref.reinterpret_cast %arg9 to offset: [%41], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.anchor {id = 132 : i64}
        %alloc_76 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_11_outlined_vf_0(%alloc_8, %alloc_59, %alloc_76) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 133 : i64}
        %alloc_77 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_77 {hivm.multi_buffer = 2 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
        %subview_78 = memref.subview %reinterpret_cast_74[%8, 0] [%79, %57] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_79 = memref.subview %alloc_77[%85, %56] [%84, %57] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 134 : i64}
        scf.if %60 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_9(%alloc_77) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_78 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_79 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %61 : index
        hivm.hir.anchor {id = 135 : i64}
        hivm.hir.anchor {id = 136 : i64}
        %alloc_80 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_80 {hivm.multi_buffer = 2 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_25(%alloc_59, %alloc_77, %alloc_80) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 137 : i64}
        %subview_81 = memref.subview %alloc_80[%85, %56] [%84, %57] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 138 : i64}
        %subview_82 = memref.subview %reinterpret_cast_75[%8, 0] [%79, %57] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_81 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_82 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        hivm.hir.anchor {id = 139 : i64}
        %128 = arith.extsi %35 : i32 to i64
        %129 = arith.addi %128, %63 : i64
        %130 = arith.addi %129, %70 : i64
        %131 = arith.minsi %72, %c16_i64 : i64
        %132 = arith.maxsi %131, %c0_i64 : i64
        hivm.hir.stride_store ins(%alloc_72 : memref<16xf32, #hivm.address_space<ub>>) outs(%arg14 : memref<?xf32, #hivm.address_space<gm>>) offset(%130 : i64) strides([%c96_i64 : i64]) numels([%132 : i64])
        hivm.hir.anchor {id = 140 : i64}
        %133 = arith.subi %arg16, %20 : i32
        %134 = arith.addi %133, %c31_i32 : i32
        %135 = arith.divsi %134, %c32_i32 : i32
        %136 = arith.minsi %135, %c2_i32 : i32
        %137 = arith.subi %136, %c1_i32 : i32
        %138 = arith.cmpi slt, %18, %137 : i32
        %139 = scf.if %138 -> (memref<16x128xf32, #hivm.address_space<ub>>) {
          hivm.hir.anchor {id = 141 : i64}
          %140 = arith.addi %22, %c32_i32 : i32
          %141 = arith.minsi %140, %arg16 : i32
          %142 = arith.subi %141, %c1_i32 : i32
          %143 = arith.muli %142, %c12288_i32 : i32
          %144 = arith.index_cast %143 : i32 to index
          %145 = arith.index_cast %24 : i32 to index
          %146 = affine.apply #map4()[%145, %29, %144]
          %147 = affine.apply #map5()[%145]
          %reinterpret_cast_144 = memref.reinterpret_cast %arg4 to offset: [%146], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %alloc_145 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_145 {hivm.multi_buffer = 2 : i32} : memref<128xf32, #hivm.address_space<ub>>
          %148 = arith.maxsi %145, %c128 : index
          %149 = arith.minsi %147, %148 : index
          %150 = affine.apply #map3()[%149, %145]
          %151 = arith.cmpi slt, %150, %c128 : index
          %subview_146 = memref.subview %reinterpret_cast_144[0] [%150] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %subview_147 = memref.subview %alloc_145[0] [%150] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 142 : i64}
          scf.if %151 {
            func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_10(%alloc_145) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          hivm.hir.load ins(%subview_146 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_147 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32
          hivm.hir.anchor {id = 143 : i64}
          %152 = arith.addi %18, %c1_i32 : i32
          hivm.hir.anchor {id = 144 : i64}
          %alloc_148 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_149 = memref.collapse_shape %alloc_148 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_35 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_149 : memref<2048xf32, #hivm.address_space<ub>>)
          %153 = scf.for %arg21 = %152 to %136 step %c1_i32 iter_args(%arg22 = %alloc_148) -> (memref<16x128xf32, #hivm.address_space<ub>>)  : i32 {
            hivm.hir.anchor {id = 145 : i64}
            %alloc_152 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_152 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_152 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_153 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_153 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_153 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_154 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_155 = memref.subview %alloc_154[0, %7, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_154 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_156 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_157 = memref.subview %alloc_156[0, %7, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_156 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            hivm.hir.anchor {id = 146 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 147 : i64}
              %155 = arith.muli %arg21, %c32_i32 : i32
              %156 = arith.addi %20, %155 : i32
              %157 = arith.maxsi %156, %c0_i32 : i32
              %158 = arith.index_cast %157 : i32 to index
              %159 = affine.apply #map()[%39, %29, %158]
              %160 = affine.apply #map1()[%42, %39, %158]
              %reinterpret_cast_158 = memref.reinterpret_cast %arg2 to offset: [%159], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_159 = memref.reinterpret_cast %arg3 to offset: [%159], sizes: [32, 128], strides: [12288, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_160 = memref.reinterpret_cast %arg4 to offset: [%159], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %161 = arith.extsi %156 : i32 to i64
              %162 = arith.muli %161, %c96_i64 : i64
              %163 = arith.addi %27, %162 : i64
              %164 = arith.subi %4, %161 : i64
              %165 = arith.maxsi %164, %c0_i64 : i64
              %166 = arith.minsi %165, %c32_i64 : i64
              %167 = arith.minsi %166, %c32_i64 : i64
              hivm.hir.anchor {id = 148 : i64}
              %168 = arith.addi %163, %70 : i64
              %169 = arith.subi %167, %69 : i64
              %170 = arith.maxsi %169, %c0_i64 : i64
              %171 = arith.minsi %170, %c16_i64 : i64
              %alloc_161 = memref.alloc() {alignment = 64 : i64} : memref<16xf32, #hivm.address_space<ub>>
              hivm.hir.stride_load ins(%arg5 : memref<?xf32, #hivm.address_space<gm>>) outs(%alloc_161 : memref<16xf32, #hivm.address_space<ub>>) offset(%168 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%171 : i64])
              hivm.hir.anchor {id = 149 : i64}
              %alloc_162 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
              annotation.mark %alloc_162 {hivm.multi_buffer = 2 : i32} : memref<16x128xbf16, #hivm.address_space<ub>>
              %172 = arith.maxsi %160, %c0 : index
              %173 = arith.minsi %172, %c32 : index
              %174 = arith.subi %c0_i32, %156 : i32
              %175 = arith.maxsi %174, %c0_i32 : i32
              %176 = arith.index_cast %175 : i32 to index
              %177 = arith.minsi %176, %173 : index
              %178 = affine.apply #map3()[%173, %177]
              %179 = arith.cmpi slt, %178, %c32 : index
              %180 = arith.ori %179, %59 : i1
              %181 = arith.minsi %8, %178 : index
              %182 = affine.apply #map24()[%181, %173, %177]
              %183 = arith.minsi %182, %c16 : index
              %subview_163 = memref.subview %reinterpret_cast_158[%8, 0] [%183, %57] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %184 = arith.maxsi %177, %8 : index
              %185 = arith.minsi %173, %80 : index
              %186 = arith.maxsi %184, %185 : index
              %187 = affine.apply #map3()[%186, %184]
              %188 = affine.apply #map26()[%184, %7]
              %subview_164 = memref.subview %alloc_162[%188, %56] [%187, %57] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 150 : i64}
              scf.if %180 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_11(%alloc_162) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_163 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_164 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %86 : index
              hivm.hir.anchor {id = 151 : i64}
              %alloc_165 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
              annotation.mark %alloc_165 {hivm.multi_buffer = 2 : i32} : memref<16x128xbf16, #hivm.address_space<ub>>
              %subview_166 = memref.subview %reinterpret_cast_159[%8, 0] [%183, %57] [1, 1] : memref<32x128xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_167 = memref.subview %alloc_165[%188, %56] [%187, %57] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 152 : i64}
              scf.if %180 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_12(%alloc_165) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_166 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_167 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %86 : index
              hivm.hir.anchor {id = 153 : i64}
              hivm.hir.anchor {id = 154 : i64}
              hivm.hir.anchor {id = 155 : i64}
              hivm.hir.anchor {id = 156 : i64}
              %alloc_168 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
              annotation.mark %alloc_168 {hivm.multi_buffer = 2 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
              %subview_169 = memref.subview %reinterpret_cast_160[%8, 0] [%183, %57] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_170 = memref.subview %alloc_168[%188, %56] [%187, %57] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 157 : i64}
              scf.if %180 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_13(%alloc_168) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_169 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_170 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %61 : index
              hivm.hir.anchor {id = 158 : i64}
              hivm.hir.anchor {id = 159 : i64}
              hivm.hir.anchor {id = 160 : i64}
              hivm.hir.anchor {id = 161 : i64}
              hivm.hir.anchor {id = 162 : i64}
              %189 = arith.index_cast %156 : i32 to index
              %190 = affine.apply #map15()[%189]
              %191 = arith.maxsi %189, %42 : index
              %192 = arith.minsi %190, %191 : index
              %193 = affine.apply #map3()[%192, %189]
              %194 = arith.minsi %8, %193 : index
              %195 = affine.apply #map24()[%194, %192, %189]
              %196 = arith.minsi %195, %c16 : index
              hivm.hir.anchor {id = 163 : i64}
              hivm.hir.anchor {id = 164 : i64}
              hivm.hir.anchor {id = 165 : i64}
              hivm.hir.anchor {id = 166 : i64}
              hivm.hir.anchor {id = 167 : i64}
              hivm.hir.anchor {id = 168 : i64}
              %alloc_171 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_3_outlined_vf_0(%alloc_168, %alloc_145, %alloc_171) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              %subview_172 = memref.subview %alloc_171[0, 0] [%196, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
              %alloc_173 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
              %collapse_shape_174 = memref.collapse_shape %alloc_173 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
              hivm.hir.copy ins(%collapse_shape_35 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_174 : memref<2048xf32, #hivm.address_space<ub>>)
              %subview_175 = memref.subview %alloc_173[0, 0] [%196, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
              %collapse_shape_176 = memref.collapse_shape %subview_172 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
              %collapse_shape_177 = memref.collapse_shape %subview_175 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
              hivm.hir.copy ins(%collapse_shape_176 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_177 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
              %alloc_178 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
              %subview_179 = memref.subview %alloc_178[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
              annotation.mark %alloc_156 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<14>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              %alloc_180 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
              %subview_181 = memref.subview %alloc_180[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_3_outlined_merged_vf_0(%alloc_162, %alloc_173, %subview_179, %alloc_161, %alloc_165, %alloc_173, %subview_181) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>, memref<16xf32, #hivm.address_space<ub>>, memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
              hivm.hir.anchor {id = 169 : i64}
              hivm.hir.anchor {id = 170 : i64}
              hivm.hir.anchor {id = 171 : i64}
              %expand_shape_182 = memref.expand_shape %subview_179 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
              %collapse_shape_183 = memref.collapse_shape %expand_shape_182 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
              %collapse_shape_184 = memref.collapse_shape %subview_157 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_183 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_184 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              %expand_shape_185 = memref.expand_shape %subview_181 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
              annotation.mark %alloc_154 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<15>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 172 : i64}
              %collapse_shape_186 = memref.collapse_shape %expand_shape_185 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
              %collapse_shape_187 = memref.collapse_shape %subview_155 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_186 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_187 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              hivm.hir.anchor {id = 173 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 2 : i32, no_inline}
            hivm.hir.anchor {id = 174 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 175 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 176 : i64}
              hivm.hir.anchor {id = 177 : i64}
              hivm.hir.anchor {id = 178 : i64}
              hivm.hir.anchor {id = 179 : i64}
              hivm.hir.anchor {id = 180 : i64}
              hivm.hir.anchor {id = 181 : i64}
              hivm.hir.anchor {id = 182 : i64}
              hivm.hir.anchor {id = 183 : i64}
              hivm.hir.anchor {id = 184 : i64}
              hivm.hir.anchor {id = 185 : i64}
              hivm.hir.anchor {id = 186 : i64}
              hivm.hir.anchor {id = 187 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 188 : i64}
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.anchor {id = 189 : i64}
            %154 = scope.scope : () -> memref<16x128xf32, #hivm.address_space<ub>> {
              hivm.hir.anchor {id = 190 : i64}
              hivm.hir.anchor {id = 191 : i64}
              %alloc_158 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_4_outlined_vf_0(%alloc_152, %alloc_153, %arg22, %alloc_158) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              hivm.hir.anchor {id = 192 : i64}
              scope.return %alloc_158 : memref<16x128xf32, #hivm.address_space<ub>>
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 193 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 1
            scf.yield %154 : memref<16x128xf32, #hivm.address_space<ub>>
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop}
          hivm.hir.anchor {id = 194 : i64}
          hivm.hir.anchor {id = 195 : i64}
          hivm.hir.anchor {id = 196 : i64}
          hivm.hir.anchor {id = 197 : i64}
          %alloc_150 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %cast_151 = memref.cast %subview_3 {fold_offset_into_ptr} : memref<16x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x128xf32, #hivm.address_space<ub>>
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_5_outlined_vf_0(%153, %alloc_145, %cast_151, %alloc_150) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
          hivm.hir.anchor {id = 198 : i64}
          scf.yield %alloc_150 : memref<16x128xf32, #hivm.address_space<ub>>
        } else {
          hivm.hir.anchor {id = 199 : i64}
          %alloc_144 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_145 = memref.collapse_shape %alloc_144 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_35 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_145 : memref<2048xf32, #hivm.address_space<ub>>)
          scf.yield %alloc_144 : memref<16x128xf32, #hivm.address_space<ub>>
        }
        %alloc_83 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
        annotation.mark %alloc_83 {hivm.multi_buffer = 2 : i32} : memref<16x128xbf16, #hivm.address_space<ub>>
        %subview_84 = memref.subview %alloc_83[%85, %56] [%84, %57] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 200 : i64}
        scf.if %60 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_14(%alloc_83) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_9 : memref<?x?xbf16, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_84 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %86 : index
        hivm.hir.anchor {id = 201 : i64}
        hivm.hir.anchor {id = 202 : i64}
        %alloc_85 = memref.alloc() {alignment = 64 : i64} : memref<16xf32, #hivm.address_space<ub>>
        hivm.hir.stride_load ins(%arg5 : memref<?xf32, #hivm.address_space<gm>>) outs(%alloc_85 : memref<16xf32, #hivm.address_space<ub>>) offset(%71 : i64) other(%cst : f32) strides([%c96_i64 : i64]) numels([%74 : i64])
        hivm.hir.anchor {id = 203 : i64}
        %alloc_86 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_86 {hivm.multi_buffer = 2 : i32} : memref<32x16xf32, #hivm.address_space<ub>>
        %subview_87 = memref.subview %alloc_86[%101, %118] [%102, %117] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 204 : i64}
        scf.if %110 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_15(%alloc_86) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_19 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_87 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %119 : index
        hivm.hir.anchor {id = 205 : i64}
        hivm.hir.anchor {id = 206 : i64}
        %alloc_88 = memref.alloc() {alignment = 64 : i64} : memref<16x32xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_26(%alloc_86, %alloc_88) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 207 : i64}
        %alloc_89 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_89 {hivm.multi_buffer = 2 : i32} : memref<32x16xf32, #hivm.address_space<ub>>
        %subview_90 = memref.subview %alloc_89[%101, %118] [%102, %117] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 208 : i64}
        scf.if %110 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_16(%alloc_89) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_22 : memref<?x?xf32, strided<[6144, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_90 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %119 : index
        hivm.hir.anchor {id = 209 : i64}
        hivm.hir.anchor {id = 210 : i64}
        %alloc_91 = memref.alloc() {alignment = 64 : i64} : memref<16x32xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_27(%alloc_89, %alloc_91) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 211 : i64}
        hivm.hir.anchor {id = 212 : i64}
        hivm.hir.anchor {id = 213 : i64}
        hivm.hir.anchor {id = 214 : i64}
        hivm.hir.anchor {id = 215 : i64}
        hivm.hir.anchor {id = 216 : i64}
        hivm.hir.anchor {id = 217 : i64}
        %alloc_92 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_13_outlined_vf_0(%alloc_85, %alloc_32, %alloc_41, %alloc_92) {hivm.vector_function, no_inline} : (memref<16xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 218 : i64}
        hivm.hir.anchor {id = 219 : i64}
        %alloc_93 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
        %subview_94 = memref.subview %alloc_93[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_12_outlined_vf_0(%alloc_83, %alloc_41, %subview_94) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_95 = memref.expand_shape %subview_94 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_96 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_97 = memref.subview %alloc_96[0, %7, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_96 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<16>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        hivm.hir.anchor {id = 220 : i64}
        %collapse_shape_98 = memref.collapse_shape %expand_shape_95 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_99 = memref.collapse_shape %subview_97 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_98 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_99 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 221 : i64}
        hivm.hir.anchor {id = 222 : i64}
        %alloc_100 = memref.alloc() {alignment = 64 : i64} : memref<16x32xf32, #hivm.address_space<ub>>
        %alloc_101 = memref.alloc() : memref<4x17x8x1xf32, #hivm.address_space<ub>>
        %subview_102 = memref.subview %alloc_101[0, 0, 0, 0] [4, 16, 8, 1] [1, 1, 1, 1] : memref<4x17x8x1xf32, #hivm.address_space<ub>> to memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        %cast = memref.cast %subview_26 {fold_offset_into_ptr} : memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x32xi32, #hivm.address_space<ub>>
        %cast_103 = memref.cast %subview_27 {fold_offset_into_ptr} : memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x32xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_14_outlined_vf_0(%cast, %cast_103, %alloc_91, %alloc_88, %alloc_100, %subview_102) {hivm.vector_function, no_inline} : (memref<16x32xi32, #hivm.address_space<ub>>, memref<16x32xi32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>, memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_104 = memref.expand_shape %subview_102 [[0], [1, 2], [3]] output_shape [4, 1, 16, 8] : memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_105 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_106 = memref.subview %alloc_105[0, %7, 0, 0] [4, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_105 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<17>, hivm.tiling_dim = 1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 223 : i64}
        %collapse_shape_107 = memref.collapse_shape %expand_shape_104 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_108 = memref.collapse_shape %subview_106 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_107 : memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_108 : memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 224 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 225 : i64}
        %alloc_109 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_109 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 226 : i64}
        hivm.hir.anchor {id = 227 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_110 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_28(%alloc_109, %alloc_40, %alloc_110) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 228 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
        %alloc_111 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_29(%139, %alloc_110, %alloc_111) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 229 : i64}
        hivm.hir.anchor {id = 230 : i64}
        %alloc_112 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
        %subview_113 = memref.subview %alloc_112[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_15_outlined_vf_0(%alloc_92, %subview_113) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_114 = memref.expand_shape %subview_113 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_115 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_116 = memref.subview %alloc_115[0, %7, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_115 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<18>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        hivm.hir.anchor {id = 231 : i64}
        %collapse_shape_117 = memref.collapse_shape %expand_shape_114 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_118 = memref.collapse_shape %subview_116 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_117 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_118 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 232 : i64}
        hivm.hir.anchor {id = 233 : i64}
        %alloc_119 = memref.alloc() : memref<4x17x8x1xf32, #hivm.address_space<ub>>
        %subview_120 = memref.subview %alloc_119[0, 0, 0, 0] [4, 16, 8, 1] [1, 1, 1, 1] : memref<4x17x8x1xf32, #hivm.address_space<ub>> to memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_16_outlined_vf_0(%alloc_100, %subview_120) {hivm.vector_function, no_inline} : (memref<16x32xf32, #hivm.address_space<ub>>, memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_121 = memref.expand_shape %subview_120 [[0], [1, 2], [3]] output_shape [4, 1, 16, 8] : memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_122 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_123 = memref.subview %alloc_122[0, %7, 0, 0] [4, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_122 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<19>, hivm.tiling_dim = 1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 234 : i64}
        %collapse_shape_124 = memref.collapse_shape %expand_shape_121 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_125 = memref.collapse_shape %subview_123 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_124 : memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_125 : memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 235 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 236 : i64}
        %alloc_126 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_126 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 237 : i64}
        hivm.hir.anchor {id = 238 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_127 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_30(%alloc_126, %alloc_40, %alloc_127) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 239 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 8
        hivm.hir.anchor {id = 240 : i64}
        %reinterpret_cast_128 = memref.reinterpret_cast %arg10 to offset: [%41], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_129 = memref.reinterpret_cast %arg11 to offset: [%41], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_130 = memref.reinterpret_cast %arg12 to offset: [%41], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_131 = memref.reinterpret_cast %arg13 to offset: [%41], sizes: [32, 128], strides: [12288, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.anchor {id = 241 : i64}
        hivm.hir.anchor {id = 242 : i64}
        %alloc_132 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_132 {hivm.multi_buffer = 2 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
        %subview_133 = memref.subview %reinterpret_cast_130[%8, 0] [%79, %57] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_134 = memref.subview %alloc_132[%85, %56] [%84, %57] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 243 : i64}
        scf.if %60 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_17(%alloc_132) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_133 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_134 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %61 : index
        hivm.hir.anchor {id = 244 : i64}
        hivm.hir.anchor {id = 245 : i64}
        hivm.hir.anchor {id = 246 : i64}
        hivm.hir.anchor {id = 247 : i64}
        %alloc_135 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_135 {hivm.multi_buffer = 2 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
        %subview_136 = memref.subview %reinterpret_cast_128[%8, 0] [%79, %57] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_137 = memref.subview %alloc_135[%85, %56] [%84, %57] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 248 : i64}
        scf.if %60 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_18(%alloc_135) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_136 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_137 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %61 : index
        hivm.hir.anchor {id = 249 : i64}
        hivm.hir.anchor {id = 250 : i64}
        hivm.hir.anchor {id = 251 : i64}
        %alloc_138 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_138 {hivm.multi_buffer = 2 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_139 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_139 {hivm.multi_buffer = 2 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_17_outlined_vf_0(%alloc_76, %alloc_73, %alloc_111, %alloc_127, %alloc_32, %alloc_132, %alloc_135, %alloc_138, %alloc_139) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 252 : i64}
        %subview_140 = memref.subview %alloc_139[%85, %56] [%84, %57] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 253 : i64}
        %subview_141 = memref.subview %reinterpret_cast_129[%8, 0] [%79, %57] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_140 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_141 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        hivm.hir.anchor {id = 254 : i64}
        %subview_142 = memref.subview %alloc_138[%85, %56] [%84, %57] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 255 : i64}
        %subview_143 = memref.subview %reinterpret_cast_131[%8, 0] [%79, %57] [1, 1] : memref<32x128xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_142 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_143 : memref<?x?xf32, strided<[12288, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        hivm.hir.anchor {id = 256 : i64}
      }
      hivm.hir.set_ctrl true at ctrl[60]
      hivm.hir.anchor {id = 257 : i64}
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
    hivm.hir.anchor {id = 258 : i64}
    return
  }
}
