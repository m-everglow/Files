; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

; Function Attrs: noduplicate noinline willreturn
define internal ptc_simdvf void @fwd_kernel_mix_aiv_outlined_merged_vf_1(ptr addrspace(6) noalias %0, ptr addrspace(6) noalias %1, ptr addrspace(6) noalias %2, ptr addrspace(6) noalias %3, ptr addrspace(6) noalias %4, ptr addrspace(6) noalias %5) #0 {
  %7 = call <256 x i1> @llvm.hivm.pge.b32(i32 12, i32 0)
  %8 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %0, i32 0, i32 0, i32 0)
  %9 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %1, i32 0, i32 0, i32 0)
  %10 = call <64 x float> @llvm.hivm.vln.x.v64f32(<64 x float> %9, <256 x i1> %7)
  %11 = call <64 x float> @llvm.hivm.vadd.s.x.v64f32(<64 x float> %8, <64 x float> %10, <256 x i1> %7)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %11, ptr addrspace(6) %2, i32 0, i32 2, i32 0, <256 x i1> %7)
  br label %12

12:                                               ; preds = %15, %6
  %13 = phi i32 [ %30, %15 ], [ 0, %6 ]
  %14 = icmp slt i32 %13, 32
  br i1 %14, label %15, label %31

15:                                               ; preds = %12
  %16 = sext i32 %13 to i64
  %17 = mul i64 %16, 64
  %18 = getelementptr float, ptr addrspace(6) %4, i64 %17
  %19 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %18, i32 0, i32 0, i32 0)
  %20 = getelementptr float, ptr addrspace(6) %3, i64 %16
  %21 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %20, i32 0, i32 3, i32 0)
  %22 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %23 = call <64 x float> @llvm.hivm.vdiv.s.x.v64f32(<64 x float> %19, <64 x float> %21, <256 x i1> %22)
  %24 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %25 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %23, <256 x i1> %24, i32 0, i32 0, i32 0)
  %26 = mul i64 %16, 64
  %27 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %28 = bitcast <128 x bfloat> %25 to <64 x float>
  %29 = getelementptr bfloat, ptr addrspace(6) %5, i64 %26
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %28, ptr addrspace(6) %29, i32 0, i32 7, i32 0, <256 x i1> %27)
  %30 = add nsw i32 %13, 1
  br label %12

31:                                               ; preds = %12
  ret void
}

; Function Attrs: noduplicate noinline willreturn
define internal ptc_simdvf void @fwd_kernel_mix_aiv_outlined_merged_vf_0(ptr addrspace(6) noalias %0, ptr addrspace(6) noalias %1, ptr addrspace(6) noalias %2, ptr addrspace(6) noalias %3, ptr addrspace(6) noalias %4, ptr addrspace(6) noalias %5, ptr addrspace(6) noalias %6) #0 {
  %8 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %9 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %8, i32 1)
  %10 = call <256 x i1> @llvm.hivm.pge.b32(i32 12, i32 0)
  %11 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %0, i32 0, i32 0, i32 0)
  %12 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %1, i32 0, i32 0, i32 0)
  %13 = call <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float> %11, <64 x float> %12, <256 x i1> %10)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %13, ptr addrspace(6) %2, i32 0, i32 2, i32 0, <256 x i1> %10)
  %14 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  br label %15

15:                                               ; preds = %20, %7
  %16 = phi i32 [ %45, %20 ], [ 0, %7 ]
  %17 = phi <32 x i8> [ %35, %20 ], [ %14, %7 ]
  %18 = phi ptr addrspace(6) [ %36, %20 ], [ undef, %7 ]
  %19 = icmp slt i32 %16, 32
  br i1 %19, label %20, label %46

20:                                               ; preds = %15
  %21 = sext i32 %16 to i64
  %22 = mul i64 %21, 32
  %23 = getelementptr float, ptr addrspace(6) %3, i64 %22
  %24 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %23, i32 0, i32 0, i32 0)
  %25 = getelementptr float, ptr addrspace(6) %4, i64 %21
  %26 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %25, i32 0, i32 3, i32 0)
  %27 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %28 = call <64 x float> @llvm.hivm.vexpdif.v64f32(<64 x float> %24, <64 x float> %26, <256 x i1> %27, i32 0)
  %29 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %28, <64 x float> %9, <256 x i1> %10)
  %30 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %31 = call <64 x float> @llvm.hivm.vcadd.s.x.v64f32.v64f32(<64 x float> %29, <256 x i1> %30)
  %32 = call <256 x i1> @llvm.hivm.pge.b32(i32 1, i32 0)
  %33 = getelementptr float, ptr addrspace(6) %5, i64 %21
  %34 = call { <32 x i8>, ptr addrspace(6) } @llvm.hivm.vstus.post.f32(<64 x float> %31, ptr addrspace(6) %33, i32 4, <32 x i8> %17)
  %35 = extractvalue { <32 x i8>, ptr addrspace(6) } %34, 0
  %36 = extractvalue { <32 x i8>, ptr addrspace(6) } %34, 1
  %37 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %38 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %28, <256 x i1> %37, i32 0, i32 0, i32 0)
  %39 = mul i64 %21, 16
  %40 = call <256 x i1> @llvm.hivm.pge.b16(i32 7, i32 0)
  %41 = call { <128 x bfloat>, <128 x bfloat> } @llvm.hivm.vdintlv.v128bf16(<128 x bfloat> %38, <128 x bfloat> %38)
  %42 = extractvalue { <128 x bfloat>, <128 x bfloat> } %41, 0
  %43 = getelementptr bfloat, ptr addrspace(6) %6, i64 %39
  %44 = getelementptr bfloat, ptr addrspace(6) %43, i64 0
  call void @llvm.hivm.vsstb.v128bf16(<128 x bfloat> %42, ptr addrspace(6) %44, i32 2162688, i32 0, <256 x i1> %40)
  %45 = add nsw i32 %16, 1
  br label %15

46:                                               ; preds = %15
  call void @llvm.hivm.vstas(<32 x i8> %17, ptr addrspace(6) %18, i32 0, i32 0)
  ret void
}

; Function Attrs: noduplicate noinline willreturn
define internal ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_0(ptr addrspace(6) noalias %0) #0 {
  %2 = call <256 x i1> @llvm.hivm.pge.b8(i32 0, i32 0)
  %3 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %2, i32 1)
  br label %4

4:                                                ; preds = %7, %1
  %5 = phi i32 [ %12, %7 ], [ 0, %1 ]
  %6 = icmp slt i32 %5, 32
  br i1 %6, label %7, label %13

7:                                                ; preds = %4
  %8 = sext i32 %5 to i64
  %9 = call <256 x i1> @llvm.hivm.pge.b8(i32 7, i32 0)
  %10 = mul i64 %8, 32
  %11 = getelementptr i8, ptr addrspace(6) %0, i64 %10
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %3, ptr addrspace(6) %11, i32 0, i32 0, i32 0, <256 x i1> %9)
  %12 = add nsw i32 %5, 1
  br label %4

