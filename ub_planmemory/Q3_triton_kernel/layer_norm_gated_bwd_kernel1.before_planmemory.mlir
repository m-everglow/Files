#map = affine_map<(d0) -> (d0, 0)>
#map1 = affine_map<(d0) -> (0, d0)>
#map2 = affine_map<()[s0] -> (s0 * 768)>
#map3 = affine_map<()[s0, s1] -> (s0 - s1)>
#map4 = affine_map<()[s0] -> (s0 + 4)>
module attributes {dlti.target_system_spec = #dlti.target_system_spec<"NPU" : #hacc.target_device_spec<#dlti.dl_entry<"AI_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"CUBE_CORE_COUNT", 28 : i32>, #dlti.dl_entry<"VECTOR_CORE_COUNT", 56 : i32>, #dlti.dl_entry<"UB_SIZE", 2031616 : i32>, #dlti.dl_entry<"L1_SIZE", 4194304 : i32>, #dlti.dl_entry<"L0A_SIZE", 524288 : i32>, #dlti.dl_entry<"L0B_SIZE", 524288 : i32>, #dlti.dl_entry<"L0C_SIZE", 2097152 : i32>, #dlti.dl_entry<"UB_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L1_ALIGN_SIZE", 256 : i32>, #dlti.dl_entry<"L0C_ALIGN_SIZE", 4096 : i32>, #dlti.dl_entry<"MINIMAL_D_CACHE_SIZE", 262144 : i32>, #dlti.dl_entry<"MAXIMUM_D_CACHE_SIZE", 983040 : i32>, #dlti.dl_entry<"ARCH", "dav-c310">>>, hacc.target = #hacc.target<"Ascend950PR_9579">, hivm.module_core_type = #hivm.module_core_type<AIV>, ssbuffer.insertionOptimization} {
  func.func @layer_norm_gated_bwd_kernel1_fused_4_outlined_merged_vf_0(%arg0: memref<4x1024xf32, #hivm.address_space<ub>>, %arg1: memref<1024xf32, #hivm.address_space<ub>>, %arg2: memref<4x1024xf32, #hivm.address_space<ub>>, %arg3: memref<1024xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg4 = %c0 to %c1024 step %c64 {
      %subview = memref.subview %arg0[0, %arg4] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_0 = memref.subview %arg0[1, %arg4] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_1 = memref.subview %arg0[2, %arg4] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_2 = memref.subview %arg0[3, %arg4] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      %3 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %4 = arith.addf %0, %2 : vector<1x64xf32>
      %5 = arith.addf %1, %3 : vector<1x64xf32>
      %6 = arith.addf %4, %5 : vector<1x64xf32>
      %7 = vector.shape_cast %6 : vector<1x64xf32> to vector<64xf32>
      %subview_3 = memref.subview %arg1[%arg4] [64] [1] : memref<1024xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %8 = vector.transfer_read %subview_3[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %9 = arith.addf %7, %8 : vector<64xf32>
      vector.transfer_write %9, %subview_3[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    scf.for %arg4 = %c0 to %c1024 step %c64 {
      %subview = memref.subview %arg2[0, %arg4] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_0 = memref.subview %arg2[1, %arg4] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_1 = memref.subview %arg2[2, %arg4] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      %2 = vector.transfer_read %subview_1[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %subview_2 = memref.subview %arg2[3, %arg4] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      %3 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %4 = arith.addf %0, %2 : vector<1x64xf32>
      %5 = arith.addf %1, %3 : vector<1x64xf32>
      %6 = arith.addf %4, %5 : vector<1x64xf32>
      %7 = vector.shape_cast %6 : vector<1x64xf32> to vector<64xf32>
      %subview_3 = memref.subview %arg3[%arg4] [64] [1] : memref<1024xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %8 = vector.transfer_read %subview_3[%c0], %cst {in_bounds = [true]} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<64xf32>
      %9 = arith.addf %7, %8 : vector<64xf32>
      vector.transfer_write %9, %subview_3[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_outlined_merged_vf_0(%arg0: memref<4x1024xf32, #hivm.address_space<ub>>, %arg1: memref<4x1024xf32, #hivm.address_space<ub>>, %arg2: memref<4x1024xf32, #hivm.address_space<ub>>, %arg3: memref<4x1024xf32, #hivm.address_space<ub>>, %arg4: memref<4x1024xf32, #hivm.address_space<ub>>, %arg5: memref<4x1024xf32, #hivm.address_space<ub>>, %arg6: memref<4x1024xf32, #hivm.address_space<ub>>, %arg7: memref<4x1024xf32, #hivm.address_space<ub>>, %arg8: memref<4x1024xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg9 = %c0 to %c4 step %c1 {
      scf.for %arg10 = %c0 to %c1024 step %c64 {
        %subview = memref.subview %arg0[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg4[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.addf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg2[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg3[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_4 = memref.subview %arg5[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %3 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %4 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = arith.addf %3, %4 : vector<1x64xf32>
        vector.transfer_write %5, %subview_4[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg9 = %c0 to %c4 step %c1 {
      scf.for %arg10 = %c0 to %c1024 step %c64 {
        %subview = memref.subview %arg6[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg7[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_1 = memref.subview %arg8[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = arith.mulf %0, %1 : vector<1x64xf32>
        vector.transfer_write %2, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_fused_0_outlined_vf_0(%arg0: memref<4xf32, #hivm.address_space<ub>>, %arg1: memref<4xf32, #hivm.address_space<ub>>, %arg2: memref<4x1024xf32, #hivm.address_space<ub>>, %arg3: memref<4x1024xf32, #hivm.address_space<ub>>, %arg4: memref<4x1024xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg5 = %c0 to %c4 step %c1 {
      %subview = memref.subview %arg0[%arg5] [1] [1] : memref<4xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_0 = memref.subview %arg1[%arg5] [1] [1] : memref<4xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = vector.transfer_read %subview_0[%c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      scf.for %arg6 = %c0 to %c1024 step %c64 {
        %subview_1 = memref.subview %arg3[%arg5, %arg6] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %0, %subview_1[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg2[%arg5, %arg6] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg4[%arg5, %arg6] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %2 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = arith.subf %2, %1 : vector<1x64xf32>
        %4 = arith.mulf %3, %0 : vector<1x64xf32>
        vector.transfer_write %4, %subview_3[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_fused_1_outlined_vf_0(%arg0: memref<4x1024xf32, #hivm.address_space<ub>>, %arg1: memref<4x1024xf32, #hivm.address_space<ub>>, %arg2: memref<4x1024xf32, #hivm.address_space<ub>>, %arg3: memref<4x1024xf32, #hivm.address_space<ub>>, %arg4: memref<4x1024xf32, #hivm.address_space<ub>>, %arg5: memref<4x1024xf32, #hivm.address_space<ub>>, %arg6: memref<1024xf32, #hivm.address_space<ub>>, %arg7: memref<4x1024xf32, #hivm.address_space<ub>>, %arg8: memref<4x1024xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<1.000000e+00> : vector<1x64xf32>
    %cst_0 = arith.constant dense<-1.000000e+00> : vector<1x64xf32>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg9 = %c0 to %c4 step %c1 {
      scf.for %arg10 = %c0 to %c1024 step %c64 {
        %subview = memref.subview %arg0[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg1[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = arith.mulf %0, %cst_0 : vector<1x64xf32>
        %2 = math.exp %1 : vector<1x64xf32>
        %3 = arith.addf %2, %cst : vector<1x64xf32>
        vector.transfer_write %3, %subview_2[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg9 = %c0 to %c4 step %c1 {
      scf.for %arg10 = %c0 to %c1024 step %c64 {
        %subview = memref.subview %arg2[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg0[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg1[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_4 = memref.subview %arg3[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_2[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.transfer_read %subview_3[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = arith.mulf %0, %1 : vector<1x64xf32>
        %4 = arith.divf %3, %2 : vector<1x64xf32>
        vector.transfer_write %4, %subview_4[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    scf.for %arg9 = %c0 to %c4 step %c1 {
      scf.for %arg10 = %c0 to %c1024 step %c64 {
        %subview = memref.subview %arg2[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_2 = memref.subview %arg4[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg5[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_4 = memref.subview %arg6[%arg10] [64] [1] : memref<1024xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_5 = memref.subview %arg1[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_6 = memref.subview %arg0[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_7 = memref.subview %arg7[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %1 = vector.transfer_read %subview_2[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %2 = vector.transfer_read %subview_3[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %3 = vector.transfer_read %subview_4[%c0], %cst_1 {in_bounds = [true, true], permutation_map = #map1} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %4 = vector.transfer_read %subview_5[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = vector.transfer_read %subview_6[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %6 = arith.divf %cst_0, %4 : vector<1x64xf32>
        %7 = arith.addf %6, %cst : vector<1x64xf32>
        %8 = arith.divf %5, %4 : vector<1x64xf32>
        %9 = arith.mulf %8, %7 : vector<1x64xf32>
        %10 = arith.divf %cst, %4 : vector<1x64xf32>
        %11 = arith.addf %10, %9 : vector<1x64xf32>
        %12 = arith.mulf %1, %2 : vector<1x64xf32>
        %13 = arith.addf %12, %3 : vector<1x64xf32>
        %14 = arith.mulf %0, %13 : vector<1x64xf32>
        %15 = arith.mulf %14, %11 : vector<1x64xf32>
        vector.transfer_write %15, %subview_7[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_8 = memref.subview %arg3[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_9 = memref.subview %arg8[%arg9, %arg10] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %16 = vector.transfer_read %subview_8[%c0, %c0], %cst_1 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %17 = arith.mulf %16, %1 : vector<1x64xf32>
        vector.transfer_write %17, %subview_9[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_fused_2_outlined_vf_0(%arg0: memref<4xf32, #hivm.address_space<ub>>, %arg1: memref<4xf32, #hivm.address_space<ub>>, %arg2: memref<4x1024xf32, #hivm.address_space<ub>>, %arg3: memref<4x1024xf32, #hivm.address_space<ub>>, %arg4: memref<4x1024xf32, #hivm.address_space<ub>>, %arg5: memref<4x1024xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.00130208337> : vector<1x64xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg6 = %c0 to %c4 step %c1 {
      %subview = memref.subview %arg0[%arg6] [1] [1] : memref<4xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg1[%arg6] [1] [1] : memref<4xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0 = vector.transfer_read %subview[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %1 = vector.transfer_read %subview_1[%c0], %cst_0 {in_bounds = [true, true], permutation_map = #map} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
      %2 = arith.mulf %1, %cst : vector<1x64xf32>
      %3 = arith.mulf %0, %cst : vector<1x64xf32>
      scf.for %arg7 = %c0 to %c1024 step %c64 {
        %subview_2 = memref.subview %arg2[%arg6, %arg7] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg3[%arg6, %arg7] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_4 = memref.subview %arg4[%arg6, %arg7] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_5 = memref.subview %arg5[%arg6, %arg7] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %4 = vector.transfer_read %subview_2[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %5 = vector.transfer_read %subview_3[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %6 = vector.transfer_read %subview_4[%c0, %c0], %cst_0 {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = arith.mulf %5, %3 : vector<1x64xf32>
        %8 = arith.addf %7, %2 : vector<1x64xf32>
        %9 = arith.subf %4, %8 : vector<1x64xf32>
        %10 = arith.mulf %9, %6 : vector<1x64xf32>
        vector.transfer_write %10, %subview_5[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_fused_3_outlined_vf_1(%arg0: memref<4x1024xf32, #hivm.address_space<ub>>, %arg1: memref<4x1024xf32, #hivm.address_space<ub>>, %arg2: memref<4xf32, #hivm.address_space<ub>>, %arg3: memref<4xf32, #hivm.address_space<ub>>) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg4 = %c0 to %c4 step %c1 {
      %subview = memref.subview %arg2[%arg4] [1] [1] : memref<4xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %subview_1 = memref.subview %arg3[%arg4] [1] [1] : memref<4xf32, #hivm.address_space<ub>> to memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %0:2 = scf.for %arg5 = %c0 to %c1024 step %c64 iter_args(%arg6 = %cst_0, %arg7 = %cst_0) -> (vector<1x64xf32>, vector<1x64xf32>) {
        %subview_2 = memref.subview %arg0[%arg4, %arg5] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_3 = memref.subview %arg1[%arg4, %arg5] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %5 = vector.transfer_read %subview_2[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %6 = vector.transfer_read %subview_3[%c0, %c0], %cst {in_bounds = [true, true]} : memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        %7 = arith.mulf %5, %6 : vector<1x64xf32>
        %8 = arith.addf %7, %arg6 {reductionOp} : vector<1x64xf32>
        %9 = arith.addf %6, %arg7 {reductionOp} : vector<1x64xf32>
        scf.yield %8, %9 : vector<1x64xf32>, vector<1x64xf32>
      } {reductionLoop}
      %1 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true]} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1xf32>
      %2 = vector.multi_reduction <add>, %0#0, %1 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
      vector.transfer_write %2, %subview[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      %3 = vector.transfer_read %subview_1[%c0], %cst {in_bounds = [true]} : memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1xf32>
      %4 = vector.multi_reduction <add>, %0#1, %3 {withoutInitMergeOp} [1] : vector<1x64xf32> to vector<1xf32>
      vector.transfer_write %4, %subview_1[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_outlined_vf_0(%arg0: memref<4x1024xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c4 step %c1 {
      scf.for %arg2 = %c0 to %c1024 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_outlined_vf_1(%arg0: memref<4x1024xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c4 step %c1 {
      scf.for %arg2 = %c0 to %c1024 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_outlined_vf_2(%arg0: memref<4x1024xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c4 step %c1 {
      scf.for %arg2 = %c0 to %c1024 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_outlined_vf_3(%arg0: memref<4xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [4] : vector<64xi1>
    vector.transfer_write %cst, %arg0[%c0], %0 {in_bounds = [true]} : vector<64xf32>, memref<4xf32, #hivm.address_space<ub>>
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_outlined_vf_4(%arg0: memref<4xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [4] : vector<64xi1>
    vector.transfer_write %cst, %arg0[%c0], %0 {in_bounds = [true]} : vector<64xf32>, memref<4xf32, #hivm.address_space<ub>>
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_outlined_vf_6(%arg0: memref<4x1024xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<1x64xf32>
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c4 step %c1 {
      scf.for %arg2 = %c0 to %c1024 step %c64 {
        %subview = memref.subview %arg0[%arg1, %arg2] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_outlined_vf_7(%arg0: memref<1024xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c1024 step %c64 {
      %subview = memref.subview %arg0[%arg1] [64] [1] : memref<1024xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_outlined_vf_8(%arg0: memref<1024xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c1024 step %c64 {
      %subview = memref.subview %arg0[%arg1] [64] [1] : memref<1024xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_outlined_vf_9(%arg0: memref<1024xf32, #hivm.address_space<ub>>, %arg1: memref<4x1024xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg2 = %c0 to %c4 step %c1 {
      scf.for %arg3 = %c0 to %c1024 step %c64 {
        %subview = memref.subview %arg0[%arg3] [64] [1] : memref<1024xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %subview_0 = memref.subview %arg1[%arg2, %arg3] [1, 64] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %0 = vector.transfer_read %subview[%c0], %cst {in_bounds = [true, true], permutation_map = #map1} : memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>, vector<1x64xf32>
        vector.transfer_write %0, %subview_0[%c0, %c0] {in_bounds = [true, true]} : vector<1x64xf32>, memref<1x64xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
      }
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1_outlined_vf_10(%arg0: memref<1024xf32, #hivm.address_space<ub>>) attributes {hfusion.has_fill, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vector_function, no_inline} {
    %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
    %c64 = arith.constant 64 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    scf.for %arg1 = %c0 to %c1024 step %c64 {
      %subview = memref.subview %arg0[%arg1] [64] [1] : memref<1024xf32, #hivm.address_space<ub>> to memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
      vector.transfer_write %cst, %subview[%c0] {in_bounds = [true]} : vector<64xf32>, memref<64xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
    }
    return
  }
  func.func @layer_norm_gated_bwd_kernel1(%arg0: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<sync_block_lock>}, %arg1: memref<?xi8, #hivm.address_space<gm>> {hacc.arg_type = #hacc.arg_type<workspace>}, %arg2: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg3: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg4: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg5: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg6: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg7: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg8: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg9: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg10: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 1 : i32}, %arg11: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg12: memref<?xf32, #hivm.address_space<gm>> {tt.tensor_kind = 0 : i32}, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32) attributes {SyncBlockLockArgIdx = 0 : i64, WorkspaceArgIdx = 1 : i64, func_dyn_memref_args = dense<[true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false]> : vector<18xi1>, hacc.entry, hacc.function_kind = #hacc.function_kind<DEVICE>, hivm.func_core_type = #hivm.func_core_type<AIV>, hivm.vf_mode = #hivm.vf_mode<SIMD>, mix_mode = "aiv", parallel_mode = "simd"} {
    %c8 = arith.constant 8 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c0_i32 = arith.constant 0 : i32
    %c768_i32 = arith.constant 768 : i32
    %c4 = arith.constant 4 : index
    %c4_i32 = arith.constant 4 : i32
    %c0 = arith.constant 0 : index
    %c56_i32 = arith.constant 56 : i32
    %0 = arith.muli %arg15, %arg16 : i32
    %1 = arith.muli %0, %arg17 : i32
    annotation.mark %1 {logical_block_num} : i32
    %2 = hivm.hir.get_block_idx -> i64
    %3 = arith.trunci %2 : i64 to i32
    %reinterpret_cast = memref.reinterpret_cast %arg4 to offset: [0], sizes: [1024], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<1024xf32, strided<[1]>, #hivm.address_space<gm>>
    %subview = memref.subview %reinterpret_cast[0] [768] [1] : memref<1024xf32, strided<[1]>, #hivm.address_space<gm>> to memref<768xf32, #hivm.address_space<gm>>
    %reinterpret_cast_0 = memref.reinterpret_cast %arg5 to offset: [0], sizes: [1024], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<1024xf32, strided<[1]>, #hivm.address_space<gm>>
    %subview_1 = memref.subview %reinterpret_cast_0[0] [768] [1] : memref<1024xf32, strided<[1]>, #hivm.address_space<gm>> to memref<768xf32, #hivm.address_space<gm>>
    %4 = arith.index_cast %arg13 : i32 to index
    scf.for %arg18 = %3 to %1 step %c56_i32  : i32 {
      hivm.hir.set_ctrl false at ctrl[60]
      hivm.hir.set_ctrl true at ctrl[48]
      %5 = arith.remsi %arg18, %arg15 : i32
      %alloc = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
      func.call @layer_norm_gated_bwd_kernel1_outlined_vf_6(%alloc) {hivm.vector_function, no_inline} : (memref<4x1024xf32, #hivm.address_space<ub>>) -> ()
      %alloc_2 = memref.alloc() : memref<1024xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_2 {hivm.multi_buffer = 2 : i32} : memref<1024xf32, #hivm.address_space<ub>>
      func.call @layer_norm_gated_bwd_kernel1_outlined_vf_7(%alloc_2) {hivm.vector_function, no_inline} : (memref<1024xf32, #hivm.address_space<ub>>) -> ()
      %subview_3 = memref.subview %alloc_2[0] [768] [1] : memref<1024xf32, #hivm.address_space<ub>> to memref<768xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%subview : memref<768xf32, #hivm.address_space<gm>>) outs(%subview_3 : memref<768xf32, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 eviction_policy = <EvictFirst> core_type = <VECTOR>
      %alloc_4 = memref.alloc() : memref<1024xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_4 {hivm.multi_buffer = 2 : i32} : memref<1024xf32, #hivm.address_space<ub>>
      func.call @layer_norm_gated_bwd_kernel1_outlined_vf_8(%alloc_4) {hivm.vector_function, no_inline} : (memref<1024xf32, #hivm.address_space<ub>>) -> ()
      %subview_5 = memref.subview %alloc_4[0] [768] [1] : memref<1024xf32, #hivm.address_space<ub>> to memref<768xf32, #hivm.address_space<ub>>
      hivm.hir.load ins(%subview_1 : memref<768xf32, #hivm.address_space<gm>>) outs(%subview_5 : memref<768xf32, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 eviction_policy = <EvictFirst> core_type = <VECTOR>
      %6 = arith.muli %5, %arg14 : i32
      %7 = arith.addi %6, %arg14 : i32
      %alloc_6 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
      func.call @layer_norm_gated_bwd_kernel1_outlined_vf_9(%alloc_2, %alloc_6) {hivm.vector_function, no_inline} : (memref<1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>) -> ()
      %8 = arith.minsi %7, %arg13 : i32
      %9 = arith.index_cast %8 : i32 to index
      %alloc_7 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
      %collapse_shape = memref.collapse_shape %alloc [[0, 1]] : memref<4x1024xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
      %collapse_shape_8 = memref.collapse_shape %alloc_7 [[0, 1]] : memref<4x1024xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%collapse_shape : memref<4096xf32, #hivm.address_space<ub>>) outs(%collapse_shape_8 : memref<4096xf32, #hivm.address_space<ub>>)
      %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
      %collapse_shape_10 = memref.collapse_shape %alloc_9 [[0, 1]] : memref<4x1024xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%collapse_shape : memref<4096xf32, #hivm.address_space<ub>>) outs(%collapse_shape_10 : memref<4096xf32, #hivm.address_space<ub>>)
      %10:2 = scf.for %arg19 = %6 to %7 step %c4_i32 iter_args(%arg20 = %alloc_7, %arg21 = %alloc_9) -> (memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>)  : i32 {
        %13 = arith.maxsi %arg19, %c0_i32 : i32
        %14 = arith.index_cast %13 : i32 to index
        %15 = affine.apply #map2()[%14]
        %reinterpret_cast_20 = memref.reinterpret_cast %arg2 to offset: [%15], sizes: [4, 1024], strides: [768, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<4x1024xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_21 = memref.reinterpret_cast %arg3 to offset: [%15], sizes: [4, 1024], strides: [768, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<4x1024xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_22 = memref.reinterpret_cast %arg6 to offset: [%15], sizes: [4, 1024], strides: [768, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<4x1024xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_23 = memref.reinterpret_cast %arg7 to offset: [%15], sizes: [4, 1024], strides: [768, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<4x1024xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>
        %reinterpret_cast_24 = memref.reinterpret_cast %arg8 to offset: [%15], sizes: [4, 1024], strides: [768, 1] : memref<?xf32, #hivm.address_space<gm>> to memref<4x1024xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>
        %alloc_25 = memref.alloc() : memref<4x1024xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_25 {hivm.multi_buffer = 2 : i32} : memref<4x1024xf32, #hivm.address_space<ub>>
        %16 = affine.apply #map3()[%4, %14]
        %17 = arith.maxsi %16, %c0 : index
        %18 = arith.minsi %17, %c4 : index
        %19 = arith.subi %c0_i32, %arg19 : i32
        %20 = arith.maxsi %19, %c0_i32 : i32
        %21 = arith.index_cast %20 : i32 to index
        %22 = arith.minsi %21, %18 : index
        %23 = affine.apply #map3()[%18, %22]
        func.call @layer_norm_gated_bwd_kernel1_outlined_vf_0(%alloc_25) {hivm.vector_function, no_inline} : (memref<4x1024xf32, #hivm.address_space<ub>>) -> ()
        %subview_26 = memref.subview %reinterpret_cast_20[0, 0] [%23, 768] [1, 1] : memref<4x1024xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x768xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_27 = memref.subview %alloc_25[%22, 0] [%23, 768] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<?x768xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview_26 : memref<?x768xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_27 : memref<?x768xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %alloc_28 = memref.alloc() : memref<4x1024xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_28 {hivm.multi_buffer = 2 : i32} : memref<4x1024xf32, #hivm.address_space<ub>>
        func.call @layer_norm_gated_bwd_kernel1_outlined_vf_1(%alloc_28) {hivm.vector_function, no_inline} : (memref<4x1024xf32, #hivm.address_space<ub>>) -> ()
        %subview_29 = memref.subview %reinterpret_cast_21[0, 0] [%23, 768] [1, 1] : memref<4x1024xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x768xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_30 = memref.subview %alloc_28[%22, 0] [%23, 768] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<?x768xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview_29 : memref<?x768xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_30 : memref<?x768xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %alloc_31 = memref.alloc() : memref<4x1024xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_31 {hivm.multi_buffer = 2 : i32} : memref<4x1024xf32, #hivm.address_space<ub>>
        func.call @layer_norm_gated_bwd_kernel1_outlined_vf_2(%alloc_31) {hivm.vector_function, no_inline} : (memref<4x1024xf32, #hivm.address_space<ub>>) -> ()
        %subview_32 = memref.subview %reinterpret_cast_22[0, 0] [%23, 768] [1, 1] : memref<4x1024xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x768xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>
        %subview_33 = memref.subview %alloc_31[%22, 0] [%23, 768] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<?x768xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview_32 : memref<?x768xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_33 : memref<?x768xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 eviction_policy = <EvictFirst> core_type = <VECTOR>
        %reinterpret_cast_34 = memref.reinterpret_cast %arg11 to offset: [%14], sizes: [4], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<4xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %alloc_35 = memref.alloc() : memref<4xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_35 {hivm.multi_buffer = 2 : i32} : memref<4xf32, #hivm.address_space<ub>>
        %24 = arith.cmpi slt, %23, %c4 : index
        scf.if %24 {
          func.call @layer_norm_gated_bwd_kernel1_outlined_vf_3(%alloc_35) {hivm.vector_function, no_inline} : (memref<4xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview_36 = memref.subview %reinterpret_cast_34[0] [%23] [1] : memref<4xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %subview_37 = memref.subview %alloc_35[%22] [%23] [1] : memref<4xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        %25 = arith.remui %22, %c8 : index
        hivm.hir.load ins(%subview_36 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_37 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %25 : index eviction_policy = <EvictFirst> core_type = <VECTOR>
        %reinterpret_cast_38 = memref.reinterpret_cast %arg12 to offset: [%14], sizes: [4], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<4xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %alloc_39 = memref.alloc() : memref<4xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_39 {hivm.multi_buffer = 2 : i32} : memref<4xf32, #hivm.address_space<ub>>
        scf.if %24 {
          func.call @layer_norm_gated_bwd_kernel1_outlined_vf_4(%alloc_39) {hivm.vector_function, no_inline} : (memref<4xf32, #hivm.address_space<ub>>) -> ()
        } {hivm.unlikely_condition}
        %subview_40 = memref.subview %reinterpret_cast_38[0] [%23] [1] : memref<4xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
        %subview_41 = memref.subview %alloc_39[%22] [%23] [1] : memref<4xf32, #hivm.address_space<ub>> to memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>
        hivm.hir.load ins(%subview_40 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>) outs(%subview_41 : memref<?xf32, strided<[1], offset: ?>, #hivm.address_space<ub>>) pad_mode = <PadValue> pad_value = %cst : f32 left_padding_num = %25 : index eviction_policy = <EvictFirst> core_type = <VECTOR>
        %alloc_42 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        %alloc_43 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        func.call @layer_norm_gated_bwd_kernel1_fused_0_outlined_vf_0(%alloc_39, %alloc_35, %alloc_25, %alloc_42, %alloc_43) {hivm.vector_function, no_inline} : (memref<4xf32, #hivm.address_space<ub>>, memref<4xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>) -> ()
        %subview_44 = memref.subview %alloc_43[0, 0] [4, 768] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<4x768xf32, strided<[1024, 1]>, #hivm.address_space<ub>>
        %alloc_45 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        %collapse_shape_46 = memref.collapse_shape %alloc_45 [[0, 1]] : memref<4x1024xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%collapse_shape : memref<4096xf32, #hivm.address_space<ub>>) outs(%collapse_shape_46 : memref<4096xf32, #hivm.address_space<ub>>)
        %subview_47 = memref.subview %alloc_45[0, 0] [4, 768] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<4x768xf32, strided<[1024, 1]>, #hivm.address_space<ub>>
        hivm.hir.copy ins(%subview_44 : memref<4x768xf32, strided<[1024, 1]>, #hivm.address_space<ub>>) outs(%subview_47 : memref<4x768xf32, strided<[1024, 1]>, #hivm.address_space<ub>>)
        %alloc_48 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        %alloc_49 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        %alloc_50 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_50 {hivm.multi_buffer = 2 : i32} : memref<4x1024xf32, #hivm.address_space<ub>>
        %alloc_51 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        func.call @layer_norm_gated_bwd_kernel1_fused_1_outlined_vf_0(%alloc_28, %alloc_48, %alloc_31, %alloc_49, %alloc_45, %alloc_6, %alloc_4, %alloc_50, %alloc_51) {hivm.vector_function, no_inline} : (memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>) -> ()
        %26 = arith.index_cast %arg19 : i32 to index
        %27 = affine.apply #map4()[%26]
        %28 = arith.maxsi %26, %9 : index
        %29 = arith.minsi %27, %28 : index
        %30 = affine.apply #map3()[%29, %26]
        %subview_52 = memref.subview %alloc_51[0, 0] [%30, 1024] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<?x1024xf32, strided<[1024, 1]>, #hivm.address_space<ub>>
        %alloc_53 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        %collapse_shape_54 = memref.collapse_shape %alloc_53 [[0, 1]] : memref<4x1024xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%collapse_shape : memref<4096xf32, #hivm.address_space<ub>>) outs(%collapse_shape_54 : memref<4096xf32, #hivm.address_space<ub>>)
        %subview_55 = memref.subview %alloc_53[0, 0] [%30, 1024] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<?x1024xf32, strided<[1024, 1]>, #hivm.address_space<ub>>
        %collapse_shape_56 = memref.collapse_shape %subview_52 [[0, 1]] : memref<?x1024xf32, strided<[1024, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        %collapse_shape_57 = memref.collapse_shape %subview_55 [[0, 1]] : memref<?x1024xf32, strided<[1024, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        hivm.hir.copy ins(%collapse_shape_56 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_57 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
        %subview_58 = memref.subview %alloc_49[0, 0] [%30, 1024] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<?x1024xf32, strided<[1024, 1]>, #hivm.address_space<ub>>
        %alloc_59 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        %collapse_shape_60 = memref.collapse_shape %alloc_59 [[0, 1]] : memref<4x1024xf32, #hivm.address_space<ub>> into memref<4096xf32, #hivm.address_space<ub>>
        hivm.hir.copy ins(%collapse_shape : memref<4096xf32, #hivm.address_space<ub>>) outs(%collapse_shape_60 : memref<4096xf32, #hivm.address_space<ub>>)
        %subview_61 = memref.subview %alloc_59[0, 0] [%30, 1024] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<?x1024xf32, strided<[1024, 1]>, #hivm.address_space<ub>>
        %collapse_shape_62 = memref.collapse_shape %subview_58 [[0, 1]] : memref<?x1024xf32, strided<[1024, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        %collapse_shape_63 = memref.collapse_shape %subview_61 [[0, 1]] : memref<?x1024xf32, strided<[1024, 1]>, #hivm.address_space<ub>> into memref<?xf32, strided<[1]>, #hivm.address_space<ub>>
        hivm.hir.copy ins(%collapse_shape_62 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%collapse_shape_63 : memref<?xf32, strided<[1]>, #hivm.address_space<ub>>)
        %alloc_64 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        %alloc_65 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        %alloc_66 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        func.call @layer_norm_gated_bwd_kernel1_outlined_merged_vf_0(%arg20, %alloc_53, %arg21, %alloc_59, %alloc_64, %alloc_65, %alloc_49, %alloc_6, %alloc_66) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>) -> ()
        %alloc_67 = memref.alloc() {alignment = 64 : i64} : memref<4xf32, #hivm.address_space<ub>>
        %alloc_68 = memref.alloc() {alignment = 64 : i64} : memref<4xf32, #hivm.address_space<ub>>
        func.call @layer_norm_gated_bwd_kernel1_fused_3_outlined_vf_1(%alloc_45, %alloc_66, %alloc_67, %alloc_68) {hivm.vector_function, no_inline} : (memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4xf32, #hivm.address_space<ub>>, memref<4xf32, #hivm.address_space<ub>>) -> ()
        %alloc_69 = memref.alloc() {alignment = 64 : i64} : memref<4x1024xf32, #hivm.address_space<ub>>
        annotation.mark %alloc_69 {hivm.multi_buffer = 2 : i32} : memref<4x1024xf32, #hivm.address_space<ub>>
        func.call @layer_norm_gated_bwd_kernel1_fused_2_outlined_vf_0(%alloc_67, %alloc_68, %alloc_66, %alloc_45, %alloc_42, %alloc_69) {hivm.vector_function, no_inline} : (memref<4xf32, #hivm.address_space<ub>>, memref<4xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>) -> ()
        %subview_70 = memref.subview %alloc_69[%22, 0] [%23, 768] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<?x768xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_71 = memref.subview %reinterpret_cast_23[0, 0] [%23, 768] [1, 1] : memref<4x1024xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x768xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_70 : memref<?x768xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_71 : memref<?x768xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>)
        %subview_72 = memref.subview %alloc_50[%22, 0] [%23, 768] [1, 1] : memref<4x1024xf32, #hivm.address_space<ub>> to memref<?x768xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>
        %subview_73 = memref.subview %reinterpret_cast_24[0, 0] [%23, 768] [1, 1] : memref<4x1024xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>> to memref<?x768xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>
        hivm.hir.store ins(%subview_72 : memref<?x768xf32, strided<[1024, 1], offset: ?>, #hivm.address_space<ub>>) outs(%subview_73 : memref<?x768xf32, strided<[768, 1], offset: ?>, #hivm.address_space<gm>>)
        scf.yield %alloc_64, %alloc_65 : memref<4x1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>
      }
      %11 = arith.muli %5, %c768_i32 : i32
      %12 = arith.index_cast %11 : i32 to index
      %reinterpret_cast_11 = memref.reinterpret_cast %arg9 to offset: [%12], sizes: [1024], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<1024xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %alloc_12 = memref.alloc() {alignment = 64 : i64} : memref<1024xf32, #hivm.address_space<ub>>
      func.call @layer_norm_gated_bwd_kernel1_outlined_vf_10(%alloc_12) {hivm.vector_function, no_inline} : (memref<1024xf32, #hivm.address_space<ub>>) -> ()
      %alloc_13 = memref.alloc() {alignment = 64 : i64} : memref<1024xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_13 {hivm.multi_buffer = 2 : i32} : memref<1024xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc_12 : memref<1024xf32, #hivm.address_space<ub>>) outs(%alloc_13 : memref<1024xf32, #hivm.address_space<ub>>)
      %alloc_14 = memref.alloc() {alignment = 64 : i64} : memref<1024xf32, #hivm.address_space<ub>>
      annotation.mark %alloc_14 {hivm.multi_buffer = 2 : i32} : memref<1024xf32, #hivm.address_space<ub>>
      hivm.hir.copy ins(%alloc_12 : memref<1024xf32, #hivm.address_space<ub>>) outs(%alloc_14 : memref<1024xf32, #hivm.address_space<ub>>)
      func.call @layer_norm_gated_bwd_kernel1_fused_4_outlined_merged_vf_0(%10#0, %alloc_13, %10#1, %alloc_14) {hivm.vector_function, no_inline, ptc_simdvf} : (memref<4x1024xf32, #hivm.address_space<ub>>, memref<1024xf32, #hivm.address_space<ub>>, memref<4x1024xf32, #hivm.address_space<ub>>, memref<1024xf32, #hivm.address_space<ub>>) -> ()
      %subview_15 = memref.subview %alloc_13[0] [768] [1] : memref<1024xf32, #hivm.address_space<ub>> to memref<768xf32, strided<[1]>, #hivm.address_space<ub>>
      %subview_16 = memref.subview %reinterpret_cast_11[0] [768] [1] : memref<1024xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<768xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_15 : memref<768xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%subview_16 : memref<768xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>)
      %reinterpret_cast_17 = memref.reinterpret_cast %arg10 to offset: [%12], sizes: [1024], strides: [1] : memref<?xf32, #hivm.address_space<gm>> to memref<1024xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      %subview_18 = memref.subview %alloc_14[0] [768] [1] : memref<1024xf32, #hivm.address_space<ub>> to memref<768xf32, strided<[1]>, #hivm.address_space<ub>>
      %subview_19 = memref.subview %reinterpret_cast_17[0] [768] [1] : memref<1024xf32, strided<[1], offset: ?>, #hivm.address_space<gm>> to memref<768xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>
      hivm.hir.store ins(%subview_18 : memref<768xf32, strided<[1]>, #hivm.address_space<ub>>) outs(%subview_19 : memref<768xf32, strided<[1], offset: ?>, #hivm.address_space<gm>>)
      hivm.hir.set_ctrl true at ctrl[60]
    } {autoblockify.subloop}
    return
  }
}
