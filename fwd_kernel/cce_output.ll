; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @fwd_kernel_mix_aic(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(1) %5, ptr addrspace(1) %6, ptr addrspace(1) %7, ptr addrspace(1) %8, ptr addrspace(1) %9, i32 %10, i32 %11, float %12, i32 %13, i32 %14, i32 %15) #0 {
  %17 = call i64 @llvm.hivm.GET.CTRL()
  %18 = call i64 @llvm.hivm.SBITSET0(i64 %17, i64 60)
  call void @llvm.hivm.SET.CTRL(i64 %18)
  %19 = call i64 @llvm.hivm.GET.CTRL()
  %20 = call i64 @llvm.hivm.SBITSET1(i64 %19, i64 48)
  call void @llvm.hivm.SET.CTRL(i64 %20)
  store volatile i32 0, ptr addrspace(11) null, align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1024 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 4 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1028 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 8 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1032 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 12 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1036 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 16 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1040 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 20 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1044 to ptr addrspace(11)), align 4
  %21 = call i64 @llvm.hivm.GET.BLOCK.IDX()
  %22 = zext i32 %15 to i64
  %23 = udiv i64 %21, %22
  %24 = zext i32 %14 to i64
  %25 = udiv i64 %23, %24
  %26 = zext i32 %13 to i64
  %27 = urem i64 %25, %26
  %28 = trunc i64 %27 to i32
  %29 = mul i32 %10, 304
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 3)
  br label %30

30:                                               ; preds = %126, %16
  %31 = phi i32 [ %127, %126 ], [ %28, %16 ]
  %32 = icmp slt i32 %31, %29
  br i1 %32, label %33, label %128

33:                                               ; preds = %30
  %34 = sdiv i32 %31, 38
  %35 = srem i32 %31, 38
  %36 = sdiv i32 %34, %10
  %37 = sext i32 %36 to i64
  %38 = ptrtoint ptr addrspace(1) %8 to i64
  %39 = add i64 %38, 0
  %40 = inttoptr i64 %39 to ptr addrspace(1)
  %41 = getelementptr i32, ptr addrspace(1) %40, i64 %37
  %42 = load i32, ptr addrspace(1) %41, align 4
  %43 = add i64 %37, 1
  %44 = ptrtoint ptr addrspace(1) %8 to i64
  %45 = add i64 %44, 0
  %46 = inttoptr i64 %45 to ptr addrspace(1)
  %47 = getelementptr i32, ptr addrspace(1) %46, i64 %43
  %48 = load i32, ptr addrspace(1) %47, align 4
  %49 = sub i32 %48, %42
  %50 = mul i32 %35, 64
  %51 = icmp slt i32 %50, %49
  br i1 %51, label %52, label %126

52:                                               ; preds = %33
  %53 = ptrtoint ptr addrspace(1) %9 to i64
  %54 = add i64 %53, 0
  %55 = inttoptr i64 %54 to ptr addrspace(1)
  %56 = getelementptr i32, ptr addrspace(1) %55, i64 %37
  %57 = load i32, ptr addrspace(1) %56, align 4
  %58 = ptrtoint ptr addrspace(1) %9 to i64
  %59 = add i64 %58, 0
  %60 = inttoptr i64 %59 to ptr addrspace(1)
  %61 = getelementptr i32, ptr addrspace(1) %60, i64 %43
  %62 = load i32, ptr addrspace(1) %61, align 4
  %63 = sub i32 %62, %57
  %64 = sext i32 %50 to i64
  %65 = sext i32 %63 to i64
  %66 = icmp slt i64 %64, %65
  br i1 %66, label %67, label %125

67:                                               ; preds = %52
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 3)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 0)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 1)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 2)
  %68 = sub i32 %63, %50
  %69 = icmp eq i32 %68, 0
  %70 = sub i32 %68, 1
  %71 = udiv i32 %70, 32
  %72 = add i32 %71, 1
  %73 = select i1 %69, i32 0, i32 %72
  %74 = mul i32 %73, 2
  %75 = add i32 %74, 4
  %76 = mul i32 %75, 32
  %77 = add i32 %50, %76
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 1)
  br label %78

78:                                               ; preds = %122, %67
  %79 = phi i32 [ %123, %122 ], [ %50, %67 ]
  %80 = phi i32 [ %99, %122 ], [ %50, %67 ]
  %81 = phi i32 [ %121, %122 ], [ %50, %67 ]
  %82 = icmp slt i32 %79, %77
  br i1 %82, label %83, label %124

83:                                               ; preds = %78
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 0, i64 15)
  %84 = load volatile i32, ptr addrspace(11) inttoptr (i64 12 to ptr addrspace(11)), align 4
  %85 = icmp sgt i32 %84, 0
  %86 = load volatile i32, ptr addrspace(11) null, align 4
  %87 = icmp slt i32 %86, 1
  %88 = and i1 %85, %87
  %89 = icmp slt i32 %80, %63
  %90 = and i1 %88, %89
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 0)
  br i1 %90, label %91, label %97

91:                                               ; preds = %83
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) null, ptr addrspace(2) null, i64 4415226380288, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) null, ptr addrspace(2) inttoptr (i64 12288 to ptr addrspace(2)), i64 2216203124736, i64 131076, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 1)
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) inttoptr (i64 16384 to ptr addrspace(5)), ptr addrspace(3) null, ptr addrspace(4) null, i64 -6917529027103948736)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 10, i64 0)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 4)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 10, i64 0)
  call void @llvm.hivm.SET.LOOP3.PARA(i64 1)
  call void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), ptr addrspace(5) inttoptr (i64 16384 to ptr addrspace(5)), i64 137443148288, i64 8796093022272)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 10, i64 4)
  %92 = load volatile i32, ptr addrspace(11) inttoptr (i64 12 to ptr addrspace(11)), align 4
  %93 = sub i32 %92, 1
  store volatile i32 %93, ptr addrspace(11) inttoptr (i64 12 to ptr addrspace(11)), align 4
  %94 = load volatile i32, ptr addrspace(11) null, align 4
  %95 = add i32 %94, 1
  store volatile i32 %95, ptr addrspace(11) null, align 4
  %96 = add i32 %80, 32
  br label %98

97:                                               ; preds = %83
  br label %98

98:                                               ; preds = %91, %97
  %99 = phi i32 [ %80, %97 ], [ %96, %91 ]
  br label %100

100:                                              ; preds = %98
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 0)
  %101 = load volatile i32, ptr addrspace(11) inttoptr (i64 16 to ptr addrspace(11)), align 4
  %102 = icmp sgt i32 %101, 0
  %103 = load volatile i32, ptr addrspace(11) inttoptr (i64 20 to ptr addrspace(11)), align 4
  %104 = icmp sgt i32 %103, 0
  %105 = and i1 %102, %104
  %106 = load volatile i32, ptr addrspace(11) inttoptr (i64 4 to ptr addrspace(11)), align 4
  %107 = icmp slt i32 %106, 1
  %108 = and i1 %105, %107
  %109 = icmp slt i32 %81, %63
  %110 = and i1 %108, %109
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 1)
  br i1 %110, label %111, label %119

111:                                              ; preds = %100
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 2)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 1)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) inttoptr (i64 8192 to ptr addrspace(3)), ptr addrspace(2) inttoptr (i64 16384 to ptr addrspace(2)), i64 2216203124736, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 2)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) inttoptr (i64 4096 to ptr addrspace(4)), ptr addrspace(2) inttoptr (i64 8192 to ptr addrspace(2)), i64 4406636445696, i64 262146, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 3)
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) null, ptr addrspace(3) inttoptr (i64 8192 to ptr addrspace(3)), ptr addrspace(4) inttoptr (i64 4096 to ptr addrspace(4)), i64 -6917529026567208896)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 10, i64 1)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 1)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 2)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 10, i64 1)
  call void @llvm.hivm.SET.LOOP3.PARA(i64 1)
  call void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6) inttoptr (i64 49152 to ptr addrspace(6)), ptr addrspace(5) null, i64 274882102272, i64 8796093022272)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 10, i64 5)
  %112 = load volatile i32, ptr addrspace(11) inttoptr (i64 16 to ptr addrspace(11)), align 4
  %113 = sub i32 %112, 1
  store volatile i32 %113, ptr addrspace(11) inttoptr (i64 16 to ptr addrspace(11)), align 4
  %114 = load volatile i32, ptr addrspace(11) inttoptr (i64 20 to ptr addrspace(11)), align 4
  %115 = sub i32 %114, 1
  store volatile i32 %115, ptr addrspace(11) inttoptr (i64 20 to ptr addrspace(11)), align 4
  %116 = load volatile i32, ptr addrspace(11) inttoptr (i64 4 to ptr addrspace(11)), align 4
  %117 = add i32 %116, 1
  store volatile i32 %117, ptr addrspace(11) inttoptr (i64 4 to ptr addrspace(11)), align 4
  %118 = add i32 %81, 32
  br label %120

119:                                              ; preds = %100
  br label %120

120:                                              ; preds = %111, %119
  %121 = phi i32 [ %81, %119 ], [ %118, %111 ]
  br label %122

122:                                              ; preds = %120
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 2)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 0, i64 15)
  %123 = add i32 %79, 32
  br label %78

124:                                              ; preds = %78
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 0, i64 15)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 5)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 4)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 3)
  br label %125

125:                                              ; preds = %124, %52
  br label %126

126:                                              ; preds = %125, %33
  %127 = add i32 %31, 28
  br label %30

128:                                              ; preds = %30
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

define dso_local ptc_kernel void @fwd_kernel_mix_aiv(ptr addrspace(1) %0, ptr addrspace(1) %1, ptr addrspace(1) %2, ptr addrspace(1) %3, ptr addrspace(1) %4, ptr addrspace(1) %5, ptr addrspace(1) %6, ptr addrspace(1) %7, ptr addrspace(1) %8, ptr addrspace(1) %9, i32 %10, i32 %11, float %12, i32 %13, i32 %14, i32 %15) #1 {
  %17 = call i64 @llvm.hivm.GET.CTRL()
  %18 = call i64 @llvm.hivm.SBITSET0(i64 %17, i64 60)
  call void @llvm.hivm.SET.CTRL(i64 %18)
  %19 = call i64 @llvm.hivm.GET.CTRL()
  %20 = call i64 @llvm.hivm.SBITSET1(i64 %19, i64 48)
  call void @llvm.hivm.SET.CTRL(i64 %20)
  %21 = call i64 @llvm.hivm.GET.SUBBLOCKID()
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %286