13:                                               ; preds = %4
  ret void
}

; Function Attrs: noduplicate noinline willreturn
define internal ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_1(ptr addrspace(6) noalias %0, ptr addrspace(6) noalias %1, float %2, ptr addrspace(6) noalias %3) #0 {
  %5 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %6 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xC1D0000000000000, <256 x i1> %5, i32 1)
  %7 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %8 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %7, i32 1)
  %9 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %10 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %9, i32 1)
  br label %11

11:                                               ; preds = %14, %4
  %12 = phi i32 [ %29, %14 ], [ 0, %4 ]
  %13 = icmp slt i32 %12, 32
  br i1 %13, label %14, label %30

14:                                               ; preds = %11
  %15 = sext i32 %12 to i64
  %16 = call <256 x i1> @llvm.hivm.pge.b32(i32 12, i32 0)
  %17 = mul i64 %15, 32
  %18 = getelementptr float, ptr addrspace(6) %0, i64 %17
  %19 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %18, i32 0, i32 0, i32 0)
  %20 = mul i64 %15, 32
  %21 = getelementptr i8, ptr addrspace(6) %1, i64 %20
  %22 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) %21, i32 0, i32 20, i32 0)
  %23 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.v256i8(<256 x i8> %22, <256 x i8> %10, <256 x i1> %16)
  %24 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %8, <64 x float> %6, <256 x i1> %23)
  %25 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %19, float %2, <256 x i1> %16)
  %26 = call <64 x float> @llvm.hivm.vadd.s.x.v64f32(<64 x float> %25, <64 x float> %24, <256 x i1> %16)
  %27 = mul i64 %15, 32
  %28 = getelementptr float, ptr addrspace(6) %3, i64 %27
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %26, ptr addrspace(6) %28, i32 0, i32 2, i32 0, <256 x i1> %16)
  %29 = add nsw i32 %12, 1
  br label %11

30:                                               ; preds = %11
  ret void
}

; Function Attrs: noduplicate noinline willreturn
define internal ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_2(ptr addrspace(6) noalias %0) #0 {
  %2 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %3 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xFFF0000000000000, <256 x i1> %2, i32 1)
  %4 = call <256 x i1> @llvm.hivm.pge.b32(i32 12, i32 0)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %3, ptr addrspace(6) %0, i32 0, i32 2, i32 0, <256 x i1> %4)
  ret void
}

; Function Attrs: noduplicate noinline willreturn
define internal ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_3(ptr addrspace(6) noalias %0, ptr addrspace(6) noalias %1, ptr addrspace(6) noalias %2, ptr addrspace(6) noalias %3) #0 {
  %5 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %6 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xFFF0000000000000, <256 x i1> %5, i32 1)
  %7 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %8 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %7, i32 1)
  %9 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %10 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 2147483647, <256 x i1> %9, i32 1)
  %11 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  br label %12

12:                                               ; preds = %17, %4
  %13 = phi i32 [ %43, %17 ], [ 0, %4 ]
  %14 = phi <32 x i8> [ %41, %17 ], [ %11, %4 ]
  %15 = phi ptr addrspace(6) [ %42, %17 ], [ undef, %4 ]
  %16 = icmp slt i32 %13, 32
  br i1 %16, label %17, label %44

17:                                               ; preds = %12
  %18 = sext i32 %13 to i64
  %19 = call <256 x i1> @llvm.hivm.pge.b32(i32 12, i32 0)
  %20 = mul i64 %18, 32
  %21 = getelementptr float, ptr addrspace(6) %0, i64 %20
  %22 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %21, i32 0, i32 0, i32 0)
  %23 = bitcast <64 x float> %22 to <64 x i32>
  %24 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %25 = call <64 x i32> @llvm.hivm.vand.x.v64i32(<64 x i32> %23, <64 x i32> %10, <256 x i1> %24)
  %26 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %27 = call <64 x i32> @llvm.hivm.vadds.s.x.v64i32(<64 x i32> %25, i32 -2139095040, <256 x i1> %26)
  %28 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %29 = call <64 x i32> @llvm.hivm.vmins.s.x.v64i32(<64 x i32> %27, i32 1, <256 x i1> %28)
  %30 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %31 = call <64 x i32> @llvm.hivm.vmaxs.s.x.v64i32(<64 x i32> %29, i32 0, <256 x i1> %30)
  %32 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %33 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.v64i32(<64 x i32> %31, <64 x i32> %8, <256 x i1> %32)
  %34 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %6, <64 x float> %22, <256 x i1> %33)
  %35 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %34, <64 x float> %6, <256 x i1> %19)
  %36 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %37 = call <64 x float> @llvm.hivm.vcmax.s.x.v64f32(<64 x float> %35, <256 x i1> %36)
  %38 = call <256 x i1> @llvm.hivm.pge.b32(i32 1, i32 0)
  %39 = getelementptr float, ptr addrspace(6) %1, i64 %18
  %40 = call { <32 x i8>, ptr addrspace(6) } @llvm.hivm.vstus.post.f32(<64 x float> %37, ptr addrspace(6) %39, i32 4, <32 x i8> %14)
  %41 = extractvalue { <32 x i8>, ptr addrspace(6) } %40, 0
  %42 = extractvalue { <32 x i8>, ptr addrspace(6) } %40, 1
  %43 = add nsw i32 %13, 1
  br label %12

44:                                               ; preds = %12
  call void @llvm.hivm.vstas(<32 x i8> %14, ptr addrspace(6) %15, i32 0, i32 0)
  %45 = call <256 x i1> @llvm.hivm.pge.b32(i32 12, i32 0)
  %46 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %2, i32 0, i32 0, i32 0)
  %47 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %1, i32 0, i32 0, i32 0)
  %48 = call <64 x float> @llvm.hivm.vmax.s.x.v64f32(<64 x float> %46, <64 x float> %47, <256 x i1> %45)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %48, ptr addrspace(6) %3, i32 0, i32 2, i32 0, <256 x i1> %45)
  ret void
}

; Function Attrs: noduplicate noinline willreturn
define internal ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_6(ptr addrspace(6) noalias %0, ptr addrspace(6) noalias %1, ptr addrspace(6) noalias %2, ptr addrspace(6) noalias %3, ptr addrspace(6) noalias %4, ptr addrspace(6) noalias %5, ptr addrspace(6) noalias %6, ptr addrspace(6) noalias %7) #0 {
  %9 = call <256 x i1> @llvm.hivm.pge.b32(i32 12, i32 0)
  %10 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %0, i32 0, i32 0, i32 0)
  %11 = call <64 x float> @llvm.hivm.vexp.x.v64f32(<64 x float> %10, <256 x i1> %9)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %11, ptr addrspace(6) %1, i32 0, i32 2, i32 0, <256 x i1> %9)
  br label %12

12:                                               ; preds = %15, %8
  %13 = phi i32 [ %32, %15 ], [ 0, %8 ]
  %14 = icmp slt i32 %13, 32
  br i1 %14, label %15, label %33

