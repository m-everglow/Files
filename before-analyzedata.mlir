// [analyze-name] Before AnalyzeName:
module attributes {hacc.target = #hacc.target<"Ascend950PR_9579">, ssbuffer.insertionOptimization, ssbuffer.inter_core_buf_count = 2 : i32, ssbuffer.intra_buf_count = 3 : i32, ssbuffer.load_store_buf_count = 1 : i32} {
  func.func @chunk_gated_delta_rule_bwd_kernel_dhu_k128_blockdim128(%arg0: memref<?xi8>, %arg1: memref<?xi8>, %arg2: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xbf16> {tt.tensor_kind = 1 : i32}, %arg8: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg9: memref<?xbf16> {tt.tensor_kind = 1 : i32}, %arg10: f32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, global_kernel = "local", mix_mode = "mix", parallel_mode = "simd"} {
    %cst = arith.constant {ssbuffer.block_id = 12 : i32} dense<[2, 4, 16, 16]> : tensor<4xi64>
    %cst_0 = arith.constant {ssbuffer.block_id = 12 : i32} dense<[64, 2, 16]> : tensor<3xi64>
    %cst_1 = arith.constant {ssbuffer.block_id = 10 : i32} dense<[4, 4, 16, 8]> : tensor<4xi64>
    %cst_2 = arith.constant {ssbuffer.block_id = 10 : i32} dense<[64, 4, 8]> : tensor<3xi64>
    %cst_3 = arith.constant {ssbuffer.block_id = 10 : i32} dense<[8, 8, 16, 8]> : tensor<4xi64>
    %cst_4 = arith.constant {ssbuffer.block_id = 10 : i32} dense<[128, 8, 8]> : tensor<3xi64>
    %cst_5 = arith.constant {ssbuffer.block_id = 9 : i32} dense<[2, 8, 16, 16]> : tensor<4xi64>
    %cst_6 = arith.constant {ssbuffer.block_id = 9 : i32} dense<[128, 2, 16]> : tensor<3xi64>
    %cst_7 = arith.constant {ssbuffer.block_id = 8 : i32} 0.000000e+00 : f32
    %c64_i32 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 64 : i32
    %c0_i32 = arith.constant {ssbuffer.block_id = 8 : i32} 0 : i32
    %c128_i64 = arith.constant {ssbuffer.block_id = 8 : i32} 128 : i64
    %c1_i32 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 1 : i32
    %c32_i32 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 32 : i32
    %c0 = arith.constant {DataUse, ssbuffer.block_id = 8 : i32} 0 : index
    %c64 = arith.constant {DataUse, ssbuffer.block_id = 8 : i32} 64 : index
    %c16384_i64 = arith.constant {ssbuffer.block_id = 8 : i32} 16384 : i64
    %c-1_i32 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} -1 : i32
    %c524288_i64 = arith.constant {ssbuffer.block_id = 8 : i32} 524288 : i64
    %c63_i32 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 63 : i32
    %c128 = arith.constant {ssbuffer.block_id = 8 : i32} 128 : index
    %c32 = arith.constant {ssbuffer.block_id = 8 : i32} 32 : index
    %c4096 = arith.constant {ssbuffer.block_id = 8 : i32} 4096 : index
    %cst_8 = arith.constant {ssbuffer.block_id = 8 : i32} 0.000000e+00 : bf16
    scope.scope : () -> () {
      %0 = tensor.empty() {ssbuffer.block_id = 8 : i32} : tensor<64x32xf32>
      %1 = tensor.empty() {ssbuffer.block_id = 8 : i32} : tensor<64xf32>
      %2 = linalg.fill {ssbuffer.block_id = 8 : i32} ins(%cst_7 : f32) outs(%1 : tensor<64xf32>) -> tensor<64xf32>
      %3 = tensor.empty() {ssbuffer.block_id = 8 : i32} : tensor<128x32xf32>
      %4 = linalg.fill {ssbuffer.block_id = 8 : i32} ins(%cst_7 : f32) outs(%3 : tensor<128x32xf32>) -> tensor<128x32xf32>
      %5 = arith.divsi %arg16, %c32_i32 {MixUse, ssbuffer.block_id = 8 : i32} : i32
      %6 = arith.remsi %arg16, %c32_i32 {MixUse, ssbuffer.block_id = 8 : i32} : i32
      %7 = arith.muli %5, %arg11 {MixUse, ssbuffer.block_id = 8 : i32} : i32
      %8 = arith.addi %arg11, %c63_i32 {MixUse, ssbuffer.block_id = 8 : i32} : i32
      %9 = arith.divsi %8, %c64_i32 {MixUse, ssbuffer.block_id = 8 : i32} : i32
      %10 = arith.muli %5, %9 {MixUse, ssbuffer.block_id = 8 : i32} : i32
      %11 = arith.muli %7, %c32_i32 {MixUse, ssbuffer.block_id = 8 : i32} : i32
      %12 = arith.addi %11, %6 {ssbuffer.block_id = 8 : i32} : i32
      %13 = arith.extsi %12 {ssbuffer.block_id = 8 : i32} : i32 to i64
      %14 = arith.muli %13, %c128_i64 {ssbuffer.block_id = 8 : i32} : i64
      %15 = arith.index_cast %14 {ssbuffer.block_id = 8 : i32} : i64 to index
      %16 = arith.muli %10, %c32_i32 {MixUse, ssbuffer.block_id = 8 : i32} : i32
      %17 = arith.addi %16, %6 {ssbuffer.block_id = 8 : i32} : i32
      %18 = arith.extsi %17 {ssbuffer.block_id = 8 : i32} : i32 to i64
      %19 = arith.muli %18, %c16384_i64 {ssbuffer.block_id = 8 : i32} : i64
      %20 = arith.subi %9, %c1_i32 {MixUse, ssbuffer.block_id = 8 : i32} : i32
      %21 = arith.muli %arg15, %c32_i32 {ssbuffer.block_id = 8 : i32} : i32
      %22 = arith.index_cast %11 {ssbuffer.block_id = 8 : i32} : i32 to index
      %23 = arith.index_cast %6 {ssbuffer.block_id = 8 : i32} : i32 to index
      %24 = arith.addi %22, %23 {ssbuffer.block_id = 8 : i32} : index
      %25 = linalg.fill {ssbuffer.block_id = 8 : i32} ins(%arg10 : f32) outs(%3 : tensor<128x32xf32>) -> tensor<128x32xf32>
      %26 = arith.addi %arg11, %c63_i32 {MixUse, ssbuffer.block_id = 1 : i32} : i32
      %27 = arith.divsi %26, %c64_i32 {MixUse, ssbuffer.block_id = 1 : i32} : i32
      %28 = arith.subi %27, %c1_i32 {MixUse, ssbuffer.block_id = 1 : i32} : i32
      %alloc = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32} : memref<2x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32} : memref<2x8x16x16xbf16, #hivm.address_space<cbuf>>
      %alloc_9 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} : memref<8x8x16x8xf32, #hivm.address_space<cbuf>>
      annotation.mark %alloc_9 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} : memref<8x8x16x8xf32, #hivm.address_space<cbuf>>
      %alloc_10 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 2 : i32} : memref<4x4x16x8xf32, #hivm.address_space<cbuf>>
      annotation.mark %alloc_10 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 2 : i32} : memref<4x4x16x8xf32, #hivm.address_space<cbuf>>
      %alloc_11 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 3 : i32} : memref<2x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_11 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 3 : i32} : memref<2x4x16x16xbf16, #hivm.address_space<cbuf>>
      %alloc_12 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 4 : i32} : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_12 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 4 : i32} : memref<64x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 4 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
      %alloc_13 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 5 : i32} : memref<128x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_13 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 5 : i32} : memref<128x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 5 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
      %alloc_14 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 6 : i32} : memref<128x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_14 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 6 : i32} : memref<128x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 6 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
      %29 = scf.for %arg18 = %c-1_i32 to %28 step %c1_i32 iter_args(%arg19 = %4) -> (tensor<128x32xf32>)  : i32 {
        %30 = arith.truncf %arg19 {DataUse, ssbuffer.block_id = 9 : i32} : tensor<128x32xf32> to tensor<128x32xbf16>
        %31 = arith.subi %20, %arg18 {MixUse, ssbuffer.block_id = 9 : i32} : i32
        %32 = arith.addi %31, %c-1_i32 {MixUse, ssbuffer.block_id = 9 : i32} : i32
        %33 = arith.maxsi %21, %c0_i32 {ssbuffer.block_id = 9 : i32} : i32
        %34 = arith.index_cast %33 {ssbuffer.block_id = 9 : i32} : i32 to index
        %35 = arith.subi %c0_i32, %21 {ssbuffer.block_id = 9 : i32} : i32
        %36 = arith.maxsi %35, %c0_i32 {ssbuffer.block_id = 9 : i32} : i32
        %37 = arith.index_cast %36 {ssbuffer.block_id = 9 : i32} : i32 to index
        %38 = arith.extsi %32 {MixUse, ssbuffer.block_id = 9 : i32} : i32 to i64
        %39 = arith.muli %38, %c524288_i64 {ssbuffer.block_id = 9 : i32} : i64
        %40 = arith.addi %19, %39 {ssbuffer.block_id = 9 : i32} : i64
        %41 = arith.index_cast %40 {ssbuffer.block_id = 9 : i32} : i64 to index
        %42 = arith.addi %41, %34 {ssbuffer.block_id = 9 : i32} : index
        %reinterpret_cast = memref.reinterpret_cast %arg7 to offset: [%42], sizes: [128, 32], strides: [128, 1] {ssbuffer.block_id = 9 : i32} : memref<?xbf16> to memref<128x32xbf16, strided<[128, 1], offset: ?>>
        %43 = arith.divsi %34, %c128 {ssbuffer.block_id = 9 : i32} : index
        %44 = arith.subi %c128, %43 {ssbuffer.block_id = 9 : i32} : index
        %45 = arith.maxsi %44, %c0 {ssbuffer.block_id = 9 : i32} : index
        %46 = arith.minsi %45, %c128 {ssbuffer.block_id = 9 : i32} : index
        %47 = arith.remsi %34, %c128 {ssbuffer.block_id = 9 : i32} : index
        %48 = arith.subi %c128, %47 {ssbuffer.block_id = 9 : i32} : index
        %49 = arith.maxsi %48, %c0 {ssbuffer.block_id = 9 : i32} : index
        %50 = arith.minsi %49, %c32 {ssbuffer.block_id = 9 : i32} : index
        %51 = arith.minsi %46, %c0 {ssbuffer.block_id = 9 : i32} : index
        %52 = arith.subi %46, %51 {ssbuffer.block_id = 9 : i32} : index
        %53 = arith.minsi %37, %50 {ssbuffer.block_id = 9 : i32} : index
        %54 = arith.subi %50, %53 {ssbuffer.block_id = 9 : i32} : index
        %extracted_slice = tensor.extract_slice %30[%51, %53] [%52, %54] [1, 1] {ssbuffer.block_id = 9 : i32} : tensor<128x32xbf16> to tensor<?x?xbf16>
        %subview = memref.subview %reinterpret_cast[0, 0] [%52, %54] [1, 1] {ssbuffer.block_id = 9 : i32} : memref<128x32xbf16, strided<[128, 1], offset: ?>> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        %reshape = tensor.reshape %30(%cst_6) {ssbuffer.block_id = 9 : i32} : (tensor<128x32xbf16>, tensor<3xi64>) -> tensor<128x2x16xbf16>
        %55 = tensor.empty() {ssbuffer.block_id = 9 : i32} : tensor<2x128x16xbf16>
        %transposed = linalg.transpose ins(%reshape : tensor<128x2x16xbf16>) outs(%55 : tensor<2x128x16xbf16>) permutation = [1, 0, 2]  {ssbuffer.block_id = 9 : i32}
        %reshape_15 = tensor.reshape %transposed(%cst_5) {ssbuffer.block_id = 9 : i32} : (tensor<2x128x16xbf16>, tensor<4xi64>) -> tensor<2x8x16x16xbf16>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 9 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.copy ins(%reshape_15 : tensor<2x8x16x16xbf16>) outs(%alloc : memref<2x8x16x16xbf16, #hivm.address_space<cbuf>>) {ssbuffer.block_id = 9 : i32, ssbuffer.crossCoreDeps = [0 : i32, 1 : i32], ssbuffer.transfer_id = 0 : i32}
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 9 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
        bufferization.materialize_in_destination %extracted_slice in writable %subview {ssbuffer.block_id = 9 : i32} : (tensor<?x?xbf16>, memref<?x?xbf16, strided<[128, 1], offset: ?>>) -> ()
        %56 = arith.subi %20, %arg18 {MixUse, ssbuffer.block_id = 10 : i32} : i32
        %57 = arith.addi %56, %c-1_i32 {MixUse, ssbuffer.block_id = 10 : i32} : i32
        %58 = arith.maxsi %21, %c0_i32 {ssbuffer.block_id = 10 : i32} : i32
        %59 = arith.index_cast %58 {ssbuffer.block_id = 10 : i32} : i32 to index
        %60 = arith.subi %c0_i32, %21 {ssbuffer.block_id = 10 : i32} : i32
        %61 = arith.maxsi %60, %c0_i32 {ssbuffer.block_id = 10 : i32} : i32
        %62 = arith.index_cast %61 {ssbuffer.block_id = 10 : i32} : i32 to index
        %63 = arith.muli %57, %c64_i32 {MixUse, ssbuffer.block_id = 10 : i32} : i32
        %64 = arith.maxsi %63, %c0_i32 {ssbuffer.block_id = 10 : i32} : i32
        %65 = arith.index_cast %64 {ssbuffer.block_id = 10 : i32} : i32 to index
        %66 = arith.muli %65, %c32 {ssbuffer.block_id = 10 : i32} : index
        %67 = arith.addi %66, %24 {ssbuffer.block_id = 10 : i32} : index
        %68 = arith.index_cast %arg11 {ssbuffer.block_id = 10 : i32} : i32 to index
        %reinterpret_cast_16 = memref.reinterpret_cast %arg5 to offset: [%67], sizes: [64], strides: [32] {ssbuffer.block_id = 10 : i32} : memref<?xf32> to memref<64xf32, strided<[32], offset: ?>>
        %alloc_17 = memref.alloc() {ssbuffer.block_id = 10 : i32} : memref<64xf32>
        %69 = arith.divsi %66, %c32 {ssbuffer.block_id = 10 : i32} : index
        %70 = arith.subi %68, %69 {ssbuffer.block_id = 10 : i32} : index
        %71 = arith.maxsi %70, %c0 {ssbuffer.block_id = 10 : i32} : index
        %72 = arith.minsi %71, %c64 {ssbuffer.block_id = 10 : i32} : index
        %73 = arith.subi %c0_i32, %63 {ssbuffer.block_id = 10 : i32} : i32
        %74 = arith.maxsi %73, %c0_i32 {ssbuffer.block_id = 10 : i32} : i32
        %75 = arith.index_cast %74 {ssbuffer.block_id = 10 : i32} : i32 to index
        %76 = arith.minsi %75, %72 {ssbuffer.block_id = 10 : i32} : index
        %77 = arith.subi %72, %76 {ssbuffer.block_id = 10 : i32} : index
        %78 = arith.cmpi slt, %77, %c64 {ssbuffer.block_id = 10 : i32} : index
        scf.if %78 {
          linalg.fill {ssbuffer.block_id = 10 : i32} ins(%cst_7 : f32) outs(%alloc_17 : memref<64xf32>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 10 : i32}
        %subview_18 = memref.subview %reinterpret_cast_16[0] [%77] [1] {ssbuffer.block_id = 10 : i32} : memref<64xf32, strided<[32], offset: ?>> to memref<?xf32, strided<[32], offset: ?>>
        %subview_19 = memref.subview %alloc_17[%76] [%77] [1] {ssbuffer.block_id = 10 : i32} : memref<64xf32> to memref<?xf32, strided<[1], offset: ?>>
        memref.copy %subview_18, %subview_19 {ssbuffer.block_id = 10 : i32} : memref<?xf32, strided<[32], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
        %79 = bufferization.to_tensor %alloc_17 restrict writable {ssbuffer.block_id = 10 : i32} : memref<64xf32> to tensor<64xf32>
        %80 = math.exp %79 {DataUse, ssbuffer.block_id = 10 : i32} : tensor<64xf32>
        %81 = arith.muli %65, %c4096 {ssbuffer.block_id = 10 : i32} : index
        %82 = arith.addi %81, %15 {ssbuffer.block_id = 10 : i32} : index
        %83 = arith.addi %82, %59 {ssbuffer.block_id = 10 : i32} : index
        %reinterpret_cast_20 = memref.reinterpret_cast %arg6 to offset: [%83], sizes: [64, 32], strides: [4096, 1] {ssbuffer.block_id = 10 : i32} : memref<?xbf16> to memref<64x32xbf16, strided<[4096, 1], offset: ?>>
        %alloc_21 = memref.alloc() {ssbuffer.block_id = 10 : i32} : memref<64x32xbf16>
        %84 = arith.subi %83, %15 {ssbuffer.block_id = 10 : i32} : index
        %85 = arith.divsi %84, %c4096 {ssbuffer.block_id = 10 : i32} : index
        %86 = arith.subi %68, %85 {ssbuffer.block_id = 10 : i32} : index
        %87 = arith.maxsi %86, %c0 {ssbuffer.block_id = 10 : i32} : index
        %88 = arith.minsi %87, %c64 {ssbuffer.block_id = 10 : i32} : index
        %89 = arith.remsi %84, %c4096 {ssbuffer.block_id = 10 : i32} : index
        %90 = arith.subi %c128, %89 {ssbuffer.block_id = 10 : i32} : index
        %91 = arith.maxsi %90, %c0 {ssbuffer.block_id = 10 : i32} : index
        %92 = arith.minsi %91, %c32 {ssbuffer.block_id = 10 : i32} : index
        %93 = arith.minsi %75, %88 {ssbuffer.block_id = 10 : i32} : index
        %94 = arith.subi %88, %93 {ssbuffer.block_id = 10 : i32} : index
        %95 = arith.minsi %62, %92 {ssbuffer.block_id = 10 : i32} : index
        %96 = arith.subi %92, %95 {ssbuffer.block_id = 10 : i32} : index
        %97 = arith.cmpi slt, %94, %c64 {ssbuffer.block_id = 10 : i32} : index
        %98 = arith.cmpi slt, %96, %c32 {ssbuffer.block_id = 10 : i32} : index
        %99 = arith.ori %97, %98 {ssbuffer.block_id = 10 : i32} : i1
        scf.if %99 {
          linalg.fill {ssbuffer.block_id = 10 : i32} ins(%cst_8 : bf16) outs(%alloc_21 : memref<64x32xbf16>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 10 : i32}
        %subview_22 = memref.subview %reinterpret_cast_20[0, 0] [%94, %96] [1, 1] {ssbuffer.block_id = 10 : i32} : memref<64x32xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
        %subview_23 = memref.subview %alloc_21[%93, %95] [%94, %96] [1, 1] {ssbuffer.block_id = 10 : i32} : memref<64x32xbf16> to memref<?x?xbf16, strided<[32, 1], offset: ?>>
        memref.copy %subview_22, %subview_23 {ssbuffer.block_id = 10 : i32} : memref<?x?xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[32, 1], offset: ?>>
        %100 = bufferization.to_tensor %alloc_21 restrict writable {ssbuffer.block_id = 10 : i32} : memref<64x32xbf16> to tensor<64x32xbf16>
        %101 = arith.divsi %81, %c4096 {ssbuffer.block_id = 10 : i32} : index
        %102 = arith.subi %68, %101 {ssbuffer.block_id = 10 : i32} : index
        %103 = arith.maxsi %102, %c0 {ssbuffer.block_id = 10 : i32} : index
        %104 = arith.minsi %103, %c64 {ssbuffer.block_id = 10 : i32} : index
        %105 = arith.remsi %81, %c4096 {ssbuffer.block_id = 10 : i32} : index
        %106 = arith.subi %c128, %105 {ssbuffer.block_id = 10 : i32} : index
        %107 = arith.maxsi %106, %c0 {ssbuffer.block_id = 10 : i32} : index
        %108 = arith.minsi %107, %c128 {ssbuffer.block_id = 10 : i32} : index
        %109 = arith.minsi %75, %104 {ssbuffer.block_id = 10 : i32} : index
        %110 = arith.subi %104, %109 {ssbuffer.block_id = 10 : i32} : index
        %111 = arith.minsi %108, %c0 {ssbuffer.block_id = 10 : i32} : index
        %112 = arith.subi %108, %111 {ssbuffer.block_id = 10 : i32} : index
        %113 = arith.cmpi slt, %110, %c64 {ssbuffer.block_id = 10 : i32} : index
        %114 = arith.cmpi slt, %112, %c128 {ssbuffer.block_id = 10 : i32} : index
        %115 = arith.ori %113, %114 {ssbuffer.block_id = 10 : i32} : i1
        %116 = tensor.empty() {ssbuffer.block_id = 10 : i32} : tensor<128x64xbf16>
        %reinterpret_cast_24 = memref.reinterpret_cast %arg2 to offset: [%82], sizes: [64, 128], strides: [4096, 1] {ssbuffer.block_id = 10 : i32} : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
        %alloc_25 = memref.alloc() {ssbuffer.block_id = 10 : i32} : memref<64x128xbf16>
        scf.if %115 {
          linalg.fill {ssbuffer.block_id = 10 : i32} ins(%cst_8 : bf16) outs(%alloc_25 : memref<64x128xbf16>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 10 : i32}
        %subview_26 = memref.subview %reinterpret_cast_24[0, 0] [%110, %112] [1, 1] {ssbuffer.block_id = 10 : i32} : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
        %subview_27 = memref.subview %alloc_25[%109, %111] [%110, %112] [1, 1] {ssbuffer.block_id = 10 : i32} : memref<64x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        memref.copy %subview_26, %subview_27 {ssbuffer.block_id = 10 : i32} : memref<?x?xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        %117 = bufferization.to_tensor %alloc_25 restrict writable {ssbuffer.block_id = 10 : i32} : memref<64x128xbf16> to tensor<64x128xbf16>
        %transposed_28 = linalg.transpose ins(%117 : tensor<64x128xbf16>) outs(%116 : tensor<128x64xbf16>) permutation = [1, 0]  {ssbuffer.block_id = 10 : i32}
        %118 = arith.extf %transposed_28 {DataUse, ssbuffer.block_id = 10 : i32} : tensor<128x64xbf16> to tensor<128x64xf32>
        %119 = tensor.empty() {ssbuffer.block_id = 10 : i32} : tensor<128x64xf32>
        %broadcasted = linalg.broadcast ins(%80 : tensor<64xf32>) outs(%119 : tensor<128x64xf32>) dimensions = [0]  {ssbuffer.block_id = 10 : i32}
        %120 = arith.mulf %118, %broadcasted {DataUse, ssbuffer.block_id = 10 : i32} : tensor<128x64xf32>
        %121 = arith.extf %100 {DataUse, ssbuffer.block_id = 10 : i32} : tensor<64x32xbf16> to tensor<64x32xf32>
        %reshape_29 = tensor.reshape %120(%cst_4) {ssbuffer.block_id = 10 : i32} : (tensor<128x64xf32>, tensor<3xi64>) -> tensor<128x8x8xf32>
        %122 = tensor.empty() {ssbuffer.block_id = 10 : i32} : tensor<8x128x8xf32>
        %transposed_30 = linalg.transpose ins(%reshape_29 : tensor<128x8x8xf32>) outs(%122 : tensor<8x128x8xf32>) permutation = [1, 0, 2]  {ssbuffer.block_id = 10 : i32}
        %reshape_31 = tensor.reshape %transposed_30(%cst_3) {ssbuffer.block_id = 10 : i32} : (tensor<8x128x8xf32>, tensor<4xi64>) -> tensor<8x8x16x8xf32>
        %reshape_32 = tensor.reshape %121(%cst_2) {ssbuffer.block_id = 10 : i32} : (tensor<64x32xf32>, tensor<3xi64>) -> tensor<64x4x8xf32>
        %123 = tensor.empty() {ssbuffer.block_id = 10 : i32} : tensor<4x64x8xf32>
        %transposed_33 = linalg.transpose ins(%reshape_32 : tensor<64x4x8xf32>) outs(%123 : tensor<4x64x8xf32>) permutation = [1, 0, 2]  {ssbuffer.block_id = 10 : i32}
        %reshape_34 = tensor.reshape %transposed_33(%cst_1) {ssbuffer.block_id = 10 : i32} : (tensor<4x64x8xf32>, tensor<4xi64>) -> tensor<4x4x16x8xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 10 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 2
        hivm.hir.copy ins(%reshape_31 : tensor<8x8x16x8xf32>) outs(%alloc_9 : memref<8x8x16x8xf32, #hivm.address_space<cbuf>>) {ssbuffer.block_id = 10 : i32, ssbuffer.crossCoreDeps = [1 : i32, 1 : i32], ssbuffer.transfer_id = 1 : i32}
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 10 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 10 : i32, ssbuffer.transfer_id = 2 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 3
        hivm.hir.copy ins(%reshape_34 : tensor<4x4x16x8xf32>) outs(%alloc_10 : memref<4x4x16x8xf32, #hivm.address_space<cbuf>>) {ssbuffer.block_id = 10 : i32, ssbuffer.crossCoreDeps = [2 : i32, 1 : i32], ssbuffer.transfer_id = 2 : i32}
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 10 : i32, ssbuffer.transfer_id = 2 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 3
        %124 = arith.muli %56, %c64_i32 {MixUse, ssbuffer.block_id = 11 : i32} : i32
        %125 = arith.minsi %124, %arg11 {MixUse, ssbuffer.block_id = 11 : i32} : i32
        %126 = arith.subi %125, %c1_i32 {MixUse, ssbuffer.block_id = 11 : i32} : i32
        %127 = arith.addi %7, %126 {MixUse, ssbuffer.block_id = 11 : i32} : i32
        %128 = arith.muli %127, %c32_i32 {ssbuffer.block_id = 11 : i32} : i32
        %129 = arith.index_cast %128 {ssbuffer.block_id = 11 : i32} : i32 to index
        %130 = arith.addi %129, %23 {ssbuffer.block_id = 11 : i32} : index
        %reinterpret_cast_35 = memref.reinterpret_cast %arg5 to offset: [%130], sizes: [1], strides: [1] {ssbuffer.block_id = 11 : i32} : memref<?xf32> to memref<1xf32, strided<[1], offset: ?>>
        %131 = memref.load %reinterpret_cast_35[%c0] {ssbuffer.block_id = 11 : i32} : memref<1xf32, strided<[1], offset: ?>>
        %132 = tensor.empty() {ssbuffer.block_id = 11 : i32} : tensor<1xf32>
        %inserted = tensor.insert %131 into %132[%c0] {ssbuffer.block_id = 11 : i32} : tensor<1xf32>
        %133 = math.exp %inserted {DataUse, ssbuffer.block_id = 11 : i32} : tensor<1xf32>
        %extracted = tensor.extract %133[%c0] {DataUse, ssbuffer.block_id = 11 : i32} : tensor<1xf32>
        %reinterpret_cast_36 = memref.reinterpret_cast %arg8 to offset: [%83], sizes: [64, 32], strides: [4096, 1] {ssbuffer.block_id = 11 : i32} : memref<?xbf16> to memref<64x32xbf16, strided<[4096, 1], offset: ?>>
        %134 = linalg.fill {ssbuffer.block_id = 11 : i32} ins(%131 : f32) outs(%1 : tensor<64xf32>) -> tensor<64xf32>
        %135 = arith.subf %134, %79 {DataUse, ssbuffer.block_id = 11 : i32} : tensor<64xf32>
        %136 = math.exp %135 {DataUse, ssbuffer.block_id = 11 : i32} : tensor<64xf32>
        %137 = arith.index_cast %63 {DataUse, ssbuffer.block_id = 11 : i32} : i32 to index
        %138 = arith.addi %137, %c64 {DataUse, ssbuffer.block_id = 11 : i32} : index
        %139 = arith.index_cast %arg11 {DataUse, ssbuffer.block_id = 11 : i32} : i32 to index
        %140 = arith.maxsi %137, %139 {DataUse, ssbuffer.block_id = 11 : i32} : index
        %141 = arith.minsi %138, %140 {DataUse, ssbuffer.block_id = 11 : i32} : index
        %142 = arith.subi %141, %137 {DataUse, ssbuffer.block_id = 11 : i32} : index
        %extracted_slice_37 = tensor.extract_slice %136[0] [%142] [1] {DataUse, ssbuffer.block_id = 11 : i32} : tensor<64xf32> to tensor<?xf32>
        %inserted_slice = tensor.insert_slice %extracted_slice_37 into %2[0] [%142] [1] {DataUse, ssbuffer.block_id = 11 : i32} : tensor<?xf32> into tensor<64xf32>
        %alloc_38 = memref.alloc() {ssbuffer.block_id = 11 : i32} : memref<64x32xbf16>
        scf.if %99 {
          linalg.fill {ssbuffer.block_id = 11 : i32} ins(%cst_8 : bf16) outs(%alloc_38 : memref<64x32xbf16>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 11 : i32}
        %subview_39 = memref.subview %reinterpret_cast_36[0, 0] [%94, %96] [1, 1] {ssbuffer.block_id = 11 : i32} : memref<64x32xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
        %subview_40 = memref.subview %alloc_38[%93, %95] [%94, %96] [1, 1] {ssbuffer.block_id = 11 : i32} : memref<64x32xbf16> to memref<?x?xbf16, strided<[32, 1], offset: ?>>
        memref.copy %subview_39, %subview_40 {ssbuffer.block_id = 11 : i32} : memref<?x?xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[32, 1], offset: ?>>
        %143 = bufferization.to_tensor %alloc_38 restrict writable {ssbuffer.block_id = 11 : i32} : memref<64x32xbf16> to tensor<64x32xbf16>
        %144 = arith.extf %143 {DataUse, ssbuffer.block_id = 11 : i32} : tensor<64x32xbf16> to tensor<64x32xf32>
        %145 = linalg.fill {ssbuffer.block_id = 11 : i32} ins(%extracted : f32) outs(%3 : tensor<128x32xf32>) -> tensor<128x32xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 12 : i32, ssbuffer.transfer_id = 4 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 5
        %memspacecast = memref.memory_space_cast %alloc_12 {ssbuffer.block_id = 12 : i32, ssbuffer.crossCoreDeps = [4 : i32, 0 : i32], ssbuffer.transfer_id = 4 : i32} : memref<64x32xf32, #hivm.address_space<ub>> to memref<64x32xf32>
        %146 = bufferization.to_tensor %memspacecast restrict writable {ssbuffer.block_id = 12 : i32, ssbuffer.transfer_id = 4 : i32} : memref<64x32xf32> to tensor<64x32xf32>
        %147 = arith.subi %20, %arg18 {MixUse, ssbuffer.block_id = 12 : i32} : i32
        %148 = arith.addi %147, %c-1_i32 {MixUse, ssbuffer.block_id = 12 : i32} : i32
        %149 = arith.maxsi %21, %c0_i32 {ssbuffer.block_id = 12 : i32} : i32
        %150 = arith.index_cast %149 {ssbuffer.block_id = 12 : i32} : i32 to index
        %151 = arith.subi %c0_i32, %21 {ssbuffer.block_id = 12 : i32} : i32
        %152 = arith.maxsi %151, %c0_i32 {ssbuffer.block_id = 12 : i32} : i32
        %153 = arith.index_cast %152 {ssbuffer.block_id = 12 : i32} : i32 to index
        %154 = arith.muli %148, %c64_i32 {MixUse, ssbuffer.block_id = 12 : i32} : i32
        %155 = arith.maxsi %154, %c0_i32 {ssbuffer.block_id = 12 : i32} : i32
        %156 = arith.index_cast %155 {ssbuffer.block_id = 12 : i32} : i32 to index
        %157 = arith.index_cast %arg11 {ssbuffer.block_id = 12 : i32} : i32 to index
        %158 = arith.subi %c0_i32, %154 {ssbuffer.block_id = 12 : i32} : i32
        %159 = arith.maxsi %158, %c0_i32 {ssbuffer.block_id = 12 : i32} : i32
        %160 = arith.index_cast %159 {ssbuffer.block_id = 12 : i32} : i32 to index
        %161 = arith.muli %156, %c4096 {ssbuffer.block_id = 12 : i32} : index
        %162 = arith.addi %161, %15 {ssbuffer.block_id = 12 : i32} : index
        %163 = arith.addi %162, %150 {ssbuffer.block_id = 12 : i32} : index
        %164 = arith.subi %163, %15 {ssbuffer.block_id = 12 : i32} : index
        %165 = arith.divsi %164, %c4096 {ssbuffer.block_id = 12 : i32} : index
        %166 = arith.subi %157, %165 {ssbuffer.block_id = 12 : i32} : index
        %167 = arith.maxsi %166, %c0 {ssbuffer.block_id = 12 : i32} : index
        %168 = arith.minsi %167, %c64 {ssbuffer.block_id = 12 : i32} : index
        %169 = arith.remsi %164, %c4096 {ssbuffer.block_id = 12 : i32} : index
        %170 = arith.subi %c128, %169 {ssbuffer.block_id = 12 : i32} : index
        %171 = arith.maxsi %170, %c0 {ssbuffer.block_id = 12 : i32} : index
        %172 = arith.minsi %171, %c32 {ssbuffer.block_id = 12 : i32} : index
        %173 = arith.minsi %160, %168 {ssbuffer.block_id = 12 : i32} : index
        %174 = arith.subi %168, %173 {ssbuffer.block_id = 12 : i32} : index
        %175 = arith.minsi %153, %172 {ssbuffer.block_id = 12 : i32} : index
        %176 = arith.subi %172, %175 {ssbuffer.block_id = 12 : i32} : index
        %reinterpret_cast_41 = memref.reinterpret_cast %arg9 to offset: [%163], sizes: [64, 32], strides: [4096, 1] {ssbuffer.block_id = 12 : i32} : memref<?xbf16> to memref<64x32xbf16, strided<[4096, 1], offset: ?>>
        %subview_42 = memref.subview %reinterpret_cast_41[0, 0] [%174, %176] [1, 1] {ssbuffer.block_id = 12 : i32} : memref<64x32xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
        %broadcasted_43 = linalg.broadcast ins(%inserted_slice : tensor<64xf32>) outs(%0 : tensor<64x32xf32>) dimensions = [1]  {ssbuffer.block_id = 12 : i32}
        %177 = arith.mulf %146, %broadcasted_43 {DataUse, ssbuffer.block_id = 12 : i32} : tensor<64x32xf32>
        %178 = arith.addf %177, %144 {DataUse, ssbuffer.block_id = 12 : i32} : tensor<64x32xf32>
        %179 = arith.truncf %178 {DataUse, ssbuffer.block_id = 12 : i32} : tensor<64x32xf32> to tensor<64x32xbf16>
        %extracted_slice_44 = tensor.extract_slice %179[%173, %175] [%174, %176] [1, 1] {ssbuffer.block_id = 12 : i32} : tensor<64x32xbf16> to tensor<?x?xbf16>
        %reshape_45 = tensor.reshape %179(%cst_0) {ssbuffer.block_id = 12 : i32} : (tensor<64x32xbf16>, tensor<3xi64>) -> tensor<64x2x16xbf16>
        %180 = tensor.empty() {ssbuffer.block_id = 12 : i32} : tensor<2x64x16xbf16>
        %transposed_46 = linalg.transpose ins(%reshape_45 : tensor<64x2x16xbf16>) outs(%180 : tensor<2x64x16xbf16>) permutation = [1, 0, 2]  {ssbuffer.block_id = 12 : i32}
        %reshape_47 = tensor.reshape %transposed_46(%cst) {ssbuffer.block_id = 12 : i32} : (tensor<2x64x16xbf16>, tensor<4xi64>) -> tensor<2x4x16x16xbf16>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 12 : i32, ssbuffer.transfer_id = 3 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 4
        hivm.hir.copy ins(%reshape_47 : tensor<2x4x16x16xbf16>) outs(%alloc_11 : memref<2x4x16x16xbf16, #hivm.address_space<cbuf>>) {ssbuffer.block_id = 12 : i32, ssbuffer.crossCoreDeps = [3 : i32, 1 : i32], ssbuffer.transfer_id = 3 : i32}
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 12 : i32, ssbuffer.transfer_id = 3 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
        bufferization.materialize_in_destination %extracted_slice_44 in writable %subview_42 {ssbuffer.block_id = 12 : i32} : (tensor<?x?xbf16>, memref<?x?xbf16, strided<[4096, 1], offset: ?>>) -> ()
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 12 : i32, ssbuffer.transfer_id = 4 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 14 : i32, ssbuffer.transfer_id = 6 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 7
        %memspacecast_48 = memref.memory_space_cast %alloc_14 {ssbuffer.block_id = 14 : i32, ssbuffer.crossCoreDeps = [6 : i32, 0 : i32], ssbuffer.transfer_id = 6 : i32} : memref<128x32xf32, #hivm.address_space<ub>> to memref<128x32xf32>
        %181 = bufferization.to_tensor %memspacecast_48 restrict writable {ssbuffer.block_id = 14 : i32, ssbuffer.transfer_id = 6 : i32} : memref<128x32xf32> to tensor<128x32xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 14 : i32, ssbuffer.transfer_id = 5 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 6
        %memspacecast_49 = memref.memory_space_cast %alloc_13 {ssbuffer.block_id = 14 : i32, ssbuffer.crossCoreDeps = [5 : i32, 0 : i32], ssbuffer.transfer_id = 5 : i32} : memref<128x32xf32, #hivm.address_space<ub>> to memref<128x32xf32>
        %182 = bufferization.to_tensor %memspacecast_49 restrict writable {ssbuffer.block_id = 14 : i32, ssbuffer.transfer_id = 5 : i32} : memref<128x32xf32> to tensor<128x32xf32>
        %183 = arith.mulf %182, %25 {DataUse, ssbuffer.block_id = 14 : i32} : tensor<128x32xf32>
        %184 = arith.mulf %arg19, %145 {DataUse, ssbuffer.block_id = 14 : i32} : tensor<128x32xf32>
        %185 = arith.subf %183, %181 {DataUse, ssbuffer.block_id = 14 : i32} : tensor<128x32xf32>
        %186 = arith.addf %184, %185 {DataUse, ssbuffer.block_id = 14 : i32} : tensor<128x32xf32>
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 14 : i32, ssbuffer.transfer_id = 5 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 14 : i32, ssbuffer.transfer_id = 6 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
        scf.yield {Undefined} %186 : tensor<128x32xf32>
      } {Undefined, ssbuffer.block_id = 15 : i32, ssbuffer.main_loop = 0 : i32}
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 3 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 4
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 2 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 3
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 2
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
      scope.return
    } {hivm.matmul_limited_in_cube, hivm.tcore_type = #hivm.tcore_type<VECTOR>}
    scope.scope : () -> () {
      %0 = tensor.empty() {ssbuffer.block_id = 1 : i32} : tensor<64x32xf32>
      %1 = linalg.fill {ssbuffer.block_id = 1 : i32} ins(%cst_7 : f32) outs(%0 : tensor<64x32xf32>) -> tensor<64x32xf32>
      %2 = tensor.empty() {ssbuffer.block_id = 1 : i32} : tensor<128x32xf32>
      %3 = linalg.fill {ssbuffer.block_id = 1 : i32} ins(%cst_7 : f32) outs(%2 : tensor<128x32xf32>) -> tensor<128x32xf32>
      %4 = arith.divsi %arg16, %c32_i32 {MixUse, ssbuffer.block_id = 1 : i32} : i32
      %5 = arith.remsi %arg16, %c32_i32 {MixUse, ssbuffer.block_id = 1 : i32} : i32
      %6 = arith.muli %4, %arg11 {MixUse, ssbuffer.block_id = 1 : i32} : i32
      %7 = arith.addi %arg11, %c63_i32 {MixUse, ssbuffer.block_id = 1 : i32} : i32
      %8 = arith.divsi %7, %c64_i32 {MixUse, ssbuffer.block_id = 1 : i32} : i32
      %9 = arith.muli %6, %c32_i32 {MixUse, ssbuffer.block_id = 1 : i32} : i32
      %10 = arith.addi %9, %5 {ssbuffer.block_id = 1 : i32} : i32
      %11 = arith.extsi %10 {ssbuffer.block_id = 1 : i32} : i32 to i64
      %12 = arith.muli %11, %c128_i64 {ssbuffer.block_id = 1 : i32} : i64
      %13 = arith.index_cast %12 {ssbuffer.block_id = 1 : i32} : i64 to index
      %14 = arith.subi %8, %c1_i32 {MixUse, ssbuffer.block_id = 1 : i32} : i32
      %alloc = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32} : memref<2x8x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32} : memref<2x8x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
      %alloc_9 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} : memref<8x8x16x8xf32, #hivm.address_space<cbuf>>
      annotation.mark %alloc_9 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} : memref<8x8x16x8xf32, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 2
      %alloc_10 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 2 : i32} : memref<4x4x16x8xf32, #hivm.address_space<cbuf>>
      annotation.mark %alloc_10 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 2 : i32} : memref<4x4x16x8xf32, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 2 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 3
      %alloc_11 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 3 : i32} : memref<2x4x16x16xbf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_11 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 3 : i32} : memref<2x4x16x16xbf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 3 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 4
      %alloc_12 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 4 : i32} : memref<64x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_12 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 4 : i32} : memref<64x32xf32, #hivm.address_space<ub>>
      %alloc_13 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 5 : i32} : memref<128x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_13 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 5 : i32} : memref<128x32xf32, #hivm.address_space<ub>>
      %alloc_14 = memref.alloc() {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 6 : i32} : memref<128x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_14 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 6 : i32} : memref<128x32xf32, #hivm.address_space<ub>>
      scf.for %arg18 = %c-1_i32 to %14 step %c1_i32  : i32 {
        %15 = arith.subi %14, %arg18 {MixUse, ssbuffer.block_id = 3 : i32} : i32
        %16 = arith.addi %15, %c-1_i32 {MixUse, ssbuffer.block_id = 3 : i32} : i32
        %17 = arith.muli %16, %c64_i32 {MixUse, ssbuffer.block_id = 3 : i32} : i32
        %18 = arith.maxsi %17, %c0_i32 {ssbuffer.block_id = 3 : i32} : i32
        %19 = arith.index_cast %18 {ssbuffer.block_id = 3 : i32} : i32 to index
        %20 = arith.index_cast %arg11 {ssbuffer.block_id = 3 : i32} : i32 to index
        %21 = arith.subi %c0_i32, %17 {ssbuffer.block_id = 3 : i32} : i32
        %22 = arith.maxsi %21, %c0_i32 {ssbuffer.block_id = 3 : i32} : i32
        %23 = arith.index_cast %22 {ssbuffer.block_id = 3 : i32} : i32 to index
        %24 = arith.muli %19, %c4096 {ssbuffer.block_id = 3 : i32} : index
        %25 = arith.addi %24, %13 {ssbuffer.block_id = 3 : i32} : index
        %reinterpret_cast = memref.reinterpret_cast %arg3 to offset: [%25], sizes: [64, 128], strides: [4096, 1] {ssbuffer.block_id = 3 : i32} : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
        %alloc_15 = memref.alloc() {ssbuffer.block_id = 3 : i32} : memref<64x128xbf16>
        %26 = arith.divsi %24, %c4096 {ssbuffer.block_id = 3 : i32} : index
        %27 = arith.subi %20, %26 {ssbuffer.block_id = 3 : i32} : index
        %28 = arith.maxsi %27, %c0 {ssbuffer.block_id = 3 : i32} : index
        %29 = arith.minsi %28, %c64 {ssbuffer.block_id = 3 : i32} : index
        %30 = arith.remsi %24, %c4096 {ssbuffer.block_id = 3 : i32} : index
        %31 = arith.subi %c128, %30 {ssbuffer.block_id = 3 : i32} : index
        %32 = arith.maxsi %31, %c0 {ssbuffer.block_id = 3 : i32} : index
        %33 = arith.minsi %32, %c128 {ssbuffer.block_id = 3 : i32} : index
        %34 = arith.minsi %23, %29 {ssbuffer.block_id = 3 : i32} : index
        %35 = arith.subi %29, %34 {ssbuffer.block_id = 3 : i32} : index
        %36 = arith.minsi %33, %c0 {ssbuffer.block_id = 3 : i32} : index
        %37 = arith.subi %33, %36 {ssbuffer.block_id = 3 : i32} : index
        %38 = arith.cmpi slt, %35, %c64 {ssbuffer.block_id = 3 : i32} : index
        %39 = arith.cmpi slt, %37, %c128 {ssbuffer.block_id = 3 : i32} : index
        %40 = arith.ori %38, %39 {ssbuffer.block_id = 3 : i32} : i1
        scf.if %40 {
          linalg.fill {ssbuffer.block_id = 3 : i32} ins(%cst_8 : bf16) outs(%alloc_15 : memref<64x128xbf16>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 3 : i32}
        %subview = memref.subview %reinterpret_cast[0, 0] [%35, %37] [1, 1] {ssbuffer.block_id = 3 : i32} : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
        %subview_16 = memref.subview %alloc_15[%34, %36] [%35, %37] [1, 1] {ssbuffer.block_id = 3 : i32} : memref<64x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        memref.copy %subview, %subview_16 {ssbuffer.block_id = 3 : i32} : memref<?x?xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        %41 = bufferization.to_tensor %alloc_15 restrict writable {ssbuffer.block_id = 3 : i32} : memref<64x128xbf16> to tensor<64x128xbf16>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
        %42 = hivm.hir.convert_layout %alloc output_shape [128, 32] {dstLayout = #hivm.data_layout<ND>, srcLayout = #hivm.data_layout<nZ>, ssbuffer.block_id = 3 : i32, ssbuffer.crossCoreDeps = [0 : i32, 0 : i32], ssbuffer.transfer_id = 0 : i32} : (memref<2x8x16x16xbf16, #hivm.address_space<cbuf>>) -> memref<128x32xbf16, #hivm.address_space<cbuf>>
        %memspacecast = memref.memory_space_cast %42 {ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 0 : i32} : memref<128x32xbf16, #hivm.address_space<cbuf>> to memref<128x32xbf16>
        %43 = bufferization.to_tensor %memspacecast restrict writable {ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 0 : i32} : memref<128x32xbf16> to tensor<128x32xbf16>
        %44 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 3 : i32, ssbuffer.loop_carried_l0c} ins(%41, %43 : tensor<64x128xbf16>, tensor<128x32xbf16>) outs(%1 : tensor<64x32xf32>) -> tensor<64x32xf32>
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 4 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 3 : i32, ssbuffer.crossCoreDeps = [4 : i32, 1 : i32], ssbuffer.transfer_id = 4 : i32} ins(%44 : tensor<64x32xf32>) outs(%alloc_12 : memref<64x32xf32, #hivm.address_space<ub>>)
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 4 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 5
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
        %45 = hivm.hir.convert_layout %alloc_9 output_shape [128, 64] {dstLayout = #hivm.data_layout<ND>, srcLayout = #hivm.data_layout<nZ>, ssbuffer.block_id = 5 : i32, ssbuffer.crossCoreDeps = [1 : i32, 0 : i32], ssbuffer.transfer_id = 1 : i32} : (memref<8x8x16x8xf32, #hivm.address_space<cbuf>>) -> memref<128x64xf32, #hivm.address_space<cbuf>>
        %memspacecast_17 = memref.memory_space_cast %45 {ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32} : memref<128x64xf32, #hivm.address_space<cbuf>> to memref<128x64xf32>
        %46 = bufferization.to_tensor %memspacecast_17 restrict writable {ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32} : memref<128x64xf32> to tensor<128x64xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 2 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 3
        %47 = hivm.hir.convert_layout %alloc_10 output_shape [64, 32] {dstLayout = #hivm.data_layout<ND>, srcLayout = #hivm.data_layout<nZ>, ssbuffer.block_id = 5 : i32, ssbuffer.crossCoreDeps = [2 : i32, 0 : i32], ssbuffer.transfer_id = 2 : i32} : (memref<4x4x16x8xf32, #hivm.address_space<cbuf>>) -> memref<64x32xf32, #hivm.address_space<cbuf>>
        %memspacecast_18 = memref.memory_space_cast %47 {ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 2 : i32} : memref<64x32xf32, #hivm.address_space<cbuf>> to memref<64x32xf32>
        %48 = bufferization.to_tensor %memspacecast_18 restrict writable {ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 2 : i32} : memref<64x32xf32> to tensor<64x32xf32>
        %49 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 5 : i32, ssbuffer.loop_carried_l0c} ins(%46, %48 : tensor<128x64xf32>, tensor<64x32xf32>) outs(%3 : tensor<128x32xf32>) -> tensor<128x32xf32>
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 2
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 2 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 3
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 5 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 5 : i32, ssbuffer.crossCoreDeps = [5 : i32, 1 : i32], ssbuffer.transfer_id = 5 : i32} ins(%49 : tensor<128x32xf32>) outs(%alloc_13 : memref<128x32xf32, #hivm.address_space<ub>>)
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 5 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 6
        %reinterpret_cast_19 = memref.reinterpret_cast %arg4 to offset: [%25], sizes: [64, 128], strides: [4096, 1] {ssbuffer.block_id = 7 : i32} : memref<?xbf16> to memref<64x128xbf16, strided<[4096, 1], offset: ?>>
        %alloc_20 = memref.alloc() {ssbuffer.block_id = 7 : i32} : memref<64x128xbf16>
        scf.if %40 {
          linalg.fill {ssbuffer.block_id = 7 : i32} ins(%cst_8 : bf16) outs(%alloc_20 : memref<64x128xbf16>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 7 : i32}
        %subview_21 = memref.subview %reinterpret_cast_19[0, 0] [%35, %37] [1, 1] {ssbuffer.block_id = 7 : i32} : memref<64x128xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[4096, 1], offset: ?>>
        %subview_22 = memref.subview %alloc_20[%34, %36] [%35, %37] [1, 1] {ssbuffer.block_id = 7 : i32} : memref<64x128xbf16> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        memref.copy %subview_21, %subview_22 {ssbuffer.block_id = 7 : i32} : memref<?x?xbf16, strided<[4096, 1], offset: ?>> to memref<?x?xbf16, strided<[128, 1], offset: ?>>
        %50 = bufferization.to_tensor %alloc_20 restrict writable {ssbuffer.block_id = 7 : i32} : memref<64x128xbf16> to tensor<64x128xbf16>
        %51 = tensor.empty() {ssbuffer.block_id = 7 : i32} : tensor<128x64xbf16>
        %transposed = linalg.transpose ins(%50 : tensor<64x128xbf16>) outs(%51 : tensor<128x64xbf16>) permutation = [1, 0]  {ssbuffer.block_id = 7 : i32}
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 3 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
        %52 = hivm.hir.convert_layout %alloc_11 output_shape [64, 32] {dstLayout = #hivm.data_layout<ND>, srcLayout = #hivm.data_layout<nZ>, ssbuffer.block_id = 7 : i32, ssbuffer.crossCoreDeps = [3 : i32, 0 : i32], ssbuffer.transfer_id = 3 : i32} : (memref<2x4x16x16xbf16, #hivm.address_space<cbuf>>) -> memref<64x32xbf16, #hivm.address_space<cbuf>>
        %memspacecast_23 = memref.memory_space_cast %52 {ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 3 : i32} : memref<64x32xbf16, #hivm.address_space<cbuf>> to memref<64x32xbf16>
        %53 = bufferization.to_tensor %memspacecast_23 restrict writable {ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 3 : i32} : memref<64x32xbf16> to tensor<64x32xbf16>
        %54 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 7 : i32, ssbuffer.loop_carried_l0c} ins(%transposed, %53 : tensor<128x64xbf16>, tensor<64x32xbf16>) outs(%3 : tensor<128x32xf32>) -> tensor<128x32xf32>
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 3 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 4
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 6 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 7 : i32, ssbuffer.crossCoreDeps = [6 : i32, 1 : i32], ssbuffer.transfer_id = 6 : i32} ins(%54 : tensor<128x32xf32>) outs(%alloc_14 : memref<128x32xf32, #hivm.address_space<ub>>)
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 6 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 7
      } {Undefined, ssbuffer.block_id = 15 : i32, ssbuffer.main_loop = 0 : i32}
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 6 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 5 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 4 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      scope.return
    } {hivm.matmul_limited_in_cube, hivm.tcore_type = #hivm.tcore_type<CUBE>}
    return
  }
}