23:                                               ; preds = %16
  %24 = mul i64 %21, 1024
  %25 = add i64 %24, 4
  %26 = inttoptr i64 %25 to ptr addrspace(11)
  %27 = inttoptr i64 %24 to ptr addrspace(11)
  %28 = add i64 %24, 20
  %29 = inttoptr i64 %28 to ptr addrspace(11)
  %30 = add i64 %24, 12
  %31 = inttoptr i64 %30 to ptr addrspace(11)
  %32 = add i64 %24, 16
  %33 = inttoptr i64 %32 to ptr addrspace(11)
  store volatile i32 0, ptr addrspace(11) null, align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1024 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 4 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1028 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 8 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1032 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 12 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1036 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 16 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1040 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 20 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1044 to ptr addrspace(11)), align 4
  %34 = call i64 @llvm.hivm.GET.BLOCK.IDX()
  %35 = zext i32 %15 to i64
  %36 = udiv i64 %34, %35
  %37 = zext i32 %14 to i64
  %38 = udiv i64 %36, %37
  %39 = zext i32 %13 to i64
  %40 = urem i64 %38, %39
  %41 = trunc i64 %40 to i32
  %42 = mul i32 %10, 304
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 2)
  br label %43

43:                                               ; preds = %283, %23
  %44 = phi i32 [ %284, %283 ], [ %41, %23 ]
  %45 = icmp slt i32 %44, %42
  br i1 %45, label %46, label %285

46:                                               ; preds = %43
  %47 = sdiv i32 %44, 38
  %48 = srem i32 %44, 38
  %49 = sdiv i32 %47, %10
  %50 = sext i32 %49 to i64
  %51 = ptrtoint ptr addrspace(1) %8 to i64
  %52 = add i64 %51, 0
  %53 = inttoptr i64 %52 to ptr addrspace(1)
  %54 = getelementptr i32, ptr addrspace(1) %53, i64 %50
  %55 = load i32, ptr addrspace(1) %54, align 4
  %56 = add i64 %50, 1
  %57 = ptrtoint ptr addrspace(1) %8 to i64
  %58 = add i64 %57, 0
  %59 = inttoptr i64 %58 to ptr addrspace(1)
  %60 = getelementptr i32, ptr addrspace(1) %59, i64 %56
  %61 = load i32, ptr addrspace(1) %60, align 4
  %62 = sub i32 %61, %55
  %63 = mul i32 %48, 64
  %64 = icmp slt i32 %63, %62
  %65 = srem i32 %47, %10
  %66 = mul i32 %65, %11
  %67 = sdiv i32 %66, %10
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 2)
  br i1 %64, label %68, label %283

68:                                               ; preds = %46
  %69 = ptrtoint ptr addrspace(1) %9 to i64
  %70 = add i64 %69, 0
  %71 = inttoptr i64 %70 to ptr addrspace(1)
  %72 = getelementptr i32, ptr addrspace(1) %71, i64 %50
  %73 = load i32, ptr addrspace(1) %72, align 4
  %74 = ptrtoint ptr addrspace(1) %9 to i64
  %75 = add i64 %74, 0
  %76 = inttoptr i64 %75 to ptr addrspace(1)
  %77 = getelementptr i32, ptr addrspace(1) %76, i64 %56
  %78 = load i32, ptr addrspace(1) %77, align 4
  %79 = sub i32 %78, %73
  %80 = sext i32 %63 to i64
  %81 = sext i32 %79 to i64
  %82 = icmp slt i64 %80, %81
  br i1 %82, label %83, label %282

83:                                               ; preds = %68
  %84 = sext i32 %62 to i64
  %85 = mul i32 %49, 5914624
  br label %287

86:                                               ; preds = %89, %356
  %87 = phi i64 [ 0, %356 ], [ %98, %89 ]
  %88 = icmp slt i64 %87, 4
  br i1 %88, label %89, label %99

89:                                               ; preds = %86
  %90 = mul i64 %87, 16
  %91 = mul i64 %87, 1024
  %92 = mul i64 %91, 2
  %93 = add i64 0, %92
  %94 = getelementptr i8, ptr addrspace(2) null, i64 %93
  %95 = mul i64 %90, 2
  %96 = add i64 0, %95
  %97 = getelementptr i8, ptr addrspace(6) inttoptr (i64 65536 to ptr addrspace(6)), i64 %96
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %94, ptr addrspace(6) %97, i64 12884968448)
  %98 = add i64 %87, 1
  br label %86

99:                                               ; preds = %86
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 3)
  %100 = sext i32 %73 to i64
  %101 = sext i32 %11 to i64
  %102 = mul i64 %100, %101
  %103 = mul i64 %102, 64
  %104 = mul i32 %67, 64
  %105 = mul i32 %11, 64
  %106 = sext i32 %105 to i64
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 4)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 5)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 0, i64 15)
  %107 = sub i32 %79, %63
  %108 = icmp eq i32 %107, 0
  %109 = sub i32 %107, 1
  %110 = udiv i32 %109, 32
  %111 = add i32 %110, 1
  %112 = select i1 %108, i32 0, i32 %111
  %113 = mul i32 %112, 2
  %114 = add i32 %113, 4
  %115 = mul i32 %114, 32
  %116 = add i32 %63, %115
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 4)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 5)
  br label %117

117:                                              ; preds = %279, %99
  %118 = phi i32 [ %280, %279 ], [ %63, %99 ]
  %119 = phi i64 [ %201, %279 ], [ %80, %99 ]
  %120 = phi i64 [ %164, %279 ], [ %80, %99 ]
  %121 = phi i64 [ %256, %279 ], [ %80, %99 ]
  %122 = phi i32 [ %165, %279 ], [ %63, %99 ]
  %123 = phi i32 [ %202, %279 ], [ %63, %99 ]
  %124 = phi i32 [ %259, %279 ], [ %63, %99 ]
  %125 = phi i32 [ %278, %279 ], [ %63, %99 ]
  %126 = phi i32 [ %277, %279 ], [ 0, %99 ]
  %127 = phi i32 [ %276, %279 ], [ 0, %99 ]
  %128 = icmp slt i32 %118, %116
  br i1 %128, label %129, label %281

129:                                              ; preds = %117
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 0, i64 15)
  %130 = load volatile i32, ptr addrspace(11) %33, align 4
  %131 = icmp slt i32 %130, 1
  %132 = icmp slt i32 %122, %79
  %133 = and i1 %131, %132
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 1)
  br i1 %133, label %134, label %162

134:                                              ; preds = %129
  %135 = sub i64 %81, %120
  %136 = call i64 @llvm.smax.i64(i64 %135, i64 0)
  %137 = call i64 @llvm.smin.i64(i64 %136, i64 32)
  %138 = mul i64 %120, %106
  %139 = add i64 %120, 1
  %140 = mul i64 %139, %106
  %141 = sub i64 %140, %138
  %142 = sext i32 %104 to i64
  %143 = add i64 %138, %142
  %144 = add i64 %143, %103
  br label %368

145:                                              ; preds = %148, %384
  %146 = phi i64 [ 0, %384 ], [ %157, %148 ]
  %147 = icmp slt i64 %146, 4
  br i1 %147, label %148, label %158

148:                                              ; preds = %145
  %149 = mul i64 %146, 16
  %150 = mul i64 %146, 512
  %151 = mul i64 %150, 2
  %152 = add i64 0, %151
  %153 = getelementptr i8, ptr addrspace(2) inttoptr (i64 8192 to ptr addrspace(2)), i64 %152
  %154 = mul i64 %149, 2
  %155 = add i64 0, %154
  %156 = getelementptr i8, ptr addrspace(6) inttoptr (i64 131072 to ptr addrspace(6)), i64 %155
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %153, ptr addrspace(6) %156, i64 12884967936)
  %157 = add i64 %146, 1
  br label %145

158:                                              ; preds = %145
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 2)
  %159 = load volatile i32, ptr addrspace(11) %33, align 4
  %160 = add i32 %159, 1
  store volatile i32 %160, ptr addrspace(11) %33, align 4
  %161 = add i32 %122, 32
  br label %163

162:                                              ; preds = %129
  br label %163

163:                                              ; preds = %158, %162
  %164 = phi i64 [ %120, %162 ], [ %396, %158 ]
  %165 = phi i32 [ %122, %162 ], [ %161, %158 ]
  br label %166

166:                                              ; preds = %163
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 3)
  %167 = load volatile i32, ptr addrspace(11) %31, align 4
  %168 = icmp slt i32 %167, 1
  %169 = icmp slt i32 %123, %79
  %170 = and i1 %168, %169
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 4)
  br i1 %170, label %171, label %199

171:                                              ; preds = %166
  %172 = sub i64 %81, %119
  %173 = call i64 @llvm.smax.i64(i64 %172, i64 0)
  %174 = call i64 @llvm.smin.i64(i64 %173, i64 32)
  %175 = mul i64 %119, %106
  %176 = add i64 %119, 1
  %177 = mul i64 %176, %106
  %178 = sub i64 %177, %175
  %179 = sext i32 %104 to i64
  %180 = add i64 %175, %179
  %181 = add i64 %180, %103
  br label %397

182:                                              ; preds = %185, %465
  %183 = phi i64 [ 0, %465 ], [ %194, %185 ]
  %184 = icmp slt i64 %183, 2
  br i1 %184, label %185, label %195

185:                                              ; preds = %182
  %186 = mul i64 %183, 16
  %187 = mul i64 %183, 1024
  %188 = mul i64 %187, 2
  %189 = add i64 0, %188
  %190 = getelementptr i8, ptr addrspace(2) inttoptr (i64 12288 to ptr addrspace(2)), i64 %189
  %191 = mul i64 %186, 2
  %192 = add i64 0, %191
  %193 = getelementptr i8, ptr addrspace(6) inttoptr (i64 143360 to ptr addrspace(6)), i64 %192
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %190, ptr addrspace(6) %193, i64 4295033856)
  %194 = add i64 %183, 1
  br label %182

