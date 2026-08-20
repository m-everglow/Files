// -----// IR Dump After mlir::triton::AddControlFlowConditionPass (add-control-flow-condition) //----- //
module attributes {npu.module_core_type = #npu.module_core_type<MIX>, npu.only_enable_core0, ssbuffer.inter_core_buf_count = 1 : i32, ssbuffer.intra_buf_count = 2 : i32, ssbuffer.load_store_buf_count = 1 : i32} {
  func.func @sdpa_kernel(%arg0: memref<?xbf16>, %arg1: memref<?xbf16>, %arg2: memref<?xbf16>, %arg3: memref<?xi8>, %arg4: memref<?xbf16>, %arg5: f32, %arg6: i32, %arg7: i32, %arg8: i32) attributes {func_core_type = #npu.func_core_type<MIX>} {
    %c1024_i64 = arith.constant 1024 : i64
    %0 = npu.get_sub_block_idx() : i64
    %1 = arith.muli %0, %c1024_i64 : i64
    %c4_i64 = arith.constant 4 : i64
    %2 = arith.addi %c4_i64, %1 : i64
    %3 = llvm.inttoptr %2 : i64 to !llvm.ptr<11>
    %c1024_i64_0 = arith.constant 1024 : i64
    %4 = npu.get_sub_block_idx() : i64
    %5 = arith.muli %4, %c1024_i64_0 : i64
    %c0_i64 = arith.constant 0 : i64
    %6 = arith.addi %c0_i64, %5 : i64
    %7 = llvm.inttoptr %6 : i64 to !llvm.ptr<11>
    %c20_i64 = arith.constant 20 : i64
    %8 = arith.addi %c20_i64, %5 : i64
    %9 = llvm.inttoptr %8 : i64 to !llvm.ptr<11>
    %c1024_i64_1 = arith.constant 1024 : i64
    %10 = npu.get_sub_block_idx() : i64
    %11 = arith.muli %10, %c1024_i64_1 : i64
    %c12_i64 = arith.constant 12 : i64
    %12 = arith.addi %c12_i64, %11 : i64
    %13 = llvm.inttoptr %12 : i64 to !llvm.ptr<11>
    %c1024_i64_2 = arith.constant 1024 : i64
    %14 = npu.get_sub_block_idx() : i64
    %15 = arith.muli %14, %c1024_i64_2 : i64
    %c16_i64 = arith.constant 16 : i64
    %16 = arith.addi %c16_i64, %15 : i64
    %17 = llvm.inttoptr %16 : i64 to !llvm.ptr<11>
    %18 = llvm.mlir.constant(0 : i32) : i32
    %19 = llvm.mlir.constant(0 : i64) : i64
    %20 = llvm.mlir.constant(1024 : i64) : i64
    %21 = llvm.inttoptr %19 : i64 to !llvm.ptr<11>
    %22 = llvm.inttoptr %20 : i64 to !llvm.ptr<11>
    llvm.store volatile %18, %21 : i32, !llvm.ptr<11>
    llvm.store volatile %18, %22 : i32, !llvm.ptr<11>
    %23 = llvm.mlir.constant(4 : i64) : i64
    %24 = llvm.mlir.constant(1028 : i64) : i64
    %25 = llvm.inttoptr %23 : i64 to !llvm.ptr<11>
    %26 = llvm.inttoptr %24 : i64 to !llvm.ptr<11>
    llvm.store volatile %18, %25 : i32, !llvm.ptr<11>
    llvm.store volatile %18, %26 : i32, !llvm.ptr<11>
    %27 = llvm.mlir.constant(8 : i64) : i64
    %28 = llvm.mlir.constant(1032 : i64) : i64
    %29 = llvm.inttoptr %27 : i64 to !llvm.ptr<11>
    %30 = llvm.inttoptr %28 : i64 to !llvm.ptr<11>
    llvm.store volatile %18, %29 : i32, !llvm.ptr<11>
    llvm.store volatile %18, %30 : i32, !llvm.ptr<11>
    %31 = llvm.mlir.constant(12 : i64) : i64
    %32 = llvm.mlir.constant(1036 : i64) : i64
    %33 = llvm.inttoptr %31 : i64 to !llvm.ptr<11>
    %34 = llvm.inttoptr %32 : i64 to !llvm.ptr<11>
    llvm.store volatile %18, %33 : i32, !llvm.ptr<11>
    llvm.store volatile %18, %34 : i32, !llvm.ptr<11>
    %35 = llvm.mlir.constant(16 : i64) : i64
    %36 = llvm.mlir.constant(1040 : i64) : i64
    %37 = llvm.inttoptr %35 : i64 to !llvm.ptr<11>
    %38 = llvm.inttoptr %36 : i64 to !llvm.ptr<11>
    llvm.store volatile %18, %37 : i32, !llvm.ptr<11>
    llvm.store volatile %18, %38 : i32, !llvm.ptr<11>
    %39 = llvm.mlir.constant(20 : i64) : i64
    %40 = llvm.mlir.constant(1044 : i64) : i64
    %41 = llvm.inttoptr %39 : i64 to !llvm.ptr<11>
    %42 = llvm.inttoptr %40 : i64 to !llvm.ptr<11>
    llvm.store volatile %18, %41 : i32, !llvm.ptr<11>
    llvm.store volatile %18, %42 : i32, !llvm.ptr<11>
    %c4096_i32 = arith.constant {block_id = 11 : i32} 4096 : i32
    %c64_i32 = arith.constant {block_id = 11 : i32} 64 : i32
    %c0_i8 = arith.constant {block_id = 11 : i32} 0 : i8
    %cst = arith.constant {block_id = 11 : i32} -1.000000e+06 : f32
    %c320_i32 = arith.constant {block_id = 11 : i32} 320 : i32
    %c0_i32 = arith.constant {block_id = 11 : i32} 0 : i32
    %c1_i32 = arith.constant {block_id = 11 : i32} 1 : i32
    %c1_i64 = arith.constant {block_id = 11 : i32} 1 : i64
    %c262144_i32 = arith.constant {block_id = 11 : i32} 262144 : i32
    %c128_i32 = arith.constant {block_id = 12 : i32} 128 : i32
    %c8192_i32 = arith.constant {block_id = 12 : i32} 8192 : i32
    %cst_3 = arith.constant {block_id = 13 : i32} 0.000000e+00 : f32
    %cst_4 = arith.constant {block_id = 13 : i32} 0xFF800000 : f32
    %c5_i32 = arith.constant {block_id = 14 : i32} 5 : i32
    %c524288_i32 = arith.constant {block_id = 14 : i32} 524288 : i32
    %c2621440_i32 = arith.constant {block_id = 15 : i32} 2621440 : i32
    %alloc = memref.alloc() {npu.mem_unique = #npu.mem_unique} : memref<64x128xf32, #npu.address_space<ub>>
    %alloc_5 = memref.alloc() {npu.mem_unique = #npu.mem_unique} : memref<64x64xf32, #npu.address_space<ub>>
    %alloc_6 = memref.alloc() {npu.mem_unique = #npu.mem_unique} : memref<64x128xbf16, #npu.address_space<cbuf>>
    %alloc_7 = memref.alloc() {npu.mem_unique = #npu.mem_unique} : memref<64x128xbf16, #npu.address_space<cbuf>>
    %alloc_8 = memref.alloc() {npu.mem_unique = #npu.mem_unique} : memref<64x64xbf16, #npu.address_space<cbuf>>
    %alloc_9 = memref.alloc() {npu.mem_unique = #npu.mem_unique} : memref<64x128xbf16, #npu.address_space<cbuf>>
    npu.scope() {
      %43 = npu.get_block_idx() {block_id = 11 : i32} : i64
      %44 = arith.extui %arg8 {block_id = 11 : i32} : i32 to i64
      %45 = arith.divui %43, %44 {block_id = 11 : i32} : i64
      %46 = arith.extui %arg7 {block_id = 11 : i32} : i32 to i64
      %47 = arith.divui %45, %46 {block_id = 11 : i32} : i64
      %48 = arith.extui %arg6 {block_id = 11 : i32} : i32 to i64
      %49 = arith.remui %47, %48 {block_id = 11 : i32} : i64
      %50 = arith.trunci %49 {block_id = 11 : i32} : i64 to i32
      %51 = npu.iota : tensor<64xi32> {block_id = 11 : i32}
      scf.for %arg9 = %50 to %c320_i32 step %arg6  : i32 {
        %52 = arith.divsi %arg9, %c64_i32 {block_id = 8 : i32} : i32
        %53 = arith.remsi %52, %c5_i32 {block_id = 8 : i32} : i32
        %54 = arith.divsi %arg9, %c320_i32 {block_id = 8 : i32} : i32
        %55 = arith.divsi %53, %c5_i32 {block_id = 8 : i32} : i32
        %56 = arith.muli %54, %c524288_i32 {block_id = 8 : i32} : i32
        %57 = arith.muli %55, %c524288_i32 {block_id = 8 : i32} : i32
        %58 = arith.addi %56, %57 {block_id = 8 : i32} : i32
        %59 = arith.remsi %arg9, %c64_i32 {block_id = 7 : i32} : i32
        %60 = arith.muli %59, %c64_i32 {block_id = 7 : i32} : i32
        %61 = npu.add %51, %60 : tensor<64xi32>, i32 -> tensor<64xi32> {block_id = 7 : i32}
        %62 = npu.reshape %61 : tensor<64xi32> -> tensor<64x1xi32> {block_id = 7 : i32}
        %63 = npu.broadcast %c4096_i32 : i32 -> tensor<64x1xi32> {block_id = 7 : i32}
        %64 = npu.cmp %62, %63 : tensor<64x1xi32>, tensor<64x1xi32> -> tensor<64x1xi1> {block_id = 7 : i32, compare_mode = #npu.compare_mode<lt>}
        %65 = npu.broadcast %cst_4 : f32 -> tensor<64xf32> {block_id = 7 : i32}
        %66 = npu.broadcast %cst_3 : f32 -> tensor<64xf32> {block_id = 7 : i32}
        %67 = npu.broadcast %cst_3 : f32 -> tensor<64x128xf32> {block_id = 7 : i32}
        %68 = arith.muli %54, %c2621440_i32 {block_id = 9 : i32} : i32
        %69 = arith.muli %53, %c524288_i32 {block_id = 9 : i32} : i32
        %70 = arith.addi %68, %69 {block_id = 9 : i32} : i32
        %71 = arith.subi %c4096_i32, %60 {block_id = 9 : i32} : i32
        %72 = arith.maxsi %71, %c0_i32 {block_id = 9 : i32} : i32
        %73 = arith.minsi %72, %c64_i32 {block_id = 9 : i32} : i32
        %74 = arith.index_cast %73 {block_id = 9 : i32} : i32 to index
        %75 = arith.muli %59, %c8192_i32 {block_id = 9 : i32} : i32
        %76 = arith.addi %70, %75 {block_id = 9 : i32} : i32
        %77 = arith.addi %60, %c1_i32 {block_id = 9 : i32} : i32
        %78 = arith.muli %77, %c128_i32 {block_id = 9 : i32} : i32
        %79 = arith.addi %70, %78 {block_id = 9 : i32} : i32
        %80 = arith.subi %79, %76 {block_id = 9 : i32} : i32
        %81 = arith.muli %59, %c8192_i32 {block_id = 9 : i32} : i32
        %82 = arith.addi %70, %81 {block_id = 9 : i32} : i32
        %83 = arith.index_cast %82 {block_id = 9 : i32} : i32 to index
        %84 = arith.index_cast %80 {block_id = 9 : i32} : i32 to index
        %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%83], sizes: [%74, 128], strides: [%84, 1] {block_id = 9 : i32, opentile.zero_pad_dynamic_copy} : memref<?xbf16> to memref<?x128xbf16, strided<[?, 1], offset: ?>>
        %cast = memref.cast %reinterpret_cast {block_id = 9 : i32, opentile.zero_pad_dynamic_copy} : memref<?x128xbf16, strided<[?, 1], offset: ?>> to memref<64x128xbf16, strided<[?, 1], offset: ?>>
        %85 = bufferization.to_tensor %cast restrict {block_id = 9 : i32} : memref<64x128xbf16, strided<[?, 1], offset: ?>> to tensor<64x128xbf16>
        %86 = bufferization.alloc_tensor() copy(%85) {block_id = 9 : i32, memory_space = #npu.address_space<ub>, tcore_type = #npu.tcore_type<VECTOR>} : tensor<64x128xbf16>
        %87 = bufferization.to_buffer %86 read_only {block_id = 9 : i32, transfer_id = 3 : i32} : tensor<64x128xbf16> to memref<64x128xbf16, #npu.address_space<ub>>
        npu.sync_block_wait {block_id = 9 : i32, transfer_id = 3 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 3
        npu.copy ins(%87 : memref<64x128xbf16, #npu.address_space<ub>>) outs(%alloc_6 : memref<64x128xbf16, #npu.address_space<cbuf>>) {block_id = 9 : i32, crossCoreDeps = [3 : i32, 1 : i32], transfer_id = 3 : i32}
        npu.sync_block_set {block_id = 9 : i32, transfer_id = 3 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 3
        npu.sync_block_set {block_id = 16 : i32, transfer_id = 4 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
        npu.sync_block_set {block_id = 16 : i32, transfer_id = 5 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        %alloc_10 = memref.alloc() : memref<64xf32, #npu.address_space<ub>>
        %alloc_11 = memref.alloc() : memref<64xf32, #npu.address_space<ub>>
        %alloc_12 = memref.alloc() : memref<64xf32, #npu.address_space<ub>>
        %alloc_13 = memref.alloc() : memref<64xf32, #npu.address_space<ub>>
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        npu.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
        %c4_i32 = arith.constant 4 : i32
        %c2_i32 = arith.constant 2 : i32
        %c1_i32_16 = arith.constant 1 : i32
        %88 = arith.subi %c4096_i32, %c0_i32 : i32
        %89 = arith.ceildivui %88, %c64_i32 : i32
        %90 = arith.muli %89, %c2_i32 : i32
        %91 = arith.ceildivui %90, %c1_i32_16 : i32
        %92 = arith.addi %91, %c4_i32 : i32
        %93 = arith.muli %c64_i32, %92 : i32
        %94 = arith.addi %c0_i32, %93 : i32
        %95:9 = scf.for %arg10 = %c0_i32 to %94 step %c64_i32 iter_args(%arg11 = %65, %arg12 = %66, %arg13 = %67, %arg14 = %c0_i32, %arg15 = %c0_i32, %arg16 = %c0_i32, %arg17 = %c0_i32, %arg18 = %c0_i32_14, %arg19 = %c0_i32_15) -> (tensor<64xf32>, tensor<64xf32>, tensor<64x128xf32>, i32, i32, i32, i32, i32, i32)  : i32 {
          npu.sync_block_wait[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          %true = arith.constant true
          %c0_i32_19 = arith.constant 0 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %112 = llvm.load volatile %17 : !llvm.ptr<11> -> i32
          %113 = arith.cmpi slt, %112, %c1_i32_21 : i32
          %114 = arith.cmpi slt, %arg14, %c4096_i32 : i32
          %115 = arith.andi %113, %114 : i1
          %116 = scf.if %115 -> (i32) {
            %143 = arith.subi %c4096_i32, %arg14 {block_id = 4 : i32} : i32
            %144 = arith.maxsi %143, %c0_i32 {block_id = 4 : i32} : i32
            %145 = arith.minsi %144, %c64_i32 {block_id = 4 : i32} : i32
            %146 = arith.index_cast %145 {block_id = 4 : i32} : i32 to index
            %147 = arith.muli %arg14, %c128_i32 {block_id = 4 : i32} : i32
            %148 = arith.addi %58, %147 {block_id = 4 : i32} : i32
            %149 = arith.addi %arg14, %c1_i32 {block_id = 4 : i32} : i32
            %150 = arith.muli %149, %c128_i32 {block_id = 4 : i32} : i32
            %151 = arith.addi %58, %150 {block_id = 4 : i32} : i32
            %152 = arith.subi %151, %148 {block_id = 4 : i32} : i32
            %153 = arith.muli %arg14, %c128_i32 {block_id = 4 : i32} : i32
            %154 = arith.addi %58, %153 {block_id = 4 : i32} : i32
            %155 = arith.index_cast %154 {block_id = 4 : i32} : i32 to index
            %156 = arith.index_cast %152 {block_id = 4 : i32} : i32 to index
            %reinterpret_cast_36 = memref.reinterpret_cast %arg2 to offset: [%155], sizes: [%146, 128], strides: [%156, 1] {block_id = 4 : i32, opentile.zero_pad_dynamic_copy} : memref<?xbf16> to memref<?x128xbf16, strided<[?, 1], offset: ?>>
            %cast_37 = memref.cast %reinterpret_cast_36 {block_id = 4 : i32, opentile.zero_pad_dynamic_copy} : memref<?x128xbf16, strided<[?, 1], offset: ?>> to memref<64x128xbf16, strided<[?, 1], offset: ?>>
            %157 = bufferization.to_tensor %cast_37 restrict {block_id = 4 : i32} : memref<64x128xbf16, strided<[?, 1], offset: ?>> to tensor<64x128xbf16>
            %158 = bufferization.alloc_tensor() copy(%157) {block_id = 4 : i32, memory_space = #npu.address_space<ub>, tcore_type = #npu.tcore_type<VECTOR>} : tensor<64x128xbf16>
            %159 = bufferization.to_buffer %158 read_only {block_id = 4 : i32, transfer_id = 2 : i32} : tensor<64x128xbf16> to memref<64x128xbf16, #npu.address_space<ub>>
            npu.sync_block_wait {block_id = 4 : i32, transfer_id = 2 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 2
            npu.copy ins(%159 : memref<64x128xbf16, #npu.address_space<ub>>) outs(%alloc_7 : memref<64x128xbf16, #npu.address_space<cbuf>>) {block_id = 4 : i32, crossCoreDeps = [2 : i32, 1 : i32], transfer_id = 2 : i32}
            npu.sync_block_set {block_id = 4 : i32, transfer_id = 2 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
            %160 = llvm.load volatile %17 : !llvm.ptr<11> -> i32
            %161 = arith.addi %160, %c1_i32_20 : i32
            llvm.store volatile %161, %17 : i32, !llvm.ptr<11>
            %162 = arith.addi %arg14, %c64_i32 : i32
            scf.yield %162 : i32
          } else {
            scf.yield %arg14 : i32
          } {hivm.matmul_limited_in_cube, if = 4 : i32}
          %true_22 = arith.constant true
          %c0_i32_23 = arith.constant 0 : i32
          %c1_i32_24 = arith.constant 1 : i32
          %c1_i32_25 = arith.constant 1 : i32
          %117 = llvm.load volatile %13 : !llvm.ptr<11> -> i32
          %118 = arith.cmpi slt, %117, %c1_i32_25 : i32
          %119 = arith.cmpi slt, %arg15, %c4096_i32 : i32
          %120 = arith.andi %118, %119 : i1
          %121 = scf.if %120 -> (i32) {
            %143 = arith.subi %c4096_i32, %arg15 {block_id = 3 : i32} : i32
            %144 = arith.maxsi %143, %c0_i32 {block_id = 3 : i32} : i32
            %145 = arith.minsi %144, %c64_i32 {block_id = 3 : i32} : i32
            %146 = arith.index_cast %145 {block_id = 3 : i32} : i32 to index
            %147 = arith.muli %arg15, %c128_i32 {block_id = 3 : i32} : i32
            %148 = arith.addi %58, %147 {block_id = 3 : i32} : i32
            %149 = arith.addi %arg15, %c1_i32 {block_id = 3 : i32} : i32
            %150 = arith.muli %149, %c128_i32 {block_id = 3 : i32} : i32
            %151 = arith.addi %58, %150 {block_id = 3 : i32} : i32
            %152 = arith.subi %151, %148 {block_id = 3 : i32} : i32
            %153 = arith.muli %arg15, %c128_i32 {block_id = 3 : i32} : i32
            %154 = arith.addi %58, %153 {block_id = 3 : i32} : i32
            %155 = arith.index_cast %154 {block_id = 3 : i32} : i32 to index
            %156 = arith.index_cast %152 {block_id = 3 : i32} : i32 to index
            %reinterpret_cast_36 = memref.reinterpret_cast %arg1 to offset: [%155], sizes: [%146, 128], strides: [%156, 1] {block_id = 3 : i32, opentile.zero_pad_dynamic_copy} : memref<?xbf16> to memref<?x128xbf16, strided<[?, 1], offset: ?>>
            %cast_37 = memref.cast %reinterpret_cast_36 {block_id = 3 : i32, opentile.zero_pad_dynamic_copy} : memref<?x128xbf16, strided<[?, 1], offset: ?>> to memref<64x128xbf16, strided<[?, 1], offset: ?>>
            %157 = bufferization.to_tensor %cast_37 restrict {block_id = 3 : i32} : memref<64x128xbf16, strided<[?, 1], offset: ?>> to tensor<64x128xbf16>
            %158 = bufferization.alloc_tensor() copy(%157) {block_id = 3 : i32, memory_space = #npu.address_space<ub>, tcore_type = #npu.tcore_type<VECTOR>} : tensor<64x128xbf16>
            %159 = bufferization.to_buffer %158 read_only {block_id = 3 : i32, transfer_id = 0 : i32} : tensor<64x128xbf16> to memref<64x128xbf16, #npu.address_space<ub>>
            npu.sync_block_wait {block_id = 3 : i32, transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 0
            npu.copy ins(%159 : memref<64x128xbf16, #npu.address_space<ub>>) outs(%alloc_9 : memref<64x128xbf16, #npu.address_space<cbuf>>) {block_id = 3 : i32, crossCoreDeps = [0 : i32, 1 : i32], transfer_id = 0 : i32}
            npu.sync_block_set {block_id = 3 : i32, transfer_id = 0 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            %160 = llvm.load volatile %13 : !llvm.ptr<11> -> i32
            %161 = arith.addi %160, %c1_i32_24 : i32
            llvm.store volatile %161, %13 : i32, !llvm.ptr<11>
            %162 = arith.addi %arg15, %c64_i32 : i32
            scf.yield %162 : i32
          } else {
            scf.yield %arg15 : i32
          } {hivm.matmul_limited_in_cube, if = 3 : i32}
          %true_26 = arith.constant true
          %c0_i32_27 = arith.constant 0 : i32
          %c1_i32_28 = arith.constant 1 : i32
          %122 = llvm.load volatile %7 : !llvm.ptr<11> -> i32
          %123 = arith.cmpi sgt, %122, %c0_i32_27 : i32
          %c1_i32_29 = arith.constant 1 : i32
          %124 = llvm.load volatile %9 : !llvm.ptr<11> -> i32
          %125 = arith.cmpi slt, %124, %c1_i32_29 : i32
          %126 = arith.andi %123, %125 : i1
          %c2_i32_30 = arith.constant 2 : i32
          %127 = arith.cmpi slt, %arg18, %c2_i32_30 : i32
          %c2_i32_31 = arith.constant 2 : i32
          %128 = arith.cmpi slt, %arg19, %c2_i32_31 : i32
          %129 = arith.andi %127, %128 : i1
          %130 = arith.cmpi slt, %arg16, %c4096_i32 : i32
          %131 = arith.andi %126, %129 : i1
          %132 = arith.andi %131, %130 : i1
          %133:4 = scf.if %132 -> (tensor<64xf32>, i32, i32, i32) {
            npu.sync_block_wait {block_id = 5 : i32, transfer_id = 4 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 4
            %143 = bufferization.to_tensor %alloc_5 restrict writable {block_id = 5 : i32, crossCoreDeps = [4 : i32, 0 : i32], transfer_id = 4 : i32} : memref<64x64xf32, #npu.address_space<ub>> to tensor<64x64xf32>
            %144 = npu.add %51, %arg16 : tensor<64xi32>, i32 -> tensor<64xi32> {block_id = 5 : i32}
            %145 = npu.mul %143, %arg5 : tensor<64x64xf32>, f32 -> tensor<64x64xf32> {block_id = 5 : i32, round_mode = #npu.round_mode<rint>}
            %146 = npu.reshape %144 : tensor<64xi32> -> tensor<1x64xi32> {block_id = 5 : i32}
            %147 = npu.broadcast %c4096_i32 : i32 -> tensor<1x64xi32> {block_id = 5 : i32}
            %148 = npu.cmp %146, %147 : tensor<1x64xi32>, tensor<1x64xi32> -> tensor<1x64xi1> {block_id = 5 : i32, compare_mode = #npu.compare_mode<lt>}
            %149 = npu.broadcast %64 : tensor<64x1xi1> -> tensor<64x64xi1> {block_id = 5 : i32, broadcast_dim = 1 : i64}
            %150 = npu.cvt %149 : tensor<64x64xi1> -> tensor<64x64xi16> {block_id = 5 : i32, type_fn = #npu.cast<cast_signed>}
            %151 = npu.broadcast %148 : tensor<1x64xi1> -> tensor<64x64xi1> {block_id = 5 : i32, broadcast_dim = 0 : i64}
            %152 = npu.cvt %151 : tensor<64x64xi1> -> tensor<64x64xi16> {block_id = 5 : i32, type_fn = #npu.cast<cast_signed>}
            %153 = npu.and %150, %152 : tensor<64x64xi16>, tensor<64x64xi16> -> tensor<64x64xi16> {block_id = 5 : i32}
            %154 = npu.cvt %153 : tensor<64x64xi16> -> tensor<64x64xi1> {block_id = 5 : i32, overflow = #npu.integer_overflow<none>}
            %155 = arith.muli %59, %c262144_i32 {block_id = 5 : i32} : i32
            %156 = arith.addi %60, %c1_i32 {block_id = 5 : i32} : i32
            %157 = arith.muli %156, %c4096_i32 {block_id = 5 : i32} : i32
            %158 = arith.subi %157, %155 {block_id = 5 : i32} : i32
            %159 = arith.index_cast %arg16 {block_id = 5 : i32} : i32 to index
            %160 = arith.muli %59, %c262144_i32 {block_id = 5 : i32} : i32
            %161 = arith.index_cast %160 {block_id = 5 : i32} : i32 to index
            %162 = arith.addi %159, %161 {block_id = 5 : i32} : index
            %163 = arith.index_cast %158 {block_id = 5 : i32} : i32 to index
            %reinterpret_cast_36 = memref.reinterpret_cast %arg3 to offset: [%162], sizes: [64, 64], strides: [%163, 1] {block_id = 5 : i32} : memref<?xi8> to memref<64x64xi8, strided<[?, 1], offset: ?>>
            %164 = bufferization.to_tensor %reinterpret_cast_36 restrict {block_id = 5 : i32} : memref<64x64xi8, strided<[?, 1], offset: ?>> to tensor<64x64xi8>
            %165 = npu.broadcast %c0_i8 : i8 -> tensor<64x64xi8> {block_id = 5 : i32}
            %166 = npu.cmp %164, %165 : tensor<64x64xi8>, tensor<64x64xi8> -> tensor<64x64xi1> {block_id = 5 : i32, compare_mode = #npu.compare_mode<ne>, npu.preserve_narrow_equality_cmp}
            %167 = npu.cvt %154 : tensor<64x64xi1> -> tensor<64x64xi16> {block_id = 5 : i32, type_fn = #npu.cast<cast_signed>}
            %168 = npu.cvt %166 : tensor<64x64xi1> -> tensor<64x64xi16> {block_id = 5 : i32, type_fn = #npu.cast<cast_signed>}
            %169 = npu.and %167, %168 : tensor<64x64xi16>, tensor<64x64xi16> -> tensor<64x64xi16> {block_id = 5 : i32}
            %170 = npu.cvt %169 : tensor<64x64xi16> -> tensor<64x64xi1> {block_id = 5 : i32, overflow = #npu.integer_overflow<none>}
            %171 = npu.select %170, %145, %cst : tensor<64x64xi1>, tensor<64x64xf32>, f32 -> tensor<64x64xf32> {block_id = 5 : i32}
            %172 = npu.reduce %171, %c1_i64 : tensor<64x64xf32>, i64 -> tensor<64xf32> #npu.reduce_op<max> identities=[0xFF800000 : f32] {block_id = 5 : i32}
            %173 = npu.max %arg11, %172 : tensor<64xf32>, tensor<64xf32> -> tensor<64xf32> {block_id = 5 : i32}
            %174 = npu.sub %arg11, %173 : tensor<64xf32>, tensor<64xf32> -> tensor<64xf32> {block_id = 5 : i32, round_mode = #npu.round_mode<rint>}
            %175 = arith.divui %arg16, %c64_i32 {block_id = 5 : i32} : i32
            %c2_i32_37 = arith.constant {block_id = 5 : i32} 2 : i32
            %176 = arith.remsi %175, %c2_i32_37 {block_id = 5 : i32} : i32
            %c0_i32_38 = arith.constant {block_id = 5 : i32} 0 : i32
            %177 = arith.cmpi eq, %176, %c0_i32_38 {block_id = 5 : i32} : i32
            scf.if %177 {
              %193 = bufferization.to_buffer %174 read_only {block_id = 5 : i32} : tensor<64xf32> to memref<64xf32, #npu.address_space<ub>>
              npu.copy ins(%193 : memref<64xf32, #npu.address_space<ub>>) outs(%alloc_10 : memref<64xf32, #npu.address_space<ub>>) {block_id = 5 : i32, intraDeps = [0 : i32, 1 : i32]}
            } else {
              %193 = bufferization.to_buffer %174 read_only {block_id = 5 : i32} : tensor<64xf32> to memref<64xf32, #npu.address_space<ub>>
              npu.copy ins(%193 : memref<64xf32, #npu.address_space<ub>>) outs(%alloc_11 : memref<64xf32, #npu.address_space<ub>>) {block_id = 5 : i32, intraDeps = [0 : i32, 1 : i32]}
            } {block_id = 5 : i32, intra_buffer}
            %178 = npu.sub %171, %173 : tensor<64x64xf32>, tensor<64xf32> -> tensor<64x64xf32> {block_id = 5 : i32, round_mode = #npu.round_mode<rint>}
            %179 = npu.exp %178 : tensor<64x64xf32> -> tensor<64x64xf32> {block_id = 5 : i32, round_mode = #npu.round_mode<full>}
            %180 = npu.reduce %179, %c1_i64 : tensor<64x64xf32>, i64 -> tensor<64xf32> #npu.reduce_op<sum> identities=[0.000000e+00 : f32] {block_id = 5 : i32}
            %181 = arith.divui %arg16, %c64_i32 {block_id = 5 : i32} : i32
            %c2_i32_39 = arith.constant {block_id = 5 : i32} 2 : i32
            %182 = arith.remsi %181, %c2_i32_39 {block_id = 5 : i32} : i32
            %c0_i32_40 = arith.constant {block_id = 5 : i32} 0 : i32
            %183 = arith.cmpi eq, %182, %c0_i32_40 {block_id = 5 : i32} : i32
            scf.if %183 {
              %193 = bufferization.to_buffer %180 read_only {block_id = 5 : i32} : tensor<64xf32> to memref<64xf32, #npu.address_space<ub>>
              npu.copy ins(%193 : memref<64xf32, #npu.address_space<ub>>) outs(%alloc_12 : memref<64xf32, #npu.address_space<ub>>) {block_id = 5 : i32, intraDeps = [1 : i32, 1 : i32]}
            } else {
              %193 = bufferization.to_buffer %180 read_only {block_id = 5 : i32} : tensor<64xf32> to memref<64xf32, #npu.address_space<ub>>
              npu.copy ins(%193 : memref<64xf32, #npu.address_space<ub>>) outs(%alloc_13 : memref<64xf32, #npu.address_space<ub>>) {block_id = 5 : i32, intraDeps = [1 : i32, 1 : i32]}
            } {block_id = 5 : i32, intra_buffer}
            %184 = npu.cvt %179 : tensor<64x64xf32> -> tensor<64x64xbf16> {block_id = 5 : i32, round_mode = #npu.round_mode<rint>}
            %185 = bufferization.to_buffer %184 read_only {block_id = 5 : i32, transfer_id = 1 : i32} : tensor<64x64xbf16> to memref<64x64xbf16, #npu.address_space<ub>>
            npu.sync_block_wait {block_id = 5 : i32, transfer_id = 1 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
            npu.copy ins(%185 : memref<64x64xbf16, #npu.address_space<ub>>) outs(%alloc_8 : memref<64x64xbf16, #npu.address_space<cbuf>>) {block_id = 5 : i32, crossCoreDeps = [1 : i32, 1 : i32], transfer_id = 1 : i32}
            npu.sync_block_set {block_id = 5 : i32, transfer_id = 1 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            npu.sync_block_set {block_id = 5 : i32, transfer_id = 4 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
            %186 = llvm.load volatile %7 : !llvm.ptr<11> -> i32
            %187 = arith.subi %186, %c1_i32_28 : i32
            llvm.store volatile %187, %7 : i32, !llvm.ptr<11>
            %188 = llvm.load volatile %9 : !llvm.ptr<11> -> i32
            %189 = arith.addi %188, %c1_i32_28 : i32
            llvm.store volatile %189, %9 : i32, !llvm.ptr<11>
            %c1_i32_41 = arith.constant 1 : i32
            %190 = arith.addi %arg18, %c1_i32_41 : i32
            %191 = arith.addi %arg19, %c1_i32_41 : i32
            %192 = arith.addi %arg16, %c64_i32 : i32
            scf.yield %173, %190, %191, %192 : tensor<64xf32>, i32, i32, i32
          } else {
            scf.yield %arg11, %arg18, %arg19, %arg16 : tensor<64xf32>, i32, i32, i32
          } {hivm.matmul_limited_in_cube, if = 5 : i32}
          %true_32 = arith.constant true
          %c0_i32_33 = arith.constant 0 : i32
          %c1_i32_34 = arith.constant 1 : i32
          %134 = llvm.load volatile %3 : !llvm.ptr<11> -> i32
          %135 = arith.cmpi sgt, %134, %c0_i32_33 : i32
          %c0_i32_35 = arith.constant 0 : i32
          %136 = arith.cmpi sgt, %133#1, %c0_i32_35 : i32
          %137 = arith.cmpi sgt, %133#2, %c0_i32_35 : i32
          %138 = arith.andi %136, %137 : i1
          %139 = arith.cmpi slt, %arg17, %c4096_i32 : i32
          %140 = arith.andi %135, %138 : i1
          %141 = arith.andi %140, %139 : i1
          %142:5 = scf.if %141 -> (tensor<64xf32>, tensor<64x128xf32>, i32, i32, i32) {
            npu.sync_block_wait {block_id = 6 : i32, transfer_id = 5 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 5
            %143 = bufferization.to_tensor %alloc restrict writable {block_id = 6 : i32, crossCoreDeps = [5 : i32, 0 : i32], transfer_id = 5 : i32} : memref<64x128xf32, #npu.address_space<ub>> to tensor<64x128xf32>
            %144 = arith.divui %arg17, %c64_i32 {block_id = 6 : i32} : i32
            %c2_i32_36 = arith.constant {block_id = 6 : i32} 2 : i32
            %145 = arith.remsi %144, %c2_i32_36 {block_id = 6 : i32} : i32
            %c0_i32_37 = arith.constant {block_id = 6 : i32} 0 : i32
            %146 = arith.cmpi eq, %145, %c0_i32_37 {block_id = 6 : i32} : i32
            %147 = scf.if %146 -> (tensor<64xf32>) {
              %162 = bufferization.to_tensor %alloc_10 restrict writable : memref<64xf32, #npu.address_space<ub>> to tensor<64xf32>
              scf.yield %162 : tensor<64xf32>
            } else {
              %162 = bufferization.to_tensor %alloc_11 restrict writable : memref<64xf32, #npu.address_space<ub>> to tensor<64xf32>
              scf.yield %162 : tensor<64xf32>
            } {block_id = 6 : i32, intraDeps = [0 : i32, 0 : i32], intra_buffer}
            %148 = npu.exp %147 : tensor<64xf32> -> tensor<64xf32> {block_id = 6 : i32, round_mode = #npu.round_mode<full>}
            %149 = npu.mul %arg12, %148 : tensor<64xf32>, tensor<64xf32> -> tensor<64xf32> {block_id = 6 : i32, round_mode = #npu.round_mode<rint>}
            %150 = arith.divui %arg17, %c64_i32 {block_id = 6 : i32} : i32
            %c2_i32_38 = arith.constant {block_id = 6 : i32} 2 : i32
            %151 = arith.remsi %150, %c2_i32_38 {block_id = 6 : i32} : i32
            %c0_i32_39 = arith.constant {block_id = 6 : i32} 0 : i32
            %152 = arith.cmpi eq, %151, %c0_i32_39 {block_id = 6 : i32} : i32
            %153 = scf.if %152 -> (tensor<64xf32>) {
              %162 = bufferization.to_tensor %alloc_12 restrict writable : memref<64xf32, #npu.address_space<ub>> to tensor<64xf32>
              scf.yield %162 : tensor<64xf32>
            } else {
              %162 = bufferization.to_tensor %alloc_13 restrict writable : memref<64xf32, #npu.address_space<ub>> to tensor<64xf32>
              scf.yield %162 : tensor<64xf32>
            } {block_id = 6 : i32, intraDeps = [1 : i32, 0 : i32], intra_buffer}
            %154 = npu.add ins(%149, %153 : tensor<64xf32>, tensor<64xf32>) outs(%arg12 : tensor<64xf32>) -> tensor<64xf32> {block_id = 6 : i32, round_mode = #npu.round_mode<rint>}
            %155 = npu.mul %arg13, %148 : tensor<64x128xf32>, tensor<64xf32> -> tensor<64x128xf32> {block_id = 6 : i32, round_mode = #npu.round_mode<rint>}
            %156 = npu.add ins(%155, %143 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%arg13 : tensor<64x128xf32>) -> tensor<64x128xf32> {block_id = 6 : i32}
            npu.sync_block_set {block_id = 6 : i32, transfer_id = 5 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
            %157 = llvm.load volatile %3 : !llvm.ptr<11> -> i32
            %158 = arith.subi %157, %c1_i32_34 : i32
            llvm.store volatile %158, %3 : i32, !llvm.ptr<11>
            %c1_i32_40 = arith.constant 1 : i32
            %159 = arith.subi %133#1, %c1_i32_40 : i32
            %160 = arith.subi %133#2, %c1_i32_40 : i32
            %161 = arith.addi %arg17, %c64_i32 : i32
            scf.yield %154, %156, %159, %160, %161 : tensor<64xf32>, tensor<64x128xf32>, i32, i32, i32
          } else {
            scf.yield %arg12, %arg13, %133#1, %133#2, %arg17 : tensor<64xf32>, tensor<64x128xf32>, i32, i32, i32
          } {hivm.matmul_limited_in_cube, if = 6 : i32}
          npu.sync_block_set[<VECTOR>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %133#0, %142#0, %142#1, %116, %121, %133#3, %142#4, %142#2, %142#3 : tensor<64xf32>, tensor<64xf32>, tensor<64x128xf32>, i32, i32, i32, i32, i32, i32
        } {block_id = 16 : i32, main_loop = 1 : i32}
        npu.sync_block_wait {block_id = 16 : i32, transfer_id = 2 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 2
        npu.sync_block_wait {block_id = 16 : i32, transfer_id = 1 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        npu.sync_block_wait {block_id = 16 : i32, transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 0
        %96 = npu.div %95#2, %95#1 : tensor<64x128xf32>, tensor<64xf32> -> tensor<64x128xf32> {block_id = 10 : i32, round_mode = #npu.round_mode<rint>}
        %97 = npu.cvt %96 : tensor<64x128xf32> -> tensor<64x128xbf16> {block_id = 10 : i32, round_mode = #npu.round_mode<rint>}
        %98 = arith.subi %c4096_i32, %60 {block_id = 10 : i32} : i32
        %99 = arith.maxsi %98, %c0_i32 {block_id = 10 : i32} : i32
        %100 = arith.minsi %99, %c64_i32 {block_id = 10 : i32} : i32
        %101 = arith.index_cast %100 {block_id = 10 : i32} : i32 to index
        %102 = arith.muli %59, %c8192_i32 {block_id = 10 : i32} : i32
        %103 = arith.addi %70, %102 {block_id = 10 : i32} : i32
        %104 = arith.addi %60, %c1_i32 {block_id = 10 : i32} : i32
        %105 = arith.muli %104, %c128_i32 {block_id = 10 : i32} : i32
        %106 = arith.addi %70, %105 {block_id = 10 : i32} : i32
        %107 = arith.subi %106, %103 {block_id = 10 : i32} : i32
        %108 = arith.muli %59, %c8192_i32 {block_id = 10 : i32} : i32
        %109 = arith.addi %70, %108 {block_id = 10 : i32} : i32
        %110 = arith.index_cast %109 {block_id = 10 : i32} : i32 to index
        %111 = arith.index_cast %107 {block_id = 10 : i32} : i32 to index
        %reinterpret_cast_17 = memref.reinterpret_cast %arg4 to offset: [%110], sizes: [%101, 128], strides: [%111, 1] {block_id = 10 : i32} : memref<?xbf16> to memref<?x128xbf16, strided<[?, 1], offset: ?>>
        %cast_18 = memref.cast %reinterpret_cast_17 {block_id = 10 : i32} : memref<?x128xbf16, strided<[?, 1], offset: ?>> to memref<64x128xbf16, strided<[?, 1], offset: ?>>
        bufferization.materialize_in_destination %97 in writable %cast_18 {block_id = 10 : i32} : (tensor<64x128xbf16>, memref<64x128xbf16, strided<[?, 1], offset: ?>>) -> ()
      } {block_id = 17 : i32}
      npu.sync_block_wait {block_id = 17 : i32, transfer_id = 3 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 3
      npu.yield
    } {tcore_type = #npu.tcore_type<VECTOR>} : () -> ()
    npu.scope() {
      %43 = npu.get_block_idx() {block_id = 11 : i32} : i64
      %44 = arith.extui %arg8 {block_id = 11 : i32} : i32 to i64
      %45 = arith.divui %43, %44 {block_id = 11 : i32} : i64
      %46 = arith.extui %arg7 {block_id = 11 : i32} : i32 to i64
      %47 = arith.divui %45, %46 {block_id = 11 : i32} : i64
      %48 = arith.extui %arg6 {block_id = 11 : i32} : i32 to i64
      %49 = arith.remui %47, %48 {block_id = 11 : i32} : i64
      %50 = arith.trunci %49 {block_id = 11 : i32} : i64 to i32
      npu.sync_block_set {block_id = 17 : i32, transfer_id = 3 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 3
      scf.for %arg9 = %50 to %c320_i32 step %arg6  : i32 {
        npu.sync_block_wait {block_id = 16 : i32, transfer_id = 3 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 3
        %51 = bufferization.to_tensor %alloc_6 restrict writable {block_id = 16 : i32, crossCoreDeps = [3 : i32, 0 : i32], transfer_id = 3 : i32} : memref<64x128xbf16, #npu.address_space<cbuf>> to tensor<64x128xbf16>
        npu.sync_block_set {block_id = 16 : i32, transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 0
        npu.sync_block_set {block_id = 16 : i32, transfer_id = 1 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        npu.sync_block_set {block_id = 16 : i32, transfer_id = 2 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 2
        %c4_i32 = arith.constant 4 : i32
        %c2_i32 = arith.constant 2 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %52 = arith.subi %c4096_i32, %c0_i32 : i32
        %53 = arith.ceildivui %52, %c64_i32 : i32
        %54 = arith.muli %53, %c2_i32 : i32
        %55 = arith.ceildivui %54, %c1_i32_10 : i32
        %56 = arith.addi %55, %c4_i32 : i32
        %57 = arith.muli %c64_i32, %56 : i32
        %58 = arith.addi %c0_i32, %57 : i32
        %59:2 = scf.for %arg10 = %c0_i32 to %58 step %c64_i32 iter_args(%arg11 = %c0_i32, %arg12 = %c0_i32) -> (i32, i32)  : i32 {
          npu.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          %true = arith.constant true
          %c0_i32_11 = arith.constant 0 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %60 = llvm.load volatile %33 : !llvm.ptr<11> -> i32
          %61 = arith.cmpi sgt, %60, %c0_i32_11 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %62 = llvm.load volatile %21 : !llvm.ptr<11> -> i32
          %63 = arith.cmpi slt, %62, %c1_i32_13 : i32
          %64 = arith.andi %61, %63 : i1
          %65 = arith.cmpi slt, %arg11, %c4096_i32 : i32
          %66 = arith.andi %64, %65 : i1
          %67 = scf.if %66 -> (i32) {
            npu.sync_block_wait {block_id = 1 : i32, transfer_id = 0 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 0
            %79 = bufferization.to_tensor %alloc_9 restrict writable {block_id = 1 : i32, crossCoreDeps = [0 : i32, 0 : i32], transfer_id = 0 : i32} : memref<64x128xbf16, #npu.address_space<cbuf>> to tensor<64x128xbf16>
            %80 = bufferization.alloc_tensor() {block_id = 1 : i32, memory_space = #npu.address_space<cc>} : tensor<64x64xf32>
            %81 = npu.mad ins(%51, %79 : tensor<64x128xbf16>, tensor<64x128xbf16>) outs(%80 : tensor<64x64xf32>) -> tensor<64x64xf32> {block_id = 1 : i32, lhs_trans = false, rhs_trans = true, zero_init = true}
            npu.sync_block_set {block_id = 1 : i32, transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 0
            %82 = bufferization.to_buffer %81 read_only {block_id = 1 : i32, transfer_id = 4 : i32} : tensor<64x64xf32> to memref<64x64xf32, #npu.address_space<cc>>
            npu.sync_block_wait {block_id = 1 : i32, transfer_id = 4 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
            npu.copy ins(%82 : memref<64x64xf32, #npu.address_space<cc>>) outs(%alloc_5 : memref<64x64xf32, #npu.address_space<ub>>) {block_id = 1 : i32, crossCoreDeps = [4 : i32, 1 : i32], transfer_id = 4 : i32}
            npu.sync_block_set {block_id = 1 : i32, transfer_id = 4 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 4
            %83 = llvm.load volatile %33 : !llvm.ptr<11> -> i32
            %84 = arith.subi %83, %c1_i32_12 : i32
            llvm.store volatile %84, %33 : i32, !llvm.ptr<11>
            %85 = llvm.load volatile %21 : !llvm.ptr<11> -> i32
            %86 = arith.addi %85, %c1_i32_12 : i32
            llvm.store volatile %86, %21 : i32, !llvm.ptr<11>
            %87 = arith.addi %arg11, %c64_i32 : i32
            scf.yield %87 : i32
          } else {
            scf.yield %arg11 : i32
          } {hivm.matmul_limited_in_cube, if = 1 : i32}
          %true_14 = arith.constant true
          %c0_i32_15 = arith.constant 0 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %68 = llvm.load volatile %37 : !llvm.ptr<11> -> i32
          %69 = arith.cmpi sgt, %68, %c0_i32_15 : i32
          %70 = llvm.load volatile %41 : !llvm.ptr<11> -> i32
          %71 = arith.cmpi sgt, %70, %c0_i32_15 : i32
          %72 = arith.andi %69, %71 : i1
          %c1_i32_17 = arith.constant 1 : i32
          %73 = llvm.load volatile %25 : !llvm.ptr<11> -> i32
          %74 = arith.cmpi slt, %73, %c1_i32_17 : i32
          %75 = arith.andi %72, %74 : i1
          %76 = arith.cmpi slt, %arg12, %c4096_i32 : i32
          %77 = arith.andi %75, %76 : i1
          %78 = scf.if %77 -> (i32) {
            npu.sync_block_wait {block_id = 2 : i32, transfer_id = 2 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
            %79 = bufferization.to_tensor %alloc_7 restrict writable {block_id = 2 : i32, crossCoreDeps = [2 : i32, 0 : i32], transfer_id = 2 : i32} : memref<64x128xbf16, #npu.address_space<cbuf>> to tensor<64x128xbf16>
            npu.sync_block_wait {block_id = 2 : i32, transfer_id = 1 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            %80 = bufferization.to_tensor %alloc_8 restrict writable {block_id = 2 : i32, crossCoreDeps = [1 : i32, 0 : i32], transfer_id = 1 : i32} : memref<64x64xbf16, #npu.address_space<cbuf>> to tensor<64x64xbf16>
            %81 = bufferization.alloc_tensor() {block_id = 2 : i32, memory_space = #npu.address_space<cc>} : tensor<64x128xf32>
            %82 = npu.mad ins(%80, %79 : tensor<64x64xbf16>, tensor<64x128xbf16>) outs(%81 : tensor<64x128xf32>) -> tensor<64x128xf32> {block_id = 2 : i32, lhs_trans = false, rhs_trans = false, zero_init = true}
            npu.sync_block_set {block_id = 2 : i32, transfer_id = 1 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
            npu.sync_block_set {block_id = 2 : i32, transfer_id = 2 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 2
            %83 = bufferization.to_buffer %82 read_only {block_id = 2 : i32, transfer_id = 5 : i32} : tensor<64x128xf32> to memref<64x128xf32, #npu.address_space<cc>>
            npu.sync_block_wait {block_id = 2 : i32, transfer_id = 5 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
            npu.copy ins(%83 : memref<64x128xf32, #npu.address_space<cc>>) outs(%alloc : memref<64x128xf32, #npu.address_space<ub>>) {block_id = 2 : i32, crossCoreDeps = [5 : i32, 1 : i32], transfer_id = 5 : i32}
            npu.sync_block_set {block_id = 2 : i32, transfer_id = 5 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 5
            %84 = llvm.load volatile %37 : !llvm.ptr<11> -> i32
            %85 = arith.subi %84, %c1_i32_16 : i32
            llvm.store volatile %85, %37 : i32, !llvm.ptr<11>
            %86 = llvm.load volatile %41 : !llvm.ptr<11> -> i32
            %87 = arith.subi %86, %c1_i32_16 : i32
            llvm.store volatile %87, %41 : i32, !llvm.ptr<11>
            %88 = llvm.load volatile %25 : !llvm.ptr<11> -> i32
            %89 = arith.addi %88, %c1_i32_16 : i32
            llvm.store volatile %89, %25 : i32, !llvm.ptr<11>
            %90 = arith.addi %arg12, %c64_i32 : i32
            scf.yield %90 : i32
          } else {
            scf.yield %arg12 : i32
          } {hivm.matmul_limited_in_cube, if = 2 : i32}
          npu.sync_block_set[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
          scf.yield %67, %78 : i32, i32
        } {block_id = 16 : i32, main_loop = 1 : i32}
        npu.sync_block_wait[<CUBE>, <PIPE_S>, <PIPE_S>] flag = 15
        npu.sync_block_wait {block_id = 16 : i32, transfer_id = 5 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
        npu.sync_block_wait {block_id = 16 : i32, transfer_id = 4 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
        npu.sync_block_set {block_id = 16 : i32, transfer_id = 3 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 3
      } {block_id = 17 : i32}
      npu.yield
    } {tcore_type = #npu.tcore_type<CUBE>} : () -> ()
    return
  }
}