func.func @_swa_fwd_kernel_mix_aic(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg3: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg5: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xi32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xi32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg10: f32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: memref<?xi8, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg23: i32, %arg24: i32, %arg25: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false]> : vector<26xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIC>, hivm.part_of_mix, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "mix", parallel_mode = "simd"} {
  %c0_i64 = arith.constant 0 : i64
  %c0_i64_0 = arith.constant 0 : i64
  %c131072_i64 = arith.constant 131072 : i64
  %c425984_i64 = arith.constant 425984 : i64
  %c49664_i64 = arith.constant 49664 : i64
  %c165120_i64 = arith.constant 165120 : i64
  %c99584_i64 = arith.constant 99584 : i64
  %c163840_i64 = arith.constant 163840 : i64
  %c294912_i64 = arith.constant 294912 : i64
  %c32768_i64 = arith.constant 32768 : i64
  %c98304_i64 = arith.constant 98304 : i64
  %c0_i64_1 = arith.constant 0 : i64
  %c4_i32 = arith.constant 4 : i32
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
  %c12_i64 = arith.constant 12 : i64
  %c1036_i64 = arith.constant 1036 : i64
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
  hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_FIX>, <EVENT_ID0>]
  hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_FIX>, <EVENT_ID1>]
  hivm.hir.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
  hivm.hir.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
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
    %12 = hivm.hir.pointer_cast(%c12_i64) : memref<i32, #hivm.address_space<ssbuf>>
    %13 = hivm.hir.pointer_cast(%c1036_i64) : memref<i32, #hivm.address_space<ssbuf>>
    memref.store %c0_i32, %12[] : memref<i32, #hivm.address_space<ssbuf>>
    memref.store %c0_i32, %13[] : memref<i32, #hivm.address_space<ssbuf>>
    %14 = memref.load %reinterpret_cast[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %15 = memref.load %reinterpret_cast_2[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %16 = memref.load %reinterpret_cast_3[%c0] : memref<1xi32, strided<[1]>, #hivm.address_space<gm>>
    %17 = memref.load %reinterpret_cast_4[%c0] : memref<1xi32, strided<[1], offset: 1>, #hivm.address_space<gm>>
    %18 = arith.subi %15, %14 : i32
    %19 = arith.subi %17, %16 : i32
    %20 = arith.subi %19, %18 : i32
    %21 = arith.addi %18, %c127_i32 : i32
    %22 = arith.divsi %21, %c128_i32 : i32
    %23 = arith.muli %22, %c12_i32 : i32
    %24 = arith.remsi %5, %arg23 : i32
    %25 = arith.muli %14, %arg16 : i32
    %26 = arith.index_cast %25 : i32 to index
    %27 = arith.muli %16, %arg18 : i32
    %28 = arith.index_cast %27 : i32 to index
    %29 = arith.muli %16, %arg20 : i32
    %30 = arith.index_cast %29 : i32 to index
    %31 = arith.index_cast %18 : i32 to index
    scf.for %arg27 = %24 to %23 step %arg23  : i32 {
      %32 = arith.divsi %arg27, %c12_i32 : i32
      %33 = arith.muli %32, %c128_i32 : i32
      %34 = arith.addi %33, %c128_i32 : i32
      %35 = arith.minsi %34, %18 : i32
      %36 = arith.subi %35, %33 : i32
      %37 = arith.addi %33, %20 : i32
      %38 = arith.addi %37, %36 : i32
      %39 = arith.addi %38, %c255_i32 : i32
      %40 = arith.divsi %39, %c256_i32 : i32
      %41 = arith.minsi %40, %c1_i32 : i32
      %42 = arith.subi %37, %c1023_i32 : i32
      %43 = arith.maxsi %42, %c0_i32 : i32
      %44 = arith.divsi %43, %c256_i32 : i32
      %45 = arith.maxsi %41, %44 : i32
      %46 = arith.subi %40, %45 : i32
      %47 = arith.addi %41, %46 : i32
      %48 = arith.remsi %arg27, %c12_i32 : i32
      %49 = arith.divsi %48, %c3_i32 : i32
      %50 = arith.muli %48, %arg17 : i32
      %51 = arith.index_cast %50 : i32 to index
      %52 = arith.maxsi %33, %c0_i32 : i32
      %53 = arith.index_cast %52 : i32 to index
      %54 = affine.apply affine_map<()[s0, s1, s2, s3] -> (s0 * s1 + s2 + s3)>()[%53, %4, %26, %51]
      %reinterpret_cast_5 = memref.reinterpret_cast %arg5 to offset: [%54], sizes: [128, 128], strides: [%4, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
      %55 = hivm.hir.pointer_cast(%c0_i64_1) : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>>
      %cast = memref.cast %55 : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
      %56 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%31, %53]
      %57 = arith.maxsi %56, %c0 : index
      %58 = arith.minsi %57, %c128 : index
      %59 = arith.subi %c0_i32, %33 : i32
      %60 = arith.maxsi %59, %c0_i32 : i32
      %61 = arith.index_cast %60 : i32 to index
      %62 = arith.minsi %61, %58 : index
      %63 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%58, %62]
      %64 = arith.cmpi slt, %63, %c128 : index
      %subview = memref.subview %reinterpret_cast_5[0, 0] [%63, 128] [1, 1] : memref<128x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
      %65 = affine.apply affine_map<()[s0, s1] -> ((s0 - s1 + 15) floordiv 16)>()[%58, %62]
      %66 = affine.apply affine_map<()[s0] -> (s0 floordiv 16)>()[%62]
      %67 = affine.apply affine_map<()[s0] -> (s0 mod 16)>()[%62]
      %subview_6 = memref.subview %55[0, %66, %67, 0] [8, %65, 16, 16] [1, 1, 1, 1] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
      %cast_7 = memref.cast %subview_6 : memref<8x?x16x16xbf16, strided<[2048, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
      scf.if %64 {
        %collapse_shape = memref.collapse_shape %55 [[0, 1, 2, 3]] : memref<8x8x16x16xbf16, #hivm.address_space<cbuf>> into memref<16384xbf16, #hivm.address_space<cbuf>>
        hivm.hir.pipe_barrier[<PIPE_MTE2>]
        hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<16384xbf16, #hivm.address_space<cbuf>>)
        hivm.hir.pipe_barrier[<PIPE_MTE2>]
      } {hivm.unlikely_condition}
      hivm.hir.pipe_barrier[<PIPE_MTE2>]
      hivm.hir.nd2nz {dst_continuous} ins(%subview : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_7 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
      hivm.hir.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
      %68 = arith.subi %45, %41 : i32
      %69 = arith.muli %49, %arg19 : i32
      %70 = arith.index_cast %69 : i32 to index
      %71 = arith.muli %49, %arg21 : i32
      %72 = arith.index_cast %71 : i32 to index
      %73 = hivm.hir.pointer_cast(%c98304_i64) : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
      %74 = hivm.hir.pointer_cast(%c32768_i64) : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %74 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, hivm.tiling_dim = -1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %73 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, hivm.tiling_dim = -1 : index} : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
      hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
      %75 = hivm.hir.pointer_cast(%c294912_i64) : memref<128x256xf32, #hivm.address_space<cbuf>>
      %76 = hivm.hir.pointer_cast(%c163840_i64) : memref<128x256xf32, #hivm.address_space<cbuf>>
      %77 = hivm.hir.pointer_cast(%c99584_i64) : memref<64x256xf32, #hivm.address_space<ub>>
      annotation.mark %77 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, hivm.tiling_dim = 0 : index} : memref<64x256xf32, #hivm.address_space<ub>>
      %78 = hivm.hir.pointer_cast(%c165120_i64) : memref<64x128xf32, #hivm.address_space<ub>>
      %79 = hivm.hir.pointer_cast(%c49664_i64) : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %79 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
      annotation.mark %78 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, hivm.tiling_dim = 0 : index, tiledAlloc} : memref<64x128xf32, #hivm.address_space<ub>>
      %80 = arith.addi %47, %c4_i32 : i32
      hivm.hir.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
      %false = arith.constant false
      %true_8 = arith.constant true
      %81:4 = scf.for %arg28 = %c0_i32 to %80 step %c1_i32 iter_args(%arg29 = %c0_i32, %arg30 = %c0_i32, %arg31 = %false, %arg32 = %false) -> (i32, i32, i1, i1)  : i32 {
        hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        %82 = memref.load %6[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %82 {memref_ext.volatile} : i32
        %83 = arith.cmpi slt, %82, %c2_i32 : i32
        %84 = memref.load %7[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %84 {memref_ext.volatile} : i32
        %85 = arith.cmpi slt, %84, %c2_i32 : i32
        %86 = arith.andi %83, %85 : i1
        %87 = arith.cmpi slt, %arg29, %47 : i32
        %88 = arith.andi %86, %87 : i1
        %89 = memref.load %12[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %89 {memref_ext.volatile} : i32
        %90 = memref.load %13[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %90 {memref_ext.volatile} : i32
        %91 = arith.cmpi slt, %89, %c1_i32 : i32
        %92 = arith.cmpi slt, %90, %c1_i32 : i32
        %93 = arith.andi %91, %92 : i1
        %94 = arith.andi %88, %93 : i1
        %95:3 = scf.if %94 -> (i32, i1, i1) {
          scf.if %arg31 {
            hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
          }
          scf.if %arg32 {
            hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
          }
          %114 = arith.remsi %arg29, %c2_i32 : i32
          %115 = arith.cmpi eq, %114, %c0_i32 : i32
          %116 = arith.cmpi sge, %arg29, %41 : i32
          %117 = arith.extui %116 : i1 to i32
          %118 = arith.muli %117, %68 : i32
          %119 = arith.addi %arg29, %118 : i32
          %120 = arith.muli %119, %c256_i32 : i32
          %121 = arith.maxsi %120, %c0_i32 : i32
          %122 = arith.index_cast %121 : i32 to index
          %123 = arith.index_cast %arg18 : i32 to index
          %124 = affine.apply affine_map<()[s0, s1, s2, s3] -> (s0 * s1 + s2 + s3)>()[%122, %123, %28, %70]
          %125 = arith.index_cast %19 : i32 to index
          %reinterpret_cast_9 = memref.reinterpret_cast %arg6 to offset: [%124], sizes: [256, 128], strides: [%123, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %126 = hivm.hir.pointer_cast(%c425984_i64) : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>>
          %cast_10 = memref.cast %126 : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
          %127 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%125, %122]
          %128 = arith.maxsi %127, %c0 : index
          %129 = arith.minsi %128, %c256 : index
          %130 = arith.subi %c0_i32, %120 : i32
          %131 = arith.maxsi %130, %c0_i32 : i32
          %132 = arith.index_cast %131 : i32 to index
          %133 = arith.minsi %132, %129 : index
          %134 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%129, %133]
          %135 = arith.cmpi slt, %134, %c256 : index
          %subview_11 = memref.subview %reinterpret_cast_9[0, 0] [%134, 128] [1, 1] : memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %136 = affine.apply affine_map<()[s0, s1] -> ((s0 - s1 + 15) floordiv 16)>()[%129, %133]
          %137 = affine.apply affine_map<()[s0] -> (s0 floordiv 16)>()[%133]
          %138 = affine.apply affine_map<()[s0] -> (s0 mod 16)>()[%133]
          %subview_12 = memref.subview %126[0, %137, %138, 0] [8, %136, 16, 16] [1, 1, 1, 1] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
          %cast_13 = memref.cast %subview_12 : memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
          scf.if %135 {
            %collapse_shape = memref.collapse_shape %126 [[0, 1, 2, 3]] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> into memref<32768xbf16, #hivm.address_space<cbuf>>
            hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<32768xbf16, #hivm.address_space<cbuf>>)
            hivm.hir.pipe_barrier[<PIPE_MTE2>]
          } {hivm.unlikely_condition}
          hivm.hir.nd2nz {dst_continuous} ins(%subview_11 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_13 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
          hivm.hir.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
          %139 = hivm.hir.pointer_cast(%c0_i64_1) : memref<16x8x16x16xf32, #hivm.address_space<cc>>
          %cast_14 = memref.cast %139 : memref<16x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
          hivm.hir.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
          %c-1_i64 = arith.constant -1 : i64
          hivm.hir.mmadL1 {already_set_real_mkn, b_transpose, normalized_in_L0C} ins(%cast, %cast_10, %true, %c128, %c128, %c256 : memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_14 : memref<?x?x?x?xf32, #hivm.address_space<cc>>) sync_related_args(%c-1_i64, %c0_i64_0, %c-1_i64, %c-1_i64, %c-1_i64, %c-1_i64, %c-1_i64 : i64, i64, i64, i64, i64, i64, i64)
          hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
          hivm.hir.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_FIX>, <EVENT_ID1>]
          hivm.hir.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          scf.if %115 {
            hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_FIX>, <EVENT_ID0>]
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%139 : memref<16x8x16x16xf32, #hivm.address_space<cc>>) outs(%75 : memref<128x256xf32, #hivm.address_space<cbuf>>)
          } else {
            hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_FIX>, <EVENT_ID0>]
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%139 : memref<16x8x16x16xf32, #hivm.address_space<cc>>) outs(%76 : memref<128x256xf32, #hivm.address_space<cbuf>>)
          }
          hivm.hir.set_flag[<PIPE_FIX>, <PIPE_MTE1>, <EVENT_ID0>]
          hivm.hir.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
          hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_MTE1>] flag = 2
          hivm.hir.wait_flag[<PIPE_FIX>, <PIPE_MTE1>, <EVENT_ID0>]
          scf.if %115 {
            hivm.hir.l12ub {dual_dst_mode = #hivm.fixpipe_dual_dst_mode<ROW_SPLIT>} ins(%75 : memref<128x256xf32, #hivm.address_space<cbuf>>) outs(%77 : memref<64x256xf32, #hivm.address_space<ub>>)
            hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_FIX>, <EVENT_ID0>]
          } else {
            hivm.hir.l12ub {dual_dst_mode = #hivm.fixpipe_dual_dst_mode<ROW_SPLIT>} ins(%76 : memref<128x256xf32, #hivm.address_space<cbuf>>) outs(%77 : memref<64x256xf32, #hivm.address_space<ub>>)
            hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_FIX>, <EVENT_ID0>]
          }
          hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_FIX>, <EVENT_ID1>]
          hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_V>] flag = 2
          %140 = arith.addi %89, %c1_i32 : i32
          %141 = arith.addi %90, %c1_i32 : i32
          memref.store %140, %12[] : memref<i32, #hivm.address_space<ssbuf>>
          memref.store %141, %13[] : memref<i32, #hivm.address_space<ssbuf>>
          %142 = arith.addi %arg29, %c1_i32 : i32
          scf.yield %142, %true_8, %false : i32, i1, i1
        } else {
          scf.yield %arg29, %arg31, %arg32 : i32, i1, i1
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 4 : i32}
        %96 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %96 {memref_ext.volatile} : i32
        %97 = arith.cmpi sgt, %96, %c0_i32 : i32
        %98 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %98 {memref_ext.volatile} : i32
        %99 = arith.cmpi sgt, %98, %c0_i32 : i32
        %100 = arith.andi %97, %99 : i1
        %101 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %101 {memref_ext.volatile} : i32
        %102 = arith.cmpi slt, %101, %c2_i32 : i32
        %103 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
        annotation.mark %103 {memref_ext.volatile} : i32
        %104 = arith.cmpi slt, %103, %c2_i32 : i32
        %105 = arith.andi %102, %104 : i1
        %106 = arith.andi %100, %105 : i1
        %107 = arith.cmpi sge, %arg29, %47 : i32
        %108 = arith.cmpi sge, %arg29, %c2_i32 : i32
        %109 = arith.ori %107, %108 : i1
        %110 = arith.cmpi slt, %arg30, %47 : i32
        %111 = arith.andi %106, %109 : i1
        %112 = arith.andi %111, %110 : i1
        %113:3 = scf.if %112 -> (i32, i1, i1) {
          scf.if %95#1 {
            hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
          }
          scf.if %95#2 {
            hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
          }
          %114 = arith.remsi %arg30, %c2_i32 : i32
          %115 = arith.cmpi eq, %114, %c0_i32 : i32
          %116 = arith.cmpi sge, %arg30, %41 : i32
          %117 = arith.extui %116 : i1 to i32
          %118 = arith.muli %117, %68 : i32
          %119 = arith.addi %arg30, %118 : i32
          %120 = arith.muli %119, %c256_i32 : i32
          %121 = arith.maxsi %120, %c0_i32 : i32
          %122 = arith.index_cast %121 : i32 to index
          %123 = arith.index_cast %19 : i32 to index
          %124 = arith.subi %c0_i32, %120 : i32
          %125 = arith.maxsi %124, %c0_i32 : i32
          %126 = arith.index_cast %125 : i32 to index
          %127 = arith.index_cast %arg20 : i32 to index
          %128 = affine.apply affine_map<()[s0, s1, s2, s3] -> (s0 * s1 + s2 + s3)>()[%122, %127, %30, %72]
          %reinterpret_cast_9 = memref.reinterpret_cast %arg7 to offset: [%128], sizes: [256, 128], strides: [%127, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %129 = hivm.hir.pointer_cast(%c425984_i64) : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>>
          %cast_10 = memref.cast %129 : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>
          %130 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%123, %122]
          %131 = arith.maxsi %130, %c0 : index
          %132 = arith.minsi %131, %c256 : index
          %133 = arith.minsi %126, %132 : index
          %134 = affine.apply affine_map<()[s0, s1] -> (s0 - s1)>()[%132, %133]
          %135 = arith.cmpi slt, %134, %c256 : index
          %subview_11 = memref.subview %reinterpret_cast_9[0, 0] [%134, 128] [1, 1] : memref<256x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %136 = affine.apply affine_map<()[s0, s1] -> ((s0 - s1 + 15) floordiv 16)>()[%132, %133]
          %137 = affine.apply affine_map<()[s0] -> (s0 floordiv 16)>()[%133]
          %138 = affine.apply affine_map<()[s0] -> (s0 mod 16)>()[%133]
          %subview_12 = memref.subview %129[0, %137, %138, 0] [8, %136, 16, 16] [1, 1, 1, 1] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> to memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>>
          %cast_13 = memref.cast %subview_12 : memref<8x?x16x16xbf16, strided<[4096, 256, 16, 1], offset: ?>, #hivm.address_space<cbuf>> to memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>
          scf.if %135 {
            %collapse_shape = memref.collapse_shape %129 [[0, 1, 2, 3]] : memref<8x16x16x16xbf16, #hivm.address_space<cbuf>> into memref<32768xbf16, #hivm.address_space<cbuf>>
            hivm.hir.vbrc ins(%cst : bf16) outs(%collapse_shape : memref<32768xbf16, #hivm.address_space<cbuf>>)
            hivm.hir.pipe_barrier[<PIPE_MTE2>]
          } {hivm.unlikely_condition}
          hivm.hir.nd2nz {dst_continuous} ins(%subview_11 : memref<?x128xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%cast_13 : memref<?x?x?x?xbf16, strided<[?, ?, ?, 1], offset: ?>, #hivm.address_space<cbuf>>)
          hivm.hir.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
          %139 = arith.select %115, %73, %74 : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>
          scf.if %115 {
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
          } else {
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
          }
          %140 = hivm.hir.pointer_cast(%c131072_i64) : memref<8x8x16x16xf32, #hivm.address_space<cc>>
          %cast_14 = memref.cast %140 : memref<8x8x16x16xf32, #hivm.address_space<cc>> to memref<?x?x?x?xf32, #hivm.address_space<cc>>
          hivm.hir.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
          %c-1_i64 = arith.constant -1 : i64
          hivm.hir.mmadL1 {already_set_real_mkn, normalized_in_L0C} ins(%139, %cast_10, %true, %c128, %c256, %c128 : memref<16x8x16x16xbf16, #hivm.address_space<cbuf>>, memref<?x?x?x?xbf16, #hivm.address_space<cbuf>>, i1, index, index, index) outs(%cast_14 : memref<?x?x?x?xf32, #hivm.address_space<cc>>) sync_related_args(%c-1_i64, %c0_i64, %c-1_i64, %c-1_i64, %c-1_i64, %c-1_i64, %c-1_i64 : i64, i64, i64, i64, i64, i64, i64)
          hivm.hir.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
          hivm.hir.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          hivm.hir.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          scf.if %115 {
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%140 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%78 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 3
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 1
          } else {
            hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
            hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>} ins(%140 : memref<8x8x16x16xf32, #hivm.address_space<cc>>) outs(%79 : memref<64x128xf32, #hivm.address_space<ub>>) dual_dst_mode = <ROW_SPLIT>
            hivm.hir.sync_block_set[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 6
            hivm.hir.sync_block_set[<CUBE>, <PIPE_MTE1>, <PIPE_MTE3>] flag = 4
          }
          hivm.hir.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
          %141 = memref.load %10[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %141 {memref_ext.volatile} : i32
          %142 = arith.subi %141, %c1_i32 : i32
          memref.store %142, %10[] : memref<i32, #hivm.address_space<ssbuf>>
          %143 = memref.load %11[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %143 {memref_ext.volatile} : i32
          %144 = arith.subi %143, %c1_i32 : i32
          memref.store %144, %11[] : memref<i32, #hivm.address_space<ssbuf>>
          %145 = memref.load %8[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %145 {memref_ext.volatile} : i32
          %146 = arith.addi %145, %c1_i32 : i32
          memref.store %146, %8[] : memref<i32, #hivm.address_space<ssbuf>>
          %147 = memref.load %9[] : memref<i32, #hivm.address_space<ssbuf>>
          annotation.mark %147 {memref_ext.volatile} : i32
          %148 = arith.addi %147, %c1_i32 : i32
          memref.store %148, %9[] : memref<i32, #hivm.address_space<ssbuf>>
          %149 = arith.addi %arg30, %c1_i32 : i32
          scf.yield %149, %false, %true_8 : i32, i1, i1
        } else {
          scf.yield %arg30, %95#1, %95#2 : i32, i1, i1
        } {hivm.matmul_limited_in_cube, ssbuffer.if = 6 : i32}
        hivm.hir.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        scf.yield %95#0, %113#0, %113#1, %113#2 : i32, i32, i1, i1
      } {fixpipe_for_mmad_result_already_inserted = true}
      scf.if %81#2 {
        hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      }
      scf.if %81#3 {
        hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      }
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.sync_block_wait[<CUBE>, <PIPE_V>, <PIPE_MTE1>] flag = 2
    }
    hivm.hir.set_ctrl true at ctrl[60]
  } {autoblockify.subloop}
  hivm.hir.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
  hivm.hir.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
  hivm.hir.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
  hivm.hir.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
  hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_FIX>, <EVENT_ID0>]
  hivm.hir.wait_flag[<PIPE_MTE1>, <PIPE_FIX>, <EVENT_ID1>]
  hivm.hir.pipe_barrier[<PIPE_ALL>]
  return
}

