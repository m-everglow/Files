#map = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2 * 4096)>
#map1 = affine_map<()[s0, s1, s2] -> (s0 - s2 - s1 floordiv 4096)>
#map2 = affine_map<()[s0] -> (-s0 + (s0 floordiv 4096) * 4096 + 128)>
#map3 = affine_map<()[s0, s1] -> (s0 - s1)>
#map4 = affine_map<()[s0, s1] -> (s0 + s1 * 32)>
#map5 = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2)>
#map6 = affine_map<()[s0] -> (s0 + 128)>
#map7 = affine_map<()[s0, s1, s2] -> (s0 + s1 + s2 * 2048)>
#map8 = affine_map<()[s0, s1, s2] -> (s0 - s2 - s1 floordiv 2048)>
#map9 = affine_map<()[s0] -> (-s0 + (s0 floordiv 2048) * 2048 + 64)>
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
  func.func @chunk_kda_bwd_kernel_intra_backup(%arg0: memref<?xi8> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg12: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, annotation.filter_passes = #annotation.filter_passes<"hivm-insert-anchors-and-backup,hivm-delayed-cross-core-gss,split-simt-module,hivm-merge-same-preload-scopes">, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<20xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.backup_function, hivm.func_core_type = #hivm.func_core_type<MIX>, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
    hivm.hir.anchor {id = 0 : i64}
    %c16 = arith.constant 16 : index
    %c8 = arith.constant 8 : index
    %c128_i32 = arith.constant 128 : i32
    %c64_i32 = arith.constant 64 : i32
    %c2_i32 = arith.constant 2 : i32
    %c32_i32 = arith.constant 32 : i32
    %c32 = arith.constant 32 : index
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %c16_i32 = arith.constant 16 : i32
    %c4096_i32 = arith.constant 4096 : i32
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
      %11 = arith.divsi %8, %c32_i32 : i32
      %12 = arith.remsi %8, %c32_i32 : i32
      %13 = arith.divsi %4, %c2_i32 : i32
      %14 = arith.remsi %4, %c2_i32 : i32
      %15 = arith.muli %arg15, %arg16 : i32
      %16 = arith.muli %11, %arg16 : i32
      %17 = arith.muli %6, %c64_i32 : i32
      %18 = arith.muli %14, %c32_i32 : i32
      %19 = arith.addi %17, %18 : i32
      %20 = arith.cmpi sge, %19, %arg16 : i32
      scf.if %20 {
        hivm.hir.anchor {id = 5 : i64}
      } else {
        hivm.hir.anchor {id = 6 : i64}
        %21 = arith.muli %13, %c128_i32 : i32
        %22 = arith.muli %16, %c32_i32 : i32
        %23 = arith.addi %22, %12 : i32
        %24 = arith.muli %23, %c128_i32 : i32
        %25 = arith.index_cast %24 : i32 to index
        %26 = arith.index_cast %23 : i32 to index
        %27 = arith.muli %23, %c64_i32 : i32
        %28 = arith.index_cast %27 : i32 to index
        %29 = arith.muli %13, %15 : i32
        %30 = arith.addi %29, %16 : i32
        %31 = arith.muli %30, %c32_i32 : i32
        %32 = arith.addi %31, %12 : i32
        %33 = arith.index_cast %32 : i32 to index
        %34 = arith.maxsi %19, %c0_i32 : i32
        %35 = arith.index_cast %34 : i32 to index
        %36 = arith.maxsi %21, %c0_i32 : i32
        %37 = arith.index_cast %36 : i32 to index
        %38 = arith.index_cast %arg16 : i32 to index
        %39 = affine.apply #map()[%37, %25, %35]
        %reinterpret_cast = memref.reinterpret_cast %arg4 to offset: [%39], sizes: [32, 128], strides: [4096, 1] : memref<?xf32> to memref<32x128xf32, strided<[4096, 1], offset: ?>>
        %alloc = memref.alloc() : memref<32x128xf32>
        %40 = affine.apply #map1()[%38, %37, %35]
        %41 = arith.maxsi %40, %c0 : index
        %42 = arith.minsi %41, %c32 : index
        %43 = affine.apply #map2()[%37]
        %44 = arith.maxsi %43, %c0 : index
        %45 = arith.minsi %44, %c128 : index
        %46 = arith.subi %c0_i32, %19 : i32
        %47 = arith.maxsi %46, %c0_i32 : i32
        %48 = arith.index_cast %47 : i32 to index
        %49 = arith.minsi %48, %42 : index
        %50 = affine.apply #map3()[%42, %49]
        %51 = arith.subi %c0_i32, %21 : i32
        %52 = arith.maxsi %51, %c0_i32 : i32
        %53 = arith.index_cast %52 : i32 to index
        %54 = arith.minsi %53, %45 : index
        %55 = affine.apply #map3()[%45, %54]
        %56 = arith.cmpi slt, %50, %c32 : index
        %57 = arith.cmpi slt, %55, %c128 : index
        %58 = arith.ori %56, %57 : i1
        %subview = memref.subview %reinterpret_cast[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>> to memref<?x?xf32, strided<[4096, 1], offset: ?>>
        %subview_5 = memref.subview %alloc[%49, %54] [%50, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        %59 = arith.remui %54, %c8 : index
        hivm.hir.anchor {id = 7 : i64}
        hivm.hir.load ins(%subview : memref<?x?xf32, strided<[4096, 1], offset: ?>>) outs(%subview_5 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 8 : i64}
        %60 = bufferization.to_tensor %alloc restrict writable : memref<32x128xf32>
        %61 = affine.apply #map4()[%26, %35]
        %reinterpret_cast_6 = memref.reinterpret_cast %arg5 to offset: [%61], sizes: [32], strides: [32] : memref<?xf32> to memref<32xf32, strided<[32], offset: ?>>
        %alloc_7 = memref.alloc() : memref<32xf32>
        %62 = affine.apply #map3()[%38, %35]
        %63 = arith.maxsi %62, %c0 : index
        %64 = arith.minsi %63, %c32 : index
        %65 = arith.minsi %48, %64 : index
        %66 = affine.apply #map3()[%64, %65]
        %67 = arith.cmpi slt, %66, %c32 : index
        %subview_8 = memref.subview %reinterpret_cast_6[0] [%66] [1] : memref<32xf32, strided<[32], offset: ?>> to memref<?xf32, strided<[32], offset: ?>>
        %subview_9 = memref.subview %alloc_7[%65] [%66] [1] : memref<32xf32> to memref<?xf32, strided<[1], offset: ?>>
        %68 = arith.remui %65, %c8 : index
        hivm.hir.anchor {id = 9 : i64}
        hivm.hir.load ins(%subview_8 : memref<?xf32, strided<[32], offset: ?>>) outs(%subview_9 : memref<?xf32, strided<[1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %68 : index init_out_buffer = true init_condition = %67 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 10 : i64}
        %69 = bufferization.to_tensor %alloc_7 restrict writable : memref<32xf32>
        %70 = arith.cmpi sgt, %14, %c0_i32 : i32
        hivm.hir.anchor {id = 11 : i64}
        %71:2 = scf.if %70 -> (tensor<32x128xf32>, tensor<32x128xf32>) {
          hivm.hir.anchor {id = 12 : i64}
          %211 = arith.muli %19, %c4096_i32 : i32
          %212 = arith.index_cast %211 : i32 to index
          %213 = arith.index_cast %21 : i32 to index
          %214 = affine.apply #map5()[%213, %25, %212]
          %reinterpret_cast_93 = memref.reinterpret_cast %arg4 to offset: [%214], sizes: [128], strides: [1] : memref<?xf32> to memref<128xf32, strided<[1], offset: ?>>
          %alloc_94 = memref.alloc() : memref<128xf32>
          %215 = affine.apply #map6()[%213]
          %216 = arith.maxsi %213, %c128 : index
          %217 = arith.minsi %215, %216 : index
          %218 = affine.apply #map3()[%217, %213]
          %219 = arith.cmpi slt, %218, %c128 : index
          %subview_95 = memref.subview %reinterpret_cast_93[0] [%218] [1] : memref<128xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
          %subview_96 = memref.subview %alloc_94[0] [%218] [1] : memref<128xf32> to memref<?xf32, strided<[1]>>
          hivm.hir.anchor {id = 13 : i64}
          hivm.hir.load ins(%subview_95 : memref<?xf32, strided<[1], offset: ?>>) outs(%subview_96 : memref<?xf32, strided<[1]>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 init_out_buffer = true init_condition = %219 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
          hivm.hir.anchor {id = 14 : i64}
          %220 = bufferization.to_tensor %alloc_94 restrict writable : memref<128xf32>
          %expanded_97 = tensor.expand_shape %220 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
          %alloca = memref.alloca() {normalize_matmul_counter = 0 : i32} : memref<i32>
          hivm.hir.anchor {id = 15 : i64}
          memref.store %c0_i32, %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 16 : i64}
          %alloca_98 = memref.alloca() {normalize_matmul_counter = 1 : i32} : memref<i32>
          hivm.hir.anchor {id = 17 : i64}
          memref.store %c0_i32, %alloca_98[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 18 : i64}
          %221 = tensor.empty() : tensor<8x2x16x16xf32>
          %222:2 = scf.for %arg21 = %c0_i32 to %14 step %c1_i32 iter_args(%arg22 = %221, %arg23 = %221) -> (tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>)  : i32 {
            hivm.hir.anchor {id = 19 : i64}
            %alloc_101 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_101 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_102 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_102 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
            hivm.hir.anchor {id = 20 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 21 : i64}
              %237 = arith.muli %arg21, %c32_i32 : i32
              %238 = arith.addi %17, %237 : i32
              %239 = arith.maxsi %238, %c0_i32 : i32
              %240 = arith.index_cast %239 : i32 to index
              %241 = affine.apply #map()[%37, %25, %240]
              %reinterpret_cast_103 = memref.reinterpret_cast %arg3 to offset: [%241], sizes: [32, 128], strides: [4096, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[4096, 1], offset: ?>>
              %reinterpret_cast_104 = memref.reinterpret_cast %arg4 to offset: [%241], sizes: [32, 128], strides: [4096, 1] : memref<?xf32> to memref<32x128xf32, strided<[4096, 1], offset: ?>>
              %alloc_105 = memref.alloc() : memref<32x128xbf16>
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
              %subview_106 = memref.subview %reinterpret_cast_103[0, 0] [%249, %55] [1, 1] : memref<32x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
              %subview_107 = memref.subview %alloc_105[%248, %54] [%249, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
              %252 = arith.remui %54, %c16 : index
              hivm.hir.anchor {id = 22 : i64}
              hivm.hir.load ins(%subview_106 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_107 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %252 : index init_out_buffer = true init_condition = %251 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 23 : i64}
              %253 = bufferization.to_tensor %alloc_105 restrict writable : memref<32x128xbf16>
              %alloc_108 = memref.alloc() : memref<32x128xf32>
              %subview_109 = memref.subview %reinterpret_cast_104[0, 0] [%249, %55] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>> to memref<?x?xf32, strided<[4096, 1], offset: ?>>
              %subview_110 = memref.subview %alloc_108[%248, %54] [%249, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 24 : i64}
              hivm.hir.load ins(%subview_109 : memref<?x?xf32, strided<[4096, 1], offset: ?>>) outs(%subview_110 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %251 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 25 : i64}
              %254 = bufferization.to_tensor %alloc_108 restrict writable : memref<32x128xf32>
              hivm.hir.anchor {id = 26 : i64}
              %255 = hivm.hir.vsub ins(%expanded_97, %254 : tensor<1x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
              hivm.hir.anchor {id = 27 : i64}
              %256 = hivm.hir.vmul ins(%255, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 28 : i64}
              %257 = hivm.hir.vexp ins(%256 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 29 : i64}
              %258 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%253 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 30 : i64}
              %259 = hivm.hir.vmul ins(%258, %257 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 31 : i64}
              %expanded_111 = tensor.expand_shape %259 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
              %260 = tensor.empty() : tensor<16x32x8xf32>
              %261 = hivm.hir.vtranspose ins(%expanded_111 : tensor<32x16x8xf32>) outs(%260 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
              hivm.hir.anchor {id = 32 : i64}
              %expanded_112 = tensor.expand_shape %261 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
              annotation.mark %alloc_102 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 33 : i64}
              hivm.hir.copy ins(%expanded_112 : tensor<16x2x16x8xf32>) outs(%alloc_102 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 34 : i64}
              annotation.mark %alloc_101 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 35 : i64}
              hivm.hir.copy ins(%expanded_112 : tensor<16x2x16x8xf32>) outs(%alloc_101 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 36 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 37 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            %234 = bufferization.to_tensor %alloc_102 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %235 = bufferization.to_tensor %alloc_101 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 38 : i64}
            %236:2 = scope.scope : () -> (tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>) {
              hivm.hir.anchor {id = 39 : i64}
              %237 = arith.muli %arg21, %c32_i32 : i32
              %238 = arith.maxsi %237, %c0_i32 : i32
              %239 = arith.index_cast %238 : i32 to index
              %240 = affine.apply #map7()[%239, %28, %35]
              %reinterpret_cast_103 = memref.reinterpret_cast %arg6 to offset: [%240], sizes: [32, 32], strides: [2048, 1] : memref<?xf32> to memref<32x32xf32, strided<[2048, 1], offset: ?>>
              %reinterpret_cast_104 = memref.reinterpret_cast %arg7 to offset: [%240], sizes: [32, 32], strides: [2048, 1] : memref<?xf32> to memref<32x32xf32, strided<[2048, 1], offset: ?>>
              %241 = affine.apply #map8()[%38, %239, %35]
              %242 = arith.maxsi %241, %c0 : index
              %243 = arith.minsi %242, %c32 : index
              %244 = affine.apply #map9()[%239]
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
              %subview_105 = memref.subview %reinterpret_cast_103[0, 0] [%248, %253] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>> to memref<?x?xf32, strided<[2048, 1], offset: ?>>
              %257 = affine.apply #map10()[%243, %247]
              %258 = affine.apply #map11()[%246, %252]
              %259 = affine.apply #map12(%247)
              %260 = affine.apply #map13(%252)
              %261 = affine.apply #map14(%247)
              %262 = affine.apply #map15(%252)
              %alloc_106 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_107 = memref.subview %alloc_106[%260, %259, %261, %262] [%258, %257, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 40 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_105 : memref<?x?xf32, strided<[2048, 1], offset: ?>>) outs(%subview_107 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %256 : i1
              hivm.hir.anchor {id = 41 : i64}
              %263 = bufferization.to_tensor %alloc_106 restrict writable : memref<4x2x16x8xf32>
              %subview_108 = memref.subview %reinterpret_cast_104[0, 0] [%248, %253] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>> to memref<?x?xf32, strided<[2048, 1], offset: ?>>
              %alloc_109 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_110 = memref.subview %alloc_109[%260, %259, %261, %262] [%258, %257, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 42 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_108 : memref<?x?xf32, strided<[2048, 1], offset: ?>>) outs(%subview_110 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %256 : i1
              hivm.hir.anchor {id = 43 : i64}
              %264 = bufferization.to_tensor %alloc_109 restrict writable : memref<4x2x16x8xf32>
              hivm.hir.anchor {id = 44 : i64}
              %265 = memref.load %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 45 : i64}
              %266 = arith.cmpi eq, %265, %c0_i32 : i32
              %267 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%263, %234, %266, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%arg22 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 46 : i64}
              %268 = arith.addi %265, %c1_i32 : i32
              memref.store %268, %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 47 : i64}
              %269 = memref.load %alloca_98[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 48 : i64}
              %270 = arith.cmpi eq, %269, %c0_i32 : i32
              %271 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%264, %235, %270, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%arg23 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 49 : i64}
              %272 = arith.addi %269, %c1_i32 : i32
              memref.store %272, %alloca_98[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
              hivm.hir.anchor {id = 50 : i64}
              scope.return %267, %271 : tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 51 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
            scf.yield %236#0, %236#1 : tensor<8x2x16x16xf32>, tensor<8x2x16x16xf32>
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop, may_not_exec, normalized_in_L0C = [0 : i32, 1 : i32]}
          hivm.hir.anchor {id = 52 : i64}
          %223 = memref.load %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 53 : i64}
          %224 = arith.cmpi eq, %223, %c0_i32 : i32
          %alloc_99 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_99 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>} : memref<32x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.anchor {id = 54 : i64}
          %225 = scf.if %224 -> (tensor<32x128xf32>) {
            hivm.hir.anchor {id = 55 : i64}
            scf.yield %10 : tensor<32x128xf32>
          } else {
            hivm.hir.anchor {id = 56 : i64}
            %memspacecast_101 = memref.memory_space_cast %alloc_99 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
            %234 = bufferization.to_tensor %memspacecast_101 restrict writable : memref<32x128xf32>
            hivm.hir.anchor {id = 57 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%222#0 : tensor<8x2x16x16xf32>) outs(%alloc_99 : memref<32x128xf32, #hivm.address_space<ub>>)
            hivm.hir.anchor {id = 58 : i64}
            scf.yield %234 : tensor<32x128xf32>
          } {fallback_not_exec}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 59 : i64}
          %226 = memref.load %alloca_98[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
          hivm.hir.anchor {id = 60 : i64}
          %227 = arith.cmpi eq, %226, %c0_i32 : i32
          %alloc_100 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_100 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>} : memref<32x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
          hivm.hir.anchor {id = 61 : i64}
          %228 = scf.if %227 -> (tensor<32x128xf32>) {
            hivm.hir.anchor {id = 62 : i64}
            scf.yield %10 : tensor<32x128xf32>
          } else {
            hivm.hir.anchor {id = 63 : i64}
            %memspacecast_101 = memref.memory_space_cast %alloc_100 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
            %234 = bufferization.to_tensor %memspacecast_101 restrict writable : memref<32x128xf32>
            hivm.hir.anchor {id = 64 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%222#1 : tensor<8x2x16x16xf32>) outs(%alloc_100 : memref<32x128xf32, #hivm.address_space<ub>>)
            hivm.hir.anchor {id = 65 : i64}
            scf.yield %234 : tensor<32x128xf32>
          } {fallback_not_exec}
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 66 : i64}
          %229 = hivm.hir.vsub ins(%60, %expanded_97 : tensor<32x128xf32>, tensor<1x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
          hivm.hir.anchor {id = 67 : i64}
          %230 = hivm.hir.vmul ins(%229, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 68 : i64}
          %231 = hivm.hir.vexp ins(%230 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 69 : i64}
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %232 = hivm.hir.vmul ins(%225, %231 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 70 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %233 = hivm.hir.vmul ins(%228, %231 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 71 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
          scf.yield %232, %233 : tensor<32x128xf32>, tensor<32x128xf32>
        } else {
          hivm.hir.anchor {id = 72 : i64}
          scf.yield %10, %10 : tensor<32x128xf32>, tensor<32x128xf32>
        }
        %72 = tensor.empty() : tensor<32xi32>
        hivm.hir.anchor {id = 73 : i64}
        %73 = hivm.hir.varange offset[%c0] strides[%c1] outs(%72 : tensor<32xi32>) -> tensor<32xi32>
        hivm.hir.anchor {id = 74 : i64}
        %reinterpret_cast_10 = memref.reinterpret_cast %arg2 to offset: [%39], sizes: [32, 128], strides: [4096, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[4096, 1], offset: ?>>
        %reinterpret_cast_11 = memref.reinterpret_cast %arg3 to offset: [%39], sizes: [32, 128], strides: [4096, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[4096, 1], offset: ?>>
        %alloc_12 = memref.alloc() : memref<32x128xbf16>
        %subview_13 = memref.subview %reinterpret_cast_10[0, 0] [%50, %55] [1, 1] : memref<32x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
        %subview_14 = memref.subview %alloc_12[%49, %54] [%50, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        %74 = arith.remui %54, %c16 : index
        hivm.hir.anchor {id = 75 : i64}
        hivm.hir.load ins(%subview_13 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_14 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %74 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 76 : i64}
        %75 = bufferization.to_tensor %alloc_12 restrict writable : memref<32x128xbf16>
        %alloc_15 = memref.alloc() : memref<32x128xbf16>
        %subview_16 = memref.subview %reinterpret_cast_11[0, 0] [%50, %55] [1, 1] : memref<32x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
        %subview_17 = memref.subview %alloc_15[%49, %54] [%50, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 77 : i64}
        hivm.hir.load ins(%subview_16 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_17 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %74 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 78 : i64}
        %76 = bufferization.to_tensor %alloc_15 restrict writable : memref<32x128xbf16>
        %77 = arith.subi %arg16, %19 : i32
        %78 = arith.subi %77, %c1_i32 : i32
        %79 = arith.minsi %78, %c16_i32 : i32
        %80 = arith.trunci %79 : i32 to i16
        %81 = arith.extsi %80 : i16 to i32
        %82 = tensor.empty() : tensor<1x128xi32>
        hivm.hir.anchor {id = 79 : i64}
        %83 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%81 : i32) outs(%82 : tensor<1x128xi32>) -> tensor<1x128xi32>
        hivm.hir.anchor {id = 80 : i64}
        %84 = tensor.empty() : tensor<1x128xf32>
        %85 = hivm.hir.vgather {hivm.vf_mode = #hivm.vf_mode<SIMT>} ins(%60 : tensor<32x128xf32>) indices(%83 : tensor<1x128xi32>) outs(%84 : tensor<1x128xf32>) gather_axis = 0 -> tensor<1x128xf32>
        hivm.hir.anchor {id = 81 : i64}
        %86 = arith.maxsi %18, %c0_i32 : i32
        %87 = arith.index_cast %86 : i32 to index
        %88 = affine.apply #map7()[%87, %28, %35]
        %reinterpret_cast_18 = memref.reinterpret_cast %arg6 to offset: [%88], sizes: [32, 32], strides: [2048, 1] : memref<?xf32> to memref<32x32xf32, strided<[2048, 1], offset: ?>>
        %reinterpret_cast_19 = memref.reinterpret_cast %arg7 to offset: [%88], sizes: [32, 32], strides: [2048, 1] : memref<?xf32> to memref<32x32xf32, strided<[2048, 1], offset: ?>>
        %alloc_20 = memref.alloc() : memref<32x32xf32>
        %89 = affine.apply #map8()[%38, %87, %35]
        %90 = arith.maxsi %89, %c0 : index
        %91 = arith.minsi %90, %c32 : index
        %92 = affine.apply #map9()[%87]
        %93 = arith.maxsi %92, %c0 : index
        %94 = arith.minsi %93, %c32 : index
        %95 = arith.minsi %48, %91 : index
        %96 = affine.apply #map3()[%91, %95]
        %97 = arith.subi %c0_i32, %18 : i32
        %98 = arith.maxsi %97, %c0_i32 : i32
        %99 = arith.index_cast %98 : i32 to index
        %100 = arith.minsi %99, %94 : index
        %101 = affine.apply #map3()[%94, %100]
        %102 = arith.cmpi slt, %96, %c32 : index
        %103 = arith.cmpi slt, %101, %c32 : index
        %104 = arith.ori %102, %103 : i1
        %subview_21 = memref.subview %reinterpret_cast_18[0, 0] [%96, %101] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>> to memref<?x?xf32, strided<[2048, 1], offset: ?>>
        %subview_22 = memref.subview %alloc_20[%95, %100] [%96, %101] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        %105 = arith.remui %100, %c8 : index
        hivm.hir.anchor {id = 82 : i64}
        hivm.hir.load ins(%subview_21 : memref<?x?xf32, strided<[2048, 1], offset: ?>>) outs(%subview_22 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %105 : index init_out_buffer = true init_condition = %104 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 83 : i64}
        %106 = bufferization.to_tensor %alloc_20 restrict writable : memref<32x32xf32>
        %alloc_23 = memref.alloc() : memref<32x32xf32>
        %subview_24 = memref.subview %reinterpret_cast_19[0, 0] [%96, %101] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>> to memref<?x?xf32, strided<[2048, 1], offset: ?>>
        %subview_25 = memref.subview %alloc_23[%95, %100] [%96, %101] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        hivm.hir.anchor {id = 84 : i64}
        hivm.hir.load ins(%subview_24 : memref<?x?xf32, strided<[2048, 1], offset: ?>>) outs(%subview_25 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %105 : index init_out_buffer = true init_condition = %104 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 85 : i64}
        %107 = bufferization.to_tensor %alloc_23 restrict writable : memref<32x32xf32>
        %expanded = tensor.expand_shape %73 [[0, 1]] output_shape [1, 32] : tensor<32xi32> into tensor<1x32xi32>
        %expanded_26 = tensor.expand_shape %73 [[0, 1]] output_shape [32, 1] : tensor<32xi32> into tensor<32x1xi32>
        %108 = tensor.empty() : tensor<32x32xi32>
        hivm.hir.anchor {id = 86 : i64}
        %109 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_26 : tensor<32x1xi32>) outs(%108 : tensor<32x32xi32>) broadcast_dims = [1] -> tensor<32x32xi32>
        hivm.hir.anchor {id = 87 : i64}
        %110 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded : tensor<1x32xi32>) outs(%108 : tensor<32x32xi32>) broadcast_dims = [0] -> tensor<32x32xi32>
        hivm.hir.anchor {id = 88 : i64}
        %111 = tensor.empty() : tensor<32x32xi1>
        %112 = hivm.hir.vcmp ins(%109, %110 : tensor<32x32xi32>, tensor<32x32xi32>) outs(%111 : tensor<32x32xi1>) compare_mode = <ge> -> tensor<32x32xi1>
        hivm.hir.anchor {id = 89 : i64}
        %113 = tensor.empty() : tensor<1x32xi32>
        %114 = hivm.hir.vadd ins(%expanded, %19 : tensor<1x32xi32>, i32) outs(%113 : tensor<1x32xi32>) -> tensor<1x32xi32>
        hivm.hir.anchor {id = 90 : i64}
        %115 = tensor.empty() : tensor<1x32xi1>
        %116 = hivm.hir.vcmp ins(%114, %arg16 : tensor<1x32xi32>, i32) outs(%115 : tensor<1x32xi1>) compare_mode = <lt> -> tensor<1x32xi1>
        hivm.hir.anchor {id = 91 : i64}
        %collapsed = tensor.collapse_shape %116 [[0, 1]] : tensor<1x32xi1> into tensor<32xi1>
        %117 = tensor.empty() : tensor<32xf16>
        %118 = hivm.hir.vsel ins(%collapsed, %cst_3, %cst_2 : tensor<32xi1>, f16, f16) outs(%117 : tensor<32xf16>) -> tensor<32xf16>
        hivm.hir.anchor {id = 92 : i64}
        %expanded_27 = tensor.expand_shape %118 [[0, 1]] output_shape [1, 32] : tensor<32xf16> into tensor<1x32xf16>
        %119 = tensor.empty() : tensor<32x32xf16>
        %120 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%expanded_27 : tensor<1x32xf16>) outs(%119 : tensor<32x32xf16>) broadcast_dims = [0] -> tensor<32x32xf16>
        hivm.hir.anchor {id = 93 : i64}
        %121 = hivm.hir.vcmp ins(%120, %cst_2 : tensor<32x32xf16>, f16) outs(%111 : tensor<32x32xi1>) compare_mode = <ne> -> tensor<32x32xi1>
        hivm.hir.anchor {id = 94 : i64}
        %122 = hivm.hir.vand ins(%112, %121 : tensor<32x32xi1>, tensor<32x32xi1>) outs(%111 : tensor<32x32xi1>) -> tensor<32x32xi1>
        hivm.hir.anchor {id = 95 : i64}
        %123 = tensor.empty() : tensor<32x32xf32>
        %124 = hivm.hir.vsel ins(%122, %106, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%123 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 96 : i64}
        %125 = hivm.hir.vsel ins(%122, %107, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%123 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 97 : i64}
        %126 = hivm.hir.vsub ins(%60, %85 : tensor<32x128xf32>, tensor<1x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
        hivm.hir.anchor {id = 98 : i64}
        %127 = arith.index_cast %19 : i32 to index
        %128 = affine.apply #map16()[%127]
        %129 = arith.maxsi %127, %38 : index
        %130 = arith.minsi %128, %129 : index
        %131 = affine.apply #map3()[%130, %127]
        %extracted_slice = tensor.extract_slice %126[0, 0] [%131, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x128xf32>
        hivm.hir.anchor {id = 99 : i64}
        %inserted_slice = tensor.insert_slice %extracted_slice into %10[0, 0] [%131, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<?x128xf32> into tensor<32x128xf32>
        hivm.hir.anchor {id = 100 : i64}
        %132 = hivm.hir.vmul ins(%inserted_slice, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 101 : i64}
        %133 = hivm.hir.vexp ins(%132 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 102 : i64}
        %134 = hivm.hir.vmul ins(%inserted_slice, %cst_4 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 103 : i64}
        %135 = hivm.hir.vmul ins(%134, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 104 : i64}
        %136 = hivm.hir.vexp ins(%135 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 105 : i64}
        %137 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%76 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 106 : i64}
        %138 = hivm.hir.vmul ins(%137, %136 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 107 : i64}
        %expanded_28 = tensor.expand_shape %138 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
        %139 = tensor.empty() : tensor<16x32x8xf32>
        %140 = hivm.hir.vtranspose ins(%expanded_28 : tensor<32x16x8xf32>) outs(%139 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
        hivm.hir.anchor {id = 108 : i64}
        %expanded_29 = tensor.expand_shape %140 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
        %alloc_30 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_30 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %141 = bufferization.to_tensor %alloc_30 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        hivm.hir.anchor {id = 109 : i64}
        hivm.hir.copy ins(%expanded_29 : tensor<16x2x16x8xf32>) outs(%alloc_30 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 110 : i64}
        %expanded_31 = tensor.expand_shape %124 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %142 = tensor.empty() : tensor<4x32x8xf32>
        %143 = hivm.hir.vtranspose ins(%expanded_31 : tensor<32x4x8xf32>) outs(%142 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 111 : i64}
        %expanded_32 = tensor.expand_shape %143 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_33 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_33 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %144 = bufferization.to_tensor %alloc_33 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 112 : i64}
        hivm.hir.copy ins(%expanded_32 : tensor<4x2x16x8xf32>) outs(%alloc_33 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 113 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %145 = tensor.empty() : tensor<8x2x16x16xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %146 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%144, %141, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 114 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        %alloc_34 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_34 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast = memref.memory_space_cast %alloc_34 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %147 = bufferization.to_tensor %memspacecast restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.anchor {id = 115 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%146 : tensor<8x2x16x16xf32>) outs(%alloc_34 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 116 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %148 = hivm.hir.vmul ins(%147, %133 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 117 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        %149 = hivm.hir.vadd ins(%71#0, %148 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 118 : i64}
        %alloc_35 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_35 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %150 = bufferization.to_tensor %alloc_35 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        hivm.hir.anchor {id = 119 : i64}
        hivm.hir.copy ins(%expanded_29 : tensor<16x2x16x8xf32>) outs(%alloc_35 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 120 : i64}
        %expanded_36 = tensor.expand_shape %125 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %151 = hivm.hir.vtranspose ins(%expanded_36 : tensor<32x4x8xf32>) outs(%142 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 121 : i64}
        %expanded_37 = tensor.expand_shape %151 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_38 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_38 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %152 = bufferization.to_tensor %alloc_38 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 122 : i64}
        hivm.hir.copy ins(%expanded_37 : tensor<4x2x16x8xf32>) outs(%alloc_38 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 123 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %153 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%152, %150, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 124 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        %alloc_39 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_39 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast_40 = memref.memory_space_cast %alloc_39 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %154 = bufferization.to_tensor %memspacecast_40 restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.anchor {id = 125 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%153 : tensor<8x2x16x16xf32>) outs(%alloc_39 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 126 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %155 = hivm.hir.vmul ins(%154, %133 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 127 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        %156 = hivm.hir.vadd ins(%71#1, %155 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 128 : i64}
        %157 = hivm.hir.vmul ins(%156, %137 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 129 : i64}
        %158 = tensor.empty() : tensor<32xf32>
        %159 = hivm.hir.vbrc {hivm.tcore_type = #hivm.tcore_type<VECTOR>} ins(%cst : f32) outs(%158 : tensor<32xf32>) -> tensor<32xf32>
        hivm.hir.anchor {id = 130 : i64}
        %expanded_41 = tensor.expand_shape %159 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
        %160 = hivm.hir.vreduce <sum> ins(%157 : tensor<32x128xf32>) outs(%expanded_41 : tensor<32x1xf32>) reduce_dims = [1] -> tensor<32x1xf32>
        hivm.hir.anchor {id = 131 : i64}
        %collapsed_42 = tensor.collapse_shape %160 [[0, 1]] : tensor<32x1xf32> into tensor<32xf32>
        %expanded_43 = tensor.expand_shape %69 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
        %161 = hivm.hir.vmul ins(%156, %expanded_43 : tensor<32x128xf32>, tensor<32x1xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [1] -> tensor<32x128xf32>
        hivm.hir.anchor {id = 132 : i64}
        %reinterpret_cast_44 = memref.reinterpret_cast %arg8 to offset: [%39], sizes: [32, 128], strides: [4096, 1] : memref<?xf32> to memref<32x128xf32, strided<[4096, 1], offset: ?>>
        %reinterpret_cast_45 = memref.reinterpret_cast %arg9 to offset: [%39], sizes: [32, 128], strides: [4096, 1] : memref<?xf32> to memref<32x128xf32, strided<[4096, 1], offset: ?>>
        %162 = affine.apply #map4()[%33, %35]
        %reinterpret_cast_46 = memref.reinterpret_cast %arg14 to offset: [%162], sizes: [32], strides: [32] : memref<?xf32> to memref<32xf32, strided<[32], offset: ?>>
        %163 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%75 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 133 : i64}
        %164 = hivm.hir.vmul ins(%163, %149 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 134 : i64}
        %alloc_47 = memref.alloc() : memref<32x128xf32>
        %subview_48 = memref.subview %reinterpret_cast_44[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>> to memref<?x?xf32, strided<[4096, 1], offset: ?>>
        %subview_49 = memref.subview %alloc_47[%49, %54] [%50, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 135 : i64}
        hivm.hir.load ins(%subview_48 : memref<?x?xf32, strided<[4096, 1], offset: ?>>) outs(%subview_49 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 136 : i64}
        %165 = bufferization.to_tensor %alloc_47 restrict writable : memref<32x128xf32>
        hivm.hir.anchor {id = 137 : i64}
        %166 = hivm.hir.vadd ins(%149, %165 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 138 : i64}
        %extracted_slice_50 = tensor.extract_slice %166[%49, %54] [%50, %55] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x?xf32>
        hivm.hir.anchor {id = 139 : i64}
        %subview_51 = memref.subview %reinterpret_cast_45[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>> to memref<?x?xf32, strided<[4096, 1], offset: ?>>
        hivm.hir.store ins(%extracted_slice_50 : tensor<?x?xf32>) outs(%subview_51 : memref<?x?xf32, strided<[4096, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 140 : i64}
        %extracted_slice_52 = tensor.extract_slice %collapsed_42[%65] [%66] [1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32xf32> to tensor<?xf32>
        hivm.hir.anchor {id = 141 : i64}
        %subview_53 = memref.subview %reinterpret_cast_46[0] [%66] [1] : memref<32xf32, strided<[32], offset: ?>> to memref<?xf32, strided<[32], offset: ?>>
        hivm.hir.store ins(%extracted_slice_52 : tensor<?xf32>) outs(%subview_53 : memref<?xf32, strided<[32], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 142 : i64}
        %167 = arith.subi %arg16, %17 : i32
        %168 = arith.addi %167, %c31_i32 : i32
        %169 = arith.divsi %168, %c32_i32 : i32
        %170 = arith.minsi %169, %c2_i32 : i32
        %171 = arith.subi %170, %c1_i32 : i32
        %172 = arith.cmpi slt, %14, %171 : i32
        %173 = scf.if %172 -> (tensor<32x128xf32>) {
          hivm.hir.anchor {id = 143 : i64}
          %211 = arith.addi %19, %c32_i32 : i32
          %212 = arith.minsi %211, %arg16 : i32
          %213 = arith.subi %212, %c1_i32 : i32
          %214 = arith.muli %213, %c4096_i32 : i32
          %215 = arith.index_cast %214 : i32 to index
          %216 = arith.index_cast %21 : i32 to index
          %217 = affine.apply #map5()[%216, %25, %215]
          %reinterpret_cast_93 = memref.reinterpret_cast %arg4 to offset: [%217], sizes: [128], strides: [1] : memref<?xf32> to memref<128xf32, strided<[1], offset: ?>>
          %alloc_94 = memref.alloc() : memref<128xf32>
          %218 = affine.apply #map6()[%216]
          %219 = arith.maxsi %216, %c128 : index
          %220 = arith.minsi %218, %219 : index
          %221 = affine.apply #map3()[%220, %216]
          %222 = arith.cmpi slt, %221, %c128 : index
          %subview_95 = memref.subview %reinterpret_cast_93[0] [%221] [1] : memref<128xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
          %subview_96 = memref.subview %alloc_94[0] [%221] [1] : memref<128xf32> to memref<?xf32, strided<[1]>>
          hivm.hir.anchor {id = 144 : i64}
          hivm.hir.load ins(%subview_95 : memref<?xf32, strided<[1], offset: ?>>) outs(%subview_96 : memref<?xf32, strided<[1]>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 init_out_buffer = true init_condition = %222 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
          hivm.hir.anchor {id = 145 : i64}
          %223 = bufferization.to_tensor %alloc_94 restrict writable : memref<128xf32>
          %224 = arith.addi %14, %c1_i32 : i32
          %expanded_97 = tensor.expand_shape %223 [[0, 1]] output_shape [1, 128] : tensor<128xf32> into tensor<1x128xf32>
          hivm.hir.anchor {id = 146 : i64}
          %225 = scf.for %arg21 = %224 to %170 step %c1_i32 iter_args(%arg22 = %10) -> (tensor<32x128xf32>)  : i32 {
            hivm.hir.anchor {id = 147 : i64}
            %alloc_98 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_98 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<32x128xf32, #hivm.address_space<ub>>
            %alloc_99 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_99 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<32x128xf32, #hivm.address_space<ub>>
            %alloc_100 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_100 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_101 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_101 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            hivm.hir.anchor {id = 148 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 149 : i64}
              %235 = arith.muli %arg21, %c32_i32 : i32
              %236 = arith.addi %17, %235 : i32
              %237 = arith.maxsi %236, %c0_i32 : i32
              %238 = arith.index_cast %237 : i32 to index
              %239 = affine.apply #map()[%37, %25, %238]
              %reinterpret_cast_102 = memref.reinterpret_cast %arg2 to offset: [%239], sizes: [32, 128], strides: [4096, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[4096, 1], offset: ?>>
              %reinterpret_cast_103 = memref.reinterpret_cast %arg3 to offset: [%239], sizes: [32, 128], strides: [4096, 1] : memref<?xbf16> to memref<32x128xbf16, strided<[4096, 1], offset: ?>>
              %reinterpret_cast_104 = memref.reinterpret_cast %arg4 to offset: [%239], sizes: [32, 128], strides: [4096, 1] : memref<?xf32> to memref<32x128xf32, strided<[4096, 1], offset: ?>>
              %240 = affine.apply #map4()[%26, %238]
              %reinterpret_cast_105 = memref.reinterpret_cast %arg5 to offset: [%240], sizes: [32], strides: [32] : memref<?xf32> to memref<32xf32, strided<[32], offset: ?>>
              %alloc_106 = memref.alloc() : memref<32xf32>
              %241 = affine.apply #map3()[%38, %238]
              %242 = arith.maxsi %241, %c0 : index
              %243 = arith.minsi %242, %c32 : index
              %244 = arith.subi %c0_i32, %236 : i32
              %245 = arith.maxsi %244, %c0_i32 : i32
              %246 = arith.index_cast %245 : i32 to index
              %247 = arith.minsi %246, %243 : index
              %248 = affine.apply #map3()[%243, %247]
              %249 = arith.cmpi slt, %248, %c32 : index
              %subview_107 = memref.subview %reinterpret_cast_105[0] [%248] [1] : memref<32xf32, strided<[32], offset: ?>> to memref<?xf32, strided<[32], offset: ?>>
              %subview_108 = memref.subview %alloc_106[%247] [%248] [1] : memref<32xf32> to memref<?xf32, strided<[1], offset: ?>>
              %250 = arith.remui %247, %c8 : index
              hivm.hir.anchor {id = 150 : i64}
              hivm.hir.load ins(%subview_107 : memref<?xf32, strided<[32], offset: ?>>) outs(%subview_108 : memref<?xf32, strided<[1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %250 : index init_out_buffer = true init_condition = %249 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 151 : i64}
              %251 = bufferization.to_tensor %alloc_106 restrict writable : memref<32xf32>
              %alloc_109 = memref.alloc() : memref<32x128xbf16>
              %252 = affine.apply #map1()[%38, %37, %238]
              %253 = arith.maxsi %252, %c0 : index
              %254 = arith.minsi %253, %c32 : index
              %255 = arith.minsi %246, %254 : index
              %256 = affine.apply #map3()[%254, %255]
              %257 = arith.cmpi slt, %256, %c32 : index
              %258 = arith.ori %257, %57 : i1
              %subview_110 = memref.subview %reinterpret_cast_102[0, 0] [%256, %55] [1, 1] : memref<32x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
              %subview_111 = memref.subview %alloc_109[%255, %54] [%256, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 152 : i64}
              hivm.hir.load ins(%subview_110 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_111 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %74 : index init_out_buffer = true init_condition = %258 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 153 : i64}
              %259 = bufferization.to_tensor %alloc_109 restrict writable : memref<32x128xbf16>
              %alloc_112 = memref.alloc() : memref<32x128xbf16>
              %subview_113 = memref.subview %reinterpret_cast_103[0, 0] [%256, %55] [1, 1] : memref<32x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
              %subview_114 = memref.subview %alloc_112[%255, %54] [%256, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 154 : i64}
              hivm.hir.load ins(%subview_113 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_114 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %74 : index init_out_buffer = true init_condition = %258 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 155 : i64}
              %260 = bufferization.to_tensor %alloc_112 restrict writable : memref<32x128xbf16>
              hivm.hir.anchor {id = 156 : i64}
              %261 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%260 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 157 : i64}
              %expanded_115 = tensor.expand_shape %251 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
              %262 = hivm.hir.vmul ins(%261, %expanded_115 : tensor<32x128xf32>, tensor<32x1xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [1] -> tensor<32x128xf32>
              hivm.hir.anchor {id = 158 : i64}
              %alloc_116 = memref.alloc() : memref<32x128xf32>
              %subview_117 = memref.subview %reinterpret_cast_104[0, 0] [%256, %55] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>> to memref<?x?xf32, strided<[4096, 1], offset: ?>>
              %subview_118 = memref.subview %alloc_116[%255, %54] [%256, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
              hivm.hir.anchor {id = 159 : i64}
              hivm.hir.load ins(%subview_117 : memref<?x?xf32, strided<[4096, 1], offset: ?>>) outs(%subview_118 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %258 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
              hivm.hir.anchor {id = 160 : i64}
              %263 = bufferization.to_tensor %alloc_116 restrict writable : memref<32x128xf32>
              hivm.hir.anchor {id = 161 : i64}
              %264 = hivm.hir.vsub ins(%263, %expanded_97 : tensor<32x128xf32>, tensor<1x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
              hivm.hir.anchor {id = 162 : i64}
              %265 = hivm.hir.vmul ins(%264, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 163 : i64}
              %266 = hivm.hir.vexp ins(%265 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 164 : i64}
              %267 = arith.index_cast %236 : i32 to index
              %268 = affine.apply #map16()[%267]
              %269 = arith.maxsi %267, %38 : index
              %270 = arith.minsi %268, %269 : index
              %271 = affine.apply #map3()[%270, %267]
              %extracted_slice_119 = tensor.extract_slice %266[0, 0] [%271, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x128xf32>
              hivm.hir.anchor {id = 165 : i64}
              %inserted_slice_120 = tensor.insert_slice %extracted_slice_119 into %10[0, 0] [%271, 128] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<?x128xf32> into tensor<32x128xf32>
              hivm.hir.anchor {id = 166 : i64}
              %272 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%259 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 167 : i64}
              %273 = hivm.hir.vmul ins(%272, %inserted_slice_120 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 168 : i64}
              %274 = hivm.hir.vmul ins(%262, %inserted_slice_120 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 169 : i64}
              %expanded_121 = tensor.expand_shape %273 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
              %275 = hivm.hir.vtranspose ins(%expanded_121 : tensor<32x16x8xf32>) outs(%139 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
              hivm.hir.anchor {id = 170 : i64}
              %expanded_122 = tensor.expand_shape %275 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
              annotation.mark %alloc_101 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<14>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 171 : i64}
              hivm.hir.copy ins(%expanded_122 : tensor<16x2x16x8xf32>) outs(%alloc_101 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 172 : i64}
              %expanded_123 = tensor.expand_shape %274 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
              %276 = hivm.hir.vtranspose ins(%expanded_123 : tensor<32x16x8xf32>) outs(%139 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
              hivm.hir.anchor {id = 173 : i64}
              %expanded_124 = tensor.expand_shape %276 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
              annotation.mark %alloc_100 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<15>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 174 : i64}
              hivm.hir.copy ins(%expanded_124 : tensor<16x2x16x8xf32>) outs(%alloc_100 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
              hivm.hir.anchor {id = 175 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 2 : i32, no_inline}
            hivm.hir.anchor {id = 176 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            %230 = bufferization.to_tensor %alloc_101 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %231 = bufferization.to_tensor %alloc_100 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 1
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 177 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 178 : i64}
              %235 = arith.muli %arg21, %c32_i32 : i32
              %236 = arith.addi %17, %235 : i32
              %237 = arith.maxsi %236, %c0_i32 : i32
              %238 = arith.index_cast %237 : i32 to index
              %239 = arith.subi %c0_i32, %236 : i32
              %240 = arith.maxsi %239, %c0_i32 : i32
              %241 = arith.index_cast %240 : i32 to index
              %242 = affine.apply #map7()[%87, %28, %238]
              %reinterpret_cast_102 = memref.reinterpret_cast %arg6 to offset: [%242], sizes: [32, 32], strides: [2048, 1] : memref<?xf32> to memref<32x32xf32, strided<[2048, 1], offset: ?>>
              %243 = affine.apply #map8()[%38, %87, %238]
              %244 = arith.maxsi %243, %c0 : index
              %245 = arith.minsi %244, %c32 : index
              %246 = arith.minsi %241, %245 : index
              %247 = affine.apply #map3()[%245, %246]
              %248 = arith.cmpi slt, %247, %c32 : index
              %249 = arith.ori %248, %103 : i1
              %subview_103 = memref.subview %reinterpret_cast_102[0, 0] [%247, %101] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>> to memref<?x?xf32, strided<[2048, 1], offset: ?>>
              %250 = affine.apply #map10()[%245, %246]
              %251 = affine.apply #map11()[%94, %100]
              %252 = affine.apply #map12(%246)
              %253 = affine.apply #map13(%100)
              %254 = affine.apply #map14(%246)
              %255 = affine.apply #map15(%100)
              %alloc_104 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_105 = memref.subview %alloc_104[%253, %252, %254, %255] [%251, %250, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 179 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_103 : memref<?x?xf32, strided<[2048, 1], offset: ?>>) outs(%subview_105 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %249 : i1
              hivm.hir.anchor {id = 180 : i64}
              %256 = bufferization.to_tensor %alloc_104 restrict writable : memref<4x2x16x8xf32>
              %reinterpret_cast_106 = memref.reinterpret_cast %arg7 to offset: [%242], sizes: [32, 32], strides: [2048, 1] : memref<?xf32> to memref<32x32xf32, strided<[2048, 1], offset: ?>>
              %subview_107 = memref.subview %reinterpret_cast_106[0, 0] [%247, %101] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>> to memref<?x?xf32, strided<[2048, 1], offset: ?>>
              %alloc_108 = memref.alloc() : memref<4x2x16x8xf32>
              %subview_109 = memref.subview %alloc_108[%253, %252, %254, %255] [%251, %250, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>
              hivm.hir.anchor {id = 181 : i64}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_107 : memref<?x?xf32, strided<[2048, 1], offset: ?>>) outs(%subview_109 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>>) init_out_buffer = true pad_value = %cst : f32 init_condition = %249 : i1
              hivm.hir.anchor {id = 182 : i64}
              %257 = bufferization.to_tensor %alloc_108 restrict writable : memref<4x2x16x8xf32>
              hivm.hir.anchor {id = 183 : i64}
              %258 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%256, %230, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 184 : i64}
              annotation.mark %alloc_99 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>} : memref<32x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 185 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%258 : tensor<8x2x16x16xf32>) outs(%alloc_99 : memref<32x128xf32, #hivm.address_space<ub>>)
              hivm.hir.anchor {id = 186 : i64}
              %259 = hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%257, %231, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
              hivm.hir.anchor {id = 187 : i64}
              annotation.mark %alloc_98 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>} : memref<32x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 188 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%259 : tensor<8x2x16x16xf32>) outs(%alloc_98 : memref<32x128xf32, #hivm.address_space<ub>>)
              hivm.hir.anchor {id = 189 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 190 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            %232 = bufferization.to_tensor %alloc_99 restrict writable : memref<32x128xf32, #hivm.address_space<ub>>
            %233 = bufferization.to_tensor %alloc_98 restrict writable : memref<32x128xf32, #hivm.address_space<ub>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.anchor {id = 191 : i64}
            %234 = scope.scope : () -> tensor<32x128xf32> {
              hivm.hir.anchor {id = 192 : i64}
              %235 = hivm.hir.vadd ins(%232, %arg22 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 193 : i64}
              %236 = hivm.hir.vadd ins(%233, %235 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
              hivm.hir.anchor {id = 194 : i64}
              scope.return %236 : tensor<32x128xf32>
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 195 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 1
            scf.yield %234 : tensor<32x128xf32>
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop}
          hivm.hir.anchor {id = 196 : i64}
          %226 = hivm.hir.vsub ins(%expanded_97, %60 : tensor<1x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [0] -> tensor<32x128xf32>
          hivm.hir.anchor {id = 197 : i64}
          %227 = hivm.hir.vmul ins(%226, %cst_1 : tensor<32x128xf32>, f32) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 198 : i64}
          %228 = hivm.hir.vexp ins(%227 : tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 199 : i64}
          %229 = hivm.hir.vmul ins(%225, %228 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
          hivm.hir.anchor {id = 200 : i64}
          scf.yield %229 : tensor<32x128xf32>
        } else {
          hivm.hir.anchor {id = 201 : i64}
          scf.yield %10 : tensor<32x128xf32>
        }
        %alloc_54 = memref.alloc() : memref<32x128xbf16>
        %subview_55 = memref.subview %alloc_54[%49, %54] [%50, %55] [1, 1] : memref<32x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 202 : i64}
        hivm.hir.load ins(%subview_13 : memref<?x?xbf16, strided<[4096, 1], offset: ?>>) outs(%subview_55 : memref<?x?xbf16, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %74 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 203 : i64}
        %174 = bufferization.to_tensor %alloc_54 restrict writable : memref<32x128xbf16>
        %alloc_56 = memref.alloc() : memref<32xf32>
        %subview_57 = memref.subview %alloc_56[%65] [%66] [1] : memref<32xf32> to memref<?xf32, strided<[1], offset: ?>>
        hivm.hir.anchor {id = 204 : i64}
        hivm.hir.load ins(%subview_8 : memref<?xf32, strided<[32], offset: ?>>) outs(%subview_57 : memref<?xf32, strided<[1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %68 : index init_out_buffer = true init_condition = %67 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 205 : i64}
        %175 = bufferization.to_tensor %alloc_56 restrict writable : memref<32xf32>
        %alloc_58 = memref.alloc() : memref<32x32xf32>
        %subview_59 = memref.subview %alloc_58[%95, %100] [%96, %101] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        hivm.hir.anchor {id = 206 : i64}
        hivm.hir.load ins(%subview_21 : memref<?x?xf32, strided<[2048, 1], offset: ?>>) outs(%subview_59 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %105 : index init_out_buffer = true init_condition = %104 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 207 : i64}
        %176 = bufferization.to_tensor %alloc_58 restrict writable : memref<32x32xf32>
        hivm.hir.anchor {id = 208 : i64}
        %177 = hivm.hir.vtranspose ins(%176 : tensor<32x32xf32>) outs(%123 : tensor<32x32xf32>) permutation = [1, 0] -> tensor<32x32xf32>
        hivm.hir.anchor {id = 209 : i64}
        %alloc_60 = memref.alloc() : memref<32x32xf32>
        %subview_61 = memref.subview %alloc_60[%95, %100] [%96, %101] [1, 1] : memref<32x32xf32> to memref<?x?xf32, strided<[32, 1], offset: ?>>
        hivm.hir.anchor {id = 210 : i64}
        hivm.hir.load ins(%subview_24 : memref<?x?xf32, strided<[2048, 1], offset: ?>>) outs(%subview_61 : memref<?x?xf32, strided<[32, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %105 : index init_out_buffer = true init_condition = %104 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 211 : i64}
        %178 = bufferization.to_tensor %alloc_60 restrict writable : memref<32x32xf32>
        hivm.hir.anchor {id = 212 : i64}
        %179 = hivm.hir.vtranspose ins(%178 : tensor<32x32xf32>) outs(%123 : tensor<32x32xf32>) permutation = [1, 0] -> tensor<32x32xf32>
        hivm.hir.anchor {id = 213 : i64}
        %180 = hivm.hir.vcmp ins(%109, %110 : tensor<32x32xi32>, tensor<32x32xi32>) outs(%111 : tensor<32x32xi1>) compare_mode = <le> -> tensor<32x32xi1>
        hivm.hir.anchor {id = 214 : i64}
        %181 = hivm.hir.vsel ins(%180, %177, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%123 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 215 : i64}
        %182 = hivm.hir.vsel ins(%180, %179, %cst : tensor<32x32xi1>, tensor<32x32xf32>, f32) outs(%123 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.anchor {id = 216 : i64}
        %183 = hivm.hir.vcast {enable_overflow = true, enable_saturate = false, hivm.unsigned_mode = #hivm.unsigned_mode<si2si>} ins(%174 : tensor<32x128xbf16>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 217 : i64}
        %184 = hivm.hir.vmul ins(%183, %133 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 218 : i64}
        %expanded_62 = tensor.expand_shape %175 [[0, 1]] output_shape [32, 1] : tensor<32xf32> into tensor<32x1xf32>
        %185 = hivm.hir.vmul ins(%137, %expanded_62 : tensor<32x128xf32>, tensor<32x1xf32>) outs(%9 : tensor<32x128xf32>) broadcast = [1] -> tensor<32x128xf32>
        hivm.hir.anchor {id = 219 : i64}
        %186 = hivm.hir.vmul ins(%185, %133 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 220 : i64}
        %expanded_63 = tensor.expand_shape %184 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
        %187 = hivm.hir.vtranspose ins(%expanded_63 : tensor<32x16x8xf32>) outs(%139 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
        hivm.hir.anchor {id = 221 : i64}
        %expanded_64 = tensor.expand_shape %187 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
        %alloc_65 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_65 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<16>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %188 = bufferization.to_tensor %alloc_65 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        hivm.hir.anchor {id = 222 : i64}
        hivm.hir.copy ins(%expanded_64 : tensor<16x2x16x8xf32>) outs(%alloc_65 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 223 : i64}
        %expanded_66 = tensor.expand_shape %181 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %189 = hivm.hir.vtranspose ins(%expanded_66 : tensor<32x4x8xf32>) outs(%142 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 224 : i64}
        %expanded_67 = tensor.expand_shape %189 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_68 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_68 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<17>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %190 = bufferization.to_tensor %alloc_68 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 225 : i64}
        hivm.hir.copy ins(%expanded_67 : tensor<4x2x16x8xf32>) outs(%alloc_68 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 226 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %191 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%190, %188, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 227 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        %alloc_69 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_69 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast_70 = memref.memory_space_cast %alloc_69 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %192 = bufferization.to_tensor %memspacecast_70 restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
        hivm.hir.anchor {id = 228 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%191 : tensor<8x2x16x16xf32>) outs(%alloc_69 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 229 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %193 = hivm.hir.vmul ins(%192, %136 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 230 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
        %194 = hivm.hir.vadd ins(%173, %193 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 231 : i64}
        %expanded_71 = tensor.expand_shape %186 [[0], [1, 2]] output_shape [32, 16, 8] : tensor<32x128xf32> into tensor<32x16x8xf32>
        %195 = hivm.hir.vtranspose ins(%expanded_71 : tensor<32x16x8xf32>) outs(%139 : tensor<16x32x8xf32>) permutation = [1, 0, 2] -> tensor<16x32x8xf32>
        hivm.hir.anchor {id = 232 : i64}
        %expanded_72 = tensor.expand_shape %195 [[0], [1, 2], [3]] output_shape [16, 2, 16, 8] : tensor<16x32x8xf32> into tensor<16x2x16x8xf32>
        %alloc_73 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_73 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<18>} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %196 = bufferization.to_tensor %alloc_73 restrict writable : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        hivm.hir.anchor {id = 233 : i64}
        hivm.hir.copy ins(%expanded_72 : tensor<16x2x16x8xf32>) outs(%alloc_73 : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 234 : i64}
        %expanded_74 = tensor.expand_shape %182 [[0], [1, 2]] output_shape [32, 4, 8] : tensor<32x32xf32> into tensor<32x4x8xf32>
        %197 = hivm.hir.vtranspose ins(%expanded_74 : tensor<32x4x8xf32>) outs(%142 : tensor<4x32x8xf32>) permutation = [1, 0, 2] -> tensor<4x32x8xf32>
        hivm.hir.anchor {id = 235 : i64}
        %expanded_75 = tensor.expand_shape %197 [[0], [1, 2], [3]] output_shape [4, 2, 16, 8] : tensor<4x32x8xf32> into tensor<4x2x16x8xf32>
        %alloc_76 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_76 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<19>} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %198 = bufferization.to_tensor %alloc_76 restrict writable : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 236 : i64}
        hivm.hir.copy ins(%expanded_75 : tensor<4x2x16x8xf32>) outs(%alloc_76 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 237 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %199 = hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%198, %196, %true, %c32, %c32, %c128 : tensor<4x2x16x8xf32>, tensor<16x2x16x8xf32>, i1, index, index, index) outs(%145 : tensor<8x2x16x16xf32>) -> tensor<8x2x16x16xf32>
        hivm.hir.anchor {id = 238 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        %alloc_77 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_77 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>} : memref<32x128xf32, #hivm.address_space<ub>>
        %memspacecast_78 = memref.memory_space_cast %alloc_77 : memref<32x128xf32, #hivm.address_space<ub>> to memref<32x128xf32>
        %200 = bufferization.to_tensor %memspacecast_78 restrict writable : memref<32x128xf32>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
        hivm.hir.anchor {id = 239 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%199 : tensor<8x2x16x16xf32>) outs(%alloc_77 : memref<32x128xf32, #hivm.address_space<ub>>)
        hivm.hir.anchor {id = 240 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %201 = hivm.hir.vmul ins(%200, %136 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 241 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 8
        %202 = hivm.hir.vadd ins(%194, %201 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 242 : i64}
        %reinterpret_cast_79 = memref.reinterpret_cast %arg10 to offset: [%39], sizes: [32, 128], strides: [4096, 1] : memref<?xf32> to memref<32x128xf32, strided<[4096, 1], offset: ?>>
        %reinterpret_cast_80 = memref.reinterpret_cast %arg11 to offset: [%39], sizes: [32, 128], strides: [4096, 1] : memref<?xf32> to memref<32x128xf32, strided<[4096, 1], offset: ?>>
        %reinterpret_cast_81 = memref.reinterpret_cast %arg12 to offset: [%39], sizes: [32, 128], strides: [4096, 1] : memref<?xf32> to memref<32x128xf32, strided<[4096, 1], offset: ?>>
        %reinterpret_cast_82 = memref.reinterpret_cast %arg13 to offset: [%39], sizes: [32, 128], strides: [4096, 1] : memref<?xf32> to memref<32x128xf32, strided<[4096, 1], offset: ?>>
        %203 = hivm.hir.vsub ins(%161, %202 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 243 : i64}
        %204 = hivm.hir.vmul ins(%203, %137 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 244 : i64}
        %alloc_83 = memref.alloc() : memref<32x128xf32>
        %subview_84 = memref.subview %reinterpret_cast_81[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>> to memref<?x?xf32, strided<[4096, 1], offset: ?>>
        %subview_85 = memref.subview %alloc_83[%49, %54] [%50, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 245 : i64}
        hivm.hir.load ins(%subview_84 : memref<?x?xf32, strided<[4096, 1], offset: ?>>) outs(%subview_85 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 246 : i64}
        %205 = bufferization.to_tensor %alloc_83 restrict writable : memref<32x128xf32>
        hivm.hir.anchor {id = 247 : i64}
        %206 = hivm.hir.vadd ins(%204, %205 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 248 : i64}
        %207 = hivm.hir.vadd ins(%164, %206 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 249 : i64}
        %alloc_86 = memref.alloc() : memref<32x128xf32>
        %subview_87 = memref.subview %reinterpret_cast_79[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>> to memref<?x?xf32, strided<[4096, 1], offset: ?>>
        %subview_88 = memref.subview %alloc_86[%49, %54] [%50, %55] [1, 1] : memref<32x128xf32> to memref<?x?xf32, strided<[128, 1], offset: ?>>
        hivm.hir.anchor {id = 250 : i64}
        hivm.hir.load ins(%subview_87 : memref<?x?xf32, strided<[4096, 1], offset: ?>>) outs(%subview_88 : memref<?x?xf32, strided<[128, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>} pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %59 : index init_out_buffer = true init_condition = %58 : i1 eviction_policy = <EvictFirst> core_type = <VECTOR>
        hivm.hir.anchor {id = 251 : i64}
        %208 = bufferization.to_tensor %alloc_86 restrict writable : memref<32x128xf32>
        hivm.hir.anchor {id = 252 : i64}
        %209 = hivm.hir.vadd ins(%161, %208 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 253 : i64}
        %210 = hivm.hir.vadd ins(%209, %202 : tensor<32x128xf32>, tensor<32x128xf32>) outs(%9 : tensor<32x128xf32>) -> tensor<32x128xf32>
        hivm.hir.anchor {id = 254 : i64}
        %extracted_slice_89 = tensor.extract_slice %210[%49, %54] [%50, %55] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x?xf32>
        hivm.hir.anchor {id = 255 : i64}
        %subview_90 = memref.subview %reinterpret_cast_80[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>> to memref<?x?xf32, strided<[4096, 1], offset: ?>>
        hivm.hir.store ins(%extracted_slice_89 : tensor<?x?xf32>) outs(%subview_90 : memref<?x?xf32, strided<[4096, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 256 : i64}
        %extracted_slice_91 = tensor.extract_slice %207[%49, %54] [%50, %55] [1, 1] {hivm.tcore_type = #hivm.tcore_type<VECTOR>} : tensor<32x128xf32> to tensor<?x?xf32>
        hivm.hir.anchor {id = 257 : i64}
        %subview_92 = memref.subview %reinterpret_cast_82[0, 0] [%50, %55] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>> to memref<?x?xf32, strided<[4096, 1], offset: ?>>
        hivm.hir.store ins(%extracted_slice_91 : tensor<?x?xf32>) outs(%subview_92 : memref<?x?xf32, strided<[4096, 1], offset: ?>>) {hivm.tcore_type = #hivm.tcore_type<VECTOR>}
        hivm.hir.anchor {id = 258 : i64}
      }
      hivm.hir.set_ctrl true at ctrl[60]
      hivm.hir.anchor {id = 259 : i64}
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
    hivm.hir.anchor {id = 260 : i64}
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<20xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
    %c28_i32 = arith.constant 28 : i32
    %c1_i32 = arith.constant 1 : i32
    %true = arith.constant true
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %c31_i32 = arith.constant 31 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %c0_i32 = arith.constant 0 : i32
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %c2_i32 = arith.constant 2 : i32
    %c64_i32 = arith.constant 64 : i32
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
      %9 = arith.divsi %8, %c32_i32 : i32
      %10 = arith.remsi %8, %c32_i32 : i32
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
        %17 = arith.muli %12, %c32_i32 : i32
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
        hivm.hir.anchor {id = 11 : i64}
        scf.if %27 {
          hivm.hir.anchor {id = 12 : i64}
          hivm.hir.anchor {id = 13 : i64}
          hivm.hir.anchor {id = 14 : i64}
          %alloca = memref.alloca() {normalize_matmul_counter = 0 : i32} : memref<i32>
          hivm.hir.anchor {id = 15 : i64}
          memref.store %c0_i32, %alloca[] : memref<i32>
          hivm.hir.anchor {id = 16 : i64}
          %alloca_15 = memref.alloca() {normalize_matmul_counter = 1 : i32} : memref<i32>
          hivm.hir.anchor {id = 17 : i64}
          memref.store %c0_i32, %alloca_15[] : memref<i32>
          hivm.hir.anchor {id = 18 : i64}
          %alloc_16 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
          %alloc_17 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
          scf.for %arg21 = %c0_i32 to %11 step %c1_i32  : i32 {
            hivm.hir.anchor {id = 19 : i64}
            %alloc_20 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_20 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_21 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.anchor {id = 20 : i64}
            scope.scope : () -> () {
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
              hivm.hir.anchor {id = 32 : i64}
              annotation.mark %alloc_21 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 33 : i64}
              hivm.hir.anchor {id = 34 : i64}
              annotation.mark %alloc_20 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 35 : i64}
              hivm.hir.anchor {id = 36 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 37 : i64}
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 38 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 39 : i64}
              %49 = arith.muli %arg21, %c32_i32 : i32
              %50 = arith.maxsi %49, %c0_i32 : i32
              %51 = arith.index_cast %50 : i32 to index
              %52 = affine.apply #map7()[%51, %20, %22]
              %reinterpret_cast = memref.reinterpret_cast %arg6 to offset: [%52], sizes: [32, 32], strides: [2048, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_22 = memref.reinterpret_cast %arg7 to offset: [%52], sizes: [32, 32], strides: [2048, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
              %53 = affine.apply #map8()[%23, %51, %22]
              %54 = arith.maxsi %53, %c0 : index
              %55 = arith.minsi %54, %c32 : index
              %56 = affine.apply #map9()[%51]
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
              %subview = memref.subview %reinterpret_cast[0, 0] [%60, %65] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
              %69 = affine.apply #map10()[%55, %59]
              %70 = affine.apply #map11()[%58, %64]
              %71 = affine.apply #map12(%59)
              %72 = affine.apply #map13(%64)
              %73 = affine.apply #map14(%59)
              %74 = affine.apply #map15(%64)
              %alloc_23 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_24 = memref.subview %alloc_23[%72, %71, %73, %74] [%70, %69, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 40 : i64}
              scf.if %68 {
                %collapse_shape = memref.collapse_shape %alloc_23 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_24 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 41 : i64}
              %subview_25 = memref.subview %reinterpret_cast_22[0, 0] [%60, %65] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
              %alloc_26 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_27 = memref.subview %alloc_26[%72, %71, %73, %74] [%70, %69, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 42 : i64}
              scf.if %68 {
                %collapse_shape = memref.collapse_shape %alloc_26 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_25 : memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_27 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 43 : i64}
              hivm.hir.anchor {id = 44 : i64}
              %75 = memref.load %alloca[] : memref<i32>
              hivm.hir.anchor {id = 45 : i64}
              %76 = arith.cmpi eq, %75, %c0_i32 : i32
              hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%alloc_23, %alloc_21, %76, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_16 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 46 : i64}
              %77 = arith.addi %75, %c1_i32 : i32
              memref.store %77, %alloca[] : memref<i32>
              hivm.hir.anchor {id = 47 : i64}
              %78 = memref.load %alloca_15[] : memref<i32>
              hivm.hir.anchor {id = 48 : i64}
              %79 = arith.cmpi eq, %78, %c0_i32 : i32
              hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, hivm.remain_in_l0c, normalized_in_L0C} ins(%alloc_26, %alloc_20, %79, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_17 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 49 : i64}
              %80 = arith.addi %78, %c1_i32 : i32
              memref.store %80, %alloca_15[] : memref<i32>
              hivm.hir.anchor {id = 50 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 51 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop, may_not_exec, normalized_in_L0C = [0 : i32, 1 : i32]}
          hivm.hir.anchor {id = 52 : i64}
          %45 = memref.load %alloca[] : memref<i32>
          hivm.hir.anchor {id = 53 : i64}
          %46 = arith.cmpi eq, %45, %c0_i32 : i32
          %alloc_18 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_18 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.anchor {id = 54 : i64}
          scf.if %46 {
            hivm.hir.anchor {id = 55 : i64}
          } else {
            hivm.hir.anchor {id = 56 : i64}
            hivm.hir.anchor {id = 57 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_16 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_18 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.anchor {id = 58 : i64}
          }
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 59 : i64}
          %47 = memref.load %alloca_15[] : memref<i32>
          hivm.hir.anchor {id = 60 : i64}
          %48 = arith.cmpi eq, %47, %c0_i32 : i32
          %alloc_19 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_19 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
          hivm.hir.anchor {id = 61 : i64}
          scf.if %48 {
            hivm.hir.anchor {id = 62 : i64}
          } else {
            hivm.hir.anchor {id = 63 : i64}
            hivm.hir.anchor {id = 64 : i64}
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_17 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_19 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.anchor {id = 65 : i64}
          }
          hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
          hivm.hir.anchor {id = 66 : i64}
          hivm.hir.anchor {id = 67 : i64}
          hivm.hir.anchor {id = 68 : i64}
          hivm.hir.anchor {id = 69 : i64}
          hivm.hir.anchor {id = 70 : i64}
          hivm.hir.anchor {id = 71 : i64}
        } else {
          hivm.hir.anchor {id = 72 : i64}
        }
        hivm.hir.anchor {id = 73 : i64}
        hivm.hir.anchor {id = 74 : i64}
        hivm.hir.anchor {id = 75 : i64}
        hivm.hir.anchor {id = 76 : i64}
        hivm.hir.anchor {id = 77 : i64}
        hivm.hir.anchor {id = 78 : i64}
        hivm.hir.anchor {id = 79 : i64}
        hivm.hir.anchor {id = 80 : i64}
        hivm.hir.anchor {id = 81 : i64}
        %28 = arith.maxsi %14, %c0_i32 : i32
        %29 = arith.index_cast %28 : i32 to index
        %30 = affine.apply #map9()[%29]
        %31 = arith.maxsi %30, %c0 : index
        %32 = arith.minsi %31, %c32 : index
        %33 = arith.subi %c0_i32, %14 : i32
        %34 = arith.maxsi %33, %c0_i32 : i32
        %35 = arith.index_cast %34 : i32 to index
        %36 = arith.minsi %35, %32 : index
        %37 = affine.apply #map3()[%32, %36]
        %38 = arith.cmpi slt, %37, %c32 : index
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
        hivm.hir.anchor {id = 108 : i64}
        %alloc = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 109 : i64}
        hivm.hir.anchor {id = 110 : i64}
        hivm.hir.anchor {id = 111 : i64}
        %alloc_0 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_0 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 112 : i64}
        hivm.hir.anchor {id = 113 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_0, %alloc, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_1 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 114 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        %alloc_2 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_2 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.anchor {id = 115 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_1 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_2 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 116 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.anchor {id = 117 : i64}
        hivm.hir.anchor {id = 118 : i64}
        %alloc_3 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_3 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 119 : i64}
        hivm.hir.anchor {id = 120 : i64}
        hivm.hir.anchor {id = 121 : i64}
        %alloc_4 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_4 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 122 : i64}
        hivm.hir.anchor {id = 123 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_4, %alloc_3, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_5 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 124 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        %alloc_6 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_6 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.anchor {id = 125 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_5 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_6 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 126 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
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
        %39 = arith.subi %arg16, %13 : i32
        %40 = arith.addi %39, %c31_i32 : i32
        %41 = arith.divsi %40, %c32_i32 : i32
        %42 = arith.minsi %41, %c2_i32 : i32
        %43 = arith.subi %42, %c1_i32 : i32
        %44 = arith.cmpi slt, %11, %43 : i32
        scf.if %44 {
          hivm.hir.anchor {id = 143 : i64}
          hivm.hir.anchor {id = 144 : i64}
          hivm.hir.anchor {id = 145 : i64}
          %45 = arith.addi %11, %c1_i32 : i32
          hivm.hir.anchor {id = 146 : i64}
          scf.for %arg21 = %45 to %42 step %c1_i32  : i32 {
            hivm.hir.anchor {id = 147 : i64}
            %alloc_15 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_15 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_16 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_16 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_17 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_17 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_18 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            annotation.mark %alloc_18 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.anchor {id = 148 : i64}
            scope.scope : () -> () {
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
              hivm.hir.anchor {id = 169 : i64}
              hivm.hir.anchor {id = 170 : i64}
              annotation.mark %alloc_18 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<14>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 171 : i64}
              hivm.hir.anchor {id = 172 : i64}
              hivm.hir.anchor {id = 173 : i64}
              annotation.mark %alloc_17 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<15>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 174 : i64}
              hivm.hir.anchor {id = 175 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 2 : i32, no_inline}
            hivm.hir.anchor {id = 176 : i64}
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 1
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 177 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 178 : i64}
              %46 = arith.muli %arg21, %c32_i32 : i32
              %47 = arith.addi %13, %46 : i32
              %48 = arith.maxsi %47, %c0_i32 : i32
              %49 = arith.index_cast %48 : i32 to index
              %50 = arith.subi %c0_i32, %47 : i32
              %51 = arith.maxsi %50, %c0_i32 : i32
              %52 = arith.index_cast %51 : i32 to index
              %53 = affine.apply #map7()[%29, %20, %49]
              %reinterpret_cast = memref.reinterpret_cast %arg6 to offset: [%53], sizes: [32, 32], strides: [2048, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
              %54 = affine.apply #map8()[%23, %29, %49]
              %55 = arith.maxsi %54, %c0 : index
              %56 = arith.minsi %55, %c32 : index
              %57 = arith.minsi %52, %56 : index
              %58 = affine.apply #map3()[%56, %57]
              %59 = arith.cmpi slt, %58, %c32 : index
              %60 = arith.ori %59, %38 : i1
              %subview = memref.subview %reinterpret_cast[0, 0] [%58, %37] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
              %61 = affine.apply #map10()[%56, %57]
              %62 = affine.apply #map11()[%32, %36]
              %63 = affine.apply #map12(%57)
              %64 = affine.apply #map13(%36)
              %65 = affine.apply #map14(%57)
              %66 = affine.apply #map15(%36)
              %alloc_19 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_20 = memref.subview %alloc_19[%64, %63, %65, %66] [%62, %61, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 179 : i64}
              scf.if %60 {
                %collapse_shape = memref.collapse_shape %alloc_19 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_20 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 180 : i64}
              %reinterpret_cast_21 = memref.reinterpret_cast %arg7 to offset: [%53], sizes: [32, 32], strides: [2048, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_22 = memref.subview %reinterpret_cast_21[0, 0] [%58, %37] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
              %alloc_23 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
              %subview_24 = memref.subview %alloc_23[%64, %63, %65, %66] [%62, %61, 16, 8] [1, 1, 1, 1] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 181 : i64}
              scf.if %60 {
                %collapse_shape = memref.collapse_shape %alloc_23 [[0, 1, 2, 3]] : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> into memref<1024xf32, #hivm.address_space<cbuf>>
                hivm.hir.vbrc ins(%cst : f32) outs(%collapse_shape : memref<1024xf32, #hivm.address_space<cbuf>>)
              } {hivm.unlikely_condition}
              hivm.hir.nd2nz {dst_continuous} ins(%subview_22 : memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_24 : memref<?x?x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>)
              hivm.hir.anchor {id = 182 : i64}
              hivm.hir.anchor {id = 183 : i64}
              %alloc_25 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
              hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_19, %alloc_18, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_25 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 184 : i64}
              annotation.mark %alloc_16 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 185 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_25 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_16 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.anchor {id = 186 : i64}
              %alloc_26 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
              hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_23, %alloc_17, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_26 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
              hivm.hir.anchor {id = 187 : i64}
              annotation.mark %alloc_15 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 188 : i64}
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_26 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_15 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.anchor {id = 189 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 190 : i64}
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            hivm.hir.anchor {id = 191 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 192 : i64}
              hivm.hir.anchor {id = 193 : i64}
              hivm.hir.anchor {id = 194 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 195 : i64}
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop}
          hivm.hir.anchor {id = 196 : i64}
          hivm.hir.anchor {id = 197 : i64}
          hivm.hir.anchor {id = 198 : i64}
          hivm.hir.anchor {id = 199 : i64}
          hivm.hir.anchor {id = 200 : i64}
        } else {
          hivm.hir.anchor {id = 201 : i64}
        }
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
        hivm.hir.anchor {id = 220 : i64}
        hivm.hir.anchor {id = 221 : i64}
        %alloc_7 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_7 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<16>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 222 : i64}
        hivm.hir.anchor {id = 223 : i64}
        hivm.hir.anchor {id = 224 : i64}
        %alloc_8 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_8 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<17>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 225 : i64}
        hivm.hir.anchor {id = 226 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_8, %alloc_7, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_9 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 227 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        %alloc_10 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_10 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
        hivm.hir.anchor {id = 228 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_9 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_10 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 229 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
        hivm.hir.anchor {id = 230 : i64}
        hivm.hir.anchor {id = 231 : i64}
        hivm.hir.anchor {id = 232 : i64}
        %alloc_11 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_11 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<18>, hivm.tiling_dim = -1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 233 : i64}
        hivm.hir.anchor {id = 234 : i64}
        hivm.hir.anchor {id = 235 : i64}
        %alloc_12 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        annotation.mark %alloc_12 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<19>, hivm.tiling_dim = -1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 236 : i64}
        hivm.hir.anchor {id = 237 : i64}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        %alloc_13 = memref.alloc() {alignment = 64 : i64} : memref<8x2x16x16xf32, #hivm.address_space<cc>>
        hivm.hir.mmadL1 {already_set_real_mkn, fixpipe_for_result_already_inserted = true, normalized_in_L0C} ins(%alloc_12, %alloc_11, %true, %c32, %c32, %c128 : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>, memref<16x2x16x8xf32, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%alloc_13 : memref<8x2x16x16xf32, #hivm.address_space<cc>>)
        hivm.hir.anchor {id = 238 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        %alloc_14 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_14 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
        hivm.hir.anchor {id = 239 : i64}
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_13 : memref<8x2x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_14 : memref<16x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.anchor {id = 240 : i64}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 0
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
        hivm.hir.anchor {id = 257 : i64}
        hivm.hir.anchor {id = 258 : i64}
      }
      hivm.hir.set_ctrl true at ctrl[60]
      hivm.hir.anchor {id = 259 : i64}
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 1
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
    hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
    hivm.hir.anchor {id = 260 : i64}
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_1(%arg0: memref<16xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [16] : vector<64xi1>
    vector.transfer_write %cst, %arg0[%c0], %0 {in_bounds = [true]} : vector<64xf32>, memref<16xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_2(%arg0: memref<128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_3(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_4(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_5(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_7(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_9(%arg0: memref<32x16xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_10(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_11(%arg0: memref<128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_12(%arg0: memref<16xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [16] : vector<64xi1>
    vector.transfer_write %cst, %arg0[%c0], %0 {in_bounds = [true]} : vector<64xf32>, memref<16xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_13(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_15(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_16(%arg0: memref<16x128xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_17(%arg0: memref<16xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [16] : vector<64xi1>
    vector.transfer_write %cst, %arg0[%c0], %0 {in_bounds = [true]} : vector<64xf32>, memref<16xf32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_18(%arg0: memref<32x16xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_19(%arg0: memref<32x16xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_20(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_21(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_22(%arg0: memref<32xi32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0> : vector<64xindex>
    %cst_0 = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63]> : vector<64xindex>
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [32] : vector<64xi1>
    %1 = arith.addi %cst, %cst_0 : vector<64xindex>
    %2 = arith.index_cast %1 : vector<64xindex> to vector<64xi32>
    vector.transfer_write %2, %arg0[%c0], %0 {in_bounds = [true]} : vector<64xi32>, memref<32xi32, #hivm.address_space<ub>>
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_23(%arg0: i32, %arg1: memref<1x128xi32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_24(%arg0: memref<32xi32, #hivm.address_space<ub>>, %arg1: memref<32x32xi32, #hivm.address_space<ub>>, %arg2: memref<32x32xi32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_26(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_27(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
        %2 = arith.addf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_29(%arg0: memref<32x16xf32, #hivm.address_space<ub>>, %arg1: memref<16x32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_30(%arg0: memref<32x16xf32, #hivm.address_space<ub>>, %arg1: memref<16x32xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_31(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_32(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_33(%arg0: memref<16x128xf32, #hivm.address_space<ub>>, %arg1: memref<16x128xf32, #hivm.address_space<ub>>, %arg2: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_34(%arg0: memref<16x128xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
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
  func.func @chunk_kda_bwd_kernel_intra_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<20xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<MIX>, mix_mode = "mix", parallel_mode = "mix_simd_simt"} {
    %c16 = arith.constant 16 : index
    %c8 = arith.constant 8 : index
    %c128_i32 = arith.constant 128 : i32
    %c64_i32 = arith.constant 64 : i32
    %c2_i32 = arith.constant 2 : i32
    %c32_i32 = arith.constant 32 : i32
    %c32 = arith.constant 32 : index
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %c16_i32 = arith.constant 16 : i32
    %c4096_i32 = arith.constant 4096 : i32
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
    call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_34(%alloc) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
    %4 = arith.muli %arg15, %arg16 : i32
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
    scf.for %arg20 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.anchor {id = 2 : i64}
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %9 = arith.remsi %arg20, %arg17 : i32
      %10 = arith.divsi %arg20, %arg17 : i32
      %11 = arith.remsi %10, %arg18 : i32
      %12 = arith.divsi %arg20, %0 : i32
      %13 = arith.remsi %12, %arg19 : i32
      hivm.hir.anchor {id = 3 : i64}
      hivm.hir.anchor {id = 4 : i64}
      %14 = arith.divsi %13, %c32_i32 : i32
      %15 = arith.remsi %13, %c32_i32 : i32
      %16 = arith.divsi %9, %c2_i32 : i32
      %17 = arith.remsi %9, %c2_i32 : i32
      %18 = arith.muli %14, %arg16 : i32
      %19 = arith.muli %11, %c64_i32 : i32
      %20 = arith.muli %17, %c32_i32 : i32
      %21 = arith.addi %19, %20 : i32
      %22 = arith.cmpi sge, %21, %arg16 : i32
      scf.if %22 {
        hivm.hir.anchor {id = 5 : i64}
      } else {
        hivm.hir.anchor {id = 6 : i64}
        %23 = arith.muli %16, %c128_i32 : i32
        %24 = arith.muli %18, %c32_i32 : i32
        %25 = arith.addi %24, %15 : i32
        %26 = arith.muli %25, %c128_i32 : i32
        %27 = arith.index_cast %26 : i32 to index
        %28 = arith.index_cast %25 : i32 to index
        %29 = arith.muli %25, %c64_i32 : i32
        %30 = arith.index_cast %29 : i32 to index
        %31 = arith.muli %16, %4 : i32
        %32 = arith.addi %31, %18 : i32
        %33 = arith.muli %32, %c32_i32 : i32
        %34 = arith.addi %33, %15 : i32
        %35 = arith.index_cast %34 : i32 to index
        %36 = arith.maxsi %21, %c0_i32 : i32
        %37 = arith.index_cast %36 : i32 to index
        %38 = affine.apply #map4()[%35, %37]
        %39 = affine.apply #map4()[%28, %37]
        %40 = arith.maxsi %23, %c0_i32 : i32
        %41 = arith.index_cast %40 : i32 to index
        %42 = affine.apply #map2()[%41]
        %43 = affine.apply #map()[%41, %27, %37]
        %44 = arith.index_cast %arg16 : i32 to index
        %45 = affine.apply #map3()[%44, %37]
        %46 = affine.apply #map1()[%44, %41, %37]
        %reinterpret_cast = memref.reinterpret_cast %arg4 to offset: [%43], sizes: [32, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_1 = memref.alloc() : memref<32x128xf32, #hivm.address_space<ub>>
        %47 = arith.maxsi %46, %c0 : index
        %48 = arith.minsi %47, %c32 : index
        %49 = arith.maxsi %42, %c0 : index
        %50 = arith.minsi %49, %c128 : index
        %51 = arith.subi %c0_i32, %21 : i32
        %52 = arith.maxsi %51, %c0_i32 : i32
        %53 = arith.index_cast %52 : i32 to index
        %54 = arith.minsi %53, %48 : index
        %55 = affine.apply #map3()[%48, %54]
        %56 = arith.subi %c0_i32, %23 : i32
        %57 = arith.maxsi %56, %c0_i32 : i32
        %58 = arith.index_cast %57 : i32 to index
        %59 = arith.minsi %58, %50 : index
        %60 = affine.apply #map3()[%50, %59]
        %61 = arith.cmpi slt, %55, %c32 : index
        %62 = arith.cmpi slt, %60, %c128 : index
        %63 = arith.ori %61, %62 : i1
        %subview = memref.subview %reinterpret_cast[0, 0] [%55, %60] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_2 = memref.subview %alloc_1[%54, %59] [%55, %60] [1, 1] : memref<32x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %64 = arith.remui %59, %c8 : index
        hivm.hir.anchor {id = 7 : i64}
        scf.if %63 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_0(%alloc_1) {hivm.vector_function, no_inline} : (memref<32x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview : memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_2 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %64 : index
        hivm.hir.anchor {id = 8 : i64}
        %subview_3 = memref.subview %alloc_1[%7, 0] [16, 128] [1, 1] {to_be_bubbled_slice} : memref<32x128xf32, #hivm.address_space<ub>> to memref<16x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %reinterpret_cast_4 = memref.reinterpret_cast %arg5 to offset: [%39], sizes: [32], strides: [32] : memref<?xf32, #hivm.address_space<gm>> to memref<32xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
        %alloc_5 = memref.alloc() : memref<16xf32, #hivm.address_space<ub>>
        %65 = arith.maxsi %45, %c0 : index
        %66 = arith.minsi %65, %c32 : index
        %67 = arith.minsi %53, %66 : index
        %68 = affine.apply #map3()[%66, %67]
        %69 = arith.cmpi slt, %68, %c32 : index
        %70 = arith.minsi %7, %68 : index
        %71 = affine.apply #map25()[%70, %66, %67]
        %72 = arith.minsi %71, %c16 : index
        %subview_6 = memref.subview %reinterpret_cast_4[%7] [%72] [1] : memref<32xf32, strided<[32], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
        %73 = affine.apply #map26()[%6]
        %74 = arith.maxsi %67, %7 : index
        %75 = arith.minsi %66, %73 : index
        %76 = arith.maxsi %74, %75 : index
        %77 = affine.apply #map3()[%76, %74]
        %78 = affine.apply #map27()[%74, %6]
        %subview_7 = memref.subview %alloc_5[%78] [%77] [1] : memref<16xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %79 = arith.remui %67, %c8 : index
        hivm.hir.anchor {id = 9 : i64}
        scf.if %69 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_1(%alloc_5) {hivm.vector_function, no_inline} : (memref<16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_6 : memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>) outs(%subview_7 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %79 : index
        hivm.hir.anchor {id = 10 : i64}
        %80 = arith.cmpi sgt, %17, %c0_i32 : i32
        hivm.hir.anchor {id = 11 : i64}
        %81:2 = scf.if %80 -> (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) {
          hivm.hir.anchor {id = 12 : i64}
          %139 = arith.muli %21, %c4096_i32 : i32
          %140 = arith.index_cast %139 : i32 to index
          %141 = arith.index_cast %23 : i32 to index
          %142 = affine.apply #map5()[%141, %27, %140]
          %143 = affine.apply #map6()[%141]
          %reinterpret_cast_151 = memref.reinterpret_cast %arg4 to offset: [%142], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %alloc_152 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
          %144 = arith.maxsi %141, %c128 : index
          %145 = arith.minsi %143, %144 : index
          %146 = affine.apply #map3()[%145, %141]
          %147 = arith.cmpi slt, %146, %c128 : index
          %subview_153 = memref.subview %reinterpret_cast_151[0] [%146] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %subview_154 = memref.subview %alloc_152[0] [%146] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 13 : i64}
          scf.if %147 {
            func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_2(%alloc_152) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          hivm.hir.load ins(%subview_153 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_154 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32
          hivm.hir.anchor {id = 14 : i64}
          %alloca = memref.alloca() {normalize_matmul_counter = 0 : i32} : memref<i32>
          hivm.hir.anchor {id = 15 : i64}
          memref.store %c0_i32, %alloca[] : memref<i32>
          hivm.hir.anchor {id = 16 : i64}
          %alloca_155 = memref.alloca() {normalize_matmul_counter = 1 : i32} : memref<i32>
          hivm.hir.anchor {id = 17 : i64}
          memref.store %c0_i32, %alloca_155[] : memref<i32>
          hivm.hir.anchor {id = 18 : i64}
          scf.for %arg21 = %c0_i32 to %17 step %c1_i32  : i32 {
            hivm.hir.anchor {id = 19 : i64}
            %alloc_162 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_163 = memref.subview %alloc_162[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_162 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_164 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_165 = memref.subview %alloc_164[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_164 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
            hivm.hir.anchor {id = 20 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 21 : i64}
              %154 = arith.muli %arg21, %c32_i32 : i32
              %155 = arith.addi %19, %154 : i32
              %156 = arith.maxsi %155, %c0_i32 : i32
              %157 = arith.index_cast %156 : i32 to index
              %158 = affine.apply #map()[%41, %27, %157]
              %159 = affine.apply #map1()[%44, %41, %157]
              %reinterpret_cast_166 = memref.reinterpret_cast %arg3 to offset: [%158], sizes: [32, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_167 = memref.reinterpret_cast %arg4 to offset: [%158], sizes: [32, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
              %alloc_168 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
              %160 = arith.maxsi %159, %c0 : index
              %161 = arith.minsi %160, %c32 : index
              %162 = arith.subi %c0_i32, %155 : i32
              %163 = arith.maxsi %162, %c0_i32 : i32
              %164 = arith.index_cast %163 : i32 to index
              %165 = arith.minsi %164, %161 : index
              %166 = affine.apply #map3()[%161, %165]
              %167 = arith.cmpi slt, %166, %c32 : index
              %168 = arith.ori %167, %62 : i1
              %169 = arith.minsi %7, %166 : index
              %170 = affine.apply #map25()[%169, %161, %165]
              %171 = arith.minsi %170, %c16 : index
              %subview_169 = memref.subview %reinterpret_cast_166[%7, 0] [%171, %60] [1, 1] : memref<32x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
              %172 = arith.maxsi %165, %7 : index
              %173 = arith.minsi %161, %73 : index
              %174 = arith.maxsi %172, %173 : index
              %175 = affine.apply #map3()[%174, %172]
              %176 = affine.apply #map27()[%172, %6]
              %subview_170 = memref.subview %alloc_168[%176, %59] [%175, %60] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              %177 = arith.remui %59, %c16 : index
              hivm.hir.anchor {id = 22 : i64}
              scf.if %168 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_3(%alloc_168) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_169 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_170 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %177 : index
              hivm.hir.anchor {id = 23 : i64}
              %alloc_171 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
              %subview_172 = memref.subview %reinterpret_cast_167[%7, 0] [%171, %60] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_173 = memref.subview %alloc_171[%176, %59] [%175, %60] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 24 : i64}
              scf.if %168 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_4(%alloc_171) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_172 : memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_173 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %64 : index
              hivm.hir.anchor {id = 25 : i64}
              hivm.hir.anchor {id = 26 : i64}
              hivm.hir.anchor {id = 27 : i64}
              hivm.hir.anchor {id = 28 : i64}
              hivm.hir.anchor {id = 29 : i64}
              hivm.hir.anchor {id = 30 : i64}
              hivm.hir.anchor {id = 31 : i64}
              hivm.hir.anchor {id = 32 : i64}
              %alloc_174 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
              %subview_175 = memref.subview %alloc_174[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_0_outlined_vf_0(%alloc_168, %alloc_152, %alloc_171, %subview_175) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
              %expand_shape_176 = memref.expand_shape %subview_175 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
              annotation.mark %alloc_164 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 33 : i64}
              %collapse_shape_177 = memref.collapse_shape %expand_shape_176 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
              %collapse_shape_178 = memref.collapse_shape %subview_165 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_177 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_178 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              hivm.hir.anchor {id = 34 : i64}
              annotation.mark %alloc_162 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 35 : i64}
              %collapse_shape_179 = memref.collapse_shape %subview_163 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_177 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_179 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              hivm.hir.anchor {id = 36 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 37 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 38 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 39 : i64}
              hivm.hir.anchor {id = 40 : i64}
              hivm.hir.anchor {id = 41 : i64}
              hivm.hir.anchor {id = 42 : i64}
              hivm.hir.anchor {id = 43 : i64}
              hivm.hir.anchor {id = 44 : i64}
              %154 = memref.load %alloca[] : memref<i32>
              hivm.hir.anchor {id = 45 : i64}
              hivm.hir.anchor {id = 46 : i64}
              %155 = arith.addi %154, %c1_i32 : i32
              memref.store %155, %alloca[] : memref<i32>
              hivm.hir.anchor {id = 47 : i64}
              %156 = memref.load %alloca_155[] : memref<i32>
              hivm.hir.anchor {id = 48 : i64}
              hivm.hir.anchor {id = 49 : i64}
              %157 = arith.addi %156, %c1_i32 : i32
              memref.store %157, %alloca_155[] : memref<i32>
              hivm.hir.anchor {id = 50 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 2 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 51 : i64}
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop, may_not_exec, normalized_in_L0C = [0 : i32, 1 : i32]}
          hivm.hir.anchor {id = 52 : i64}
          %148 = memref.load %alloca[] : memref<i32>
          hivm.hir.anchor {id = 53 : i64}
          %149 = arith.cmpi eq, %148, %c0_i32 : i32
          %alloc_156 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_156 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 54 : i64}
          %150 = scf.if %149 -> (memref<16x128xf32, #hivm.address_space<ub>>) {
            hivm.hir.anchor {id = 55 : i64}
            %alloc_162 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
            %collapse_shape_163 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            %collapse_shape_164 = memref.collapse_shape %alloc_162 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            hivm.hir.copy ins(%collapse_shape_163 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_164 : memref<2048xf32, #hivm.address_space<ub>>)
            scf.yield %alloc_162 : memref<16x128xf32, #hivm.address_space<ub>>
          } else {
            hivm.hir.anchor {id = 56 : i64}
            hivm.hir.anchor {id = 57 : i64}
            hivm.hir.anchor {id = 58 : i64}
            scf.yield %alloc_156 : memref<16x128xf32, #hivm.address_space<ub>>
          }
          hivm.hir.anchor {id = 59 : i64}
          %151 = memref.load %alloca_155[] : memref<i32>
          hivm.hir.anchor {id = 60 : i64}
          %152 = arith.cmpi eq, %151, %c0_i32 : i32
          %alloc_157 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_157 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 61 : i64}
          %153 = scf.if %152 -> (memref<16x128xf32, #hivm.address_space<ub>>) {
            hivm.hir.anchor {id = 62 : i64}
            %alloc_162 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
            %collapse_shape_163 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            %collapse_shape_164 = memref.collapse_shape %alloc_162 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
            hivm.hir.copy ins(%collapse_shape_163 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_164 : memref<2048xf32, #hivm.address_space<ub>>)
            scf.yield %alloc_162 : memref<16x128xf32, #hivm.address_space<ub>>
          } else {
            hivm.hir.anchor {id = 63 : i64}
            hivm.hir.anchor {id = 64 : i64}
            hivm.hir.anchor {id = 65 : i64}
            scf.yield %alloc_157 : memref<16x128xf32, #hivm.address_space<ub>>
          }
          hivm.hir.anchor {id = 66 : i64}
          hivm.hir.anchor {id = 67 : i64}
          hivm.hir.anchor {id = 68 : i64}
          hivm.hir.anchor {id = 69 : i64}
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %alloc_158 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %alloc_159 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %cast_160 = memref.cast %subview_3 {fold_offset_into_ptr} : memref<16x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x128xf32, #hivm.address_space<ub>>
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_1_outlined_vf_0(%cast_160, %alloc_152, %alloc_158, %150, %alloc_159) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
          hivm.hir.anchor {id = 70 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
          %alloc_161 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_5(%153, %alloc_158, %alloc_161) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
          hivm.hir.anchor {id = 71 : i64}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
          scf.yield %alloc_159, %alloc_161 : memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>
        } else {
          hivm.hir.anchor {id = 72 : i64}
          %alloc_151 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_152 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          %collapse_shape_153 = memref.collapse_shape %alloc_151 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_152 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_153 : memref<2048xf32, #hivm.address_space<ub>>)
          %alloc_154 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_155 = memref.collapse_shape %alloc_154 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_152 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_155 : memref<2048xf32, #hivm.address_space<ub>>)
          scf.yield %alloc_151, %alloc_154 : memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>
        }
        hivm.hir.anchor {id = 73 : i64}
        %alloc_8 = memref.alloc() {alignment = 64 : i64} : memref<32xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_22(%alloc_8) {hivm.vector_function, no_inline} : (memref<32xi32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 74 : i64}
        %reinterpret_cast_9 = memref.reinterpret_cast %arg2 to offset: [%43], sizes: [32, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_10 = memref.reinterpret_cast %arg3 to offset: [%43], sizes: [32, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_11 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
        %82 = arith.minsi %7, %55 : index
        %83 = affine.apply #map25()[%82, %48, %54]
        %84 = arith.minsi %83, %c16 : index
        %subview_12 = memref.subview %reinterpret_cast_9[%7, 0] [%84, %60] [1, 1] : memref<32x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %85 = arith.maxsi %54, %7 : index
        %86 = arith.minsi %48, %73 : index
        %87 = arith.maxsi %85, %86 : index
        %88 = affine.apply #map3()[%87, %85]
        %89 = affine.apply #map27()[%85, %6]
        %subview_13 = memref.subview %alloc_11[%89, %59] [%88, %60] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %90 = arith.remui %59, %c16 : index
        hivm.hir.anchor {id = 75 : i64}
        scf.if %63 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_6(%alloc_11) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_12 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_13 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %90 : index
        hivm.hir.anchor {id = 76 : i64}
        %alloc_14 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
        %subview_15 = memref.subview %reinterpret_cast_10[%7, 0] [%84, %60] [1, 1] : memref<32x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_16 = memref.subview %alloc_14[%89, %59] [%88, %60] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 77 : i64}
        scf.if %63 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_7(%alloc_14) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_15 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_16 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %90 : index
        hivm.hir.anchor {id = 78 : i64}
        %91 = arith.subi %arg16, %21 : i32
        %92 = arith.subi %91, %c1_i32 : i32
        %93 = arith.minsi %92, %c16_i32 : i32
        %94 = arith.trunci %93 : i32 to i16
        %95 = arith.extsi %94 : i16 to i32
        hivm.hir.anchor {id = 79 : i64}
        %alloc_17 = memref.alloc() {alignment = 64 : i64} : memref<1x128xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_23(%95, %alloc_17) {hivm.vector_function, no_inline} : (i32, memref<1x128xi32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 80 : i64}
        %alloc_18 = memref.alloc() {alignment = 64 : i64} : memref<1x128xf32, #hivm.address_space<ub>>
        hivm.hir.vgather {hivm.vf_mode = #hivm.vf_mode<SIMT>} ins(%alloc_1 : memref<32x128xf32, #hivm.address_space<ub>>) indices(%alloc_17 : memref<1x128xi32, #hivm.address_space<ub>>) outs(%alloc_18 : memref<1x128xf32, #hivm.address_space<ub>>) gather_axis = 0
        hivm.hir.anchor {id = 81 : i64}
        %96 = arith.maxsi %20, %c0_i32 : i32
        %97 = arith.index_cast %96 : i32 to index
        %98 = affine.apply #map7()[%97, %30, %37]
        %99 = affine.apply #map9()[%97]
        %100 = affine.apply #map8()[%44, %97, %37]
        %reinterpret_cast_19 = memref.reinterpret_cast %arg6 to offset: [%98], sizes: [32, 32], strides: [2048, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_20 = memref.reinterpret_cast %arg7 to offset: [%98], sizes: [32, 32], strides: [2048, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_21 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        %101 = arith.maxsi %100, %c0 : index
        %102 = arith.minsi %101, %c32 : index
        %103 = arith.maxsi %99, %c0 : index
        %104 = arith.minsi %103, %c32 : index
        %105 = arith.minsi %53, %102 : index
        %106 = affine.apply #map3()[%102, %105]
        %107 = arith.subi %c0_i32, %20 : i32
        %108 = arith.maxsi %107, %c0_i32 : i32
        %109 = arith.index_cast %108 : i32 to index
        %110 = arith.minsi %109, %104 : index
        %111 = affine.apply #map3()[%104, %110]
        %112 = arith.cmpi slt, %106, %c32 : index
        %113 = arith.cmpi slt, %111, %c32 : index
        %114 = arith.ori %112, %113 : i1
        %115 = arith.minsi %7, %111 : index
        %116 = affine.apply #map25()[%115, %104, %110]
        %117 = arith.minsi %116, %c16 : index
        %subview_22 = memref.subview %reinterpret_cast_19[0, %7] [%106, %117] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
        %118 = arith.maxsi %110, %7 : index
        %119 = arith.minsi %104, %73 : index
        %120 = arith.maxsi %118, %119 : index
        %121 = affine.apply #map3()[%120, %118]
        %122 = affine.apply #map27()[%118, %6]
        %subview_23 = memref.subview %alloc_21[%105, %122] [%106, %121] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        %123 = arith.remui %110, %c8 : index
        hivm.hir.anchor {id = 82 : i64}
        scf.if %114 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_8(%alloc_21) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_22 : memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_23 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %123 : index
        hivm.hir.anchor {id = 83 : i64}
        %alloc_24 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        %subview_25 = memref.subview %reinterpret_cast_20[0, %7] [%106, %117] [1, 1] : memref<32x32xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_26 = memref.subview %alloc_24[%105, %122] [%106, %121] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 84 : i64}
        scf.if %114 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_9(%alloc_24) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_25 : memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_26 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %123 : index
        hivm.hir.anchor {id = 85 : i64}
        %expand_shape = memref.expand_shape %alloc_8 [[0, 1]] output_shape [1, 32] : memref<32xi32, #hivm.address_space<ub>> into memref<1x32xi32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 86 : i64}
        hivm.hir.anchor {id = 87 : i64}
        %alloc_27 = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32, #hivm.address_space<ub>>
        %alloc_28 = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_24(%alloc_8, %alloc_27, %alloc_28) {hivm.vector_function, no_inline} : (memref<32xi32, #hivm.address_space<ub>>, memref<32x32xi32, #hivm.address_space<ub>>, memref<32x32xi32, #hivm.address_space<ub>>) -> ()
        %subview_29 = memref.subview %alloc_27[%7, 0] [16, 32] [1, 1] {to_be_bubbled_slice} : memref<32x32xi32, #hivm.address_space<ub>> to memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_30 = memref.subview %alloc_28[%7, 0] [16, 32] [1, 1] {to_be_bubbled_slice} : memref<32x32xi32, #hivm.address_space<ub>> to memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 88 : i64}
        hivm.hir.anchor {id = 89 : i64}
        hivm.hir.anchor {id = 90 : i64}
        %alloc_31 = memref.alloc() : memref<1x256x1xi1, #hivm.address_space<ub>>
        %subview_32 = memref.subview %alloc_31[0, 0, 0] [1, 16, 1] [1, 1, 1] : memref<1x256x1xi1, #hivm.address_space<ub>> to memref<1x16xi1, strided<[256, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_7_outlined_vf_0(%7, %expand_shape, %21, %arg16, %subview_32) {hivm.vector_function, no_inline} : (index, memref<1x32xi32, #hivm.address_space<ub>>, i32, i32, memref<1x16xi1, strided<[256, 1]>, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 91 : i64}
        %collapse_shape = memref.collapse_shape %subview_32 [[0, 1]] : memref<1x16xi1, strided<[256, 1]>, #hivm.address_space<ub>> into memref<16xi1, strided<[1]>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 92 : i64}
        hivm.hir.anchor {id = 93 : i64}
        hivm.hir.anchor {id = 94 : i64}
        hivm.hir.anchor {id = 95 : i64}
        hivm.hir.anchor {id = 96 : i64}
        hivm.hir.anchor {id = 97 : i64}
        hivm.hir.anchor {id = 98 : i64}
        %124 = arith.index_cast %21 : i32 to index
        %125 = affine.apply #map16()[%124]
        %126 = arith.maxsi %124, %44 : index
        %127 = arith.minsi %125, %126 : index
        %128 = affine.apply #map3()[%127, %124]
        %129 = arith.minsi %7, %128 : index
        %130 = affine.apply #map25()[%129, %127, %124]
        %131 = arith.minsi %130, %c16 : index
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
        %alloc_33 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_34 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_35 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_6_outlined_vf_0(%7, %alloc_1, %alloc_18, %alloc_14, %alloc_33, %alloc_34, %alloc_35) {hivm.vector_function, no_inline} : (index, memref<32x128xf32, #hivm.address_space<ub>>, memref<1x128xf32, #hivm.address_space<ub>>, memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        %subview_36 = memref.subview %alloc_33[0, 0] [%131, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
        %alloc_37 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %collapse_shape_38 = memref.collapse_shape %alloc [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
        %collapse_shape_39 = memref.collapse_shape %alloc_37 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%collapse_shape_38 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_39 : memref<2048xf32, #hivm.address_space<ub>>)
        %subview_40 = memref.subview %alloc_37[0, 0] [%131, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
        %collapse_shape_41 = memref.collapse_shape %subview_36 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        %collapse_shape_42 = memref.collapse_shape %subview_40 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        hivm.hir.copy ins(%collapse_shape_41 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_42 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
        %alloc_43 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_44 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_45 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
        %subview_46 = memref.subview %alloc_45[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_6_outlined_vf_1(%alloc_37, %alloc_43, %alloc_35, %alloc_44, %subview_46) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_47 = memref.expand_shape %subview_46 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_48 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_49 = memref.subview %alloc_48[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_48 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
        hivm.hir.anchor {id = 109 : i64}
        %collapse_shape_50 = memref.collapse_shape %expand_shape_47 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_51 = memref.collapse_shape %subview_49 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_50 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_51 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 110 : i64}
        hivm.hir.anchor {id = 111 : i64}
        %alloc_52 = memref.alloc() {alignment = 64 : i64} : memref<32x16xf32, #hivm.address_space<ub>>
        %alloc_53 = memref.alloc() : memref<2x33x8x1xf32, #hivm.address_space<ub>>
        %subview_54 = memref.subview %alloc_53[0, 0, 0, 0] [2, 32, 8, 1] [1, 1, 1, 1] : memref<2x33x8x1xf32, #hivm.address_space<ub>> to memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_8_outlined_vf_0(%alloc_27, %7, %alloc_28, %collapse_shape, %alloc_24, %alloc_21, %alloc_52, %subview_54) {hivm.vector_function, no_inline} : (memref<32x32xi32, #hivm.address_space<ub>>, index, memref<32x32xi32, #hivm.address_space<ub>>, memref<16xi1, strided<[1]>, #hivm.address_space<ub>>, memref<32x16xf32, #hivm.address_space<ub>>, memref<32x16xf32, #hivm.address_space<ub>>, memref<32x16xf32, #hivm.address_space<ub>>, memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_55 = memref.expand_shape %subview_54 [[0], [1, 2], [3]] output_shape [2, 2, 16, 8] : memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>> into memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_56 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_57 = memref.subview %alloc_56[%8, 0, 0, 0] [2, 2, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_56 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = 0 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 112 : i64}
        %collapse_shape_58 = memref.collapse_shape %expand_shape_55 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>> into memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>
        %collapse_shape_59 = memref.collapse_shape %subview_57 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_58 : memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_59 : memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 113 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 114 : i64}
        %alloc_60 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_60 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 115 : i64}
        hivm.hir.anchor {id = 116 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_61 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_25(%alloc_60, %alloc_44, %alloc_61) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 117 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        %alloc_62 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_26(%81#0, %alloc_61, %alloc_62) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 118 : i64}
        %alloc_63 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_64 = memref.subview %alloc_63[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_63 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<12>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
        hivm.hir.anchor {id = 119 : i64}
        %collapse_shape_65 = memref.collapse_shape %subview_64 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_50 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_65 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 120 : i64}
        hivm.hir.anchor {id = 121 : i64}
        %alloc_66 = memref.alloc() : memref<2x33x8x1xf32, #hivm.address_space<ub>>
        %subview_67 = memref.subview %alloc_66[0, 0, 0, 0] [2, 32, 8, 1] [1, 1, 1, 1] : memref<2x33x8x1xf32, #hivm.address_space<ub>> to memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_9_outlined_vf_0(%alloc_52, %subview_67) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>, memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_68 = memref.expand_shape %subview_67 [[0], [1, 2], [3]] output_shape [2, 2, 16, 8] : memref<2x32x8xf32, strided<[264, 8, 1]>, #hivm.address_space<ub>> into memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_69 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_70 = memref.subview %alloc_69[%8, 0, 0, 0] [2, 2, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_69 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<13>, hivm.tiling_dim = 0 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 122 : i64}
        %collapse_shape_71 = memref.collapse_shape %expand_shape_68 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[264, 128, 8, 1]>, #hivm.address_space<ub>> into memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>
        %collapse_shape_72 = memref.collapse_shape %subview_70 [[0], [1, 2, 3]] : memref<2x2x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_71 : memref<2x256xf32, strided<[264, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_72 : memref<2x256xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 123 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 124 : i64}
        %alloc_73 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_73 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 125 : i64}
        hivm.hir.anchor {id = 126 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_74 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_27(%alloc_73, %alloc_44, %alloc_74) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 127 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.anchor {id = 128 : i64}
        hivm.hir.anchor {id = 129 : i64}
        hivm.hir.anchor {id = 130 : i64}
        hivm.hir.anchor {id = 131 : i64}
        %alloc_75 = memref.alloc() {alignment = 64 : i64} : memref<16xf32, #hivm.address_space<ub>>
        %alloc_76 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_10_outlined_vf_0(%alloc_5, %81#1, %alloc_74, %alloc_35, %alloc_75, %alloc_76) {hivm.vector_function, no_inline} : (memref<16xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 132 : i64}
        %reinterpret_cast_77 = memref.reinterpret_cast %arg8 to offset: [%43], sizes: [32, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_78 = memref.reinterpret_cast %arg9 to offset: [%43], sizes: [32, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_79 = memref.reinterpret_cast %arg14 to offset: [%38], sizes: [32], strides: [32] : memref<?xf32, #hivm.address_space<gm>> to memref<32xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.anchor {id = 133 : i64}
        %alloc_80 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_11_outlined_vf_0(%alloc_11, %alloc_62, %alloc_80) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 134 : i64}
        %alloc_81 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        %subview_82 = memref.subview %reinterpret_cast_77[%7, 0] [%84, %60] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_83 = memref.subview %alloc_81[%89, %59] [%88, %60] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 135 : i64}
        scf.if %63 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_10(%alloc_81) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_82 : memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_83 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %64 : index
        hivm.hir.anchor {id = 136 : i64}
        hivm.hir.anchor {id = 137 : i64}
        %alloc_84 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_28(%alloc_62, %alloc_81, %alloc_84) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 138 : i64}
        %subview_85 = memref.subview %alloc_84[%89, %59] [%88, %60] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 139 : i64}
        %subview_86 = memref.subview %reinterpret_cast_78[%7, 0] [%84, %60] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_85 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_86 : memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        hivm.hir.anchor {id = 140 : i64}
        %subview_87 = memref.subview %alloc_75[%78] [%77] [1] : memref<16xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 141 : i64}
        %subview_88 = memref.subview %reinterpret_cast_79[%7] [%72] [1] : memref<32xf32, strided<[32], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_87 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_88 : memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        hivm.hir.anchor {id = 142 : i64}
        %132 = arith.subi %arg16, %19 : i32
        %133 = arith.addi %132, %c31_i32 : i32
        %134 = arith.divsi %133, %c32_i32 : i32
        %135 = arith.minsi %134, %c2_i32 : i32
        %136 = arith.subi %135, %c1_i32 : i32
        %137 = arith.cmpi slt, %17, %136 : i32
        %138 = scf.if %137 -> (memref<16x128xf32, #hivm.address_space<ub>>) {
          hivm.hir.anchor {id = 143 : i64}
          %139 = arith.addi %21, %c32_i32 : i32
          %140 = arith.minsi %139, %arg16 : i32
          %141 = arith.subi %140, %c1_i32 : i32
          %142 = arith.muli %141, %c4096_i32 : i32
          %143 = arith.index_cast %142 : i32 to index
          %144 = arith.index_cast %23 : i32 to index
          %145 = affine.apply #map5()[%144, %27, %143]
          %146 = affine.apply #map6()[%144]
          %reinterpret_cast_151 = memref.reinterpret_cast %arg4 to offset: [%145], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %alloc_152 = memref.alloc() : memref<128xf32, #hivm.address_space<ub>>
          %147 = arith.maxsi %144, %c128 : index
          %148 = arith.minsi %146, %147 : index
          %149 = affine.apply #map3()[%148, %144]
          %150 = arith.cmpi slt, %149, %c128 : index
          %subview_153 = memref.subview %reinterpret_cast_151[0] [%149] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
          %subview_154 = memref.subview %alloc_152[0] [%149] [1] : memref<128xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
          hivm.hir.anchor {id = 144 : i64}
          scf.if %150 {
            func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_11(%alloc_152) {hivm.vector_function, no_inline} : (memref<128xf32, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          hivm.hir.load ins(%subview_153 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_154 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32
          hivm.hir.anchor {id = 145 : i64}
          %151 = arith.addi %17, %c1_i32 : i32
          hivm.hir.anchor {id = 146 : i64}
          %alloc_155 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_156 = memref.collapse_shape %alloc_155 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_38 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_156 : memref<2048xf32, #hivm.address_space<ub>>)
          %152 = scf.for %arg21 = %151 to %135 step %c1_i32 iter_args(%arg22 = %alloc_155) -> (memref<16x128xf32, #hivm.address_space<ub>>)  : i32 {
            hivm.hir.anchor {id = 147 : i64}
            %alloc_159 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_159 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_159 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_160 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_160 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_160 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x128xf32, #hivm.address_space<ub>>
            %alloc_161 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_162 = memref.subview %alloc_161[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_161 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %alloc_163 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            %subview_164 = memref.subview %alloc_163[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
            annotation.mark %alloc_163 {hivm.multi_buffer = 2 : i32, hivm.preload_local_buffer = 1 : i32} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
            hivm.hir.anchor {id = 148 : i64}
            scope.scope : () -> () {
              hivm.hir.anchor {id = 149 : i64}
              %154 = arith.muli %arg21, %c32_i32 : i32
              %155 = arith.addi %19, %154 : i32
              %156 = arith.maxsi %155, %c0_i32 : i32
              %157 = arith.index_cast %156 : i32 to index
              %158 = affine.apply #map()[%41, %27, %157]
              %159 = affine.apply #map1()[%44, %41, %157]
              %160 = affine.apply #map3()[%44, %157]
              %161 = affine.apply #map4()[%28, %157]
              %reinterpret_cast_165 = memref.reinterpret_cast %arg2 to offset: [%158], sizes: [32, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_166 = memref.reinterpret_cast %arg3 to offset: [%158], sizes: [32, 128], strides: [4096, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<32x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_167 = memref.reinterpret_cast %arg4 to offset: [%158], sizes: [32, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
              %reinterpret_cast_168 = memref.reinterpret_cast %arg5 to offset: [%161], sizes: [32], strides: [32] : memref<?xf32, #hivm.address_space<gm>> to memref<32xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
              %alloc_169 = memref.alloc() : memref<16xf32, #hivm.address_space<ub>>
              %162 = arith.maxsi %160, %c0 : index
              %163 = arith.minsi %162, %c32 : index
              %164 = arith.subi %c0_i32, %155 : i32
              %165 = arith.maxsi %164, %c0_i32 : i32
              %166 = arith.index_cast %165 : i32 to index
              %167 = arith.minsi %166, %163 : index
              %168 = affine.apply #map3()[%163, %167]
              %169 = arith.cmpi slt, %168, %c32 : index
              %170 = arith.minsi %7, %168 : index
              %171 = affine.apply #map25()[%170, %163, %167]
              %172 = arith.minsi %171, %c16 : index
              %subview_170 = memref.subview %reinterpret_cast_168[%7] [%172] [1] : memref<32xf32, strided<[32], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>
              %173 = arith.maxsi %167, %7 : index
              %174 = arith.minsi %163, %73 : index
              %175 = arith.maxsi %173, %174 : index
              %176 = affine.apply #map3()[%175, %173]
              %177 = affine.apply #map27()[%173, %6]
              %subview_171 = memref.subview %alloc_169[%177] [%176] [1] : memref<16xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
              %178 = arith.remui %167, %c8 : index
              hivm.hir.anchor {id = 150 : i64}
              scf.if %169 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_12(%alloc_169) {hivm.vector_function, no_inline} : (memref<16xf32, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_170 : memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>) outs(%subview_171 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %178 : index
              hivm.hir.anchor {id = 151 : i64}
              %alloc_172 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
              %179 = arith.maxsi %159, %c0 : index
              %180 = arith.minsi %179, %c32 : index
              %181 = arith.minsi %166, %180 : index
              %182 = affine.apply #map3()[%180, %181]
              %183 = arith.cmpi slt, %182, %c32 : index
              %184 = arith.ori %183, %62 : i1
              %185 = arith.minsi %7, %182 : index
              %186 = affine.apply #map25()[%185, %180, %181]
              %187 = arith.minsi %186, %c16 : index
              %subview_173 = memref.subview %reinterpret_cast_165[%7, 0] [%187, %60] [1, 1] : memref<32x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
              %188 = arith.maxsi %181, %7 : index
              %189 = arith.minsi %180, %73 : index
              %190 = arith.maxsi %188, %189 : index
              %191 = affine.apply #map3()[%190, %188]
              %192 = affine.apply #map27()[%188, %6]
              %subview_174 = memref.subview %alloc_172[%192, %59] [%191, %60] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 152 : i64}
              scf.if %184 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_13(%alloc_172) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_173 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_174 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %90 : index
              hivm.hir.anchor {id = 153 : i64}
              %alloc_175 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
              %subview_176 = memref.subview %reinterpret_cast_166[%7, 0] [%187, %60] [1, 1] : memref<32x128xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_177 = memref.subview %alloc_175[%192, %59] [%191, %60] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 154 : i64}
              scf.if %184 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_14(%alloc_175) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_176 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_177 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %90 : index
              hivm.hir.anchor {id = 155 : i64}
              hivm.hir.anchor {id = 156 : i64}
              hivm.hir.anchor {id = 157 : i64}
              hivm.hir.anchor {id = 158 : i64}
              %alloc_178 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
              %subview_179 = memref.subview %reinterpret_cast_167[%7, 0] [%187, %60] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
              %subview_180 = memref.subview %alloc_178[%192, %59] [%191, %60] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
              hivm.hir.anchor {id = 159 : i64}
              scf.if %184 {
                func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_15(%alloc_178) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              } {hivm.unlikely_condition}
              hivm.hir.load ins(%subview_179 : memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_180 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %64 : index
              hivm.hir.anchor {id = 160 : i64}
              hivm.hir.anchor {id = 161 : i64}
              hivm.hir.anchor {id = 162 : i64}
              hivm.hir.anchor {id = 163 : i64}
              hivm.hir.anchor {id = 164 : i64}
              %193 = arith.index_cast %155 : i32 to index
              %194 = affine.apply #map16()[%193]
              %195 = arith.maxsi %193, %44 : index
              %196 = arith.minsi %194, %195 : index
              %197 = affine.apply #map3()[%196, %193]
              %198 = arith.minsi %7, %197 : index
              %199 = affine.apply #map25()[%198, %196, %193]
              %200 = arith.minsi %199, %c16 : index
              hivm.hir.anchor {id = 165 : i64}
              hivm.hir.anchor {id = 166 : i64}
              hivm.hir.anchor {id = 167 : i64}
              hivm.hir.anchor {id = 168 : i64}
              hivm.hir.anchor {id = 169 : i64}
              hivm.hir.anchor {id = 170 : i64}
              %alloc_181 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_3_outlined_vf_0(%alloc_178, %alloc_152, %alloc_181) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              %subview_182 = memref.subview %alloc_181[0, 0] [%200, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
              %alloc_183 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
              %collapse_shape_184 = memref.collapse_shape %alloc_183 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
              hivm.hir.copy ins(%collapse_shape_38 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_184 : memref<2048xf32, #hivm.address_space<ub>>)
              %subview_185 = memref.subview %alloc_183[0, 0] [%200, 128] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>>
              %collapse_shape_186 = memref.collapse_shape %subview_182 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
              %collapse_shape_187 = memref.collapse_shape %subview_185 [[0, 1]] : memref<?x128xf32, strided<[128, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
              hivm.hir.copy ins(%collapse_shape_186 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_187 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
              %alloc_188 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
              %subview_189 = memref.subview %alloc_188[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
              annotation.mark %alloc_163 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<14>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              %alloc_190 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
              %subview_191 = memref.subview %alloc_190[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_3_outlined_merged_vf_0(%alloc_172, %alloc_183, %subview_189, %alloc_169, %alloc_175, %alloc_183, %subview_191) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>, memref<16xf32, #hivm.address_space<ub>>, memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
              hivm.hir.anchor {id = 171 : i64}
              hivm.hir.anchor {id = 172 : i64}
              hivm.hir.anchor {id = 173 : i64}
              %expand_shape_192 = memref.expand_shape %subview_189 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
              %collapse_shape_193 = memref.collapse_shape %expand_shape_192 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
              %collapse_shape_194 = memref.collapse_shape %subview_164 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_193 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_194 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              %expand_shape_195 = memref.expand_shape %subview_191 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
              annotation.mark %alloc_161 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<15>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
              hivm.hir.anchor {id = 174 : i64}
              %collapse_shape_196 = memref.collapse_shape %expand_shape_195 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
              %collapse_shape_197 = memref.collapse_shape %subview_162 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_196 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_197 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
              hivm.hir.anchor {id = 175 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 2 : i32, no_inline}
            hivm.hir.anchor {id = 176 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            hivm.hir.anchor {id = 177 : i64}
            scope.scope : () -> () {
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
              hivm.hir.anchor {id = 188 : i64}
              hivm.hir.anchor {id = 189 : i64}
              scope.return
            } {hivm.loop_core_type = #hivm.tcore_type<CUBE>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 1 : i32, no_inline}
            hivm.hir.anchor {id = 190 : i64}
            hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
            hivm.hir.anchor {id = 191 : i64}
            %153 = scope.scope : () -> memref<16x128xf32, #hivm.address_space<ub>> {
              hivm.hir.anchor {id = 192 : i64}
              hivm.hir.anchor {id = 193 : i64}
              %alloc_165 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
              func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_4_outlined_vf_0(%alloc_159, %alloc_160, %arg22, %alloc_165) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
              hivm.hir.anchor {id = 194 : i64}
              scope.return %alloc_165 : memref<16x128xf32, #hivm.address_space<ub>>
            } {hivm.loop_core_type = #hivm.tcore_type<VECTOR>, hivm.max_preload_num = 3 : i32, hivm.preload_num = 0 : i32, no_inline}
            hivm.hir.anchor {id = 195 : i64}
            hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 1
            scf.yield %153 : memref<16x128xf32, #hivm.address_space<ub>>
          } {fixpipe_for_mmad_result_already_inserted = true, hivm.cv_pipelined_loop}
          hivm.hir.anchor {id = 196 : i64}
          hivm.hir.anchor {id = 197 : i64}
          hivm.hir.anchor {id = 198 : i64}
          hivm.hir.anchor {id = 199 : i64}
          %alloc_157 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %cast_158 = memref.cast %subview_3 {fold_offset_into_ptr} : memref<16x128xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x128xf32, #hivm.address_space<ub>>
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_5_outlined_vf_0(%152, %alloc_152, %cast_158, %alloc_157) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
          hivm.hir.anchor {id = 200 : i64}
          scf.yield %alloc_157 : memref<16x128xf32, #hivm.address_space<ub>>
        } else {
          hivm.hir.anchor {id = 201 : i64}
          %alloc_151 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
          %collapse_shape_152 = memref.collapse_shape %alloc_151 [[0, 1]] : memref<16x128xf32, #hivm.address_space<ub>> into memref<2048xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%collapse_shape_38 : memref<2048xf32, #hivm.address_space<ub>>) outs(%collapse_shape_152 : memref<2048xf32, #hivm.address_space<ub>>)
          scf.yield %alloc_151 : memref<16x128xf32, #hivm.address_space<ub>>
        }
        %alloc_89 = memref.alloc() : memref<16x128xbf16, #hivm.address_space<ub>>
        %subview_90 = memref.subview %alloc_89[%89, %59] [%88, %60] [1, 1] : memref<16x128xbf16, #hivm.address_space<ub>> to memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 202 : i64}
        scf.if %63 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_16(%alloc_89) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_12 : memref<?x?xbf16, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_90 : memref<?x?xbf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst_0 : bf16 left_padding_num = %90 : index
        hivm.hir.anchor {id = 203 : i64}
        %alloc_91 = memref.alloc() : memref<16xf32, #hivm.address_space<ub>>
        %subview_92 = memref.subview %alloc_91[%78] [%77] [1] : memref<16xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 204 : i64}
        scf.if %69 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_17(%alloc_91) {hivm.vector_function, no_inline} : (memref<16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_6 : memref<?xf32, strided<[32], offset: ?>, #hivm.address_space<gm>>) outs(%subview_92 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %79 : index
        hivm.hir.anchor {id = 205 : i64}
        %alloc_93 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        %subview_94 = memref.subview %alloc_93[%105, %122] [%106, %121] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 206 : i64}
        scf.if %114 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_18(%alloc_93) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_22 : memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_94 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %123 : index
        hivm.hir.anchor {id = 207 : i64}
        hivm.hir.anchor {id = 208 : i64}
        %alloc_95 = memref.alloc() {alignment = 64 : i64} : memref<16x32xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_29(%alloc_93, %alloc_95) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 209 : i64}
        %alloc_96 = memref.alloc() : memref<32x16xf32, #hivm.address_space<ub>>
        %subview_97 = memref.subview %alloc_96[%105, %122] [%106, %121] [1, 1] : memref<32x16xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 210 : i64}
        scf.if %114 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_19(%alloc_96) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_25 : memref<?x?xf32, strided<[2048, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_97 : memref<?x?xf32, strided<[16, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %123 : index
        hivm.hir.anchor {id = 211 : i64}
        hivm.hir.anchor {id = 212 : i64}
        %alloc_98 = memref.alloc() {alignment = 64 : i64} : memref<16x32xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_30(%alloc_96, %alloc_98) {hivm.vector_function, no_inline} : (memref<32x16xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 213 : i64}
        hivm.hir.anchor {id = 214 : i64}
        hivm.hir.anchor {id = 215 : i64}
        hivm.hir.anchor {id = 216 : i64}
        hivm.hir.anchor {id = 217 : i64}
        hivm.hir.anchor {id = 218 : i64}
        hivm.hir.anchor {id = 219 : i64}
        %alloc_99 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_13_outlined_vf_0(%alloc_91, %alloc_35, %alloc_44, %alloc_99) {hivm.vector_function, no_inline} : (memref<16xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 220 : i64}
        hivm.hir.anchor {id = 221 : i64}
        %alloc_100 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
        %subview_101 = memref.subview %alloc_100[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_12_outlined_vf_0(%alloc_89, %alloc_44, %subview_101) {hivm.vector_function, no_inline} : (memref<16x128xbf16, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_102 = memref.expand_shape %subview_101 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_103 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_104 = memref.subview %alloc_103[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_103 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<16>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
        hivm.hir.anchor {id = 222 : i64}
        %collapse_shape_105 = memref.collapse_shape %expand_shape_102 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_106 = memref.collapse_shape %subview_104 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_105 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_106 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 223 : i64}
        hivm.hir.anchor {id = 224 : i64}
        %alloc_107 = memref.alloc() {alignment = 64 : i64} : memref<16x32xf32, #hivm.address_space<ub>>
        %alloc_108 = memref.alloc() : memref<4x17x8x1xf32, #hivm.address_space<ub>>
        %subview_109 = memref.subview %alloc_108[0, 0, 0, 0] [4, 16, 8, 1] [1, 1, 1, 1] : memref<4x17x8x1xf32, #hivm.address_space<ub>> to memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        %cast = memref.cast %subview_29 {fold_offset_into_ptr} : memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x32xi32, #hivm.address_space<ub>>
        %cast_110 = memref.cast %subview_30 {fold_offset_into_ptr} : memref<16x32xi32, strided<[32, 1], offset: ?>, #hivm.address_space<ub>> to memref<16x32xi32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_14_outlined_vf_0(%cast, %cast_110, %alloc_98, %alloc_95, %alloc_107, %subview_109) {hivm.vector_function, no_inline} : (memref<16x32xi32, #hivm.address_space<ub>>, memref<16x32xi32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>, memref<16x32xf32, #hivm.address_space<ub>>, memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_111 = memref.expand_shape %subview_109 [[0], [1, 2], [3]] output_shape [4, 1, 16, 8] : memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_112 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_113 = memref.subview %alloc_112[0, %6, 0, 0] [4, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_112 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<17>, hivm.tiling_dim = 1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 225 : i64}
        %collapse_shape_114 = memref.collapse_shape %expand_shape_111 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_115 = memref.collapse_shape %subview_113 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_114 : memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_115 : memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 226 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 227 : i64}
        %alloc_116 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_116 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 228 : i64}
        hivm.hir.anchor {id = 229 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_117 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_31(%alloc_116, %alloc_43, %alloc_117) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 230 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
        %alloc_118 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_32(%138, %alloc_117, %alloc_118) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 231 : i64}
        hivm.hir.anchor {id = 232 : i64}
        %alloc_119 = memref.alloc() : memref<16x17x8x1xf32, #hivm.address_space<ub>>
        %subview_120 = memref.subview %alloc_119[0, 0, 0, 0] [16, 16, 8, 1] [1, 1, 1, 1] : memref<16x17x8x1xf32, #hivm.address_space<ub>> to memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_15_outlined_vf_0(%alloc_99, %subview_120) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_121 = memref.expand_shape %subview_120 [[0], [1, 2], [3]] output_shape [16, 1, 16, 8] : memref<16x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_122 = memref.alloc() : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_123 = memref.subview %alloc_122[0, %6, 0, 0] [16, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>> to memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_122 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<18>, hivm.tiling_dim = 1 : index} : memref<16x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
        hivm.hir.anchor {id = 233 : i64}
        %collapse_shape_124 = memref.collapse_shape %expand_shape_121 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_125 = memref.collapse_shape %subview_123 [[0, 1], [2, 3]] : memref<16x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_124 : memref<16x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_125 : memref<16x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 234 : i64}
        hivm.hir.anchor {id = 235 : i64}
        %alloc_126 = memref.alloc() : memref<4x17x8x1xf32, #hivm.address_space<ub>>
        %subview_127 = memref.subview %alloc_126[0, 0, 0, 0] [4, 16, 8, 1] [1, 1, 1, 1] : memref<4x17x8x1xf32, #hivm.address_space<ub>> to memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_16_outlined_vf_0(%alloc_107, %subview_127) {hivm.vector_function, no_inline} : (memref<16x32xf32, #hivm.address_space<ub>>, memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>>) -> ()
        %expand_shape_128 = memref.expand_shape %subview_127 [[0], [1, 2], [3]] output_shape [4, 1, 16, 8] : memref<4x16x8xf32, strided<[136, 8, 1]>, #hivm.address_space<ub>> into memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>>
        %alloc_129 = memref.alloc() : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        %subview_130 = memref.subview %alloc_129[0, %6, 0, 0] [4, 1, 16, 8] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>> to memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_129 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<19>, hivm.tiling_dim = 1 : index} : memref<4x2x16x8xf32, #hivm.address_space<cbuf>>
        hivm.hir.anchor {id = 236 : i64}
        %collapse_shape_131 = memref.collapse_shape %expand_shape_128 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[136, 128, 8, 1]>, #hivm.address_space<ub>> into memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>
        %collapse_shape_132 = memref.collapse_shape %subview_130 [[0, 1], [2, 3]] : memref<4x1x16x8xf32, strided<[256, 128, 8, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>
        hivm.hir.copy ins(%collapse_shape_131 : memref<4x128xf32, strided<[136, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_132 : memref<4x128xf32, strided<[256, 1], offset: ?>, #hivm.address_space<cbuf>>) {"hivm.inserted-copy", tiled_op}
        hivm.hir.anchor {id = 237 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
        hivm.hir.anchor {id = 238 : i64}
        %alloc_133 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_133 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<16x128xf32, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 239 : i64}
        hivm.hir.anchor {id = 240 : i64}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 0
        %alloc_134 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_33(%alloc_133, %alloc_43, %alloc_134) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 241 : i64}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 8
        hivm.hir.anchor {id = 242 : i64}
        %reinterpret_cast_135 = memref.reinterpret_cast %arg10 to offset: [%43], sizes: [32, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_136 = memref.reinterpret_cast %arg11 to offset: [%43], sizes: [32, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_137 = memref.reinterpret_cast %arg12 to offset: [%43], sizes: [32, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_138 = memref.reinterpret_cast %arg13 to offset: [%43], sizes: [32, 128], strides: [4096, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.anchor {id = 243 : i64}
        hivm.hir.anchor {id = 244 : i64}
        %alloc_139 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        %subview_140 = memref.subview %reinterpret_cast_137[%7, 0] [%84, %60] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_141 = memref.subview %alloc_139[%89, %59] [%88, %60] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 245 : i64}
        scf.if %63 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_20(%alloc_139) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_140 : memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_141 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %64 : index
        hivm.hir.anchor {id = 246 : i64}
        hivm.hir.anchor {id = 247 : i64}
        hivm.hir.anchor {id = 248 : i64}
        hivm.hir.anchor {id = 249 : i64}
        %alloc_142 = memref.alloc() : memref<16x128xf32, #hivm.address_space<ub>>
        %subview_143 = memref.subview %reinterpret_cast_135[%7, 0] [%84, %60] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_144 = memref.subview %alloc_142[%89, %59] [%88, %60] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 250 : i64}
        scf.if %63 {
          func.call @chunk_kda_bwd_kernel_intra_mix_aiv_outlined_vf_21(%alloc_142) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        hivm.hir.load ins(%subview_143 : memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_144 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %64 : index
        hivm.hir.anchor {id = 251 : i64}
        hivm.hir.anchor {id = 252 : i64}
        hivm.hir.anchor {id = 253 : i64}
        %alloc_145 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        %alloc_146 = memref.alloc() {alignment = 64 : i64} : memref<16x128xf32, #hivm.address_space<ub>>
        func.call @chunk_kda_bwd_kernel_intra_mix_aiv_fused_17_outlined_vf_0(%alloc_80, %alloc_76, %alloc_118, %alloc_134, %alloc_35, %alloc_139, %alloc_142, %alloc_145, %alloc_146) {hivm.vector_function, no_inline} : (memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>, memref<16x128xf32, #hivm.address_space<ub>>) -> ()
        hivm.hir.anchor {id = 254 : i64}
        %subview_147 = memref.subview %alloc_146[%89, %59] [%88, %60] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 255 : i64}
        %subview_148 = memref.subview %reinterpret_cast_136[%7, 0] [%84, %60] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_147 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_148 : memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        hivm.hir.anchor {id = 256 : i64}
        %subview_149 = memref.subview %alloc_145[%89, %59] [%88, %60] [1, 1] : memref<16x128xf32, #hivm.address_space<ub>> to memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.anchor {id = 257 : i64}
        %subview_150 = memref.subview %reinterpret_cast_138[%7, 0] [%84, %60] [1, 1] : memref<32x128xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_149 : memref<?x?xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_150 : memref<?x?xf32, strided<[4096, 1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        hivm.hir.anchor {id = 258 : i64}
      }
      hivm.hir.set_ctrl true at ctrl[60]
      hivm.hir.anchor {id = 259 : i64}
    } {autoblockify.subloop}
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 2
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 5
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 6
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 7
    hivm.hir.sync_block_wait[<VECTOR>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 8
    hivm.hir.anchor {id = 260 : i64}
    return
  }
}
