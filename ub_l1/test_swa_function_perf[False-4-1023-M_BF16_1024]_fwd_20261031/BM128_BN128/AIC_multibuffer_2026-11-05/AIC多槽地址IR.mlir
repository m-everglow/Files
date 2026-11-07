func.func @_swa_fwd_kernel_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg3: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg5: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xi32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xi32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: f32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: memref<?xi8, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg23: i32, %arg24: i32, %arg25: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false]> : vector<26xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
  %c0_i64 = arith.constant 0 : i64
  %c0_i64_0 = arith.constant 0 : i64
  %c229376_i64 = arith.constant 229376 : i64
  %c131072_i64 = arith.constant 131072 : i64
  %c196608_i64 = arith.constant 196608 : i64
  %c98304_i64 = arith.constant 98304 : i64
  %c98816_i64 = arith.constant 98816 : i64
  %c66048_i64 = arith.constant 66048 : i64
  %c33280_i64 = arith.constant 33280 : i64
  %c512_i64 = arith.constant 512 : i64
  %c32768_i64 = arith.constant 32768 : i64
  %c65536_i64 = arith.constant 65536 : i64
  %c163840_i64 = arith.constant 163840 : i64
  %c0_i64_1 = arith.constant 0 : i64
  %c1023_i32 = arith.constant 1023 : i32
  %c127_i32 = arith.constant 127 : i32
  %cst = arith.constant 0.000000e+00 : bf16
  %c128 = arith.constant 128 : index
  %c0 = arith.constant 0 : index
  %c0_i32 = arith.constant 0 : i32
  %c12_i32 = arith.constant 12 : i32
  %c128_i32 = arith.constant 128 : i32
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
  %reinterpret_cast_2 = memref.reinterpret_cast %arg8 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
  %reinterpret_cast_3 = memref.reinterpret_cast %arg9 to offset: [0], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
  %reinterpret_cast_4 = memref.reinterpret_cast %arg9 to offset: [1], sizes: [1], strides: [1] : memref<?xi32, #hivm.address_space<gm>> to memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
  %4 = arith.index_cast %arg16 : i32 to index
  hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
  hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
  hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID3>]
  hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID4>]
  hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID5>]
  hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID6>]
  hivm.hir.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
  hivm.hir.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
  hivm.hir.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID2>]
  hivm.hir.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID3>]
  hivm.hir.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
  hivm.hir.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
  scf.for %arg26 = %3 to %1 step %c28_i32  : i32 {
    hivm.hir.set_ctrl false at ctrl[60]
    hivm.hir.set_ctrl true at ctrl[48]
    %5 = arith.remsi %arg26, %arg23 : i32
    %6 = hivm.hir.pointer_cast(%c0_i64_1) : memref<i32, #hivm.address_space<ssbuf>>
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
    %13 = memref.load %reinterpret_cast_2[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %14 = memref.load %reinterpret_cast_3[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %15 = memref.load %reinterpret_cast_4[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
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
      %30 = hivm.hir.multi_buffer_counter -> i64
      %c2_i64 = arith.constant 2 : i64
      %31 = arith.remui %30, %c2_i64 : i64
      %32 = arith.index_cast %31 : i64 to index
      %33 = arith.index_cast %32 : index to i1
      %c0_i64_5 = arith.constant 0 : i64
      %c1_i64 = arith.constant 1 : i64
      %34 = arith.select %33, %c0_i64_5, %c1_i64 : i64
      %35 = hivm.hir.pointer_cast(%c0_i64_1, %c163840_i64) : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %35 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %36 = arith.divsi %arg27, %c12_i32 : i32
      %37 = arith.muli %36, %c128_i32 : i32
      %38 = arith.addi %37, %c128_i32 : i32
      %39 = arith.minsi %38, %16 : i32
      %40 = arith.subi %39, %37 : i32
      %41 = arith.addi %37, %18 : i32
      %42 = arith.addi %41, %40 : i32
      %43 = arith.addi %42, %c127_i32 : i32
      %44 = arith.divsi %43, %c128_i32 : i32
      %45 = arith.minsi %44, %c1_i32 : i32
      %46 = arith.subi %41, %c1023_i32 : i32
      %47 = arith.maxsi %46, %c0_i32 : i32
      %48 = arith.divsi %47, %c128_i32 : i32
      %49 = arith.maxsi %45, %48 : i32
      %50 = arith.subi %44, %49 : i32
      %51 = arith.addi %45, %50 : i32
      %52 = arith.remsi %arg27, %c12_i32 : i32
      %53 = arith.divsi %52, %c3_i32 : i32
      %54 = arith.muli %52, %arg17 : i32
      %55 = arith.index_cast %54 : i32 to index
      %56 = arith.maxsi %37, %c0_i32 : i32
      %57 = arith.index_cast %56 : i32 to index
      %58 = affine.apply affine_map<()[s0, s1, s2, s3] -> (s0 * s1 + s2 + s3)>()[%57, %4, %24, %55]
      %reinterpret_cast_6 = memref.reinterpret_cast %arg5 to offset: [%58], sizes: [128, 128], strides: [%4, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
      %cast = memref.cast %35 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
      %59 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%29, %57]
      %60 = arith.maxsi %59, %c0 : index
      %61 = arith.minsi %60, %c128 : index
      %62 = arith.subi %c0_i32, %37 : i32
      %63 = arith.maxsi %62, %c0_i32 : i32
      %64 = arith.index_cast %63 : i32 to index
      %65 = arith.minsi %64, %61 : index
      %66 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%61, %65]
      %67 = arith.cmpi slt, %66, %c128 : index
      %subview = memref.subview %reinterpret_cast_6[0, 0] [%66, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
      %68 = affine.apply affine_map<()[s0, s1] -> ((s0 - s1 + 15) floordiv 16)>()[%61, %65]
      %69 = affine.apply affine_map<()[s0] -> (s0 floordiv 16)>()[%65]
      %70 = affine.apply affine_map<()[s0] -> (s0 mod 16)>()[%65]
      %subview_7 = memref.subview %35[0, %69, %70, 0] [8, %68, 16, 16] [1, 1, 1, 1] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_8 = memref.cast %subview_7 : memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
      scf.if %67 {
        hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
        %collapse_shape = memref.collapse_shape %35 [[0, 1, 2, 3]] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> into memref<16384xbf16, #hivm.address_space<cbuf>>
        hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<16384xbf16, #hivm.address_space<cbuf>>)
        hivm.hir.pipe_barrier[<PIPE_MTE2>]
      } {hivm.unlikely_condition}
      hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, %34]
      hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_8 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
      %71 = arith.subi %49, %45 : i32
      %72 = arith.muli %53, %arg19 : i32
      %73 = arith.index_cast %72 : i32 to index
      %74 = arith.muli %53, %arg21 : i32
      %75 = arith.index_cast %74 : i32 to index
      %76 = hivm.hir.pointer_cast(%c65536_i64) : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %77 = hivm.hir.pointer_cast(%c32768_i64) : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %77 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %76 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = -1 : index} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      %78 = hivm.hir.pointer_cast(%c512_i64) : memref<64x128xf32, #hivm.address_space<ub>>
      %79 = hivm.hir.pointer_cast(%c33280_i64) : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %79 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %78 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
      %80 = hivm.hir.pointer_cast(%c66048_i64) : memref<64x128xf32, #hivm.address_space<ub>>
      %81 = hivm.hir.pointer_cast(%c98816_i64) : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %81 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %80 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
      %82 = arith.addi %51, %c2_i32 : i32
      hivm.hir.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
      %83:2 = scf.for %arg28 = %c0_i32 to %82 step %c1_i32 iter_args(%arg29 = %c0_i32, %arg30 = %c0_i32) -> (i32, i32)  : i32 {
        %84 = hivm.hir.multi_buffer_counter -> i64
        %c2_i64_9 = arith.constant 2 : i64
        %85 = arith.remui %84, %c2_i64_9 : i64
        %86 = arith.index_cast %85 : i64 to index
        %87 = arith.index_cast %86 : index to i1
        %c2_i64_10 = arith.constant 2 : i64
        %c3_i64 = arith.constant 3 : i64
        %88 = arith.select %87, %c2_i64_10, %c3_i64 : i64
        %89 = arith.index_cast %86 : index to i1
        %c5_i64 = arith.constant 5 : i64
        %c6_i64 = arith.constant 6 : i64
        %90 = arith.select %89, %c5_i64, %c6_i64 : i64
        %91 = arith.index_cast %86 : index to i1
        %c0_i64_11 = arith.constant 0 : i64
        %c1_i64_12 = arith.constant 1 : i64
        %92 = arith.select %91, %c0_i64_11, %c1_i64_12 : i64
        %93 = arith.index_cast %86 : index to i1
        %c3_i64_13 = arith.constant 3 : i64
        %c4_i64_14 = arith.constant 4 : i64
        %94 = arith.select %93, %c3_i64_13, %c4_i64_14 : i64
        %95 = hivm.hir.pointer_cast(%c65536_i64, %c196608_i64) : memref<8x8x16x16xf32, #hivm.address_space<cc>>
        annotation.mark %95 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
        %96 = hivm.hir.pointer_cast(%c131072_i64, %c229376_i64) : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %96 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
        %97 = hivm.hir.pointer_cast(%c0_i64_1, %c131072_i64) : memref<8x8x16x16xf32, #hivm.address_space<cc>>
        annotation.mark %97 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xf32, #hivm.address_space<cc>>
        %98 = hivm.hir.pointer_cast(%c98304_i64, %c196608_i64) : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
        annotation.mark %98 {hivm.multi_buffer = 2 : i32} : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        %99 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %99 {memref_ext.volatile} : i32
        %100 = arith.cmpi slt, %99, %c2_i32 : i32
        %101 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %101 {memref_ext.volatile} : i32
        %102 = arith.cmpi slt, %101, %c2_i32 : i32
        %103 = arith.andi %100, %102 : i1
        %104 = arith.cmpi slt, %arg29, %51 : i32
        %105 = arith.andi %103, %104 : i1
        %106 = scf.if %105 -> (i32) {
          %125 = arith.remsi %arg29, %c2_i32 : i32
          %126 = arith.cmpi eq, %125, %c0_i32 : i32
          %127 = arith.cmpi sge, %arg29, %45 : i32
          %128 = arith.extui %127 : i1 to i32
          %129 = arith.muli %128, %71 : i32
          %130 = arith.addi %arg29, %129 : i32
          %131 = arith.muli %130, %c128_i32 : i32
          %132 = arith.maxsi %131, %c0_i32 : i32
          %133 = arith.index_cast %132 : i32 to index
          %134 = arith.index_cast %arg18 : i32 to index
          %135 = affine.apply affine_map<()[s0, s1, s2, s3] -> (s0 * s1 + s2 + s3)>()[%133, %134, %26, %73]
          %136 = arith.index_cast %17 : i32 to index
          %reinterpret_cast_15 = memref.reinterpret_cast %arg6 to offset: [%135], sizes: [128, 128], strides: [%134, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %cast_16 = memref.cast %98 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
          %137 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%136, %133]
          %138 = arith.maxsi %137, %c0 : index
          %139 = arith.minsi %138, %c128 : index
          %140 = arith.subi %c0_i32, %131 : i32
          %141 = arith.maxsi %140, %c0_i32 : i32
          %142 = arith.index_cast %141 : i32 to index
          %143 = arith.minsi %142, %139 : index
          %144 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%139, %143]
          %145 = arith.cmpi slt, %144, %c128 : index
          %subview_17 = memref.subview %reinterpret_cast_15[0, 0] [%144, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %146 = affine.apply affine_map<()[s0, s1] -> ((s0 - s1 + 15) floordiv 16)>()[%139, %143]
          %147 = affine.apply affine_map<()[s0] -> (s0 floordiv 16)>()[%143]
          %148 = affine.apply affine_map<()[s0] -> (s0 mod 16)>()[%143]
          %subview_18 = memref.subview %98[0, %147, %148, 0] [8, %146, 16, 16] [1, 1, 1, 1] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
          %cast_19 = memref.cast %subview_18 : memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
          scf.if %145 {
            hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
            %collapse_shape = memref.collapse_shape %98 [[0, 1, 2, 3]] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> into memref<16384xbf16, #hivm.address_space<cbuf>>
            hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
            hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<16384xbf16, #hivm.address_space<cbuf>>)
            hivm.hir.pipe_barrier[<PIPE_MTE2>]
          } {hivm.unlikely_condition}
          hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, %94]
          hivm.hir.nd2nz {dst_continuous} ins(%subview_17 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_19 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
          hivm.hir.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
          %cast_20 = memref.cast %97 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
          hivm.hir.wait_flag[<PIPE_FIX>, <PIPE_M>, %92]
          %c-1_i64 = arith.constant -1 : i64
          hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, normalized_in_L0C} ins(%cast, %cast_16, %true, %c128, %c128, %c128 : memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_20 : memref<?x?x?x?xf32, #hivm.address_space<cc>>) sync_related_args(%c-1_i64, %c0_i64_0, %c-1_i64, %94, %c-1_i64, %c-1_i64, %c-1_i64 : i64, i64, i64, i64, i64, i64, i64)
          hivm.hir.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          hivm.hir.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          scf.if %126 {
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
            hivm.hir.pipe_barrier[<PIPE_FIX>]
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%97 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%78 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 2
          } else {
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
            hivm.hir.pipe_barrier[<PIPE_FIX>]
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%97 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%79 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 5
          }
          hivm.hir.set_flag[<PIPE_FIX>, <PIPE_M>, %92]
          %149 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %149 {memref_ext.volatile} : i32
          %150 = arith.addi %149, %c1_i32 : i32
          memref.store %150, %6[] : memref<i32, #hivm.address_space<ssbuf>>
          %151 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %151 {memref_ext.volatile} : i32
          %152 = arith.addi %151, %c1_i32 : i32
          memref.store %152, %7[] : memref<i32, #hivm.address_space<ssbuf>>
          %153 = arith.addi %arg29, %c1_i32 : i32
          scf.yield %153 : i32
        } else {
          scf.yield %arg29 : i32
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 4 : i32}
        %107 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %107 {memref_ext.volatile} : i32
        %108 = arith.cmpi sgt, %107, %c0_i32 : i32
        %109 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %109 {memref_ext.volatile} : i32
        %110 = arith.cmpi sgt, %109, %c0_i32 : i32
        %111 = arith.andi %108, %110 : i1
        %112 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %112 {memref_ext.volatile} : i32
        %113 = arith.cmpi slt, %112, %c2_i32 : i32
        %114 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %114 {memref_ext.volatile} : i32
        %115 = arith.cmpi slt, %114, %c2_i32 : i32
        %116 = arith.andi %113, %115 : i1
        %117 = arith.andi %111, %116 : i1
        %118 = arith.cmpi sge, %arg29, %51 : i32
        %119 = arith.cmpi sge, %arg29, %c2_i32 : i32
        %120 = arith.ori %118, %119 : i1
        %121 = arith.cmpi slt, %arg30, %51 : i32
        %122 = arith.andi %117, %120 : i1
        %123 = arith.andi %122, %121 : i1
        %124 = scf.if %123 -> (i32) {
          %125 = arith.remsi %arg30, %c2_i32 : i32
          %126 = arith.cmpi eq, %125, %c0_i32 : i32
          %127 = arith.cmpi sge, %arg30, %45 : i32
          %128 = arith.extui %127 : i1 to i32
          %129 = arith.muli %128, %71 : i32
          %130 = arith.addi %arg30, %129 : i32
          %131 = arith.muli %130, %c128_i32 : i32
          %132 = arith.maxsi %131, %c0_i32 : i32
          %133 = arith.index_cast %132 : i32 to index
          %134 = arith.index_cast %17 : i32 to index
          %135 = arith.subi %c0_i32, %131 : i32
          %136 = arith.maxsi %135, %c0_i32 : i32
          %137 = arith.index_cast %136 : i32 to index
          %138 = arith.index_cast %arg20 : i32 to index
          %139 = affine.apply affine_map<()[s0, s1, s2, s3] -> (s0 * s1 + s2 + s3)>()[%133, %138, %28, %75]
          %reinterpret_cast_15 = memref.reinterpret_cast %arg7 to offset: [%139], sizes: [128, 128], strides: [%138, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %cast_16 = memref.cast %96 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
          %140 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%134, %133]
          %141 = arith.maxsi %140, %c0 : index
          %142 = arith.minsi %141, %c128 : index
          %143 = arith.minsi %137, %142 : index
          %144 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%142, %143]
          %145 = arith.cmpi slt, %144, %c128 : index
          %subview_17 = memref.subview %reinterpret_cast_15[0, 0] [%144, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %146 = affine.apply affine_map<()[s0, s1] -> ((s0 - s1 + 15) floordiv 16)>()[%142, %143]
          %147 = affine.apply affine_map<()[s0] -> (s0 floordiv 16)>()[%143]
          %148 = affine.apply affine_map<()[s0] -> (s0 mod 16)>()[%143]
          %subview_18 = memref.subview %96[0, %147, %148, 0] [8, %146, 16, 16] [1, 1, 1, 1] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
          %cast_19 = memref.cast %subview_18 : memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
          scf.if %145 {
            hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
            %collapse_shape = memref.collapse_shape %96 [[0, 1, 2, 3]] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> into memref<16384xbf16, #hivm.address_space<cbuf>>
            hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
            hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<16384xbf16, #hivm.address_space<cbuf>>)
            hivm.hir.pipe_barrier[<PIPE_MTE2>]
          } {hivm.unlikely_condition}
          hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, %90]
          hivm.hir.nd2nz {dst_continuous} ins(%subview_17 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_19 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
          hivm.hir.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
          %149 = arith.select %126, %76, %77 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
          scf.if %126 {
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
          } else {
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
          }
          %cast_20 = memref.cast %95 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
          hivm.hir.wait_flag[<PIPE_FIX>, <PIPE_M>, %88]
          %c-1_i64 = arith.constant -1 : i64
          hivm.hir.mmadL1 {already_set_real_mkn, normalized_in_L0C} ins(%149, %cast_16, %true, %c128, %c128, %c128 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_20 : memref<?x?x?x?xf32, #hivm.address_space<cc>>) sync_related_args(%c-1_i64, %c0_i64, %c-1_i64, %90, %c-1_i64, %c-1_i64, %c-1_i64 : i64, i64, i64, i64, i64, i64, i64)
          hivm.hir.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          hivm.hir.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          scf.if %126 {
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
            hivm.hir.pipe_barrier[<PIPE_FIX>]
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%95 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%80 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 3
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
          } else {
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
            hivm.hir.pipe_barrier[<PIPE_FIX>]
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%95 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%81 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 6
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
          }
          hivm.hir.set_flag[<PIPE_FIX>, <PIPE_M>, %88]
          %150 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %150 {memref_ext.volatile} : i32
          %151 = arith.subi %150, %c1_i32 : i32
          memref.store %151, %10[] : memref<i32, #hivm.address_space<ssbuf>>
          %152 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %152 {memref_ext.volatile} : i32
          %153 = arith.subi %152, %c1_i32 : i32
          memref.store %153, %11[] : memref<i32, #hivm.address_space<ssbuf>>
          %154 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %154 {memref_ext.volatile} : i32
          %155 = arith.addi %154, %c1_i32 : i32
          memref.store %155, %8[] : memref<i32, #hivm.address_space<ssbuf>>
          %156 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %156 {memref_ext.volatile} : i32
          %157 = arith.addi %156, %c1_i32 : i32
          memref.store %157, %9[] : memref<i32, #hivm.address_space<ssbuf>>
          %158 = arith.addi %arg30, %c1_i32 : i32
          scf.yield %158 : i32
        } else {
          scf.yield %arg30 : i32
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 6 : i32}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        scf.yield %106, %124 : i32, i32
      } {fixpipe_for_mmad_result_already_inserted = true}
      hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, %34]
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
    }
    hivm.hir.set_ctrl true at ctrl[60]
  } {autoblockify.subloop}
  hivm.hir.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
  hivm.hir.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
  hivm.hir.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
  hivm.hir.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
  hivm.hir.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID2>]
  hivm.hir.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID3>]
  hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
  hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
  hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID3>]
  hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID4>]
  hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID5>]
  hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID6>]
  hivm.hir.pipe_barrier[<PIPE_ALL>]
  return
}