195:                                              ; preds = %182
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 0)
  %196 = load volatile i32, ptr addrspace(11) %31, align 4
  %197 = add i32 %196, 1
  store volatile i32 %197, ptr addrspace(11) %31, align 4
  %198 = add i32 %123, 32
  br label %200

199:                                              ; preds = %166
  br label %200

200:                                              ; preds = %195, %199
  %201 = phi i64 [ %119, %199 ], [ %466, %195 ]
  %202 = phi i32 [ %123, %199 ], [ %198, %195 ]
  br label %203

203:                                              ; preds = %200
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 4)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  %204 = load volatile i32, ptr addrspace(11) %27, align 4
  %205 = icmp sgt i32 %204, 0
  %206 = load volatile i32, ptr addrspace(11) %29, align 4
  %207 = icmp slt i32 %206, 1
  %208 = and i1 %205, %207
  %209 = icmp slt i32 %126, 2
  %210 = icmp slt i32 %127, 2
  %211 = and i1 %209, %210
  %212 = icmp slt i32 %124, %79
  %213 = and i1 %208, %211
  %214 = and i1 %213, %212
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 5)
  br i1 %214, label %215, label %254

215:                                              ; preds = %203
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 4)
  %216 = sub i64 %81, %121
  %217 = call i64 @llvm.smax.i64(i64 %216, i64 0)
  %218 = call i64 @llvm.smin.i64(i64 %217, i64 32)
  %219 = mul i64 %80, 2432
  %220 = add i64 %219, %121
  %221 = mul i64 %334, 2432
  %222 = add i64 %221, %121
  %223 = sub i64 %222, %220
  %224 = sext i32 %85 to i64
  %225 = add i64 %220, %224
  br label %467

226:                                              ; preds = %783
  br label %788

227:                                              ; preds = %783
  br label %797

228:                                              ; preds = %796, %805
  br label %806

229:                                              ; preds = %816
  br label %817

230:                                              ; preds = %816
  br label %826

231:                                              ; preds = %825, %834
  %232 = add i64 %121, 32
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 5)
  br label %233

233:                                              ; preds = %236, %231
  %234 = phi i64 [ %245, %236 ], [ 0, %231 ]
  %235 = icmp slt i64 %234, 2
  br i1 %235, label %236, label %246

236:                                              ; preds = %233
  %237 = mul i64 %234, 16
  %238 = mul i64 %234, 1024
  %239 = mul i64 %238, 2
  %240 = add i64 0, %239
  %241 = getelementptr i8, ptr addrspace(2) inttoptr (i64 16384 to ptr addrspace(2)), i64 %240
  %242 = mul i64 %237, 2
  %243 = add i64 0, %242
  %244 = getelementptr i8, ptr addrspace(6) inttoptr (i64 147456 to ptr addrspace(6)), i64 %243
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %241, ptr addrspace(6) %244, i64 4295033856)
  %245 = add i64 %234, 1
  br label %233

246:                                              ; preds = %233
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 1)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 4)
  %247 = load volatile i32, ptr addrspace(11) %27, align 4
  %248 = sub i32 %247, 1
  store volatile i32 %248, ptr addrspace(11) %27, align 4
  %249 = load volatile i32, ptr addrspace(11) %29, align 4
  %250 = add i32 %249, 1
  store volatile i32 %250, ptr addrspace(11) %29, align 4
  %251 = add i32 %127, 1
  %252 = add i32 %126, 1
  %253 = add i32 %124, 32
  br label %835

254:                                              ; preds = %203
  br label %255

255:                                              ; preds = %843, %254
  %256 = phi i64 [ %232, %843 ], [ %121, %254 ]
  %257 = phi i32 [ %251, %843 ], [ %127, %254 ]
  %258 = phi i32 [ %252, %843 ], [ %126, %254 ]
  %259 = phi i32 [ %253, %843 ], [ %124, %254 ]
  br label %260

260:                                              ; preds = %255
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 5)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 1)
  %261 = load volatile i32, ptr addrspace(11) %26, align 4
  %262 = icmp sgt i32 %261, 0
  %263 = icmp sgt i32 %258, 0
  %264 = icmp sgt i32 %257, 0
  %265 = and i1 %263, %264
  %266 = icmp slt i32 %125, %79
  %267 = and i1 %262, %265
  %268 = and i1 %267, %266
  br i1 %268, label %269, label %274

269:                                              ; preds = %260
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 5)
  %270 = sub i32 %125, %63
  %271 = udiv i32 %270, 32
  %272 = srem i32 %271, 2
  %273 = icmp eq i32 %272, 0
  br label %844

274:                                              ; preds = %260
  br label %275

275:                                              ; preds = %979, %274
  %276 = phi i32 [ %982, %979 ], [ %257, %274 ]
  %277 = phi i32 [ %983, %979 ], [ %258, %274 ]
  %278 = phi i32 [ %984, %979 ], [ %125, %274 ]
  br label %279

279:                                              ; preds = %275
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 0, i64 15)
  %280 = add i32 %118, 32
  br label %117

281:                                              ; preds = %117
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 4)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 3)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 2)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 1)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 0)
  br label %985

282:                                              ; preds = %1052, %68
  br label %283

283:                                              ; preds = %282, %46
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 0)
  %284 = add i32 %44, 28
  br label %43

285:                                              ; preds = %43
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 3)
  call void @llvm.hivm.BARRIER(i64 6)
  br label %286

286:                                              ; preds = %285, %16
  ret void

287:                                              ; preds = %302, %83
  %288 = phi i32 [ %303, %302 ], [ 0, %83 ]
  %289 = icmp sle i32 %288, 0
  br i1 %289, label %290, label %304

290:                                              ; preds = %287
  %291 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %292

292:                                              ; preds = %295, %290
  %293 = phi i64 [ %300, %295 ], [ 0, %290 ]
  %294 = icmp slt i64 %293, 64
  br i1 %294, label %295, label %301

295:                                              ; preds = %292
  %296 = mul i64 %293, 64
  %297 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %291, i32 0)
  %298 = trunc i64 %296 to i32
  %299 = mul i32 %298, 4
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %297, ptr addrspace(6) null, i32 %299, i32 2, i32 0, <256 x i1> %291)
  %300 = add i64 %293, 1
  br label %292

301:                                              ; preds = %292
  br label %302

302:                                              ; preds = %301
  %303 = add i32 %288, 1
  br label %287, !llvm.loop !3

304:                                              ; preds = %287
  br label %305

305:                                              ; preds = %311, %304
  %306 = phi i32 [ %312, %311 ], [ 0, %304 ]
  %307 = icmp sle i32 %306, 0
  br i1 %307, label %308, label %313

308:                                              ; preds = %305
  %309 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %310 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xC1D0000000000000, <256 x i1> %309, i32 0)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %310, ptr addrspace(6) inttoptr (i64 157696 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %309)
  br label %311

311:                                              ; preds = %308
  %312 = add i32 %306, 1
  br label %305, !llvm.loop !5

313:                                              ; preds = %305
  br label %314

314:                                              ; preds = %320, %313
  %315 = phi i32 [ %321, %320 ], [ 0, %313 ]
  %316 = icmp sle i32 %315, 0
  br i1 %316, label %317, label %322

317:                                              ; preds = %314
  %318 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %319 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %318, i32 0)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %319, ptr addrspace(6) inttoptr (i64 157952 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %318)
  br label %320

320:                                              ; preds = %317
  %321 = add i32 %315, 1
  br label %314, !llvm.loop !6

322:                                              ; preds = %314
  %323 = sext i32 %55 to i64
  %324 = sext i32 %10 to i64
  %325 = mul i64 %323, %324
  %326 = mul i64 %325, 64
  %327 = mul i32 %65, 64
  %328 = mul i32 %10, 64
  %329 = sext i32 %328 to i64
  %330 = sub i64 %84, %80
  %331 = call i64 @llvm.smax.i64(i64 %330, i64 0)
  %332 = call i64 @llvm.smin.i64(i64 %331, i64 64)
  %333 = mul i64 %80, %329
  %334 = add i64 %80, 1
  %335 = mul i64 %334, %329
  %336 = sub i64 %335, %333
  %337 = sext i32 %327 to i64
  %338 = add i64 %333, %337
  %339 = add i64 %338, %326
  br label %340

340:                                              ; preds = %354, %322
  %341 = phi i32 [ %355, %354 ], [ 0, %322 ]
  %342 = icmp sle i32 %341, 0
  br i1 %342, label %343, label %356

343:                                              ; preds = %340
  %344 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %345

345:                                              ; preds = %348, %343
  %346 = phi i64 [ %352, %348 ], [ 0, %343 ]
  %347 = icmp slt i64 %346, 32
  br i1 %347, label %348, label %353

348:                                              ; preds = %345
  %349 = trunc i64 %346 to i32
  %350 = mul i32 %349, 256
  %351 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %344, i32 0)
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %351, ptr addrspace(6) inttoptr (i64 65536 to ptr addrspace(6)), i32 %350, i32 1, i32 0, <256 x i1> %344)
  %352 = add i64 %346, 1
  br label %345

353:                                              ; preds = %345
  br label %354

354:                                              ; preds = %353
  %355 = add i32 %341, 1
  br label %340, !llvm.loop !7

356:                                              ; preds = %340
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  %357 = and i64 %332, 2097151
  %358 = shl i64 %357, 4
  %359 = or i64 %358, 288230380446679040
  %360 = mul i64 %336, 2
  %361 = and i64 %360, 1099511627775
  %362 = or i64 %361, 140737488355328
  %363 = ptrtoint ptr addrspace(1) %0 to i64
  %364 = mul i64 %339, 2
  %365 = add i64 0, %364
  %366 = add i64 %363, %365
  %367 = inttoptr i64 %366 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 65536 to ptr addrspace(6)), ptr addrspace(1) %367, i64 %359, i64 %362)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 0)
  br label %86

368:                                              ; preds = %382, %134
  %369 = phi i32 [ %383, %382 ], [ 0, %134 ]
  %370 = icmp sle i32 %369, 0
  br i1 %370, label %371, label %384

371:                                              ; preds = %368
  %372 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %373

373:                                              ; preds = %376, %371
  %374 = phi i64 [ %380, %376 ], [ 0, %371 ]
  %375 = icmp slt i64 %374, 16
  br i1 %375, label %376, label %381

