// -----// IR Dump Before PlanMemoryRegBase (hivm-plan-memory-regbase) //----- //
#map = affine_map<()[s0, s1] -> (s0 + s1 * 64)>
#map1 = affine_map<(d0) -> (d0, 0)>
#map2 = affine_map<(d0) -> (d0 * 16)>
#map3 = affine_map<()[s0] -> (s0 * 64)>
#map4 = affine_map<()[s0] -> (s0 * 4)>
#map5 = affine_map<()[s0, s1] -> (s0 + s1)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  func.func @_attn_bwd_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 2 : i32}, %arg7: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg8: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, false, false, false, false]> : vector<15xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c0_i64 = arith.constant 0 : i64
    %c64 = arith.constant 64 : index
    %c0_i32 = arith.constant {Undefined} 0 : i32
    %c8192_i32 = arith.constant {Undefined} 8192 : i32
    %c8_i32 = arith.constant {MixUse} 8 : i32
    %c65536_i32 = arith.constant {MixUse} 65536 : i32
    %c524288_i32 = arith.constant {MixUse} 524288 : i32
    %c128_i32 = arith.constant {MixUse} 128 : i32
    %c1024_i64 = arith.constant 1024 : i64
    %c4_i64 = arith.constant 4 : i64
    %c1028_i64 = arith.constant 1028 : i64
    %c8_i64 = arith.constant 8 : i64
    %c1032_i64 = arith.constant 1032 : i64
    %c12_i64 = arith.constant 12 : i64
    %c1036_i64 = arith.constant 1036 : i64
    %c16_i64 = arith.constant 16 : i64
    %c1040_i64 = arith.constant 1040 : i64
    %c2_i32 = arith.constant 2 : i32
    %c12_i32 = arith.constant 12 : i32
    %c128 = arith.constant 128 : index
    %true = arith.constant true
    %c1_i32 = arith.constant 1 : i32
    %c28_i32 = arith.constant 28 : i32
    %0 = arith.muli %arg12, %arg13 : i32
    %1 = arith.muli %0, %arg14 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    scf.for %arg15 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %4 = arith.remsi %arg15, %arg12 : i32
      %5 = hivm.hir.pointer_cast(%c0_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %6 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %5[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %6[] : memref<i32, #hivm.address_space<ssbuf>>
      %7 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %8 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %7[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %8[] : memref<i32, #hivm.address_space<ssbuf>>
      %9 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %10 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %9[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %10[] : memref<i32, #hivm.address_space<ssbuf>>
      %11 = hivm.hir.pointer_cast(%c12_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %12 = hivm.hir.pointer_cast(%c1036_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %11[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %12[] : memref<i32, #hivm.address_space<ssbuf>>
      %13 = hivm.hir.pointer_cast(%c16_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %14 = hivm.hir.pointer_cast(%c1040_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %13[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %14[] : memref<i32, #hivm.address_space<ssbuf>>
      %alloc = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x64xf32, #hivm.address_space<ub>>
      %alloc_0 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_0 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x64xf32, #hivm.address_space<ub>>
      scf.for %arg16 = %4 to %c8192_i32 step %c28_i32  : i32 {
        %15 = arith.divsi %arg16, %c8_i32 {MixUse} : i32
        %16 = arith.muli %15, %c8_i32 {MixUse} : i32
        %17 = arith.subi %arg16, %16 {MixUse} : i32
        %18 = arith.remsi %15, %c8_i32 {MixUse} : i32
        %19 = arith.muli %18, %c65536_i32 {MixUse} : i32
        %20 = arith.divsi %15, %c8_i32 {MixUse} : i32
        %21 = arith.muli %20, %c524288_i32 {MixUse} : i32
        %22 = arith.addi %19, %21 {MixUse} : i32
        %23 = arith.muli %17, %c128_i32 {MixUse} : i32
        %24 = arith.index_cast %22 : i32 to index
        %25 = arith.index_cast %23 : i32 to index
        %26 = affine.apply #map()[%24, %25]
        %reinterpret_cast = memref.reinterpret_cast %arg3 to offset: [%26], sizes: [128, 64], strides: [64, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_1 = memref.alloc() : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_1 {hivm.multi_buffer = 2 : i32} : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
        %cast = memref.cast %alloc_1 : memref<4x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
        hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast : memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
        %reinterpret_cast_2 = memref.reinterpret_cast %arg4 to offset: [%26], sizes: [128, 64], strides: [64, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_3 = memref.alloc() : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_3 {hivm.multi_buffer = 2 : i32} : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
        %cast_4 = memref.cast %alloc_3 : memref<4x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
        hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast_2 : memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_4 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
        %alloc_5 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %alloc_6 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_6 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_5 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 8
        %alloc_7 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %alloc_8 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_8 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_7 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 2
        hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 12
        %alloc_9 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_10 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_10 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_9 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_11 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_12 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_12 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_11 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_13 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
        %alloc_14 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_14 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x64xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_13 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x64xf32, #hivm.address_space<ub>>
        %alloca = memref.alloca() {normalize_matmul_counter = 1 : i32} : memref<i32>
        memref.store %c0_i32, %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
        %alloca_15 = memref.alloca() {normalize_matmul_counter = 0 : i32} : memref<i32>
        memref.store %c0_i32, %alloca_15[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
        %alloc_16 = memref.alloc() {alignment = 64 : i64} : memref<4x8x16x16xf32, #hivm.address_space<cc>>
        annotation.mark %alloc_16 {hivm.multi_buffer = 2 : i32} : memref<4x8x16x16xf32, #hivm.address_space<cc>>
        %cast_17 = memref.cast %alloc_16 : memref<4x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
        %alloc_18 = memref.alloc() {alignment = 64 : i64} : memref<4x8x16x16xf32, #hivm.address_space<cc>>
        annotation.mark %alloc_18 {hivm.multi_buffer = 2 : i32} : memref<4x8x16x16xf32, #hivm.address_space<cc>>
        %cast_19 = memref.cast %alloc_18 : memref<4x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
        %27:4 = scf.for %arg17 = %c0_i32 to %c12_i32 step %c1_i32 iter_args(%arg18 = %c0_i32, %arg19 = %c0_i32, %arg20 = %c0_i32, %arg21 = %c0_i32) -> (i32, i32, i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          %28 = memref.load %5[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %28 {memref_ext.volatile} : i32
          %29 = arith.cmpi slt, %28, %c2_i32 : i32
          %30 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %30 {memref_ext.volatile} : i32
          %31 = arith.cmpi slt, %30, %c2_i32 : i32
          %32 = arith.andi %29, %31 : i1
          %33 = arith.cmpi slt, %arg18, %c8_i32 : i32
          %34 = arith.andi %32, %33 : i1
          %35 = scf.if %34 -> (i32) {
            %74 = arith.muli %arg18, %c128_i32 {MixUse} : i32
            %75 = arith.index_cast %74 : i32 to index
            %76 = affine.apply #map()[%24, %75]
            %reinterpret_cast_20 = memref.reinterpret_cast %arg2 to offset: [%76], sizes: [128, 64], strides: [64, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_21 = memref.alloc() : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
            annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32} : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
            %cast_22 = memref.cast %alloc_21 : memref<4x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
            hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast_20 : memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_22 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
            %alloc_23 = memref.alloc() {alignment = 64 : i64} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            annotation.mark %alloc_23 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            %cast_24 = memref.cast %alloc_23 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, normalized_in_L0C} ins(%cast_22, %cast, %true, %c128, %c64, %c128 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_24 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            %77 = arith.remsi %arg18, %c2_i32 : i32
            %78 = arith.cmpi eq, %77, %c0_i32 : i32
            scf.if %78 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_23 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_9 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 3
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 9
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_23 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_10 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 9
            }
            %79 = memref.load %5[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %79 {memref_ext.volatile} : i32
            %80 = arith.addi %79, %c1_i32 : i32
            memref.store %80, %5[] : memref<i32, #hivm.address_space<ssbuf>>
            %81 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %81 {memref_ext.volatile} : i32
            %82 = arith.addi %81, %c1_i32 : i32
            memref.store %82, %6[] : memref<i32, #hivm.address_space<ssbuf>>
            %83 = arith.addi %arg18, %c1_i32 : i32
            scf.yield %83 : i32
          } else {
            scf.yield %arg18 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 4 : i32}
          %36 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %36 {memref_ext.volatile} : i32
          %37 = arith.cmpi sgt, %36, %c0_i32 : i32
          %38 = memref.load %12[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %38 {memref_ext.volatile} : i32
          %39 = arith.cmpi sgt, %38, %c0_i32 : i32
          %40 = arith.andi %37, %39 : i1
          %41 = arith.cmpi sge, %arg18, %c8_i32 : i32
          %42 = arith.cmpi sge, %arg18, %c2_i32 : i32
          %43 = arith.ori %41, %42 : i1
          %44 = arith.cmpi slt, %arg19, %c8_i32 : i32
          %45 = arith.andi %40, %43 : i1
          %46 = arith.andi %45, %44 : i1
          %47 = scf.if %46 -> (i32) {
            %74 = arith.muli %arg19, %c128_i32 {MixUse} : i32
            %75 = arith.index_cast %74 : i32 to index
            %76 = affine.apply #map()[%24, %75]
            %77 = arith.remsi %arg19, %c2_i32 : i32
            %78 = arith.cmpi eq, %77, %c0_i32 : i32
            %reinterpret_cast_20 = memref.reinterpret_cast %arg5 to offset: [%76], sizes: [128, 64], strides: [64, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_21 = memref.alloc() : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
            annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32} : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
            %cast_22 = memref.cast %alloc_21 : memref<4x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
            hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast_20 : memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_22 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
            %79 = arith.select %78, %alloc_5, %alloc_6 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
            scf.if %78 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 8
            }
            %80 = memref.load %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
            %81 = arith.cmpi eq, %80, %c0_i32 : i32
            hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, normalized_in_L0C} ins(%79, %cast_22, %81, %c128, %c128, %c64 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_19 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            %82 = arith.addi %80, %c1_i32 : i32
            memref.store %82, %alloca[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
            scf.if %78 {
              hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
            } else {
              hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 8
            } {ssbuffer.cross_buffer = 1 : i32}
            %83 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %83 {memref_ext.volatile} : i32
            %84 = arith.subi %83, %c1_i32 : i32
            memref.store %84, %11[] : memref<i32, #hivm.address_space<ssbuf>>
            %85 = memref.load %12[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %85 {memref_ext.volatile} : i32
            %86 = arith.subi %85, %c1_i32 : i32
            memref.store %86, %12[] : memref<i32, #hivm.address_space<ssbuf>>
            %87 = arith.addi %arg19, %c1_i32 : i32
            scf.yield %87 : i32
          } else {
            scf.yield %arg19 : i32
          }
          %48 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %48 {memref_ext.volatile} : i32
          %49 = arith.cmpi slt, %48, %c2_i32 : i32
          %50 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %50 {memref_ext.volatile} : i32
          %51 = arith.cmpi slt, %50, %c2_i32 : i32
          %52 = arith.andi %49, %51 : i1
          %53 = arith.cmpi slt, %arg20, %c8_i32 : i32
          %54 = arith.andi %52, %53 : i1
          %55 = scf.if %54 -> (i32) {
            %74 = arith.muli %arg20, %c128_i32 {MixUse} : i32
            %75 = arith.index_cast %74 : i32 to index
            %76 = affine.apply #map()[%24, %75]
            %77 = arith.remsi %arg20, %c2_i32 : i32
            %78 = arith.cmpi eq, %77, %c0_i32 : i32
            %reinterpret_cast_20 = memref.reinterpret_cast %arg5 to offset: [%76], sizes: [128, 64], strides: [64, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_21 = memref.alloc() : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
            annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32} : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
            %cast_22 = memref.cast %alloc_21 : memref<4x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
            hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast_20 : memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_22 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
            %alloc_23 = memref.alloc() {alignment = 64 : i64} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            annotation.mark %alloc_23 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
            %cast_24 = memref.cast %alloc_23 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, normalized_in_L0C} ins(%cast_22, %cast_4, %true, %c128, %c64, %c128 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_24 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %78 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_23 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_11 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 4
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 13
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_23 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_12 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 13
            }
            %79 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %79 {memref_ext.volatile} : i32
            %80 = arith.addi %79, %c1_i32 : i32
            memref.store %80, %7[] : memref<i32, #hivm.address_space<ssbuf>>
            %81 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %81 {memref_ext.volatile} : i32
            %82 = arith.addi %81, %c1_i32 : i32
            memref.store %82, %8[] : memref<i32, #hivm.address_space<ssbuf>>
            %83 = arith.addi %arg20, %c1_i32 : i32
            scf.yield %83 : i32
          } else {
            scf.yield %arg20 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 8 : i32}
          %56 = memref.load %13[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %56 {memref_ext.volatile} : i32
          %57 = arith.cmpi sgt, %56, %c0_i32 : i32
          %58 = memref.load %14[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %58 {memref_ext.volatile} : i32
          %59 = arith.cmpi sgt, %58, %c0_i32 : i32
          %60 = arith.andi %57, %59 : i1
          %61 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %61 {memref_ext.volatile} : i32
          %62 = arith.cmpi slt, %61, %c2_i32 : i32
          %63 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %63 {memref_ext.volatile} : i32
          %64 = arith.cmpi slt, %63, %c2_i32 : i32
          %65 = arith.andi %62, %64 : i1
          %66 = arith.andi %60, %65 : i1
          %67 = arith.cmpi sge, %arg20, %c8_i32 : i32
          %68 = arith.cmpi sge, %arg20, %c2_i32 : i32
          %69 = arith.ori %67, %68 : i1
          %70 = arith.cmpi slt, %arg21, %c8_i32 : i32
          %71 = arith.andi %66, %69 : i1
          %72 = arith.andi %71, %70 : i1
          %73 = scf.if %72 -> (i32) {
            %74 = arith.muli %arg21, %c128_i32 {MixUse} : i32
            %75 = arith.index_cast %74 : i32 to index
            %76 = affine.apply #map()[%24, %75]
            %reinterpret_cast_20 = memref.reinterpret_cast %arg2 to offset: [%76], sizes: [128, 64], strides: [64, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_21 = memref.alloc() : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
            annotation.mark %alloc_21 {hivm.multi_buffer = 2 : i32} : memref<4x8x16x16xf16, #hivm.address_space<cbuf>>
            %cast_22 = memref.cast %alloc_21 : memref<4x8x16x16xf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xf16, #hivm.address_space<cbuf>>
            hivm.hir.nd2nz {dst_continuous} ins(%reinterpret_cast_20 : memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_22 : memref<?x?x?x?xf16, #hivm.address_space<cbuf>>)
            %77 = arith.remsi %arg21, %c2_i32 : i32
            %78 = arith.cmpi eq, %77, %c0_i32 : i32
            %79 = arith.select %78, %alloc_7, %alloc_8 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
            scf.if %78 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 12
            }
            %80 = memref.load %alloca_15[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
            %81 = arith.cmpi eq, %80, %c0_i32 : i32
            hivm.hir.mmadL1 {a_transpose, already_set_real_mkn, normalized_in_L0C} ins(%79, %cast_22, %81, %c128, %c128, %c64 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_17 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            %82 = arith.addi %80, %c1_i32 : i32
            memref.store %82, %alloca_15[] {hivm.tcore_type = #hivm.tcore_type<CUBE_AND_VECTOR>} : memref<i32>
            %alloc_23 = memref.alloc() {alignment = 64 : i64} : memref<4x8x16x16xf32, #hivm.address_space<cc>>
            annotation.mark %alloc_23 {hivm.multi_buffer = 2 : i32} : memref<4x8x16x16xf32, #hivm.address_space<cc>>
            %cast_24 = memref.cast %alloc_23 : memref<4x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
            hivm.hir.mmadL1 {already_set_real_mkn, normalized_in_L0C} ins(%79, %cast, %true, %c128, %c128, %c64 : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_24 : memref<?x?x?x?xf32, #hivm.address_space<cc>>)
            scf.if %78 {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_23 : memref<4x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_13 : memref<64x64xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 5
              hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 2
            } else {
              hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 10
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_23 : memref<4x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_14 : memref<64x64xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
              hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 10
              hivm.hir.sync_block_set[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 12
            }
            %83 = memref.load %13[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %83 {memref_ext.volatile} : i32
            %84 = arith.subi %83, %c1_i32 : i32
            memref.store %84, %13[] : memref<i32, #hivm.address_space<ssbuf>>
            %85 = memref.load %14[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %85 {memref_ext.volatile} : i32
            %86 = arith.subi %85, %c1_i32 : i32
            memref.store %86, %14[] : memref<i32, #hivm.address_space<ssbuf>>
            %87 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %87 {memref_ext.volatile} : i32
            %88 = arith.addi %87, %c1_i32 : i32
            memref.store %88, %9[] : memref<i32, #hivm.address_space<ssbuf>>
            %89 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %89 {memref_ext.volatile} : i32
            %90 = arith.addi %89, %c1_i32 : i32
            memref.store %90, %10[] : memref<i32, #hivm.address_space<ssbuf>>
            %91 = arith.addi %arg21, %c1_i32 : i32
            scf.yield %91 : i32
          } else {
            scf.yield %arg21 : i32
          }
          hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %35, %47, %55, %73 : i32, i32, i32, i32
        } {DataUse, fixpipe_for_mmad_result_already_inserted = true, normalized_in_L0C = [1 : i32, 0 : i32]}
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 10
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 13
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 9
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_16 : memref<4x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc : memref<64x64xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 6
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%alloc_18 : memref<4x8x16x16xf32, #hivm.address_space<cc>>) outs(%alloc_0 : memref<64x64xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
        hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 7
      } {Undefined}
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
  func.func @_attn_bwd_mix_aiv_outlined_vf_0(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64x128xf32, #hivm.address_space<ub>>, %arg2: f32, %arg3: memref<64x128xf16, #hivm.address_space<ub>>, %arg4: memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f16
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %arg2 : f32 to vector<1x64xf32>
    scf.for %arg5 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg5] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map1} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      scf.for %arg6 = %c0 to %c128 step %c64 {
        %subview_1 = memref.subview %arg1[%arg5, %arg6] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg3[%arg5, %arg6] [1, 64] [1, 1] : memref<64x128xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = arith.mulf %2, %0 : vector<1x64xf32>
        %4 = arith.subf %3, %1 : vector<1x64xf32>
        %5 = math.exp %4 : vector<1x64xf32>
        %6 = arith.truncf %5 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
        vector.transfer_write %6, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf16>, memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg5 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg3[%arg5, 0] [1, 128] [1, 1] : memref<64x128xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg4[0, %arg5, 0] [8, 1, 16] [1, 1, 1] : memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<8x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x128xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x128xf16>
      %2 = vector.shape_cast %1 : vector<1x128xf16> to vector<8x1x16xf16>
      vector.transfer_write %2, %subview_1[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<8x1x16xf16>, memref<8x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @_attn_bwd_mix_aiv_outlined_vf_1(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64x128xf16, #hivm.address_space<ub>>, %arg2: memref<64x128xf32, #hivm.address_space<ub>>, %arg3: f32, %arg4: memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %0 = vector.broadcast %arg3 : f32 to vector<1x64xf32>
    scf.for %arg5 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg5] [1] [1] : memref<64xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map1} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      scf.for %arg6 = %c0 to %c8 step %c4 {
        %2 = affine.apply #map2(%arg6)
        %subview_1 = memref.subview %arg1[%arg5, %2] [1, 64] [1, 1] : memref<64x128xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg2[%arg5, %2] [1, 64] [1, 1] : memref<64x128xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>
        %3 = vector.transfer_read %subview_1[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf16, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
        %4 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[128, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = arith.subf %4, %1 : vector<1x64xf32>
        %6 = arith.extf %3 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf16> to vector<1x64xf32>
        %7 = arith.mulf %6, %5 : vector<1x64xf32>
        %8 = arith.mulf %7, %0 : vector<1x64xf32>
        %9 = arith.truncf %8 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
        %subview_3 = memref.subview %arg4[%arg6, %arg5, 0] [4, 1, 16] [1, 1, 1] : memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> to memref<4x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = vector.shape_cast %9 : vector<1x64xf16> to vector<4x1x16xf16>
        vector.transfer_write %10, %subview_3[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<4x1x16xf16>, memref<4x1x16xf16, strided<[1040, 16, 1], offset: ?>, #hivm.address_space<ub>>
      } {unroll_for_vsstb}
    }
    return
  }
  func.func @_attn_bwd_mix_aiv_outlined_vf_2(%arg0: memref<64x64xf32, #hivm.address_space<ub>>, %arg1: memref<64x64xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg2, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg2, 0] [1, 64] [1, 1] : memref<64x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = arith.truncf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
      vector.transfer_write %1, %subview_0[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf16>, memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @_attn_bwd_mix_aiv_outlined_vf_3(%arg0: memref<64x64xf32, #hivm.address_space<ub>>, %arg1: memref<64x64xf32, #hivm.address_space<ub>>, %arg2: memref<64x64xf16, #hivm.address_space<ub>>, %arg3: memref<64x64xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg0[%arg4, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg2[%arg4, 0] [1, 64] [1, 1] : memref<64x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = arith.truncf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
      vector.transfer_write %1, %subview_0[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf16>, memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg4, 0] [1, 64] [1, 1] : memref<64x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg3[%arg4, 0] [1, 64] [1, 1] : memref<64x64xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %3 = arith.truncf %2 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
      vector.transfer_write %3, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf16>, memref<1x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @_attn_bwd_mix_aiv(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 2 : i32}, %arg7: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg8: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, false, false, false, false]> : vector<15xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
    %c28_i32 = arith.constant 28 : i32
    %c1_i32 = arith.constant 1 : i32
    %c12_i32 = arith.constant 12 : i32
    %c3_i32 = arith.constant 3 : i32
    %c2_i32 = arith.constant 2 : i32
    %c1040_i64 = arith.constant 1040 : i64
    %c16_i64 = arith.constant 16 : i64
    %c1036_i64 = arith.constant 1036 : i64
    %c12_i64 = arith.constant 12 : i64
    %c1032_i64 = arith.constant 1032 : i64
    %c8_i64 = arith.constant 8 : i64
    %c1028_i64 = arith.constant 1028 : i64
    %c4_i64 = arith.constant 4 : i64
    %c1024_i64 = arith.constant 1024 : i64
    %c128_i32 = arith.constant {MixUse} 128 : i32
    %c524288_i32 = arith.constant {MixUse} 524288 : i32
    %c65536_i32 = arith.constant {MixUse} 65536 : i32
    %c1024_i32 = arith.constant 1024 : i32
    %c8_i32 = arith.constant {MixUse} 8 : i32
    %c8192_i32 = arith.constant {Undefined} 8192 : i32
    %c0_i32 = arith.constant {Undefined} 0 : i32
    %c0_i64 = arith.constant 0 : i64
    %0 = arith.muli %arg12, %arg13 : i32
    %1 = arith.muli %0, %arg14 : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %4 = hivm.hir.get_sub_block_idx -> i64
    %5 = arith.muli %4, %c1024_i64 : i64
    %6 = arith.addi %5, %c8_i64 : i64
    %7 = arith.addi %5, %c4_i64 : i64
    %8 = arith.addi %5, %c16_i64 : i64
    %9 = arith.addi %5, %c12_i64 : i64
    %10 = arith.index_cast %4 : i64 to index
    %11 = affine.apply #map3()[%10]
    %12 = affine.apply #map4()[%10]
    annotation.mark %1 {logical_block_num} : i32
    scf.for %arg15 = %3 to %1 step %c28_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %13 = arith.remsi %arg15, %arg12 : i32
      %14 = hivm.hir.pointer_cast(%c0_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %15 = hivm.hir.pointer_cast(%c1024_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %14[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %15[] : memref<i32, #hivm.address_space<ssbuf>>
      %16 = hivm.hir.pointer_cast(%c4_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %17 = hivm.hir.pointer_cast(%c1028_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %16[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %17[] : memref<i32, #hivm.address_space<ssbuf>>
      %18 = hivm.hir.pointer_cast(%c8_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %19 = hivm.hir.pointer_cast(%c1032_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %18[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %19[] : memref<i32, #hivm.address_space<ssbuf>>
      %20 = hivm.hir.pointer_cast(%c12_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %21 = hivm.hir.pointer_cast(%c1036_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %20[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %21[] : memref<i32, #hivm.address_space<ssbuf>>
      %22 = hivm.hir.pointer_cast(%c16_i64) : memref<i32, #hivm.address_space<ssbuf>>
      %23 = hivm.hir.pointer_cast(%c1040_i64) : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %22[] : memref<i32, #hivm.address_space<ssbuf>>
      memref.store %c0_i32, %23[] : memref<i32, #hivm.address_space<ssbuf>>
      %24 = hivm.hir.pointer_cast(%6) : memref<i32, #hivm.address_space<ssbuf>>
      %25 = hivm.hir.pointer_cast(%7) : memref<i32, #hivm.address_space<ssbuf>>
      %26 = hivm.hir.pointer_cast(%8) : memref<i32, #hivm.address_space<ssbuf>>
      %27 = hivm.hir.pointer_cast(%5) : memref<i32, #hivm.address_space<ssbuf>>
      %28 = hivm.hir.pointer_cast(%9) : memref<i32, #hivm.address_space<ssbuf>>
      %alloc = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x64xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
      %alloc_0 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_0 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x64xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
      scf.for %arg16 = %13 to %c8192_i32 step %c28_i32  : i32 {
        %29 = arith.divsi %arg16, %c8_i32 {MixUse} : i32
        %30 = arith.muli %29, %c1024_i32 : i32
        %31 = arith.remsi %29, %c8_i32 {MixUse} : i32
        %32 = arith.muli %31, %c65536_i32 {MixUse} : i32
        %33 = arith.divsi %29, %c8_i32 {MixUse} : i32
        %34 = arith.muli %33, %c524288_i32 {MixUse} : i32
        %35 = arith.addi %32, %34 {MixUse} : i32
        %36 = arith.index_cast %35 : i32 to index
        %alloc_1 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %subview = memref.subview %alloc_1[0, %12, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %alloc_2 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %subview_3 = memref.subview %alloc_2[0, %12, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_2 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_1 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %alloc_4 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %subview_5 = memref.subview %alloc_4[0, %12, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        %alloc_6 = memref.alloc() : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %subview_7 = memref.subview %alloc_6[0, %12, 0, 0] [8, 4, 16, 16] [1, 1, 1, 1] {to_be_bubbled_slice} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>> to memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
        annotation.mark %alloc_6 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<10>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        annotation.mark %alloc_4 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 1 : index} : memref<8x8x16x16xf16, #hivm.address_space<cbuf>>
        %alloc_8 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_8 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_9 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_9 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 9
        %alloc_10 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_10 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        %alloc_11 = memref.alloc() : memref<64x128xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_11 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<11>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 13
        %alloc_12 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_12 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x64xf32, #hivm.address_space<ub>>
        %alloc_13 = memref.alloc() : memref<64x64xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_13 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x64xf32, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 10
        %alloc_14 = memref.alloc() : memref<64x128xf16, #hivm.address_space<ub>>
        %alloc_15 = memref.alloc() : memref<64x128xf16, #hivm.address_space<ub>>
        %alloc_16 = memref.alloc() : memref<64x128xf16, #hivm.address_space<ub>>
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        %37:4 = scf.for %arg17 = %c0_i32 to %c12_i32 step %c1_i32 iter_args(%arg18 = %c0_i32, %arg19 = %c0_i32, %arg20 = %c0_i32, %arg21 = %c0_i32) -> (i32, i32, i32, i32)  : i32 {
          hivm.hir.sync_block_wait[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          %43 = memref.load %27[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %43 {memref_ext.volatile} : i32
          %44 = arith.cmpi sgt, %43, %c0_i32 : i32
          %45 = memref.load %28[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %45 {memref_ext.volatile} : i32
          %46 = arith.cmpi slt, %45, %c2_i32 : i32
          %47 = arith.andi %44, %46 : i1
          %48 = arith.cmpi slt, %arg21, %c3_i32 : i32
          %49 = arith.cmpi slt, %arg18, %c8_i32 : i32
          %50 = arith.andi %47, %48 : i1
          %51 = arith.andi %50, %49 : i1
          %52:2 = scf.if %51 -> (i32, i32) {
            %68 = arith.remsi %arg18, %c2_i32 : i32
            %69 = arith.cmpi eq, %68, %c0_i32 : i32
            %70 = arith.select %69, %alloc_8, %alloc_9 : memref<64x128xf32, #hivm.address_space<ub>>
            scf.if %69 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 3
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 9
            }
            %71 = arith.muli %arg18, %c128_i32 {MixUse} : i32
            %72 = arith.index_cast %71 : i32 to index
            %73 = arith.index_cast %30 : i32 to index
            %74 = affine.apply #map5()[%73, %72]
            %reinterpret_cast_25 = memref.reinterpret_cast %arg9 to offset: [%74], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
            %subview_26 = memref.subview %reinterpret_cast_25[%11] [64] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
            %alloc_27 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_27 {hivm.multi_buffer = 2 : i32} : memref<64xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_27 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64xf32, #hivm.address_space<ub>>
            hivm.hir.load ins(%subview_26 : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_27 : memref<64xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
            %alloc_28 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf16, #hivm.address_space<ub>>
            %alloc_29 = memref.alloc() : memref<8x65x16x1xf16, #hivm.address_space<ub>>
            %subview_30 = memref.subview %alloc_29[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xf16, #hivm.address_space<ub>> to memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
            func.call @_attn_bwd_mix_aiv_outlined_vf_0(%alloc_27, %70, %arg11, %alloc_28, %subview_30) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, f32, memref<64x128xf16, #hivm.address_space<ub>>, memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
            %expand_shape = memref.expand_shape %subview_30 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
            scf.if %69 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
              %collapse_shape_31 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_32 = memref.collapse_shape %subview [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_31 : memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_32 : memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 8
              %collapse_shape_31 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_32 = memref.collapse_shape %subview_3 [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_31 : memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_32 : memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 8
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 9
            }
            %75 = arith.remsi %arg18, %c3_i32 : i32
            %76 = arith.cmpi eq, %75, %c0_i32 : i32
            scf.if %76 {
              %collapse_shape_31 = memref.collapse_shape %alloc_28 [[0, 1]] : memref<64x128xf16, #hivm.address_space<ub>> into memref<8192xf16, #hivm.address_space<ub>>
              %collapse_shape_32 = memref.collapse_shape %alloc_14 [[0, 1]] : memref<64x128xf16, #hivm.address_space<ub>> into memref<8192xf16, #hivm.address_space<ub>>
              hivm.hir.copy ins(%collapse_shape_31 : memref<8192xf16, #hivm.address_space<ub>>) outs(%collapse_shape_32 : memref<8192xf16, #hivm.address_space<ub>>) {tiled_op}
            } else {
              %83 = arith.cmpi eq, %75, %c1_i32 : i32
              scf.if %83 {
                %collapse_shape_31 = memref.collapse_shape %alloc_28 [[0, 1]] : memref<64x128xf16, #hivm.address_space<ub>> into memref<8192xf16, #hivm.address_space<ub>>
                %collapse_shape_32 = memref.collapse_shape %alloc_15 [[0, 1]] : memref<64x128xf16, #hivm.address_space<ub>> into memref<8192xf16, #hivm.address_space<ub>>
                hivm.hir.copy ins(%collapse_shape_31 : memref<8192xf16, #hivm.address_space<ub>>) outs(%collapse_shape_32 : memref<8192xf16, #hivm.address_space<ub>>) {tiled_op}
              } else {
                %collapse_shape_31 = memref.collapse_shape %alloc_28 [[0, 1]] : memref<64x128xf16, #hivm.address_space<ub>> into memref<8192xf16, #hivm.address_space<ub>>
                %collapse_shape_32 = memref.collapse_shape %alloc_16 [[0, 1]] : memref<64x128xf16, #hivm.address_space<ub>> into memref<8192xf16, #hivm.address_space<ub>>
                hivm.hir.copy ins(%collapse_shape_31 : memref<8192xf16, #hivm.address_space<ub>>) outs(%collapse_shape_32 : memref<8192xf16, #hivm.address_space<ub>>) {tiled_op}
              }
            }
            %77 = memref.load %27[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %77 {memref_ext.volatile} : i32
            %78 = arith.subi %77, %c1_i32 : i32
            memref.store %78, %27[] : memref<i32, #hivm.address_space<ssbuf>>
            %79 = memref.load %28[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %79 {memref_ext.volatile} : i32
            %80 = arith.addi %79, %c1_i32 : i32
            memref.store %80, %28[] : memref<i32, #hivm.address_space<ssbuf>>
            %81 = arith.addi %arg21, %c1_i32 : i32
            %82 = arith.addi %arg18, %c1_i32 : i32
            scf.yield %81, %82 : i32, i32
          } else {
            scf.yield %arg21, %arg18 : i32, i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 19 : i32}
          %53 = memref.load %25[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %53 {memref_ext.volatile} : i32
          %54 = arith.cmpi sgt, %53, %c0_i32 : i32
          %55 = memref.load %26[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %55 {memref_ext.volatile} : i32
          %56 = arith.cmpi slt, %55, %c2_i32 : i32
          %57 = arith.andi %54, %56 : i1
          %58 = arith.cmpi sgt, %52#0, %c0_i32 : i32
          %59 = arith.cmpi slt, %arg19, %c8_i32 : i32
          %60 = arith.andi %57, %58 : i1
          %61 = arith.andi %60, %59 : i1
          %62:2 = scf.if %61 -> (i32, i32) {
            %68 = arith.remsi %arg19, %c2_i32 : i32
            %69 = arith.cmpi eq, %68, %c0_i32 : i32
            %70 = arith.remsi %arg19, %c3_i32 : i32
            %71 = arith.cmpi eq, %70, %c0_i32 : i32
            %72 = scf.if %71 -> (memref<64x128xf16, #hivm.address_space<ub>>) {
              scf.yield %alloc_14 : memref<64x128xf16, #hivm.address_space<ub>>
            } else {
              %84 = arith.cmpi eq, %70, %c1_i32 : i32
              %85 = arith.select %84, %alloc_15, %alloc_16 : memref<64x128xf16, #hivm.address_space<ub>>
              scf.yield %85 : memref<64x128xf16, #hivm.address_space<ub>>
            }
            %73 = arith.select %69, %alloc_10, %alloc_11 : memref<64x128xf32, #hivm.address_space<ub>>
            scf.if %69 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 4
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 13
            }
            %74 = arith.muli %arg19, %c128_i32 {MixUse} : i32
            %75 = arith.index_cast %74 : i32 to index
            %76 = arith.index_cast %30 : i32 to index
            %77 = affine.apply #map5()[%76, %75]
            %reinterpret_cast_25 = memref.reinterpret_cast %arg10 to offset: [%77], sizes: [128], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
            %subview_26 = memref.subview %reinterpret_cast_25[%11] [64] [1] : memref<128xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
            %alloc_27 = memref.alloc() : memref<64xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_27 {hivm.multi_buffer = 2 : i32} : memref<64xf32, #hivm.address_space<ub>>
            annotation.mark %alloc_27 {hivm.skip_stride_align_for_vload = #hivm.skip_stride_align_for_vload} : memref<64xf32, #hivm.address_space<ub>>
            hivm.hir.load ins(%subview_26 : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%alloc_27 : memref<64xf32, #hivm.address_space<ub>>) eviction_policy = <EvictFirst> core_type = <VECTOR>
            %alloc_28 = memref.alloc() : memref<8x65x16x1xf16, #hivm.address_space<ub>>
            %subview_29 = memref.subview %alloc_28[0, 0, 0, 0] [8, 64, 16, 1] [1, 1, 1, 1] : memref<8x65x16x1xf16, #hivm.address_space<ub>> to memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>
            func.call @_attn_bwd_mix_aiv_outlined_vf_1(%alloc_27, %72, %73, %arg11, %subview_29) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64x128xf16, #hivm.address_space<ub>>, memref<64x128xf32, #hivm.address_space<ub>>, f32, memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>>) -> ()
            %expand_shape = memref.expand_shape %subview_29 [[0], [1, 2], [3]] output_shape [8, 4, 16, 16] : memref<8x64x16xf16, strided<[1040, 16, 1]>, #hivm.address_space<ub>> into memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>>
            scf.if %69 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 2
              %collapse_shape_30 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_31 = memref.collapse_shape %subview_5 [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_30 : memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_31 : memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 12
              %collapse_shape_30 = memref.collapse_shape %expand_shape [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[1040, 256, 16, 1]>, #hivm.address_space<ub>> into memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>
              %collapse_shape_31 = memref.collapse_shape %subview_7 [[0], [1, 2, 3]] : memref<8x4x16x16xf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> into memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>
              hivm.hir.copy ins(%collapse_shape_30 : memref<8x1024xf16, strided<[1040, 1]>, #hivm.address_space<ub>>) outs(%collapse_shape_31 : memref<8x1024xf16, strided<[2048, 1], offset: ?>, #hivm.address_space<cbuf>>) {tiled_op}
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 12
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 13
            }
            %78 = memref.load %25[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %78 {memref_ext.volatile} : i32
            %79 = arith.subi %78, %c1_i32 : i32
            memref.store %79, %25[] : memref<i32, #hivm.address_space<ssbuf>>
            %80 = memref.load %26[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %80 {memref_ext.volatile} : i32
            %81 = arith.addi %80, %c1_i32 : i32
            memref.store %81, %26[] : memref<i32, #hivm.address_space<ssbuf>>
            %82 = arith.subi %52#0, %c1_i32 : i32
            %83 = arith.addi %arg19, %c1_i32 : i32
            scf.yield %82, %83 : i32, i32
          } else {
            scf.yield %52#0, %arg19 : i32, i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 21 : i32}
          %63 = memref.load %24[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %63 {memref_ext.volatile} : i32
          %64 = arith.cmpi sgt, %63, %c0_i32 : i32
          %65 = arith.cmpi slt, %arg20, %c8_i32 : i32
          %66 = arith.andi %64, %65 : i1
          %67 = scf.if %66 -> (i32) {
            %68 = arith.remsi %arg20, %c2_i32 : i32
            %69 = arith.cmpi eq, %68, %c0_i32 : i32
            %70 = arith.select %69, %alloc_12, %alloc_13 : memref<64x64xf32, #hivm.address_space<ub>>
            scf.if %69 {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 5
            } else {
              hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 10
            }
            %71 = arith.muli %arg20, %c128_i32 {MixUse} : i32
            %72 = arith.index_cast %71 : i32 to index
            %73 = affine.apply #map()[%36, %72]
            %reinterpret_cast_25 = memref.reinterpret_cast %arg6 to offset: [%73], sizes: [128, 64], strides: [64, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
            %subview_26 = memref.subview %reinterpret_cast_25[%11, 0] [64, 64] [1, 1] {to_be_bubbled_slice} : memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
            %alloc_27 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf16, #hivm.address_space<ub>>
            func.call @_attn_bwd_mix_aiv_outlined_vf_2(%70, %alloc_27) {hivm.vector_function, no_inline} : (memref<64x64xf32, #hivm.address_space<ub>>, memref<64x64xf16, #hivm.address_space<ub>>) -> ()
            %collapse_shape_28 = memref.collapse_shape %alloc_27 [[0, 1]] : memref<64x64xf16, #hivm.address_space<ub>> into memref<4096xf16, #hivm.address_space<ub>>
            %collapse_shape_29 = memref.collapse_shape %subview_26 [[0, 1]] : memref<64x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>> into memref<4096xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>
            hivm.hir.store ins(%collapse_shape_28 : memref<4096xf16, #hivm.address_space<ub>>) outs(%collapse_shape_29 : memref<4096xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op} atomic = <add>
            scf.if %69 {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
            } else {
              hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 10
            } {ssbuffer.cross_buffer = 1 : i32}
            %74 = memref.load %24[] : memref<i32, #hivm.address_space<ssbuf>>
            annotation.mark %74 {memref_ext.volatile} : i32
            %75 = arith.subi %74, %c1_i32 : i32
            memref.store %75, %24[] : memref<i32, #hivm.address_space<ssbuf>>
            %76 = arith.addi %arg20, %c1_i32 : i32
            scf.yield %76 : i32
          } else {
            scf.yield %arg20 : i32
          } {hivm.matmul_limited_in_cube, ssbuffer.if = 22 : i32}
          hivm.hir.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %52#1, %62#1, %67, %62#0 : i32, i32, i32, i32
        } {DataUse}
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 2
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 12
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 8
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 7
        hivm.hir.sync_block_wait[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 6
        %38 = arith.muli %29, %c8_i32 {MixUse} : i32
        %39 = arith.subi %arg16, %38 {MixUse} : i32
        %40 = arith.muli %39, %c128_i32 {MixUse} : i32
        %41 = arith.index_cast %40 : i32 to index
        %42 = affine.apply #map()[%36, %41]
        %reinterpret_cast = memref.reinterpret_cast %arg7 to offset: [%42], sizes: [128, 64], strides: [64, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_17 = memref.subview %reinterpret_cast[%11, 0] [64, 64] [1, 1] {to_be_bubbled_slice} : memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_18 = memref.reinterpret_cast %arg8 to offset: [%42], sizes: [128, 64], strides: [64, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_19 = memref.subview %reinterpret_cast_18[%11, 0] [64, 64] [1, 1] {to_be_bubbled_slice} : memref<128x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>> to memref<64x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_20 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf16, #hivm.address_space<ub>>
        %alloc_21 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf16, #hivm.address_space<ub>>
        func.call @_attn_bwd_mix_aiv_outlined_vf_3(%alloc, %alloc_0, %alloc_20, %alloc_21) {hivm.vector_function, no_inline} : (memref<64x64xf32, #hivm.address_space<ub>>, memref<64x64xf32, #hivm.address_space<ub>>, memref<64x64xf16, #hivm.address_space<ub>>, memref<64x64xf16, #hivm.address_space<ub>>) -> ()
        %collapse_shape = memref.collapse_shape %alloc_20 [[0, 1]] : memref<64x64xf16, #hivm.address_space<ub>> into memref<4096xf16, #hivm.address_space<ub>>
        %collapse_shape_22 = memref.collapse_shape %subview_17 [[0, 1]] : memref<64x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>> into memref<4096xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%collapse_shape : memref<4096xf16, #hivm.address_space<ub>>) outs(%collapse_shape_22 : memref<4096xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        %collapse_shape_23 = memref.collapse_shape %alloc_21 [[0, 1]] : memref<64x64xf16, #hivm.address_space<ub>> into memref<4096xf16, #hivm.address_space<ub>>
        %collapse_shape_24 = memref.collapse_shape %subview_19 [[0, 1]] : memref<64x64xf16, strided<[64, 1], offset: ?>, #hivm.address_space<gm>> into memref<4096xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%collapse_shape_23 : memref<4096xf16, #hivm.address_space<ub>>) outs(%collapse_shape_24 : memref<4096xf16, strided<[1], offset: ?>, #hivm.address_space<gm>>) {tiled_op}
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.sync_block_set[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
      } {Undefined}
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}