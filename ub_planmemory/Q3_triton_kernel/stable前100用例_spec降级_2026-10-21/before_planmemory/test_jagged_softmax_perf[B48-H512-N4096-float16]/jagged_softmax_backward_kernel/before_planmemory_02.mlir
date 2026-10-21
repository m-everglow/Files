#map = affine_map<(d0) -> (0, d0)>
#map1 = affine_map<()[s0] -> (s0 + 1)>
#map2 = affine_map<()[s0, s1, s2] -> ((s1 + s2) * s0)>
#map3 = affine_map<()[s0] -> (s0 + 32)>
#map4 = affine_map<()[s0, s1] -> (s0 - s1)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<AIV>, ssbuffer.insertionOptimization} {
  func.func @jagged_softmax_backward_kernel_fused_1_outlined_vf_0(%arg0: memref<32x512xf32, #hivm.address_space<ub>>, %arg1: memref<512xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %c31 = arith.constant 31 : index
    %c15 = arith.constant 15 : index
    %c23 = arith.constant 23 : index
    %c7 = arith.constant 7 : index
    %c27 = arith.constant 27 : index
    %c11 = arith.constant 11 : index
    %c19 = arith.constant 19 : index
    %c3 = arith.constant 3 : index
    %c29 = arith.constant 29 : index
    %c13 = arith.constant 13 : index
    %c21 = arith.constant 21 : index
    %c5 = arith.constant 5 : index
    %c25 = arith.constant 25 : index
    %c9 = arith.constant 9 : index
    %c17 = arith.constant 17 : index
    %c30 = arith.constant 30 : index
    %c14 = arith.constant 14 : index
    %c22 = arith.constant 22 : index
    %c6 = arith.constant 6 : index
    %c26 = arith.constant 26 : index
    %c10 = arith.constant 10 : index
    %c18 = arith.constant 18 : index
    %c2 = arith.constant 2 : index
    %c28 = arith.constant 28 : index
    %c12 = arith.constant 12 : index
    %c20 = arith.constant 20 : index
    %c4 = arith.constant 4 : index
    %c24 = arith.constant 24 : index
    %c8 = arith.constant 8 : index
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg2 = %c0 to %c512 step %c64 {
      %subview = memref.subview %arg1[%arg2] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %1 = vector.transfer_read %arg0[%c0, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %2 = vector.transfer_read %arg0[%c16, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %3 = arith.addf %2, %1 : vector<64xf32>
      %4 = vector.transfer_read %arg0[%c8, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %5 = vector.transfer_read %arg0[%c24, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %6 = arith.addf %5, %4 : vector<64xf32>
      %7 = arith.addf %6, %3 : vector<64xf32>
      %8 = vector.transfer_read %arg0[%c4, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %9 = vector.transfer_read %arg0[%c20, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %10 = arith.addf %9, %8 : vector<64xf32>
      %11 = vector.transfer_read %arg0[%c12, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %12 = vector.transfer_read %arg0[%c28, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %13 = arith.addf %12, %11 : vector<64xf32>
      %14 = arith.addf %13, %10 : vector<64xf32>
      %15 = arith.addf %14, %7 : vector<64xf32>
      %16 = vector.transfer_read %arg0[%c2, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %17 = vector.transfer_read %arg0[%c18, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %18 = arith.addf %17, %16 : vector<64xf32>
      %19 = vector.transfer_read %arg0[%c10, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %20 = vector.transfer_read %arg0[%c26, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %21 = arith.addf %20, %19 : vector<64xf32>
      %22 = arith.addf %21, %18 : vector<64xf32>
      %23 = vector.transfer_read %arg0[%c6, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %24 = vector.transfer_read %arg0[%c22, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %25 = arith.addf %24, %23 : vector<64xf32>
      %26 = vector.transfer_read %arg0[%c14, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %27 = vector.transfer_read %arg0[%c30, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %28 = arith.addf %27, %26 : vector<64xf32>
      %29 = arith.addf %28, %25 : vector<64xf32>
      %30 = arith.addf %29, %22 : vector<64xf32>
      %31 = arith.addf %30, %15 : vector<64xf32>
      %32 = vector.transfer_read %arg0[%c1, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %33 = vector.transfer_read %arg0[%c17, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %34 = arith.addf %33, %32 : vector<64xf32>
      %35 = vector.transfer_read %arg0[%c9, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %36 = vector.transfer_read %arg0[%c25, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %37 = arith.addf %36, %35 : vector<64xf32>
      %38 = arith.addf %37, %34 : vector<64xf32>
      %39 = vector.transfer_read %arg0[%c5, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %40 = vector.transfer_read %arg0[%c21, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %41 = arith.addf %40, %39 : vector<64xf32>
      %42 = vector.transfer_read %arg0[%c13, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %43 = vector.transfer_read %arg0[%c29, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %44 = arith.addf %43, %42 : vector<64xf32>
      %45 = arith.addf %44, %41 : vector<64xf32>
      %46 = arith.addf %45, %38 : vector<64xf32>
      %47 = vector.transfer_read %arg0[%c3, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %48 = vector.transfer_read %arg0[%c19, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %49 = arith.addf %48, %47 : vector<64xf32>
      %50 = vector.transfer_read %arg0[%c11, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %51 = vector.transfer_read %arg0[%c27, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %52 = arith.addf %51, %50 : vector<64xf32>
      %53 = arith.addf %52, %49 : vector<64xf32>
      %54 = vector.transfer_read %arg0[%c7, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %55 = vector.transfer_read %arg0[%c23, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %56 = arith.addf %55, %54 : vector<64xf32>
      %57 = vector.transfer_read %arg0[%c15, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %58 = vector.transfer_read %arg0[%c31, %arg2], %cst : memref<32x512xf32, #hivm.address_space<ub>>, vector<64xf32>
      %59 = arith.addf %58, %57 : vector<64xf32>
      %60 = arith.addf %59, %56 : vector<64xf32>
      %61 = arith.addf %60, %53 : vector<64xf32>
      %62 = arith.addf %61, %46 : vector<64xf32>
      %63 = arith.addf %31, %0 : vector<64xf32>
      %64 = arith.addf %62, %63 : vector<64xf32>
      vector.transfer_write %64, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_0(%arg0: memref<32x512xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c128 = arith.constant 128 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c32 step %c1 {
      scf.for %arg2 = %c0 to %c512 step %c128 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 128] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_1(%arg0: memref<32x512xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c128 = arith.constant 128 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c32 step %c1 {
      scf.for %arg2 = %c0 to %c512 step %c128 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 128] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
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
  func.func @jagged_softmax_backward_kernel_outlined_vf_3(%arg0: memref<512xf32, #hivm.address_space<ub>>, %arg1: memref<512xf32, #hivm.address_space<ub>>, %arg2: memref<512xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %c0 to %c512 step %c64 {
      %subview = memref.subview %arg0[%arg3] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg3] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg2[%arg3] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %1 = vector.transfer_read %subview_0[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %2 = arith.addf %0, %1 : vector<64xf32>
      vector.transfer_write %2, %subview_1[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_4(%arg0: memref<32x512xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c128 = arith.constant 128 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c32 step %c1 {
      scf.for %arg2 = %c0 to %c512 step %c128 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 128] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_5(%arg0: memref<32x512xf16, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x128xf16>
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c128 = arith.constant 128 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c32 step %c1 {
      scf.for %arg2 = %c0 to %c512 step %c128 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 128] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x128xf16>, memref<1x128xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_6(%arg0: memref<32x512xf16, #hivm.address_space<ub>>, %arg1: memref<512xf32, #hivm.address_space<ub>>, %arg2: memref<32x512xf16, #hivm.address_space<ub>>, %arg3: memref<32x512xf16, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c32 step %c1 {
      scf.for %arg5 = %c0 to %c512 step %c64 {
        %subview = memref.subview %arg0[%arg4, %arg5] [1, 64] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg1[%arg5] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg2[%arg4, %arg5] [1, 64] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg3[%arg4, %arg5] [1, 64] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
        %1 = vector.transfer_read %subview_1[%c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.transfer_read %subview_2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf16>
        %3 = arith.extf %2 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf16> to vector<1x64xf32>
        %4 = arith.extf %0 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf16> to vector<1x64xf32>
        %5 = arith.subf %4, %1 : vector<1x64xf32>
        %6 = arith.mulf %5, %3 : vector<1x64xf32>
        %7 = arith.truncf %6 {round_mode = #hfusion.round_mode<rint>} : vector<1x64xf32> to vector<1x64xf16>
        vector.transfer_write %7, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf16>, memref<1x64xf16, strided<[512, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @jagged_softmax_backward_kernel_outlined_vf_7(%arg0: memref<512xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c64 = arith.constant 64 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c512 step %c64 {
      %subview = memref.subview %arg0[%arg1] [64] [1] : memref<512xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @jagged_softmax_backward_kernel(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf16, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg5: memref<?xi64, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, false, false, false, false, false, false]> : vector<12xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "aiv", parallel_mode = "simd"} {
    %c0_i64 = arith.constant 0 : i64
    %c4096_i64 = arith.constant 4096 : i64
    %c32_i64 = arith.constant 32 : i64
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
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
      %alloc = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
      func.call @jagged_softmax_backward_kernel_outlined_vf_7(%alloc) {hivm.vector_function, no_inline} : (memref<512xf32, #hivm.address_space<ub>>) -> ()
      %8 = arith.index_cast %7 : i32 to index
      %reinterpret_cast = memref.reinterpret_cast %arg5 to offset: [%8], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %9 = memref.load %reinterpret_cast[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %10 = affine.apply #map1()[%8]
      %reinterpret_cast_0 = memref.reinterpret_cast %arg5 to offset: [%10], sizes: [1], strides: [1] : memref<?xi64, #hivm.address_space<gm>> to memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %11 = memref.load %reinterpret_cast_0[%c0] : memref<1xi64, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %12 = arith.subi %11, %9 : i64
      %13 = arith.minsi %12, %c4096_i64 : i64
      %14 = arith.index_cast %9 : i64 to index
      %15 = arith.index_cast %13 : i64 to index
      %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc : memref<512xf32, #hivm.address_space<ub>>) outs(%alloc_1 : memref<512xf32, #hivm.address_space<ub>>)
      %16 = scf.for %arg13 = %c0_i64 to %13 step %c32_i64 iter_args(%arg14 = %alloc_1) -> (memref<512xf32, #hivm.address_space<ub>>)  : i64 {
        %17 = arith.index_cast %arg13 : i64 to index
        %18 = affine.apply #map2()[%4, %14, %17]
        %reinterpret_cast_2 = memref.reinterpret_cast %arg2 to offset: [%18], sizes: [32, 512], strides: [%4, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<32x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %19 = affine.apply #map2()[%5, %14, %17]
        %reinterpret_cast_3 = memref.reinterpret_cast %arg3 to offset: [%19], sizes: [32, 512], strides: [%5, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<32x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_4 = memref.alloc() : memref<32x512xf16, #hivm.address_space<ub>>
        annotation.mark %alloc_4 {hivm.multi_buffer = 2 : i32} : memref<32x512xf16, #hivm.address_space<ub>>
        %20 = affine.apply #map3()[%17]
        %21 = arith.maxsi %17, %15 : index
        %22 = arith.minsi %20, %21 : index
        %23 = affine.apply #map4()[%22, %17]
        %24 = arith.minsi %23, %c32 : index
        %25 = arith.maxsi %24, %c0 : index
        %26 = arith.cmpi slt, %25, %c32 : index
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_0(%alloc_4) {hivm.vector_function, no_inline} : (memref<32x512xf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview = memref.subview %reinterpret_cast_2[0, 0] [%25, 512] [1, 1] : memref<32x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_5 = memref.subview %alloc_4[0, 0] [%25, 512] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview : memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_5 : memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %alloc_6 = memref.alloc() : memref<32x512xf16, #hivm.address_space<ub>>
        annotation.mark %alloc_6 {hivm.multi_buffer = 2 : i32} : memref<32x512xf16, #hivm.address_space<ub>>
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_1(%alloc_6) {hivm.vector_function, no_inline} : (memref<32x512xf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview_7 = memref.subview %reinterpret_cast_3[0, 0] [%25, 512] [1, 1] : memref<32x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_8 = memref.subview %alloc_6[0, 0] [%25, 512] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview_7 : memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_8 : memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %collapse_shape = memref.collapse_shape %alloc_6 [[0, 1]] : memref<32x512xf16, #hivm.address_space<ub>> into memref<16384xf16, #hivm.address_space<ub>>
        %collapse_shape_9 = memref.collapse_shape %alloc_4 [[0, 1]] : memref<32x512xf16, #hivm.address_space<ub>> into memref<16384xf16, #hivm.address_space<ub>>
        %alloc_10 = memref.alloc() {alignment = 64 : i64} : memref<16384xf32, #hivm.address_space<ub>>
        func.call @jagged_softmax_backward_kernel_outlined_vf_2(%collapse_shape_9, %collapse_shape, %alloc_10) {hivm.vector_function, no_inline} : (memref<16384xf16, #hivm.address_space<ub>>, memref<16384xf16, #hivm.address_space<ub>>, memref<16384xf32, #hivm.address_space<ub>>) -> ()
        %expand_shape = memref.expand_shape %alloc_10 [[0, 1]] output_shape [32, 512] : memref<16384xf32, #hivm.address_space<ub>> into memref<32x512xf32, #hivm.address_space<ub>>
        %alloc_11 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%alloc : memref<512xf32, #hivm.address_space<ub>>) outs(%alloc_11 : memref<512xf32, #hivm.address_space<ub>>)
        func.call @jagged_softmax_backward_kernel_fused_1_outlined_vf_0(%expand_shape, %alloc_11) {hivm.vector_function, no_inline} : (memref<32x512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>) -> ()
        %alloc_12 = memref.alloc() {alignment = 64 : i64} : memref<512xf32, #hivm.address_space<ub>>
        func.call @jagged_softmax_backward_kernel_outlined_vf_3(%arg14, %alloc_11, %alloc_12) {hivm.vector_function, no_inline} : (memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>) -> ()
        scf.yield %alloc_12 : memref<512xf32, #hivm.address_space<ub>>
      }
      scf.for %arg13 = %c0_i64 to %13 step %c32_i64  : i64 {
        %17 = arith.index_cast %arg13 : i64 to index
        %18 = affine.apply #map2()[%4, %14, %17]
        %reinterpret_cast_2 = memref.reinterpret_cast %arg2 to offset: [%18], sizes: [32, 512], strides: [%4, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<32x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %19 = affine.apply #map2()[%5, %14, %17]
        %reinterpret_cast_3 = memref.reinterpret_cast %arg3 to offset: [%19], sizes: [32, 512], strides: [%5, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<32x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_4 = memref.alloc() : memref<32x512xf16, #hivm.address_space<ub>>
        annotation.mark %alloc_4 {hivm.multi_buffer = 2 : i32} : memref<32x512xf16, #hivm.address_space<ub>>
        %20 = affine.apply #map3()[%17]
        %21 = arith.maxsi %17, %15 : index
        %22 = arith.minsi %20, %21 : index
        %23 = affine.apply #map4()[%22, %17]
        %24 = arith.minsi %23, %c32 : index
        %25 = arith.maxsi %24, %c0 : index
        %26 = arith.cmpi slt, %25, %c32 : index
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_4(%alloc_4) {hivm.vector_function, no_inline} : (memref<32x512xf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview = memref.subview %reinterpret_cast_2[0, 0] [%25, 512] [1, 1] : memref<32x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_5 = memref.subview %alloc_4[0, 0] [%25, 512] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview : memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_5 : memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %alloc_6 = memref.alloc() : memref<32x512xf16, #hivm.address_space<ub>>
        annotation.mark %alloc_6 {hivm.multi_buffer = 2 : i32} : memref<32x512xf16, #hivm.address_space<ub>>
        scf.if %26 {
          func.call @jagged_softmax_backward_kernel_outlined_vf_5(%alloc_6) {hivm.vector_function, no_inline} : (memref<32x512xf16, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview_7 = memref.subview %reinterpret_cast_3[0, 0] [%25, 512] [1, 1] : memref<32x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_8 = memref.subview %alloc_6[0, 0] [%25, 512] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview_7 : memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_8 : memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f16 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %27 = affine.apply #map2()[%6, %14, %17]
        %reinterpret_cast_9 = memref.reinterpret_cast %arg4 to offset: [%27], sizes: [32, 512], strides: [%6, 1] : memref<?xf16, #hivm.address_space<gm>> to memref<32x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_10 = memref.alloc() {alignment = 64 : i64} : memref<32x512xf16, #hivm.address_space<ub>>
        annotation.mark %alloc_10 {hivm.multi_buffer = 2 : i32} : memref<32x512xf16, #hivm.address_space<ub>>
        func.call @jagged_softmax_backward_kernel_outlined_vf_6(%alloc_4, %16, %alloc_6, %alloc_10) {hivm.vector_function, no_inline} : (memref<32x512xf16, #hivm.address_space<ub>>, memref<512xf32, #hivm.address_space<ub>>, memref<32x512xf16, #hivm.address_space<ub>>, memref<32x512xf16, #hivm.address_space<ub>>) -> ()
        %subview_11 = memref.subview %alloc_10[0, 0] [%25, 512] [1, 1] : memref<32x512xf16, #hivm.address_space<ub>> to memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>
        %subview_12 = memref.subview %reinterpret_cast_9[0, 0] [%25, 512] [1, 1] : memref<32x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_11 : memref<?x512xf16, strided<[512, 1]>, #hivm.address_space<ub>>) outs(%subview_12 : memref<?x512xf16, strided<[?, 1], offset: ?>, #hivm.address_space<gm>>)
      }
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}