15:                                               ; preds = %12
  %16 = sext i32 %13 to i64
  %17 = mul i64 %16, 64
  %18 = getelementptr float, ptr addrspace(6) %2, i64 %17
  %19 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %18, i32 0, i32 0, i32 0)
  %20 = mul i64 %16, 64
  %21 = getelementptr float, ptr addrspace(6) %3, i64 %20
  %22 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %21, i32 0, i32 0, i32 0)
  %23 = getelementptr float, ptr addrspace(6) %1, i64 %16
  %24 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %23, i32 0, i32 3, i32 0)
  %25 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %26 = call <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float> %22, <64 x float> %24, <256 x i1> %25)
  %27 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %28 = call <64 x float> @llvm.hivm.vadd.s.x.v64f32(<64 x float> %19, <64 x float> %26, <256 x i1> %27)
  %29 = mul i64 %16, 64
  %30 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %31 = getelementptr float, ptr addrspace(6) %4, i64 %29
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %28, ptr addrspace(6) %31, i32 0, i32 2, i32 0, <256 x i1> %30)
  %32 = add nsw i32 %13, 1
  br label %12

33:                                               ; preds = %12
  %34 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %5, i32 0, i32 0, i32 0)
  %35 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %6, i32 0, i32 0, i32 0)
  %36 = call <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float> %34, <64 x float> %11, <256 x i1> %9)
  %37 = call <64 x float> @llvm.hivm.vadd.s.x.v64f32(<64 x float> %36, <64 x float> %35, <256 x i1> %9)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %37, ptr addrspace(6) %7, i32 0, i32 2, i32 0, <256 x i1> %9)
  ret void
}

; Function Attrs: noduplicate noinline willreturn
define internal ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_7(ptr addrspace(6) noalias %0) #0 {
  %2 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %3 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %2, i32 1)
  br label %4

4:                                                ; preds = %7, %1
  %5 = phi i32 [ %12, %7 ], [ 0, %1 ]
  %6 = icmp slt i32 %5, 32
  br i1 %6, label %7, label %13

7:                                                ; preds = %4
  %8 = sext i32 %5 to i64
  %9 = mul i64 %8, 64
  %10 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %11 = getelementptr float, ptr addrspace(6) %0, i64 %9
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %3, ptr addrspace(6) %11, i32 0, i32 2, i32 0, <256 x i1> %10)
  %12 = add nsw i32 %5, 1
  br label %4

13:                                               ; preds = %4
  ret void
}

; Function Attrs: noduplicate noinline willreturn
define internal ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_8(ptr addrspace(6) noalias %0) #0 {
  %2 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %3 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xC1D0000000000000, <256 x i1> %2, i32 1)
  %4 = call <256 x i1> @llvm.hivm.pge.b32(i32 12, i32 0)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %3, ptr addrspace(6) %0, i32 0, i32 2, i32 0, <256 x i1> %4)
  ret void
}

; Function Attrs: noduplicate noinline willreturn
define internal ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_11(ptr addrspace(6) noalias %0) #0 {
  %2 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %3 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %2, i32 1)
  %4 = call <256 x i1> @llvm.hivm.pge.b32(i32 12, i32 0)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %3, ptr addrspace(6) %0, i32 0, i32 2, i32 0, <256 x i1> %4)
  ret void
}

; Function Attrs: noinline
define private void @copy_ubuf_to_ubuf_1d_float(ptr addrspace(6) %0, ptr addrspace(6) %1, i64 %2, i64 %3, i64 %4, ptr addrspace(6) %5, ptr addrspace(6) %6, i64 %7, i64 %8, i64 %9) #1 {
  %11 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } undef, ptr addrspace(6) %0, 0
  %12 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %11, ptr addrspace(6) %1, 1
  %13 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %12, i64 %2, 2
  %14 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %13, i64 %3, 3, 0
  %15 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %14, i64 %4, 4, 0
  %16 = alloca { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %15, ptr %16, align 8
  %17 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } undef, ptr addrspace(6) %5, 0
  %18 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %17, ptr addrspace(6) %6, 1
  %19 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %18, i64 %7, 2
  %20 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %19, i64 %8, 3, 0
  %21 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %20, i64 %9, 4, 0
  %22 = alloca { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %21, ptr %22, align 8
  call void @_mlir_ciface_copy_ubuf_to_ubuf_1d_float(ptr %16, ptr %22)
  ret void
}

; Function Attrs: noinline
declare dso_local void @_mlir_ciface_copy_ubuf_to_ubuf_1d_float(ptr, ptr) #1

; Function Attrs: noinline
define private void @load_gm_to_ubuf_2d_int8_t(ptr addrspace(1) %0, ptr addrspace(1) %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, ptr addrspace(6) %7, ptr addrspace(6) %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i32 %14, i8 %15, i64 %16, i32 %17) #1 {
  %19 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } undef, ptr addrspace(1) %0, 0
  %20 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %19, ptr addrspace(1) %1, 1
  %21 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %20, i64 %2, 2
  %22 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %21, i64 %3, 3, 0
  %23 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %22, i64 %5, 4, 0
  %24 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %23, i64 %4, 3, 1
  %25 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %24, i64 %6, 4, 1
  %26 = alloca { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %25, ptr %26, align 8
  %27 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } undef, ptr addrspace(6) %7, 0
  %28 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %27, ptr addrspace(6) %8, 1
  %29 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %28, i64 %9, 2
  %30 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %29, i64 %10, 3, 0
  %31 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %30, i64 %12, 4, 0
  %32 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %31, i64 %11, 3, 1
  %33 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %32, i64 %13, 4, 1
  %34 = alloca { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %33, ptr %34, align 8
  call void @_mlir_ciface_load_gm_to_ubuf_2d_int8_t(ptr %26, ptr %34, i32 %14, i8 %15, i64 %16, i32 %17)
  ret void
}

; Function Attrs: noinline
declare dso_local void @_mlir_ciface_load_gm_to_ubuf_2d_int8_t(ptr, ptr, i32, i8, i64, i32) #1

