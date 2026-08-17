; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @bwd_qkv_kernel_mix_aic(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(1) %5, ptr addrspace(1) %6, ptr addrspace(1) %7, ptr addrspace(1) %8, ptr addrspace(1) %9, ptr addrspace(1) %10, ptr addrspace(1) %11, ptr addrspace(1) %12, ptr addrspace(1) %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, float %19, i32 %20, i32 %21, i32 %22) #0 {
  %24 = call i64 @llvm.hivm.GET.CTRL()
  %25 = call i64 @llvm.hivm.SBITSET0(i64 %24, i64 60)
  call void @llvm.hivm.SET.CTRL(i64 %25)
  %26 = call i64 @llvm.hivm.GET.CTRL()
  %27 = call i64 @llvm.hivm.SBITSET1(i64 %26, i64 48)
  call void @llvm.hivm.SET.CTRL(i64 %27)
  %28 = call i64 @llvm.hivm.GET.BLOCK.IDX()
  %29 = zext i32 %22 to i64
  %30 = udiv i64 %28, %29
  %31 = zext i32 %21 to i64
  %32 = udiv i64 %30, %31
  %33 = zext i32 %20 to i64
  %34 = urem i64 %32, %33
  %35 = trunc i64 %34 to i32
  %36 = add i32 %16, 63
  %37 = sdiv i32 %36, 64
  %38 = mul i32 %37, %17
  %39 = mul i32 %38, %14
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 2)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 7)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 1)
  br label %40

40:                                               ; preds = %93, %23
  %41 = phi i32 [ %94, %93 ], [ %35, %23 ]
  %42 = icmp slt i32 %41, %39
  br i1 %42, label %43, label %95

43:                                               ; preds = %40
  %44 = sdiv i32 %41, %37
  %45 = srem i32 %41, %37
  %46 = sdiv i32 %44, %17
  %47 = sext i32 %46 to i64
  %48 = ptrtoint ptr addrspace(1) %13 to i64
  %49 = add i64 %48, 0
  %50 = inttoptr i64 %49 to ptr addrspace(1)
  %51 = getelementptr i32, ptr addrspace(1) %50, i64 %47
  %52 = load i32, ptr addrspace(1) %51, align 4
  %53 = add i64 %47, 1
  %54 = ptrtoint ptr addrspace(1) %13 to i64
  %55 = add i64 %54, 0
  %56 = inttoptr i64 %55 to ptr addrspace(1)
  %57 = getelementptr i32, ptr addrspace(1) %56, i64 %53
  %58 = load i32, ptr addrspace(1) %57, align 4
  %59 = sub i32 %58, %52
  %60 = mul i32 %45, 64
  %61 = icmp slt i32 %60, %59
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 1)
  br i1 %61, label %62, label %93

62:                                               ; preds = %43
  %63 = sext i32 %46 to i64
  %64 = ptrtoint ptr addrspace(1) %12 to i64
  %65 = add i64 %64, 0
  %66 = inttoptr i64 %65 to ptr addrspace(1)
  %67 = getelementptr i32, ptr addrspace(1) %66, i64 %63
  %68 = load i32, ptr addrspace(1) %67, align 4
  %69 = add i64 %63, 1
  %70 = ptrtoint ptr addrspace(1) %12 to i64
  %71 = add i64 %70, 0
  %72 = inttoptr i64 %71 to ptr addrspace(1)
  %73 = getelementptr i32, ptr addrspace(1) %72, i64 %69
  %74 = load i32, ptr addrspace(1) %73, align 4
  %75 = sub i32 %74, %68
  %76 = sdiv i32 %60, 64
  %77 = mul i32 %76, 64
  %78 = add i32 %77, 64
  %79 = call i32 @llvm.smin.i32(i32 %78, i32 %75)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 7)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 2)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 0)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 1)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 3)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 4)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 5)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 6)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 8)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 4)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 5)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 4)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 6)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 7)
  br label %80

80:                                               ; preds = %90, %62
  %81 = phi i32 [ %91, %90 ], [ 0, %62 ]
  %82 = icmp slt i32 %81, %79
  br i1 %82, label %83, label %92

83:                                               ; preds = %80
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) null, ptr addrspace(2) inttoptr (i64 16384 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 1)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) null, ptr addrspace(2) inttoptr (i64 8192 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 2)
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) null, ptr addrspace(3) null, ptr addrspace(4) null, i64 -6917529026567077824)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 10, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 0)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 10)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 10, i64 2)
  call void @llvm.hivm.SET.LOOP3.PARA(i64 1)
  call void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6) null, ptr addrspace(5) null, i64 274882102272, i64 8796093022272)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 2)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 10, i64 10)
  %84 = icmp eq i32 %81, 0
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 8)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 2)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) inttoptr (i64 8192 to ptr addrspace(3)), ptr addrspace(2) inttoptr (i64 40960 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 3)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) inttoptr (i64 8192 to ptr addrspace(4)), ptr addrspace(2) null, i64 4415226380288, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 3)
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) inttoptr (i64 16384 to ptr addrspace(5)), ptr addrspace(3) inttoptr (i64 8192 to ptr addrspace(3)), ptr addrspace(4) inttoptr (i64 8192 to ptr addrspace(4)), i64 -6917529026567077824)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 10, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 2)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 8)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 9)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 10, i64 3)
  call void @llvm.hivm.SET.LOOP3.PARA(i64 1)
  call void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6) inttoptr (i64 16384 to ptr addrspace(6)), ptr addrspace(5) inttoptr (i64 16384 to ptr addrspace(5)), i64 274882102272, i64 8796093022272)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 3)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 10, i64 9)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 4)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) inttoptr (i64 16384 to ptr addrspace(3)), ptr addrspace(2) inttoptr (i64 49152 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 4)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 5)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) inttoptr (i64 16384 to ptr addrspace(4)), ptr addrspace(2) null, i64 4415226380288, i64 262148, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 4)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 4)
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) inttoptr (i64 32768 to ptr addrspace(5)), ptr addrspace(3) inttoptr (i64 16384 to ptr addrspace(3)), ptr addrspace(4) inttoptr (i64 16384 to ptr addrspace(4)), i64 -6917529026567077824)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 10, i64 4)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 5)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 4)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 1)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 11)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 10, i64 4)
  call void @llvm.hivm.SET.LOOP3.PARA(i64 1)
  call void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6) inttoptr (i64 32768 to ptr addrspace(6)), ptr addrspace(5) inttoptr (i64 32768 to ptr addrspace(5)), i64 274882102272, i64 8796093022272)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 4)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 10, i64 11)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 6)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 6)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) inttoptr (i64 24576 to ptr addrspace(3)), ptr addrspace(2) inttoptr (i64 65536 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 7)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) inttoptr (i64 24576 to ptr addrspace(4)), ptr addrspace(2) inttoptr (i64 32768 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 7)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 7)
  br i1 %84, label %85, label %96

85:                                               ; preds = %96, %83
  %86 = phi i64 [ %97, %96 ], [ -6917529026567077824, %83 ]
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) inttoptr (i64 49152 to ptr addrspace(5)), ptr addrspace(3) inttoptr (i64 24576 to ptr addrspace(3)), ptr addrspace(4) inttoptr (i64 24576 to ptr addrspace(4)), i64 %86)
  br label %87

87:                                               ; preds = %85
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 7)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 6)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 5)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 6)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 4)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 3)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) inttoptr (i64 32768 to ptr addrspace(3)), ptr addrspace(2) inttoptr (i64 57344 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 1)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) inttoptr (i64 32768 to ptr addrspace(4)), ptr addrspace(2) inttoptr (i64 24576 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 1)
  call void @llvm.hivm.BARRIER(i64 6)
  br i1 %84, label %88, label %98

88:                                               ; preds = %98, %87
  %89 = phi i64 [ %99, %98 ], [ -6917529026567077824, %87 ]
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) inttoptr (i64 65536 to ptr addrspace(5)), ptr addrspace(3) inttoptr (i64 32768 to ptr addrspace(3)), ptr addrspace(4) inttoptr (i64 32768 to ptr addrspace(4)), i64 %89)
  br label %90

90:                                               ; preds = %88
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 3)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 4)
  %91 = add i32 %81, 64
  br label %80

92:                                               ; preds = %80
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 10, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 10, i64 0)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 7)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 4)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 4)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 11)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 10)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 9)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 2)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 7)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 12)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 10, i64 0)
  call void @llvm.hivm.SET.LOOP3.PARA(i64 1)
  call void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6) inttoptr (i64 49152 to ptr addrspace(6)), ptr addrspace(5) inttoptr (i64 49152 to ptr addrspace(5)), i64 274882102272, i64 8796093022272)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 10, i64 12)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 13)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 10, i64 1)
  call void @llvm.hivm.SET.LOOP3.PARA(i64 1)
  call void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6) inttoptr (i64 65536 to ptr addrspace(6)), ptr addrspace(5) inttoptr (i64 65536 to ptr addrspace(5)), i64 274882102272, i64 8796093022272)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 10, i64 13)
  br label %93

93:                                               ; preds = %92, %43
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 0)
  %94 = add i32 %41, 28
  br label %40

95:                                               ; preds = %40
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 13)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 12)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void

96:                                               ; preds = %83
  %97 = phi i64 [ 2305843010287697984, %83 ]
  br label %85

98:                                               ; preds = %87
  %99 = phi i64 [ 2305843010287697984, %87 ]
  br label %88
}

define dso_local ptc_kernel void @bwd_qkv_kernel_mix_aiv(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(1) %5, ptr addrspace(1) %6, ptr addrspace(1) %7, ptr addrspace(1) %8, ptr addrspace(1) %9, ptr addrspace(1) %10, ptr addrspace(1) %11, ptr addrspace(1) %12, ptr addrspace(1) %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, float %19, i32 %20, i32 %21, i32 %22) #1 {
  %24 = call i64 @llvm.hivm.GET.CTRL()
  %25 = call i64 @llvm.hivm.SBITSET0(i64 %24, i64 60)
  call void @llvm.hivm.SET.CTRL(i64 %25)
  %26 = call i64 @llvm.hivm.GET.CTRL()
  %27 = call i64 @llvm.hivm.SBITSET1(i64 %26, i64 48)
  call void @llvm.hivm.SET.CTRL(i64 %27)
  %28 = call i64 @llvm.hivm.GET.SUBBLOCKID()
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %30, label %308

