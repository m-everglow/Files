#map = affine_map<()[s0] -> (s0 + 4)>
#map1 = affine_map<()[s0] -> (s0 + 8)>
#map2 = affine_map<()[s0] -> (s0 + 12)>
#map3 = affine_map<()[s0] -> (s0 + 16)>
#map4 = affine_map<()[s0] -> (s0 + 20)>
#map5 = affine_map<()[s0] -> (s0 + 24)>
#map6 = affine_map<()[s0] -> (s0 + 28)>
#map7 = affine_map<()[s0] -> (s0 + 32)>
#map8 = affine_map<()[s0] -> (s0 + 36)>
#map9 = affine_map<()[s0] -> (s0 + 40)>
#map10 = affine_map<()[s0] -> (s0 + 44)>
#map11 = affine_map<()[s0] -> (s0 + 48)>
#map12 = affine_map<()[s0] -> (s0 + 52)>
#map13 = affine_map<()[s0] -> (s0 + 56)>
#map14 = affine_map<()[s0] -> (s0 + 60)>
#map15 = affine_map<(d0) -> (d0, 0)>
#map16 = affine_map<(d0) -> (0, d0)>
#map17 = affine_map<()[s0] -> (s0 + 1)>
#map18 = affine_map<()[s0, s1, s2] -> ((s1 + s2) * s0)>
#map19 = affine_map<()[s0] -> (s0 + 64)>
#map20 = affine_map<()[s0, s1] -> (s0 - s1)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<AIV>, ssbuffer.insertionOptimization} {
  func.func @jagged_softmax_kernel_fused_1_outlined_vf_0(%arg0: memref<512xf32, #hivm.address_space<ub>>, %arg1: memref<512xf32, #hivm.address_space<ub>>, %arg2: memref<512xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0xFF800000> : vector<64xf32>
    %cst_0 = arith.constant dense<0> : vector<64xi32>
    %cst_1 = arith.constant dense<1> : vector<64xi32>
    %cst_2 = arith.constant dense<-2139095040> : vector<64xi32>
    %cst_3 = arith.constant dense<2147483647> : vector<64xi32>
    %cst_4 = arith.constant 0.000000e+00 : f32
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c512 step %c64 {
      %subview = memref.subview %arg0[%arg3] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_5 = memref.subview %arg1[%arg3] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_6 = memref.subview %arg2[%arg3] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst_4 {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %1 = vector.transfer_read %subview_5[%c0], %cst_4 {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
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
      vector.transfer_write %16, %subview_6[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_kernel_fused_3_outlined_vf_0(%arg0: memref<512xf32, #hivm.address_space<ub>>, %arg1: memref<512xf32, #hivm.address_space<ub>>, %arg2: memref<512xf32, #hivm.address_space<ub>>, %arg3: memref<512xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c512 step %c64 {
      %subview = memref.subview %arg0[%arg4] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg4] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg4] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_2 = memref.subview %arg3[%arg4] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %1 = vector.transfer_read %subview_0[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %2 = vector.transfer_read %subview_1[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %3 = arith.mulf %0, %1 : vector<64xf32>
      %4 = arith.addf %3, %2 : vector<64xf32>
      vector.transfer_write %4, %subview_2[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_kernel_fused_4_outlined_vf_0(%arg0: memref<64x512xf32, #hivm.address_space<ub>>, %arg1: memref<512xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c4 = arith.constant 4 : index
    scf.for %arg2 = %c0 to %c512 step %c64 {
      scf.for %arg3 = %c0 to %c4 step %c1 {
        %subview = memref.subview %arg0[%arg3, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = affine.apply #map()[%arg3]
        %subview_0 = memref.subview %arg0[%1, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = affine.apply #map1()[%arg3]
        %subview_1 = memref.subview %arg0[%3, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = affine.apply #map2()[%arg3]
        %subview_2 = memref.subview %arg0[%5, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %6 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = affine.apply #map3()[%arg3]
        %subview_3 = memref.subview %arg0[%7, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %8 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %9 = affine.apply #map4()[%arg3]
        %subview_4 = memref.subview %arg0[%9, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = affine.apply #map5()[%arg3]
        %subview_5 = memref.subview %arg0[%11, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %12 = vector.transfer_read %subview_5[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %13 = affine.apply #map6()[%arg3]
        %subview_6 = memref.subview %arg0[%13, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %14 = vector.transfer_read %subview_6[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %15 = affine.apply #map7()[%arg3]
        %subview_7 = memref.subview %arg0[%15, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %16 = vector.transfer_read %subview_7[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %17 = affine.apply #map8()[%arg3]
        %subview_8 = memref.subview %arg0[%17, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %18 = vector.transfer_read %subview_8[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %19 = affine.apply #map9()[%arg3]
        %subview_9 = memref.subview %arg0[%19, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %20 = vector.transfer_read %subview_9[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %21 = affine.apply #map10()[%arg3]
        %subview_10 = memref.subview %arg0[%21, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %22 = vector.transfer_read %subview_10[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %23 = affine.apply #map11()[%arg3]
        %subview_11 = memref.subview %arg0[%23, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %24 = vector.transfer_read %subview_11[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %25 = affine.apply #map12()[%arg3]
        %subview_12 = memref.subview %arg0[%25, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %26 = vector.transfer_read %subview_12[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %27 = affine.apply #map13()[%arg3]
        %subview_13 = memref.subview %arg0[%27, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %28 = vector.transfer_read %subview_13[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %29 = affine.apply #map14()[%arg3]
        %subview_14 = memref.subview %arg0[%29, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %30 = vector.transfer_read %subview_14[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %31 = arith.addf %0, %16 : vector<1x64xf32>
        %32 = arith.addf %2, %18 : vector<1x64xf32>
        %33 = arith.addf %4, %20 : vector<1x64xf32>
        %34 = arith.addf %6, %22 : vector<1x64xf32>
        %35 = arith.addf %8, %24 : vector<1x64xf32>
        %36 = arith.addf %10, %26 : vector<1x64xf32>
        %37 = arith.addf %12, %28 : vector<1x64xf32>
        %38 = arith.addf %14, %30 : vector<1x64xf32>
        %39 = arith.addf %31, %35 : vector<1x64xf32>
        %40 = arith.addf %32, %36 : vector<1x64xf32>
        %41 = arith.addf %33, %37 : vector<1x64xf32>
        %42 = arith.addf %34, %38 : vector<1x64xf32>
        %43 = arith.addf %39, %41 : vector<1x64xf32>
        %44 = arith.addf %40, %42 : vector<1x64xf32>
        %45 = arith.addf %43, %44 : vector<1x64xf32>
        vector.transfer_write %45, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg2 = %c0 to %c512 step %c64 {
      %subview = memref.subview %arg0[0, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_0 = memref.subview %arg0[1, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_1 = memref.subview %arg0[2, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_2 = memref.subview %arg0[3, %arg2] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      %3 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %4 = arith.addf %0, %2 : vector<1x64xf32>
      %5 = arith.addf %1, %3 : vector<1x64xf32>
      %6 = arith.addf %4, %5 : vector<1x64xf32>
      %7 = vector.shape_cast %6 : vector<1x64xf32> to vector<64xf32>
      %subview_3 = memref.subview %arg1[%arg2] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %8 = vector.transfer_read %subview_3[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %9 = arith.addf %7, %8 : vector<64xf32>
      vector.transfer_write %9, %subview_3[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_0(%arg0: memref<64x512xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0xFC00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c64 step %c1 {
      scf.for %arg2 = %c0 to %c512 step %c128 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 128] [1, 1] : memref<64x512xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_1(%arg0: memref<64x512xf16, #hivm.address_space<ub>>, %arg1: memref<64x512xf32, #hivm.address_space<ub>>, %arg2: memref<512xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0xFF800000> : vector<1x64xf32>
    %cst_0 = arith.constant dense<0> : vector<1x64xi32>
    %cst_1 = arith.constant dense<1> : vector<1x64xi32>
    %cst_2 = arith.constant dense<-2139095040> : vector<1x64xi32>
    %cst_3 = arith.constant dense<2147483647> : vector<1x64xi32>
    %cst_4 = arith.constant 0.000000e+00 : f32
    %cst_5 = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c64 step %c1 {
      scf.for %arg4 = %c0 to %c512 step %c64 {
        %subview = memref.subview %arg0[%arg3, %arg4] [1, 64] [1, 1] : memref<64x512xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_6 = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_5 {in_bounds = [true, true]} : memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
        %1 = arith.extf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf16> to vector<1x64xf32>
        vector.transfer_write %1, %subview_6[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg3 = %c0 to %c64 step %c1 {
      scf.for %arg4 = %c0 to %c512 step %c64 {
        %subview = memref.subview %arg1[%arg3, %arg4] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_6 = memref.subview %arg2[%arg4] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_4 {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_6[%c0], %cst_4 {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
        %2 = arith.bitcast %0 : vector<1x64xf32> to vector<1x64xi32>
        %3 = arith.andi %2, %cst_3 : vector<1x64xi32>
        %4 = arith.addi %3, %cst_2 : vector<1x64xi32>
        %5 = arith.minsi %4, %cst_1 : vector<1x64xi32>
        %6 = arith.maxsi %5, %cst_0 : vector<1x64xi32>
        %7 = arith.cmpi ne, %6, %cst_0 : vector<1x64xi32>
        %8 = arith.select %7, %cst, %0 : vector<1x64xi1>, vector<1x64xf32>
        %9 = vector.shape_cast %8 : vector<1x64xf32> to vector<64xf32>
        %10 = arith.maximumf %1, %9 : vector<64xf32>
        vector.transfer_write %10, %subview_6[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_2(%arg0: memref<512xf32, #hivm.address_space<ub>>, %arg1: memref<512xi1, #hivm.address_space<ub>>, %arg2: memref<512xf32, #hivm.address_space<ub>>, %arg3: memref<512xf32, #hivm.address_space<ub>>, %arg4: memref<64xi32, #hivm.address_space<ub>>, %arg5: memref<64x512xi1, #hivm.address_space<ub>>, %arg6: memref<64x512xf32, #hivm.address_space<ub>>, %arg7: i32, %arg8: i64, %arg9: memref<64x512xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant dense<-1.000000e+00> : vector<1x64xf16>
    %cst_1 = arith.constant dense<0.000000e+00> : vector<1x64xf16>
    %c0_i32 = arith.constant 0 : i32
    %cst_2 = arith.constant dense<0.000000e+00> : vector<64xf32>
    %false = arith.constant false
    %cst_3 = arith.constant dense<0xFF800000> : vector<64xf32>
    %cst_4 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg10 = %c0 to %c512 step %c64 {
      %subview = memref.subview %arg0[%arg10] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_5 = memref.subview %arg1[%arg10] [64] [1] : memref<512xi1, #hivm.address_space<ub>> to memref<64xi1, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview[%c0], %cst_4 {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %3 = arith.cmpf oeq, %2, %cst_3 : vector<64xf32>
      vector.transfer_write %3, %subview_5[%c0] {in_bounds = [true]} : vector<64xi1>, memref<64xi1, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    scf.for %arg10 = %c0 to %c512 step %c64 {
      %subview = memref.subview %arg1[%arg10] [64] [1] : memref<512xi1, #hivm.address_space<ub>> to memref<64xi1, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_5 = memref.subview %arg2[%arg10] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_6 = memref.subview %arg0[%arg10] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_7 = memref.subview %arg3[%arg10] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview[%c0], %false {in_bounds = [true]} : memref<64xi1, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xi1>
      %3 = vector.transfer_read %subview_5[%c0], %cst_4 {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %4 = vector.transfer_read %subview_6[%c0], %cst_4 {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %5 = arith.subf %3, %4 : vector<64xf32>
      %6 = math.exp %5 : vector<64xf32>
      %7 = arith.select %2, %cst_2, %6 : vector<64xi1>, vector<64xf32>
      vector.transfer_write %7, %subview_7[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    %0 = vector.broadcast %arg7 : i32 to vector<1x64xi32>
    %1 = vector.broadcast %arg8 : i64 to vector<1x64xi64>
    scf.for %arg10 = %c0 to %c64 step %c1 {
      %subview = memref.subview %arg4[%arg10] [1] [1] : memref<64xi32, #hivm.address_space<ub>> to memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview[%c0], %c0_i32 {in_bounds = [true, true], permutation_map = #map15} : memref<1xi32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi32>
      %3 = arith.addi %0, %2 : vector<1x64xi32>
      %4 = arith.extsi %3 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xi32> to vector<1x64xi64>
      %5 = arith.cmpi slt, %4, %1 : vector<1x64xi64>
      %6 = arith.select %5, %cst_0, %cst_1 : vector<1x64xi1>, vector<1x64xf16>
      %7 = arith.cmpf une, %6, %cst_1 : vector<1x64xf16>
      scf.for %arg11 = %c0 to %c512 step %c64 {
        %subview_5 = memref.subview %arg5[%arg10, %arg11] [1, 64] [1, 1] : memref<64x512xi1, #hivm.address_space<ub>> to memref<1x64xi1, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_6 = memref.subview %arg1[%arg11] [64] [1] : memref<512xi1, #hivm.address_space<ub>> to memref<64xi1, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_7 = memref.subview %arg6[%arg10, %arg11] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_8 = memref.subview %arg0[%arg11] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_9 = memref.subview %arg9[%arg10, %arg11] [1, 64] [1, 1] : memref<64x512xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %8 = vector.transfer_read %subview_5[%c0, %c0], %false {in_bounds = [true, true]} : memref<1x64xi1, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi1>
        %9 = vector.transfer_read %subview_6[%c0], %false {in_bounds = [true, true], permutation_map = #map16} : memref<64xi1, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi1>
        %10 = vector.transfer_read %subview_7[%c0, %c0], %cst_4 {in_bounds = [true, true]} : memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = vector.transfer_read %subview_8[%c0], %cst_4 {in_bounds = [true, true], permutation_map = #map16} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %12 = arith.subf %10, %11 : vector<1x64xf32>
        %13 = math.exp %12 : vector<1x64xf32>
        %14 = arith.select %9, %cst_1, %cst_0 : vector<1x64xi1>, vector<1x64xf16>
        %15 = arith.cmpf une, %14, %cst_1 : vector<1x64xf16>
        %16 = arith.andi %7, %8 : vector<1x64xi1>
        %17 = arith.andi %16, %15 : vector<1x64xi1>
        %18 = arith.select %17, %13, %cst : vector<1x64xi1>, vector<1x64xf32>
        vector.transfer_write %18, %subview_9[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_3(%arg0: memref<64x512xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0xFC00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c64 step %c1 {
      scf.for %arg2 = %c0 to %c512 step %c128 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 128] [1, 1] : memref<64x512xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_4(%arg0: memref<64x512xi1, #hivm.address_space<ub>>, %arg1: memref<64x512xf16, #hivm.address_space<ub>>, %arg2: memref<512xf32, #hivm.address_space<ub>>, %arg3: memref<512xf32, #hivm.address_space<ub>>, %arg4: memref<64x512xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 0.000000e+00 : f16
    %false = arith.constant false
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg5 = %c0 to %c64 step %c1 {
      scf.for %arg6 = %c0 to %c512 step %c64 {
        %subview = memref.subview %arg0[%arg5, %arg6] [1, 64] [1, 1] : memref<64x512xi1, #hivm.address_space<ub>> to memref<1x64xi1, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg1[%arg5, %arg6] [1, 64] [1, 1] : memref<64x512xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg2[%arg6] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_4 = memref.subview %arg3[%arg6] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_5 = memref.subview %arg4[%arg5, %arg6] [1, 64] [1, 1] : memref<64x512xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %false {in_bounds = [true, true]} : memref<1x64xi1, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xi1>
        %1 = vector.transfer_read %subview_2[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
        %2 = vector.transfer_read %subview_3[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map16} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = vector.transfer_read %subview_4[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map16} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %4 = arith.extf %1 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf16> to vector<1x64xf32>
        %5 = arith.subf %4, %2 : vector<1x64xf32>
        %6 = math.exp %5 : vector<1x64xf32>
        %7 = arith.divf %6, %3 : vector<1x64xf32>
        %8 = arith.select %0, %7, %cst : vector<1x64xi1>, vector<1x64xf32>
        %9 = arith.truncf %8 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
        vector.transfer_write %9, %subview_5[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf16>, memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_5(%arg0: memref<64xi32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63]> : vector<64xindex>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant dense<0> : vector<64xindex>
    %0 = arith.addi %cst_0, %cst : vector<64xindex>
    %1 = arith.index_cast %0 : vector<64xindex> to vector<64xi32>
    vector.transfer_write %1, %arg0[%c0] {in_bounds = [true]} : vector<64xi32>, memref<64xi32, #hivm.address_space<ub>>
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_6(%arg0: memref<64x512xi1, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63]> : vector<64xindex>
    %cst_0 = arith.constant dense<0.000000e+00> : vector<64xf16>
    %cst_1 = arith.constant dense<-1.000000e+00> : vector<64xf16>
    %cst_2 = arith.constant dense<512> : vector<64xi32>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c64 step %c1 {
      scf.for %arg2 = %c0 to %c512 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<64x512xi1, #hivm.address_space<ub>> to memref<1x64xi1, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.broadcast %arg2 : index to vector<64xindex>
        %1 = arith.addi %0, %cst : vector<64xindex>
        %2 = arith.index_cast %1 : vector<64xindex> to vector<64xi32>
        %3 = arith.cmpi slt, %2, %cst_2 : vector<64xi32>
        %4 = arith.select %3, %cst_1, %cst_0 : vector<64xi1>, vector<64xf16>
        %5 = arith.cmpf une, %4, %cst_0 : vector<64xf16>
        %6 = vector.broadcast %5 : vector<64xi1> to vector<1x64xi1>
        vector.transfer_write %6, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xi1>, memref<1x64xi1, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_7(%arg0: memref<512xf32, #hivm.address_space<ub>>, %arg1: memref<64x512xi1, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf16>
    %cst_0 = arith.constant dense<-1.000000e+00> : vector<1x64xf16>
    %cst_1 = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %cst_2 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c64 step %c1 {
      scf.for %arg3 = %c0 to %c512 step %c64 {
        %subview = memref.subview %arg0[%arg3] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg1[%arg2, %arg3] [1, 64] [1, 1] : memref<64x512xi1, #hivm.address_space<ub>> to memref<1x64xi1, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0], %cst_2 {in_bounds = [true, true], permutation_map = #map16} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = arith.cmpf ogt, %0, %cst_1 : vector<1x64xf32>
        %2 = arith.select %1, %cst_0, %cst : vector<1x64xi1>, vector<1x64xf16>
        %3 = arith.cmpf une, %2, %cst : vector<1x64xf16>
        vector.transfer_write %3, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xi1>, memref<1x64xi1, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_kernel_outlined_vf_8(%arg0: memref<512xf32, #hivm.address_space<ub>>, %arg1: memref<512xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %cst_0 = arith.constant dense<0xFF800000> : vector<64xf32>
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c512 step %c64 {
      %subview = memref.subview %arg0[%arg2] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst_0, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg2] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview_1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_kernel(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg4: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, false, false, false, false, false]> : vector<10xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "aiv", parallel_mode = "simd"} {
    %c0_i64 = arith.constant 0 : i64
    %c4096_i64 = arith.constant 4096 : i64
    %c0_i32 = arith.constant 0 : i32
    %c4096_i32 = arith.constant 4096 : i32
    %c64_i32 = arith.constant 64 : i32
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %cst = arith.constant 0xFC00 : f16
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
      %alloc = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
      %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
      func.call @jagged_softmax_kernel_outlined_vf_8(%alloc, %alloc_0) {hivm.vector_function, no_inline} : (memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>) -> ()
      %5 = arith.index_cast %4 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg4 to offset: [%5], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %6 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %7 = affine.apply #map17()[%5]
      %reinterpret_cast_1 = memref.reinterpret_cast %arg4 to offset: [%7], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %8 = memref.load %reinterpret_cast_1[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %9 = arith.subi %8, %6 : i64
      %10 = arith.minsi %9, %c4096_i64 : i64
      %11 = arith.cmpi eq, %10, %c0_i64 : i64
      scf.if %11 {
      } else {
        %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<64xi32, #hivm.address_space<ub>>
        func.call @jagged_softmax_kernel_outlined_vf_5(%alloc_2) {hivm.vector_function, no_inline} : (memref<64xi32, #hivm.address_space<ub>>) -> ()
        %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<64x512xi1, #hivm.address_space<ub>>
        func.call @jagged_softmax_kernel_outlined_vf_6(%alloc_3) {hivm.vector_function, no_inline} : (memref<64x512xi1, #hivm.address_space<ub>>) -> ()
        %12 = arith.index_cast %6 : i64 to index
        %13 = arith.index_cast %arg5 : i32 to index
        %14 = arith.index_cast %10 : i64 to index
        %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%alloc : memref<512xf32, #hivm.address_space<ub>>) outs(%alloc_4 : memref<512xf32, #hivm.address_space<ub>>)
        %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%alloc_0 : memref<512xf32, #hivm.address_space<ub>>) outs(%alloc_5 : memref<512xf32, #hivm.address_space<ub>>)
        %15:2 = scf.for %arg11 = %c0_i32 to %c4096_i32 step %c64_i32 iter_args(%arg12 = %alloc_4, %arg13 = %alloc_5) -> (memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>)  : i32 {
          %17 = arith.index_cast %arg11 : i32 to index
          %18 = affine.apply #map18()[%13, %12, %17]
          %reinterpret_cast_7 = memref.reinterpret_cast %arg2 to offset: [%18], sizes: [64, 512], strides: [%13, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_8 = memref.alloc() : memref<64x512xf16, #hivm.address_space<ub>>
          %19 = affine.apply #map19()[%17]
          %20 = arith.maxsi %17, %14 : index
          %21 = arith.minsi %19, %20 : index
          %22 = affine.apply #map20()[%21, %17]
          %23 = arith.minsi %22, %c64 : index
          %24 = arith.maxsi %23, %c0 : index
          %25 = arith.cmpi slt, %24, %c64 : index
          scf.if %25 {
            func.call @jagged_softmax_kernel_outlined_vf_0(%alloc_8) {hivm.vector_function, no_inline} : (memref<64x512xf16, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          %subview = memref.subview %reinterpret_cast_7[0, 0] [%24, 512] [1, 1] : memref<64x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %subview_9 = memref.subview %alloc_8[0, 0] [%24, 512] [1, 1] : memref<64x512xf16, #hivm.address_space<ub>> to memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>
          hivm.hir.load ins(%subview : memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_9 : memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f16 eviction_policy = <EvictFirst> core_type = <VECTOR>
          %alloc_10 = memref.alloc() {alignment = 64 : i64} : memref<64x512xf32, #hivm.address_space<ub>>
          %alloc_11 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%alloc : memref<512xf32, #hivm.address_space<ub>>) outs(%alloc_11 : memref<512xf32, #hivm.address_space<ub>>)
          func.call @jagged_softmax_kernel_outlined_vf_1(%alloc_8, %alloc_10, %alloc_11) {hivm.vector_function, no_inline} : (memref<64x512xf16, #hivm.address_space<ub>>, memref<64x512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>) -> ()
          %alloc_12 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
          func.call @jagged_softmax_kernel_fused_1_outlined_vf_0(%arg12, %alloc_11, %alloc_12) {hivm.vector_function, no_inline} : (memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>) -> ()
          %alloc_13 = memref.alloc() {alignment = 64 : i64} : memref<512xi1, #hivm.address_space<ub>>
          %alloc_14 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
          %alloc_15 = memref.alloc() {alignment = 64 : i64} : memref<64x512xf32, #hivm.address_space<ub>>
          func.call @jagged_softmax_kernel_outlined_vf_2(%alloc_12, %alloc_13, %arg12, %alloc_14, %alloc_2, %alloc_3, %alloc_10, %arg11, %10, %alloc_15) {hivm.vector_function, no_inline} : (memref<512xf32, #hivm.address_space<ub>>, memref<512xi1, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>, memref<64xi32, #hivm.address_space<ub>>, memref<64x512xi1, #hivm.address_space<ub>>, memref<64x512xf32, #hivm.address_space<ub>>, i32, i64, memref<64x512xf32, #hivm.address_space<ub>>) -> ()
          %alloc_16 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%alloc_0 : memref<512xf32, #hivm.address_space<ub>>) outs(%alloc_16 : memref<512xf32, #hivm.address_space<ub>>)
          func.call @jagged_softmax_kernel_fused_4_outlined_vf_0(%alloc_15, %alloc_16) {hivm.vector_function, no_inline} : (memref<64x512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>) -> ()
          %alloc_17 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
          func.call @jagged_softmax_kernel_fused_3_outlined_vf_0(%arg13, %alloc_14, %alloc_16, %alloc_17) {hivm.vector_function, no_inline} : (memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>) -> ()
          %alloc_18 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
          hivm.hir.copy ins(%alloc_12 : memref<512xf32, #hivm.address_space<ub>>) outs(%alloc_18 : memref<512xf32, #hivm.address_space<ub>>)
          scf.yield %alloc_18, %alloc_17 : memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>
        }
        %alloc_6 = memref.alloc() {alignment = 64 : i64} : memref<64x512xi1, #hivm.address_space<ub>>
        func.call @jagged_softmax_kernel_outlined_vf_7(%15#1, %alloc_6) {hivm.vector_function, no_inline} : (memref<512xf32, #hivm.address_space<ub>>, memref<64x512xi1, #hivm.address_space<ub>>) -> ()
        %16 = arith.index_cast %arg6 : i32 to index
        scf.for %arg11 = %c0_i32 to %c4096_i32 step %c64_i32  : i32 {
          %17 = arith.index_cast %arg11 : i32 to index
          %18 = affine.apply #map18()[%13, %12, %17]
          %reinterpret_cast_7 = memref.reinterpret_cast %arg2 to offset: [%18], sizes: [64, 512], strides: [%13, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_8 = memref.alloc() : memref<64x512xf16, #hivm.address_space<ub>>
          %19 = affine.apply #map19()[%17]
          %20 = arith.maxsi %17, %14 : index
          %21 = arith.minsi %19, %20 : index
          %22 = affine.apply #map20()[%21, %17]
          %23 = arith.minsi %22, %c64 : index
          %24 = arith.maxsi %23, %c0 : index
          %25 = arith.cmpi slt, %24, %c64 : index
          scf.if %25 {
            func.call @jagged_softmax_kernel_outlined_vf_3(%alloc_8) {hivm.vector_function, no_inline} : (memref<64x512xf16, #hivm.address_space<ub>>) -> ()
          } {hivm.unlikely_condition}
          %subview = memref.subview %reinterpret_cast_7[0, 0] [%24, 512] [1, 1] : memref<64x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %subview_9 = memref.subview %alloc_8[0, 0] [%24, 512] [1, 1] : memref<64x512xf16, #hivm.address_space<ub>> to memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>
          hivm.hir.load ins(%subview : memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_9 : memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f16 eviction_policy = <EvictFirst> core_type = <VECTOR>
          %26 = affine.apply #map18()[%16, %12, %17]
          %reinterpret_cast_10 = memref.reinterpret_cast %arg3 to offset: [%26], sizes: [64, 512], strides: [%16, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          %alloc_11 = memref.alloc() {alignment = 64 : i64} : memref<64x512xf16, #hivm.address_space<ub>>
          func.call @jagged_softmax_kernel_outlined_vf_4(%alloc_6, %alloc_8, %15#0, %15#1, %alloc_11) {hivm.vector_function, no_inline} : (memref<64x512xi1, #hivm.address_space<ub>>, memref<64x512xf16, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>, memref<64x512xf16, #hivm.address_space<ub>>) -> ()
          %subview_12 = memref.subview %alloc_11[0, 0] [%24, 512] [1, 1] : memref<64x512xf16, #hivm.address_space<ub>> to memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>
          %subview_13 = memref.subview %reinterpret_cast_10[0, 0] [%24, 512] [1, 1] : memref<64x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
          hivm.hir.store ins(%subview_12 : memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>) outs(%subview_13 : memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>)
        }
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}