; Function Attrs: noinline
define private void @copy_ubuf_to_cbuf_2d_bfloat16_t(ptr addrspace(6) %0, ptr addrspace(6) %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, ptr addrspace(2) %7, ptr addrspace(2) %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13) #1 {
  %15 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } undef, ptr addrspace(6) %0, 0
  %16 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %15, ptr addrspace(6) %1, 1
  %17 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %16, i64 %2, 2
  %18 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %17, i64 %3, 3, 0
  %19 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %18, i64 %5, 4, 0
  %20 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %19, i64 %4, 3, 1
  %21 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %20, i64 %6, 4, 1
  %22 = alloca { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %21, ptr %22, align 8
  %23 = insertvalue { ptr addrspace(2), ptr addrspace(2), i64, [2 x i64], [2 x i64] } undef, ptr addrspace(2) %7, 0
  %24 = insertvalue { ptr addrspace(2), ptr addrspace(2), i64, [2 x i64], [2 x i64] } %23, ptr addrspace(2) %8, 1
  %25 = insertvalue { ptr addrspace(2), ptr addrspace(2), i64, [2 x i64], [2 x i64] } %24, i64 %9, 2
  %26 = insertvalue { ptr addrspace(2), ptr addrspace(2), i64, [2 x i64], [2 x i64] } %25, i64 %10, 3, 0
  %27 = insertvalue { ptr addrspace(2), ptr addrspace(2), i64, [2 x i64], [2 x i64] } %26, i64 %12, 4, 0
  %28 = insertvalue { ptr addrspace(2), ptr addrspace(2), i64, [2 x i64], [2 x i64] } %27, i64 %11, 3, 1
  %29 = insertvalue { ptr addrspace(2), ptr addrspace(2), i64, [2 x i64], [2 x i64] } %28, i64 %13, 4, 1
  %30 = alloca { ptr addrspace(2), ptr addrspace(2), i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr addrspace(2), ptr addrspace(2), i64, [2 x i64], [2 x i64] } %29, ptr %30, align 8
  call void @_mlir_ciface_copy_ubuf_to_cbuf_2d_bfloat16_t(ptr %22, ptr %30)
  ret void
}

; Function Attrs: noinline
declare dso_local void @_mlir_ciface_copy_ubuf_to_cbuf_2d_bfloat16_t(ptr, ptr) #1

; Function Attrs: noinline
define private void @store_ubuf_to_gm_2d_bfloat16_t(ptr addrspace(6) %0, ptr addrspace(6) %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, ptr addrspace(1) %7, ptr addrspace(1) %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i32 %14) #1 {
  %16 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } undef, ptr addrspace(6) %0, 0
  %17 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %16, ptr addrspace(6) %1, 1
  %18 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %17, i64 %2, 2
  %19 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %18, i64 %3, 3, 0
  %20 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %19, i64 %5, 4, 0
  %21 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %20, i64 %4, 3, 1
  %22 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %21, i64 %6, 4, 1
  %23 = alloca { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %22, ptr %23, align 8
  %24 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } undef, ptr addrspace(1) %7, 0
  %25 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %24, ptr addrspace(1) %8, 1
  %26 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %25, i64 %9, 2
  %27 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %26, i64 %10, 3, 0
  %28 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %27, i64 %12, 4, 0
  %29 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %28, i64 %11, 3, 1
  %30 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %29, i64 %13, 4, 1
  %31 = alloca { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr addrspace(1), ptr addrspace(1), i64, [2 x i64], [2 x i64] } %30, ptr %31, align 8
  call void @_mlir_ciface_store_ubuf_to_gm_2d_bfloat16_t(ptr %23, ptr %31, i32 %14)
  ret void
}

; Function Attrs: noinline
declare dso_local void @_mlir_ciface_store_ubuf_to_gm_2d_bfloat16_t(ptr, ptr, i32) #1

; Function Attrs: noinline
define private void @store_ubuf_to_gm_1d_float(ptr addrspace(6) %0, ptr addrspace(6) %1, i64 %2, i64 %3, i64 %4, ptr addrspace(1) %5, ptr addrspace(1) %6, i64 %7, i64 %8, i64 %9, i32 %10) #1 {
  %12 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } undef, ptr addrspace(6) %0, 0
  %13 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %12, ptr addrspace(6) %1, 1
  %14 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %13, i64 %2, 2
  %15 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %14, i64 %3, 3, 0
  %16 = insertvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %15, i64 %4, 4, 0
  %17 = alloca { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %16, ptr %17, align 8
  %18 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [1 x i64], [1 x i64] } undef, ptr addrspace(1) %5, 0
  %19 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [1 x i64], [1 x i64] } %18, ptr addrspace(1) %6, 1
  %20 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [1 x i64], [1 x i64] } %19, i64 %7, 2
  %21 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [1 x i64], [1 x i64] } %20, i64 %8, 3, 0
  %22 = insertvalue { ptr addrspace(1), ptr addrspace(1), i64, [1 x i64], [1 x i64] } %21, i64 %9, 4, 0
  %23 = alloca { ptr addrspace(1), ptr addrspace(1), i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr addrspace(1), ptr addrspace(1), i64, [1 x i64], [1 x i64] } %22, ptr %23, align 8
  call void @_mlir_ciface_store_ubuf_to_gm_1d_float(ptr %17, ptr %23, i32 %10)
  ret void
}

; Function Attrs: noinline
declare dso_local void @_mlir_ciface_store_ubuf_to_gm_1d_float(ptr, ptr, i32) #1

define dso_local void @fwd_kernel_mix_aiv(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(1) %5, ptr addrspace(1) %6, ptr addrspace(1) %7, ptr addrspace(1) %8, ptr addrspace(1) %9, ptr addrspace(1) %10, ptr addrspace(1) %11, i32 %12, i32 %13, float %14, i32 %15, i32 %16, i32 %17) #2 {
  %19 = mul i32 %15, %16
  %20 = mul i32 %19, %17
  %21 = call i64 @llvm.hivm.GET.BLOCK.IDX()
  %22 = trunc i64 %21 to i32
  %23 = call i64 @llvm.hivm.GET.SUBBLOCKID()
  %24 = mul i64 %23, 1024
  %25 = add i64 %24, 4
  %26 = inttoptr i64 %25 to ptr addrspace(11)
  %27 = inttoptr i64 %24 to ptr addrspace(11)
  %28 = add i64 %24, 8
  %29 = inttoptr i64 %28 to ptr addrspace(11)
  call ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_11(ptr addrspace(6) null)
  %30 = mul i32 %12, 304
  %31 = sext i32 %12 to i64
  %32 = mul i64 %23, 32
  br label %33

33:                                               ; preds = %313, %18
  %34 = phi i32 [ %316, %313 ], [ %22, %18 ]
  %35 = icmp slt i32 %34, %20
  br i1 %35, label %36, label %317

36:                                               ; preds = %33
  %37 = call i64 @llvm.hivm.GET.CTRL()
  %38 = call i64 @llvm.hivm.SBITSET0(i64 %37, i64 60)
  call void @llvm.hivm.SET.CTRL(i64 %38)
  %39 = call i64 @llvm.hivm.GET.CTRL()
  %40 = call i64 @llvm.hivm.SBITSET1(i64 %39, i64 48)
  call void @llvm.hivm.SET.CTRL(i64 %40)
  %41 = srem i32 %34, %15
  store volatile i32 0, ptr addrspace(11) null, align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1024 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 4 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1028 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 8 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1032 to ptr addrspace(11)), align 4
  br label %42

42:                                               ; preds = %311, %36
  %43 = phi i32 [ %312, %311 ], [ %41, %36 ]
  %44 = icmp slt i32 %43, %30
  br i1 %44, label %45, label %313