30:                                               ; preds = %23
  %31 = call i64 @llvm.hivm.GET.BLOCK.IDX()
  %32 = zext i32 %22 to i64
  %33 = udiv i64 %31, %32
  %34 = zext i32 %21 to i64
  %35 = udiv i64 %33, %34
  %36 = zext i32 %20 to i64
  %37 = urem i64 %35, %36
  %38 = trunc i64 %37 to i32
  %39 = add i32 %16, 63
  %40 = sdiv i32 %39, 64
  %41 = mul i32 %40, %17
  %42 = mul i32 %41, %14
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 12)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 13)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 1)
  br label %43

43:                                               ; preds = %305, %30
  %44 = phi i32 [ %306, %305 ], [ %38, %30 ]
  %45 = icmp slt i32 %44, %42
  br i1 %45, label %46, label %307

46:                                               ; preds = %43
  %47 = sdiv i32 %44, %40
  %48 = srem i32 %44, %40
  %49 = sdiv i32 %47, %17
  %50 = sext i32 %49 to i64
  %51 = ptrtoint ptr addrspace(1) %13 to i64
  %52 = add i64 %51, 0
  %53 = inttoptr i64 %52 to ptr addrspace(1)
  %54 = getelementptr i32, ptr addrspace(1) %53, i64 %50
  %55 = load i32, ptr addrspace(1) %54, align 4
  %56 = add i64 %50, 1
  %57 = ptrtoint ptr addrspace(1) %13 to i64
  %58 = add i64 %57, 0
  %59 = inttoptr i64 %58 to ptr addrspace(1)
  %60 = getelementptr i32, ptr addrspace(1) %59, i64 %56
  %61 = load i32, ptr addrspace(1) %60, align 4
  %62 = sub i32 %61, %55
  %63 = mul i32 %48, 64
  %64 = icmp slt i32 %63, %62
  %65 = srem i32 %47, %17
  %66 = sdiv i32 %17, %18
  %67 = sdiv i32 %65, %66
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 1)
  br i1 %64, label %68, label %305

68:                                               ; preds = %46
  %69 = sext i32 %49 to i64
  %70 = ptrtoint ptr addrspace(1) %12 to i64
  %71 = add i64 %70, 0
  %72 = inttoptr i64 %71 to ptr addrspace(1)
  %73 = getelementptr i32, ptr addrspace(1) %72, i64 %69
  %74 = load i32, ptr addrspace(1) %73, align 4
  %75 = add i64 %69, 1
  %76 = ptrtoint ptr addrspace(1) %12 to i64
  %77 = add i64 %76, 0
  %78 = inttoptr i64 %77 to ptr addrspace(1)
  %79 = getelementptr i32, ptr addrspace(1) %78, i64 %75
  %80 = load i32, ptr addrspace(1) %79, align 4
  %81 = sub i32 %80, %74
  %82 = sdiv i32 %63, 64
  %83 = mul i32 %82, 64
  %84 = add i32 %83, 64
  %85 = call i32 @llvm.smin.i32(i32 %84, i32 %81)
  %86 = fmul float %19, 0x3FF7154760000000
  %87 = sext i32 %74 to i64
  %88 = sext i32 %17 to i64
  %89 = mul i64 %87, %88
  %90 = sext i32 %81 to i64
  %91 = sext i32 %62 to i64
  %92 = sext i32 %63 to i64
  %93 = mul i32 %49, %15
  %94 = mul i32 %93, %16
  %95 = sext i32 %16 to i64
  %96 = sext i32 %55 to i64
  %97 = sext i32 %18 to i64
  %98 = mul i64 %96, %97
  %99 = mul i64 %98, 64
  %100 = mul i32 %67, 64
  %101 = mul i32 %18, 64
  %102 = sext i32 %101 to i64
  %103 = sub i64 %91, %92
  %104 = call i64 @llvm.smax.i64(i64 %103, i64 0)
  %105 = call i64 @llvm.smin.i64(i64 %104, i64 64)
  %106 = mul i64 %92, %102
  %107 = add i64 %92, 1
  %108 = mul i64 %107, %102
  %109 = sub i64 %108, %106
  %110 = sext i32 %100 to i64
  %111 = add i64 %106, %110
  %112 = add i64 %111, %99
  br label %309

113:                                              ; preds = %116, %326
  %114 = phi i64 [ 0, %326 ], [ %125, %116 ]
  %115 = icmp slt i64 %114, 4
  br i1 %115, label %116, label %126

116:                                              ; preds = %113
  %117 = mul i64 %114, 16
  %118 = mul i64 %114, 1024
  %119 = mul i64 %118, 2
  %120 = add i64 0, %119
  %121 = getelementptr i8, ptr addrspace(2) null, i64 %120
  %122 = mul i64 %117, 2
  %123 = add i64 0, %122
  %124 = getelementptr i8, ptr addrspace(6) inttoptr (i64 98304 to ptr addrspace(6)), i64 %123
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %121, ptr addrspace(6) %124, i64 12884968448)
  %125 = add i64 %114, 1
  br label %113

126:                                              ; preds = %113
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 2)
  %127 = sub i64 %91, %92
  %128 = call i64 @llvm.smax.i64(i64 %127, i64 0)
  %129 = call i64 @llvm.smin.i64(i64 %128, i64 64)
  %130 = mul i64 %92, %102
  %131 = add i64 %92, 1
  %132 = mul i64 %131, %102
  %133 = sub i64 %132, %130
  %134 = sext i32 %100 to i64
  %135 = add i64 %130, %134
  %136 = add i64 %135, %99
  br label %338

137:                                              ; preds = %140, %355
  %138 = phi i64 [ 0, %355 ], [ %149, %140 ]
  %139 = icmp slt i64 %138, 4
  br i1 %139, label %140, label %150

140:                                              ; preds = %137
  %141 = mul i64 %138, 16
  %142 = mul i64 %138, 1024
  %143 = mul i64 %142, 2
  %144 = add i64 0, %143
  %145 = getelementptr i8, ptr addrspace(2) inttoptr (i64 8192 to ptr addrspace(2)), i64 %144
  %146 = mul i64 %141, 2
  %147 = add i64 0, %146
  %148 = getelementptr i8, ptr addrspace(6) inttoptr (i64 106496 to ptr addrspace(6)), i64 %147
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %145, ptr addrspace(6) %148, i64 12884968448)
  %149 = add i64 %138, 1
  br label %137

150:                                              ; preds = %137
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 7)
  %151 = mul i64 %89, 64
  %152 = mul i32 %65, 64
  %153 = mul i32 %17, 64
  %154 = sext i32 %153 to i64
  %155 = sext i32 %152 to i64
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 9)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 10)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 11)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 5)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 4)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 7)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 6)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 5)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 4)
  br label %156

156:                                              ; preds = %1031, %150
  %157 = phi i32 [ %1060, %1031 ], [ 0, %150 ]
  %158 = phi i64 [ %426, %1031 ], [ 0, %150 ]
  %159 = phi i64 [ %396, %1031 ], [ 0, %150 ]
  %160 = phi i64 [ %1010, %1031 ], [ 0, %150 ]
  %161 = phi i64 [ %1011, %1031 ], [ 0, %150 ]
  %162 = phi i64 [ %1012, %1031 ], [ 0, %150 ]
  %163 = icmp slt i32 %157, %85
  br i1 %163, label %164, label %302

164:                                              ; preds = %156
  %165 = sub i64 %90, %159
  %166 = call i64 @llvm.smax.i64(i64 %165, i64 0)
  %167 = call i64 @llvm.smin.i64(i64 %166, i64 64)
  %168 = mul i64 %159, %154
  %169 = add i64 %159, 1
  %170 = mul i64 %169, %154
  %171 = sub i64 %170, %168
  %172 = sext i32 %152 to i64
  %173 = add i64 %168, %172
  %174 = add i64 %173, %151
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 4)
  br label %367

175:                                              ; preds = %178, %384
  %176 = phi i64 [ 0, %384 ], [ %187, %178 ]
  %177 = icmp slt i64 %176, 4
  br i1 %177, label %178, label %188

178:                                              ; preds = %175
  %179 = mul i64 %176, 16
  %180 = mul i64 %176, 1024
  %181 = mul i64 %180, 2
  %182 = add i64 0, %181
  %183 = getelementptr i8, ptr addrspace(2) inttoptr (i64 16384 to ptr addrspace(2)), i64 %182
  %184 = mul i64 %179, 2
  %185 = add i64 0, %184
  %186 = getelementptr i8, ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), i64 %185
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %183, ptr addrspace(6) %186, i64 12884968448)
  %187 = add i64 %176, 1
  br label %175

188:                                              ; preds = %175
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 5)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 4)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 4)
  br label %189

189:                                              ; preds = %192, %188
  %190 = phi i64 [ %201, %192 ], [ 0, %188 ]
  %191 = icmp slt i64 %190, 4
  br i1 %191, label %192, label %202

192:                                              ; preds = %189
  %193 = mul i64 %190, 16
  %194 = mul i64 %190, 1024
  %195 = mul i64 %194, 2
  %196 = add i64 0, %195
  %197 = getelementptr i8, ptr addrspace(2) inttoptr (i64 24576 to ptr addrspace(2)), i64 %196
  %198 = mul i64 %193, 2
  %199 = add i64 0, %198
  %200 = getelementptr i8, ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), i64 %199
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %197, ptr addrspace(6) %200, i64 12884968448)
  %201 = add i64 %190, 1
  br label %189

202:                                              ; preds = %189
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 4)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 4)
  %203 = sub i64 %90, %158
  %204 = call i64 @llvm.smax.i64(i64 %203, i64 0)
  %205 = call i64 @llvm.smin.i64(i64 %204, i64 64)
  %206 = mul i64 %158, %154
  %207 = add i64 %158, 1
  %208 = mul i64 %207, %154
  %209 = sub i64 %208, %206
  %210 = sext i32 %152 to i64
  %211 = add i64 %206, %210
  %212 = add i64 %211, %151
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 2)
  br label %397

213:                                              ; preds = %216, %414
  %214 = phi i64 [ 0, %414 ], [ %225, %216 ]
  %215 = icmp slt i64 %214, 4
  br i1 %215, label %216, label %226