376:                                              ; preds = %373
  %377 = trunc i64 %374 to i32
  %378 = mul i32 %377, 256
  %379 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %372, i32 0)
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %379, ptr addrspace(6) inttoptr (i64 131072 to ptr addrspace(6)), i32 %378, i32 1, i32 0, <256 x i1> %372)
  %380 = add i64 %374, 1
  br label %373

381:                                              ; preds = %373
  br label %382

382:                                              ; preds = %381
  %383 = add i32 %369, 1
  br label %368, !llvm.loop !8

384:                                              ; preds = %368
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 2)
  %385 = and i64 %137, 2097151
  %386 = shl i64 %385, 4
  %387 = or i64 %386, 288230380446679040
  %388 = mul i64 %141, 2
  %389 = and i64 %388, 1099511627775
  %390 = or i64 %389, 140737488355328
  %391 = ptrtoint ptr addrspace(1) %2 to i64
  %392 = mul i64 %144, 2
  %393 = add i64 0, %392
  %394 = add i64 %391, %393
  %395 = inttoptr i64 %394 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 131072 to ptr addrspace(6)), ptr addrspace(1) %395, i64 %387, i64 %390)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 1)
  %396 = add i64 %120, 32
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 1)
  br label %145

397:                                              ; preds = %411, %171
  %398 = phi i32 [ %412, %411 ], [ 0, %171 ]
  %399 = icmp sle i32 %398, 0
  br i1 %399, label %400, label %413

400:                                              ; preds = %397
  %401 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %402

402:                                              ; preds = %405, %400
  %403 = phi i64 [ %409, %405 ], [ 0, %400 ]
  %404 = icmp slt i64 %403, 16
  br i1 %404, label %405, label %410

405:                                              ; preds = %402
  %406 = trunc i64 %403 to i32
  %407 = mul i32 %406, 256
  %408 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %401, i32 0)
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %408, ptr addrspace(6) inttoptr (i64 135168 to ptr addrspace(6)), i32 %407, i32 1, i32 0, <256 x i1> %401)
  %409 = add i64 %403, 1
  br label %402

410:                                              ; preds = %402
  br label %411

411:                                              ; preds = %410
  %412 = add i32 %398, 1
  br label %397, !llvm.loop !9

413:                                              ; preds = %397
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 2)
  %414 = and i64 %174, 2097151
  %415 = shl i64 %414, 4
  %416 = or i64 %415, 288230380446679040
  %417 = mul i64 %178, 2
  %418 = and i64 %417, 1099511627775
  %419 = or i64 %418, 140737488355328
  %420 = ptrtoint ptr addrspace(1) %1 to i64
  %421 = mul i64 %181, 2
  %422 = add i64 0, %421
  %423 = add i64 %420, %422
  %424 = inttoptr i64 %423 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 135168 to ptr addrspace(6)), ptr addrspace(1) %424, i64 %416, i64 %419)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  br label %425

425:                                              ; preds = %446, %413
  %426 = phi i32 [ %447, %446 ], [ 0, %413 ]
  %427 = icmp sle i32 %426, 0
  br i1 %427, label %428, label %448

428:                                              ; preds = %425
  br label %429

429:                                              ; preds = %432, %428
  %430 = phi i64 [ %444, %432 ], [ 0, %428 ]
  %431 = icmp slt i64 %430, 64
  br i1 %431, label %432, label %445

432:                                              ; preds = %429
  %433 = trunc i64 %430 to i16
  %434 = trunc i64 %430 to i32
  %435 = mul i32 %434, 64
  %436 = call { <256 x i1>, i32 } @llvm.hivm.plt.b16.v300(i32 32)
  %437 = extractvalue { <256 x i1>, i32 } %436, 0
  %438 = extractvalue { <256 x i1>, i32 } %436, 1
  %439 = call <128 x i16> @llvm.hivm.vci.v128i16(i16 0, i32 0)
  %440 = call <128 x i16> @llvm.hivm.vmuls.s.x.v128i16(<128 x i16> %439, i16 64, <256 x i1> %437)
  %441 = call <128 x i16> @llvm.hivm.vadds.s.x.v128i16(<128 x i16> %440, i16 %433, <256 x i1> %437)
  %442 = bitcast <128 x i16> %441 to <64 x i32>
  %443 = call <128 x bfloat> @llvm.hivm.vgather2.v300.v128bf16(ptr addrspace(6) inttoptr (i64 135168 to ptr addrspace(6)), <64 x i32> %442, <256 x i1> %437)
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %443, ptr addrspace(6) inttoptr (i64 139264 to ptr addrspace(6)), i32 %435, i32 1, i32 0, <256 x i1> %437)
  %444 = add i64 %430, 1
  br label %429

445:                                              ; preds = %429
  br label %446

446:                                              ; preds = %445
  %447 = add i32 %426, 1
  br label %425, !llvm.loop !10

448:                                              ; preds = %425
  br label %449

449:                                              ; preds = %463, %448
  %450 = phi i32 [ %464, %463 ], [ 0, %448 ]
  %451 = icmp sle i32 %450, 0
  br i1 %451, label %452, label %465

452:                                              ; preds = %449
  %453 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %454

454:                                              ; preds = %457, %452
  %455 = phi i64 [ %461, %457 ], [ 0, %452 ]
  %456 = icmp slt i64 %455, 16
  br i1 %456, label %457, label %462

457:                                              ; preds = %454
  %458 = trunc i64 %455 to i32
  %459 = mul i32 %458, 256
  %460 = call <128 x bfloat> @llvm.hivm.vldsx1.v128bf16(ptr addrspace(6) inttoptr (i64 139264 to ptr addrspace(6)), i32 %459, i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %460, ptr addrspace(6) inttoptr (i64 143360 to ptr addrspace(6)), i32 %459, i32 2, i32 0, <256 x i1> %453)
  %461 = add i64 %455, 1
  br label %454

462:                                              ; preds = %454
  br label %463

463:                                              ; preds = %462
  %464 = add i32 %450, 1
  br label %449, !llvm.loop !11

465:                                              ; preds = %449
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 4)
  %466 = add i64 %119, 32
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 4)
  br label %182

467:                                              ; preds = %483, %215
  %468 = phi i32 [ %484, %483 ], [ 0, %215 ]
  %469 = icmp sle i32 %468, 0
  br i1 %469, label %470, label %485

470:                                              ; preds = %467
  %471 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %472

472:                                              ; preds = %475, %470
  %473 = phi i64 [ %481, %475 ], [ 0, %470 ]
  %474 = icmp slt i64 %473, 32
  br i1 %474, label %475, label %482

475:                                              ; preds = %472
  %476 = mul i64 %473, 64
  %477 = trunc i64 %476 to i32
  %478 = mul i32 %477, 4
  %479 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), i32 %478, i32 0, i32 0)
  %480 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %479, float %12, <256 x i1> %471)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %480, ptr addrspace(6) inttoptr (i64 73728 to ptr addrspace(6)), i32 %478, i32 2, i32 0, <256 x i1> %471)
  %481 = add i64 %473, 1
  br label %472

482:                                              ; preds = %472
  br label %483

483:                                              ; preds = %482
  %484 = add i32 %468, 1
  br label %467, !llvm.loop !12

485:                                              ; preds = %467
  br label %486

486:                                              ; preds = %500, %485
  %487 = phi i32 [ %501, %500 ], [ 0, %485 ]
  %488 = icmp sle i32 %487, 0
  br i1 %488, label %489, label %502

489:                                              ; preds = %486
  %490 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)
  br label %491

491:                                              ; preds = %494, %489
  %492 = phi i64 [ %498, %494 ], [ 0, %489 ]
  %493 = icmp slt i64 %492, 8
  br i1 %493, label %494, label %499

494:                                              ; preds = %491
  %495 = mul i64 %492, 256
  %496 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %490, i32 0)
  %497 = trunc i64 %495 to i32
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %496, ptr addrspace(6) inttoptr (i64 151552 to ptr addrspace(6)), i32 %497, i32 0, i32 0, <256 x i1> %490)
  %498 = add i64 %492, 1
  br label %491

499:                                              ; preds = %491
  br label %500

500:                                              ; preds = %499
  %501 = add i32 %487, 1
  br label %486, !llvm.loop !13

502:                                              ; preds = %486
  %503 = and i64 %218, 2097151
  %504 = shl i64 %503, 25
  %505 = or i64 %358, %504
  %506 = sub i64 32, %503
  %507 = call i64 @llvm.smax.i64(i64 %506, i64 0)
  %508 = and i64 %507, 63
  %509 = shl i64 %508, 52
  %510 = or i64 %505, %509
  %511 = or i64 %510, 288230376151711744
  %512 = and i64 %223, 1099511627775
  %513 = or i64 %512, 35184372088832
  %514 = ptrtoint ptr addrspace(1) %7 to i64
  %515 = add i64 %225, 0
  %516 = add i64 %514, %515
  %517 = inttoptr i64 %516 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 153600 to ptr addrspace(6)), ptr addrspace(1) %517, i64 %511, i64 %513)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 1)
  br label %518

518:                                              ; preds = %572, %502
  %519 = phi i32 [ %573, %572 ], [ 0, %502 ]
  %520 = icmp sle i32 %519, 0
  br i1 %520, label %521, label %574

521:                                              ; preds = %518
  %522 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %523

523:                                              ; preds = %526, %521
  %524 = phi i64 [ %570, %526 ], [ 0, %521 ]
  %525 = icmp slt i64 %524, 8
  br i1 %525, label %526, label %571