45:                                               ; preds = %42
  %46 = sdiv i32 %43, 38
  %47 = srem i32 %43, 38
  %48 = sdiv i32 %46, %12
  %49 = srem i32 %46, %12
  %50 = sext i32 %48 to i64
  %51 = add i64 %50, 1
  %52 = getelementptr i32, ptr addrspace(1) %10, i64 %50
  %53 = load i32, ptr addrspace(1) %52, align 4
  %54 = getelementptr i32, ptr addrspace(1) %10, i64 %51
  %55 = load i32, ptr addrspace(1) %54, align 4
  %56 = sext i32 %53 to i64
  %57 = sub i32 %55, %53
  %58 = mul i32 %47, 64
  %59 = icmp slt i32 %58, %57
  br i1 %59, label %60, label %311

60:                                               ; preds = %45
  %61 = getelementptr i32, ptr addrspace(1) %11, i64 %50
  %62 = load i32, ptr addrspace(1) %61, align 4
  %63 = getelementptr i32, ptr addrspace(1) %11, i64 %51
  %64 = load i32, ptr addrspace(1) %63, align 4
  %65 = sub i32 %64, %62
  %66 = sext i32 %58 to i64
  %67 = sext i32 %65 to i64
  %68 = icmp slt i64 %66, %67
  br i1 %68, label %69, label %310

69:                                               ; preds = %60
  %70 = call i32 @llvm.smax.i32(i32 %58, i32 0)
  %71 = sext i32 %70 to i64
  %72 = sext i32 %57 to i64
  %73 = mul i64 %71, -1
  %74 = add i64 %72, %73
  %75 = mul i32 %48, 5914624
  %76 = sext i32 %75 to i64
  %77 = sub i32 0, %58
  %78 = call i32 @llvm.smax.i32(i32 %77, i32 0)
  %79 = sext i32 %78 to i64
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 2)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 3)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 0, i64 15)
  %80 = sub i32 %65, %58
  %81 = icmp eq i32 %80, 0
  %82 = sub i32 %80, 1
  %83 = udiv i32 %82, 32
  %84 = add i32 %83, 1
  %85 = select i1 %81, i32 0, i32 %84
  %86 = add i32 %85, 4
  %87 = mul i32 %86, 32
  %88 = add i32 %58, %87
  call ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_7(ptr addrspace(6) inttoptr (i64 20800 to ptr addrspace(6)))
  call ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_8(ptr addrspace(6) inttoptr (i64 29120 to ptr addrspace(6)))
  call void @copy_ubuf_to_ubuf_1d_float(ptr addrspace(6) null, ptr addrspace(6) null, i64 0, i64 32, i64 1, ptr addrspace(6) inttoptr (i64 28992 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 28992 to ptr addrspace(6)), i64 0, i64 32, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 1)
  br label %89

89:                                               ; preds = %255, %69
  %90 = phi i32 [ %261, %255 ], [ %58, %69 ]
  %91 = phi { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } [ %250, %255 ], [ { ptr addrspace(6) inttoptr (i64 20800 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 20800 to ptr addrspace(6)), i64 0, [2 x i64] [i64 32, i64 64], [2 x i64] [i64 64, i64 1] }, %69 ]
  %92 = phi { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } [ { ptr addrspace(6) inttoptr (i64 29120 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 29120 to ptr addrspace(6)), i64 0, [1 x i64] [i64 32], [1 x i64] [i64 1] }, %255 ], [ { ptr addrspace(6) inttoptr (i64 29120 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 29120 to ptr addrspace(6)), i64 0, [1 x i64] [i64 32], [1 x i64] [i64 1] }, %69 ]
  %93 = phi { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } [ %251, %255 ], [ { ptr addrspace(6) inttoptr (i64 28992 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 28992 to ptr addrspace(6)), i64 0, [1 x i64] [i64 32], [1 x i64] [i64 1] }, %69 ]
  %94 = phi i32 [ %219, %255 ], [ %58, %69 ]
  %95 = phi i32 [ %108, %255 ], [ %58, %69 ]
  %96 = phi i32 [ %115, %255 ], [ %58, %69 ]
  %97 = phi i32 [ %222, %255 ], [ %58, %69 ]
  %98 = phi i32 [ %254, %255 ], [ %58, %69 ]
  %99 = phi i32 [ %253, %255 ], [ 0, %69 ]
  %100 = phi i32 [ %252, %255 ], [ 0, %69 ]
  %101 = icmp slt i32 %90, %88
  br i1 %101, label %102, label %262

102:                                              ; preds = %89
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 0, i64 15)
  %103 = icmp slt i32 %95, %65
  br i1 %103, label %104, label %106

104:                                              ; preds = %102
  %105 = add i32 %95, 32
  br label %107

106:                                              ; preds = %102
  br label %107

107:                                              ; preds = %104, %106
  %108 = phi i32 [ %95, %106 ], [ %105, %104 ]
  br label %109

109:                                              ; preds = %107
  %110 = icmp slt i32 %96, %65
  br i1 %110, label %111, label %113

111:                                              ; preds = %109
  %112 = add i32 %96, 32
  br label %114

113:                                              ; preds = %109
  br label %114

114:                                              ; preds = %111, %113
  %115 = phi i32 [ %96, %113 ], [ %112, %111 ]
  br label %116

116:                                              ; preds = %114
  %117 = load volatile i32, ptr addrspace(11) %27, align 4
  %118 = icmp sgt i32 %117, 0
  %119 = load volatile i32, ptr addrspace(11) %29, align 4
  %120 = icmp slt i32 %119, 1
  %121 = and i1 %118, %120
  %122 = icmp slt i32 %99, 2
  %123 = icmp slt i32 %100, 2
  %124 = and i1 %122, %123
  %125 = icmp slt i32 %97, %65
  %126 = and i1 %121, %124
  %127 = and i1 %126, %125
  br i1 %127, label %128, label %211

