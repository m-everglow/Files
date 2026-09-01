// [analyze-flag] Before AnalyzeFlag:
module attributes {hacc.target = #hacc.target<"Ascend950PR_9579">, ssbuffer.insertionOptimization, ssbuffer.inter_core_buf_count = 1 : i32, ssbuffer.intra_buf_count = 2 : i32, ssbuffer.load_store_buf_count = 1 : i32} {
  func.func @_jagged_flash_attention_bwd_basic_kernel(%arg0: memref<?xi8>, %arg1: memref<?xi8>, %arg2: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf16>, %arg6: memref<?xi64> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf16> {tt.tensor_kind = 1 : i32}, %arg8: memref<?xf16> {tt.tensor_kind = 1 : i32}, %arg9: memref<?xf16> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg11: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32, %arg26: i32, %arg27: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, global_kernel = "local", mix_mode = "mix", parallel_mode = "simd"} {
    %cst = arith.constant {ssbuffer.block_id = 25 : i32} dense<[2, 2, 16, 16]> : tensor<4xi64>
    %cst_0 = arith.constant {ssbuffer.block_id = 25 : i32} dense<[32, 2, 16]> : tensor<3xi64>
    %cst_1 = arith.constant {ssbuffer.block_id = 17 : i32} 0.000000e+00 : f16
    %c0_i64 = arith.constant {Undefined, ssbuffer.block_id = 17 : i32} 0 : i64
    %c32 = arith.constant {DataUse, ssbuffer.block_id = 17 : i32} 32 : index
    %c0 = arith.constant {DataUse, ssbuffer.block_id = 17 : i32} 0 : index
    %c32_i64 = arith.constant {DataUse, ssbuffer.block_id = 17 : i32} 32 : i64
    %cst_2 = arith.constant {ssbuffer.block_id = 17 : i32} 1.000000e+00 : f32
    %cst_3 = arith.constant {ssbuffer.block_id = 17 : i32} 0.000000e+00 : f32
    %c0_i32 = arith.constant {MixUse, ssbuffer.block_id = 17 : i32} 0 : i32
    %c32_i32 = arith.constant {ssbuffer.block_id = 17 : i32} 32 : i32
    %c1 = arith.constant {ssbuffer.block_id = 17 : i32} 1 : index
    scope.scope : () -> () {
      %0 = tensor.empty() {ssbuffer.block_id = 17 : i32} : tensor<32x32xf32>
      %1 = linalg.fill {ssbuffer.block_id = 17 : i32} ins(%cst_2 : f32) outs(%0 : tensor<32x32xf32>) -> tensor<32x32xf32>
      %2 = linalg.fill {ssbuffer.block_id = 17 : i32} ins(%cst_3 : f32) outs(%0 : tensor<32x32xf32>) -> tensor<32x32xf32>
      %3 = arith.index_cast %arg26 {ssbuffer.block_id = 17 : i32} : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg6 to offset: [%3], sizes: [1], strides: [1] {ssbuffer.block_id = 17 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %4 = memref.load %reinterpret_cast[%c0] {ssbuffer.block_id = 17 : i32} : memref<1xi64, strided<[1], offset: ?>>
      %5 = arith.addi %3, %c1 {ssbuffer.block_id = 17 : i32} : index
      %reinterpret_cast_4 = memref.reinterpret_cast %arg6 to offset: [%5], sizes: [1], strides: [1] {ssbuffer.block_id = 17 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %6 = memref.load %reinterpret_cast_4[%c0] {ssbuffer.block_id = 17 : i32} : memref<1xi64, strided<[1], offset: ?>>
      %7 = arith.subi %6, %4 {MixUse, ssbuffer.block_id = 17 : i32} : i64
      %8 = arith.extsi %arg21 {MixUse, ssbuffer.block_id = 17 : i32} : i32 to i64
      %9 = arith.minsi %7, %8 {MixUse, ssbuffer.block_id = 17 : i32} : i64
      %10 = tensor.empty() {ssbuffer.block_id = 17 : i32} : tensor<32xi32>
      %11 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = ["parallel"]} outs(%10 : tensor<32xi32>) attrs =  {ssbuffer.block_id = 17 : i32, tt.from_make_range, tt.make_range_offset = 0 : index, tt.make_range_size = 32 : index} {
      ^bb0(%out: i32):
        %88 = linalg.index 0 : index
        %89 = arith.index_cast %88 : index to i32
        linalg.yield %89 : i32
      } -> tensor<32xi32>
      %12 = arith.muli %arg25, %c32_i32 {MixUse, ssbuffer.block_id = 17 : i32} : i32
      %13 = linalg.fill {ssbuffer.block_id = 17 : i32} ins(%12 : i32) outs(%10 : tensor<32xi32>) -> tensor<32xi32>
      %14 = arith.extsi %11 {MixUse, ssbuffer.block_id = 17 : i32} : tensor<32xi32> to tensor<32xi64>
      %15 = arith.addi %13, %11 {MixUse, ssbuffer.block_id = 17 : i32} : tensor<32xi32>
      %16 = arith.index_cast %12 {ssbuffer.block_id = 17 : i32} : i32 to index
      %17 = arith.addi %16, %c32 {ssbuffer.block_id = 17 : i32} : index
      %18 = arith.index_cast %9 {ssbuffer.block_id = 17 : i32} : i64 to index
      %19 = arith.maxsi %16, %18 {ssbuffer.block_id = 17 : i32} : index
      %20 = arith.minsi %17, %19 {ssbuffer.block_id = 17 : i32} : index
      %21 = arith.subi %20, %16 {ssbuffer.block_id = 17 : i32} : index
      %22 = arith.sitofp %arg21 {DataUse, ssbuffer.block_id = 17 : i32} : i32 to f32
      %23 = linalg.fill {ssbuffer.block_id = 17 : i32} ins(%22 : f32) outs(%0 : tensor<32x32xf32>) -> tensor<32x32xf32>
      %24 = tensor.empty() {ssbuffer.block_id = 17 : i32} : tensor<32x32xi64>
      %25 = arith.extsi %15 {ssbuffer.block_id = 17 : i32} : tensor<32xi32> to tensor<32xi64>
      %broadcasted = linalg.broadcast ins(%25 : tensor<32xi64>) outs(%24 : tensor<32x32xi64>) dimensions = [0]  {ssbuffer.block_id = 17 : i32}
      %26 = tensor.empty() {ssbuffer.block_id = 17 : i32} : tensor<32x1xf32>
      %27 = linalg.fill {ssbuffer.block_id = 17 : i32} ins(%22 : f32) outs(%26 : tensor<32x1xf32>) -> tensor<32x1xf32>
      %28 = arith.index_cast %4 {ssbuffer.block_id = 17 : i32} : i64 to index
      %29 = arith.addi %16, %28 {ssbuffer.block_id = 17 : i32} : index
      %reinterpret_cast_5 = memref.reinterpret_cast %arg12 to offset: [%29], sizes: [32], strides: [1] {ssbuffer.block_id = 17 : i32} : memref<?xf32> to memref<32xf32, strided<[1], offset: ?>>
      %alloc = memref.alloc() {ssbuffer.block_id = 17 : i32} : memref<32xf32>
      %30 = arith.cmpi slt, %21, %c32 {ssbuffer.block_id = 17 : i32} : index
      scf.if %30 {
        linalg.fill {ssbuffer.block_id = 17 : i32} ins(%cst_3 : f32) outs(%alloc : memref<32xf32>)
      } {hivm.unlikely_condition, ssbuffer.block_id = 17 : i32}
      %subview = memref.subview %reinterpret_cast_5[0] [%21] [1] {ssbuffer.block_id = 17 : i32} : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
      %subview_6 = memref.subview %alloc[0] [%21] [1] {ssbuffer.block_id = 17 : i32} : memref<32xf32> to memref<?xf32, strided<[1]>>
      memref.copy %subview, %subview_6 {ssbuffer.block_id = 17 : i32} : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
      %31 = bufferization.to_tensor %alloc restrict writable {ssbuffer.block_id = 17 : i32} : memref<32xf32> to tensor<32xf32>
      %reinterpret_cast_7 = memref.reinterpret_cast %arg11 to offset: [%29], sizes: [32], strides: [1] {ssbuffer.block_id = 17 : i32} : memref<?xf32> to memref<32xf32, strided<[1], offset: ?>>
      %alloc_8 = memref.alloc() {ssbuffer.block_id = 17 : i32} : memref<32xf32>
      scf.if %30 {
        linalg.fill {ssbuffer.block_id = 17 : i32} ins(%cst_3 : f32) outs(%alloc_8 : memref<32xf32>)
      } {hivm.unlikely_condition, ssbuffer.block_id = 17 : i32}
      %subview_9 = memref.subview %reinterpret_cast_7[0] [%21] [1] {ssbuffer.block_id = 17 : i32} : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
      %subview_10 = memref.subview %alloc_8[0] [%21] [1] {ssbuffer.block_id = 17 : i32} : memref<32xf32> to memref<?xf32, strided<[1]>>
      memref.copy %subview_9, %subview_10 {ssbuffer.block_id = 17 : i32} : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
      %32 = bufferization.to_tensor %alloc_8 restrict writable {ssbuffer.block_id = 17 : i32} : memref<32xf32> to tensor<32xf32>
      %broadcasted_11 = linalg.broadcast ins(%31 : tensor<32xf32>) outs(%0 : tensor<32x32xf32>) dimensions = [1]  {ssbuffer.block_id = 17 : i32}
      %33 = tensor.empty() {ssbuffer.block_id = 17 : i32} : tensor<32x32xi32>
      %broadcasted_12 = linalg.broadcast ins(%15 : tensor<32xi32>) outs(%33 : tensor<32x32xi32>) dimensions = [1]  {ssbuffer.block_id = 17 : i32}
      %expanded = tensor.expand_shape %32 [[0, 1]] output_shape [32, 1] {ssbuffer.block_id = 17 : i32} : tensor<32xf32> into tensor<32x1xf32>
      %34 = arith.mulf %expanded, %27 {DataUse, ssbuffer.block_id = 17 : i32} : tensor<32x1xf32>
      %collapsed = tensor.collapse_shape %34 [[0, 1]] {ssbuffer.block_id = 17 : i32} : tensor<32x1xf32> into tensor<32xf32>
      %broadcasted_13 = linalg.broadcast ins(%collapsed : tensor<32xf32>) outs(%0 : tensor<32x32xf32>) dimensions = [1]  {ssbuffer.block_id = 17 : i32}
      %35 = arith.index_cast %arg26 {ssbuffer.block_id = 1 : i32} : i32 to index
      %reinterpret_cast_14 = memref.reinterpret_cast %arg6 to offset: [%35], sizes: [1], strides: [1] {ssbuffer.block_id = 1 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %36 = memref.load %reinterpret_cast_14[%c0] {ssbuffer.block_id = 1 : i32} : memref<1xi64, strided<[1], offset: ?>>
      %37 = arith.addi %35, %c1 {ssbuffer.block_id = 1 : i32} : index
      %reinterpret_cast_15 = memref.reinterpret_cast %arg6 to offset: [%37], sizes: [1], strides: [1] {ssbuffer.block_id = 1 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %38 = memref.load %reinterpret_cast_15[%c0] {ssbuffer.block_id = 1 : i32} : memref<1xi64, strided<[1], offset: ?>>
      %39 = arith.subi %38, %36 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %40 = arith.extsi %arg21 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %41 = arith.minsi %39, %40 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %alloc_16 = memref.alloc() {ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 0 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_16 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 0 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      %alloc_17 = memref.alloc() {ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 3 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_17 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 3 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 3 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
      %alloc_18 = memref.alloc() {ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 4 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_18 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 4 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 4 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
      %alloc_19 = memref.alloc() {ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 5 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_19 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 5 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 5 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
      %42:2 = scf.while (%arg28 = %2, %arg29 = %c0_i32) : (tensor<32x32xf32>, i32) -> (tensor<32x32xf32>, i32) {
        %88 = arith.extsi %arg29 {Undefined, ssbuffer.block_id = 23 : i32} : i32 to i64
        %89 = arith.cmpi slt, %88, %9 {Undefined, ssbuffer.block_id = 23 : i32} : i64
        scf.condition(%89) {Undefined, ssbuffer.block_id = 27 : i32} %arg28, %arg29 : tensor<32x32xf32>, i32
      } do {
      ^bb0(%arg28: tensor<32x32xf32>, %arg29: i32):
        %88 = linalg.fill {ssbuffer.block_id = 24 : i32} ins(%arg29 : i32) outs(%10 : tensor<32xi32>) -> tensor<32xi32>
        %89 = arith.addi %88, %11 {MixUse, ssbuffer.block_id = 24 : i32} : tensor<32xi32>
        %90 = arith.index_cast %12 {DataUse, ssbuffer.block_id = 24 : i32} : i32 to index
        %91 = arith.addi %90, %c32 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %92 = arith.index_cast %9 {DataUse, ssbuffer.block_id = 24 : i32} : i64 to index
        %93 = arith.maxsi %90, %92 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %94 = arith.minsi %91, %93 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %95 = arith.subi %94, %90 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %96 = arith.index_cast %arg29 {DataUse, ssbuffer.block_id = 24 : i32} : i32 to index
        %97 = arith.addi %96, %c32 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %98 = arith.maxsi %96, %92 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %99 = arith.minsi %97, %98 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %100 = arith.subi %99, %96 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %101 = arith.minsi %95, %c32 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %102 = arith.maxsi %101, %c0 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %103 = arith.minsi %100, %c32 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %104 = arith.maxsi %103, %c0 {DataUse, ssbuffer.block_id = 24 : i32} : index
        %broadcasted_37 = linalg.broadcast ins(%89 : tensor<32xi32>) outs(%33 : tensor<32x32xi32>) dimensions = [0]  {ssbuffer.block_id = 24 : i32}
        %105 = arith.subi %broadcasted_12, %broadcasted_37 {DataUse, ssbuffer.block_id = 24 : i32} : tensor<32x32xi32>
        %106 = arith.sitofp %105 {DataUse, ssbuffer.block_id = 24 : i32} : tensor<32x32xi32> to tensor<32x32xf32>
        %extracted_slice_38 = tensor.extract_slice %106[0, 0] [%102, %104] [1, 1] {DataUse, ssbuffer.block_id = 24 : i32} : tensor<32x32xf32> to tensor<?x?xf32>
        %inserted_slice = tensor.insert_slice %extracted_slice_38 into %2[0, 0] [%102, %104] [1, 1] {DataUse, ssbuffer.block_id = 24 : i32} : tensor<?x?xf32> into tensor<32x32xf32>
        %107 = arith.cmpf ogt, %inserted_slice, %2 {DataUse, ssbuffer.block_id = 24 : i32} : tensor<32x32xf32>
        %108 = arith.select %107, %2, %1 {DataUse, ssbuffer.block_id = 24 : i32} : tensor<32x32xi1>, tensor<32x32xf32>
        %109 = arith.addi %arg29, %c32_i32 {MixUse, ssbuffer.block_id = 24 : i32} : i32
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 25 : i32, ssbuffer.transfer_id = 4 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 5
        %memspacecast_39 = memref.memory_space_cast %alloc_18 {ssbuffer.block_id = 25 : i32, ssbuffer.crossCoreDeps = [4 : i32, 0 : i32], ssbuffer.transfer_id = 4 : i32} : memref<32x32xf32, #hivm.address_space<ub>> to memref<32x32xf32>
        %110 = bufferization.to_tensor %memspacecast_39 restrict writable {ssbuffer.block_id = 25 : i32, ssbuffer.transfer_id = 4 : i32} : memref<32x32xf32> to tensor<32x32xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 25 : i32, ssbuffer.transfer_id = 3 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 4
        %memspacecast_40 = memref.memory_space_cast %alloc_17 {ssbuffer.block_id = 25 : i32, ssbuffer.crossCoreDeps = [3 : i32, 0 : i32], ssbuffer.transfer_id = 3 : i32} : memref<32x32xf32, #hivm.address_space<ub>> to memref<32x32xf32>
        %111 = bufferization.to_tensor %memspacecast_40 restrict writable {ssbuffer.block_id = 25 : i32, ssbuffer.transfer_id = 3 : i32} : memref<32x32xf32> to tensor<32x32xf32>
        %112 = arith.subf %111, %broadcasted_11 {DataUse, ssbuffer.block_id = 25 : i32} : tensor<32x32xf32>
        %113 = math.exp %112 {DataUse, ssbuffer.block_id = 25 : i32} : tensor<32x32xf32>
        %extracted_slice_41 = tensor.extract_slice %113[0, 0] [%102, %104] [1, 1] {DataUse, ssbuffer.block_id = 25 : i32} : tensor<32x32xf32> to tensor<?x?xf32>
        %inserted_slice_42 = tensor.insert_slice %extracted_slice_41 into %2[0, 0] [%102, %104] [1, 1] {DataUse, ssbuffer.block_id = 25 : i32} : tensor<?x?xf32> into tensor<32x32xf32>
        %114 = arith.divf %inserted_slice_42, %23 {DataUse, ssbuffer.block_id = 25 : i32} : tensor<32x32xf32>
        %115 = arith.cmpf ogt, %108, %2 {DataUse, ssbuffer.block_id = 25 : i32} : tensor<32x32xf32>
        %116 = arith.select %115, %110, %2 {DataUse, ssbuffer.block_id = 25 : i32} : tensor<32x32xi1>, tensor<32x32xf32>
        %117 = arith.subf %116, %broadcasted_13 {DataUse, ssbuffer.block_id = 25 : i32} : tensor<32x32xf32>
        %118 = arith.mulf %114, %117 {DataUse, ssbuffer.block_id = 25 : i32} : tensor<32x32xf32>
        %119 = arith.truncf %118 {DataUse, ssbuffer.block_id = 25 : i32} : tensor<32x32xf32> to tensor<32x32xf16>
        %reshape = tensor.reshape %119(%cst_0) {ssbuffer.block_id = 25 : i32} : (tensor<32x32xf16>, tensor<3xi64>) -> tensor<32x2x16xf16>
        %120 = tensor.empty() {ssbuffer.block_id = 25 : i32} : tensor<2x32x16xf16>
        %transposed = linalg.transpose ins(%reshape : tensor<32x2x16xf16>) outs(%120 : tensor<2x32x16xf16>) permutation = [1, 0, 2]  {ssbuffer.block_id = 25 : i32}
        %reshape_43 = tensor.reshape %transposed(%cst) {ssbuffer.block_id = 25 : i32} : (tensor<2x32x16xf16>, tensor<4xi64>) -> tensor<2x2x16x16xf16>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 25 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.copy ins(%reshape_43 : tensor<2x2x16x16xf16>) outs(%alloc_16 : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>) {ssbuffer.block_id = 25 : i32, ssbuffer.crossCoreDeps = [0 : i32, 1 : i32], ssbuffer.transfer_id = 0 : i32}
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 25 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 25 : i32, ssbuffer.transfer_id = 3 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 4
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 25 : i32, ssbuffer.transfer_id = 4 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 26 : i32, ssbuffer.transfer_id = 5 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 6
        %memspacecast_44 = memref.memory_space_cast %alloc_19 {ssbuffer.block_id = 26 : i32, ssbuffer.crossCoreDeps = [5 : i32, 0 : i32], ssbuffer.transfer_id = 5 : i32} : memref<32x32xf32, #hivm.address_space<ub>> to memref<32x32xf32>
        %121 = bufferization.to_tensor %memspacecast_44 restrict writable {ssbuffer.block_id = 26 : i32, ssbuffer.transfer_id = 5 : i32} : memref<32x32xf32> to tensor<32x32xf32>
        %122 = arith.addf %121, %arg28 {ssbuffer.add_from_matmul, ssbuffer.block_id = 26 : i32} : tensor<32x32xf32>
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 26 : i32, ssbuffer.transfer_id = 5 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 6
        scf.yield {Undefined, ssbuffer.block_id = 28 : i32} %122, %109 : tensor<32x32xf32>, i32
      } attributes {DataUse, ssbuffer.block_id = 29 : i32, ssbuffer.main_loop = 0 : i32}
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
      %alloc_20 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 1 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_20 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 1 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      %alloc_21 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 2 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_21 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 2 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      %alloc_22 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 6 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_22 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 6 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 6 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
      %alloc_23 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 7 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_23 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 7 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 7 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 8
      scf.for %arg28 = %c0_i64 to %41 step %c32_i64  : i64 {
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 20 : i32, ssbuffer.transfer_id = 6 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 7
        %memspacecast_37 = memref.memory_space_cast %alloc_22 {ssbuffer.block_id = 20 : i32, ssbuffer.crossCoreDeps = [6 : i32, 0 : i32], ssbuffer.transfer_id = 6 : i32} : memref<32x32xf32, #hivm.address_space<ub>> to memref<32x32xf32>
        %88 = bufferization.to_tensor %memspacecast_37 restrict writable {ssbuffer.block_id = 20 : i32, ssbuffer.transfer_id = 6 : i32} : memref<32x32xf32> to tensor<32x32xf32>
        %89 = tensor.empty() {ssbuffer.block_id = 20 : i32} : tensor<32xi64>
        %90 = linalg.fill {ssbuffer.block_id = 20 : i32} ins(%arg28 : i64) outs(%89 : tensor<32xi64>) -> tensor<32xi64>
        %91 = arith.addi %90, %14 {MixUse, ssbuffer.block_id = 20 : i32} : tensor<32xi64>
        %92 = arith.index_cast %arg28 {ssbuffer.block_id = 20 : i32} : i64 to index
        %93 = arith.addi %92, %c32 {ssbuffer.block_id = 20 : i32} : index
        %94 = arith.maxsi %92, %18 {ssbuffer.block_id = 20 : i32} : index
        %95 = arith.minsi %93, %94 {ssbuffer.block_id = 20 : i32} : index
        %96 = arith.subi %95, %92 {ssbuffer.block_id = 20 : i32} : index
        %97 = arith.addi %arg28, %4 {ssbuffer.block_id = 20 : i32} : i64
        %98 = arith.index_cast %97 {ssbuffer.block_id = 20 : i32} : i64 to index
        %reinterpret_cast_38 = memref.reinterpret_cast %arg12 to offset: [%98], sizes: [32], strides: [1] {ssbuffer.block_id = 20 : i32} : memref<?xf32> to memref<32xf32, strided<[1], offset: ?>>
        %alloc_39 = memref.alloc() {ssbuffer.block_id = 20 : i32} : memref<32xf32>
        %99 = arith.cmpi slt, %96, %c32 {ssbuffer.block_id = 20 : i32} : index
        scf.if %99 {
          linalg.fill {ssbuffer.block_id = 20 : i32} ins(%cst_3 : f32) outs(%alloc_39 : memref<32xf32>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 20 : i32}
        %subview_40 = memref.subview %reinterpret_cast_38[0] [%96] [1] {ssbuffer.block_id = 20 : i32} : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
        %subview_41 = memref.subview %alloc_39[0] [%96] [1] {ssbuffer.block_id = 20 : i32} : memref<32xf32> to memref<?xf32, strided<[1]>>
        memref.copy %subview_40, %subview_41 {ssbuffer.block_id = 20 : i32} : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
        %100 = bufferization.to_tensor %alloc_39 restrict writable {ssbuffer.block_id = 20 : i32} : memref<32xf32> to tensor<32xf32>
        %broadcasted_42 = linalg.broadcast ins(%100 : tensor<32xf32>) outs(%0 : tensor<32x32xf32>) dimensions = [1]  {ssbuffer.block_id = 20 : i32}
        %101 = arith.index_cast %arg28 {DataUse, ssbuffer.block_id = 20 : i32} : i64 to index
        %102 = arith.addi %101, %c32 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %103 = arith.index_cast %9 {DataUse, ssbuffer.block_id = 20 : i32} : i64 to index
        %104 = arith.maxsi %101, %103 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %105 = arith.minsi %102, %104 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %106 = arith.subi %105, %101 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %107 = arith.index_cast %12 {DataUse, ssbuffer.block_id = 20 : i32} : i32 to index
        %108 = arith.addi %107, %c32 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %109 = arith.maxsi %107, %103 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %110 = arith.minsi %108, %109 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %111 = arith.subi %110, %107 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %112 = arith.minsi %106, %c32 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %113 = arith.maxsi %112, %c0 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %114 = arith.minsi %111, %c32 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %115 = arith.maxsi %114, %c0 {DataUse, ssbuffer.block_id = 20 : i32} : index
        %broadcasted_43 = linalg.broadcast ins(%91 : tensor<32xi64>) outs(%24 : tensor<32x32xi64>) dimensions = [1]  {ssbuffer.block_id = 20 : i32}
        %116 = arith.subi %broadcasted_43, %broadcasted {DataUse, ssbuffer.block_id = 20 : i32} : tensor<32x32xi64>
        %117 = arith.sitofp %116 {DataUse, ssbuffer.block_id = 20 : i32} : tensor<32x32xi64> to tensor<32x32xf32>
        %extracted_slice_44 = tensor.extract_slice %117[0, 0] [%113, %115] [1, 1] {DataUse, ssbuffer.block_id = 20 : i32} : tensor<32x32xf32> to tensor<?x?xf32>
        %inserted_slice = tensor.insert_slice %extracted_slice_44 into %2[0, 0] [%113, %115] [1, 1] {DataUse, ssbuffer.block_id = 20 : i32} : tensor<?x?xf32> into tensor<32x32xf32>
        %118 = arith.cmpf ogt, %inserted_slice, %2 {DataUse, ssbuffer.block_id = 20 : i32} : tensor<32x32xf32>
        %119 = arith.select %118, %2, %1 {DataUse, ssbuffer.block_id = 20 : i32} : tensor<32x32xi1>, tensor<32x32xf32>
        %reinterpret_cast_45 = memref.reinterpret_cast %arg11 to offset: [%98], sizes: [32], strides: [1] {ssbuffer.block_id = 20 : i32} : memref<?xf32> to memref<32xf32, strided<[1], offset: ?>>
        %alloc_46 = memref.alloc() {ssbuffer.block_id = 20 : i32} : memref<32xf32>
        scf.if %99 {
          linalg.fill {ssbuffer.block_id = 20 : i32} ins(%cst_3 : f32) outs(%alloc_46 : memref<32xf32>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 20 : i32}
        %subview_47 = memref.subview %reinterpret_cast_45[0] [%96] [1] {ssbuffer.block_id = 20 : i32} : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
        %subview_48 = memref.subview %alloc_46[0] [%96] [1] {ssbuffer.block_id = 20 : i32} : memref<32xf32> to memref<?xf32, strided<[1]>>
        memref.copy %subview_47, %subview_48 {ssbuffer.block_id = 20 : i32} : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
        %120 = bufferization.to_tensor %alloc_46 restrict writable {ssbuffer.block_id = 20 : i32} : memref<32xf32> to tensor<32xf32>
        %expanded_49 = tensor.expand_shape %120 [[0, 1]] output_shape [32, 1] {ssbuffer.block_id = 20 : i32} : tensor<32xf32> into tensor<32x1xf32>
        %121 = arith.mulf %expanded_49, %27 {DataUse, ssbuffer.block_id = 20 : i32} : tensor<32x1xf32>
        %collapsed_50 = tensor.collapse_shape %121 [[0, 1]] {ssbuffer.block_id = 20 : i32} : tensor<32x1xf32> into tensor<32xf32>
        %122 = arith.subf %88, %broadcasted_42 {DataUse, ssbuffer.block_id = 20 : i32} : tensor<32x32xf32>
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 20 : i32, ssbuffer.transfer_id = 6 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 7
        %123 = math.exp %122 {DataUse, ssbuffer.block_id = 21 : i32} : tensor<32x32xf32>
        %extracted_slice_51 = tensor.extract_slice %123[0, 0] [%113, %115] [1, 1] {DataUse, ssbuffer.block_id = 21 : i32} : tensor<32x32xf32> to tensor<?x?xf32>
        %inserted_slice_52 = tensor.insert_slice %extracted_slice_51 into %2[0, 0] [%113, %115] [1, 1] {DataUse, ssbuffer.block_id = 21 : i32} : tensor<?x?xf32> into tensor<32x32xf32>
        %124 = arith.divf %inserted_slice_52, %23 {DataUse, ssbuffer.block_id = 21 : i32} : tensor<32x32xf32>
        %125 = arith.cmpf ogt, %119, %2 {DataUse, ssbuffer.block_id = 21 : i32} : tensor<32x32xf32>
        %126 = arith.select %125, %124, %2 {DataUse, ssbuffer.block_id = 21 : i32} : tensor<32x32xi1>, tensor<32x32xf32>
        %127 = arith.truncf %126 {DataUse, ssbuffer.block_id = 21 : i32} : tensor<32x32xf32> to tensor<32x32xf16>
        %reshape = tensor.reshape %127(%cst_0) {ssbuffer.block_id = 21 : i32} : (tensor<32x32xf16>, tensor<3xi64>) -> tensor<32x2x16xf16>
        %128 = tensor.empty() {ssbuffer.block_id = 21 : i32} : tensor<2x32x16xf16>
        %transposed = linalg.transpose ins(%reshape : tensor<32x2x16xf16>) outs(%128 : tensor<2x32x16xf16>) permutation = [1, 0, 2]  {ssbuffer.block_id = 21 : i32}
        %reshape_53 = tensor.reshape %transposed(%cst) {ssbuffer.block_id = 21 : i32} : (tensor<2x32x16xf16>, tensor<4xi64>) -> tensor<2x2x16x16xf16>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 21 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 2
        hivm.hir.copy ins(%reshape_53 : tensor<2x2x16x16xf16>) outs(%alloc_20 : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>) {ssbuffer.block_id = 21 : i32, ssbuffer.crossCoreDeps = [1 : i32, 1 : i32], ssbuffer.transfer_id = 1 : i32}
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 21 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 22 : i32, ssbuffer.transfer_id = 7 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 8
        %memspacecast_54 = memref.memory_space_cast %alloc_23 {ssbuffer.block_id = 22 : i32, ssbuffer.crossCoreDeps = [7 : i32, 0 : i32], ssbuffer.transfer_id = 7 : i32} : memref<32x32xf32, #hivm.address_space<ub>> to memref<32x32xf32>
        %129 = bufferization.to_tensor %memspacecast_54 restrict writable {ssbuffer.block_id = 22 : i32, ssbuffer.transfer_id = 7 : i32} : memref<32x32xf32> to tensor<32x32xf32>
        %broadcasted_55 = linalg.broadcast ins(%collapsed_50 : tensor<32xf32>) outs(%0 : tensor<32x32xf32>) dimensions = [1]  {ssbuffer.block_id = 22 : i32}
        %130 = arith.cmpf ogt, %119, %2 {DataUse, ssbuffer.block_id = 22 : i32} : tensor<32x32xf32>
        %131 = arith.select %130, %129, %2 {DataUse, ssbuffer.block_id = 22 : i32} : tensor<32x32xi1>, tensor<32x32xf32>
        %132 = arith.subf %131, %broadcasted_55 {DataUse, ssbuffer.block_id = 22 : i32} : tensor<32x32xf32>
        %133 = arith.mulf %124, %132 {DataUse, ssbuffer.block_id = 22 : i32} : tensor<32x32xf32>
        %134 = arith.truncf %133 {DataUse, ssbuffer.block_id = 22 : i32} : tensor<32x32xf32> to tensor<32x32xf16>
        %reshape_56 = tensor.reshape %134(%cst_0) {ssbuffer.block_id = 22 : i32} : (tensor<32x32xf16>, tensor<3xi64>) -> tensor<32x2x16xf16>
        %135 = tensor.empty() {ssbuffer.block_id = 22 : i32} : tensor<2x32x16xf16>
        %transposed_57 = linalg.transpose ins(%reshape_56 : tensor<32x2x16xf16>) outs(%135 : tensor<2x32x16xf16>) permutation = [1, 0, 2]  {ssbuffer.block_id = 22 : i32}
        %reshape_58 = tensor.reshape %transposed_57(%cst) {ssbuffer.block_id = 22 : i32} : (tensor<2x32x16xf16>, tensor<4xi64>) -> tensor<2x2x16x16xf16>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 22 : i32, ssbuffer.transfer_id = 2 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 3
        hivm.hir.copy ins(%reshape_58 : tensor<2x2x16x16xf16>) outs(%alloc_21 : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>) {ssbuffer.block_id = 22 : i32, ssbuffer.crossCoreDeps = [2 : i32, 1 : i32], ssbuffer.transfer_id = 2 : i32}
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 22 : i32, ssbuffer.transfer_id = 2 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 3
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 22 : i32, ssbuffer.transfer_id = 7 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 8
      } {DataUse, hivm.matmul_limited_in_cube, ssbuffer.block_id = 30 : i32, ssbuffer.main_loop = 1 : i32}
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 2 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 3
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 2
      %alloc_24 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 8 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_24 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 8 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      %alloc_25 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 9 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_25 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 9 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 9 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 10
      %memspacecast = memref.memory_space_cast %alloc_25 {ssbuffer.block_id = 19 : i32, ssbuffer.crossCoreDeps = [9 : i32, 0 : i32], ssbuffer.transfer_id = 9 : i32} : memref<32x32xf32, #hivm.address_space<ub>> to memref<32x32xf32>
      %43 = bufferization.to_tensor %memspacecast restrict writable {ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 9 : i32} : memref<32x32xf32> to tensor<32x32xf32>
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 8 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 9
      %memspacecast_26 = memref.memory_space_cast %alloc_24 {ssbuffer.block_id = 19 : i32, ssbuffer.crossCoreDeps = [8 : i32, 0 : i32], ssbuffer.transfer_id = 8 : i32} : memref<32x32xf32, #hivm.address_space<ub>> to memref<32x32xf32>
      %44 = bufferization.to_tensor %memspacecast_26 restrict writable {ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 8 : i32} : memref<32x32xf32> to tensor<32x32xf32>
      %45 = arith.index_cast %arg26 {ssbuffer.block_id = 19 : i32} : i32 to index
      %reinterpret_cast_27 = memref.reinterpret_cast %arg6 to offset: [%45], sizes: [1], strides: [1] {ssbuffer.block_id = 19 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %46 = memref.load %reinterpret_cast_27[%c0] {ssbuffer.block_id = 19 : i32} : memref<1xi64, strided<[1], offset: ?>>
      %47 = arith.addi %45, %c1 {ssbuffer.block_id = 19 : i32} : index
      %reinterpret_cast_28 = memref.reinterpret_cast %arg6 to offset: [%47], sizes: [1], strides: [1] {ssbuffer.block_id = 19 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %48 = memref.load %reinterpret_cast_28[%c0] {ssbuffer.block_id = 19 : i32} : memref<1xi64, strided<[1], offset: ?>>
      %49 = arith.subi %48, %46 {MixUse, ssbuffer.block_id = 19 : i32} : i64
      %50 = arith.extsi %arg21 {MixUse, ssbuffer.block_id = 19 : i32} : i32 to i64
      %51 = arith.minsi %49, %50 {MixUse, ssbuffer.block_id = 19 : i32} : i64
      %52 = arith.muli %arg25, %c32_i32 {MixUse, ssbuffer.block_id = 19 : i32} : i32
      %53 = arith.index_cast %52 {ssbuffer.block_id = 19 : i32} : i32 to index
      %54 = arith.addi %53, %c32 {ssbuffer.block_id = 19 : i32} : index
      %55 = arith.index_cast %51 {ssbuffer.block_id = 19 : i32} : i64 to index
      %56 = arith.maxsi %53, %55 {ssbuffer.block_id = 19 : i32} : index
      %57 = arith.minsi %54, %56 {ssbuffer.block_id = 19 : i32} : index
      %58 = arith.subi %57, %53 {ssbuffer.block_id = 19 : i32} : index
      %59 = arith.minsi %58, %c32 {ssbuffer.block_id = 19 : i32} : index
      %60 = arith.maxsi %59, %c0 {ssbuffer.block_id = 19 : i32} : index
      %61 = arith.cmpi sgt, %51, %c0_i64 {ssbuffer.block_id = 19 : i32} : i64
      %62 = arith.cmpi sgt, %51, %c0_i64 {ssbuffer.block_id = 19 : i32} : i64
      %63 = arith.extsi %arg18 {MixUse, ssbuffer.block_id = 19 : i32} : i32 to i64
      %64 = arith.muli %46, %63 {ssbuffer.block_id = 19 : i32} : i64
      %65 = arith.index_cast %64 {ssbuffer.block_id = 19 : i32} : i64 to index
      %66 = arith.index_cast %arg18 {ssbuffer.block_id = 19 : i32} : i32 to index
      %67 = arith.muli %53, %66 {ssbuffer.block_id = 19 : i32} : index
      %68 = arith.addi %65, %67 {ssbuffer.block_id = 19 : i32} : index
      %reinterpret_cast_29 = memref.reinterpret_cast %arg8 to offset: [%68], sizes: [32, 32], strides: [%66, 1] {ssbuffer.block_id = 19 : i32} : memref<?xf16> to memref<32x32xf16, strided<[?, 1], offset: ?>>
      %69 = arith.extsi %arg19 {MixUse, ssbuffer.block_id = 19 : i32} : i32 to i64
      %70 = arith.muli %46, %69 {ssbuffer.block_id = 19 : i32} : i64
      %71 = arith.index_cast %70 {ssbuffer.block_id = 19 : i32} : i64 to index
      %72 = arith.index_cast %arg19 {ssbuffer.block_id = 19 : i32} : i32 to index
      %73 = arith.muli %53, %72 {ssbuffer.block_id = 19 : i32} : index
      %74 = arith.addi %71, %73 {ssbuffer.block_id = 19 : i32} : index
      %reinterpret_cast_30 = memref.reinterpret_cast %arg9 to offset: [%74], sizes: [32, 32], strides: [%72, 1] {ssbuffer.block_id = 19 : i32} : memref<?xf16> to memref<32x32xf16, strided<[?, 1], offset: ?>>
      %subview_31 = memref.subview %reinterpret_cast_29[0, 0] [%60, 32] [1, 1] {ssbuffer.block_id = 19 : i32} : memref<32x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[?, 1], offset: ?>>
      %subview_32 = memref.subview %reinterpret_cast_30[0, 0] [%60, 32] [1, 1] {ssbuffer.block_id = 19 : i32} : memref<32x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[?, 1], offset: ?>>
      %75 = arith.extsi %arg17 {MixUse, ssbuffer.block_id = 19 : i32} : i32 to i64
      %76 = arith.muli %46, %75 {ssbuffer.block_id = 19 : i32} : i64
      %77 = arith.index_cast %76 {ssbuffer.block_id = 19 : i32} : i64 to index
      %78 = arith.index_cast %arg17 {ssbuffer.block_id = 19 : i32} : i32 to index
      %79 = arith.muli %53, %78 {ssbuffer.block_id = 19 : i32} : index
      %80 = arith.addi %77, %79 {ssbuffer.block_id = 19 : i32} : index
      %reinterpret_cast_33 = memref.reinterpret_cast %arg7 to offset: [%80], sizes: [32, 32], strides: [%78, 1] {ssbuffer.block_id = 19 : i32} : memref<?xf16> to memref<32x32xf16, strided<[?, 1], offset: ?>>
      %subview_34 = memref.subview %reinterpret_cast_33[0, 0] [%60, 32] [1, 1] {ssbuffer.block_id = 19 : i32} : memref<32x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[?, 1], offset: ?>>
      %81 = linalg.fill {ssbuffer.block_id = 19 : i32, ssbuffer.for_may_not_exec} ins(%cst_3 : f32) outs(%44 : tensor<32x32xf32>) -> tensor<32x32xf32>
      %82 = arith.select %61, %44, %81 {ssbuffer.block_id = 19 : i32, ssbuffer.for_may_not_exec} : tensor<32x32xf32>
      %83 = linalg.fill {ssbuffer.block_id = 19 : i32, ssbuffer.for_may_not_exec} ins(%cst_3 : f32) outs(%43 : tensor<32x32xf32>) -> tensor<32x32xf32>
      %84 = arith.select %62, %43, %83 {ssbuffer.block_id = 19 : i32, ssbuffer.for_may_not_exec} : tensor<32x32xf32>
      %85 = arith.truncf %82 {DataUse, ssbuffer.block_id = 19 : i32} : tensor<32x32xf32> to tensor<32x32xf16>
      %extracted_slice = tensor.extract_slice %85[0, 0] [%60, 32] [1, 1] {ssbuffer.block_id = 19 : i32} : tensor<32x32xf16> to tensor<?x32xf16>
      %86 = arith.truncf %84 {DataUse, ssbuffer.block_id = 19 : i32} : tensor<32x32xf32> to tensor<32x32xf16>
      %extracted_slice_35 = tensor.extract_slice %86[0, 0] [%60, 32] [1, 1] {ssbuffer.block_id = 19 : i32} : tensor<32x32xf16> to tensor<?x32xf16>
      %87 = arith.truncf %42#0 {DataUse, ssbuffer.block_id = 19 : i32} : tensor<32x32xf32> to tensor<32x32xf16>
      %extracted_slice_36 = tensor.extract_slice %87[0, 0] [%60, 32] [1, 1] {ssbuffer.block_id = 19 : i32} : tensor<32x32xf16> to tensor<?x32xf16>
      bufferization.materialize_in_destination %extracted_slice in writable %subview_31 {ssbuffer.block_id = 19 : i32} : (tensor<?x32xf16>, memref<?x32xf16, strided<[?, 1], offset: ?>>) -> ()
      bufferization.materialize_in_destination %extracted_slice_35 in writable %subview_32 {ssbuffer.block_id = 19 : i32} : (tensor<?x32xf16>, memref<?x32xf16, strided<[?, 1], offset: ?>>) -> ()
      bufferization.materialize_in_destination %extracted_slice_36 in writable %subview_34 {ssbuffer.block_id = 19 : i32} : (tensor<?x32xf16>, memref<?x32xf16, strided<[?, 1], offset: ?>>) -> ()
      scope.return
    } {hivm.matmul_limited_in_cube, hivm.tcore_type = #hivm.tcore_type<VECTOR>}
    scope.scope : () -> () {
      %0 = arith.index_cast %arg26 {ssbuffer.block_id = 17 : i32} : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg6 to offset: [%0], sizes: [1], strides: [1] {ssbuffer.block_id = 17 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %1 = memref.load %reinterpret_cast[%c0] {ssbuffer.block_id = 17 : i32} : memref<1xi64, strided<[1], offset: ?>>
      %2 = arith.addi %0, %c1 {ssbuffer.block_id = 17 : i32} : index
      %reinterpret_cast_4 = memref.reinterpret_cast %arg6 to offset: [%2], sizes: [1], strides: [1] {ssbuffer.block_id = 17 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %3 = memref.load %reinterpret_cast_4[%c0] {ssbuffer.block_id = 17 : i32} : memref<1xi64, strided<[1], offset: ?>>
      %4 = arith.subi %3, %1 {MixUse, ssbuffer.block_id = 17 : i32} : i64
      %5 = arith.extsi %arg21 {MixUse, ssbuffer.block_id = 17 : i32} : i32 to i64
      %6 = arith.minsi %4, %5 {MixUse, ssbuffer.block_id = 17 : i32} : i64
      %7 = tensor.empty() {ssbuffer.block_id = 1 : i32} : tensor<32x32xf32>
      %8 = linalg.fill {ssbuffer.block_id = 1 : i32} ins(%cst_3 : f32) outs(%7 : tensor<32x32xf32>) -> tensor<32x32xf32>
      %9 = arith.index_cast %arg26 {ssbuffer.block_id = 1 : i32} : i32 to index
      %reinterpret_cast_5 = memref.reinterpret_cast %arg6 to offset: [%9], sizes: [1], strides: [1] {ssbuffer.block_id = 1 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %10 = memref.load %reinterpret_cast_5[%c0] {ssbuffer.block_id = 1 : i32} : memref<1xi64, strided<[1], offset: ?>>
      %11 = arith.addi %9, %c1 {ssbuffer.block_id = 1 : i32} : index
      %reinterpret_cast_6 = memref.reinterpret_cast %arg6 to offset: [%11], sizes: [1], strides: [1] {ssbuffer.block_id = 1 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
      %12 = memref.load %reinterpret_cast_6[%c0] {ssbuffer.block_id = 1 : i32} : memref<1xi64, strided<[1], offset: ?>>
      %13 = arith.subi %12, %10 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %14 = arith.extsi %arg21 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %15 = arith.minsi %13, %14 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %16 = arith.muli %arg25, %c32_i32 {MixUse, ssbuffer.block_id = 1 : i32} : i32
      %17 = arith.extsi %arg13 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %18 = arith.muli %10, %17 {ssbuffer.block_id = 1 : i32} : i64
      %19 = arith.extsi %arg14 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %20 = arith.muli %10, %19 {ssbuffer.block_id = 1 : i32} : i64
      %21 = arith.index_cast %20 {ssbuffer.block_id = 1 : i32} : i64 to index
      %22 = arith.index_cast %16 {ssbuffer.block_id = 1 : i32} : i32 to index
      %23 = arith.index_cast %arg14 {ssbuffer.block_id = 1 : i32} : i32 to index
      %24 = arith.muli %22, %23 {ssbuffer.block_id = 1 : i32} : index
      %25 = arith.addi %21, %24 {ssbuffer.block_id = 1 : i32} : index
      %26 = arith.extsi %arg15 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %27 = arith.muli %10, %26 {ssbuffer.block_id = 1 : i32} : i64
      %28 = arith.index_cast %27 {ssbuffer.block_id = 1 : i32} : i64 to index
      %29 = arith.index_cast %arg15 {ssbuffer.block_id = 1 : i32} : i32 to index
      %30 = arith.muli %22, %29 {ssbuffer.block_id = 1 : i32} : index
      %31 = arith.addi %28, %30 {ssbuffer.block_id = 1 : i32} : index
      %32 = arith.extsi %arg20 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %33 = arith.muli %10, %32 {ssbuffer.block_id = 1 : i32} : i64
      %34 = arith.addi %22, %c32 {ssbuffer.block_id = 1 : i32} : index
      %35 = arith.index_cast %15 {ssbuffer.block_id = 1 : i32} : i64 to index
      %36 = arith.maxsi %22, %35 {ssbuffer.block_id = 1 : i32} : index
      %37 = arith.minsi %34, %36 {ssbuffer.block_id = 1 : i32} : index
      %38 = arith.subi %37, %22 {ssbuffer.block_id = 1 : i32} : index
      %39 = arith.minsi %38, %c32 {ssbuffer.block_id = 1 : i32} : index
      %40 = arith.maxsi %39, %c0 {ssbuffer.block_id = 1 : i32} : index
      %41 = arith.cmpi slt, %40, %c32 {ssbuffer.block_id = 1 : i32} : index
      %42 = tensor.empty() {ssbuffer.block_id = 1 : i32} : tensor<32x32xf16>
      %43 = arith.muli %arg13, %c32_i32 {ssbuffer.block_id = 1 : i32} : i32
      %44 = arith.muli %arg20, %c32_i32 {ssbuffer.block_id = 1 : i32} : i32
      %45 = tensor.empty() {ssbuffer.block_id = 1 : i32} : tensor<32x32xf32>
      %46 = linalg.fill {ssbuffer.block_id = 1 : i32} ins(%cst_3 : f32) outs(%45 : tensor<32x32xf32>) -> tensor<32x32xf32>
      %47 = arith.index_cast %18 {ssbuffer.block_id = 1 : i32} : i64 to index
      %48 = arith.index_cast %arg13 {ssbuffer.block_id = 1 : i32} : i32 to index
      %49 = arith.muli %22, %48 {ssbuffer.block_id = 1 : i32} : index
      %50 = arith.addi %47, %49 {ssbuffer.block_id = 1 : i32} : index
      %51 = arith.index_cast %33 {ssbuffer.block_id = 1 : i32} : i64 to index
      %52 = arith.index_cast %arg20 {ssbuffer.block_id = 1 : i32} : i32 to index
      %53 = arith.muli %22, %52 {ssbuffer.block_id = 1 : i32} : index
      %54 = arith.addi %51, %53 {ssbuffer.block_id = 1 : i32} : index
      %reinterpret_cast_7 = memref.reinterpret_cast %arg3 to offset: [%25], sizes: [32, 32], strides: [%23, 1] {ssbuffer.block_id = 2 : i32} : memref<?xf16> to memref<32x32xf16, strided<[?, 1], offset: ?>>
      %reinterpret_cast_8 = memref.reinterpret_cast %arg4 to offset: [%31], sizes: [32, 32], strides: [%29, 1] {ssbuffer.block_id = 2 : i32} : memref<?xf16> to memref<32x32xf16, strided<[?, 1], offset: ?>>
      %alloc = memref.alloc() {ssbuffer.block_id = 2 : i32} : memref<32x32xf16>
      %subview = memref.subview %reinterpret_cast_7[0, 0] [%40, 32] [1, 1] {ssbuffer.block_id = 2 : i32} : memref<32x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[?, 1], offset: ?>>
      %subview_9 = memref.subview %alloc[0, 0] [%40, 32] [1, 1] {ssbuffer.block_id = 2 : i32} : memref<32x32xf16> to memref<?x32xf16, strided<[32, 1]>>
      %alloc_10 = memref.alloc() {ssbuffer.block_id = 2 : i32} : memref<32x32xf16>
      %subview_11 = memref.subview %reinterpret_cast_8[0, 0] [%40, 32] [1, 1] {ssbuffer.block_id = 2 : i32} : memref<32x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[?, 1], offset: ?>>
      %subview_12 = memref.subview %alloc_10[0, 0] [%40, 32] [1, 1] {ssbuffer.block_id = 2 : i32} : memref<32x32xf16> to memref<?x32xf16, strided<[32, 1]>>
      %reinterpret_cast_13 = memref.reinterpret_cast %arg2 to offset: [%50], sizes: [32, 32], strides: [%48, 1] {ssbuffer.block_id = 2 : i32} : memref<?xf16> to memref<32x32xf16, strided<[?, 1], offset: ?>>
      %alloc_14 = memref.alloc() {ssbuffer.block_id = 2 : i32} : memref<32x32xf16>
      %subview_15 = memref.subview %reinterpret_cast_13[0, 0] [%40, 32] [1, 1] {ssbuffer.block_id = 2 : i32} : memref<32x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[?, 1], offset: ?>>
      %subview_16 = memref.subview %alloc_14[0, 0] [%40, 32] [1, 1] {ssbuffer.block_id = 2 : i32} : memref<32x32xf16> to memref<?x32xf16, strided<[32, 1]>>
      %reinterpret_cast_17 = memref.reinterpret_cast %arg10 to offset: [%54], sizes: [32, 32], strides: [%52, 1] {ssbuffer.block_id = 2 : i32} : memref<?xf16> to memref<32x32xf16, strided<[?, 1], offset: ?>>
      %alloc_18 = memref.alloc() {ssbuffer.block_id = 2 : i32} : memref<32x32xf16>
      %subview_19 = memref.subview %reinterpret_cast_17[0, 0] [%40, 32] [1, 1] {ssbuffer.block_id = 2 : i32} : memref<32x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[?, 1], offset: ?>>
      %subview_20 = memref.subview %alloc_18[0, 0] [%40, 32] [1, 1] {ssbuffer.block_id = 2 : i32} : memref<32x32xf16> to memref<?x32xf16, strided<[32, 1]>>
      scf.if %41 {
        linalg.fill {ssbuffer.block_id = 2 : i32} ins(%cst_1 : f16) outs(%alloc : memref<32x32xf16>)
      } {hivm.unlikely_condition, ssbuffer.block_id = 2 : i32}
      memref.copy %subview, %subview_9 {ssbuffer.block_id = 2 : i32} : memref<?x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[32, 1]>>
      %55 = bufferization.to_tensor %alloc restrict writable {ssbuffer.block_id = 2 : i32} : memref<32x32xf16> to tensor<32x32xf16>
      scf.if %41 {
        linalg.fill {ssbuffer.block_id = 2 : i32} ins(%cst_1 : f16) outs(%alloc_10 : memref<32x32xf16>)
      } {hivm.unlikely_condition, ssbuffer.block_id = 2 : i32}
      memref.copy %subview_11, %subview_12 {ssbuffer.block_id = 2 : i32} : memref<?x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[32, 1]>>
      %56 = bufferization.to_tensor %alloc_10 restrict writable {ssbuffer.block_id = 2 : i32} : memref<32x32xf16> to tensor<32x32xf16>
      %transposed = linalg.transpose ins(%55 : tensor<32x32xf16>) outs(%42 : tensor<32x32xf16>) permutation = [1, 0]  {ssbuffer.block_id = 2 : i32}
      %transposed_21 = linalg.transpose ins(%56 : tensor<32x32xf16>) outs(%42 : tensor<32x32xf16>) permutation = [1, 0]  {ssbuffer.block_id = 2 : i32}
      scf.if %41 {
        linalg.fill {ssbuffer.block_id = 2 : i32} ins(%cst_1 : f16) outs(%alloc_14 : memref<32x32xf16>)
      } {hivm.unlikely_condition, ssbuffer.block_id = 2 : i32}
      memref.copy %subview_15, %subview_16 {ssbuffer.block_id = 2 : i32} : memref<?x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[32, 1]>>
      %57 = bufferization.to_tensor %alloc_14 restrict writable {ssbuffer.block_id = 2 : i32} : memref<32x32xf16> to tensor<32x32xf16>
      scf.if %41 {
        linalg.fill {ssbuffer.block_id = 2 : i32} ins(%cst_1 : f16) outs(%alloc_18 : memref<32x32xf16>)
      } {hivm.unlikely_condition, ssbuffer.block_id = 2 : i32}
      memref.copy %subview_19, %subview_20 {ssbuffer.block_id = 2 : i32} : memref<?x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[32, 1]>>
      %58 = bufferization.to_tensor %alloc_18 restrict writable {ssbuffer.block_id = 2 : i32} : memref<32x32xf16> to tensor<32x32xf16>
      %alloc_22 = memref.alloc() {ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 0 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_22 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 0 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
      %alloc_23 = memref.alloc() {ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 3 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_23 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 3 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      %alloc_24 = memref.alloc() {ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 4 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_24 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<4>, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 4 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      %alloc_25 = memref.alloc() {ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 5 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_25 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<5>, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 5 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      %59 = scf.while (%arg28 = %c0_i32) : (i32) -> i32 {
        %61 = arith.extsi %arg28 {Undefined, ssbuffer.block_id = 23 : i32} : i32 to i64
        %62 = arith.cmpi slt, %61, %6 {Undefined, ssbuffer.block_id = 23 : i32} : i64
        scf.condition(%62) %arg28 : i32
      } do {
      ^bb0(%arg28: i32):
        %61 = arith.addi %arg28, %c32_i32 {MixUse, ssbuffer.block_id = 24 : i32} : i32
        %62 = arith.index_cast %arg28 {ssbuffer.block_id = 12 : i32} : i32 to index
        %63 = arith.muli %62, %23 {ssbuffer.block_id = 12 : i32} : index
        %64 = arith.addi %21, %63 {ssbuffer.block_id = 12 : i32} : index
        %reinterpret_cast_32 = memref.reinterpret_cast %arg3 to offset: [%64], sizes: [32, 32], strides: [%23, 1] {ssbuffer.block_id = 12 : i32} : memref<?xf16> to memref<32x32xf16, strided<[?, 1], offset: ?>>
        %alloc_33 = memref.alloc() {ssbuffer.block_id = 12 : i32} : memref<32x32xf16>
        %65 = arith.addi %62, %c32 {ssbuffer.block_id = 12 : i32} : index
        %66 = arith.maxsi %62, %35 {ssbuffer.block_id = 12 : i32} : index
        %67 = arith.minsi %65, %66 {ssbuffer.block_id = 12 : i32} : index
        %68 = arith.subi %67, %62 {ssbuffer.block_id = 12 : i32} : index
        %69 = arith.minsi %68, %c32 {ssbuffer.block_id = 12 : i32} : index
        %70 = arith.maxsi %69, %c0 {ssbuffer.block_id = 12 : i32} : index
        %71 = arith.cmpi slt, %70, %c32 {ssbuffer.block_id = 12 : i32} : index
        scf.if %71 {
          linalg.fill {ssbuffer.block_id = 12 : i32} ins(%cst_1 : f16) outs(%alloc_33 : memref<32x32xf16>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 12 : i32}
        %subview_34 = memref.subview %reinterpret_cast_32[0, 0] [%70, 32] [1, 1] {ssbuffer.block_id = 12 : i32} : memref<32x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[?, 1], offset: ?>>
        %subview_35 = memref.subview %alloc_33[0, 0] [%70, 32] [1, 1] {ssbuffer.block_id = 12 : i32} : memref<32x32xf16> to memref<?x32xf16, strided<[32, 1]>>
        memref.copy %subview_34, %subview_35 {ssbuffer.block_id = 12 : i32} : memref<?x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[32, 1]>>
        %72 = bufferization.to_tensor %alloc_33 restrict writable {ssbuffer.block_id = 12 : i32} : memref<32x32xf16> to tensor<32x32xf16>
        %transposed_36 = linalg.transpose ins(%72 : tensor<32x32xf16>) outs(%42 : tensor<32x32xf16>) permutation = [1, 0]  {ssbuffer.block_id = 12 : i32}
        %73 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 12 : i32, ssbuffer.loop_carried_l0c} ins(%57, %transposed_36 : tensor<32x32xf16>, tensor<32x32xf16>) outs(%8 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 12 : i32, ssbuffer.transfer_id = 3 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 12 : i32, ssbuffer.crossCoreDeps = [3 : i32, 1 : i32], ssbuffer.transfer_id = 3 : i32} ins(%73 : tensor<32x32xf32>) outs(%alloc_23 : memref<32x32xf32, #hivm.address_space<ub>>)
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 12 : i32, ssbuffer.transfer_id = 3 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 4
        %74 = arith.muli %62, %29 {ssbuffer.block_id = 14 : i32} : index
        %75 = arith.addi %28, %74 {ssbuffer.block_id = 14 : i32} : index
        %reinterpret_cast_37 = memref.reinterpret_cast %arg4 to offset: [%75], sizes: [32, 32], strides: [%29, 1] {ssbuffer.block_id = 14 : i32} : memref<?xf16> to memref<32x32xf16, strided<[?, 1], offset: ?>>
        %alloc_38 = memref.alloc() {ssbuffer.block_id = 14 : i32} : memref<32x32xf16>
        scf.if %71 {
          linalg.fill {ssbuffer.block_id = 14 : i32} ins(%cst_1 : f16) outs(%alloc_38 : memref<32x32xf16>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 14 : i32}
        %subview_39 = memref.subview %reinterpret_cast_37[0, 0] [%70, 32] [1, 1] {ssbuffer.block_id = 14 : i32} : memref<32x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[?, 1], offset: ?>>
        %subview_40 = memref.subview %alloc_38[0, 0] [%70, 32] [1, 1] {ssbuffer.block_id = 14 : i32} : memref<32x32xf16> to memref<?x32xf16, strided<[32, 1]>>
        memref.copy %subview_39, %subview_40 {ssbuffer.block_id = 14 : i32} : memref<?x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[32, 1]>>
        %76 = bufferization.to_tensor %alloc_38 restrict writable {ssbuffer.block_id = 14 : i32} : memref<32x32xf16> to tensor<32x32xf16>
        %transposed_41 = linalg.transpose ins(%76 : tensor<32x32xf16>) outs(%42 : tensor<32x32xf16>) permutation = [1, 0]  {ssbuffer.block_id = 14 : i32}
        %77 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 14 : i32, ssbuffer.loop_carried_l0c} ins(%58, %transposed_41 : tensor<32x32xf16>, tensor<32x32xf16>) outs(%8 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 14 : i32, ssbuffer.transfer_id = 4 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 14 : i32, ssbuffer.crossCoreDeps = [4 : i32, 1 : i32], ssbuffer.transfer_id = 4 : i32} ins(%77 : tensor<32x32xf32>) outs(%alloc_24 : memref<32x32xf32, #hivm.address_space<ub>>)
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 14 : i32, ssbuffer.transfer_id = 4 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 5
        %78 = tensor.empty() {ssbuffer.block_id = 16 : i32} : tensor<32x32xf32>
        %79 = linalg.fill {ssbuffer.block_id = 16 : i32} ins(%cst_3 : f32) outs(%78 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 16 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
        %80 = hivm.hir.convert_layout %alloc_22 output_shape [32, 32] {dstLayout = #hivm.data_layout<ND>, srcLayout = #hivm.data_layout<nZ>, ssbuffer.block_id = 16 : i32, ssbuffer.crossCoreDeps = [0 : i32, 0 : i32], ssbuffer.transfer_id = 0 : i32} : (memref<2x2x16x16xf16, #hivm.address_space<cbuf>>) -> memref<32x32xf16, #hivm.address_space<cbuf>>
        %memspacecast = memref.memory_space_cast %80 {ssbuffer.block_id = 16 : i32, ssbuffer.transfer_id = 0 : i32} : memref<32x32xf16, #hivm.address_space<cbuf>> to memref<32x32xf16>
        %81 = bufferization.to_tensor %memspacecast restrict writable {ssbuffer.block_id = 16 : i32, ssbuffer.transfer_id = 0 : i32} : memref<32x32xf16> to tensor<32x32xf16>
        %82 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 16 : i32, ssbuffer.loop_carried_l0c} ins(%81, %72 : tensor<32x32xf16>, tensor<32x32xf16>) outs(%79 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 16 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 16 : i32, ssbuffer.transfer_id = 5 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 16 : i32, ssbuffer.crossCoreDeps = [5 : i32, 1 : i32], ssbuffer.transfer_id = 5 : i32} ins(%82 : tensor<32x32xf32>) outs(%alloc_25 : memref<32x32xf32, #hivm.address_space<ub>>)
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 16 : i32, ssbuffer.transfer_id = 5 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 6
        scf.yield %61 : i32
      } attributes {DataUse, ssbuffer.block_id = 29 : i32, ssbuffer.main_loop = 0 : i32}
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 5 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 6
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 4 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 29 : i32, ssbuffer.transfer_id = 3 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 4
      %alloc_26 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 1 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_26 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 1 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 2
      %alloc_27 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 2 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      annotation.mark %alloc_27 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 2 : i32} : memref<2x2x16x16xf16, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 2 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 3
      %alloc_28 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 6 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_28 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<6>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 6 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      %alloc_29 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 7 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_29 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<7>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 7 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      %60:4 = scf.for %arg28 = %c0_i64 to %15 step %c32_i64 iter_args(%arg29 = %c0_i32, %arg30 = %c0_i32, %arg31 = %46, %arg32 = %46) -> (i32, i32, tensor<32x32xf32>, tensor<32x32xf32>)  : i64 {
        %61 = arith.index_cast %18 {ssbuffer.block_id = 4 : i32} : i64 to index
        %62 = arith.index_cast %arg13 {ssbuffer.block_id = 4 : i32} : i32 to index
        %63 = arith.index_cast %arg29 {ssbuffer.block_id = 4 : i32} : i32 to index
        %64 = arith.addi %61, %63 {ssbuffer.block_id = 4 : i32} : index
        %reinterpret_cast_32 = memref.reinterpret_cast %arg2 to offset: [%64], sizes: [32, 32], strides: [%62, 1] {ssbuffer.block_id = 4 : i32} : memref<?xf16> to memref<32x32xf16, strided<[?, 1], offset: ?>>
        %alloc_33 = memref.alloc() {ssbuffer.block_id = 4 : i32} : memref<32x32xf16>
        %65 = arith.index_cast %arg28 {ssbuffer.block_id = 4 : i32} : i64 to index
        %66 = arith.addi %65, %c32 {ssbuffer.block_id = 4 : i32} : index
        %67 = arith.maxsi %65, %35 {ssbuffer.block_id = 4 : i32} : index
        %68 = arith.minsi %66, %67 {ssbuffer.block_id = 4 : i32} : index
        %69 = arith.subi %68, %65 {ssbuffer.block_id = 4 : i32} : index
        %70 = arith.minsi %69, %c32 {ssbuffer.block_id = 4 : i32} : index
        %71 = arith.maxsi %70, %c0 {ssbuffer.block_id = 4 : i32} : index
        %72 = arith.cmpi slt, %71, %c32 {ssbuffer.block_id = 4 : i32} : index
        scf.if %72 {
          linalg.fill {ssbuffer.block_id = 4 : i32} ins(%cst_1 : f16) outs(%alloc_33 : memref<32x32xf16>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 4 : i32}
        %subview_34 = memref.subview %reinterpret_cast_32[0, 0] [%71, 32] [1, 1] {ssbuffer.block_id = 4 : i32} : memref<32x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[?, 1], offset: ?>>
        %subview_35 = memref.subview %alloc_33[0, 0] [%71, 32] [1, 1] {ssbuffer.block_id = 4 : i32} : memref<32x32xf16> to memref<?x32xf16, strided<[32, 1]>>
        memref.copy %subview_34, %subview_35 {ssbuffer.block_id = 4 : i32} : memref<?x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[32, 1]>>
        %73 = bufferization.to_tensor %alloc_33 restrict writable {ssbuffer.block_id = 4 : i32} : memref<32x32xf16> to tensor<32x32xf16>
        %74 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 4 : i32, ssbuffer.loop_carried_l0c} ins(%73, %transposed : tensor<32x32xf16>, tensor<32x32xf16>) outs(%8 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 4 : i32, ssbuffer.transfer_id = 6 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 4 : i32, ssbuffer.crossCoreDeps = [6 : i32, 1 : i32], ssbuffer.transfer_id = 6 : i32} ins(%74 : tensor<32x32xf32>) outs(%alloc_28 : memref<32x32xf32, #hivm.address_space<ub>>)
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 4 : i32, ssbuffer.transfer_id = 6 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 7
        %75 = arith.addi %arg29, %43 {ssbuffer.block_id = 4 : i32} : i32
        %76 = arith.index_cast %33 {ssbuffer.block_id = 6 : i32} : i64 to index
        %77 = arith.index_cast %arg20 {ssbuffer.block_id = 6 : i32} : i32 to index
        %78 = arith.index_cast %arg30 {ssbuffer.block_id = 6 : i32} : i32 to index
        %79 = arith.addi %76, %78 {ssbuffer.block_id = 6 : i32} : index
        %reinterpret_cast_36 = memref.reinterpret_cast %arg10 to offset: [%79], sizes: [32, 32], strides: [%77, 1] {ssbuffer.block_id = 6 : i32} : memref<?xf16> to memref<32x32xf16, strided<[?, 1], offset: ?>>
        %alloc_37 = memref.alloc() {ssbuffer.block_id = 6 : i32} : memref<32x32xf16>
        scf.if %72 {
          linalg.fill {ssbuffer.block_id = 6 : i32} ins(%cst_1 : f16) outs(%alloc_37 : memref<32x32xf16>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 6 : i32}
        %subview_38 = memref.subview %reinterpret_cast_36[0, 0] [%71, 32] [1, 1] {ssbuffer.block_id = 6 : i32} : memref<32x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[?, 1], offset: ?>>
        %subview_39 = memref.subview %alloc_37[0, 0] [%71, 32] [1, 1] {ssbuffer.block_id = 6 : i32} : memref<32x32xf16> to memref<?x32xf16, strided<[32, 1]>>
        memref.copy %subview_38, %subview_39 {ssbuffer.block_id = 6 : i32} : memref<?x32xf16, strided<[?, 1], offset: ?>> to memref<?x32xf16, strided<[32, 1]>>
        %80 = bufferization.to_tensor %alloc_37 restrict writable {ssbuffer.block_id = 6 : i32} : memref<32x32xf16> to tensor<32x32xf16>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 6 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
        %81 = hivm.hir.convert_layout %alloc_26 output_shape [32, 32] {dstLayout = #hivm.data_layout<ND>, srcLayout = #hivm.data_layout<nZ>, ssbuffer.block_id = 6 : i32, ssbuffer.crossCoreDeps = [1 : i32, 0 : i32], ssbuffer.transfer_id = 1 : i32} : (memref<2x2x16x16xf16, #hivm.address_space<cbuf>>) -> memref<32x32xf16, #hivm.address_space<cbuf>>
        %memspacecast = memref.memory_space_cast %81 {ssbuffer.block_id = 6 : i32, ssbuffer.transfer_id = 1 : i32} : memref<32x32xf16, #hivm.address_space<cbuf>> to memref<32x32xf16>
        %82 = bufferization.to_tensor %memspacecast restrict writable {ssbuffer.block_id = 6 : i32, ssbuffer.transfer_id = 1 : i32} : memref<32x32xf16> to tensor<32x32xf16>
        %transposed_40 = linalg.transpose ins(%82 : tensor<32x32xf16>) outs(%42 : tensor<32x32xf16>) permutation = [1, 0]  {ssbuffer.block_id = 6 : i32}
        %83 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 6 : i32, ssbuffer.loop_carried_l0c} ins(%transposed_40, %80 : tensor<32x32xf16>, tensor<32x32xf16>) outs(%arg31 : tensor<32x32xf32>) -> tensor<32x32xf32>
        %84 = arith.addi %arg30, %44 {ssbuffer.block_id = 6 : i32} : i32
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 6 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 2
        %85 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 8 : i32, ssbuffer.loop_carried_l0c} ins(%80, %transposed_21 : tensor<32x32xf16>, tensor<32x32xf16>) outs(%8 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 8 : i32, ssbuffer.transfer_id = 7 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 8 : i32, ssbuffer.crossCoreDeps = [7 : i32, 1 : i32], ssbuffer.transfer_id = 7 : i32} ins(%85 : tensor<32x32xf32>) outs(%alloc_29 : memref<32x32xf32, #hivm.address_space<ub>>)
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 8 : i32, ssbuffer.transfer_id = 7 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 8
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 10 : i32, ssbuffer.transfer_id = 2 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 3
        %86 = hivm.hir.convert_layout %alloc_27 output_shape [32, 32] {dstLayout = #hivm.data_layout<ND>, srcLayout = #hivm.data_layout<nZ>, ssbuffer.block_id = 10 : i32, ssbuffer.crossCoreDeps = [2 : i32, 0 : i32], ssbuffer.transfer_id = 2 : i32} : (memref<2x2x16x16xf16, #hivm.address_space<cbuf>>) -> memref<32x32xf16, #hivm.address_space<cbuf>>
        %memspacecast_41 = memref.memory_space_cast %86 {ssbuffer.block_id = 10 : i32, ssbuffer.transfer_id = 2 : i32} : memref<32x32xf16, #hivm.address_space<cbuf>> to memref<32x32xf16>
        %87 = bufferization.to_tensor %memspacecast_41 restrict writable {ssbuffer.block_id = 10 : i32, ssbuffer.transfer_id = 2 : i32} : memref<32x32xf16> to tensor<32x32xf16>
        %transposed_42 = linalg.transpose ins(%87 : tensor<32x32xf16>) outs(%42 : tensor<32x32xf16>) permutation = [1, 0]  {ssbuffer.block_id = 10 : i32}
        %88 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 10 : i32, ssbuffer.loop_carried_l0c} ins(%transposed_42, %73 : tensor<32x32xf16>, tensor<32x32xf16>) outs(%arg32 : tensor<32x32xf32>) -> tensor<32x32xf32>
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 10 : i32, ssbuffer.transfer_id = 2 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 3
        scf.yield {Undefined} %75, %84, %83, %88 : i32, i32, tensor<32x32xf32>, tensor<32x32xf32>
      } {DataUse, hivm.matmul_limited_in_cube, ssbuffer.block_id = 30 : i32, ssbuffer.main_loop = 1 : i32}
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 7 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 8
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 6 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 7
      %alloc_30 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 8 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_30 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<8>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 8 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 30 : i32, ssbuffer.crossCoreDeps = [8 : i32, 1 : i32], ssbuffer.transfer_id = 8 : i32} ins(%60#3 : tensor<32x32xf32>) outs(%alloc_30 : memref<32x32xf32, #hivm.address_space<ub>>)
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 8 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 9
      %alloc_31 = memref.alloc() {ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 9 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_31 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<9>, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 9 : i32} : memref<32x32xf32, #hivm.address_space<ub>>
      hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 30 : i32, ssbuffer.crossCoreDeps = [9 : i32, 1 : i32], ssbuffer.transfer_id = 9 : i32} ins(%60#2 : tensor<32x32xf32>) outs(%alloc_31 : memref<32x32xf32, #hivm.address_space<ub>>)
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 30 : i32, ssbuffer.transfer_id = 9 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 10
      scope.return
    } {hivm.matmul_limited_in_cube, hivm.tcore_type = #hivm.tcore_type<CUBE>}
    return
  }
}