526:                                              ; preds = %523
  %527 = trunc i64 %524 to i32
  %528 = mul i32 %527, 256
  %529 = mul i32 %527, 1024
  %530 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)
  %531 = call <256 x i8> @llvm.hivm.vbr.v256s8(i8 0)
  %532 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 153600 to ptr addrspace(6)), i32 %528, i32 13, i32 0)
  %533 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %532, <256 x i8> %531)
  %534 = extractvalue { <256 x i8>, <256 x i8> } %533, 0
  %535 = extractvalue { <256 x i8>, <256 x i8> } %533, 1
  %536 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %534, <256 x i1> %530, i32 0)
  %537 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %535, <256 x i1> %530, i32 0)
  %538 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 151552 to ptr addrspace(6)), i32 %528, i32 13, i32 0)
  %539 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %538, <256 x i8> %531)
  %540 = extractvalue { <256 x i8>, <256 x i8> } %539, 0
  %541 = extractvalue { <256 x i8>, <256 x i8> } %539, 1
  %542 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %540, <256 x i1> %530, i32 0)
  %543 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %541, <256 x i1> %530, i32 0)
  %544 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %536, <64 x i32> %542, <256 x i1> %522)
  %545 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %537, <64 x i32> %543, <256 x i1> %522)
  %546 = add i32 %528, 128
  %547 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 153600 to ptr addrspace(6)), i32 %546, i32 13, i32 0)
  %548 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %547, <256 x i8> %531)
  %549 = extractvalue { <256 x i8>, <256 x i8> } %548, 0
  %550 = extractvalue { <256 x i8>, <256 x i8> } %548, 1
  %551 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %549, <256 x i1> %530, i32 0)
  %552 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %550, <256 x i1> %530, i32 0)
  %553 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 151552 to ptr addrspace(6)), i32 %546, i32 13, i32 0)
  %554 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %553, <256 x i8> %531)
  %555 = extractvalue { <256 x i8>, <256 x i8> } %554, 0
  %556 = extractvalue { <256 x i8>, <256 x i8> } %554, 1
  %557 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %555, <256 x i1> %530, i32 0)
  %558 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %556, <256 x i1> %530, i32 0)
  %559 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %551, <64 x i32> %557, <256 x i1> %522)
  %560 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %552, <64 x i32> %558, <256 x i1> %522)
  %561 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %522, i32 0)
  %562 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xC1D0000000000000, <256 x i1> %522, i32 0)
  %563 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %561, <64 x float> %562, <256 x i1> %544)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %563, ptr addrspace(6) inttoptr (i64 81920 to ptr addrspace(6)), i32 %529, i32 2, i32 0, <256 x i1> %522)
  %564 = add i32 %529, 256
  %565 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %561, <64 x float> %562, <256 x i1> %545)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %565, ptr addrspace(6) inttoptr (i64 81920 to ptr addrspace(6)), i32 %564, i32 2, i32 0, <256 x i1> %522)
  %566 = add i32 %529, 512
  %567 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %561, <64 x float> %562, <256 x i1> %559)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %567, ptr addrspace(6) inttoptr (i64 81920 to ptr addrspace(6)), i32 %566, i32 2, i32 0, <256 x i1> %522)
  %568 = add i32 %529, 768
  %569 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %561, <64 x float> %562, <256 x i1> %560)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %569, ptr addrspace(6) inttoptr (i64 81920 to ptr addrspace(6)), i32 %568, i32 2, i32 0, <256 x i1> %522)
  %570 = add i64 %524, 1
  br label %523

571:                                              ; preds = %523
  br label %572

572:                                              ; preds = %571
  %573 = add i32 %519, 1
  br label %518, !llvm.loop !14

574:                                              ; preds = %518
  br label %575

575:                                              ; preds = %592, %574
  %576 = phi i32 [ %593, %592 ], [ 0, %574 ]
  %577 = icmp sle i32 %576, 0
  br i1 %577, label %578, label %594

578:                                              ; preds = %575
  %579 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %580

580:                                              ; preds = %583, %578
  %581 = phi i64 [ %590, %583 ], [ 0, %578 ]
  %582 = icmp slt i64 %581, 32
  br i1 %582, label %583, label %591

583:                                              ; preds = %580
  %584 = mul i64 %581, 64
  %585 = trunc i64 %584 to i32
  %586 = mul i32 %585, 4
  %587 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 73728 to ptr addrspace(6)), i32 %586, i32 0, i32 0)
  %588 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 81920 to ptr addrspace(6)), i32 %586, i32 0, i32 0)
  %589 = call <64 x float> @llvm.hivm.vadd.s.x.v64f32(<64 x float> %587, <64 x float> %588, <256 x i1> %579)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %589, ptr addrspace(6) inttoptr (i64 90112 to ptr addrspace(6)), i32 %586, i32 2, i32 0, <256 x i1> %579)
  %590 = add i64 %581, 1
  br label %580

591:                                              ; preds = %580
  br label %592

592:                                              ; preds = %591
  %593 = add i32 %576, 1
  br label %575, !llvm.loop !15

594:                                              ; preds = %575
  br label %595

595:                                              ; preds = %614, %594
  %596 = phi i32 [ %615, %614 ], [ 0, %594 ]
  %597 = icmp sle i32 %596, 0
  br i1 %597, label %598, label %616

598:                                              ; preds = %595
  %599 = call { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32 32)
  %600 = extractvalue { <256 x i1>, i32 } %599, 0
  %601 = extractvalue { <256 x i1>, i32 } %599, 1
  %602 = call <256 x i1> @llvm.hivm.pset.b32(i32 2)
  br label %603

603:                                              ; preds = %606, %598
  %604 = phi i64 [ %612, %606 ], [ 0, %598 ]
  %605 = icmp slt i64 %604, 64
  br i1 %605, label %606, label %613

606:                                              ; preds = %603
  %607 = trunc i64 %604 to i32
  %608 = mul i32 %607, 128
  %609 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 90112 to ptr addrspace(6)), i32 %608, i32 0, i32 0)
  %610 = call <64 x float> @llvm.hivm.vcmax.s.x.v64f32(<64 x float> %609, <256 x i1> %600)
  %611 = mul i32 %607, 4
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %610, ptr addrspace(6) inttoptr (i64 158208 to ptr addrspace(6)), i32 %611, i32 5, i32 0, <256 x i1> %602)
  %612 = add i64 %604, 1
  br label %603

613:                                              ; preds = %603
  br label %614

614:                                              ; preds = %613
  %615 = add i32 %596, 1
  br label %595, !llvm.loop !16

616:                                              ; preds = %595
  br label %617

617:                                              ; preds = %625, %616
  %618 = phi i32 [ %626, %625 ], [ 0, %616 ]
  %619 = icmp sle i32 %618, 0
  br i1 %619, label %620, label %627

620:                                              ; preds = %617
  %621 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %622 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 157696 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %623 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 158208 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %624 = call <64 x float> @llvm.hivm.vmax.s.x.v64f32(<64 x float> %622, <64 x float> %623, <256 x i1> %621)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %624, ptr addrspace(6) inttoptr (i64 158464 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %621)
  br label %625

625:                                              ; preds = %620
  %626 = add i32 %618, 1
  br label %617, !llvm.loop !17

627:                                              ; preds = %617
  br label %628

628:                                              ; preds = %657, %627
  %629 = phi i32 [ %658, %657 ], [ 0, %627 ]
  %630 = icmp sle i32 %629, 0
  br i1 %630, label %631, label %659

631:                                              ; preds = %628
  %632 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %633 = call <256 x i1> @llvm.hivm.pset.b32(i32 2)
  br label %634

634:                                              ; preds = %654, %631
  %635 = phi i64 [ %655, %654 ], [ 0, %631 ]
  %636 = icmp slt i64 %635, 64
  br i1 %636, label %637, label %656

637:                                              ; preds = %634
  %638 = trunc i64 %635 to i32
  %639 = mul i32 %638, 32
  br label %640

640:                                              ; preds = %643, %637
  %641 = phi i64 [ %653, %643 ], [ 0, %637 ]
  %642 = icmp slt i64 %641, 32
  br i1 %642, label %643, label %654

643:                                              ; preds = %640
  %644 = trunc i64 %641 to i32
  %645 = add i32 %639, %644
  %646 = mul i32 %645, 4
  %647 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 90112 to ptr addrspace(6)), i32 %646, i32 3, i32 0)
  %648 = udiv i32 %645, 32
  %649 = urem i32 %648, 64
  %650 = mul i32 %649, 4
  %651 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 158464 to ptr addrspace(6)), i32 %650, i32 3, i32 0)
  %652 = call <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float> %647, <64 x float> %651, <256 x i1> %632)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %652, ptr addrspace(6) inttoptr (i64 98304 to ptr addrspace(6)), i32 %646, i32 5, i32 0, <256 x i1> %633)
  %653 = add i64 %641, 1
  br label %640

654:                                              ; preds = %640
  %655 = add i64 %635, 1
  br label %634

656:                                              ; preds = %634
  br label %657

657:                                              ; preds = %656
  %658 = add i32 %629, 1
  br label %628, !llvm.loop !18

659:                                              ; preds = %628
  br label %660

660:                                              ; preds = %735, %659
  %661 = phi i32 [ %736, %735 ], [ 0, %659 ]
  %662 = icmp sle i32 %661, 0
  br i1 %662, label %663, label %737

663:                                              ; preds = %660
  %664 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %665

665:                                              ; preds = %668, %663
  %666 = phi i64 [ %733, %668 ], [ 0, %663 ]
  %667 = icmp slt i64 %666, 32
  br i1 %667, label %668, label %734