128:                                              ; preds = %116
  %129 = sext i32 %65 to i64
  %130 = call i32 @llvm.smax.i32(i32 %94, i32 0)
  %131 = sext i32 %130 to i64
  %132 = add i64 %131, %76
  %133 = mul i64 %71, 2432
  %134 = add i64 %132, %133
  %135 = mul i64 %71, -1
  %136 = add i64 %72, %135
  %137 = icmp slt i64 %131, 0
  %138 = sub i64 -1, %131
  %139 = select i1 %137, i64 %138, i64 %131
  %140 = sdiv i64 %139, 2432
  %141 = sub i64 -1, %140
  %142 = select i1 %137, i64 %141, i64 %140
  %143 = mul i64 %142, -1
  %144 = add i64 %136, %143
  %145 = mul i64 %131, -1
  %146 = add i64 %129, %145
  %147 = icmp slt i64 %131, 0
  %148 = sub i64 -1, %131
  %149 = select i1 %147, i64 %148, i64 %131
  %150 = sdiv i64 %149, 2432
  %151 = sub i64 -1, %150
  %152 = select i1 %147, i64 %151, i64 %150
  %153 = mul i64 %152, 2432
  %154 = add i64 %146, %153
  %155 = call i64 @llvm.smax.i64(i64 %144, i64 0)
  %156 = call i64 @llvm.smin.i64(i64 %155, i64 64)
  %157 = call i64 @llvm.smax.i64(i64 %154, i64 0)
  %158 = call i64 @llvm.smin.i64(i64 %157, i64 32)
  %159 = call i64 @llvm.smin.i64(i64 %79, i64 %156)
  %160 = mul i64 %159, -1
  %161 = add i64 %156, %160
  %162 = sub i32 0, %94
  %163 = call i32 @llvm.smax.i32(i32 %162, i32 0)
  %164 = sext i32 %163 to i64
  %165 = call i64 @llvm.smin.i64(i64 %164, i64 %158)
  %166 = mul i64 %165, -1
  %167 = add i64 %158, %166
  %168 = icmp slt i64 %161, 64
  %169 = icmp slt i64 %167, 32
  %170 = or i1 %168, %169
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 2)
  %171 = call i64 @llvm.smin.i64(i64 %32, i64 %161)
  %172 = mul i64 %171, -1
  %173 = add i64 %172, %156
  %174 = mul i64 %159, -1
  %175 = add i64 %173, %174
  %176 = call i64 @llvm.smin.i64(i64 %175, i64 32)
  %177 = mul i64 %23, 77824
  %178 = add i64 %134, %177
  %179 = mul i64 %23, 32
  %180 = add i64 %179, 32
  %181 = call i64 @llvm.smax.i64(i64 %159, i64 %32)
  %182 = call i64 @llvm.smin.i64(i64 %156, i64 %180)
  %183 = call i64 @llvm.smax.i64(i64 %181, i64 %182)
  %184 = mul i64 %181, -1
  %185 = add i64 %183, %184
  %186 = mul i64 %181, 32
  %187 = add i64 %165, %186
  %188 = mul i64 %23, -1024
  %189 = add i64 %187, %188
  br i1 %170, label %190, label %191

190:                                              ; preds = %128
  call ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_0(ptr addrspace(6) inttoptr (i64 12928 to ptr addrspace(6)))
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  br label %191

191:                                              ; preds = %190, %128
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 1)
  call void @load_gm_to_ubuf_2d_int8_t(ptr addrspace(1) %9, ptr addrspace(1) %9, i64 %178, i64 %176, i64 %167, i64 2432, i64 1, ptr addrspace(6) inttoptr (i64 12928 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 12928 to ptr addrspace(6)), i64 %189, i64 %185, i64 %167, i64 32, i64 1, i32 2, i8 0, i64 0, i32 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  call ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_1(ptr addrspace(6) inttoptr (i64 128 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 12928 to ptr addrspace(6)), float %14, ptr addrspace(6) inttoptr (i64 13952 to ptr addrspace(6)))
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 1)
  call ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_2(ptr addrspace(6) inttoptr (i64 18048 to ptr addrspace(6)))
  %192 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %92, 1
  call ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_3(ptr addrspace(6) inttoptr (i64 13952 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 18048 to ptr addrspace(6)), ptr addrspace(6) %192, ptr addrspace(6) inttoptr (i64 20544 to ptr addrspace(6)))
  call void @copy_ubuf_to_ubuf_1d_float(ptr addrspace(6) null, ptr addrspace(6) null, i64 0, i64 32, i64 1, ptr addrspace(6) inttoptr (i64 18176 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 18176 to ptr addrspace(6)), i64 0, i64 32, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 0)
  %193 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %92, 1
  call ptc_simdvf void @fwd_kernel_mix_aiv_outlined_merged_vf_0(ptr addrspace(6) %193, ptr addrspace(6) inttoptr (i64 20544 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 18304 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 13952 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 20544 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 18176 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 18432 to ptr addrspace(6)))
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 1)
  %194 = mul i64 %23, 512
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @copy_ubuf_to_cbuf_2d_bfloat16_t(ptr addrspace(6) inttoptr (i64 18432 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 18432 to ptr addrspace(6)), i64 0, i64 2, i64 512, i64 528, i64 1, ptr addrspace(2) inttoptr (i64 8192 to ptr addrspace(2)), ptr addrspace(2) inttoptr (i64 8192 to ptr addrspace(2)), i64 %194, i64 2, i64 512, i64 1024, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 1)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 2)
  %195 = sub i32 %97, %58
  %196 = udiv i32 %195, 32
  %197 = srem i32 %196, 2
  %198 = icmp eq i32 %197, 0
  br i1 %198, label %199, label %318

199:                                              ; preds = %318, %191
  %200 = phi ptr addrspace(6) [ %319, %318 ], [ inttoptr (i64 12416 to ptr addrspace(6)), %191 ]
  %201 = phi ptr addrspace(6) [ %320, %318 ], [ inttoptr (i64 12672 to ptr addrspace(6)), %191 ]
  call void @copy_ubuf_to_ubuf_1d_float(ptr addrspace(6) inttoptr (i64 18304 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 18304 to ptr addrspace(6)), i64 0, i64 32, i64 1, ptr addrspace(6) %200, ptr addrspace(6) %200, i64 0, i64 32, i64 1)
  call void @copy_ubuf_to_ubuf_1d_float(ptr addrspace(6) inttoptr (i64 18176 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 18176 to ptr addrspace(6)), i64 0, i64 32, i64 1, ptr addrspace(6) %201, ptr addrspace(6) %201, i64 0, i64 32, i64 1)
  br label %202

202:                                              ; preds = %199
  %203 = add i32 %94, 32
  %204 = load volatile i32, ptr addrspace(11) %27, align 4
  %205 = sub i32 %204, 1
  store volatile i32 %205, ptr addrspace(11) %27, align 4
  %206 = load volatile i32, ptr addrspace(11) %29, align 4
  %207 = add i32 %206, 1
  store volatile i32 %207, ptr addrspace(11) %29, align 4
  %208 = add i32 %100, 1
  %209 = add i32 %99, 1
  %210 = add i32 %97, 32
  br label %217

211:                                              ; preds = %116
  %212 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %92, 0
  %213 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %92, 1
  %214 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %92, 2
  %215 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %92, 3, 0
  %216 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %92, 4, 0
  call void @copy_ubuf_to_ubuf_1d_float(ptr addrspace(6) %212, ptr addrspace(6) %213, i64 %214, i64 %215, i64 %216, ptr addrspace(6) inttoptr (i64 20544 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 20544 to ptr addrspace(6)), i64 0, i64 32, i64 1)
  br label %217

217:                                              ; preds = %202, %211
  %218 = phi { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } [ { ptr addrspace(6) inttoptr (i64 20544 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 20544 to ptr addrspace(6)), i64 0, [1 x i64] [i64 32], [1 x i64] [i64 1] }, %211 ], [ { ptr addrspace(6) inttoptr (i64 20544 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 20544 to ptr addrspace(6)), i64 0, [1 x i64] [i64 32], [1 x i64] [i64 1] }, %202 ]
  %219 = phi i32 [ %94, %211 ], [ %203, %202 ]
  %220 = phi i32 [ %100, %211 ], [ %208, %202 ]
  %221 = phi i32 [ %99, %211 ], [ %209, %202 ]
  %222 = phi i32 [ %97, %211 ], [ %210, %202 ]
  br label %223

