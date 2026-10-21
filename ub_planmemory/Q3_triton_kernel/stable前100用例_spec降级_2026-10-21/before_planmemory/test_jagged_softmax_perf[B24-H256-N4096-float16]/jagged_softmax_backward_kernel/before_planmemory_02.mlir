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
#map15 = affine_map<(d0) -> (0, d0)>
#map16 = affine_map<()[s0] -> (s0 + 1)>
#map17 = affine_map<()[s0, s1, s2] -> ((s1 + s2) * s0)>
#map18 = affine_map<()[s0] -> (s0 + 64)>
#map19 = affine_map<()[s0, s1] -> (s0 - s1)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<AIV>, ssbuffer.insertionOptimization} {
  func.func @jagged_softmax_backward_kernel_fused_1_outlined_vf_0(%arg0: memref<64x256xf32, #hivm.address_space<ub>>, %arg1: memref<256xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c4 = arith.constant 4 : index
    scf.for %arg2 = %c0 to %c256 step %c64 {
      scf.for %arg3 = %c0 to %c4 step %c1 {
        %subview = memref.subview %arg0[%arg3, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = affine.apply #map()[%arg3]
        %subview_0 = memref.subview %arg0[%1, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = affine.apply #map1()[%arg3]
        %subview_1 = memref.subview %arg0[%3, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = affine.apply #map2()[%arg3]
        %subview_2 = memref.subview %arg0[%5, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %6 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = affine.apply #map3()[%arg3]
        %subview_3 = memref.subview %arg0[%7, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %8 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %9 = affine.apply #map4()[%arg3]
        %subview_4 = memref.subview %arg0[%9, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %10 = vector.transfer_read %subview_4[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %11 = affine.apply #map5()[%arg3]
        %subview_5 = memref.subview %arg0[%11, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %12 = vector.transfer_read %subview_5[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %13 = affine.apply #map6()[%arg3]
        %subview_6 = memref.subview %arg0[%13, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %14 = vector.transfer_read %subview_6[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %15 = affine.apply #map7()[%arg3]
        %subview_7 = memref.subview %arg0[%15, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %16 = vector.transfer_read %subview_7[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %17 = affine.apply #map8()[%arg3]
        %subview_8 = memref.subview %arg0[%17, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %18 = vector.transfer_read %subview_8[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %19 = affine.apply #map9()[%arg3]
        %subview_9 = memref.subview %arg0[%19, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %20 = vector.transfer_read %subview_9[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %21 = affine.apply #map10()[%arg3]
        %subview_10 = memref.subview %arg0[%21, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %22 = vector.transfer_read %subview_10[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %23 = affine.apply #map11()[%arg3]
        %subview_11 = memref.subview %arg0[%23, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %24 = vector.transfer_read %subview_11[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %25 = affine.apply #map12()[%arg3]
        %subview_12 = memref.subview %arg0[%25, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %26 = vector.transfer_read %subview_12[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %27 = affine.apply #map13()[%arg3]
        %subview_13 = memref.subview %arg0[%27, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %28 = vector.transfer_read %subview_13[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %29 = affine.apply #map14()[%arg3]
        %subview_14 = memref.subview %arg0[%29, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %30 = vector.transfer_read %subview_14[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
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
        vector.transfer_write %45, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg2 = %c0 to %c256 step %c64 {
      %subview = memref.subview %arg0[0, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_0 = memref.subview %arg0[1, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_1 = memref.subview %arg0[2, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_2 = memref.subview %arg0[3, %arg2] [1, 64] [1, 1] : memref<64x256xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      %3 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %4 = arith.addf %0, %2 : vector<1x64xf32>
      %5 = arith.addf %1, %3 : vector<1x64xf32>
      %6 = arith.addf %4, %5 : vector<1x64xf32>
      %7 = vector.shape_cast %6 : vector<1x64xf32> to vector<64xf32>
      %subview_3 = memref.subview %arg1[%arg2] [64] [1] : memref<256xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %8 = vector.transfer_read %subview_3[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %9 = arith.addf %7, %8 : vector<64xf32>
      vector.transfer_write %9, %subview_3[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_0(%arg0: memref<64x256xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c64 step %c1 {
      scf.for %arg2 = %c0 to %c256 step %c128 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 128] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x128xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_1(%arg0: memref<64x256xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c64 step %c1 {
      scf.for %arg2 = %c0 to %c256 step %c128 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 128] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x128xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_2(%arg0: memref<16384xf16, #hivm.address_space<ub>>, %arg1: memref<16384xf16, #hivm.address_space<ub>>, %arg2: memref<16384xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f16
    %c64 = arith.constant 64 : index
    %c16384 = arith.constant 16384 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c16384 step %c64 {
      %subview = memref.subview %arg0[%arg3] [64] [1] : memref<16384xf16, #hivm.address_space<ub>> to memref<64xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg3] [64] [1] : memref<16384xf16, #hivm.address_space<ub>> to memref<64xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg3] [64] [1] : memref<16384xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true]} : memref<64xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf16>
      %1 = vector.transfer_read %subview_0[%c0], %cst {in_bounds = [true]} : memref<64xf16, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf16>
      %2 = arith.extf %1 {round_mode = #hfusion.round_mode<rint>} : vector<64xf16> to vector<64xf32>
      %3 = arith.extf %0 {round_mode = #hfusion.round_mode<rint>} : vector<64xf16> to vector<64xf32>
      %4 = arith.mulf %3, %2 : vector<64xf32>
      vector.transfer_write %4, %subview_1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_3(%arg0: memref<256xf32, #hivm.address_space<ub>>, %arg1: memref<256xf32, #hivm.address_space<ub>>, %arg2: memref<256xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c64 = arith.constant 64 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c256 step %c64 {
      %subview = memref.subview %arg0[%arg3] [64] [1] : memref<256xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg3] [64] [1] : memref<256xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg3] [64] [1] : memref<256xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %1 = vector.transfer_read %subview_0[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %2 = arith.addf %0, %1 : vector<64xf32>
      vector.transfer_write %2, %subview_1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_4(%arg0: memref<64x256xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c64 step %c1 {
      scf.for %arg2 = %c0 to %c256 step %c128 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 128] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x128xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_5(%arg0: memref<64x256xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c64 step %c1 {
      scf.for %arg2 = %c0 to %c256 step %c128 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 128] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x128xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_6(%arg0: memref<64x256xf16, #hivm.address_space<ub>>, %arg1: memref<256xf32, #hivm.address_space<ub>>, %arg2: memref<64x256xf16, #hivm.address_space<ub>>, %arg3: memref<64x256xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c64 step %c1 {
      scf.for %arg5 = %c0 to %c256 step %c64 {
        %subview = memref.subview %arg0[%arg4, %arg5] [1, 64] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg5] [64] [1] : memref<256xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg2[%arg4, %arg5] [1, 64] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg3[%arg4, %arg5] [1, 64] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
        %1 = vector.transfer_read %subview_1[%c0], %cst {in_bounds = [true, true], permutation_map = #map15} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.transfer_read %subview_2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
        %3 = arith.extf %2 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf16> to vector<1x64xf32>
        %4 = arith.extf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf16> to vector<1x64xf32>
        %5 = arith.subf %4, %1 : vector<1x64xf32>
        %6 = arith.mulf %5, %3 : vector<1x64xf32>
        %7 = arith.truncf %6 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
        vector.transfer_write %7, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf16>, memref<1x64xf16, strided<[256, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_7(%arg0: memref<256xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c64 = arith.constant 64 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c256 step %c64 {
      %subview = memref.subview %arg0[%arg1] [64] [1] : memref<256xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg5: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, false, false, false, false, false, false]> : vector<12xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "aiv", parallel_mode = "simd"} {
    %c0_i64 = arith.constant 0 : i64
    %c4096_i64 = arith.constant 4096 : i64
    %c64_i64 = arith.constant 64 : i64
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %cst = arith.constant 0.000000e+00 : f16
    %c56_i32 = arith.constant 56 : i32
    %0 = arith.muli %arg9, %arg10 : i32
    %1 = arith.muli %0, %arg11 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %4 = arith.index_cast %arg6 : i32 to index
    %5 = arith.index_cast %arg7 : i32 to index
    %6 = arith.index_cast %arg8 : i32 to index
    scf.for %arg12 = %3 to %1 step %c56_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %7 = arith.remsi %arg12, %arg9 : i32
      %alloc = memref.alloc() {alignment = 64 : i64} : memref<256xf32, #hivm.address_space<ub>>
      func.call @jagged_softmax_backward_kernel_outlined_vf_7(%alloc) {hivm.vector_function, no_inline} : (memref<256xf32, #hivm.address_space<ub>>) -> ()
      %8 = arith.index_cast %7 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg5 to offset: [%8], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %9 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %10 = affine.apply #map16()[%8]
      %reinterpret_cast_0 = memref.reinterpret_cast %arg5 to offset: [%10], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %11 = memref.load %reinterpret_cast_0[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %12 = arith.subi %11, %9 : i64
      %13 = arith.minsi %12, %c4096_i64 : i64
      %14 = arith.index_cast %9 : i64 to index
      %15 = arith.index_cast %13 : i64 to index
      %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<256xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<256xf32, #hivm.address_space<ub>>) outs(%alloc_1 : memref<256xf32, #hivm.address_space<ub>>)
      %16 = scf.for %arg13 = %c0_i64 to %13 step %c64_i64 iter_args(%arg14 = %alloc_1) -> (memref<256xf32, #hivm.address_space<ub>>)  : i64 {
        %17 = arith.index_cast %arg13 : i64 to index
        %18 = affine.apply #map17()[%4, %14, %17]
        %reinterpret_cast_2 = memref.reinterpret_cast %arg2 to offset: [%18], sizes: [64, 256], strides: [%4, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %19 = affine.apply #map17()[%5, %14, %17]
        %reinterpret_cast_3 = memref.reinterpret_cast %arg3 to offset: [%19], sizes: [64, 256], strides: [%5, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_4 = memref.alloc() : memref<64x256xf16, #hivm.address_space<ub>>
        annotation.mark %alloc_4 {hivm.multi_buffer = 2 : i32} : memref<64x256xf16, #hivm.address_space<ub>>
        %20 = affine.apply #map18()[%17]
        %21 = arith.maxsi %17, %15 : index
        %22 = arith.minsi %20, %21 : index
        %23 = affine.apply #map19()[%22, %17]
        %24 = arith.minsi %23, %c64 : index
        %25 = arith.maxsi %24, %c0 : index
        %26 = arith.cmpi slt, %25, %c64 : index
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_0(%alloc_4) {hivm.vector_function, no_inline} : (memref<64x256xf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview = memref.subview %reinterpret_cast_2[0, 0] [%25, 256] [1, 1] : memref<64x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_5 = memref.subview %alloc_4[0, 0] [%25, 256] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<?x256xf16, strided<[256, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview : memref<?x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_5 : memref<?x256xf16, strided<[256, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %alloc_6 = memref.alloc() : memref<64x256xf16, #hivm.address_space<ub>>
        annotation.mark %alloc_6 {hivm.multi_buffer = 2 : i32} : memref<64x256xf16, #hivm.address_space<ub>>
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_1(%alloc_6) {hivm.vector_function, no_inline} : (memref<64x256xf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview_7 = memref.subview %reinterpret_cast_3[0, 0] [%25, 256] [1, 1] : memref<64x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_8 = memref.subview %alloc_6[0, 0] [%25, 256] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<?x256xf16, strided<[256, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview_7 : memref<?x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_8 : memref<?x256xf16, strided<[256, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %collapse_shape = memref.collapse_shape %alloc_6 [[0, 1]] : memref<64x256xf16, #hivm.address_space<ub>> into memref<16384xf16, #hivm.address_space<ub>>
        %collapse_shape_9 = memref.collapse_shape %alloc_4 [[0, 1]] : memref<64x256xf16, #hivm.address_space<ub>> into memref<16384xf16, #hivm.address_space<ub>>
        %alloc_10 = memref.alloc() {alignment = 64 : i64} : memref<16384xf32, #hivm.address_space<ub>>
        func.call @jagged_softmax_backward_kernel_outlined_vf_2(%collapse_shape_9, %collapse_shape, %alloc_10) {hivm.vector_function, no_inline} : (memref<16384xf16, #hivm.address_space<ub>>, memref<16384xf16, #hivm.address_space<ub>>, memref<16384xf32, #hivm.address_space<ub>>) -> ()
        %expand_shape = memref.expand_shape %alloc_10 [[0, 1]] output_shape [64, 256] : memref<16384xf32, #hivm.address_space<ub>> into memref<64x256xf32, #hivm.address_space<ub>>
        %alloc_11 = memref.alloc() {alignment = 64 : i64} : memref<256xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%alloc : memref<256xf32, #hivm.address_space<ub>>) outs(%alloc_11 : memref<256xf32, #hivm.address_space<ub>>)
        func.call @jagged_softmax_backward_kernel_fused_1_outlined_vf_0(%expand_shape, %alloc_11) {hivm.vector_function, no_inline} : (memref<64x256xf32, #hivm.address_space<ub>>, memref<256xf32, #hivm.address_space<ub>>) -> ()
        %alloc_12 = memref.alloc() {alignment = 64 : i64} : memref<256xf32, #hivm.address_space<ub>>
        func.call @jagged_softmax_backward_kernel_outlined_vf_3(%arg14, %alloc_11, %alloc_12) {hivm.vector_function, no_inline} : (memref<256xf32, #hivm.address_space<ub>>, memref<256xf32, #hivm.address_space<ub>>, memref<256xf32, #hivm.address_space<ub>>) -> ()
        scf.yield %alloc_12 : memref<256xf32, #hivm.address_space<ub>>
      }
      scf.for %arg13 = %c0_i64 to %13 step %c64_i64  : i64 {
        %17 = arith.index_cast %arg13 : i64 to index
        %18 = affine.apply #map17()[%4, %14, %17]
        %reinterpret_cast_2 = memref.reinterpret_cast %arg2 to offset: [%18], sizes: [64, 256], strides: [%4, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %19 = affine.apply #map17()[%5, %14, %17]
        %reinterpret_cast_3 = memref.reinterpret_cast %arg3 to offset: [%19], sizes: [64, 256], strides: [%5, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_4 = memref.alloc() : memref<64x256xf16, #hivm.address_space<ub>>
        annotation.mark %alloc_4 {hivm.multi_buffer = 2 : i32} : memref<64x256xf16, #hivm.address_space<ub>>
        %20 = affine.apply #map18()[%17]
        %21 = arith.maxsi %17, %15 : index
        %22 = arith.minsi %20, %21 : index
        %23 = affine.apply #map19()[%22, %17]
        %24 = arith.minsi %23, %c64 : index
        %25 = arith.maxsi %24, %c0 : index
        %26 = arith.cmpi slt, %25, %c64 : index
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_4(%alloc_4) {hivm.vector_function, no_inline} : (memref<64x256xf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview = memref.subview %reinterpret_cast_2[0, 0] [%25, 256] [1, 1] : memref<64x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_5 = memref.subview %alloc_4[0, 0] [%25, 256] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<?x256xf16, strided<[256, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview : memref<?x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_5 : memref<?x256xf16, strided<[256, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %alloc_6 = memref.alloc() : memref<64x256xf16, #hivm.address_space<ub>>
        annotation.mark %alloc_6 {hivm.multi_buffer = 2 : i32} : memref<64x256xf16, #hivm.address_space<ub>>
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_5(%alloc_6) {hivm.vector_function, no_inline} : (memref<64x256xf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview_7 = memref.subview %reinterpret_cast_3[0, 0] [%25, 256] [1, 1] : memref<64x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_8 = memref.subview %alloc_6[0, 0] [%25, 256] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<?x256xf16, strided<[256, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview_7 : memref<?x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_8 : memref<?x256xf16, strided<[256, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %27 = affine.apply #map17()[%6, %14, %17]
        %reinterpret_cast_9 = memref.reinterpret_cast %arg4 to offset: [%27], sizes: [64, 256], strides: [%6, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<64x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_10 = memref.alloc() {alignment = 64 : i64} : memref<64x256xf16, #hivm.address_space<ub>>
        annotation.mark %alloc_10 {hivm.multi_buffer = 2 : i32} : memref<64x256xf16, #hivm.address_space<ub>>
        func.call @jagged_softmax_backward_kernel_outlined_vf_6(%alloc_4, %16, %alloc_6, %alloc_10) {hivm.vector_function, no_inline} : (memref<64x256xf16, #hivm.address_space<ub>>, memref<256xf32, #hivm.address_space<ub>>, memref<64x256xf16, #hivm.address_space<ub>>, memref<64x256xf16, #hivm.address_space<ub>>) -> ()
        %subview_11 = memref.subview %alloc_10[0, 0] [%25, 256] [1, 1] : memref<64x256xf16, #hivm.address_space<ub>> to memref<?x256xf16, strided<[256, 1]>, #hivm.address_space<ub>>
        %subview_12 = memref.subview %reinterpret_cast_9[0, 0] [%25, 256] [1, 1] : memref<64x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_11 : memref<?x256xf16, strided<[256, 1]>, #hivm.address_space<ub>>) outs(%subview_12 : memref<?x256xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>)
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}
