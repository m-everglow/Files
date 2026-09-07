// [analyze-name] Before AnalyzeName:
module attributes {hacc.target = #hacc.target<"Ascend950PR_9579">, ssbuffer.insertionOptimization, ssbuffer.inter_core_buf_count = 2 : i32, ssbuffer.intra_buf_count = 3 : i32, ssbuffer.load_store_buf_count = 1 : i32} {
  func.func @itd03_multi_state(%arg0: memref<?xi8>, %arg1: memref<?xi8>, %arg2: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32, %arg29: i32, %arg30: i32, %arg31: i32, %arg32: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, global_kernel = "local", mix_mode = "mix", parallel_mode = "simd"} {
    %cst = arith.constant {ssbuffer.block_id = 7 : i32} dense<[8, 2, 16, 8]> : tensor<4xi64>
    %cst_0 = arith.constant {ssbuffer.block_id = 7 : i32} dense<[32, 8, 8]> : tensor<3xi64>
    %cst_1 = arith.constant {ssbuffer.block_id = 7 : i32} dense<[4, 4, 16, 8]> : tensor<4xi64>
    %cst_2 = arith.constant {ssbuffer.block_id = 7 : i32} dense<[64, 4, 8]> : tensor<3xi64>
    %cst_3 = arith.constant {ssbuffer.block_id = 4 : i32} 1.000000e+00 : f32
    %c1_i32 = arith.constant {Undefined, ssbuffer.block_id = 4 : i32} 1 : i32
    %c0_i32 = arith.constant {ssbuffer.block_id = 4 : i32} 0 : i32
    %c32_i32 = arith.constant {ssbuffer.block_id = 4 : i32} 32 : i32
    %cst_4 = arith.constant {ssbuffer.block_id = 4 : i32} 8.000000e-01 : f32
    %cst_5 = arith.constant {ssbuffer.block_id = 4 : i32} 0.899999976 : f32
    %cst_6 = arith.constant {ssbuffer.block_id = 4 : i32} 0.000000e+00 : f32
    %c64_i32 = arith.constant {MixUse, ssbuffer.block_id = 4 : i32} 64 : i32
    %c64 = arith.constant {ssbuffer.block_id = 4 : i32} 64 : index
    %c0 = arith.constant {ssbuffer.block_id = 4 : i32} 0 : index
    %c32 = arith.constant {ssbuffer.block_id = 4 : i32} 32 : index
    scope.scope : () -> () {
      %0 = tensor.empty() {ssbuffer.block_id = 4 : i32} : tensor<64x64xf32>
      %1 = linalg.fill {ssbuffer.block_id = 4 : i32} ins(%cst_3 : f32) outs(%0 : tensor<64x64xf32>) -> tensor<64x64xf32>
      %2 = linalg.fill {ssbuffer.block_id = 4 : i32} ins(%cst_4 : f32) outs(%0 : tensor<64x64xf32>) -> tensor<64x64xf32>
      %3 = linalg.fill {ssbuffer.block_id = 4 : i32} ins(%cst_5 : f32) outs(%0 : tensor<64x64xf32>) -> tensor<64x64xf32>
      %4 = linalg.fill {ssbuffer.block_id = 4 : i32} ins(%cst_6 : f32) outs(%0 : tensor<64x64xf32>) -> tensor<64x64xf32>
      %5 = arith.muli %arg30, %c64_i32 {MixUse, ssbuffer.block_id = 4 : i32} : i32
      %6 = arith.index_cast %5 {ssbuffer.block_id = 4 : i32} : i32 to index
      %7 = arith.index_cast %arg21 {ssbuffer.block_id = 4 : i32} : i32 to index
      %8 = arith.muli %6, %7 {ssbuffer.block_id = 4 : i32} : index
      %9 = arith.index_cast %arg22 {ssbuffer.block_id = 4 : i32} : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg6 to offset: [%8], sizes: [64, 64], strides: [%7, %9] {ssbuffer.block_id = 4 : i32} : memref<?xf32> to memref<64x64xf32, strided<[?, ?], offset: ?>>
      %alloc = memref.alloc() {ssbuffer.block_id = 4 : i32} : memref<64x64xf32>
      %10 = arith.addi %6, %c64 {ssbuffer.block_id = 4 : i32} : index
      %11 = arith.index_cast %arg9 {ssbuffer.block_id = 4 : i32} : i32 to index
      %12 = arith.maxsi %6, %11 {ssbuffer.block_id = 4 : i32} : index
      %13 = arith.minsi %10, %12 {ssbuffer.block_id = 4 : i32} : index
      %14 = arith.subi %13, %6 {ssbuffer.block_id = 4 : i32} : index
      %15 = arith.index_cast %arg10 {ssbuffer.block_id = 4 : i32} : i32 to index
      %16 = arith.maxsi %15, %c0 {ssbuffer.block_id = 4 : i32} : index
      %17 = arith.minsi %16, %c64 {ssbuffer.block_id = 4 : i32} : index
      %18 = arith.minsi %14, %c64 {ssbuffer.block_id = 4 : i32} : index
      %19 = arith.maxsi %18, %c0 {ssbuffer.block_id = 4 : i32} : index
      %20 = arith.minsi %17, %c64 {ssbuffer.block_id = 4 : i32} : index
      %21 = arith.maxsi %20, %c0 {ssbuffer.block_id = 4 : i32} : index
      %22 = arith.cmpi slt, %19, %c64 {ssbuffer.block_id = 4 : i32} : index
      %23 = arith.cmpi slt, %21, %c64 {ssbuffer.block_id = 4 : i32} : index
      %24 = arith.ori %22, %23 {ssbuffer.block_id = 4 : i32} : i1
      scf.if %24 {
        linalg.fill {ssbuffer.block_id = 4 : i32} ins(%cst_6 : f32) outs(%alloc : memref<64x64xf32>)
      } {hivm.unlikely_condition, ssbuffer.block_id = 4 : i32}
      %subview = memref.subview %reinterpret_cast[0, 0] [%19, %21] [1, 1] {ssbuffer.block_id = 4 : i32} : memref<64x64xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
      %subview_7 = memref.subview %alloc[0, 0] [%19, %21] [1, 1] {ssbuffer.block_id = 4 : i32} : memref<64x64xf32> to memref<?x?xf32, strided<[64, 1]>>
      memref.copy %subview, %subview_7 {ssbuffer.block_id = 4 : i32} : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[64, 1]>>
      annotation.mark %alloc {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 4 : i32} : memref<64x64xf32>
      %25 = bufferization.to_tensor %alloc restrict writable {ssbuffer.block_id = 4 : i32} : memref<64x64xf32> 
      annotation.mark %25 {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 4 : i32} : tensor<64x64xf32>
      %26 = arith.index_cast %arg23 {ssbuffer.block_id = 4 : i32} : i32 to index
      %27 = arith.muli %6, %26 {ssbuffer.block_id = 4 : i32} : index
      %28 = arith.index_cast %arg24 {ssbuffer.block_id = 4 : i32} : i32 to index
      %reinterpret_cast_8 = memref.reinterpret_cast %arg7 to offset: [%27], sizes: [64, 64], strides: [%26, %28] {ssbuffer.block_id = 4 : i32} : memref<?xf32> to memref<64x64xf32, strided<[?, ?], offset: ?>>
      %alloc_9 = memref.alloc() {ssbuffer.block_id = 4 : i32} : memref<64x64xf32>
      scf.if %24 {
        linalg.fill {ssbuffer.block_id = 4 : i32} ins(%cst_6 : f32) outs(%alloc_9 : memref<64x64xf32>)
      } {hivm.unlikely_condition, ssbuffer.block_id = 4 : i32}
      %subview_10 = memref.subview %reinterpret_cast_8[0, 0] [%19, %21] [1, 1] {ssbuffer.block_id = 4 : i32} : memref<64x64xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
      %subview_11 = memref.subview %alloc_9[0, 0] [%19, %21] [1, 1] {ssbuffer.block_id = 4 : i32} : memref<64x64xf32> to memref<?x?xf32, strided<[64, 1]>>
      memref.copy %subview_10, %subview_11 {ssbuffer.block_id = 4 : i32} : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[64, 1]>>
      annotation.mark %alloc_9 {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 4 : i32} : memref<64x64xf32>
      %29 = bufferization.to_tensor %alloc_9 restrict writable {ssbuffer.block_id = 4 : i32} : memref<64x64xf32>
      annotation.mark %29 {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 4 : i32} : tensor<64x64xf32>
      %30 = arith.muli %5, %arg13 {ssbuffer.block_id = 4 : i32} : i32
      %31 = arith.index_cast %arg17 {ssbuffer.block_id = 4 : i32} : i32 to index
      %32 = arith.muli %6, %31 {ssbuffer.block_id = 4 : i32} : index
      %33 = arith.index_cast %arg18 {ssbuffer.block_id = 4 : i32} : i32 to index
      %reinterpret_cast_12 = memref.reinterpret_cast %arg4 to offset: [%32], sizes: [64, 64], strides: [%31, %33] {ssbuffer.block_id = 4 : i32} : memref<?xf32> to memref<64x64xf32, strided<[?, ?], offset: ?>>
      %34 = arith.index_cast %arg19 {ssbuffer.block_id = 4 : i32} : i32 to index
      %35 = arith.muli %6, %34 {ssbuffer.block_id = 4 : i32} : index
      %36 = arith.index_cast %arg20 {ssbuffer.block_id = 4 : i32} : i32 to index
      %reinterpret_cast_13 = memref.reinterpret_cast %arg5 to offset: [%35], sizes: [64, 64], strides: [%34, %36] {ssbuffer.block_id = 4 : i32} : memref<?xf32> to memref<64x64xf32, strided<[?, ?], offset: ?>>
      %37 = arith.muli %arg14, %c32_i32 {ssbuffer.block_id = 4 : i32} : i32
      %38 = arith.muli %arg15, %c32_i32 {ssbuffer.block_id = 4 : i32} : i32
      %alloc_14 = memref.alloc() {ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 0 : i32} : memref<4x4x16x8xf32, #hivm.address_space<cbuf>>
      annotation.mark %alloc_14 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 0 : i32} : memref<4x4x16x8xf32, #hivm.address_space<cbuf>>
      %alloc_15 = memref.alloc() {ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 1 : i32} : memref<8x2x16x8xf32, #hivm.address_space<cbuf>>
      annotation.mark %alloc_15 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 1 : i32} : memref<8x2x16x8xf32, #hivm.address_space<cbuf>>
      %alloc_16 = memref.alloc() {ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 2 : i32} : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_16 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 2 : i32} : memref<64x64xf32, #hivm.address_space<ub>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 2 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
      %39:6 = scf.for %arg33 = %c0_i32 to %arg12 step %c1_i32 iter_args(%arg34 = %25, %arg35 = %29, %arg36 = %4, %arg37 = %4, %arg38 = %30, %arg39 = %c0_i32) -> (tensor<64x64xf32>, tensor<64x64xf32>, tensor<64x64xf32>, tensor<64x64xf32>, i32, i32)  : i32 {
        %60 = arith.index_cast %arg13 {ssbuffer.block_id = 7 : i32} : i32 to index
        %61 = arith.index_cast %arg14 {ssbuffer.block_id = 7 : i32} : i32 to index
        %62 = arith.index_cast %arg38 {ssbuffer.block_id = 7 : i32} : i32 to index
        %reinterpret_cast_19 = memref.reinterpret_cast %arg2 to offset: [%62], sizes: [64, 32], strides: [%60, %61] {ssbuffer.block_id = 7 : i32} : memref<?xf32> to memref<64x32xf32, strided<[?, ?], offset: ?>>
        %63 = arith.index_cast %arg15 {ssbuffer.block_id = 7 : i32} : i32 to index
        %64 = arith.index_cast %arg16 {ssbuffer.block_id = 7 : i32} : i32 to index
        %65 = arith.index_cast %arg39 {ssbuffer.block_id = 7 : i32} : i32 to index
        %reinterpret_cast_20 = memref.reinterpret_cast %arg3 to offset: [%65], sizes: [32, 64], strides: [%63, %64] {ssbuffer.block_id = 7 : i32} : memref<?xf32> to memref<32x64xf32, strided<[?, ?], offset: ?>>
        %alloc_21 = memref.alloc() {ssbuffer.block_id = 7 : i32} : memref<64x32xf32>
        %66 = arith.index_cast %arg11 {ssbuffer.block_id = 7 : i32} : i32 to index
        %67 = arith.maxsi %66, %c0 {ssbuffer.block_id = 7 : i32} : index
        %68 = arith.minsi %67, %c32 {ssbuffer.block_id = 7 : i32} : index
        %69 = arith.minsi %68, %c32 {ssbuffer.block_id = 7 : i32} : index
        %70 = arith.maxsi %69, %c0 {ssbuffer.block_id = 7 : i32} : index
        %71 = arith.cmpi slt, %70, %c32 {ssbuffer.block_id = 7 : i32} : index
        %72 = arith.ori %22, %71 {ssbuffer.block_id = 7 : i32} : i1
        scf.if %72 {
          linalg.fill {ssbuffer.block_id = 7 : i32} ins(%cst_6 : f32) outs(%alloc_21 : memref<64x32xf32>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 7 : i32}
        %subview_22 = memref.subview %reinterpret_cast_19[0, 0] [%19, %70] [1, 1] {ssbuffer.block_id = 7 : i32} : memref<64x32xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
        %subview_23 = memref.subview %alloc_21[0, 0] [%19, %70] [1, 1] {ssbuffer.block_id = 7 : i32} : memref<64x32xf32> to memref<?x?xf32, strided<[32, 1]>>
        memref.copy %subview_22, %subview_23 {ssbuffer.block_id = 7 : i32} : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[32, 1]>>
        annotation.mark %alloc_21 {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 7 : i32} : memref<64x32xf32>
        %73 = bufferization.to_tensor %alloc_21 restrict writable {ssbuffer.block_id = 7 : i32} : memref<64x32xf32>
        annotation.mark %73 {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 7 : i32} : tensor<64x32xf32>
        %alloc_24 = memref.alloc() {ssbuffer.block_id = 7 : i32} : memref<32x64xf32>
        %74 = arith.ori %71, %23 {ssbuffer.block_id = 7 : i32} : i1
        scf.if %74 {
          linalg.fill {ssbuffer.block_id = 7 : i32} ins(%cst_6 : f32) outs(%alloc_24 : memref<32x64xf32>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 7 : i32}
        %subview_25 = memref.subview %reinterpret_cast_20[0, 0] [%70, %21] [1, 1] {ssbuffer.block_id = 7 : i32} : memref<32x64xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
        %subview_26 = memref.subview %alloc_24[0, 0] [%70, %21] [1, 1] {ssbuffer.block_id = 7 : i32} : memref<32x64xf32> to memref<?x?xf32, strided<[64, 1]>>
        memref.copy %subview_25, %subview_26 {ssbuffer.block_id = 7 : i32} : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[64, 1]>>
        annotation.mark %alloc_24 {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 7 : i32} : memref<32x64xf32>
        %75 = bufferization.to_tensor %alloc_24 restrict writable {ssbuffer.block_id = 7 : i32} : memref<32x64xf32>
        annotation.mark %75 {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 7 : i32} : tensor<32x64xf32>
        %76 = arith.addi %arg38, %37 {ssbuffer.block_id = 7 : i32} : i32
        %77 = arith.addi %arg39, %38 {ssbuffer.block_id = 7 : i32} : i32
        %reshape = tensor.reshape %73(%cst_2) {ssbuffer.block_id = 7 : i32} : (tensor<64x32xf32>, tensor<3xi64>) -> tensor<64x4x8xf32>
        %78 = tensor.empty() {ssbuffer.block_id = 7 : i32} : tensor<4x64x8xf32>
        %transposed = linalg.transpose ins(%reshape : tensor<64x4x8xf32>) outs(%78 : tensor<4x64x8xf32>) permutation = [1, 0, 2]  {ssbuffer.block_id = 7 : i32}
        %reshape_27 = tensor.reshape %transposed(%cst_1) {ssbuffer.block_id = 7 : i32} : (tensor<4x64x8xf32>, tensor<4xi64>) -> tensor<4x4x16x8xf32>
        %reshape_28 = tensor.reshape %75(%cst_0) {ssbuffer.block_id = 7 : i32} : (tensor<32x64xf32>, tensor<3xi64>) -> tensor<32x8x8xf32>
        %79 = tensor.empty() {ssbuffer.block_id = 7 : i32} : tensor<8x32x8xf32>
        %transposed_29 = linalg.transpose ins(%reshape_28 : tensor<32x8x8xf32>) outs(%79 : tensor<8x32x8xf32>) permutation = [1, 0, 2]  {ssbuffer.block_id = 7 : i32}
        %reshape_30 = tensor.reshape %transposed_29(%cst) {ssbuffer.block_id = 7 : i32} : (tensor<8x32x8xf32>, tensor<4xi64>) -> tensor<8x2x16x8xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.copy ins(%reshape_27 : tensor<4x4x16x8xf32>) outs(%alloc_14 : memref<4x4x16x8xf32, #hivm.address_space<cbuf>>) {ssbuffer.block_id = 7 : i32, ssbuffer.crossCoreDeps = [0 : i32, 1 : i32], ssbuffer.transfer_id = 0 : i32}
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 2
        hivm.hir.copy ins(%reshape_30 : tensor<8x2x16x8xf32>) outs(%alloc_15 : memref<8x2x16x8xf32, #hivm.address_space<cbuf>>) {ssbuffer.block_id = 7 : i32, ssbuffer.crossCoreDeps = [1 : i32, 1 : i32], ssbuffer.transfer_id = 1 : i32}
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 10 : i32, ssbuffer.transfer_id = 2 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 3
        %memspacecast = memref.memory_space_cast %alloc_16 {ssbuffer.block_id = 10 : i32, ssbuffer.crossCoreDeps = [2 : i32, 0 : i32], ssbuffer.transfer_id = 2 : i32} : memref<64x64xf32, #hivm.address_space<ub>> to memref<64x64xf32>
        %80 = bufferization.to_tensor %memspacecast restrict writable {ssbuffer.block_id = 10 : i32, ssbuffer.transfer_id = 2 : i32} : memref<64x64xf32>
        %81 = arith.mulf %arg34, %3 {DataUse, ssbuffer.block_id = 10 : i32} : tensor<64x64xf32>
        %82 = arith.addf %80, %81 {ssbuffer.add_from_matmul, ssbuffer.block_id = 10 : i32} : tensor<64x64xf32>
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 10 : i32, ssbuffer.transfer_id = 2 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 3
        %alloc_31 = memref.alloc() {ssbuffer.block_id = 8 : i32} : memref<64x64xf32>
        scf.if %24 {
          linalg.fill {ssbuffer.block_id = 8 : i32} ins(%cst_6 : f32) outs(%alloc_31 : memref<64x64xf32>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 8 : i32}
        %subview_32 = memref.subview %reinterpret_cast_12[0, 0] [%19, %21] [1, 1] {ssbuffer.block_id = 8 : i32} : memref<64x64xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
        %subview_33 = memref.subview %alloc_31[0, 0] [%19, %21] [1, 1] {ssbuffer.block_id = 8 : i32} : memref<64x64xf32> to memref<?x?xf32, strided<[64, 1]>>
        memref.copy %subview_32, %subview_33 {ssbuffer.block_id = 8 : i32} : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[64, 1]>>
        annotation.mark %alloc_31 {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 8 : i32} : memref<64x64xf32>
        %83 = bufferization.to_tensor %alloc_31 restrict writable {ssbuffer.block_id = 8 : i32} : memref<64x64xf32>
        annotation.mark %83 {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %84 = arith.mulf %arg34, %83 {DataUse, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %alloc_34 = memref.alloc() {ssbuffer.block_id = 8 : i32} : memref<64x64xf32>
        scf.if %24 {
          linalg.fill {ssbuffer.block_id = 8 : i32} ins(%cst_6 : f32) outs(%alloc_34 : memref<64x64xf32>)
        } {hivm.unlikely_condition, ssbuffer.block_id = 8 : i32}
        %subview_35 = memref.subview %reinterpret_cast_13[0, 0] [%19, %21] [1, 1] {ssbuffer.block_id = 8 : i32} : memref<64x64xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
        %subview_36 = memref.subview %alloc_34[0, 0] [%19, %21] [1, 1] {ssbuffer.block_id = 8 : i32} : memref<64x64xf32> to memref<?x?xf32, strided<[64, 1]>>
        memref.copy %subview_35, %subview_36 {ssbuffer.block_id = 8 : i32} : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[64, 1]>>
        annotation.mark %alloc_34 {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 8 : i32} : memref<64x64xf32>
        %85 = bufferization.to_tensor %alloc_34 restrict writable {ssbuffer.block_id = 8 : i32} : memref<64x64xf32>
        annotation.mark %85 {MayImplicitTransposeWithLastAxis, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %86 = arith.subf %4, %arg35 {DataUse, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %87 = math.exp %86 {DataUse, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %88 = arith.addf %87, %1 {DataUse, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %89 = arith.divf %1, %88 {DataUse, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %90 = arith.mulf %89, %85 {DataUse, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %91 = arith.addf %arg37, %90 {DataUse, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %92 = arith.mulf %arg35, %2 {DataUse, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %93 = arith.addf %92, %84 {DataUse, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %94 = arith.addf %93, %90 {DataUse, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        %95 = arith.addf %arg36, %84 {DataUse, ssbuffer.block_id = 8 : i32} : tensor<64x64xf32>
        scf.yield {Undefined} %82, %94, %95, %91, %76, %77 : tensor<64x64xf32>, tensor<64x64xf32>, tensor<64x64xf32>, tensor<64x64xf32>, i32, i32
      } {DataUse, ssbuffer.block_id = 11 : i32, ssbuffer.main_loop = 0 : i32}
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 2
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
      %40 = arith.muli %arg30, %c64_i32 {MixUse, ssbuffer.block_id = 6 : i32} : i32
      %41 = arith.index_cast %40 {ssbuffer.block_id = 6 : i32} : i32 to index
      %42 = arith.addi %41, %c64 {ssbuffer.block_id = 6 : i32} : index
      %43 = arith.index_cast %arg9 {ssbuffer.block_id = 6 : i32} : i32 to index
      %44 = arith.maxsi %41, %43 {ssbuffer.block_id = 6 : i32} : index
      %45 = arith.minsi %42, %44 {ssbuffer.block_id = 6 : i32} : index
      %46 = arith.subi %45, %41 {ssbuffer.block_id = 6 : i32} : index
      %47 = arith.index_cast %arg10 {ssbuffer.block_id = 6 : i32} : i32 to index
      %48 = arith.maxsi %47, %c0 {ssbuffer.block_id = 6 : i32} : index
      %49 = arith.minsi %48, %c64 {ssbuffer.block_id = 6 : i32} : index
      %50 = arith.minsi %46, %c64 {ssbuffer.block_id = 6 : i32} : index
      %51 = arith.maxsi %50, %c0 {ssbuffer.block_id = 6 : i32} : index
      %52 = arith.minsi %49, %c64 {ssbuffer.block_id = 6 : i32} : index
      %53 = arith.maxsi %52, %c0 {ssbuffer.block_id = 6 : i32} : index
      %54 = arith.index_cast %arg25 {ssbuffer.block_id = 6 : i32} : i32 to index
      %55 = arith.muli %41, %54 {ssbuffer.block_id = 6 : i32} : index
      %56 = arith.index_cast %arg26 {ssbuffer.block_id = 6 : i32} : i32 to index
      %reinterpret_cast_17 = memref.reinterpret_cast %arg8 to offset: [%55], sizes: [64, 64], strides: [%54, %56] {ssbuffer.block_id = 6 : i32} : memref<?xf32> to memref<64x64xf32, strided<[?, ?], offset: ?>>
      %subview_18 = memref.subview %reinterpret_cast_17[0, 0] [%51, %53] [1, 1] {ssbuffer.block_id = 6 : i32} : memref<64x64xf32, strided<[?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
      %57 = arith.addf %39#0, %39#1 {DataUse, ssbuffer.block_id = 6 : i32} : tensor<64x64xf32>
      %58 = arith.addf %57, %39#2 {DataUse, ssbuffer.block_id = 6 : i32} : tensor<64x64xf32>
      %59 = arith.addf %58, %39#3 {DataUse, ssbuffer.block_id = 6 : i32} : tensor<64x64xf32>
      %extracted_slice = tensor.extract_slice %59[0, 0] [%51, %53] [1, 1] {ssbuffer.block_id = 6 : i32} : tensor<64x64xf32> to tensor<?x?xf32>
      bufferization.materialize_in_destination %extracted_slice in writable %subview_18 {ssbuffer.block_id = 6 : i32} : (tensor<?x?xf32>, memref<?x?xf32, strided<[?, ?], offset: ?>>) -> ()
      scope.return
    } {hivm.matmul_limited_in_cube, hivm.tcore_type = #hivm.tcore_type<VECTOR>}
    scope.scope : () -> () {
      %alloc = memref.alloc() {ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 0 : i32} : memref<4x4x16x8xf32, #hivm.address_space<cbuf>>
      annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 0 : i32} : memref<4x4x16x8xf32, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
      %alloc_7 = memref.alloc() {ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 1 : i32} : memref<8x2x16x8xf32, #hivm.address_space<cbuf>>
      annotation.mark %alloc_7 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 1 : i32} : memref<8x2x16x8xf32, #hivm.address_space<cbuf>>
      hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 2
      %alloc_8 = memref.alloc() {ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 2 : i32} : memref<64x64xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_8 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 2 : i32} : memref<64x64xf32, #hivm.address_space<ub>>
      scf.for %arg33 = %c0_i32 to %arg12 step %c1_i32  : i32 {
        %0 = tensor.empty() {ssbuffer.block_id = 3 : i32} : tensor<64x64xf32>
        %1 = linalg.fill {ssbuffer.block_id = 3 : i32} ins(%cst_6 : f32) outs(%0 : tensor<64x64xf32>) -> tensor<64x64xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
        %2 = hivm.hir.convert_layout %alloc output_shape [64, 32] {dstLayout = #hivm.data_layout<ND>, srcLayout = #hivm.data_layout<nZ>, ssbuffer.block_id = 3 : i32, ssbuffer.crossCoreDeps = [0 : i32, 0 : i32], ssbuffer.transfer_id = 0 : i32} : (memref<4x4x16x8xf32, #hivm.address_space<cbuf>>) -> memref<64x32xf32, #hivm.address_space<cbuf>>
        %memspacecast = memref.memory_space_cast %2 {ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 0 : i32} : memref<64x32xf32, #hivm.address_space<cbuf>> to memref<64x32xf32>
        %3 = bufferization.to_tensor %memspacecast restrict writable {ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 0 : i32} : memref<64x32xf32>
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 2
        %4 = hivm.hir.convert_layout %alloc_7 output_shape [32, 64] {dstLayout = #hivm.data_layout<ND>, srcLayout = #hivm.data_layout<nZ>, ssbuffer.block_id = 3 : i32, ssbuffer.crossCoreDeps = [1 : i32, 0 : i32], ssbuffer.transfer_id = 1 : i32} : (memref<8x2x16x8xf32, #hivm.address_space<cbuf>>) -> memref<32x64xf32, #hivm.address_space<cbuf>>
        %memspacecast_9 = memref.memory_space_cast %4 {ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 1 : i32} : memref<32x64xf32, #hivm.address_space<cbuf>> to memref<32x64xf32>
        %5 = bufferization.to_tensor %memspacecast_9 restrict writable {ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 1 : i32} : memref<32x64xf32>
        %6 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 3 : i32, ssbuffer.loop_carried_l0c} ins(%3, %5 : tensor<64x32xf32>, tensor<32x64xf32>) outs(%1 : tensor<64x64xf32>) -> tensor<64x64xf32>
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 2
        hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 2 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
        hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 3 : i32, ssbuffer.crossCoreDeps = [2 : i32, 1 : i32], ssbuffer.transfer_id = 2 : i32} ins(%6 : tensor<64x64xf32>) outs(%alloc_8 : memref<64x64xf32, #hivm.address_space<ub>>)
        hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 3 : i32, ssbuffer.transfer_id = 2 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 3
      } {DataUse, ssbuffer.block_id = 11 : i32, ssbuffer.main_loop = 0 : i32}
      hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 11 : i32, ssbuffer.transfer_id = 2 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 3
      scope.return
    } {hivm.matmul_limited_in_cube, hivm.tcore_type = #hivm.tcore_type<CUBE>}
    return
  }
}