223:                                              ; preds = %217
  %224 = load volatile i32, ptr addrspace(11) %26, align 4
  %225 = icmp sgt i32 %224, 0
  %226 = icmp sgt i32 %221, 0
  %227 = icmp sgt i32 %220, 0
  %228 = and i1 %226, %227
  %229 = icmp slt i32 %98, %65
  %230 = and i1 %225, %228
  %231 = and i1 %230, %229
  br i1 %231, label %232, label %248

232:                                              ; preds = %223
  %233 = sub i32 %98, %58
  %234 = udiv i32 %233, 32
  %235 = srem i32 %234, 2
  %236 = icmp eq i32 %235, 0
  %237 = select i1 %236, { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } { ptr addrspace(6) inttoptr (i64 12672 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 12672 to ptr addrspace(6)), i64 0, [1 x i64] [i64 32], [1 x i64] [i64 1] }, { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } { ptr addrspace(6) inttoptr (i64 12800 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 12800 to ptr addrspace(6)), i64 0, [1 x i64] [i64 32], [1 x i64] [i64 1] }
  %238 = select i1 %236, { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } { ptr addrspace(6) inttoptr (i64 12416 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 12416 to ptr addrspace(6)), i64 0, [1 x i64] [i64 32], [1 x i64] [i64 1] }, { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } { ptr addrspace(6) inttoptr (i64 12544 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 12544 to ptr addrspace(6)), i64 0, [1 x i64] [i64 32], [1 x i64] [i64 1] }
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 3)
  %239 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %238, 1
  %240 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %91, 1
  %241 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %93, 1
  %242 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %237, 1
  call ptc_simdvf void @fwd_kernel_mix_aiv_outlined_vf_6(ptr addrspace(6) %239, ptr addrspace(6) inttoptr (i64 20672 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 4224 to ptr addrspace(6)), ptr addrspace(6) %240, ptr addrspace(6) inttoptr (i64 20800 to ptr addrspace(6)), ptr addrspace(6) %241, ptr addrspace(6) %242, ptr addrspace(6) inttoptr (i64 28992 to ptr addrspace(6)))
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 3)
  %243 = load volatile i32, ptr addrspace(11) %26, align 4
  %244 = sub i32 %243, 1
  store volatile i32 %244, ptr addrspace(11) %26, align 4
  %245 = sub i32 %220, 1
  %246 = sub i32 %221, 1
  %247 = add i32 %98, 32
  br label %249

248:                                              ; preds = %223
  br label %249

249:                                              ; preds = %232, %248
  %250 = phi { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } [ %91, %248 ], [ { ptr addrspace(6) inttoptr (i64 20800 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 20800 to ptr addrspace(6)), i64 0, [2 x i64] [i64 32, i64 64], [2 x i64] [i64 64, i64 1] }, %232 ]
  %251 = phi { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } [ %93, %248 ], [ { ptr addrspace(6) inttoptr (i64 28992 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 28992 to ptr addrspace(6)), i64 0, [1 x i64] [i64 32], [1 x i64] [i64 1] }, %232 ]
  %252 = phi i32 [ %220, %248 ], [ %245, %232 ]
  %253 = phi i32 [ %221, %248 ], [ %246, %232 ]
  %254 = phi i32 [ %98, %248 ], [ %247, %232 ]
  br label %255

255:                                              ; preds = %249
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 0, i64 15)
  %256 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %218, 0
  %257 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %218, 1
  %258 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %218, 2
  %259 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %218, 3, 0
  %260 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %218, 4, 0
  call void @copy_ubuf_to_ubuf_1d_float(ptr addrspace(6) %256, ptr addrspace(6) %257, i64 %258, i64 %259, i64 %260, ptr addrspace(6) inttoptr (i64 29120 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 29120 to ptr addrspace(6)), i64 0, i64 32, i64 1)
  %261 = add nsw i32 %90, 32
  br label %89

262:                                              ; preds = %89
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 1)
  %263 = mul i64 %56, %31
  %264 = mul i64 %263, 64
  %265 = mul i32 %49, 64
  %266 = sext i32 %265 to i64
  %267 = mul i32 %12, 64
  %268 = sext i32 %267 to i64
  %269 = mul i64 %71, %268
  %270 = add i64 %269, %264
  %271 = add i64 %270, %266
  %272 = sext i32 %49 to i64
  %273 = sext i32 %12 to i64
  %274 = mul i64 %71, %273
  %275 = add i64 %274, %263
  %276 = add i64 %275, %272
  %277 = call i64 @llvm.smax.i64(i64 %74, i64 0)
  %278 = call i64 @llvm.smin.i64(i64 %277, i64 64)
  %279 = call i64 @llvm.smin.i64(i64 %79, i64 %278)
  %280 = mul i64 %279, -1
  %281 = add i64 %278, %280
  %282 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %92, 1
  %283 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %93, 1
  %284 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [1 x i64], [1 x i64] } %93, 1
  %285 = extractvalue { ptr addrspace(6), ptr addrspace(6), i64, [2 x i64], [2 x i64] } %91, 1
  call ptc_simdvf void @fwd_kernel_mix_aiv_outlined_merged_vf_1(ptr addrspace(6) %282, ptr addrspace(6) %283, ptr addrspace(6) inttoptr (i64 29248 to ptr addrspace(6)), ptr addrspace(6) %284, ptr addrspace(6) %285, ptr addrspace(6) inttoptr (i64 29376 to ptr addrspace(6)))
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  %286 = mul i64 %23, 32
  %287 = add i64 %286, 32
  %288 = call i64 @llvm.smax.i64(i64 %279, i64 %32)
  %289 = call i64 @llvm.smin.i64(i64 %278, i64 %287)
  %290 = call i64 @llvm.smax.i64(i64 %288, i64 %289)
  %291 = mul i64 %288, -1
  %292 = add i64 %290, %291
  %293 = mul i64 %288, 64
  %294 = mul i64 %23, -2048
  %295 = add i64 %293, %294
  %296 = call i64 @llvm.smin.i64(i64 %32, i64 %281)
  %297 = mul i64 %296, -1
  %298 = add i64 %297, %278
  %299 = mul i64 %279, -1
  %300 = add i64 %298, %299
  %301 = call i64 @llvm.smin.i64(i64 %300, i64 32)
  %302 = mul i64 %23, %268
  %303 = mul i64 %302, 32
  %304 = add i64 %271, %303
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @store_ubuf_to_gm_2d_bfloat16_t(ptr addrspace(6) inttoptr (i64 29376 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 29376 to ptr addrspace(6)), i64 %295, i64 %292, i64 64, i64 64, i64 1, ptr addrspace(1) %5, ptr addrspace(1) %5, i64 %304, i64 %301, i64 64, i64 %268, i64 1, i32 0)
  %305 = mul i64 %23, -32
  %306 = add i64 %288, %305
  %307 = mul i64 %23, %273
  %308 = mul i64 %307, 32
  %309 = add i64 %276, %308
  call void @store_ubuf_to_gm_1d_float(ptr addrspace(6) inttoptr (i64 29248 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 29248 to ptr addrspace(6)), i64 %306, i64 %292, i64 1, ptr addrspace(1) %6, ptr addrspace(1) %6, i64 %309, i64 %301, i64 %273, i32 0)
  br label %310