216:                                              ; preds = %213
  %217 = mul i64 %214, 16
  %218 = mul i64 %214, 1024
  %219 = mul i64 %218, 2
  %220 = add i64 0, %219
  %221 = getelementptr i8, ptr addrspace(2) inttoptr (i64 32768 to ptr addrspace(2)), i64 %220
  %222 = mul i64 %217, 2
  %223 = add i64 0, %222
  %224 = getelementptr i8, ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), i64 %223
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %221, ptr addrspace(6) %224, i64 12884968448)
  %225 = add i64 %214, 1
  br label %213

226:                                              ; preds = %213
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 3)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 6)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 8)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 2)
  br label %227

227:                                              ; preds = %230, %226
  %228 = phi i64 [ %239, %230 ], [ 0, %226 ]
  %229 = icmp slt i64 %228, 4
  br i1 %229, label %230, label %240

230:                                              ; preds = %227
  %231 = mul i64 %228, 16
  %232 = mul i64 %228, 1024
  %233 = mul i64 %232, 2
  %234 = add i64 0, %233
  %235 = getelementptr i8, ptr addrspace(2) inttoptr (i64 40960 to ptr addrspace(2)), i64 %234
  %236 = mul i64 %231, 2
  %237 = add i64 0, %236
  %238 = getelementptr i8, ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), i64 %237
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %235, ptr addrspace(6) %238, i64 12884968448)
  %239 = add i64 %228, 1
  br label %227

240:                                              ; preds = %227
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 2)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 8)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 10)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 9)
  %241 = sub i64 %90, %162
  %242 = call i64 @llvm.smax.i64(i64 %241, i64 0)
  %243 = call i64 @llvm.smin.i64(i64 %242, i64 64)
  %244 = sub i64 %91, %92
  %245 = call i64 @llvm.smax.i64(i64 %244, i64 0)
  %246 = call i64 @llvm.smin.i64(i64 %245, i64 64)
  %247 = mul i64 %162, %95
  %248 = add i64 %247, %92
  %249 = add i64 %162, 1
  %250 = mul i64 %249, %95
  %251 = add i64 %250, %92
  %252 = sub i64 %251, %248
  %253 = sext i32 %94 to i64
  %254 = add i64 %248, %253
  br label %427

255:                                              ; preds = %258, %1009
  %256 = phi i64 [ 0, %1009 ], [ %267, %258 ]
  %257 = icmp slt i64 %256, 4
  br i1 %257, label %258, label %268

258:                                              ; preds = %255
  %259 = mul i64 %256, 16
  %260 = mul i64 %256, 1024
  %261 = mul i64 %260, 2
  %262 = add i64 0, %261
  %263 = getelementptr i8, ptr addrspace(2) inttoptr (i64 49152 to ptr addrspace(2)), i64 %262
  %264 = mul i64 %259, 2
  %265 = add i64 0, %264
  %266 = getelementptr i8, ptr addrspace(6) inttoptr (i64 139264 to ptr addrspace(6)), i64 %265
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %263, ptr addrspace(6) %266, i64 12884968448)
  %267 = add i64 %256, 1
  br label %255

268:                                              ; preds = %255
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 7)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 1)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 6)
  br label %269

269:                                              ; preds = %272, %268
  %270 = phi i64 [ %281, %272 ], [ 0, %268 ]
  %271 = icmp slt i64 %270, 4
  br i1 %271, label %272, label %282

272:                                              ; preds = %269
  %273 = mul i64 %270, 16
  %274 = mul i64 %270, 1024
  %275 = mul i64 %274, 2
  %276 = add i64 0, %275
  %277 = getelementptr i8, ptr addrspace(2) inttoptr (i64 57344 to ptr addrspace(2)), i64 %276
  %278 = mul i64 %273, 2
  %279 = add i64 0, %278
  %280 = getelementptr i8, ptr addrspace(6) inttoptr (i64 131072 to ptr addrspace(6)), i64 %279
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %277, ptr addrspace(6) %280, i64 12884968448)
  %281 = add i64 %270, 1
  br label %269

282:                                              ; preds = %269
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 6)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 3)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 5)
  br label %283

283:                                              ; preds = %286, %282
  %284 = phi i64 [ %295, %286 ], [ 0, %282 ]
  %285 = icmp slt i64 %284, 4
  br i1 %285, label %286, label %296

286:                                              ; preds = %283
  %287 = mul i64 %284, 16
  %288 = mul i64 %284, 1024
  %289 = mul i64 %288, 2
  %290 = add i64 0, %289
  %291 = getelementptr i8, ptr addrspace(2) inttoptr (i64 65536 to ptr addrspace(2)), i64 %290
  %292 = mul i64 %287, 2
  %293 = add i64 0, %292
  %294 = getelementptr i8, ptr addrspace(6) inttoptr (i64 139264 to ptr addrspace(6)), i64 %293
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %291, ptr addrspace(6) %294, i64 12884968448)
  %295 = add i64 %284, 1
  br label %283

296:                                              ; preds = %283
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 5)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 5)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 9)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 10)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 11)
  %297 = sext i32 %157 to i64
  %298 = add i64 %87, %297
  %299 = mul i64 %298, %88
  %300 = mul i64 %299, 64
  %301 = add i64 %300, %155
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 4)
  br label %1013

302:                                              ; preds = %156
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 4)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 7)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 4)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 5)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 8)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 6)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 5)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 4)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 3)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 1)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 13)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 12)
  %303 = mul i64 %96, %88
  %304 = mul i64 %303, 64
  br label %1061

305:                                              ; preds = %1148, %46
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 3)
  %306 = add i32 %44, 28
  br label %43

307:                                              ; preds = %43
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 3)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 7)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 2)
  call void @llvm.hivm.BARRIER(i64 6)
  br label %308

308:                                              ; preds = %307, %23
  ret void

309:                                              ; preds = %324, %68
  %310 = phi i32 [ %325, %324 ], [ 0, %68 ]
  %311 = icmp sle i32 %310, 0
  br i1 %311, label %312, label %326

312:                                              ; preds = %309
  %313 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %314

314:                                              ; preds = %317, %312
  %315 = phi i64 [ %322, %317 ], [ 0, %312 ]
  %316 = icmp slt i64 %315, 32
  br i1 %316, label %317, label %323

317:                                              ; preds = %314
  %318 = mul i64 %315, 128
  %319 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %313, i32 0)
  %320 = trunc i64 %318 to i32
  %321 = mul i32 %320, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %319, ptr addrspace(6) inttoptr (i64 98304 to ptr addrspace(6)), i32 %321, i32 1, i32 0, <256 x i1> %313)
  %322 = add i64 %315, 1
  br label %314

323:                                              ; preds = %314
  br label %324

324:                                              ; preds = %323
  %325 = add i32 %310, 1
  br label %309, !llvm.loop !3

326:                                              ; preds = %309
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  %327 = and i64 %105, 2097151
  %328 = shl i64 %327, 4
  %329 = or i64 %328, 288230380446679040
  %330 = mul i64 %109, 2
  %331 = and i64 %330, 1099511627775
  %332 = or i64 %331, 140737488355328
  %333 = ptrtoint ptr addrspace(1) %1 to i64
  %334 = mul i64 %112, 2
  %335 = add i64 0, %334
  %336 = add i64 %333, %335
  %337 = inttoptr i64 %336 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 98304 to ptr addrspace(6)), ptr addrspace(1) %337, i64 %329, i64 %332)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 0)
  br label %113

338:                                              ; preds = %353, %126
  %339 = phi i32 [ %354, %353 ], [ 0, %126 ]
  %340 = icmp sle i32 %339, 0
  br i1 %340, label %341, label %355

341:                                              ; preds = %338
  %342 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %343

343:                                              ; preds = %346, %341
  %344 = phi i64 [ %351, %346 ], [ 0, %341 ]
  %345 = icmp slt i64 %344, 32
  br i1 %345, label %346, label %352

346:                                              ; preds = %343
  %347 = mul i64 %344, 128
  %348 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %342, i32 0)
  %349 = trunc i64 %347 to i32
  %350 = mul i32 %349, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %348, ptr addrspace(6) inttoptr (i64 106496 to ptr addrspace(6)), i32 %350, i32 1, i32 0, <256 x i1> %342)
  %351 = add i64 %344, 1
  br label %343

352:                                              ; preds = %343
  br label %353

353:                                              ; preds = %352
  %354 = add i32 %339, 1
  br label %338, !llvm.loop !5

355:                                              ; preds = %338
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  %356 = and i64 %129, 2097151
  %357 = shl i64 %356, 4
  %358 = or i64 %357, 288230380446679040
  %359 = mul i64 %133, 2
  %360 = and i64 %359, 1099511627775
  %361 = or i64 %360, 140737488355328
  %362 = ptrtoint ptr addrspace(1) %2 to i64
  %363 = mul i64 %136, 2
  %364 = add i64 0, %363
  %365 = add i64 %362, %364
  %366 = inttoptr i64 %365 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 106496 to ptr addrspace(6)), ptr addrspace(1) %366, i64 %358, i64 %361)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 1)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 7)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 1)
  br label %137

367:                                              ; preds = %382, %164
  %368 = phi i32 [ %383, %382 ], [ 0, %164 ]
  %369 = icmp sle i32 %368, 0
  br i1 %369, label %370, label %384

370:                                              ; preds = %367
  %371 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %372

372:                                              ; preds = %375, %370
  %373 = phi i64 [ %380, %375 ], [ 0, %370 ]
  %374 = icmp slt i64 %373, 32
  br i1 %374, label %375, label %381

375:                                              ; preds = %372
  %376 = mul i64 %373, 128
  %377 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %371, i32 0)
  %378 = trunc i64 %376 to i32
  %379 = mul i32 %378, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %377, ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), i32 %379, i32 1, i32 0, <256 x i1> %371)
  %380 = add i64 %373, 1
  br label %372

381:                                              ; preds = %372
  br label %382

382:                                              ; preds = %381
  %383 = add i32 %368, 1
  br label %367, !llvm.loop !6