668:                                              ; preds = %665
  %669 = mul i64 %666, 64
  %670 = trunc i64 %669 to i32
  %671 = mul i32 %670, 4
  %672 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 98304 to ptr addrspace(6)), i32 %671, i32 0, i32 0)
  %673 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %664, i32 0)
  %674 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x7FF0000000000000, <256 x i1> %664, i32 0)
  %675 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x40562E4300000000, <256 x i1> %664, i32 0)
  %676 = call <256 x i1> @llvm.hivm.vcmp.gt.s.z.f32(<64 x float> %672, <64 x float> %675, <256 x i1> %664)
  %677 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xC059FE36A0000000, <256 x i1> %664, i32 0)
  %678 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.f32(<64 x float> %672, <64 x float> %677, <256 x i1> %664)
  %679 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.f32(<64 x float> %672, <64 x float> %672, <256 x i1> %664)
  %680 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %673, <64 x float> %672, <256 x i1> %678)
  %681 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %673, <64 x float> %680, <256 x i1> %676)
  %682 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %673, <64 x float> %681, <256 x i1> %679)
  %683 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3FF7154760000000, <256 x i1> %664, i32 0)
  %684 = call <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float> %682, <64 x float> %683, <256 x i1> %664)
  %685 = call <64 x float> @llvm.hivm.vtrc.f32.x(<64 x float> %684, i32 0, <256 x i1> %664)
  %686 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xBFE62E4000000000, <256 x i1> %664, i32 0)
  %687 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xBEB7F7D1C0000000, <256 x i1> %664, i32 0)
  %688 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %685, <64 x float> %686, <64 x float> %682, <256 x i1> %664)
  %689 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %685, <64 x float> %687, <64 x float> %688, <256 x i1> %664)
  %690 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3E927E4FC0000000, <256 x i1> %664, i32 0)
  %691 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3EC71DE3A0000000, <256 x i1> %664, i32 0)
  %692 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %690, <64 x float> %689, <64 x float> %691, <256 x i1> %664)
  %693 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3EFA01A020000000, <256 x i1> %664, i32 0)
  %694 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %692, <64 x float> %689, <64 x float> %693, <256 x i1> %664)
  %695 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3F2A01A020000000, <256 x i1> %664, i32 0)
  %696 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %694, <64 x float> %689, <64 x float> %695, <256 x i1> %664)
  %697 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3F56C16C20000000, <256 x i1> %664, i32 0)
  %698 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %696, <64 x float> %689, <64 x float> %697, <256 x i1> %664)
  %699 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3F81111120000000, <256 x i1> %664, i32 0)
  %700 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %698, <64 x float> %689, <64 x float> %699, <256 x i1> %664)
  %701 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3FA5555560000000, <256 x i1> %664, i32 0)
  %702 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %700, <64 x float> %689, <64 x float> %701, <256 x i1> %664)
  %703 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3FC5555560000000, <256 x i1> %664, i32 0)
  %704 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %702, <64 x float> %689, <64 x float> %703, <256 x i1> %664)
  %705 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 5.000000e-01, <256 x i1> %664, i32 0)
  %706 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %704, <64 x float> %689, <64 x float> %705, <256 x i1> %664)
  %707 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 1.000000e+00, <256 x i1> %664, i32 0)
  %708 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %706, <64 x float> %689, <64 x float> %707, <256 x i1> %664)
  %709 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %708, <64 x float> %689, <64 x float> %707, <256 x i1> %664)
  %710 = call <64 x i32> @llvm.hivm.vcvtfi.f322s32.x(<64 x float> %685, <256 x i1> %664, i32 0, i32 0)
  %711 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 -149, <256 x i1> %664, i32 0)
  %712 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 127, <256 x i1> %664, i32 0)
  %713 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32> %710, <64 x i32> %711, <256 x i1> %664)
  %714 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %711, <64 x i32> %710, <256 x i1> %713)
  %715 = call <256 x i1> @llvm.hivm.vcmp.gt.s.z.s32(<64 x i32> %714, <64 x i32> %712, <256 x i1> %664)
  %716 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %712, <64 x i32> %714, <256 x i1> %715)
  %717 = call <64 x i32> @llvm.hivm.vadd.s.x.v64i32(<64 x i32> %716, <64 x i32> %712, <256 x i1> %664)
  %718 = call <64 x i32> @llvm.hivm.vshls.s.x(<64 x i32> %717, i16 23, <256 x i1> %664)
  %719 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 149, <256 x i1> %664, i32 0)
  %720 = call <64 x i32> @llvm.hivm.vadd.s.x.v64i32(<64 x i32> %716, <64 x i32> %719, <256 x i1> %664)
  %721 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 -126, <256 x i1> %664, i32 0)
  %722 = call <256 x i1> @llvm.hivm.vcmp.ge.s.z.s32(<64 x i32> %716, <64 x i32> %721, <256 x i1> %664)
  %723 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %664, i32 0)
  %724 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %723, <64 x i32> %720, <256 x i1> %722)
  %725 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 1, <256 x i1> %664, i32 0)
  %726 = call <64 x i32> @llvm.hivm.vshl.u.x(<64 x i32> %725, <64 x i32> %724, <256 x i1> %664)
  %727 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %718, <64 x i32> %726, <256 x i1> %722)
  %728 = bitcast <64 x i32> %727 to <64 x float>
  %729 = call <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float> %709, <64 x float> %728, <256 x i1> %664)
  %730 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %673, <64 x float> %729, <256 x i1> %678)
  %731 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %674, <64 x float> %730, <256 x i1> %676)
  %732 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %672, <64 x float> %731, <256 x i1> %679)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %732, ptr addrspace(6) inttoptr (i64 106496 to ptr addrspace(6)), i32 %671, i32 2, i32 0, <256 x i1> %664)
  %733 = add i64 %666, 1
  br label %665

734:                                              ; preds = %665
  br label %735

735:                                              ; preds = %734
  %736 = add i32 %661, 1
  br label %660, !llvm.loop !19

737:                                              ; preds = %660
  br label %738

738:                                              ; preds = %759, %737
  %739 = phi i32 [ %760, %759 ], [ 0, %737 ]
  %740 = icmp sle i32 %739, 0
  br i1 %740, label %741, label %761

741:                                              ; preds = %738
  %742 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %743

743:                                              ; preds = %746, %741
  %744 = phi i64 [ %757, %746 ], [ 0, %741 ]
  %745 = icmp slt i64 %744, 32
  br i1 %745, label %746, label %758

746:                                              ; preds = %743
  %747 = trunc i64 %744 to i32
  %748 = udiv i32 %747, 32
  %749 = urem i32 %747, 32
  %750 = mul i32 %749, 64
  %751 = mul i32 %748, 2048
  %752 = add i32 %751, %750
  %753 = mul i32 %752, 4
  %754 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 106496 to ptr addrspace(6)), i32 %753, i32 0, i32 0)
  %755 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %754, <256 x i1> %742, i32 0, i32 0, i32 0)
  %756 = mul i32 %752, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %755, ptr addrspace(6) inttoptr (i64 147456 to ptr addrspace(6)), i32 %756, i32 7, i32 0, <256 x i1> %742)
  %757 = add i64 %744, 1
  br label %743

758:                                              ; preds = %743
  br label %759

759:                                              ; preds = %758
  %760 = add i32 %739, 1
  br label %738, !llvm.loop !20

761:                                              ; preds = %738
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 5)
  br label %762

762:                                              ; preds = %781, %761
  %763 = phi i32 [ %782, %781 ], [ 0, %761 ]
  %764 = icmp sle i32 %763, 0
  br i1 %764, label %765, label %783

765:                                              ; preds = %762
  %766 = call { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32 32)
  %767 = extractvalue { <256 x i1>, i32 } %766, 0
  %768 = extractvalue { <256 x i1>, i32 } %766, 1
  %769 = call <256 x i1> @llvm.hivm.pset.b32(i32 2)
  br label %770

770:                                              ; preds = %773, %765
  %771 = phi i64 [ %779, %773 ], [ 0, %765 ]
  %772 = icmp slt i64 %771, 64
  br i1 %772, label %773, label %780

773:                                              ; preds = %770
  %774 = trunc i64 %771 to i32
  %775 = mul i32 %774, 128
  %776 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 106496 to ptr addrspace(6)), i32 %775, i32 0, i32 0)
  %777 = call <64 x float> @llvm.hivm.vcadd.s.x.v64f32(<64 x float> %776, <256 x i1> %767)
  %778 = mul i32 %774, 4
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %777, ptr addrspace(6) inttoptr (i64 158720 to ptr addrspace(6)), i32 %778, i32 5, i32 0, <256 x i1> %769)
  %779 = add i64 %771, 1
  br label %770

780:                                              ; preds = %770
  br label %781

781:                                              ; preds = %780
  %782 = add i32 %763, 1
  br label %762, !llvm.loop !21

783:                                              ; preds = %762
  %784 = sub i32 %124, %63
  %785 = udiv i32 %784, 32
  %786 = srem i32 %785, 2
  %787 = icmp eq i32 %786, 0
  br i1 %787, label %226, label %227

788:                                              ; preds = %794, %226
  %789 = phi i32 [ %795, %794 ], [ 0, %226 ]
  %790 = icmp sle i32 %789, 0
  br i1 %790, label %791, label %796

791:                                              ; preds = %788
  %792 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %793 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 158720 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %793, ptr addrspace(6) inttoptr (i64 158976 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %792)
  br label %794

794:                                              ; preds = %791
  %795 = add i32 %789, 1
  br label %788, !llvm.loop !22

796:                                              ; preds = %788
  br label %228

797:                                              ; preds = %803, %227
  %798 = phi i32 [ %804, %803 ], [ 0, %227 ]
  %799 = icmp sle i32 %798, 0
  br i1 %799, label %800, label %805

800:                                              ; preds = %797
  %801 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %802 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 158720 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %802, ptr addrspace(6) inttoptr (i64 159232 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %801)
  br label %803

803:                                              ; preds = %800
  %804 = add i32 %798, 1
  br label %797, !llvm.loop !23

805:                                              ; preds = %797
  br label %228

806:                                              ; preds = %814, %228
  %807 = phi i32 [ %815, %814 ], [ 0, %228 ]
  %808 = icmp sle i32 %807, 0
  br i1 %808, label %809, label %816

809:                                              ; preds = %806
  %810 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %811 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 157696 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %812 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 158464 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %813 = call <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float> %811, <64 x float> %812, <256 x i1> %810)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %813, ptr addrspace(6) inttoptr (i64 159488 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %810)
  br label %814

814:                                              ; preds = %809
  %815 = add i32 %807, 1
  br label %806, !llvm.loop !24

816:                                              ; preds = %806
  br i1 %787, label %229, label %230

817:                                              ; preds = %823, %229
  %818 = phi i32 [ %824, %823 ], [ 0, %229 ]
  %819 = icmp sle i32 %818, 0
  br i1 %819, label %820, label %825

820:                                              ; preds = %817
  %821 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %822 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 159488 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %822, ptr addrspace(6) inttoptr (i64 159744 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %821)
  br label %823

823:                                              ; preds = %820
  %824 = add i32 %818, 1
  br label %817, !llvm.loop !25

825:                                              ; preds = %817
  br label %231

826:                                              ; preds = %832, %230
  %827 = phi i32 [ %833, %832 ], [ 0, %230 ]
  %828 = icmp sle i32 %827, 0
  br i1 %828, label %829, label %834

829:                                              ; preds = %826
  %830 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %831 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 159488 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %831, ptr addrspace(6) inttoptr (i64 160000 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %830)
  br label %832

832:                                              ; preds = %829
  %833 = add i32 %827, 1
  br label %826, !llvm.loop !26