310:                                              ; preds = %262, %60
  br label %311

311:                                              ; preds = %310, %45
  %312 = add nsw i32 %43, 28
  br label %42

313:                                              ; preds = %42
  %314 = call i64 @llvm.hivm.GET.CTRL()
  %315 = call i64 @llvm.hivm.SBITSET1(i64 %314, i64 60)
  call void @llvm.hivm.SET.CTRL(i64 %315)
  %316 = add nsw i32 %34, 28
  br label %33

317:                                              ; preds = %33
  call void @llvm.hivm.BARRIER(i64 6)
  ret void

318:                                              ; preds = %191
  %319 = phi ptr addrspace(6) [ inttoptr (i64 12544 to ptr addrspace(6)), %191 ]
  %320 = phi ptr addrspace(6) [ inttoptr (i64 12800 to ptr addrspace(6)), %191 ]
  br label %199
}

; Function Attrs: nounwind
declare <256 x i1> @llvm.hivm.pge.b32(i32, i32) #3

; Function Attrs: nounwind readonly 
declare <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) nocapture readonly, i32, i32, i32) #4

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vln.x.v64f32(<64 x float>, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vadd.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>) #5

; Function Attrs: nounwind writeonly 
declare void @llvm.hivm.vstsx1.v64f32(<64 x float>, ptr addrspace(6) nocapture readonly, i32, i32, i32, <256 x i1>) #6

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vdiv.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float>, <256 x i1>, i32, i32, i32) #5

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vdups.z.v64f32(float, <256 x i1>, i32) #5

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>) #5

; Function Attrs: nounwind
declare <32 x i8> @llvm.hivm.init.vector.align.data() #3

; Function Attrs: nounwind writeonly argmemonly
declare void @llvm.hivm.vstas(<32 x i8>, ptr addrspace(6) nocapture writeonly, i32, i32) #7

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vexpdif.v64f32(<64 x float>, <64 x float>, <256 x i1>, i32) #5

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vsel.v64f32(<64 x float>, <64 x float>, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vcadd.s.x.v64f32.v64f32(<64 x float>, <256 x i1>) #5

; Function Attrs: nounwind writeonly 
declare { <32 x i8>, ptr addrspace(6) } @llvm.hivm.vstus.post.f32(<64 x float>, ptr addrspace(6) nocapture readonly, i32, <32 x i8>) #6

; Function Attrs: nounwind
declare <256 x i1> @llvm.hivm.pge.b16(i32, i32) #3

; Function Attrs: nounwind readnone 
declare { <128 x bfloat>, <128 x bfloat> } @llvm.hivm.vdintlv.v128bf16(<128 x bfloat>, <128 x bfloat>) #5

; Function Attrs: nounwind writeonly 
declare void @llvm.hivm.vsstb.v128bf16(<128 x bfloat>, ptr addrspace(6) nocapture readonly, i32, i32, <256 x i1>) #6

; Function Attrs: nounwind
declare <256 x i1> @llvm.hivm.pge.b8(i32, i32) #3

; Function Attrs: nounwind readnone 
declare <256 x i8> @llvm.hivm.vdups.z.v256i8(i8, <256 x i1>, i32) #5

; Function Attrs: nounwind writeonly 
declare void @llvm.hivm.vstsx1.v256s8(<256 x i8>, ptr addrspace(6) nocapture readonly, i32, i32, i32, <256 x i1>) #6

; Function Attrs: nounwind readonly 
declare <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) nocapture readonly, i32, i32, i32) #4

; Function Attrs: nounwind readnone 
declare <256 x i1> @llvm.hivm.vcmp.ne.s.z.v256i8(<256 x i8>, <256 x i8>, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float>, float, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <64 x i32> @llvm.hivm.vdups.z.v64i32(i32, <256 x i1>, i32) #5

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vmax.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <64 x i32> @llvm.hivm.vand.x.v64i32(<64 x i32>, <64 x i32>, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <64 x i32> @llvm.hivm.vadds.s.x.v64i32(<64 x i32>, i32, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <64 x i32> @llvm.hivm.vmins.s.x.v64i32(<64 x i32>, i32, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <64 x i32> @llvm.hivm.vmaxs.s.x.v64i32(<64 x i32>, i32, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <256 x i1> @llvm.hivm.vcmp.ne.s.z.v64i32(<64 x i32>, <64 x i32>, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vcmax.s.x.v64f32(<64 x float>, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vexp.x.v64f32(<64 x float>, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>) #5

; Function Attrs: nounwind readnone 
declare i64 @llvm.hivm.GET.BLOCK.IDX() #5

; Function Attrs: nounwind readnone 
declare i64 @llvm.hivm.GET.SUBBLOCKID() #5

; Function Attrs: nounwind  inaccessiblememonly
declare void @llvm.hivm.BARRIER(i64) #8

; Function Attrs: nounwind  inaccessiblememonly
declare i64 @llvm.hivm.GET.CTRL() #8

; Function Attrs: nounwind readnone 
declare i64 @llvm.hivm.SBITSET0(i64, i64) #5

; Function Attrs: nounwind  inaccessiblememonly
declare void @llvm.hivm.SET.CTRL(i64) #8

; Function Attrs: nounwind readnone 
declare i64 @llvm.hivm.SBITSET1(i64, i64) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn readnone 
declare i32 @llvm.smax.i32(i32, i32) #9

; Function Attrs: nounwind  inaccessiblememonly
declare void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64, i64) #8

; Function Attrs: nounwind
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64) #3

; Function Attrs: nounwind
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64) #3

; Function Attrs: nounwind  inaccessiblememonly
declare void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64, i64) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn readnone 
declare i64 @llvm.smax.i64(i64, i64) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn readnone 
declare i64 @llvm.smin.i64(i64, i64) #9

attributes #0 = { noduplicate noinline willreturn }
attributes #1 = { noinline "target-cpu"="dav-c310" "target-features"="+dav-c310" }
attributes #2 = { "target-cpu"="dav-c310" "target-features"="+dav-c310" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readonly  }
attributes #5 = { nounwind readnone  }
attributes #6 = { nounwind writeonly  }
attributes #7 = { nounwind writeonly argmemonly }
attributes #8 = { nounwind  inaccessiblememonly }
attributes #9 = { nocallback nofree nosync nounwind speculatable willreturn readnone  }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @fwd_kernel_mix_aiv, !"kernel", i32 1}