384:                                              ; preds = %367
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 3)
  %385 = and i64 %167, 2097151
  %386 = shl i64 %385, 4
  %387 = or i64 %386, 288230380446679040
  %388 = mul i64 %171, 2
  %389 = and i64 %388, 1099511627775
  %390 = or i64 %389, 140737488355328
  %391 = ptrtoint ptr addrspace(1) %6 to i64
  %392 = mul i64 %174, 2
  %393 = add i64 0, %392
  %394 = add i64 %391, %393
  %395 = inttoptr i64 %394 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), ptr addrspace(1) %395, i64 %387, i64 %390)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 4)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 5)
  %396 = add i64 %159, 64
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 0)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 5)
  br label %175

397:                                              ; preds = %412, %202
  %398 = phi i32 [ %413, %412 ], [ 0, %202 ]
  %399 = icmp sle i32 %398, 0
  br i1 %399, label %400, label %414

400:                                              ; preds = %397
  %401 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %402

402:                                              ; preds = %405, %400
  %403 = phi i64 [ %410, %405 ], [ 0, %400 ]
  %404 = icmp slt i64 %403, 32
  br i1 %404, label %405, label %411

405:                                              ; preds = %402
  %406 = mul i64 %403, 128
  %407 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %401, i32 0)
  %408 = trunc i64 %406 to i32
  %409 = mul i32 %408, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %407, ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), i32 %409, i32 1, i32 0, <256 x i1> %401)
  %410 = add i64 %403, 1
  br label %402

411:                                              ; preds = %402
  br label %412

412:                                              ; preds = %411
  %413 = add i32 %398, 1
  br label %397, !llvm.loop !7

414:                                              ; preds = %397
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 3)
  %415 = and i64 %205, 2097151
  %416 = shl i64 %415, 4
  %417 = or i64 %416, 288230380446679040
  %418 = mul i64 %209, 2
  %419 = and i64 %418, 1099511627775
  %420 = or i64 %419, 140737488355328
  %421 = ptrtoint ptr addrspace(1) %0 to i64
  %422 = mul i64 %212, 2
  %423 = add i64 0, %422
  %424 = add i64 %421, %423
  %425 = inttoptr i64 %424 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), ptr addrspace(1) %425, i64 %417, i64 %420)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 3)
  %426 = add i64 %158, 64
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 6)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 3)
  br label %213

427:                                              ; preds = %433, %240
  %428 = phi i32 [ %434, %433 ], [ 0, %240 ]
  %429 = icmp sle i32 %428, 0
  br i1 %429, label %430, label %435

430:                                              ; preds = %427
  %431 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %432 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %432, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %431)
  br label %433

433:                                              ; preds = %430
  %434 = add i32 %428, 1
  br label %427, !llvm.loop !8

435:                                              ; preds = %427
  %436 = trunc i64 %243 to i32
  br label %437

437:                                              ; preds = %443, %435
  %438 = phi i32 [ %444, %443 ], [ 0, %435 ]
  %439 = icmp sle i32 %438, 0
  br i1 %439, label %440, label %445

440:                                              ; preds = %437
  %441 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %442 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %436, <256 x i1> %441, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %442, ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %441)
  br label %443

443:                                              ; preds = %440
  %444 = add i32 %438, 1
  br label %437, !llvm.loop !9

445:                                              ; preds = %437
  br label %446

446:                                              ; preds = %462, %445
  %447 = phi i32 [ %463, %462 ], [ 0, %445 ]
  %448 = icmp sle i32 %447, 0
  br i1 %448, label %449, label %464

449:                                              ; preds = %446
  %450 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %451 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %450, i32 0)
  %452 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 1, <256 x i1> %450, i32 0)
  %453 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 64)
  %454 = extractvalue { <256 x i1>, i32 } %453, 0
  %455 = extractvalue { <256 x i1>, i32 } %453, 1
  %456 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %457 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %458 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32> %456, <64 x i32> %457, <256 x i1> %450)
  %459 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %452, <64 x i32> %451, <256 x i1> %458)
  %460 = call <128 x i16> @llvm.hivm.vpack.x.v64i32(<64 x i32> %459, i32 0)
  %461 = call <256 x i8> @llvm.hivm.vpack.x.v128i16(<128 x i16> %460, i32 0)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %461, ptr addrspace(6) inttoptr (i64 172544 to ptr addrspace(6)), i32 0, i32 0, i32 0, <256 x i1> %454)
  br label %462

462:                                              ; preds = %449
  %463 = add i32 %447, 1
  br label %446, !llvm.loop !10

464:                                              ; preds = %446
  br label %465

465:                                              ; preds = %471, %464
  %466 = phi i32 [ %472, %471 ], [ 0, %464 ]
  %467 = icmp sle i32 %466, 0
  br i1 %467, label %468, label %473

468:                                              ; preds = %465
  %469 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %470 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %470, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %469)
  br label %471

471:                                              ; preds = %468
  %472 = add i32 %466, 1
  br label %465, !llvm.loop !11

473:                                              ; preds = %465
  %474 = trunc i64 %246 to i32
  br label %475

475:                                              ; preds = %481, %473
  %476 = phi i32 [ %482, %481 ], [ 0, %473 ]
  %477 = icmp sle i32 %476, 0
  br i1 %477, label %478, label %483

478:                                              ; preds = %475
  %479 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %480 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %474, <256 x i1> %479, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %480, ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %479)
  br label %481

481:                                              ; preds = %478
  %482 = add i32 %476, 1
  br label %475, !llvm.loop !12

483:                                              ; preds = %475
  br label %484

484:                                              ; preds = %500, %483
  %485 = phi i32 [ %501, %500 ], [ 0, %483 ]
  %486 = icmp sle i32 %485, 0
  br i1 %486, label %487, label %502

487:                                              ; preds = %484
  %488 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %489 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %488, i32 0)
  %490 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 1, <256 x i1> %488, i32 0)
  %491 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 64)
  %492 = extractvalue { <256 x i1>, i32 } %491, 0
  %493 = extractvalue { <256 x i1>, i32 } %491, 1
  %494 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %495 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %496 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32> %494, <64 x i32> %495, <256 x i1> %488)
  %497 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %490, <64 x i32> %489, <256 x i1> %496)
  %498 = call <128 x i16> @llvm.hivm.vpack.x.v64i32(<64 x i32> %497, i32 0)
  %499 = call <256 x i8> @llvm.hivm.vpack.x.v128i16(<128 x i16> %498, i32 0)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %499, ptr addrspace(6) inttoptr (i64 172608 to ptr addrspace(6)), i32 0, i32 0, i32 0, <256 x i1> %492)
  br label %500

500:                                              ; preds = %487
  %501 = add i32 %485, 1
  br label %484, !llvm.loop !13

502:                                              ; preds = %484
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  %503 = and i64 %243, 2097151
  %504 = and i64 %246, 2097151
  %505 = shl i64 %503, 4
  %506 = shl i64 %504, 25
  %507 = or i64 %505, %506
  %508 = or i64 %507, 288230376151711744
  %509 = and i64 %252, 1099511627775
  %510 = or i64 %509, 70368744177664
  %511 = ptrtoint ptr addrspace(1) %11 to i64
  %512 = add i64 %254, 0
  %513 = add i64 %511, %512
  %514 = inttoptr i64 %513 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 163840 to ptr addrspace(6)), ptr addrspace(1) %514, i64 %508, i64 %510)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  br label %515

515:                                              ; preds = %534, %502
  %516 = phi i32 [ %535, %534 ], [ 0, %502 ]
  %517 = icmp sle i32 %516, 0
  br i1 %517, label %518, label %536

518:                                              ; preds = %515
  %519 = call <256 x i1> @llvm.hivm.pset.b8(i32 2)
  %520 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %519, i32 0)
  br label %521

521:                                              ; preds = %524, %518
  %522 = phi i64 [ %532, %524 ], [ 0, %518 ]
  %523 = icmp slt i64 %522, 4096
  br i1 %523, label %524, label %533

524:                                              ; preds = %521
  %525 = trunc i64 %522 to i32
  %526 = udiv i32 %525, 64
  %527 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 172544 to ptr addrspace(6)), i32 %526, i32 1, i32 0)
  %528 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s8(<256 x i8> %527, <256 x i8> %520, <256 x i1> %519)
  %529 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %519, i32 0)
  %530 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 163840 to ptr addrspace(6)), i32 %525, i32 1, i32 0)
  %531 = call <256 x i8> @llvm.hivm.vsel.v256i8(<256 x i8> %530, <256 x i8> %529, <256 x i1> %528)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %531, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %525, i32 3, i32 0, <256 x i1> %519)
  %532 = add i64 %522, 1
  br label %521

533:                                              ; preds = %521
  br label %534

534:                                              ; preds = %533
  %535 = add i32 %516, 1
  br label %515, !llvm.loop !14

536:                                              ; preds = %515
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  br label %537

537:                                              ; preds = %556, %536
  %538 = phi i32 [ %557, %556 ], [ 0, %536 ]
  %539 = icmp sle i32 %538, 0
  br i1 %539, label %540, label %558

540:                                              ; preds = %537
  %541 = call <256 x i1> @llvm.hivm.pset.b8(i32 2)
  %542 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %541, i32 0)
  br label %543

543:                                              ; preds = %546, %540
  %544 = phi i64 [ %554, %546 ], [ 0, %540 ]
  %545 = icmp slt i64 %544, 4096
  br i1 %545, label %546, label %555

546:                                              ; preds = %543
  %547 = trunc i64 %544 to i32
  %548 = urem i32 %547, 64
  %549 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 172608 to ptr addrspace(6)), i32 %548, i32 1, i32 0)
  %550 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s8(<256 x i8> %549, <256 x i8> %542, <256 x i1> %541)
  %551 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %541, i32 0)
  %552 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %547, i32 1, i32 0)
  %553 = call <256 x i8> @llvm.hivm.vsel.v256i8(<256 x i8> %552, <256 x i8> %551, <256 x i1> %550)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %553, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %547, i32 3, i32 0, <256 x i1> %541)
  %554 = add i64 %544, 1
  br label %543

555:                                              ; preds = %543
  br label %556

556:                                              ; preds = %555
  %557 = add i32 %538, 1
  br label %537, !llvm.loop !15

558:                                              ; preds = %537
  %559 = sub i64 %90, %160
  %560 = call i64 @llvm.smax.i64(i64 %559, i64 0)
  %561 = call i64 @llvm.smin.i64(i64 %560, i64 64)
  %562 = mul i64 %160, %88
  %563 = add i64 %160, 1
  %564 = mul i64 %563, %88
  %565 = sub i64 %564, %562
  %566 = sext i32 %65 to i64
  %567 = add i64 %562, %566
  %568 = add i64 %567, %89
  br label %569

