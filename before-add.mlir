// [AddControlFlowCondition] before AddControlFlowCondition:
module attributes {hacc.target = #hacc.target<"Ascend950PR_9579">, ssbuffer.insertionOptimization, ssbuffer.inter_core_buf_count = 2 : i32, ssbuffer.intra_buf_count = 3 : i32, ssbuffer.load_store_buf_count = 1 : i32} {
  func.func @_hstu_attn_fwd(%arg0: memref<?xi8>, %arg1: memref<?xi8>, %arg2: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xbf16> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xi64> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xi64> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xi64> {tt.tensor_kind = 0 : i32}, %arg8: memref<?xf32> {tt.tensor_kind = 2 : i32}, %arg9: memref<?xbf16> {tt.tensor_kind = 1 : i32}, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, global_kernel = "local", mix_mode = "mix", parallel_mode = "simd"} {
    %c64 = arith.constant {ssbuffer.block_id = 1 : i32} 64 : index
    %c512 = arith.constant {ssbuffer.block_id = 1 : i32} 512 : index
    %cst = arith.constant {ssbuffer.block_id = 15 : i32} dense<[32, 4, 16, 16]> : tensor<4xi64>
    %cst_0 = arith.constant {ssbuffer.block_id = 15 : i32} dense<[64, 32, 16]> : tensor<3xi64>
    %c64_i32 = arith.constant {Undefined, ssbuffer.block_id = 1 : i32} 64 : i32
    %c2048_i64 = arith.constant {MixUse, ssbuffer.block_id = 1 : i32} 2048 : i64
    %c4_i64 = arith.constant {MixUse, ssbuffer.block_id = 1 : i32} 4 : i64
    %cst_1 = arith.constant {ssbuffer.block_id = 8 : i32} 0.000000e+00 : f32
    %c2_i32 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 2 : i32
    %c0_i32 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 0 : i32
    %c2049_i32 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 2049 : i32
    %c511_i32 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 511 : i32
    %c512_i32 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 512 : i32
    %c511_i64 = arith.constant {DataUse, ssbuffer.block_id = 8 : i32} 511 : i64
    %c512_i64 = arith.constant {ssbuffer.block_id = 8 : i32} 512 : i64
    %c256_i64 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 256 : i64
    %c64_i64 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 64 : i64
    %c1_i64 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 1 : i64
    %c1_i32 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 1 : i32
    %c12_i32 = arith.constant {Undefined, ssbuffer.block_id = 8 : i32} 12 : i32
    %c0_i64 = arith.constant {MixUse, ssbuffer.block_id = 8 : i32} 0 : i64
    %cst_2 = arith.constant {ssbuffer.block_id = 8 : i32} 1.000000e+00 : f32
    %c0 = arith.constant {ssbuffer.block_id = 8 : i32} 0 : index
    %c1 = arith.constant {ssbuffer.block_id = 8 : i32} 1 : index
    %c256 = arith.constant {ssbuffer.block_id = 8 : i32} 256 : index
    %cst_3 = arith.constant {ssbuffer.block_id = 8 : i32} 0.000000e+00 : bf16
    %c144 = arith.constant {ssbuffer.block_id = 8 : i32} 144 : index
    scope.scope : () -> () {
      %0 = tensor.empty() {ssbuffer.block_id = 8 : i32} : tensor<64x512xf32>
      %1 = linalg.fill {ssbuffer.block_id = 8 : i32} ins(%cst_1 : f32) outs(%0 : tensor<64x512xf32>) -> tensor<64x512xf32>
      %2 = linalg.fill {ssbuffer.block_id = 8 : i32} ins(%cst_2 : f32) outs(%0 : tensor<64x512xf32>) -> tensor<64x512xf32>
      %3 = arith.extsi %arg15 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %4 = arith.extsi %arg18 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %5 = arith.cmpi sle, %arg12, %c64_i32 {Undefined, ssbuffer.block_id = 1 : i32} : i32
      %6 = scf.if %5 -> (i64) {
        scf.yield {Undefined, ssbuffer.block_id = 1 : i32} %c2048_i64 : i64
      } else {
        %reinterpret_cast = memref.reinterpret_cast %arg7 to offset: [2048], sizes: [1], strides: [1] {ssbuffer.block_id = 1 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: 2048>>
        %24 = memref.load %reinterpret_cast[%c0] {ssbuffer.block_id = 1 : i32} : memref<1xi64, strided<[1], offset: 2048>>
        scf.yield {Undefined, ssbuffer.block_id = 1 : i32} %24 : i64
      } {MixUse, ssbuffer.block_id = 1 : i32}
      %7 = arith.muli %6, %c4_i64 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %8 = arith.minsi %3, %7 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %9 = arith.divsi %7, %8 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %10 = arith.addi %9, %c1_i64 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %11 = arith.remsi %7, %8 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %12 = arith.cmpi slt, %4, %8 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %13 = arith.cmpi slt, %4, %11 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %14 = arith.muli %4, %10 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %15 = arith.muli %11, %10 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %16 = arith.subi %4, %11 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %17 = arith.muli %16, %9 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %18 = arith.addi %15, %17 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %19 = arith.select %13, %14, %18 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %20 = arith.select %12, %19, %c0_i64 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %21 = arith.select %13, %10, %9 {Undefined, ssbuffer.block_id = 1 : i32} : i64
      %22 = arith.select %12, %21, %c0_i64 {Undefined, ssbuffer.block_id = 1 : i32} : i64
      %23 = arith.cmpi sge, %4, %8 {Undefined, ssbuffer.block_id = 1 : i32} : i64
      scf.if %23 {
      } else {
        %24 = arith.cmpi sle, %22, %c0_i64 {Undefined, ssbuffer.block_id = 11 : i32} : i64
        scf.if %24 {
        } else {
          %25 = arith.addi %arg13, %c511_i32 {MixUse, ssbuffer.block_id = 12 : i32} : i32
          %26 = arith.divsi %25, %c512_i32 {MixUse, ssbuffer.block_id = 12 : i32} : i32
          %27 = arith.extsi %26 {MixUse, ssbuffer.block_id = 12 : i32} : i32 to i64
          %28 = arith.muli %22, %27 {Undefined, ssbuffer.block_id = 12 : i32} : i64
          %29 = linalg.fill {ssbuffer.block_id = 12 : i32} ins(%arg10 : f32) outs(%0 : tensor<64x512xf32>) -> tensor<64x512xf32>
          %30 = linalg.fill {ssbuffer.block_id = 12 : i32} ins(%arg11 : f32) outs(%0 : tensor<64x512xf32>) -> tensor<64x512xf32>
          %alloc = memref.alloc() {ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32} : memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>
          %alloc_4 = memref.alloc() {ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32} : memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>
          annotation.mark %alloc_4 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32} : memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>
          annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32} : memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>
          %alloc_5 = memref.alloc() {ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32, #hivm.address_space<ub>>
          %alloc_6 = memref.alloc() {ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_6 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_5 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32, #hivm.address_space<ub>>
          hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
          hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
          scf.for %arg21 = %c0_i64 to %28 step %c1_i64  : i64 {
            %31 = arith.divsi %arg21, %27 {MixUse, ssbuffer.block_id = 13 : i32} : i64
            %32 = arith.addi %20, %31 {MixUse, ssbuffer.block_id = 13 : i32} : i64
            %33 = arith.remsi %32, %6 {MixUse, ssbuffer.block_id = 13 : i32} : i64
            %34 = scf.if %5 -> (i64) {
              scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %33 : i64
            } else {
              %61 = arith.divsi %arg21, %27 {MixUse, ssbuffer.block_id = 13 : i32} : i64
              %62 = arith.addi %20, %61 {MixUse, ssbuffer.block_id = 13 : i32} : i64
              %63 = arith.remsi %62, %6 {MixUse, ssbuffer.block_id = 13 : i32} : i64
              %64:2 = scf.for %arg22 = %c0_i32 to %c12_i32 step %c1_i32 iter_args(%arg23 = %c0_i32, %arg24 = %c2049_i32) -> (i32, i32)  : i32 {
                %67 = arith.addi %arg23, %arg24 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                %68 = arith.divsi %67, %c2_i32 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                %69 = arith.index_cast %68 {ssbuffer.block_id = 13 : i32} : i32 to index
                %reinterpret_cast_12 = memref.reinterpret_cast %arg7 to offset: [%69], sizes: [1], strides: [1] {ssbuffer.block_id = 13 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
                %70 = memref.load %reinterpret_cast_12[%c0] {ssbuffer.block_id = 13 : i32} : memref<1xi64, strided<[1], offset: ?>>
                %71 = arith.cmpi sle, %70, %63 {MixUse, ssbuffer.block_id = 13 : i32} : i64
                %72 = arith.select %71, %arg24, %68 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                %73 = scf.if %71 -> (i32) {
                  %74 = arith.addi %arg23, %arg24 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                  %75 = arith.divsi %74, %c2_i32 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                  %76 = arith.addi %75, %c1_i32 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                  scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %76 : i32
                } else {
                  scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %arg23 : i32
                } {MixUse, ssbuffer.block_id = 13 : i32}
                scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %73, %72 : i32, i32
              } {MixUse, ssbuffer.block_id = 13 : i32}
              %65 = arith.subi %64#0, %c1_i32 {ssbuffer.block_id = 13 : i32} : i32
              %66 = arith.extsi %65 {ssbuffer.block_id = 13 : i32} : i32 to i64
              scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %66 : i64
            } {MixUse, ssbuffer.block_id = 13 : i32, ssbuffer.dep_mark = [2 : i32]}
            %35 = arith.divsi %arg21, %c1_i64 {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} : i64
            %c2_i64 = arith.constant {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} 2 : i64
            %36 = arith.remsi %35, %c2_i64 {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} : i64
            %c0_i64_7 = arith.constant {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} 0 : i64
            %37 = arith.cmpi eq, %36, %c0_i64_7 {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} : i64
            scf.if %37 {
              hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 2
            } else {
              hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_V>] flag = 5
            } {ssbuffer.block_id = 15 : i32, ssbuffer.cross_buffer = 1 : i32}
            %38 = scf.if %37 -> (tensor<64x512xf32>) {
              %memspacecast = memref.memory_space_cast %alloc_5 {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32, #hivm.address_space<ub>> to memref<64x512xf32>
              %61 = bufferization.to_tensor %memspacecast restrict writable {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32> to tensor<64x512xf32>
              scf.yield %61 : tensor<64x512xf32>
            } else {
              %memspacecast = memref.memory_space_cast %alloc_6 {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32, #hivm.address_space<ub>> to memref<64x512xf32>
              %61 = bufferization.to_tensor %memspacecast restrict writable {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32> to tensor<64x512xf32>
              scf.yield %61 : tensor<64x512xf32>
            } {ssbuffer.block_id = 15 : i32, ssbuffer.crossCoreDeps = [1 : i32, 0 : i32], ssbuffer.cross_buffer = 1 : i32, ssbuffer.transfer_id = 1 : i32}
            %39 = arith.mulf %38, %29 {DataUse, ssbuffer.block_id = 15 : i32} : tensor<64x512xf32>
            %40 = arith.subf %1, %39 {DataUse, ssbuffer.block_id = 15 : i32} : tensor<64x512xf32>
            %41 = math.exp %40 {DataUse, ssbuffer.block_id = 15 : i32} : tensor<64x512xf32>
            %42 = arith.addf %41, %2 {DataUse, ssbuffer.block_id = 15 : i32} : tensor<64x512xf32>
            %43 = arith.divf %2, %42 {DataUse, ssbuffer.block_id = 15 : i32} : tensor<64x512xf32>
            %44 = arith.mulf %39, %43 {DataUse, ssbuffer.block_id = 15 : i32} : tensor<64x512xf32>
            %45 = arith.mulf %44, %30 {DataUse, ssbuffer.block_id = 15 : i32} : tensor<64x512xf32>
            %46 = arith.truncf %45 {DataUse, ssbuffer.block_id = 15 : i32} : tensor<64x512xf32> to tensor<64x512xbf16>
            %reshape = tensor.reshape %46(%cst_0) {ssbuffer.block_id = 15 : i32} : (tensor<64x512xbf16>, tensor<3xi64>) -> tensor<64x32x16xbf16>
            %47 = tensor.empty() {ssbuffer.block_id = 15 : i32} : tensor<32x64x16xbf16>
            %transposed = linalg.transpose ins(%reshape : tensor<64x32x16xbf16>) outs(%47 : tensor<32x64x16xbf16>) permutation = [1, 0, 2]  {ssbuffer.block_id = 15 : i32}
            %reshape_8 = tensor.reshape %transposed(%cst) {ssbuffer.block_id = 15 : i32} : (tensor<32x64x16xbf16>, tensor<4xi64>) -> tensor<32x4x16x16xbf16>
            %48 = arith.divsi %arg21, %c1_i64 {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32} : i64
            %c2_i64_9 = arith.constant {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32} 2 : i64
            %49 = arith.remsi %48, %c2_i64_9 {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32} : i64
            %c0_i64_10 = arith.constant {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32} 0 : i64
            %50 = arith.cmpi eq, %49, %c0_i64_10 {ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32} : i64
            scf.if %50 {
              hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
            } else {
              hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 4
            } {ssbuffer.block_id = 15 : i32, ssbuffer.cross_buffer = 1 : i32}
            scf.if %50 {
              hivm.hir.copy ins(%reshape_8 : tensor<32x4x16x16xbf16>) outs(%alloc : memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>) {ssbuffer.block_id = 15 : i32, ssbuffer.crossCoreDeps = [0 : i32, 1 : i32], ssbuffer.transfer_id = 0 : i32}
            } else {
              hivm.hir.copy ins(%reshape_8 : tensor<32x4x16x16xbf16>) outs(%alloc_4 : memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>) {ssbuffer.block_id = 15 : i32, ssbuffer.crossCoreDeps = [0 : i32, 1 : i32], ssbuffer.transfer_id = 0 : i32}
            } {ssbuffer.block_id = 15 : i32, ssbuffer.cross_buffer = 1 : i32, ssbuffer.transfer_id = 0 : i32}
            scf.if %50 {
              hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            } else {
              hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
            } {ssbuffer.block_id = 15 : i32, ssbuffer.cross_buffer = 1 : i32}
            scf.if %37 {
              hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 2
            } else {
              hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 15 : i32, ssbuffer.transfer_id = 1 : i32}[<VECTOR>, <PIPE_V>, <PIPE_FIX>] flag = 5
            } {ssbuffer.block_id = 15 : i32, ssbuffer.cross_buffer = 1 : i32}
            %51 = arith.remsi %arg21, %27 {ssbuffer.block_id = 14 : i32} : i64
            %52 = arith.index_cast %34 {ssbuffer.block_id = 14 : i32, ssbuffer.dep_mark = [2 : i32]} : i64 to index
            %53 = arith.addi %52, %c1 {ssbuffer.block_id = 14 : i32} : index
            %reinterpret_cast = memref.reinterpret_cast %arg6 to offset: [%52], sizes: [1], strides: [1] {ssbuffer.block_id = 14 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
            %54 = memref.load %reinterpret_cast[%c0] {ssbuffer.block_id = 14 : i32} : memref<1xi64, strided<[1], offset: ?>>
            %reinterpret_cast_11 = memref.reinterpret_cast %arg6 to offset: [%53], sizes: [1], strides: [1] {ssbuffer.block_id = 14 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
            %55 = memref.load %reinterpret_cast_11[%c0] {ssbuffer.block_id = 14 : i32} : memref<1xi64, strided<[1], offset: ?>>
            %56 = arith.subi %55, %54 {ssbuffer.block_id = 14 : i32} : i64
            %57 = arith.addi %56, %c511_i64 {Undefined, ssbuffer.block_id = 14 : i32} : i64
            %58 = arith.divsi %57, %c512_i64 {Undefined, ssbuffer.block_id = 14 : i32} : i64
            %59 = arith.subi %58, %c1_i64 {Undefined, ssbuffer.block_id = 14 : i32} : i64
            %60 = arith.cmpi eq, %51, %59 {Undefined, ssbuffer.block_id = 14 : i32, ssbuffer.dep_mark = [1 : i32]} : i64
            hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 16 : i32}[<VECTOR>, <PIPE_FIX>, <PIPE_MTE2>] flag = 3
            scf.if %60 {
              %61 = arith.divsi %arg21, %27 {MixUse, ssbuffer.block_id = 16 : i32} : i64
              %62 = arith.addi %20, %61 {MixUse, ssbuffer.block_id = 16 : i32} : i64
              %63 = arith.remsi %62, %6 {MixUse, ssbuffer.block_id = 16 : i32} : i64
              %64:2 = scf.if %5 -> (i64, i64) {
                scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %63, %c0_i64 : i64, i64
              } else {
                %87 = arith.divsi %arg21, %27 {MixUse, ssbuffer.block_id = 13 : i32} : i64
                %88 = arith.addi %20, %87 {MixUse, ssbuffer.block_id = 13 : i32} : i64
                %89 = arith.remsi %88, %6 {MixUse, ssbuffer.block_id = 13 : i32} : i64
                %90:2 = scf.for %arg22 = %c0_i32 to %c12_i32 step %c1_i32 iter_args(%arg23 = %c0_i32, %arg24 = %c2049_i32) -> (i32, i32)  : i32 {
                  %96 = arith.addi %arg23, %arg24 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                  %97 = arith.divsi %96, %c2_i32 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                  %98 = arith.index_cast %97 {ssbuffer.block_id = 13 : i32} : i32 to index
                  %reinterpret_cast_20 = memref.reinterpret_cast %arg7 to offset: [%98], sizes: [1], strides: [1] {ssbuffer.block_id = 13 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
                  %99 = memref.load %reinterpret_cast_20[%c0] {ssbuffer.block_id = 13 : i32} : memref<1xi64, strided<[1], offset: ?>>
                  %100 = arith.cmpi sle, %99, %89 {MixUse, ssbuffer.block_id = 13 : i32} : i64
                  %101 = arith.select %100, %arg24, %97 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                  %102 = scf.if %100 -> (i32) {
                    %103 = arith.addi %arg23, %arg24 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                    %104 = arith.divsi %103, %c2_i32 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                    %105 = arith.addi %104, %c1_i32 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                    scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %105 : i32
                  } else {
                    scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %arg23 : i32
                  } {MixUse, ssbuffer.block_id = 13 : i32}
                  scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %102, %101 : i32, i32
                } {MixUse, ssbuffer.block_id = 13 : i32}
                %91 = arith.subi %90#0, %c1_i32 {ssbuffer.block_id = 13 : i32} : i32
                %92 = arith.extsi %91 {ssbuffer.block_id = 13 : i32} : i32 to i64
                %93 = arith.index_cast %91 {ssbuffer.block_id = 13 : i32} : i32 to index
                %reinterpret_cast_19 = memref.reinterpret_cast %arg7 to offset: [%93], sizes: [1], strides: [1] {ssbuffer.block_id = 13 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
                %94 = memref.load %reinterpret_cast_19[%c0] {ssbuffer.block_id = 13 : i32} : memref<1xi64, strided<[1], offset: ?>>
                %95 = arith.subi %89, %94 {MixUse, ssbuffer.block_id = 13 : i32} : i64
                scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %92, %95 : i64, i64
              } {MixUse, ssbuffer.block_id = 16 : i32}
              %65 = arith.divsi %62, %6 {MixUse, ssbuffer.block_id = 16 : i32} : i64
              %66 = arith.index_cast %64#0 {ssbuffer.block_id = 16 : i32} : i64 to index
              %reinterpret_cast_12 = memref.reinterpret_cast %arg5 to offset: [%66], sizes: [1], strides: [1] {ssbuffer.block_id = 16 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
              %67 = memref.load %reinterpret_cast_12[%c0] {ssbuffer.block_id = 16 : i32} : memref<1xi64, strided<[1], offset: ?>>
              %68 = arith.addi %66, %c1 {ssbuffer.block_id = 16 : i32} : index
              %reinterpret_cast_13 = memref.reinterpret_cast %arg5 to offset: [%68], sizes: [1], strides: [1] {ssbuffer.block_id = 16 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
              %69 = memref.load %reinterpret_cast_13[%c0] {ssbuffer.block_id = 16 : i32} : memref<1xi64, strided<[1], offset: ?>>
              %70 = arith.subi %69, %67 {ssbuffer.block_id = 16 : i32} : i64
              %71 = arith.muli %65, %c64_i64 {MixUse, ssbuffer.block_id = 16 : i32} : i64
              %72 = arith.muli %67, %c256_i64 {MixUse, ssbuffer.block_id = 16 : i32} : i64
              %73 = arith.addi %71, %72 {MixUse, ssbuffer.block_id = 16 : i32} : i64
              %74 = arith.muli %64#1, %c64_i64 {MixUse, ssbuffer.block_id = 16 : i32} : i64
              %75 = arith.index_cast %73 {ssbuffer.block_id = 16 : i32} : i64 to index
              %76 = arith.index_cast %74 {ssbuffer.block_id = 16 : i32} : i64 to index
              %77 = arith.muli %76, %c256 {ssbuffer.block_id = 16 : i32} : index
              %78 = arith.addi %75, %77 {ssbuffer.block_id = 16 : i32} : index
              %79 = arith.index_cast %70 {ssbuffer.block_id = 16 : i32} : i64 to index
              %80 = arith.maxsi %76, %79 {ssbuffer.block_id = 16 : i32} : index
              %reinterpret_cast_14 = memref.reinterpret_cast %arg8 to offset: [%78], sizes: [144, 64], strides: [256, 1] {ssbuffer.block_id = 16 : i32} : memref<?xf32> to memref<144x64xf32, strided<[256, 1], offset: ?>>
              %alloc_15 = memref.alloc() {ssbuffer.block_id = 16 : i32} : memref<144x64xf32>
              %81 = arith.addi %76, %c144 {ssbuffer.block_id = 16 : i32} : index
              %82 = arith.minsi %81, %80 {ssbuffer.block_id = 16 : i32} : index
              %83 = arith.subi %82, %76 {ssbuffer.block_id = 16 : i32} : index
              %84 = arith.cmpi slt, %83, %c144 {ssbuffer.block_id = 16 : i32} : index
              scf.if %84 {
                linalg.fill {ssbuffer.block_id = 16 : i32} ins(%cst_1 : f32) outs(%alloc_15 : memref<144x64xf32>)
              } {hivm.unlikely_condition, ssbuffer.block_id = 16 : i32}
              %subview = memref.subview %reinterpret_cast_14[0, 0] [%83, 64] [1, 1] {ssbuffer.block_id = 16 : i32} : memref<144x64xf32, strided<[256, 1], offset: ?>> to memref<?x64xf32, strided<[256, 1], offset: ?>>
              %subview_16 = memref.subview %alloc_15[0, 0] [%83, 64] [1, 1] {ssbuffer.block_id = 16 : i32} : memref<144x64xf32> to memref<?x64xf32, strided<[64, 1]>>
              memref.copy %subview, %subview_16 {ssbuffer.block_id = 16 : i32, ssbuffer.crossCoreDeps = [2 : i32, 0 : i32], ssbuffer.memCrossDeps = [2 : i32, 0 : i32]} : memref<?x64xf32, strided<[256, 1], offset: ?>> to memref<?x64xf32, strided<[64, 1]>>
              %85 = bufferization.to_tensor %alloc_15 restrict writable {ssbuffer.block_id = 16 : i32} : memref<144x64xf32> to tensor<144x64xf32>
              %86 = arith.truncf %85 {DataUse, ssbuffer.block_id = 16 : i32} : tensor<144x64xf32> to tensor<144x64xbf16>
              %reinterpret_cast_17 = memref.reinterpret_cast %arg9 to offset: [%78], sizes: [144, 64], strides: [256, 1] {ssbuffer.block_id = 16 : i32} : memref<?xbf16> to memref<144x64xbf16, strided<[256, 1], offset: ?>>
              %extracted_slice = tensor.extract_slice %86[0, 0] [%83, 64] [1, 1] {ssbuffer.block_id = 16 : i32} : tensor<144x64xbf16> to tensor<?x64xbf16>
              %subview_18 = memref.subview %reinterpret_cast_17[0, 0] [%83, 64] [1, 1] {ssbuffer.block_id = 16 : i32} : memref<144x64xbf16, strided<[256, 1], offset: ?>> to memref<?x64xbf16, strided<[256, 1], offset: ?>>
              bufferization.materialize_in_destination %extracted_slice in writable %subview_18 {ssbuffer.block_id = 16 : i32} : (tensor<?x64xbf16>, memref<?x64xbf16, strided<[256, 1], offset: ?>>) -> ()
            } {Undefined, ssbuffer.block_id = 16 : i32, ssbuffer.dep_mark = [1 : i32]}
          } {Undefined, ssbuffer.block_id = 19 : i32, ssbuffer.main_loop = 0 : i32}
          hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 1
          hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32}[<VECTOR>, <PIPE_M>, <PIPE_MTE3>] flag = 4
        } {Undefined, ssbuffer.block_id = 21 : i32}
      } {Undefined, ssbuffer.block_id = 23 : i32}
      scope.return
    } {hivm.matmul_limited_in_cube, hivm.tcore_type = #hivm.tcore_type<VECTOR>}
    scope.scope : () -> () {
      %0 = arith.extsi %arg15 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %1 = arith.extsi %arg18 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %2 = tensor.empty() {ssbuffer.block_id = 1 : i32} : tensor<64x512xf32>
      %3 = linalg.fill {ssbuffer.block_id = 1 : i32} ins(%cst_1 : f32) outs(%2 : tensor<64x512xf32>) -> tensor<64x512xf32>
      %4 = tensor.empty() {ssbuffer.block_id = 1 : i32} : tensor<64x64xf32>
      %5 = linalg.fill {ssbuffer.block_id = 1 : i32} ins(%cst_1 : f32) outs(%4 : tensor<64x64xf32>) -> tensor<64x64xf32>
      %6 = arith.cmpi sle, %arg12, %c64_i32 {Undefined, ssbuffer.block_id = 1 : i32} : i32
      %7 = arith.extsi %arg15 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %8 = arith.extsi %arg18 {MixUse, ssbuffer.block_id = 1 : i32} : i32 to i64
      %9 = scf.if %6 -> (i64) {
        scf.yield {Undefined, ssbuffer.block_id = 1 : i32} %c2048_i64 : i64
      } else {
        %reinterpret_cast = memref.reinterpret_cast %arg7 to offset: [2048], sizes: [1], strides: [1] {ssbuffer.block_id = 1 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: 2048>>
        %41 = memref.load %reinterpret_cast[%c0] {ssbuffer.block_id = 1 : i32} : memref<1xi64, strided<[1], offset: 2048>>
        scf.yield {Undefined, ssbuffer.block_id = 1 : i32} %41 : i64
      } {MixUse, ssbuffer.block_id = 1 : i32}
      %10 = arith.muli %9, %c4_i64 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %11 = arith.minsi %0, %10 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %12 = arith.divsi %10, %11 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %13 = arith.addi %12, %c1_i64 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %14 = arith.remsi %10, %11 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %15 = arith.cmpi slt, %1, %11 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %16 = arith.cmpi slt, %1, %14 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %17 = arith.muli %1, %13 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %18 = arith.muli %14, %13 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %19 = arith.subi %1, %14 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %20 = arith.muli %19, %12 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %21 = arith.addi %18, %20 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %22 = arith.select %16, %17, %21 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %23 = arith.select %15, %22, %c0_i64 {MixUse, ssbuffer.block_id = 1 : i32} : i64
      %24 = arith.select %16, %13, %12 {Undefined, ssbuffer.block_id = 1 : i32} : i64
      %25 = arith.select %15, %24, %c0_i64 {Undefined, ssbuffer.block_id = 1 : i32} : i64
      %26 = arith.cmpi sge, %1, %11 {Undefined, ssbuffer.block_id = 1 : i32} : i64
      %27 = arith.muli %9, %c4_i64 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %28 = arith.minsi %7, %27 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %29 = arith.divsi %27, %28 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %30 = arith.addi %29, %c1_i64 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %31 = arith.remsi %27, %28 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %32 = arith.cmpi slt, %8, %28 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %33 = arith.cmpi slt, %8, %31 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %34 = arith.muli %8, %30 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %35 = arith.muli %31, %30 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %36 = arith.subi %8, %31 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %37 = arith.muli %36, %29 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %38 = arith.addi %35, %37 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %39 = arith.select %33, %34, %38 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      %40 = arith.select %32, %39, %c0_i64 {MixUse, ssbuffer.block_id = 2 : i32} : i64
      scf.if %26 {
      } else {
        %41 = arith.cmpi sle, %25, %c0_i64 {Undefined, ssbuffer.block_id = 11 : i32} : i64
        scf.if %41 {
        } else {
          %42 = arith.addi %arg13, %c511_i32 {MixUse, ssbuffer.block_id = 12 : i32} : i32
          %43 = arith.divsi %42, %c512_i32 {MixUse, ssbuffer.block_id = 12 : i32} : i32
          %44 = arith.extsi %43 {MixUse, ssbuffer.block_id = 12 : i32} : i32 to i64
          %45 = arith.muli %25, %44 {Undefined, ssbuffer.block_id = 12 : i32} : i64
          %46 = arith.addi %arg13, %c511_i32 {MixUse, ssbuffer.block_id = 3 : i32} : i32
          %47 = arith.divsi %46, %c512_i32 {MixUse, ssbuffer.block_id = 3 : i32} : i32
          %48 = arith.extsi %47 {MixUse, ssbuffer.block_id = 3 : i32} : i32 to i64
          %alloc = memref.alloc() {ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32} : memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>
          %alloc_4 = memref.alloc() {ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32} : memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>
          annotation.mark %alloc_4 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<2>, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32} : memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>
          annotation.mark %alloc {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<0>, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32} : memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>
          hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
          hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 4
          %alloc_5 = memref.alloc() {ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32, #hivm.address_space<ub>>
          %alloc_6 = memref.alloc() {ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_6 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<3>, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32, #hivm.address_space<ub>>
          annotation.mark %alloc_5 {effects = ["write", "read"], hivm.tightly_coupled_buffer = #hivm.tightly_coupled_buffer<1>, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32} : memref<64x512xf32, #hivm.address_space<ub>>
          scf.for %arg21 = %c0_i64 to %45 step %c1_i64  : i64 {
            %49 = arith.divsi %arg21, %44 {MixUse, ssbuffer.block_id = 13 : i32} : i64
            %50 = arith.addi %23, %49 {MixUse, ssbuffer.block_id = 13 : i32} : i64
            %51 = arith.remsi %50, %9 {MixUse, ssbuffer.block_id = 13 : i32} : i64
            %52:2 = scf.if %6 -> (i64, i64) {
              scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %51, %c0_i64 : i64, i64
            } else {
              %105 = arith.divsi %arg21, %44 {MixUse, ssbuffer.block_id = 13 : i32} : i64
              %106 = arith.addi %23, %105 {MixUse, ssbuffer.block_id = 13 : i32} : i64
              %107 = arith.remsi %106, %9 {MixUse, ssbuffer.block_id = 13 : i32} : i64
              %108:2 = scf.for %arg22 = %c0_i32 to %c12_i32 step %c1_i32 iter_args(%arg23 = %c0_i32, %arg24 = %c2049_i32) -> (i32, i32)  : i32 {
                %114 = arith.addi %arg23, %arg24 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                %115 = arith.divsi %114, %c2_i32 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                %116 = arith.index_cast %115 {ssbuffer.block_id = 13 : i32} : i32 to index
                %reinterpret_cast_27 = memref.reinterpret_cast %arg7 to offset: [%116], sizes: [1], strides: [1] {ssbuffer.block_id = 13 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
                %117 = memref.load %reinterpret_cast_27[%c0] {ssbuffer.block_id = 13 : i32} : memref<1xi64, strided<[1], offset: ?>>
                %118 = arith.cmpi sle, %117, %107 {MixUse, ssbuffer.block_id = 13 : i32} : i64
                %119 = arith.select %118, %arg24, %115 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                %120 = scf.if %118 -> (i32) {
                  %121 = arith.addi %arg23, %arg24 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                  %122 = arith.divsi %121, %c2_i32 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                  %123 = arith.addi %122, %c1_i32 {MixUse, ssbuffer.block_id = 13 : i32} : i32
                  scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %123 : i32
                } else {
                  scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %arg23 : i32
                } {MixUse, ssbuffer.block_id = 13 : i32}
                scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %120, %119 : i32, i32
              } {MixUse, ssbuffer.block_id = 13 : i32}
              %109 = arith.subi %108#0, %c1_i32 {ssbuffer.block_id = 13 : i32} : i32
              %110 = arith.extsi %109 {ssbuffer.block_id = 13 : i32} : i32 to i64
              %111 = arith.index_cast %109 {ssbuffer.block_id = 13 : i32} : i32 to index
              %reinterpret_cast_26 = memref.reinterpret_cast %arg7 to offset: [%111], sizes: [1], strides: [1] {ssbuffer.block_id = 13 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
              %112 = memref.load %reinterpret_cast_26[%c0] {ssbuffer.block_id = 13 : i32} : memref<1xi64, strided<[1], offset: ?>>
              %113 = arith.subi %107, %112 {MixUse, ssbuffer.block_id = 13 : i32} : i64
              scf.yield {Undefined, ssbuffer.block_id = 13 : i32} %110, %113 : i64, i64
            } {MixUse, ssbuffer.block_id = 13 : i32}
            %53 = arith.divsi %arg21, %48 {MixUse, ssbuffer.block_id = 5 : i32} : i64
            %54 = arith.addi %40, %53 {MixUse, ssbuffer.block_id = 5 : i32} : i64
            %55 = arith.remsi %arg21, %48 {ssbuffer.block_id = 5 : i32} : i64
            %56 = arith.divsi %54, %9 {MixUse, ssbuffer.block_id = 5 : i32} : i64
            %57 = arith.index_cast %52#0 {ssbuffer.block_id = 5 : i32} : i64 to index
            %reinterpret_cast = memref.reinterpret_cast %arg5 to offset: [%57], sizes: [1], strides: [1] {ssbuffer.block_id = 5 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
            %58 = memref.load %reinterpret_cast[%c0] {ssbuffer.block_id = 5 : i32} : memref<1xi64, strided<[1], offset: ?>>
            %59 = arith.addi %57, %c1 {ssbuffer.block_id = 5 : i32} : index
            %reinterpret_cast_7 = memref.reinterpret_cast %arg5 to offset: [%59], sizes: [1], strides: [1] {ssbuffer.block_id = 5 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
            %60 = memref.load %reinterpret_cast_7[%c0] {ssbuffer.block_id = 5 : i32} : memref<1xi64, strided<[1], offset: ?>>
            %reinterpret_cast_8 = memref.reinterpret_cast %arg6 to offset: [%57], sizes: [1], strides: [1] {ssbuffer.block_id = 5 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
            %61 = memref.load %reinterpret_cast_8[%c0] {ssbuffer.block_id = 5 : i32} : memref<1xi64, strided<[1], offset: ?>>
            %reinterpret_cast_9 = memref.reinterpret_cast %arg6 to offset: [%59], sizes: [1], strides: [1] {ssbuffer.block_id = 5 : i32} : memref<?xi64> to memref<1xi64, strided<[1], offset: ?>>
            %62 = memref.load %reinterpret_cast_9[%c0] {ssbuffer.block_id = 5 : i32} : memref<1xi64, strided<[1], offset: ?>>
            %63 = arith.subi %60, %58 {ssbuffer.block_id = 5 : i32} : i64
            %64 = arith.subi %62, %61 {ssbuffer.block_id = 5 : i32} : i64
            %65 = arith.muli %56, %c64_i64 {MixUse, ssbuffer.block_id = 5 : i32} : i64
            %66 = arith.muli %58, %c256_i64 {MixUse, ssbuffer.block_id = 5 : i32} : i64
            %67 = arith.addi %65, %66 {MixUse, ssbuffer.block_id = 5 : i32} : i64
            %68 = arith.muli %61, %c256_i64 {ssbuffer.block_id = 5 : i32} : i64
            %69 = arith.addi %65, %68 {ssbuffer.block_id = 5 : i32} : i64
            %70 = arith.muli %55, %c512_i64 {ssbuffer.block_id = 5 : i32} : i64
            %71 = arith.muli %52#1, %c64_i64 {MixUse, ssbuffer.block_id = 5 : i32} : i64
            %72 = arith.index_cast %67 {ssbuffer.block_id = 5 : i32} : i64 to index
            %73 = arith.index_cast %71 {ssbuffer.block_id = 5 : i32} : i64 to index
            %74 = arith.muli %73, %c256 {ssbuffer.block_id = 5 : i32} : index
            %75 = arith.addi %72, %74 {ssbuffer.block_id = 5 : i32} : index
            %reinterpret_cast_10 = memref.reinterpret_cast %arg2 to offset: [%75], sizes: [64, 64], strides: [256, 1] {ssbuffer.block_id = 5 : i32} : memref<?xbf16> to memref<64x64xbf16, strided<[256, 1], offset: ?>>
            %alloc_11 = memref.alloc() {ssbuffer.block_id = 5 : i32} : memref<64x64xbf16>
            %76 = arith.addi %73, %c64 {ssbuffer.block_id = 5 : i32} : index
            %77 = arith.index_cast %63 {ssbuffer.block_id = 5 : i32} : i64 to index
            %78 = arith.maxsi %73, %77 {ssbuffer.block_id = 5 : i32} : index
            %79 = arith.minsi %76, %78 {ssbuffer.block_id = 5 : i32} : index
            %80 = arith.subi %79, %73 {ssbuffer.block_id = 5 : i32} : index
            %81 = arith.cmpi slt, %80, %c64 {ssbuffer.block_id = 5 : i32} : index
            scf.if %81 {
              linalg.fill {ssbuffer.block_id = 5 : i32} ins(%cst_3 : bf16) outs(%alloc_11 : memref<64x64xbf16>)
            } {hivm.unlikely_condition, ssbuffer.block_id = 5 : i32}
            %subview = memref.subview %reinterpret_cast_10[0, 0] [%80, 64] [1, 1] {ssbuffer.block_id = 5 : i32} : memref<64x64xbf16, strided<[256, 1], offset: ?>> to memref<?x64xbf16, strided<[256, 1], offset: ?>>
            %subview_12 = memref.subview %alloc_11[0, 0] [%80, 64] [1, 1] {ssbuffer.block_id = 5 : i32} : memref<64x64xbf16> to memref<?x64xbf16, strided<[64, 1]>>
            memref.copy %subview, %subview_12 {ssbuffer.block_id = 5 : i32} : memref<?x64xbf16, strided<[256, 1], offset: ?>> to memref<?x64xbf16, strided<[64, 1]>>
            %82 = bufferization.to_tensor %alloc_11 restrict writable {ssbuffer.block_id = 5 : i32} : memref<64x64xbf16> to tensor<64x64xbf16>
            %83 = arith.index_cast %69 {ssbuffer.block_id = 5 : i32} : i64 to index
            %84 = arith.index_cast %70 {ssbuffer.block_id = 5 : i32} : i64 to index
            %85 = arith.muli %84, %c256 {ssbuffer.block_id = 5 : i32} : index
            %86 = arith.addi %83, %85 {ssbuffer.block_id = 5 : i32} : index
            %reinterpret_cast_13 = memref.reinterpret_cast %arg3 to offset: [%86], sizes: [512, 64], strides: [256, 1] {ssbuffer.block_id = 5 : i32} : memref<?xbf16> to memref<512x64xbf16, strided<[256, 1], offset: ?>>
            %alloc_14 = memref.alloc() {ssbuffer.block_id = 5 : i32} : memref<512x64xbf16>
            %87 = arith.addi %84, %c512 {ssbuffer.block_id = 5 : i32} : index
            %88 = arith.index_cast %64 {ssbuffer.block_id = 5 : i32} : i64 to index
            %89 = arith.maxsi %84, %88 {ssbuffer.block_id = 5 : i32} : index
            %90 = arith.minsi %87, %89 {ssbuffer.block_id = 5 : i32} : index
            %91 = arith.subi %90, %84 {ssbuffer.block_id = 5 : i32} : index
            %92 = arith.cmpi slt, %91, %c512 {ssbuffer.block_id = 5 : i32} : index
            scf.if %92 {
              linalg.fill {ssbuffer.block_id = 5 : i32} ins(%cst_3 : bf16) outs(%alloc_14 : memref<512x64xbf16>)
            } {hivm.unlikely_condition, ssbuffer.block_id = 5 : i32}
            %subview_15 = memref.subview %reinterpret_cast_13[0, 0] [%91, 64] [1, 1] {ssbuffer.block_id = 5 : i32} : memref<512x64xbf16, strided<[256, 1], offset: ?>> to memref<?x64xbf16, strided<[256, 1], offset: ?>>
            %subview_16 = memref.subview %alloc_14[0, 0] [%91, 64] [1, 1] {ssbuffer.block_id = 5 : i32} : memref<512x64xbf16> to memref<?x64xbf16, strided<[64, 1]>>
            memref.copy %subview_15, %subview_16 {ssbuffer.block_id = 5 : i32} : memref<?x64xbf16, strided<[256, 1], offset: ?>> to memref<?x64xbf16, strided<[64, 1]>>
            %93 = bufferization.to_tensor %alloc_14 restrict writable {ssbuffer.block_id = 5 : i32} : memref<512x64xbf16> to tensor<512x64xbf16>
            %94 = tensor.empty() {ssbuffer.block_id = 5 : i32} : tensor<64x512xbf16>
            %transposed = linalg.transpose ins(%93 : tensor<512x64xbf16>) outs(%94 : tensor<64x512xbf16>) permutation = [1, 0]  {ssbuffer.block_id = 5 : i32}
            %95 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 5 : i32, ssbuffer.loop_carried_l0c} ins(%82, %transposed : tensor<64x64xbf16>, tensor<64x512xbf16>) outs(%3 : tensor<64x512xf32>) -> tensor<64x512xf32>
            %96 = arith.divsi %arg21, %c1_i64 {ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32} : i64
            %c2_i64 = arith.constant {ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32} 2 : i64
            %97 = arith.remsi %96, %c2_i64 {ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32} : i64
            %c0_i64_17 = arith.constant {ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32} 0 : i64
            %98 = arith.cmpi eq, %97, %c0_i64_17 {ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32} : i64
            scf.if %98 {
              hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
            } else {
              hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
            } {ssbuffer.block_id = 5 : i32, ssbuffer.cross_buffer = 1 : i32}
            scf.if %98 {
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 5 : i32, ssbuffer.crossCoreDeps = [1 : i32, 1 : i32], ssbuffer.transfer_id = 1 : i32} ins(%95 : tensor<64x512xf32>) outs(%alloc_5 : memref<64x512xf32, #hivm.address_space<ub>>)
            } else {
              hivm.hir.fixpipe {dma_mode = #hivm.dma_mode<nz2nd>, ssbuffer.block_id = 5 : i32, ssbuffer.crossCoreDeps = [1 : i32, 1 : i32], ssbuffer.transfer_id = 1 : i32} ins(%95 : tensor<64x512xf32>) outs(%alloc_6 : memref<64x512xf32, #hivm.address_space<ub>>)
            } {ssbuffer.block_id = 5 : i32, ssbuffer.cross_buffer = 1 : i32, ssbuffer.transfer_id = 1 : i32}
            scf.if %98 {
              hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 2
            } else {
              hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 5 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_V>] flag = 5
            } {ssbuffer.block_id = 5 : i32, ssbuffer.cross_buffer = 1 : i32}
            %reinterpret_cast_18 = memref.reinterpret_cast %arg4 to offset: [%86], sizes: [512, 64], strides: [256, 1] {ssbuffer.block_id = 7 : i32} : memref<?xbf16> to memref<512x64xbf16, strided<[256, 1], offset: ?>>
            %alloc_19 = memref.alloc() {ssbuffer.block_id = 7 : i32} : memref<512x64xbf16>
            scf.if %92 {
              linalg.fill {ssbuffer.block_id = 7 : i32} ins(%cst_3 : bf16) outs(%alloc_19 : memref<512x64xbf16>)
            } {hivm.unlikely_condition, ssbuffer.block_id = 7 : i32}
            %subview_20 = memref.subview %reinterpret_cast_18[0, 0] [%91, 64] [1, 1] {ssbuffer.block_id = 7 : i32} : memref<512x64xbf16, strided<[256, 1], offset: ?>> to memref<?x64xbf16, strided<[256, 1], offset: ?>>
            %subview_21 = memref.subview %alloc_19[0, 0] [%91, 64] [1, 1] {ssbuffer.block_id = 7 : i32} : memref<512x64xbf16> to memref<?x64xbf16, strided<[64, 1]>>
            memref.copy %subview_20, %subview_21 {ssbuffer.block_id = 7 : i32} : memref<?x64xbf16, strided<[256, 1], offset: ?>> to memref<?x64xbf16, strided<[64, 1]>>
            %99 = bufferization.to_tensor %alloc_19 restrict writable {ssbuffer.block_id = 7 : i32} : memref<512x64xbf16> to tensor<512x64xbf16>
            %100 = arith.divsi %arg21, %c1_i64 {ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32} : i64
            %c2_i64_22 = arith.constant {ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32} 2 : i64
            %101 = arith.remsi %100, %c2_i64_22 {ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32} : i64
            %c0_i64_23 = arith.constant {ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32} 0 : i64
            %102 = arith.cmpi eq, %101, %c0_i64_23 {ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32} : i64
            scf.if %102 {
              hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 1
            } else {
              hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_MTE3>, <PIPE_MTE1>] flag = 4
            } {ssbuffer.block_id = 7 : i32, ssbuffer.cross_buffer = 1 : i32}
            %103 = scf.if %102 -> (tensor<64x512xbf16>) {
              %105 = hivm.hir.convert_layout %alloc output_shape [64, 512] {dstLayout = #hivm.data_layout<ND>, srcLayout = #hivm.data_layout<nZ>, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32} : (memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>) -> memref<64x512xbf16, #hivm.address_space<cbuf>>
              %memspacecast = memref.memory_space_cast %105 {ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32} : memref<64x512xbf16, #hivm.address_space<cbuf>> to memref<64x512xbf16>
              %106 = bufferization.to_tensor %memspacecast restrict writable {ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32} : memref<64x512xbf16> to tensor<64x512xbf16>
              scf.yield %106 : tensor<64x512xbf16>
            } else {
              %105 = hivm.hir.convert_layout %alloc_4 output_shape [64, 512] {dstLayout = #hivm.data_layout<ND>, srcLayout = #hivm.data_layout<nZ>, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32} : (memref<32x4x16x16xbf16, #hivm.address_space<cbuf>>) -> memref<64x512xbf16, #hivm.address_space<cbuf>>
              %memspacecast = memref.memory_space_cast %105 {ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32} : memref<64x512xbf16, #hivm.address_space<cbuf>> to memref<64x512xbf16>
              %106 = bufferization.to_tensor %memspacecast restrict writable {ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32} : memref<64x512xbf16> to tensor<64x512xbf16>
              scf.yield %106 : tensor<64x512xbf16>
            } {ssbuffer.block_id = 7 : i32, ssbuffer.crossCoreDeps = [0 : i32, 0 : i32], ssbuffer.cross_buffer = 1 : i32, ssbuffer.transfer_id = 0 : i32}
            %104 = linalg.matmul {input_precision = "ieee", ssbuffer.block_id = 7 : i32, ssbuffer.loop_carried_l0c} ins(%103, %99 : tensor<64x512xbf16>, tensor<512x64xbf16>) outs(%5 : tensor<64x64xf32>) -> tensor<64x64xf32>
            %reinterpret_cast_24 = memref.reinterpret_cast %arg8 to offset: [%75], sizes: [64, 64], strides: [256, 1] {ssbuffer.block_id = 7 : i32} : memref<?xf32> to memref<64x64xf32, strided<[256, 1], offset: ?>>
            %subview_25 = memref.subview %reinterpret_cast_24[0, 0] [%80, 64] [1, 1] {ssbuffer.block_id = 7 : i32} : memref<64x64xf32, strided<[256, 1], offset: ?>> to memref<?x64xf32, strided<[256, 1], offset: ?>>
            %extracted_slice = tensor.extract_slice %104[0, 0] [%80, 64] [1, 1] {ssbuffer.block_id = 7 : i32} : tensor<64x64xf32> to tensor<?x64xf32>
            hivm.hir.store ins(%extracted_slice : tensor<?x64xf32>) outs(%subview_25 : memref<?x64xf32, strided<[256, 1], offset: ?>>) {ssbuffer.block_id = 7 : i32, ssbuffer.crossCoreDeps = [2 : i32, 1 : i32], ssbuffer.memCrossDeps = [2 : i32, 1 : i32]} atomic = <add>
            scf.if %102 {
              hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 1
            } else {
              hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32, ssbuffer.transfer_id = 0 : i32}[<CUBE>, <PIPE_M>, <PIPE_MTE3>] flag = 4
            } {ssbuffer.block_id = 7 : i32, ssbuffer.cross_buffer = 1 : i32}
            hivm.hir.sync_block_set {ssbuffer.analyze_flag_id, ssbuffer.block_id = 7 : i32}[<CUBE>, <PIPE_FIX>, <PIPE_MTE2>] flag = 3
          } {Undefined, ssbuffer.block_id = 19 : i32, ssbuffer.main_loop = 0 : i32}
          hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 2
          hivm.hir.sync_block_wait {ssbuffer.analyze_flag_id, ssbuffer.block_id = 19 : i32, ssbuffer.transfer_id = 1 : i32}[<CUBE>, <PIPE_V>, <PIPE_FIX>] flag = 5
        } {Undefined, ssbuffer.block_id = 21 : i32}
      } {Undefined, ssbuffer.block_id = 23 : i32}
      scope.return
    } {hivm.matmul_limited_in_cube, hivm.tcore_type = #hivm.tcore_type<CUBE>}
    return
  }
}