834:                                              ; preds = %826
  br label %231

835:                                              ; preds = %841, %246
  %836 = phi i32 [ %842, %841 ], [ 0, %246 ]
  %837 = icmp sle i32 %836, 0
  br i1 %837, label %838, label %843

838:                                              ; preds = %835
  %839 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %840 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 158464 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %840, ptr addrspace(6) inttoptr (i64 157696 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %839)
  br label %841

841:                                              ; preds = %838
  %842 = add i32 %836, 1
  br label %835, !llvm.loop !27

843:                                              ; preds = %835
  br label %255

844:                                              ; preds = %911, %269
  %845 = phi i32 [ %912, %911 ], [ 0, %269 ]
  %846 = icmp sle i32 %845, 0
  br i1 %846, label %847, label %913

847:                                              ; preds = %844
  %848 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %849 = select i1 %273, ptr addrspace(6) inttoptr (i64 159744 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 160000 to ptr addrspace(6))
  %850 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %849, i32 0, i32 0, i32 0)
  %851 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %848, i32 0)
  %852 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x7FF0000000000000, <256 x i1> %848, i32 0)
  %853 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x40562E4300000000, <256 x i1> %848, i32 0)
  %854 = call <256 x i1> @llvm.hivm.vcmp.gt.s.z.f32(<64 x float> %850, <64 x float> %853, <256 x i1> %848)
  %855 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xC059FE36A0000000, <256 x i1> %848, i32 0)
  %856 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.f32(<64 x float> %850, <64 x float> %855, <256 x i1> %848)
  %857 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.f32(<64 x float> %850, <64 x float> %850, <256 x i1> %848)
  %858 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %851, <64 x float> %850, <256 x i1> %856)
  %859 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %851, <64 x float> %858, <256 x i1> %854)
  %860 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %851, <64 x float> %859, <256 x i1> %857)
  %861 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3FF7154760000000, <256 x i1> %848, i32 0)
  %862 = call <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float> %860, <64 x float> %861, <256 x i1> %848)
  %863 = call <64 x float> @llvm.hivm.vtrc.f32.x(<64 x float> %862, i32 0, <256 x i1> %848)
  %864 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xBFE62E4000000000, <256 x i1> %848, i32 0)
  %865 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0xBEB7F7D1C0000000, <256 x i1> %848, i32 0)
  %866 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %863, <64 x float> %864, <64 x float> %860, <256 x i1> %848)
  %867 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %863, <64 x float> %865, <64 x float> %866, <256 x i1> %848)
  %868 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3E927E4FC0000000, <256 x i1> %848, i32 0)
  %869 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3EC71DE3A0000000, <256 x i1> %848, i32 0)
  %870 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %868, <64 x float> %867, <64 x float> %869, <256 x i1> %848)
  %871 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3EFA01A020000000, <256 x i1> %848, i32 0)
  %872 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %870, <64 x float> %867, <64 x float> %871, <256 x i1> %848)
  %873 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3F2A01A020000000, <256 x i1> %848, i32 0)
  %874 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %872, <64 x float> %867, <64 x float> %873, <256 x i1> %848)
  %875 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3F56C16C20000000, <256 x i1> %848, i32 0)
  %876 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %874, <64 x float> %867, <64 x float> %875, <256 x i1> %848)
  %877 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3F81111120000000, <256 x i1> %848, i32 0)
  %878 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %876, <64 x float> %867, <64 x float> %877, <256 x i1> %848)
  %879 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3FA5555560000000, <256 x i1> %848, i32 0)
  %880 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %878, <64 x float> %867, <64 x float> %879, <256 x i1> %848)
  %881 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0x3FC5555560000000, <256 x i1> %848, i32 0)
  %882 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %880, <64 x float> %867, <64 x float> %881, <256 x i1> %848)
  %883 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 5.000000e-01, <256 x i1> %848, i32 0)
  %884 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %882, <64 x float> %867, <64 x float> %883, <256 x i1> %848)
  %885 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 1.000000e+00, <256 x i1> %848, i32 0)
  %886 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %884, <64 x float> %867, <64 x float> %885, <256 x i1> %848)
  %887 = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %886, <64 x float> %867, <64 x float> %885, <256 x i1> %848)
  %888 = call <64 x i32> @llvm.hivm.vcvtfi.f322s32.x(<64 x float> %863, <256 x i1> %848, i32 0, i32 0)
  %889 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 -149, <256 x i1> %848, i32 0)
  %890 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 127, <256 x i1> %848, i32 0)
  %891 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32> %888, <64 x i32> %889, <256 x i1> %848)
  %892 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %889, <64 x i32> %888, <256 x i1> %891)
  %893 = call <256 x i1> @llvm.hivm.vcmp.gt.s.z.s32(<64 x i32> %892, <64 x i32> %890, <256 x i1> %848)
  %894 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %890, <64 x i32> %892, <256 x i1> %893)
  %895 = call <64 x i32> @llvm.hivm.vadd.s.x.v64i32(<64 x i32> %894, <64 x i32> %890, <256 x i1> %848)
  %896 = call <64 x i32> @llvm.hivm.vshls.s.x(<64 x i32> %895, i16 23, <256 x i1> %848)
  %897 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 149, <256 x i1> %848, i32 0)
  %898 = call <64 x i32> @llvm.hivm.vadd.s.x.v64i32(<64 x i32> %894, <64 x i32> %897, <256 x i1> %848)
  %899 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 -126, <256 x i1> %848, i32 0)
  %900 = call <256 x i1> @llvm.hivm.vcmp.ge.s.z.s32(<64 x i32> %894, <64 x i32> %899, <256 x i1> %848)
  %901 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %848, i32 0)
  %902 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %901, <64 x i32> %898, <256 x i1> %900)
  %903 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 1, <256 x i1> %848, i32 0)
  %904 = call <64 x i32> @llvm.hivm.vshl.u.x(<64 x i32> %903, <64 x i32> %902, <256 x i1> %848)
  %905 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %896, <64 x i32> %904, <256 x i1> %900)
  %906 = bitcast <64 x i32> %905 to <64 x float>
  %907 = call <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float> %887, <64 x float> %906, <256 x i1> %848)
  %908 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %851, <64 x float> %907, <256 x i1> %856)
  %909 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %852, <64 x float> %908, <256 x i1> %854)
  %910 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %850, <64 x float> %909, <256 x i1> %857)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %910, ptr addrspace(6) inttoptr (i64 160256 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %848)
  br label %911

911:                                              ; preds = %847
  %912 = add i32 %845, 1
  br label %844, !llvm.loop !28

913:                                              ; preds = %844
  br label %914

914:                                              ; preds = %934, %913
  %915 = phi i32 [ %935, %934 ], [ 0, %913 ]
  %916 = icmp sle i32 %915, 0
  br i1 %916, label %917, label %936

917:                                              ; preds = %914
  %918 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %919

919:                                              ; preds = %922, %917
  %920 = phi i64 [ %932, %922 ], [ 0, %917 ]
  %921 = icmp slt i64 %920, 64
  br i1 %921, label %922, label %933

922:                                              ; preds = %919
  %923 = trunc i64 %920 to i32
  %924 = mul i32 %923, 64
  %925 = mul i32 %923, 256
  %926 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) null, i32 %925, i32 0, i32 0)
  %927 = udiv i32 %924, 64
  %928 = urem i32 %927, 64
  %929 = mul i32 %928, 4
  %930 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 160256 to ptr addrspace(6)), i32 %929, i32 3, i32 0)
  %931 = call <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float> %926, <64 x float> %930, <256 x i1> %918)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %931, ptr addrspace(6) inttoptr (i64 16384 to ptr addrspace(6)), i32 %925, i32 2, i32 0, <256 x i1> %918)
  %932 = add i64 %920, 1
  br label %919

933:                                              ; preds = %919
  br label %934

934:                                              ; preds = %933
  %935 = add i32 %915, 1
  br label %914, !llvm.loop !29

936:                                              ; preds = %914
  br label %937

937:                                              ; preds = %954, %936
  %938 = phi i32 [ %955, %954 ], [ 0, %936 ]
  %939 = icmp sle i32 %938, 0
  br i1 %939, label %940, label %956

940:                                              ; preds = %937
  %941 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %942

942:                                              ; preds = %945, %940
  %943 = phi i64 [ %952, %945 ], [ 0, %940 ]
  %944 = icmp slt i64 %943, 64
  br i1 %944, label %945, label %953

945:                                              ; preds = %942
  %946 = mul i64 %943, 64
  %947 = trunc i64 %946 to i32
  %948 = mul i32 %947, 4
  %949 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 16384 to ptr addrspace(6)), i32 %948, i32 0, i32 0)
  %950 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 49152 to ptr addrspace(6)), i32 %948, i32 0, i32 0)
  %951 = call <64 x float> @llvm.hivm.vadd.s.x.v64f32(<64 x float> %949, <64 x float> %950, <256 x i1> %941)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %951, ptr addrspace(6) null, i32 %948, i32 2, i32 0, <256 x i1> %941)
  %952 = add i64 %943, 1
  br label %942

953:                                              ; preds = %942
  br label %954

954:                                              ; preds = %953
  %955 = add i32 %938, 1
  br label %937, !llvm.loop !30

956:                                              ; preds = %937
  br label %957

957:                                              ; preds = %965, %956
  %958 = phi i32 [ %966, %965 ], [ 0, %956 ]
  %959 = icmp sle i32 %958, 0
  br i1 %959, label %960, label %967

960:                                              ; preds = %957
  %961 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %962 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 157952 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %963 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 160256 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %964 = call <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float> %962, <64 x float> %963, <256 x i1> %961)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %964, ptr addrspace(6) inttoptr (i64 160512 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %961)
  br label %965

965:                                              ; preds = %960
  %966 = add i32 %958, 1
  br label %957, !llvm.loop !31

967:                                              ; preds = %957
  br label %968

968:                                              ; preds = %977, %967
  %969 = phi i32 [ %978, %977 ], [ 0, %967 ]
  %970 = icmp sle i32 %969, 0
  br i1 %970, label %971, label %979