569:                                              ; preds = %575, %558
  %570 = phi i32 [ %576, %575 ], [ 0, %558 ]
  %571 = icmp sle i32 %570, 0
  br i1 %571, label %572, label %577

572:                                              ; preds = %569
  %573 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %574 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %574, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %573)
  br label %575

575:                                              ; preds = %572
  %576 = add i32 %570, 1
  br label %569, !llvm.loop !16

577:                                              ; preds = %569
  %578 = trunc i64 %561 to i32
  br label %579

579:                                              ; preds = %585, %577
  %580 = phi i32 [ %586, %585 ], [ 0, %577 ]
  %581 = icmp sle i32 %580, 0
  br i1 %581, label %582, label %587

582:                                              ; preds = %579
  %583 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %584 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %578, <256 x i1> %583, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %584, ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %583)
  br label %585

585:                                              ; preds = %582
  %586 = add i32 %580, 1
  br label %579, !llvm.loop !17

587:                                              ; preds = %579
  br label %588

588:                                              ; preds = %604, %587
  %589 = phi i32 [ %605, %604 ], [ 0, %587 ]
  %590 = icmp sle i32 %589, 0
  br i1 %590, label %591, label %606

591:                                              ; preds = %588
  %592 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %593 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %592, i32 0)
  %594 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 1, <256 x i1> %592, i32 0)
  %595 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 64)
  %596 = extractvalue { <256 x i1>, i32 } %595, 0
  %597 = extractvalue { <256 x i1>, i32 } %595, 1
  %598 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %599 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %600 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32> %598, <64 x i32> %599, <256 x i1> %592)
  %601 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %594, <64 x i32> %593, <256 x i1> %600)
  %602 = call <128 x i16> @llvm.hivm.vpack.x.v64i32(<64 x i32> %601, i32 0)
  %603 = call <256 x i8> @llvm.hivm.vpack.x.v128i16(<128 x i16> %602, i32 0)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %603, ptr addrspace(6) inttoptr (i64 168960 to ptr addrspace(6)), i32 0, i32 0, i32 0, <256 x i1> %596)
  br label %604

604:                                              ; preds = %591
  %605 = add i32 %589, 1
  br label %588, !llvm.loop !18

606:                                              ; preds = %588
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 2)
  %607 = and i64 %561, 2097151
  %608 = shl i64 %607, 4
  %609 = or i64 %608, 288230376285929472
  %610 = mul i64 %565, 4
  %611 = and i64 %610, 1099511627775
  %612 = or i64 %611, 4398046511104
  %613 = ptrtoint ptr addrspace(1) %7 to i64
  %614 = mul i64 %568, 4
  %615 = add i64 0, %614
  %616 = add i64 %613, %615
  %617 = inttoptr i64 %616 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) inttoptr (i64 167936 to ptr addrspace(6)), ptr addrspace(1) %617, i64 %609, i64 %612)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 2)
  br label %618

618:                                              ; preds = %640, %606
  %619 = phi i32 [ %641, %640 ], [ 0, %606 ]
  %620 = icmp sle i32 %619, 0
  br i1 %620, label %621, label %642

621:                                              ; preds = %618
  %622 = call <256 x i1> @llvm.hivm.pset.b8(i32 2)
  %623 = call <256 x i1> @llvm.hivm.pset.b32(i32 2)
  %624 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %622, i32 0)
  br label %625

625:                                              ; preds = %628, %621
  %626 = phi i64 [ %638, %628 ], [ 0, %621 ]
  %627 = icmp slt i64 %626, 64
  br i1 %627, label %628, label %639

628:                                              ; preds = %625
  %629 = trunc i64 %626 to i32
  %630 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 168960 to ptr addrspace(6)), i32 %629, i32 1, i32 0)
  %631 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s8(<256 x i8> %630, <256 x i8> %624, <256 x i1> %622)
  %632 = call <256 x i1> @llvm.hivm.punpack(<256 x i1> %631, i32 0)
  %633 = call <256 x i1> @llvm.hivm.punpack(<256 x i1> %632, i32 0)
  %634 = mul i32 %629, 4
  %635 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %623, i32 0)
  %636 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 167936 to ptr addrspace(6)), i32 %634, i32 3, i32 0)
  %637 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %636, <64 x float> %635, <256 x i1> %633)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %637, ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i32 %634, i32 5, i32 0, <256 x i1> %623)
  %638 = add i64 %626, 1
  br label %625

639:                                              ; preds = %625
  br label %640

640:                                              ; preds = %639
  %641 = add i32 %619, 1
  br label %618, !llvm.loop !19

642:                                              ; preds = %618
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 2)
  br label %643

643:                                              ; preds = %659, %642
  %644 = phi i32 [ %660, %659 ], [ 0, %642 ]
  %645 = icmp sle i32 %644, 0
  br i1 %645, label %646, label %661

646:                                              ; preds = %643
  %647 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %648

648:                                              ; preds = %651, %646
  %649 = phi i64 [ %657, %651 ], [ 0, %646 ]
  %650 = icmp slt i64 %649, 64
  br i1 %650, label %651, label %658

651:                                              ; preds = %648
  %652 = mul i64 %649, 64
  %653 = trunc i64 %652 to i32
  %654 = mul i32 %653, 4
  %655 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 16384 to ptr addrspace(6)), i32 %654, i32 0, i32 0)
  %656 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %655, float %86, <256 x i1> %647)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %656, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %654, i32 2, i32 0, <256 x i1> %647)
  %657 = add i64 %649, 1
  br label %648

658:                                              ; preds = %648
  br label %659

659:                                              ; preds = %658
  %660 = add i32 %644, 1
  br label %643, !llvm.loop !20

661:                                              ; preds = %643
  br label %662

662:                                              ; preds = %669, %661
  %663 = phi i32 [ %670, %669 ], [ 0, %661 ]
  %664 = icmp sle i32 %663, 0
  br i1 %664, label %665, label %671

665:                                              ; preds = %662
  %666 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %667 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %668 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %667, float 0x3FF7154760000000, <256 x i1> %666)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %668, ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %666)
  br label %669

669:                                              ; preds = %665
  %670 = add i32 %663, 1
  br label %662, !llvm.loop !21

671:                                              ; preds = %662
  br label %672

672:                                              ; preds = %692, %671
  %673 = phi i32 [ %693, %692 ], [ 0, %671 ]
  %674 = icmp sle i32 %673, 0
  br i1 %674, label %675, label %694

675:                                              ; preds = %672
  %676 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %677

677:                                              ; preds = %680, %675
  %678 = phi i64 [ %690, %680 ], [ 0, %675 ]
  %679 = icmp slt i64 %678, 64
  br i1 %679, label %680, label %691

680:                                              ; preds = %677
  %681 = trunc i64 %678 to i32
  %682 = mul i32 %681, 64
  %683 = mul i32 %681, 256
  %684 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %683, i32 0, i32 0)
  %685 = udiv i32 %682, 64
  %686 = urem i32 %685, 64
  %687 = mul i32 %686, 4
  %688 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i32 %687, i32 3, i32 0)
  %689 = call <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float> %684, <64 x float> %688, <256 x i1> %676)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %689, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %683, i32 2, i32 0, <256 x i1> %676)
  %690 = add i64 %678, 1
  br label %677

691:                                              ; preds = %677
  br label %692

692:                                              ; preds = %691
  %693 = add i32 %673, 1
  br label %672, !llvm.loop !22

694:                                              ; preds = %672
  br label %695

695:                                              ; preds = %716, %694
  %696 = phi i32 [ %717, %716 ], [ 0, %694 ]
  %697 = icmp sle i32 %696, 0
  br i1 %697, label %698, label %718

698:                                              ; preds = %695
  %699 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %700

700:                                              ; preds = %703, %698
  %701 = phi i64 [ %714, %703 ], [ 0, %698 ]
  %702 = icmp slt i64 %701, 64
  br i1 %702, label %703, label %715

703:                                              ; preds = %700
  %704 = trunc i64 %701 to i32
  %705 = udiv i32 %704, 64
  %706 = urem i32 %704, 64
  %707 = mul i32 %706, 64
  %708 = mul i32 %705, 4096
  %709 = add i32 %708, %707
  %710 = mul i32 %709, 4
  %711 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %710, i32 0, i32 0)
  %712 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %711, float 0x3FE62E4300000000, <256 x i1> %699)
  %713 = call <64 x float> @llvm.hivm.vexp.x.v64f32(<64 x float> %712, <256 x i1> %699)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %713, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %710, i32 2, i32 0, <256 x i1> %699)
  %714 = add i64 %701, 1
  br label %700

715:                                              ; preds = %700
  br label %716

716:                                              ; preds = %715
  %717 = add i32 %696, 1
  br label %695, !llvm.loop !23

718:                                              ; preds = %695
  br label %719

719:                                              ; preds = %733, %718
  %720 = phi i32 [ %734, %733 ], [ 0, %718 ]
  %721 = icmp sle i32 %720, 0
  br i1 %721, label %722, label %735

722:                                              ; preds = %719
  %723 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)
  br label %724

724:                                              ; preds = %727, %722
  %725 = phi i64 [ %731, %727 ], [ 0, %722 ]
  %726 = icmp slt i64 %725, 16
  br i1 %726, label %727, label %732

727:                                              ; preds = %724
  %728 = mul i64 %725, 256
  %729 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %723, i32 0)
  %730 = trunc i64 %728 to i32
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %729, ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i32 %730, i32 0, i32 0, <256 x i1> %723)
  %731 = add i64 %725, 1
  br label %724

732:                                              ; preds = %724
  br label %733

733:                                              ; preds = %732
  %734 = add i32 %720, 1
  br label %719, !llvm.loop !24

735:                                              ; preds = %719
  br label %736

736:                                              ; preds = %765, %735
  %737 = phi i32 [ %766, %765 ], [ 0, %735 ]
  %738 = icmp sle i32 %737, 0
  br i1 %738, label %739, label %767

739:                                              ; preds = %736
  br label %740

