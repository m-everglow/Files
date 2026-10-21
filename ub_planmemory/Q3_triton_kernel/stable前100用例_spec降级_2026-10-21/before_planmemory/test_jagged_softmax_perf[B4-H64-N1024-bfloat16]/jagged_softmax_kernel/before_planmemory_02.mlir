#map = affine_map<(d0) -> (0, d0)>
#map1 = affine_map<(d0) -> (d0, 0)>
#map2 = affine_map<()[s0] -> (s0 + 1)>
#map3 = affine_map<()[s0, s1, s2] -> ((s1 + s2) * s0)>
#map4 = affine_map<()[s0] -> (s0 + 256)>
#map5 = affine_map<()[s0, s1] -> (s0 - s1)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<AIV>, ssbuffer.insertionOptimization} {
  func.func @jagged_softmax_kernel_fused_0_outlined_vf_0(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0xFF800000> : vector<64xf32>
    %cst_0 = arith.constant dense<0> : vector<64xi32>
    %cst_1 = arith.constant dense<1> : vector<64xi32>
    %cst_2 = arith.constant dense<-2139095040> : vector<64xi32>
    %cst_3 = arith.constant dense<2147483647> : vector<64xi32>
    %cst_4 = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %cst_4 {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %1 = vector.transfer_read %arg1[%c0], %cst_4 {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = arith.bitcast %1 : vector<64xf32> to vector<64xi32>
    %3 = arith.andi %2, %cst_3 : vector<64xi32>
    %4 = arith.addi %3, %cst_2 : vector<64xi32>
    %5 = arith.minsi %4, %cst_1 : vector<64xi32>
    %6 = arith.maxsi %5, %cst_0 : vector<64xi32>
    %7 = arith.cmpi ne, %6, %cst_0 : vector<64xi32>
    %8 = arith.select %7, %cst, %1 : vector<64xi1>, vector<64xf32>
    %9 = arith.bitcast %0 : vector<64xf32> to vector<64xi32>
    %10 = arith.andi %9, %cst_3 : vector<64xi32>
    %11 = arith.addi %10, %cst_2 : vector<64xi32>
    %12 = arith.minsi %11, %cst_1 : vector<64xi32>
    %13 = arith.maxsi %12, %cst_0 : vector<64xi32>
    %14 = arith.cmpi ne, %13, %cst_0 : vector<64xi32>
    %15 = arith.select %14, %cst, %0 : vector<64xi1>, vector<64xf32>
    %16 = arith.maximumf %15, %8 : vector<64xf32>
    vector.transfer_write %16, %arg2[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @jagged_softmax_kernel_fused_0_outlined_vf_1(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>, %arg3: memref<256xi32, #hivm.address_space<ub>>, %arg4: memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>>, %arg5: memref<256x64xf32, #hivm.address_space<ub>>, %arg6: i32, %arg7: i64, %arg8: memref<64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant dense<-1.000000e+00> : vector<1x64xf16>
    %cst_1 = arith.constant dense<0.000000e+00> : vector<1x64xf16>
    %c0_i32 = arith.constant 0 : i32
    %cst_2 = arith.constant dense<0.000000e+00> : vector<64xf32>
    %false = arith.constant false
    %cst_3 = arith.constant dense<0xFF800000> : vector<64xf32>
    %cst_4 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %cst_4 {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %1 = arith.cmpf oeq, %0, %cst_3 : vector<64xf32>
    %2 = vector.transfer_read %arg1[%c0], %cst_4 {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %3 = arith.subf %2, %0 : vector<64xf32>
    %4 = math.exp %3 : vector<64xf32>
    %5 = arith.select %1, %cst_2, %4 : vector<64xi1>, vector<64xf32>
    vector.transfer_write %5, %arg2[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    %6 = vector.broadcast %1 : vector<64xi1> to vector<1x64xi1>
    %7 = vector.transfer_read %arg0[%c0], %cst_4 {in_bounds = [true, true], permutation_map = #map} : memref<64xf32, #hivm.address_space<ub>>, vector<1x64xf32>
    %8 = arith.select %6, %cst_1, %cst_0 : vector<1x64xi1>, vector<1x64xf16>
    %9 = arith.cmpf une, %8, %cst_1 : vector<1x64xf16>
    %10 = vector.broadcast %arg6 : i32 to vector<1x64xi32>
    %11 = vector.broadcast %arg7 : i64 to vector<1x64xi64>
    %12 = scf.for %arg9 = %c0 to %c256 step %c1 iter_args(%arg10 = %cst_2) -> (vector<64xf32>) {
      %subview = memref.subview %arg3[%arg9] [1] [1] : memref<256xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_5 = memref.subview %arg4[%arg9, 0] [1, 64] [1, 1] : memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x64xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_6 = memref.subview %arg5[%arg9, 0] [1, 64] [1, 1] : memref<256x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %13 = vector.transfer_read %subview[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map1} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %14 = vector.transfer_read %subview_5[%c0, %c0], %false {in_bounds = [true, true]} : memref<1x64xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi1>
      %15 = vector.transfer_read %subview_6[%c0, %c0], %cst_4 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %16 = arith.subf %15, %7 : vector<1x64xf32>
      %17 = math.exp %16 : vector<1x64xf32>
      %18 = arith.addi %10, %13 : vector<1x64xi32>
      %19 = arith.extsi %18 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xi32> to vector<1x64xi64>
      %20 = arith.cmpi slt, %19, %11 : vector<1x64xi64>
      %21 = arith.select %20, %cst_0, %cst_1 : vector<1x64xi1>, vector<1x64xf16>
      %22 = arith.cmpf une, %21, %cst_1 : vector<1x64xf16>
      %23 = arith.andi %22, %14 : vector<1x64xi1>
      %24 = arith.andi %23, %9 : vector<1x64xi1>
      %25 = arith.select %24, %17, %cst : vector<1x64xi1>, vector<1x64xf32>
      %26 = vector.shape_cast %25 : vector<1x64xf32> to vector<64xf32>
      %27 = arith.addf %arg10, %26 : vector<64xf32>
      scf.yield %27 : vector<64xf32>
    }
    vector.transfer_write %12, %arg8[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @jagged_softmax_kernel_fused_2_outlined_vf_0(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>, %arg3: memref<64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %cst {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %1 = vector.transfer_read %arg1[%c0], %cst {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %2 = vector.transfer_read %arg2[%c0], %cst {in_bounds = [true]} : memref<64xf32, #hivm.address_space<ub>>, vector<64xf32>
    %3 = arith.mulf %0, %1 : vector<64xf32>
    %4 = arith.addf %3, %2 : vector<64xf32>
    vector.transfer_write %4, %arg3[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_0(%arg0: memref<256x64xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0xFF80> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 64] : vector<1x128xi1>
    scf.for %arg1 = %c0 to %c256 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_1(%arg0: memref<256x64xbf16, #hivm.address_space<ub>>, %arg1: memref<256x64xf32, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0xFF800000> : vector<64xf32>
    %cst_0 = arith.constant dense<0xFF800000> : vector<1x64xf32>
    %cst_1 = arith.constant dense<0> : vector<1x64xi32>
    %cst_2 = arith.constant dense<1> : vector<1x64xi32>
    %cst_3 = arith.constant dense<-2139095040> : vector<1x64xi32>
    %cst_4 = arith.constant dense<2147483647> : vector<1x64xi32>
    %cst_5 = arith.constant 0.000000e+00 : f32
    %cst_6 = arith.constant 0.000000e+00 : bf16
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c256 step %c1 {
      %subview = memref.subview %arg0[%arg3, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_7 = memref.subview %arg1[%arg3, 0] [1, 64] [1, 1] : memref<256x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0, %c0], %cst_6 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
      %2 = arith.extf %1 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
      vector.transfer_write %2, %subview_7[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    %0 = scf.for %arg3 = %c0 to %c256 step %c1 iter_args(%arg4 = %cst) -> (vector<64xf32>) {
      %subview = memref.subview %arg1[%arg3, 0] [1, 64] [1, 1] : memref<256x64xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview[%c0, %c0], %cst_5 {in_bounds = [true, true]} : memref<1x64xf32, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.bitcast %1 : vector<1x64xf32> to vector<1x64xi32>
      %3 = arith.andi %2, %cst_4 : vector<1x64xi32>
      %4 = arith.addi %3, %cst_3 : vector<1x64xi32>
      %5 = arith.minsi %4, %cst_2 : vector<1x64xi32>
      %6 = arith.maxsi %5, %cst_1 : vector<1x64xi32>
      %7 = arith.cmpi ne, %6, %cst_1 : vector<1x64xi32>
      %8 = arith.select %7, %cst_0, %1 : vector<1x64xi1>, vector<1x64xf32>
      %9 = vector.shape_cast %8 : vector<1x64xf32> to vector<64xf32>
      %10 = arith.maximumf %arg4, %9 : vector<64xf32>
      scf.yield %10 : vector<64xf32>
    }
    vector.transfer_write %0, %arg2[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_2(%arg0: memref<256x64xbf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0xFF80> : vector<1x128xbf16>
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 64] : vector<1x128xi1>
    scf.for %arg1 = %c0 to %c256 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0, %c0], %0 {in_bounds = [true, true]} : vector<1x128xbf16>, memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_3(%arg0: memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>>, %arg1: memref<256x64xbf16, #hivm.address_space<ub>>, %arg2: memref<64xf32, #hivm.address_space<ub>>, %arg3: memref<64xf32, #hivm.address_space<ub>>, %arg4: memref<256x64xbf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 0.000000e+00 : bf16
    %false = arith.constant false
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg2[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<64xf32, #hivm.address_space<ub>>, vector<1x64xf32>
    %1 = vector.transfer_read %arg3[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<64xf32, #hivm.address_space<ub>>, vector<1x64xf32>
    scf.for %arg5 = %c0 to %c256 step %c1 {
      %subview = memref.subview %arg0[%arg5, 0] [1, 64] [1, 1] : memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x64xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg1[%arg5, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %subview_3 = memref.subview %arg4[%arg5, 0] [1, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview[%c0, %c0], %false {in_bounds = [true, true]} : memref<1x64xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi1>
      %3 = vector.transfer_read %subview_2[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xbf16>
      %4 = arith.extf %3 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xbf16> to vector<1x64xf32>
      %5 = arith.subf %4, %0 : vector<1x64xf32>
      %6 = math.exp %5 : vector<1x64xf32>
      %7 = arith.divf %6, %1 : vector<1x64xf32>
      %8 = arith.select %2, %7, %cst : vector<1x64xi1>, vector<1x64xf32>
      %9 = arith.truncf %8 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xbf16>
      vector.transfer_write %9, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xbf16>, memref<1x64xbf16, strided<[64, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_4(%arg0: memref<256xi32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63]> : vector<64xindex>
    %c64 = arith.constant 64 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c256 step %c64 {
      %subview = memref.subview %arg0[%arg1] [64] [1] : memref<256xi32, #hivm.address_space<ub>> to memref<64xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.broadcast %arg1 : index to vector<64xindex>
      %1 = arith.addi %0, %cst : vector<64xindex>
      %2 = arith.index_cast %1 : vector<64xindex> to vector<64xi32>
      vector.transfer_write %2, %subview[%c0] {in_bounds = [true]} : vector<64xi32>, memref<64xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_5(%arg0: memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0> : vector<64xindex>
    %cst_0 = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63]> : vector<64xindex>
    %cst_1 = arith.constant dense<0.000000e+00> : vector<64xf16>
    %cst_2 = arith.constant dense<-1.000000e+00> : vector<64xf16>
    %cst_3 = arith.constant dense<64> : vector<64xi32>
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = arith.addi %cst, %cst_0 : vector<64xindex>
    %1 = arith.index_cast %0 : vector<64xindex> to vector<64xi32>
    %2 = arith.cmpi slt, %1, %cst_3 : vector<64xi32>
    %3 = arith.select %2, %cst_2, %cst_1 : vector<64xi1>, vector<64xf16>
    %4 = arith.cmpf une, %3, %cst_1 : vector<64xf16>
    %5 = vector.broadcast %4 : vector<64xi1> to vector<1x64xi1>
    scf.for %arg1 = %c0 to %c256 step %c1 {
      %subview = memref.subview %arg0[%arg1, 0] [1, 64] [1, 1] : memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x64xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %5, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xi1>, memref<1x64xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_6(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf16>
    %cst_0 = arith.constant dense<-1.000000e+00> : vector<1x64xf16>
    %cst_1 = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_2 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%c0], %cst_2 {in_bounds = [true, true], permutation_map = #map} : memref<64xf32, #hivm.address_space<ub>>, vector<1x64xf32>
    %1 = arith.cmpf ogt, %0, %cst_1 : vector<1x64xf32>
    %2 = arith.select %1, %cst_0, %cst : vector<1x64xi1>, vector<1x64xf16>
    %3 = arith.cmpf une, %2, %cst : vector<1x64xf16>
    scf.for %arg2 = %c0 to %c256 step %c1 {
      %subview = memref.subview %arg1[%arg2, 0] [1, 64] [1, 1] : memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>> to memref<1x64xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %3, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xi1>, memref<1x64xi1, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_7(%arg0: memref<64xf32, #hivm.address_space<ub>>, %arg1: memref<64xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %cst_0 = arith.constant dense<0xFF800000> : vector<64xf32>
    %c0 = arith.constant 0 : index
    vector.transfer_write %cst_0, %arg0[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    vector.transfer_write %cst, %arg1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, #hivm.address_space<ub>>
    return
  }
  func.func @jagged_softmax_kernel(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xbf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg4: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, false, false, false, false, false]> : vector<10xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "aiv", parallel_mode = "simd"} {
    %c0_i64 = arith.constant 0 : i64
    %c1024_i64 = arith.constant 1024 : i64
    %c0_i32 = arith.constant 0 : i32
    %c1024_i32 = arith.constant 1024 : i32
    %c256_i32 = arith.constant 256 : i32
    %c0 = arith.constant 0 : index
    %c256 = arith.constant 256 : index
    %cst = arith.constant 0xFF80 : bf16
    %c56_i32 = arith.constant 56 : i32
    %0 = arith.muli %arg7, %arg8 : i32
    %1 = arith.muli %0, %arg9 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    scf.for %arg10 = %3 to %1 step %c56_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %4 = arith.remsi %arg10, %arg7 : i32
      %alloc = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
      %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
      func.call @jagged_softmax_kernel_outlined_vf_7(%alloc, %alloc_0) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
      %5 = arith.index_cast %4 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg4 to offset: [%5], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %6 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %7 = affine.apply #map2()[%5]
      %reinterpret_cast_1 = memref.reinterpret_cast %arg4 to offset: [%7], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %8 = memref.load %reinterpret_cast_1[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %9 = arith.subi %8, %6 : i64
      %10 = arith.minsi %9, %c1024_i64 : i64
      %11 = arith.cmpi eq, %10, %c0_i64 : i64
      scf.if %11 {
      } else {
        %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<256xi32, #hivm.address_space<ub>>
        func.call @jagged_softmax_kernel_outlined_vf_4(%alloc_2) {hivm.vector_function, no_inline} : (memref<256xi32, #hivm.address_space<ub>>) -> ()
        %alloc_3 = memref.alloc() : memref<256x256x1xi1, #hivm.address_space<ub>>
        %subview = memref.subview %alloc_3[0, 0, 0] [256, 64, 1] [1, 1, 1] : memref<256x256x1xi1, #hivm.address_space<ub>> to memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>>
        func.call @jagged_softmax_kernel_outlined_vf_5(%subview) {hivm.vector_function, no_inline} : (memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>>) -> ()
        %12 = arith.index_cast %6 : i64 to index
        %13 = arith.index_cast %arg5 : i32 to index
        %14 = arith.index_cast %10 : i64 to index
        %15:2 = scf.for %arg11 = %c0_i32 to %c1024_i32 step %c256_i32 iter_args(%arg12 = %alloc, %arg13 = %alloc_0) -> (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>)  : i32 {
          %17 = arith.index_cast %arg11 : i32 to index
          %18 = affine.apply #map3()[%13, %12, %17]
          %reinterpret_cast_6 = memref.reinterpret_cast %arg2 to offset: [%18], sizes: [256, 64], strides: [%13, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_7 = memref.alloc() : memref<256x64xbf16, #hivm.address_space<ub>>
          annotation.mark %alloc_7 {hivm.multi_buffer = 2 : i32} : memref<256x64xbf16, #hivm.address_space<ub>>
          %19 = affine.apply #map4()[%17]
          %20 = arith.maxsi %17, %14 : index
          %21 = arith.minsi %19, %20 : index
          %22 = affine.apply #map5()[%21, %17]
          %23 = arith.minsi %22, %c256 : index
          %24 = arith.maxsi %23, %c0 : index
          %25 = arith.cmpi slt, %24, %c256 : index
          scf.if %25 {
            func.call @jagged_softmax_kernel_outlined_vf_0(%alloc_7) {hivm.vector_function, no_inline} : (memref<256x64xbf16, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          %subview_8 = memref.subview %reinterpret_cast_6[0, 0] [%24, 64] [1, 1] : memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %subview_9 = memref.subview %alloc_7[0, 0] [%24, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>
          hivm.hir.load ins(%subview_8 : memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_9 : memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : bf16 eviction_policy = <EvictFirst> core_type = <VECTOR>
          %alloc_10 = memref.alloc() {alignment = 64 : i64} : memref<256x64xf32, #hivm.address_space<ub>>
          %alloc_11 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
          func.call @jagged_softmax_kernel_outlined_vf_1(%alloc_7, %alloc_10, %alloc_11) {hivm.vector_function, no_inline} : (memref<256x64xbf16, #hivm.address_space<ub>>, memref<256x64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
          %alloc_12 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
          func.call @jagged_softmax_kernel_fused_0_outlined_vf_0(%arg12, %alloc_11, %alloc_12) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
          %alloc_13 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
          %alloc_14 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
          func.call @jagged_softmax_kernel_fused_0_outlined_vf_1(%alloc_12, %arg12, %alloc_13, %alloc_2, %subview, %alloc_10, %arg11, %10, %alloc_14) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<256xi32, #hivm.address_space<ub>>, memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<256x64xf32, #hivm.address_space<ub>>, i32, i64, memref<64xf32, #hivm.address_space<ub>>) -> ()
          %alloc_15 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
          func.call @jagged_softmax_kernel_fused_2_outlined_vf_0(%arg13, %alloc_13, %alloc_14, %alloc_15) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>) -> ()
          %alloc_16 = memref.alloc() {alignment = 64 : i64} : memref<64xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%alloc_12 : memref<64xf32, #hivm.address_space<ub>>) outs(%alloc_16 : memref<64xf32, #hivm.address_space<ub>>)
          scf.yield %alloc_16, %alloc_15 : memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>
        }
        %alloc_4 = memref.alloc() : memref<256x256x1xi1, #hivm.address_space<ub>>
        %subview_5 = memref.subview %alloc_4[0, 0, 0] [256, 64, 1] [1, 1, 1] : memref<256x256x1xi1, #hivm.address_space<ub>> to memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>>
        func.call @jagged_softmax_kernel_outlined_vf_6(%15#1, %subview_5) {hivm.vector_function, no_inline} : (memref<64xf32, #hivm.address_space<ub>>, memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>>) -> ()
        %16 = arith.index_cast %arg6 : i32 to index
        scf.for %arg11 = %c0_i32 to %c1024_i32 step %c256_i32  : i32 {
          %17 = arith.index_cast %arg11 : i32 to index
          %18 = affine.apply #map3()[%13, %12, %17]
          %reinterpret_cast_6 = memref.reinterpret_cast %arg2 to offset: [%18], sizes: [256, 64], strides: [%13, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_7 = memref.alloc() : memref<256x64xbf16, #hivm.address_space<ub>>
          annotation.mark %alloc_7 {hivm.multi_buffer = 2 : i32} : memref<256x64xbf16, #hivm.address_space<ub>>
          %19 = affine.apply #map4()[%17]
          %20 = arith.maxsi %17, %14 : index
          %21 = arith.minsi %19, %20 : index
          %22 = affine.apply #map5()[%21, %17]
          %23 = arith.minsi %22, %c256 : index
          %24 = arith.maxsi %23, %c0 : index
          %25 = arith.cmpi slt, %24, %c256 : index
          scf.if %25 {
            func.call @jagged_softmax_kernel_outlined_vf_2(%alloc_7) {hivm.vector_function, no_inline} : (memref<256x64xbf16, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          %subview_8 = memref.subview %reinterpret_cast_6[0, 0] [%24, 64] [1, 1] : memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %subview_9 = memref.subview %alloc_7[0, 0] [%24, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>
          hivm.hir.load ins(%subview_8 : memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_9 : memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : bf16 eviction_policy = <EvictFirst> core_type = <VECTOR>
          %26 = affine.apply #map3()[%16, %12, %17]
          %reinterpret_cast_10 = memref.reinterpret_cast %arg3 to offset: [%26], sizes: [256, 64], strides: [%16, 1] : memref<?xbf16, #hivm.address_space<gm>> to memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_11 = memref.alloc() {alignment = 64 : i64} : memref<256x64xbf16, #hivm.address_space<ub>>
          annotation.mark %alloc_11 {hivm.multi_buffer = 2 : i32} : memref<256x64xbf16, #hivm.address_space<ub>>
          func.call @jagged_softmax_kernel_outlined_vf_3(%subview_5, %alloc_7, %15#0, %15#1, %alloc_11) {hivm.vector_function, no_inline} : (memref<256x64xi1, strided<[256, 1]>, #hivm.address_space<ub>>, memref<256x64xbf16, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<64xf32, #hivm.address_space<ub>>, memref<256x64xbf16, #hivm.address_space<ub>>) -> ()
          %subview_12 = memref.subview %alloc_11[0, 0] [%24, 64] [1, 1] : memref<256x64xbf16, #hivm.address_space<ub>> to memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>
          %subview_13 = memref.subview %reinterpret_cast_10[0, 0] [%24, 64] [1, 1] : memref<256x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          hivm.hir.store ins(%subview_12 : memref<?x64xbf16, strided<[64, 1]>, #hivm.address_space<ub>>) outs(%subview_13 : memref<?x64xbf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>)
        }
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}
