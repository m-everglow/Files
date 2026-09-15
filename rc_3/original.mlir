[pre-check-dynamic-cv-pipeline-available] Before PreCheck:
module attributes {hacc.target = #hacc.target<"Ascend950PR_9579">, ssbuffer.insertionOptimization} {
  func.func @chunk_ttt_linear_fwd_kernel_h(%arg0: memref<?xi8>, %arg1: memref<?xi8>, %arg2: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16> {tt.tensor_kind = 1 : i32}, %arg5: memref<?xf16>, %arg6: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf16> {tt.tensor_kind = 0 : i32}, %arg8: f32, %arg9: memref<?xf16> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf16> {tt.tensor_kind = 1 : i32}, %arg11: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32> {tt.tensor_kind = 0 : i32}, %arg13: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg14: memref<?xf32> {tt.tensor_kind = 1 : i32}, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, global_kernel = "local", mix_mode = "mix", parallel_mode = "simd"} {
    %c16 = arith.constant 16 : index
    %c2 = arith.constant 2 : index
    %c512 = arith.constant 512 : index
    %cst = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c15_i32 = arith.constant {MixUse} 15 : i32
    %c0_i32 = arith.constant {Undefined} 0 : i32
    %c4096_i32 = arith.constant 4096 : i32
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 6.400000e+01 : f16
    %cst_2 = arith.constant 1.000000e+00 : f32
    %c8_i32 = arith.constant {MixUse} 8 : i32
    %c64_i32 = arith.constant {MixUse} 64 : i32
    %c1_i32 = arith.constant {MixUse} 1 : i32
    %c16_i32 = arith.constant {MixUse} 16 : i32
    %cst_3 = arith.constant 6.400000e+01 : f32
    %0 = tensor.empty() : tensor<16x1xf32>
    %1 = linalg.fill ins(%cst_3 : f32) outs(%0 : tensor<16x1xf32>) -> tensor<16x1xf32>
    %2 = linalg.fill ins(%cst_2 : f32) outs(%0 : tensor<16x1xf32>) -> tensor<16x1xf32>
    %3 = tensor.empty() : tensor<16x64xf16>
    %4 = linalg.fill ins(%cst_1 : f16) outs(%3 : tensor<16x64xf16>) -> tensor<16x64xf16>
    %5 = tensor.empty() : tensor<16x64xf32>
    %6 = linalg.fill ins(%cst_3 : f32) outs(%5 : tensor<16x64xf32>) -> tensor<16x64xf32>
    %7 = tensor.empty() : tensor<64x64xf32>
    %8 = linalg.fill ins(%cst_0 : f32) outs(%7 : tensor<64x64xf32>) -> tensor<64x64xf32>
    %9 = arith.divsi %arg21, %c8_i32 {MixUse} : i32
    %10 = arith.remsi %arg21, %c8_i32 {MixUse} : i32
    %11 = arith.muli %9, %arg15 {MixUse} : i32
    %12 = arith.addi %arg15, %c15_i32 {MixUse} : i32
    %13 = arith.divsi %12, %c16_i32 {MixUse} : i32
    %14 = arith.muli %9, %13 {MixUse} : i32
    %15 = arith.muli %arg21, %c64_i32 {MixUse} : i32
    %16 = arith.muli %arg21, %c4096_i32 : i32
    %17 = arith.index_cast %16 : i32 to index
    %18 = arith.muli %arg19, %c64_i32 : i32
    %19 = arith.muli %arg20, %c64_i32 : i32
    %20 = arith.maxsi %18, %c0_i32 : i32
    %21 = arith.index_cast %20 : i32 to index
    %22 = arith.maxsi %19, %c0_i32 : i32
    %23 = arith.index_cast %22 : i32 to index
    %24 = arith.muli %21, %c64 : index
    %25 = arith.addi %24, %17 : index
    %26 = arith.addi %25, %23 : index
    %reinterpret_cast = memref.reinterpret_cast %arg11 to offset: [%26], sizes: [64, 64], strides: [64, 1] : memref<?xf32> to memref<64x64xf32, strided<[64, 1], offset: ?>>
    %alloc = memref.alloc() : memref<64x64xf32>
    %27 = arith.subi %26, %17 : index
    %28 = arith.divsi %27, %c64 : index
    %29 = arith.subi %c64, %28 : index
    %30 = arith.maxsi %29, %c0 : index
    %31 = arith.minsi %30, %c64 : index
    %32 = arith.remsi %27, %c64 : index
    %33 = arith.subi %c64, %32 : index
    %34 = arith.maxsi %33, %c0 : index
    %35 = arith.minsi %34, %c64 : index
    %36 = arith.subi %c0_i32, %18 : i32
    %37 = arith.maxsi %36, %c0_i32 : i32
    %38 = arith.index_cast %37 : i32 to index
    %39 = arith.minsi %38, %31 : index
    %40 = arith.subi %31, %39 : index
    %41 = arith.subi %c0_i32, %19 : i32
    %42 = arith.maxsi %41, %c0_i32 : i32
    %43 = arith.index_cast %42 : i32 to index
    %44 = arith.minsi %43, %35 : index
    %45 = arith.subi %35, %44 : index
    %46 = arith.cmpi slt, %40, %c64 : index
    %47 = arith.cmpi slt, %45, %c64 : index
    %48 = arith.ori %46, %47 : i1
    scf.if %48 {
      linalg.fill ins(%cst_0 : f32) outs(%alloc : memref<64x64xf32>)
    } {hivm.unlikely_condition}
    %subview = memref.subview %reinterpret_cast[0, 0] [%40, %45] [1, 1] : memref<64x64xf32, strided<[64, 1], offset: ?>> to memref<?x?xf32, strided<[64, 1], offset: ?>>
    %subview_4 = memref.subview %alloc[%39, %44] [%40, %45] [1, 1] : memref<64x64xf32> to memref<?x?xf32, strided<[64, 1], offset: ?>>
    memref.copy %subview, %subview_4 : memref<?x?xf32, strided<[64, 1], offset: ?>> to memref<?x?xf32, strided<[64, 1], offset: ?>>
    %49 = bufferization.to_tensor %alloc restrict writable : memref<64x64xf32> to tensor<64x64xf32>
    %50 = arith.index_cast %15 : i32 to index
    %51 = arith.addi %23, %50 : index
    %reinterpret_cast_5 = memref.reinterpret_cast %arg12 to offset: [%51], sizes: [64], strides: [1] : memref<?xf32> to memref<64xf32, strided<[1], offset: ?>>
    %alloc_6 = memref.alloc() : memref<64xf32>
    %52 = arith.subi %c64, %23 : index
    %53 = arith.maxsi %52, %c0 : index
    %54 = arith.minsi %53, %c64 : index
    %55 = arith.minsi %43, %54 : index
    %56 = arith.subi %54, %55 : index
    %57 = arith.cmpi slt, %56, %c64 : index
    scf.if %57 {
      linalg.fill ins(%cst_0 : f32) outs(%alloc_6 : memref<64xf32>)
    } {hivm.unlikely_condition}
    %subview_7 = memref.subview %reinterpret_cast_5[0] [%56] [1] : memref<64xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_8 = memref.subview %alloc_6[%55] [%56] [1] : memref<64xf32> to memref<?xf32, strided<[1], offset: ?>>
    memref.copy %subview_7, %subview_8 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %58 = bufferization.to_tensor %alloc_6 restrict writable : memref<64xf32> to tensor<64xf32>
    %59 = arith.muli %10, %c64_i32 : i32
    %60 = arith.index_cast %59 : i32 to index
    %reinterpret_cast_9 = memref.reinterpret_cast %arg6 to offset: [%60], sizes: [64], strides: [1] : memref<?xf16> to memref<64xf16, strided<[1], offset: ?>>
    %alloc_10 = memref.alloc() : memref<64xf16>
    memref.copy %reinterpret_cast_9, %alloc_10 : memref<64xf16, strided<[1], offset: ?>> to memref<64xf16>
    %61 = bufferization.to_tensor %alloc_10 restrict writable : memref<64xf16> to tensor<64xf16>
    %reinterpret_cast_11 = memref.reinterpret_cast %arg7 to offset: [%60], sizes: [64], strides: [1] : memref<?xf16> to memref<64xf16, strided<[1], offset: ?>>
    %alloc_12 = memref.alloc() : memref<64xf16>
    memref.copy %reinterpret_cast_11, %alloc_12 : memref<64xf16, strided<[1], offset: ?>> to memref<64xf16>
    %62 = bufferization.to_tensor %alloc_12 restrict writable : memref<64xf16> to tensor<64xf16>
    %63 = arith.muli %11, %c8_i32 {MixUse} : i32
    %64 = arith.addi %63, %10 {MixUse} : i32
    %65 = arith.muli %64, %c64_i32 : i32
    %66 = arith.index_cast %65 : i32 to index
    %67 = arith.subi %13, %c1_i32 {Undefined} : i32
    %68 = linalg.fill ins(%arg8 : f32) outs(%0 : tensor<16x1xf32>) -> tensor<16x1xf32>
    %broadcasted = linalg.broadcast ins(%61 : tensor<64xf16>) outs(%3 : tensor<16x64xf16>) dimensions = [0] 
    %broadcasted_13 = linalg.broadcast ins(%62 : tensor<64xf16>) outs(%3 : tensor<16x64xf16>) dimensions = [0] 
    %69:2 = scf.for %arg22 = %c0_i32 to %13 step %c1_i32 iter_args(%arg23 = %49, %arg24 = %58) -> (tensor<64x64xf32>, tensor<64xf32>)  : i32 {
      %70 = arith.addi %14, %arg22 {MixUse} : i32
      %71 = arith.muli %70, %c8_i32 {MixUse} : i32
      %72 = arith.addi %71, %10 {MixUse} : i32
      %73 = arith.muli %72, %c64_i32 {MixUse} : i32
      %74 = arith.muli %72, %c4096_i32 : i32
      %75 = arith.index_cast %74 : i32 to index
      %76 = arith.addi %24, %75 : index
      %77 = arith.addi %76, %23 : index
      %reinterpret_cast_19 = memref.reinterpret_cast %arg9 to offset: [%77], sizes: [64, 64], strides: [64, 1] : memref<?xf16> to memref<64x64xf16, strided<[64, 1], offset: ?>>
      %78 = arith.index_cast %73 : i32 to index
      %79 = arith.addi %23, %78 : index
      %reinterpret_cast_20 = memref.reinterpret_cast %arg10 to offset: [%79], sizes: [64], strides: [1] : memref<?xf16> to memref<64xf16, strided<[1], offset: ?>>
      %80 = arith.truncf %arg23 {DataUse} : tensor<64x64xf32> to tensor<64x64xf16>
      %81 = arith.subi %77, %75 : index
      %82 = arith.divsi %81, %c64 : index
      %83 = arith.subi %c64, %82 : index
      %84 = arith.maxsi %83, %c0 : index
      %85 = arith.minsi %84, %c64 : index
      %86 = arith.remsi %81, %c64 : index
      %87 = arith.subi %c64, %86 : index
      %88 = arith.maxsi %87, %c0 : index
      %89 = arith.minsi %88, %c64 : index
      %90 = arith.minsi %38, %85 : index
      %91 = arith.subi %85, %90 : index
      %92 = arith.minsi %43, %89 : index
      %93 = arith.subi %89, %92 : index
      %extracted_slice_21 = tensor.extract_slice %80[%90, %92] [%91, %93] [1, 1] : tensor<64x64xf16> to tensor<?x?xf16>
      %subview_22 = memref.subview %reinterpret_cast_19[0, 0] [%91, %93] [1, 1] : memref<64x64xf16, strided<[64, 1], offset: ?>> to memref<?x?xf16, strided<[64, 1], offset: ?>>
      bufferization.materialize_in_destination %extracted_slice_21 in writable %subview_22 : (tensor<?x?xf16>, memref<?x?xf16, strided<[64, 1], offset: ?>>) -> ()
      %94 = arith.truncf %arg24 {DataUse} : tensor<64xf32> to tensor<64xf16>
      %extracted_slice_23 = tensor.extract_slice %94[%55] [%56] [1] : tensor<64xf16> to tensor<?xf16>
      %subview_24 = memref.subview %reinterpret_cast_20[0] [%56] [1] : memref<64xf16, strided<[1], offset: ?>> to memref<?xf16, strided<[1], offset: ?>>
      bufferization.materialize_in_destination %extracted_slice_23 in writable %subview_24 : (tensor<?xf16>, memref<?xf16, strided<[1], offset: ?>>) -> ()
      %95 = arith.muli %arg22, %c16_i32 {MixUse} : i32
      %96 = arith.maxsi %95, %c0_i32 : i32
      %97 = arith.index_cast %96 : i32 to index
      %98 = arith.muli %97, %c512 : index
      %99 = arith.addi %98, %66 : index
      %100 = arith.index_cast %arg15 : i32 to index
      %101 = arith.addi %99, %23 : index
      %reinterpret_cast_25 = memref.reinterpret_cast %arg3 to offset: [%101], sizes: [16, 64], strides: [512, 1] : memref<?xf16> to memref<16x64xf16, strided<[512, 1], offset: ?>>
      %reinterpret_cast_26 = memref.reinterpret_cast %arg4 to offset: [%101], sizes: [16, 64], strides: [512, 1] : memref<?xf16> to memref<16x64xf16, strided<[512, 1], offset: ?>>
      %102 = arith.cmpi eq, %arg22, %67 {Undefined} : i32
      %103 = scf.if %102 -> (i64) {
        %183 = arith.subi %arg15, %c1_i32 {MixUse} : i32
        %184 = arith.muli %183, %c8_i32 : i32
        %185 = arith.index_cast %63 : i32 to index
        %186 = arith.index_cast %10 : i32 to index
        %187 = arith.addi %185, %186 : index
        %188 = arith.index_cast %184 : i32 to index
        %189 = arith.addi %187, %188 : index
        %reinterpret_cast_47 = memref.reinterpret_cast %arg5 to offset: [%189], sizes: [1], strides: [1] : memref<?xf16> to memref<1xf16, strided<[1], offset: ?>>
        %intptr = memref.extract_aligned_pointer_as_index %reinterpret_cast_47 : memref<1xf16, strided<[1], offset: ?>> -> index
        %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %reinterpret_cast_47 : memref<1xf16, strided<[1], offset: ?>> -> memref<f16>, index, index, index
        %190 = arith.muli %offset, %c2 : index
        %191 = arith.addi %intptr, %190 : index
        %192 = arith.index_cast %191 : index to i64
        scf.yield %192 : i64
      } else {
        %183 = arith.addi %95, %c15_i32 {MixUse} : i32
        %184 = arith.muli %183, %c8_i32 : i32
        %185 = arith.index_cast %63 : i32 to index
        %186 = arith.index_cast %10 : i32 to index
        %187 = arith.addi %185, %186 : index
        %188 = arith.index_cast %184 : i32 to index
        %189 = arith.addi %187, %188 : index
        %reinterpret_cast_47 = memref.reinterpret_cast %arg5 to offset: [%189], sizes: [1], strides: [1] : memref<?xf16> to memref<1xf16, strided<[1], offset: ?>>
        %intptr = memref.extract_aligned_pointer_as_index %reinterpret_cast_47 : memref<1xf16, strided<[1], offset: ?>> -> index
        %base_buffer, %offset, %sizes, %strides = memref.extract_strided_metadata %reinterpret_cast_47 : memref<1xf16, strided<[1], offset: ?>> -> memref<f16>, index, index, index
        %190 = arith.muli %offset, %c2 : index
        %191 = arith.addi %intptr, %190 : index
        %192 = arith.index_cast %191 : index to i64
        scf.yield %192 : i64
      }
      %104 = hivm.hir.pointer_cast(%103) [%c1] : memref<?xf16>
      %105 = arith.addi %99, %21 : index
      %reinterpret_cast_27 = memref.reinterpret_cast %arg2 to offset: [%105], sizes: [16, 64], strides: [512, 1] : memref<?xf16> to memref<16x64xf16, strided<[512, 1], offset: ?>>
      %alloc_28 = memref.alloc() : memref<16x64xf16>
      %106 = arith.subi %105, %66 : index
      %107 = arith.divsi %106, %c512 : index
      %108 = arith.subi %100, %107 : index
      %109 = arith.maxsi %108, %c0 : index
      %110 = arith.minsi %109, %c16 : index
      %111 = arith.remsi %106, %c512 : index
      %112 = arith.subi %c64, %111 : index
      %113 = arith.maxsi %112, %c0 : index
      %114 = arith.minsi %113, %c64 : index
      %115 = arith.subi %c0_i32, %95 : i32
      %116 = arith.maxsi %115, %c0_i32 : i32
      %117 = arith.index_cast %116 : i32 to index
      %118 = arith.minsi %117, %110 : index
      %119 = arith.subi %110, %118 : index
      %120 = arith.minsi %38, %114 : index
      %121 = arith.subi %114, %120 : index
      %122 = arith.cmpi slt, %119, %c16 : index
      %123 = arith.cmpi slt, %121, %c64 : index
      %124 = arith.ori %122, %123 : i1
      scf.if %124 {
        linalg.fill ins(%cst : f16) outs(%alloc_28 : memref<16x64xf16>)
      } {hivm.unlikely_condition}
      %subview_29 = memref.subview %reinterpret_cast_27[0, 0] [%119, %121] [1, 1] : memref<16x64xf16, strided<[512, 1], offset: ?>> to memref<?x?xf16, strided<[512, 1], offset: ?>>
      %subview_30 = memref.subview %alloc_28[%118, %120] [%119, %121] [1, 1] : memref<16x64xf16> to memref<?x?xf16, strided<[64, 1], offset: ?>>
      memref.copy %subview_29, %subview_30 : memref<?x?xf16, strided<[512, 1], offset: ?>> to memref<?x?xf16, strided<[64, 1], offset: ?>>
      %125 = bufferization.to_tensor %alloc_28 restrict writable : memref<16x64xf16> to tensor<16x64xf16>
      %126 = tensor.empty() : tensor<64x16xf16>
      %transposed = linalg.transpose ins(%125 : tensor<16x64xf16>) outs(%126 : tensor<64x16xf16>) permutation = [1, 0] 
      %alloc_31 = memref.alloc() : memref<16x64xf16>
      %127 = arith.subi %101, %66 : index
      %128 = arith.divsi %127, %c512 : index
      %129 = arith.subi %100, %128 : index
      %130 = arith.maxsi %129, %c0 : index
      %131 = arith.minsi %130, %c16 : index
      %132 = arith.remsi %127, %c512 : index
      %133 = arith.subi %c64, %132 : index
      %134 = arith.maxsi %133, %c0 : index
      %135 = arith.minsi %134, %c64 : index
      %136 = arith.minsi %117, %131 : index
      %137 = arith.subi %131, %136 : index
      %138 = arith.minsi %43, %135 : index
      %139 = arith.subi %135, %138 : index
      %140 = arith.cmpi slt, %137, %c16 : index
      %141 = arith.cmpi slt, %139, %c64 : index
      %142 = arith.ori %140, %141 : i1
      scf.if %142 {
        linalg.fill ins(%cst : f16) outs(%alloc_31 : memref<16x64xf16>)
      } {hivm.unlikely_condition}
      %subview_32 = memref.subview %reinterpret_cast_25[0, 0] [%137, %139] [1, 1] : memref<16x64xf16, strided<[512, 1], offset: ?>> to memref<?x?xf16, strided<[512, 1], offset: ?>>
      %subview_33 = memref.subview %alloc_31[%136, %138] [%137, %139] [1, 1] : memref<16x64xf16> to memref<?x?xf16, strided<[64, 1], offset: ?>>
      memref.copy %subview_32, %subview_33 : memref<?x?xf16, strided<[512, 1], offset: ?>> to memref<?x?xf16, strided<[64, 1], offset: ?>>
      %143 = bufferization.to_tensor %alloc_31 restrict writable : memref<16x64xf16> to tensor<16x64xf16>
      %broadcasted_34 = linalg.broadcast ins(%arg24 : tensor<64xf32>) outs(%5 : tensor<16x64xf32>) dimensions = [0] 
      %144 = linalg.matmul {input_precision = "ieee"} ins(%125, %80 : tensor<16x64xf16>, tensor<64x64xf16>) outs(%broadcasted_34 : tensor<16x64xf32>) -> tensor<16x64xf32>
      %145 = tensor.empty() : tensor<16xf32>
      %146 = linalg.fill ins(%cst_0 : f32) outs(%145 : tensor<16xf32>) -> tensor<16xf32>
      %reduced = linalg.reduce ins(%144 : tensor<16x64xf32>) outs(%146 : tensor<16xf32>) dimensions = [1] 
        (%in: f32, %init: f32) {
          %183 = arith.addf %in, %init {Undefined} : f32
          linalg.yield %183 : f32
        }
      %expanded = tensor.expand_shape %reduced [[0, 1]] output_shape [16, 1] : tensor<16xf32> into tensor<16x1xf32>
      %147 = arith.divf %expanded, %1 {DataUse} : tensor<16x1xf32>
      %collapsed = tensor.collapse_shape %147 [[0, 1]] : tensor<16x1xf32> into tensor<16xf32>
      %broadcasted_35 = linalg.broadcast ins(%collapsed : tensor<16xf32>) outs(%5 : tensor<16x64xf32>) dimensions = [1] 
      %148 = arith.subf %144, %broadcasted_35 {DataUse} : tensor<16x64xf32>
      %149 = arith.mulf %148, %148 {DataUse} : tensor<16x64xf32>
      %reduced_36 = linalg.reduce ins(%149 : tensor<16x64xf32>) outs(%146 : tensor<16xf32>) dimensions = [1] 
        (%in: f32, %init: f32) {
          %183 = arith.addf %in, %init {Undefined} : f32
          linalg.yield %183 : f32
        }
      %expanded_37 = tensor.expand_shape %reduced_36 [[0, 1]] output_shape [16, 1] : tensor<16xf32> into tensor<16x1xf32>
      %150 = arith.divf %expanded_37, %1 {DataUse} : tensor<16x1xf32>
      %151 = arith.addf %150, %68 {DataUse} : tensor<16x1xf32>
      %152 = math.sqrt %151 {DataUse} : tensor<16x1xf32>
      %153 = arith.divf %2, %152 {DataUse} : tensor<16x1xf32>
      %collapsed_38 = tensor.collapse_shape %153 [[0, 1]] : tensor<16x1xf32> into tensor<16xf32>
      %broadcasted_39 = linalg.broadcast ins(%collapsed_38 : tensor<16xf32>) outs(%5 : tensor<16x64xf32>) dimensions = [1] 
      %154 = arith.mulf %148, %broadcasted_39 {DataUse} : tensor<16x64xf32>
      %155 = arith.truncf %154 {DataUse} : tensor<16x64xf32> to tensor<16x64xf16>
      %156 = arith.mulf %155, %broadcasted {DataUse} : tensor<16x64xf16>
      %157 = arith.addf %156, %broadcasted_13 {DataUse} : tensor<16x64xf16>
      %158 = arith.subf %157, %143 {DataUse} : tensor<16x64xf16>
      %159 = arith.addf %158, %125 {DataUse} : tensor<16x64xf16>
      %160 = arith.mulf %159, %broadcasted {DataUse} : tensor<16x64xf16>
      %161 = arith.mulf %160, %4 {DataUse} : tensor<16x64xf16>
      %162 = tensor.empty() : tensor<16xf16>
      %163 = linalg.fill ins(%cst : f16) outs(%162 : tensor<16xf16>) -> tensor<16xf16>
      %reduced_40 = linalg.reduce ins(%160 : tensor<16x64xf16>) outs(%163 : tensor<16xf16>) dimensions = [1] 
        (%in: f16, %init: f16) {
          %183 = arith.addf %in, %init {Undefined} : f16
          linalg.yield %183 : f16
        }
      %broadcasted_41 = linalg.broadcast ins(%reduced_40 : tensor<16xf16>) outs(%3 : tensor<16x64xf16>) dimensions = [1] 
      %164 = arith.subf %161, %broadcasted_41 {DataUse} : tensor<16x64xf16>
      %165 = arith.mulf %160, %155 {DataUse} : tensor<16x64xf16>
      %reduced_42 = linalg.reduce ins(%165 : tensor<16x64xf16>) outs(%163 : tensor<16xf16>) dimensions = [1] 
        (%in: f16, %init: f16) {
          %183 = arith.addf %in, %init {Undefined} : f16
          linalg.yield %183 : f16
        }
      %broadcasted_43 = linalg.broadcast ins(%reduced_42 : tensor<16xf16>) outs(%3 : tensor<16x64xf16>) dimensions = [1] 
      %166 = arith.mulf %155, %broadcasted_43 {DataUse} : tensor<16x64xf16>
      %167 = arith.subf %164, %166 {DataUse} : tensor<16x64xf16>
      %168 = arith.extf %167 {DataUse} : tensor<16x64xf16> to tensor<16x64xf32>
      %169 = arith.mulf %broadcasted_39, %168 {DataUse} : tensor<16x64xf32>
      %170 = arith.divf %169, %6 {DataUse} : tensor<16x64xf32>
      %171 = arith.truncf %170 {DataUse} : tensor<16x64xf32> to tensor<16x64xf16>
      %extracted_slice_44 = tensor.extract_slice %171[%136, %138] [%137, %139] [1, 1] : tensor<16x64xf16> to tensor<?x?xf16>
      %subview_45 = memref.subview %reinterpret_cast_26[0, 0] [%137, %139] [1, 1] : memref<16x64xf16, strided<[512, 1], offset: ?>> to memref<?x?xf16, strided<[512, 1], offset: ?>>
      bufferization.materialize_in_destination %extracted_slice_44 in writable %subview_45 : (tensor<?x?xf16>, memref<?x?xf16, strided<[512, 1], offset: ?>>) -> ()
      %172 = memref.load %104[%c0] : memref<?xf16>
      %173 = linalg.fill ins(%172 : f16) outs(%126 : tensor<64x16xf16>) -> tensor<64x16xf16>
      %174 = arith.mulf %173, %transposed {DataUse} : tensor<64x16xf16>
      %175 = linalg.matmul {input_precision = "ieee"} ins(%174, %171 : tensor<64x16xf16>, tensor<16x64xf16>) outs(%8 : tensor<64x64xf32>) -> tensor<64x64xf32>
      %176 = arith.subf %arg23, %175 {DataUse} : tensor<64x64xf32>
      %177 = linalg.fill ins(%172 : f16) outs(%3 : tensor<16x64xf16>) -> tensor<16x64xf16>
      %178 = arith.mulf %177, %171 {DataUse} : tensor<16x64xf16>
      %179 = tensor.empty() : tensor<64xf16>
      %180 = linalg.fill ins(%cst : f16) outs(%179 : tensor<64xf16>) -> tensor<64xf16>
      %reduced_46 = linalg.reduce ins(%178 : tensor<16x64xf16>) outs(%180 : tensor<64xf16>) dimensions = [0] 
        (%in: f16, %init: f16) {
          %183 = arith.addf %in, %init {Undefined} : f16
          linalg.yield %183 : f16
        }
      %181 = arith.extf %reduced_46 {DataUse} : tensor<64xf16> to tensor<64xf32>
      %182 = arith.subf %arg24, %181 {DataUse} : tensor<64xf32>
      scf.yield {Undefined} %176, %182 : tensor<64x64xf32>, tensor<64xf32>
    } {DataUse}
    %reinterpret_cast_14 = memref.reinterpret_cast %arg13 to offset: [%26], sizes: [64, 64], strides: [64, 1] : memref<?xf32> to memref<64x64xf32, strided<[64, 1], offset: ?>>
    %reinterpret_cast_15 = memref.reinterpret_cast %arg14 to offset: [%51], sizes: [64], strides: [1] : memref<?xf32> to memref<64xf32, strided<[1], offset: ?>>
    %extracted_slice = tensor.extract_slice %69#0[%39, %44] [%40, %45] [1, 1] : tensor<64x64xf32> to tensor<?x?xf32>
    %subview_16 = memref.subview %reinterpret_cast_14[0, 0] [%40, %45] [1, 1] : memref<64x64xf32, strided<[64, 1], offset: ?>> to memref<?x?xf32, strided<[64, 1], offset: ?>>
    bufferization.materialize_in_destination %extracted_slice in writable %subview_16 : (tensor<?x?xf32>, memref<?x?xf32, strided<[64, 1], offset: ?>>) -> ()
    %extracted_slice_17 = tensor.extract_slice %69#1[%55] [%56] [1] : tensor<64xf32> to tensor<?xf32>
    %subview_18 = memref.subview %reinterpret_cast_15[0] [%56] [1] : memref<64xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %extracted_slice_17 in writable %subview_18 : (tensor<?xf32>, memref<?xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}