740:                                              ; preds = %762, %739
  %741 = phi i64 [ %763, %762 ], [ 0, %739 ]
  %742 = icmp slt i64 %741, 64
  br i1 %742, label %743, label %764

743:                                              ; preds = %740
  br label %744

744:                                              ; preds = %747, %743
  %745 = phi i64 [ %761, %747 ], [ 0, %743 ]
  %746 = icmp slt i64 %745, 64
  br i1 %746, label %747, label %762

747:                                              ; preds = %744
  %748 = mul i64 %741, 64
  %749 = add i64 %748, %745
  %750 = getelementptr i8, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i64 %749
  %751 = load i8, ptr addrspace(6) %750, align 1
  %752 = mul i64 %741, 64
  %753 = add i64 %752, %745
  %754 = getelementptr i8, ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i64 %753
  %755 = load i8, ptr addrspace(6) %754, align 1
  %756 = icmp ne i8 %751, %755
  %757 = mul i64 %741, 64
  %758 = add i64 %757, %745
  %759 = getelementptr i1, ptr addrspace(6) inttoptr (i64 201216 to ptr addrspace(6)), i64 %758
  %760 = zext i1 %756 to i8
  store i8 %760, ptr addrspace(6) %759, align 1
  %761 = add i64 %745, 1
  br label %744

762:                                              ; preds = %744
  %763 = add i64 %741, 1
  br label %740

764:                                              ; preds = %740
  br label %765

765:                                              ; preds = %764
  %766 = add i32 %737, 1
  br label %736, !llvm.loop !25

767:                                              ; preds = %736
  br label %768

768:                                              ; preds = %799, %767
  %769 = phi i32 [ %800, %799 ], [ 0, %767 ]
  %770 = icmp sle i32 %769, 0
  br i1 %770, label %771, label %801

771:                                              ; preds = %768
  %772 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %773 = call <256 x i8> @llvm.hivm.vbr.v256s8(i8 0)
  %774 = call <64 x i32> @llvm.hivm.vbr.v64s32(i32 0)
  br label %775

775:                                              ; preds = %778, %771
  %776 = phi i64 [ %797, %778 ], [ 0, %771 ]
  %777 = icmp slt i64 %776, 32
  br i1 %777, label %778, label %798

778:                                              ; preds = %775
  %779 = trunc i64 %776 to i32
  %780 = mul i32 %779, 128
  %781 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 201216 to ptr addrspace(6)), i32 %780, i32 13, i32 0)
  %782 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %781, <256 x i8> %773)
  %783 = extractvalue { <256 x i8>, <256 x i8> } %782, 0
  %784 = extractvalue { <256 x i8>, <256 x i8> } %782, 1
  %785 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %783, <256 x i1> %772, i32 0)
  %786 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %785, <64 x i32> %774, <256 x i1> %772)
  %787 = mul i32 %779, 512
  %788 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %772, i32 0)
  %789 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %787, i32 0, i32 0)
  %790 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %789, <64 x float> %788, <256 x i1> %786)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %790, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %787, i32 2, i32 0, <256 x i1> %772)
  %791 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %784, <256 x i1> %772, i32 0)
  %792 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %791, <64 x i32> %774, <256 x i1> %772)
  %793 = add i32 %780, 64
  %794 = mul i32 %793, 4
  %795 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %794, i32 0, i32 0)
  %796 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %795, <64 x float> %788, <256 x i1> %792)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %796, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %794, i32 2, i32 0, <256 x i1> %772)
  %797 = add i64 %776, 1
  br label %775

798:                                              ; preds = %775
  br label %799

799:                                              ; preds = %798
  %800 = add i32 %769, 1
  br label %768, !llvm.loop !26

801:                                              ; preds = %768
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 6)
  br label %802

802:                                              ; preds = %823, %801
  %803 = phi i32 [ %824, %823 ], [ 0, %801 ]
  %804 = icmp sle i32 %803, 0
  br i1 %804, label %805, label %825

805:                                              ; preds = %802
  %806 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %807

807:                                              ; preds = %810, %805
  %808 = phi i64 [ %821, %810 ], [ 0, %805 ]
  %809 = icmp slt i64 %808, 64
  br i1 %809, label %810, label %822

810:                                              ; preds = %807
  %811 = trunc i64 %808 to i32
  %812 = udiv i32 %811, 64
  %813 = urem i32 %811, 64
  %814 = mul i32 %813, 64
  %815 = mul i32 %812, 4096
  %816 = add i32 %815, %814
  %817 = mul i32 %816, 4
  %818 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %817, i32 0, i32 0)
  %819 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %818, <256 x i1> %806, i32 0, i32 0, i32 0)
  %820 = mul i32 %816, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %819, ptr addrspace(6) inttoptr (i64 131072 to ptr addrspace(6)), i32 %820, i32 7, i32 0, <256 x i1> %806)
  %821 = add i64 %808, 1
  br label %807

822:                                              ; preds = %807
  br label %823

823:                                              ; preds = %822
  %824 = add i32 %803, 1
  br label %802, !llvm.loop !27

825:                                              ; preds = %802
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 6)
  %826 = sub i64 %90, %161
  %827 = call i64 @llvm.smax.i64(i64 %826, i64 0)
  %828 = call i64 @llvm.smin.i64(i64 %827, i64 64)
  %829 = mul i64 %161, %88
  %830 = add i64 %161, 1
  %831 = mul i64 %830, %88
  %832 = sub i64 %831, %829
  %833 = add i64 %829, %566
  %834 = add i64 %833, %89
  br label %835

835:                                              ; preds = %841, %825
  %836 = phi i32 [ %842, %841 ], [ 0, %825 ]
  %837 = icmp sle i32 %836, 0
  br i1 %837, label %838, label %843

838:                                              ; preds = %835
  %839 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %840 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %840, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %839)
  br label %841

841:                                              ; preds = %838
  %842 = add i32 %836, 1
  br label %835, !llvm.loop !28

843:                                              ; preds = %835
  %844 = trunc i64 %828 to i32
  br label %845

845:                                              ; preds = %851, %843
  %846 = phi i32 [ %852, %851 ], [ 0, %843 ]
  %847 = icmp sle i32 %846, 0
  br i1 %847, label %848, label %853

848:                                              ; preds = %845
  %849 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %850 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %844, <256 x i1> %849, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %850, ptr addrspace(6) inttoptr (i64 185088 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %849)
  br label %851

851:                                              ; preds = %848
  %852 = add i32 %846, 1
  br label %845, !llvm.loop !29

853:                                              ; preds = %845
  br label %854

854:                                              ; preds = %870, %853
  %855 = phi i32 [ %871, %870 ], [ 0, %853 ]
  %856 = icmp sle i32 %855, 0
  br i1 %856, label %857, label %872

857:                                              ; preds = %854
  %858 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %859 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %858, i32 0)
  %860 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 1, <256 x i1> %858, i32 0)
  %861 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 64)
  %862 = extractvalue { <256 x i1>, i32 } %861, 0
  %863 = extractvalue { <256 x i1>, i32 } %861, 1
  %864 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %865 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 185088 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %866 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32> %864, <64 x i32> %865, <256 x i1> %858)
  %867 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %860, <64 x i32> %859, <256 x i1> %866)
  %868 = call <128 x i16> @llvm.hivm.vpack.x.v64i32(<64 x i32> %867, i32 0)
  %869 = call <256 x i8> @llvm.hivm.vpack.x.v128i16(<128 x i16> %868, i32 0)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %869, ptr addrspace(6) inttoptr (i64 185344 to ptr addrspace(6)), i32 0, i32 0, i32 0, <256 x i1> %862)
  br label %870

870:                                              ; preds = %857
  %871 = add i32 %855, 1
  br label %854, !llvm.loop !30

872:                                              ; preds = %854
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 1)
  %873 = and i64 %828, 2097151
  %874 = shl i64 %873, 4
  %875 = or i64 %874, 288230376285929472
  %876 = mul i64 %832, 4
  %877 = and i64 %876, 1099511627775
  %878 = or i64 %877, 4398046511104
  %879 = ptrtoint ptr addrspace(1) %8 to i64
  %880 = mul i64 %834, 4
  %881 = add i64 0, %880
  %882 = add i64 %879, %881
  %883 = inttoptr i64 %882 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) inttoptr (i64 168192 to ptr addrspace(6)), ptr addrspace(1) %883, i64 %875, i64 %878)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 1)
  br label %884

884:                                              ; preds = %906, %872
  %885 = phi i32 [ %907, %906 ], [ 0, %872 ]
  %886 = icmp sle i32 %885, 0
  br i1 %886, label %887, label %908

887:                                              ; preds = %884
  %888 = call <256 x i1> @llvm.hivm.pset.b8(i32 2)
  %889 = call <256 x i1> @llvm.hivm.pset.b32(i32 2)
  %890 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %888, i32 0)
  br label %891

891:                                              ; preds = %894, %887
  %892 = phi i64 [ %904, %894 ], [ 0, %887 ]
  %893 = icmp slt i64 %892, 64
  br i1 %893, label %894, label %905

894:                                              ; preds = %891
  %895 = trunc i64 %892 to i32
  %896 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 185344 to ptr addrspace(6)), i32 %895, i32 1, i32 0)
  %897 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s8(<256 x i8> %896, <256 x i8> %890, <256 x i1> %888)
  %898 = call <256 x i1> @llvm.hivm.punpack(<256 x i1> %897, i32 0)
  %899 = call <256 x i1> @llvm.hivm.punpack(<256 x i1> %898, i32 0)
  %900 = mul i32 %895, 4
  %901 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %889, i32 0)
  %902 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168192 to ptr addrspace(6)), i32 %900, i32 3, i32 0)
  %903 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %902, <64 x float> %901, <256 x i1> %899)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %903, ptr addrspace(6) inttoptr (i64 205312 to ptr addrspace(6)), i32 %900, i32 5, i32 0, <256 x i1> %889)
  %904 = add i64 %892, 1
  br label %891

905:                                              ; preds = %891
  br label %906

906:                                              ; preds = %905
  %907 = add i32 %885, 1
  br label %884, !llvm.loop !31

908:                                              ; preds = %884
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 1)
  br label %909

909:                                              ; preds = %929, %908
  %910 = phi i32 [ %930, %929 ], [ 0, %908 ]
  %911 = icmp sle i32 %910, 0
  br i1 %911, label %912, label %931