971:                                              ; preds = %968
  %972 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %973 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 160512 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %974 = select i1 %273, ptr addrspace(6) inttoptr (i64 158976 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 159232 to ptr addrspace(6))
  %975 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %974, i32 0, i32 0, i32 0)
  %976 = call <64 x float> @llvm.hivm.vadd.s.x.v64f32(<64 x float> %973, <64 x float> %975, <256 x i1> %972)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %976, ptr addrspace(6) inttoptr (i64 157952 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %972)
  br label %977

977:                                              ; preds = %971
  %978 = add i32 %969, 1
  br label %968, !llvm.loop !32

979:                                              ; preds = %968
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 5)
  %980 = load volatile i32, ptr addrspace(11) %26, align 4
  %981 = sub i32 %980, 1
  store volatile i32 %981, ptr addrspace(11) %26, align 4
  %982 = sub i32 %257, 1
  %983 = sub i32 %258, 1
  %984 = add i32 %125, 32
  br label %275

985:                                              ; preds = %1005, %281
  %986 = phi i32 [ %1006, %1005 ], [ 0, %281 ]
  %987 = icmp sle i32 %986, 0
  br i1 %987, label %988, label %1007

988:                                              ; preds = %985
  %989 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %990

990:                                              ; preds = %993, %988
  %991 = phi i64 [ %1003, %993 ], [ 0, %988 ]
  %992 = icmp slt i64 %991, 64
  br i1 %992, label %993, label %1004

993:                                              ; preds = %990
  %994 = trunc i64 %991 to i32
  %995 = mul i32 %994, 64
  %996 = mul i32 %994, 256
  %997 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) null, i32 %996, i32 0, i32 0)
  %998 = udiv i32 %995, 64
  %999 = urem i32 %998, 64
  %1000 = mul i32 %999, 4
  %1001 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 157952 to ptr addrspace(6)), i32 %1000, i32 3, i32 0)
  %1002 = call <64 x float> @llvm.hivm.vdiv.s.x.v64f32(<64 x float> %997, <64 x float> %1001, <256 x i1> %989)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1002, ptr addrspace(6) inttoptr (i64 32768 to ptr addrspace(6)), i32 %996, i32 2, i32 0, <256 x i1> %989)
  %1003 = add i64 %991, 1
  br label %990

1004:                                             ; preds = %990
  br label %1005

1005:                                             ; preds = %1004
  %1006 = add i32 %986, 1
  br label %985, !llvm.loop !33

1007:                                             ; preds = %985
  br label %1008

1008:                                             ; preds = %1015, %1007
  %1009 = phi i32 [ %1016, %1015 ], [ 0, %1007 ]
  %1010 = icmp sle i32 %1009, 0
  br i1 %1010, label %1011, label %1017

1011:                                             ; preds = %1008
  %1012 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %1013 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 157952 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %1014 = call <64 x float> @llvm.hivm.vln.x.v64f32(<64 x float> %1013, <256 x i1> %1012)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1014, ptr addrspace(6) inttoptr (i64 160768 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %1012)
  br label %1015

1015:                                             ; preds = %1011
  %1016 = add i32 %1009, 1
  br label %1008, !llvm.loop !34

1017:                                             ; preds = %1008
  br label %1018

1018:                                             ; preds = %1026, %1017
  %1019 = phi i32 [ %1027, %1026 ], [ 0, %1017 ]
  %1020 = icmp sle i32 %1019, 0
  br i1 %1020, label %1021, label %1028

1021:                                             ; preds = %1018
  %1022 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %1023 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 157696 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %1024 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 160768 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %1025 = call <64 x float> @llvm.hivm.vadd.s.x.v64f32(<64 x float> %1023, <64 x float> %1024, <256 x i1> %1022)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1025, ptr addrspace(6) inttoptr (i64 161024 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %1022)
  br label %1026

1026:                                             ; preds = %1021
  %1027 = add i32 %1019, 1
  br label %1018, !llvm.loop !35

1028:                                             ; preds = %1018
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 2)
  br label %1029

1029:                                             ; preds = %1050, %1028
  %1030 = phi i32 [ %1051, %1050 ], [ 0, %1028 ]
  %1031 = icmp sle i32 %1030, 0
  br i1 %1031, label %1032, label %1052

1032:                                             ; preds = %1029
  %1033 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1034

1034:                                             ; preds = %1037, %1032
  %1035 = phi i64 [ %1048, %1037 ], [ 0, %1032 ]
  %1036 = icmp slt i64 %1035, 64
  br i1 %1036, label %1037, label %1049

1037:                                             ; preds = %1034
  %1038 = trunc i64 %1035 to i32
  %1039 = udiv i32 %1038, 64
  %1040 = urem i32 %1038, 64
  %1041 = mul i32 %1040, 64
  %1042 = mul i32 %1039, 4096
  %1043 = add i32 %1042, %1041
  %1044 = mul i32 %1043, 4
  %1045 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 32768 to ptr addrspace(6)), i32 %1044, i32 0, i32 0)
  %1046 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %1045, <256 x i1> %1033, i32 0, i32 0, i32 0)
  %1047 = mul i32 %1043, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %1046, ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), i32 %1047, i32 7, i32 0, <256 x i1> %1033)
  %1048 = add i64 %1035, 1
  br label %1034

1049:                                             ; preds = %1034
  br label %1050

1050:                                             ; preds = %1049
  %1051 = add i32 %1030, 1
  br label %1029, !llvm.loop !36

1052:                                             ; preds = %1029
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 1)
  %1053 = ptrtoint ptr addrspace(1) %3 to i64
  %1054 = mul i64 %339, 2
  %1055 = add i64 0, %1054
  %1056 = add i64 %1053, %1055
  %1057 = inttoptr i64 %1056 to ptr addrspace(1)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %1057, ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), i64 %359, i64 %362)
  %1058 = mul i64 %80, %324
  %1059 = mul i64 %334, %324
  %1060 = sub i64 %1059, %1058
  %1061 = sext i32 %65 to i64
  %1062 = add i64 %1058, %1061
  %1063 = add i64 %1062, %325
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 2)
  %1064 = or i64 %358, 288230376285929472
  %1065 = mul i64 %1060, 4
  %1066 = and i64 %1065, 1099511627775
  %1067 = or i64 %1066, 4398046511104
  %1068 = ptrtoint ptr addrspace(1) %4 to i64
  %1069 = mul i64 %1063, 4
  %1070 = add i64 0, %1069
  %1071 = add i64 %1068, %1070
  %1072 = inttoptr i64 %1071 to ptr addrspace(1)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %1072, ptr addrspace(6) inttoptr (i64 161024 to ptr addrspace(6)), i64 %1064, i64 %1067)
  br label %282
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
declare void @llvm.hivm.BARRIER(i64)

; Unknown intrinsic
declare void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3), ptr addrspace(2), i64, i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4), ptr addrspace(2), i64, i64, i64)

; Unknown intrinsic
declare void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5), ptr addrspace(3), ptr addrspace(4), i64)

; Unknown intrinsic
declare void @llvm.hivm.SET.LOOP3.PARA(i64)

; Unknown intrinsic
declare void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6), ptr addrspace(5), i64, i64)

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
declare <64 x float> @llvm.hivm.vadd.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare void @llvm.hivm.vstsx1.v64f32(<64 x float>, ptr addrspace(6), i32, i32, i32, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vln.x.v64f32(<64 x float>, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vdiv.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vdups.z.v64f32(float, <256 x i1>, i32)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.vcmp.gt.s.z.f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.vcmp.lt.s.z.f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.vcmp.ne.s.z.f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vsel.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vtrc.f32.x(<64 x float>, i32, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float>, <64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vcvtfi.f322s32.x(<64 x float>, <256 x i1>, i32, i32)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vdups.z.v64i32(i32, <256 x i1>, i32)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32>, <64 x i32>, <256 x i1>)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32>, <64 x i32>, <256 x i1>)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.vcmp.gt.s.z.s32(<64 x i32>, <64 x i32>, <256 x i1>)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vadd.s.x.v64i32(<64 x i32>, <64 x i32>, <256 x i1>)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vshls.s.x(<64 x i32>, i16, <256 x i1>)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.vcmp.ge.s.z.s32(<64 x i32>, <64 x i32>, <256 x i1>)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vshl.u.x(<64 x i32>, <64 x i32>, <256 x i1>)

; Unknown intrinsic
declare void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2), ptr addrspace(6), i64)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vcadd.s.x.v64f32(<64 x float>, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vmax.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vcmax.s.x.v64f32(<64 x float>, <256 x i1>)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.pset.b8(i32)

; Unknown intrinsic
declare <256 x i8> @llvm.hivm.vbr.v256s8(i8)

; Unknown intrinsic
declare <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6), i32, i32, i32)

; Unknown intrinsic
declare { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8>, <256 x i8>)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8>, <256 x i1>, i32)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32>, <64 x i32>, <256 x i1>)

; Unknown intrinsic
declare <256 x i8> @llvm.hivm.vdups.z.v256i8(i8, <256 x i1>, i32)

; Unknown intrinsic
declare void @llvm.hivm.vstsx1.v256s8(<256 x i8>, ptr addrspace(6), i32, i32, i32, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float>, float, <256 x i1>)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.pset.b16(i32)

; Unknown intrinsic
declare <128 x bfloat> @llvm.hivm.vldsx1.v128bf16(ptr addrspace(6), i32, i32, i32)

; Unknown intrinsic
declare { <256 x i1>, i32 } @llvm.hivm.plt.b16.v300(i32)

; Unknown intrinsic
declare <128 x i16> @llvm.hivm.vci.v128i16(i16, i32)

; Unknown intrinsic
declare <128 x i16> @llvm.hivm.vmuls.s.x.v128i16(<128 x i16>, i16, <256 x i1>)

; Unknown intrinsic
declare <128 x i16> @llvm.hivm.vadds.s.x.v128i16(<128 x i16>, i16, <256 x i1>)

; Unknown intrinsic
declare <128 x bfloat> @llvm.hivm.vgather2.v300.v128bf16(ptr addrspace(6), <64 x i32>, <256 x i1>)

; Unknown intrinsic
declare <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat, <256 x i1>, i32)


attributes #0 = { "target-cpu"="dav-c310-vec" }
attributes #1 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1, !2}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @fwd_kernel_mix_aic, !"kernel", i32 1}
!2 = !{ptr @fwd_kernel_mix_aiv, !"kernel", i32 1}
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