912:                                              ; preds = %909
  %913 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %914

914:                                              ; preds = %917, %912
  %915 = phi i64 [ %927, %917 ], [ 0, %912 ]
  %916 = icmp slt i64 %915, 64
  br i1 %916, label %917, label %928

917:                                              ; preds = %914
  %918 = trunc i64 %915 to i32
  %919 = mul i32 %918, 64
  %920 = mul i32 %918, 256
  %921 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) null, i32 %920, i32 0, i32 0)
  %922 = udiv i32 %919, 64
  %923 = urem i32 %922, 64
  %924 = mul i32 %923, 4
  %925 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 205312 to ptr addrspace(6)), i32 %924, i32 3, i32 0)
  %926 = call <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float> %921, <64 x float> %925, <256 x i1> %913)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %926, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %920, i32 2, i32 0, <256 x i1> %913)
  %927 = add i64 %915, 1
  br label %914

928:                                              ; preds = %914
  br label %929

929:                                              ; preds = %928
  %930 = add i32 %910, 1
  br label %909, !llvm.loop !32

931:                                              ; preds = %909
  br label %932

932:                                              ; preds = %949, %931
  %933 = phi i32 [ %950, %949 ], [ 0, %931 ]
  %934 = icmp sle i32 %933, 0
  br i1 %934, label %935, label %951

935:                                              ; preds = %932
  %936 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %937

937:                                              ; preds = %940, %935
  %938 = phi i64 [ %947, %940 ], [ 0, %935 ]
  %939 = icmp slt i64 %938, 64
  br i1 %939, label %940, label %948

940:                                              ; preds = %937
  %941 = mul i64 %938, 64
  %942 = trunc i64 %941 to i32
  %943 = mul i32 %942, 4
  %944 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %943, i32 0, i32 0)
  %945 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %943, i32 0, i32 0)
  %946 = call <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float> %944, <64 x float> %945, <256 x i1> %936)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %946, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %943, i32 2, i32 0, <256 x i1> %936)
  %947 = add i64 %938, 1
  br label %937

948:                                              ; preds = %937
  br label %949

949:                                              ; preds = %948
  %950 = add i32 %933, 1
  br label %932, !llvm.loop !33

951:                                              ; preds = %932
  br label %952

952:                                              ; preds = %983, %951
  %953 = phi i32 [ %984, %983 ], [ 0, %951 ]
  %954 = icmp sle i32 %953, 0
  br i1 %954, label %955, label %985

955:                                              ; preds = %952
  %956 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %957 = call <256 x i8> @llvm.hivm.vbr.v256s8(i8 0)
  %958 = call <64 x i32> @llvm.hivm.vbr.v64s32(i32 0)
  br label %959

959:                                              ; preds = %962, %955
  %960 = phi i64 [ %981, %962 ], [ 0, %955 ]
  %961 = icmp slt i64 %960, 32
  br i1 %961, label %962, label %982

962:                                              ; preds = %959
  %963 = trunc i64 %960 to i32
  %964 = mul i32 %963, 128
  %965 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 201216 to ptr addrspace(6)), i32 %964, i32 13, i32 0)
  %966 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %965, <256 x i8> %957)
  %967 = extractvalue { <256 x i8>, <256 x i8> } %966, 0
  %968 = extractvalue { <256 x i8>, <256 x i8> } %966, 1
  %969 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %967, <256 x i1> %956, i32 0)
  %970 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %969, <64 x i32> %958, <256 x i1> %956)
  %971 = mul i32 %963, 512
  %972 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %956, i32 0)
  %973 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %971, i32 0, i32 0)
  %974 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %973, <64 x float> %972, <256 x i1> %970)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %974, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %971, i32 2, i32 0, <256 x i1> %956)
  %975 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %968, <256 x i1> %956, i32 0)
  %976 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %975, <64 x i32> %958, <256 x i1> %956)
  %977 = add i32 %964, 64
  %978 = mul i32 %977, 4
  %979 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %978, i32 0, i32 0)
  %980 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %979, <64 x float> %972, <256 x i1> %976)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %980, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %978, i32 2, i32 0, <256 x i1> %956)
  %981 = add i64 %960, 1
  br label %959

982:                                              ; preds = %959
  br label %983

983:                                              ; preds = %982
  %984 = add i32 %953, 1
  br label %952, !llvm.loop !34

985:                                              ; preds = %952
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 7)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 5)
  br label %986

986:                                              ; preds = %1007, %985
  %987 = phi i32 [ %1008, %1007 ], [ 0, %985 ]
  %988 = icmp sle i32 %987, 0
  br i1 %988, label %989, label %1009

989:                                              ; preds = %986
  %990 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %991

991:                                              ; preds = %994, %989
  %992 = phi i64 [ %1005, %994 ], [ 0, %989 ]
  %993 = icmp slt i64 %992, 64
  br i1 %993, label %994, label %1006

994:                                              ; preds = %991
  %995 = trunc i64 %992 to i32
  %996 = udiv i32 %995, 64
  %997 = urem i32 %995, 64
  %998 = mul i32 %997, 64
  %999 = mul i32 %996, 4096
  %1000 = add i32 %999, %998
  %1001 = mul i32 %1000, 4
  %1002 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1001, i32 0, i32 0)
  %1003 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %1002, <256 x i1> %990, i32 0, i32 0, i32 0)
  %1004 = mul i32 %1000, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %1003, ptr addrspace(6) inttoptr (i64 139264 to ptr addrspace(6)), i32 %1004, i32 7, i32 0, <256 x i1> %990)
  %1005 = add i64 %992, 1
  br label %991

1006:                                             ; preds = %991
  br label %1007

1007:                                             ; preds = %1006
  %1008 = add i32 %987, 1
  br label %986, !llvm.loop !35

1009:                                             ; preds = %986
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 5)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 7)
  %1010 = add i64 %160, 64
  %1011 = add i64 %161, 64
  %1012 = add i64 %162, 64
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 7)
  br label %255

1013:                                             ; preds = %1029, %296
  %1014 = phi i32 [ %1030, %1029 ], [ 0, %296 ]
  %1015 = icmp sle i32 %1014, 0
  br i1 %1015, label %1016, label %1031

1016:                                             ; preds = %1013
  %1017 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1018

1018:                                             ; preds = %1021, %1016
  %1019 = phi i64 [ %1027, %1021 ], [ 0, %1016 ]
  %1020 = icmp slt i64 %1019, 64
  br i1 %1020, label %1021, label %1028

1021:                                             ; preds = %1018
  %1022 = mul i64 %1019, 64
  %1023 = trunc i64 %1022 to i32
  %1024 = mul i32 %1023, 4
  %1025 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 32768 to ptr addrspace(6)), i32 %1024, i32 0, i32 0)
  %1026 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %1025, float %19, <256 x i1> %1017)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1026, ptr addrspace(6) inttoptr (i64 81920 to ptr addrspace(6)), i32 %1024, i32 2, i32 0, <256 x i1> %1017)
  %1027 = add i64 %1019, 1
  br label %1018

1028:                                             ; preds = %1018
  br label %1029

1029:                                             ; preds = %1028
  %1030 = add i32 %1014, 1
  br label %1013, !llvm.loop !36

1031:                                             ; preds = %1013
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 4)
  %1032 = sub i32 %85, %157
  %1033 = call i32 @llvm.smax.i32(i32 %1032, i32 0)
  %1034 = call i32 @llvm.smin.i32(i32 %1033, i32 64)
  %1035 = sext i32 %1034 to i64
  %1036 = mul i32 %17, 64
  %1037 = sext i32 %1036 to i64
  %1038 = call i64 @llvm.hivm.GET.CTRL()
  %1039 = call i64 @llvm.hivm.SBITSET1(i64 %1038, i64 6)
  %1040 = call i64 @llvm.hivm.SBITSET0(i64 %1039, i64 7)
  %1041 = call i64 @llvm.hivm.SBITSET0(i64 %1040, i64 8)
  call void @llvm.hivm.SET.CTRL(i64 %1041)
  %1042 = call i64 @llvm.hivm.GET.CTRL()
  %1043 = call i64 @llvm.hivm.SBITSET0(i64 %1042, i64 9)
  %1044 = call i64 @llvm.hivm.SBITSET0(i64 %1043, i64 10)
  call void @llvm.hivm.SET.CTRL(i64 %1044)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 4)
  %1045 = and i64 %1035, 2097151
  %1046 = shl i64 %1045, 4
  %1047 = or i64 %1046, 288230384741646336
  %1048 = mul i64 %1037, 4
  %1049 = and i64 %1048, 1099511627775
  %1050 = or i64 %1049, 281474976710656
  %1051 = ptrtoint ptr addrspace(1) %3 to i64
  %1052 = mul i64 %301, 4
  %1053 = add i64 0, %1052
  %1054 = add i64 %1051, %1053
  %1055 = inttoptr i64 %1054 to ptr addrspace(1)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %1055, ptr addrspace(6) inttoptr (i64 81920 to ptr addrspace(6)), i64 %1047, i64 %1050)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 4)
  %1056 = call i64 @llvm.hivm.GET.CTRL()
  %1057 = call i64 @llvm.hivm.SBITSET0(i64 %1056, i64 6)
  %1058 = call i64 @llvm.hivm.SBITSET0(i64 %1057, i64 7)
  %1059 = call i64 @llvm.hivm.SBITSET0(i64 %1058, i64 8)
  call void @llvm.hivm.SET.CTRL(i64 %1059)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 11)
  %1060 = add i32 %157, 64
  br label %156

1061:                                             ; preds = %1077, %302
  %1062 = phi i32 [ %1078, %1077 ], [ 0, %302 ]
  %1063 = icmp sle i32 %1062, 0
  br i1 %1063, label %1064, label %1079

1064:                                             ; preds = %1061
  %1065 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1066

1066:                                             ; preds = %1069, %1064
  %1067 = phi i64 [ %1075, %1069 ], [ 0, %1064 ]
  %1068 = icmp slt i64 %1067, 64
  br i1 %1068, label %1069, label %1076

1069:                                             ; preds = %1066
  %1070 = mul i64 %1067, 64
  %1071 = trunc i64 %1070 to i32
  %1072 = mul i32 %1071, 4
  %1073 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 49152 to ptr addrspace(6)), i32 %1072, i32 0, i32 0)
  %1074 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %1073, float %19, <256 x i1> %1065)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1074, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1072, i32 2, i32 0, <256 x i1> %1065)
  %1075 = add i64 %1067, 1
  br label %1066

1076:                                             ; preds = %1066
  br label %1077

1077:                                             ; preds = %1076
  %1078 = add i32 %1062, 1
  br label %1061, !llvm.loop !37

1079:                                             ; preds = %1061
  br label %1080

1080:                                             ; preds = %1101, %1079
  %1081 = phi i32 [ %1102, %1101 ], [ 0, %1079 ]
  %1082 = icmp sle i32 %1081, 0
  br i1 %1082, label %1083, label %1103

1083:                                             ; preds = %1080
  %1084 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1085

1085:                                             ; preds = %1088, %1083
  %1086 = phi i64 [ %1099, %1088 ], [ 0, %1083 ]
  %1087 = icmp slt i64 %1086, 64
  br i1 %1087, label %1088, label %1100

1088:                                             ; preds = %1085
  %1089 = trunc i64 %1086 to i32
  %1090 = udiv i32 %1089, 64
  %1091 = urem i32 %1089, 64
  %1092 = mul i32 %1091, 64
  %1093 = mul i32 %1090, 4096
  %1094 = add i32 %1093, %1092
  %1095 = mul i32 %1094, 4
  %1096 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1095, i32 0, i32 0)
  %1097 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %1096, <256 x i1> %1084, i32 0, i32 0, i32 0)
  %1098 = mul i32 %1094, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %1097, ptr addrspace(6) inttoptr (i64 147456 to ptr addrspace(6)), i32 %1098, i32 7, i32 0, <256 x i1> %1084)
  %1099 = add i64 %1086, 1
  br label %1085

1100:                                             ; preds = %1085
  br label %1101

1101:                                             ; preds = %1100
  %1102 = add i32 %1081, 1
  br label %1080, !llvm.loop !38

1103:                                             ; preds = %1080
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 2)
  %1104 = sub i64 %91, %92
  %1105 = call i64 @llvm.smax.i64(i64 %1104, i64 0)
  %1106 = call i64 @llvm.smin.i64(i64 %1105, i64 64)
  %1107 = mul i64 %92, %154
  %1108 = add i64 %92, 1
  %1109 = mul i64 %1108, %154
  %1110 = sub i64 %1109, %1107
  %1111 = sext i32 %152 to i64
  %1112 = add i64 %1107, %1111
  %1113 = add i64 %1112, %304
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 2)
  %1114 = and i64 %1106, 2097151
  %1115 = shl i64 %1114, 4
  %1116 = or i64 %1115, 288230380446679040
  %1117 = mul i64 %1110, 2
  %1118 = and i64 %1117, 1099511627775
  %1119 = or i64 %1118, 140737488355328
  %1120 = ptrtoint ptr addrspace(1) %4 to i64
  %1121 = mul i64 %1113, 2
  %1122 = add i64 0, %1121
  %1123 = add i64 %1120, %1122
  %1124 = inttoptr i64 %1123 to ptr addrspace(1)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %1124, ptr addrspace(6) inttoptr (i64 147456 to ptr addrspace(6)), i64 %1116, i64 %1119)
  br label %1125

1125:                                             ; preds = %1146, %1103
  %1126 = phi i32 [ %1147, %1146 ], [ 0, %1103 ]
  %1127 = icmp sle i32 %1126, 0
  br i1 %1127, label %1128, label %1148

1128:                                             ; preds = %1125
  %1129 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1130

1130:                                             ; preds = %1133, %1128
  %1131 = phi i64 [ %1144, %1133 ], [ 0, %1128 ]
  %1132 = icmp slt i64 %1131, 64
  br i1 %1132, label %1133, label %1145

1133:                                             ; preds = %1130
  %1134 = trunc i64 %1131 to i32
  %1135 = udiv i32 %1134, 64
  %1136 = urem i32 %1134, 64
  %1137 = mul i32 %1136, 64
  %1138 = mul i32 %1135, 4096
  %1139 = add i32 %1138, %1137
  %1140 = mul i32 %1139, 4
  %1141 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 65536 to ptr addrspace(6)), i32 %1140, i32 0, i32 0)
  %1142 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %1141, <256 x i1> %1129, i32 0, i32 0, i32 0)
  %1143 = mul i32 %1139, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %1142, ptr addrspace(6) inttoptr (i64 155648 to ptr addrspace(6)), i32 %1143, i32 7, i32 0, <256 x i1> %1129)
  %1144 = add i64 %1131, 1
  br label %1130

1145:                                             ; preds = %1130
  br label %1146

1146:                                             ; preds = %1145
  %1147 = add i32 %1126, 1
  br label %1125, !llvm.loop !39

1148:                                             ; preds = %1125
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 1)
  %1149 = ptrtoint ptr addrspace(1) %5 to i64
  %1150 = mul i64 %1113, 2
  %1151 = add i64 0, %1150
  %1152 = add i64 %1149, %1151
  %1153 = inttoptr i64 %1152 to ptr addrspace(1)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %1153, ptr addrspace(6) inttoptr (i64 155648 to ptr addrspace(6)), i64 %1116, i64 %1119)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 12)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 13)
  br label %305
}

; Unknown intrinsic
declare i64 @llvm.hivm.GET.CTRL()

; Unknown intrinsic
declare i64 @llvm.hivm.SBITSET0(i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.SET.CTRL(i64)

; Unknown intrinsic
declare i64 @llvm.hivm.SBITSET1(i64, i64)

; Unknown intrinsic
declare i64 @llvm.hivm.GET.BLOCK.IDX()

; Unknown intrinsic
declare void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.BARRIER(i64)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #1

; Unknown intrinsic
declare void @llvm.hivm.SET.LOOP3.PARA(i64)

; Unknown intrinsic
declare void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6), ptr addrspace(5), i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3), ptr addrspace(2), i64, i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4), ptr addrspace(2), i64, i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5), ptr addrspace(3), ptr addrspace(4), i64)

; Unknown intrinsic
declare i64 @llvm.hivm.GET.SUBBLOCKID()

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #1

; Unknown intrinsic
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.pset.b32(i32)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6), i32, i32, i32)

; Unknown intrinsic
declare <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float>, <256 x i1>, i32, i32, i32)

; Unknown intrinsic
declare void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat>, ptr addrspace(6), i32, i32, i32, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float>, float, <256 x i1>)

; Unknown intrinsic
declare void @llvm.hivm.vstsx1.v64f32(<64 x float>, ptr addrspace(6), i32, i32, i32, <256 x i1>)

; Unknown intrinsic
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

; Unknown intrinsic
declare void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2), ptr addrspace(6), i64)

; Unknown intrinsic
declare <256 x i8> @llvm.hivm.vbr.v256s8(i8)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vbr.v64s32(i32)

; Unknown intrinsic
declare <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6), i32, i32, i32)

; Unknown intrinsic
declare { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8>, <256 x i8>)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8>, <256 x i1>, i32)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32>, <64 x i32>, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vdups.z.v64f32(float, <256 x i1>, i32)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vsel.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.pset.b8(i32)

; Unknown intrinsic
declare <256 x i8> @llvm.hivm.vdups.z.v256i8(i8, <256 x i1>, i32)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.vcmp.ne.s.z.s8(<256 x i8>, <256 x i8>, <256 x i1>)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.punpack(<256 x i1>, i32)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vdups.z.v64i32(i32, <256 x i1>, i32)

; Unknown intrinsic
declare { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6), i32, i32, i32)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32>, <64 x i32>, <256 x i1>)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32>, <64 x i32>, <256 x i1>)

; Unknown intrinsic
declare <128 x i16> @llvm.hivm.vpack.x.v64i32(<64 x i32>, i32)

; Unknown intrinsic
declare <256 x i8> @llvm.hivm.vpack.x.v128i16(<128 x i16>, i32)

; Unknown intrinsic
declare void @llvm.hivm.vstsx1.v256s8(<256 x i8>, ptr addrspace(6), i32, i32, i32, <256 x i1>)

; Unknown intrinsic
declare void @llvm.hivm.vstsx1.v64s32(<64 x i32>, ptr addrspace(6), i32, i32, i32, <256 x i1>)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vci.v64i32(i32, i32)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vexp.x.v64f32(<64 x float>, <256 x i1>)

; Unknown intrinsic
declare <256 x i8> @llvm.hivm.vsel.v256i8(<256 x i8>, <256 x i8>, <256 x i1>)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.pset.b16(i32)

; Unknown intrinsic
declare <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat, <256 x i1>, i32)


attributes #0 = { "target-cpu"="dav-c310-vec" }
attributes #1 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1, !2}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @bwd_qkv_kernel_mix_aic, !"kernel", i32 1}
!2 = !{ptr @bwd_qkv_kernel_mix_aiv, !"kernel", i32 1}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.aivector_scope"}
!5 = distinct !{!5, !4}
!6 = distinct !{!6, !4}
!7 = distinct !{!7, !4}
!8 = distinct !{!8, !4}
!9 = distinct !{!9, !4}
!10 = distinct !{!10, !4}
!11 = distinct !{!11, !4}
!12 = distinct !{!12, !4}
!13 = distinct !{!13, !4}
!14 = distinct !{!14, !4}
!15 = distinct !{!15, !4}
!16 = distinct !{!16, !4}
!17 = distinct !{!17, !4}
!18 = distinct !{!18, !4}
!19 = distinct !{!19, !4}
!20 = distinct !{!20, !4}
!21 = distinct !{!21, !4}
!22 = distinct !{!22, !4}
!23 = distinct !{!23, !4}
!24 = distinct !{!24, !4}
!25 = distinct !{!25, !4}
!26 = distinct !{!26, !4}
!27 = distinct !{!27, !4}
!28 = distinct !{!28, !4}
!29 = distinct !{!29, !4}
!30 = distinct !{!30, !4}
!31 = distinct !{!31, !4}
!32 = distinct !{!32, !4}
!33 = distinct !{!33, !4}
!34 = distinct !{!34, !4}
!35 = distinct !{!35, !4}
!36 = distinct !{!36, !4}
!37 = distinct !{!37, !4}
!38 = distinct !{!38, !4}
!39 = distinct !{!39, !4}