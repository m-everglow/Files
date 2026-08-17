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
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 24 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1048 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 28 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1052 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 32 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1056 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 36 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1060 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 40 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1064 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 44 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1068 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 48 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1072 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 52 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1076 to ptr addrspace(11)), align 4
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

40:                                               ; preds = %198, %23
  %41 = phi i32 [ %199, %198 ], [ %35, %23 ]
  %42 = icmp slt i32 %41, %39
  br i1 %42, label %43, label %200

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
  br i1 %61, label %62, label %198

62:                                               ; preds = %43
  %63 = ptrtoint ptr addrspace(1) %12 to i64
  %64 = add i64 %63, 0
  %65 = inttoptr i64 %64 to ptr addrspace(1)
  %66 = getelementptr i32, ptr addrspace(1) %65, i64 %47
  %67 = load i32, ptr addrspace(1) %66, align 4
  %68 = ptrtoint ptr addrspace(1) %12 to i64
  %69 = add i64 %68, 0
  %70 = inttoptr i64 %69 to ptr addrspace(1)
  %71 = getelementptr i32, ptr addrspace(1) %70, i64 %53
  %72 = load i32, ptr addrspace(1) %71, align 4
  %73 = sub i32 %72, %67
  %74 = sdiv i32 %60, 64
  %75 = mul i32 %74, 64
  %76 = add i32 %75, 64
  %77 = call i32 @llvm.smin.i32(i32 %76, i32 %73)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 7)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 2)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 0)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 1)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 3)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 4)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 5)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 6)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 8)
  %78 = icmp eq i32 %77, 0
  %79 = sub i32 %77, 1
  %80 = udiv i32 %79, 64
  %81 = add i32 %80, 1
  %82 = select i1 %78, i32 0, i32 %81
  %83 = mul i32 %82, 5
  %84 = add i32 %83, 6
  %85 = mul i32 %84, 64
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
  br label %86

86:                                               ; preds = %195, %62
  %87 = phi i32 [ %196, %195 ], [ 0, %62 ]
  %88 = phi i32 [ %111, %195 ], [ 0, %62 ]
  %89 = phi i32 [ %118, %195 ], [ 0, %62 ]
  %90 = phi i32 [ %135, %195 ], [ 0, %62 ]
  %91 = phi i32 [ %152, %195 ], [ 0, %62 ]
  %92 = phi i32 [ %173, %195 ], [ 0, %62 ]
  %93 = phi i32 [ %194, %195 ], [ 0, %62 ]
  %94 = icmp slt i32 %87, %85
  br i1 %94, label %95, label %197

95:                                               ; preds = %86
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 0, i64 15)
  %96 = load volatile i32, ptr addrspace(11) inttoptr (i64 28 to ptr addrspace(11)), align 4
  %97 = icmp sgt i32 %96, 0
  %98 = load volatile i32, ptr addrspace(11) null, align 4
  %99 = icmp slt i32 %98, 1
  %100 = and i1 %97, %99
  %101 = icmp slt i32 %88, %77
  %102 = and i1 %100, %101
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 2)
  br i1 %102, label %103, label %109

103:                                              ; preds = %95
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) null, ptr addrspace(2) inttoptr (i64 16384 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) null, ptr addrspace(2) inttoptr (i64 8192 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 1)
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) null, ptr addrspace(3) null, ptr addrspace(4) null, i64 -6917529026567077824)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 10, i64 2)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 10)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 10, i64 2)
  call void @llvm.hivm.SET.LOOP3.PARA(i64 1)
  call void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6) null, ptr addrspace(5) null, i64 274882102272, i64 8796093022272)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 10, i64 10)
  %104 = load volatile i32, ptr addrspace(11) inttoptr (i64 28 to ptr addrspace(11)), align 4
  %105 = sub i32 %104, 1
  store volatile i32 %105, ptr addrspace(11) inttoptr (i64 28 to ptr addrspace(11)), align 4
  %106 = load volatile i32, ptr addrspace(11) null, align 4
  %107 = add i32 %106, 1
  store volatile i32 %107, ptr addrspace(11) null, align 4
  %108 = add i32 %88, 64
  br label %110

109:                                              ; preds = %95
  br label %110

110:                                              ; preds = %103, %109
  %111 = phi i32 [ %88, %109 ], [ %108, %103 ]
  br label %112

112:                                              ; preds = %110
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 0)
  %113 = icmp slt i32 %89, %77
  br i1 %113, label %114, label %116

114:                                              ; preds = %112
  %115 = add i32 %89, 64
  br label %117

116:                                              ; preds = %112
  br label %117

117:                                              ; preds = %114, %116
  %118 = phi i32 [ %89, %116 ], [ %115, %114 ]
  br label %119

119:                                              ; preds = %117
  %120 = load volatile i32, ptr addrspace(11) inttoptr (i64 32 to ptr addrspace(11)), align 4
  %121 = icmp sgt i32 %120, 0
  %122 = load volatile i32, ptr addrspace(11) inttoptr (i64 4 to ptr addrspace(11)), align 4
  %123 = icmp slt i32 %122, 1
  %124 = and i1 %121, %123
  %125 = icmp slt i32 %90, %77
  %126 = and i1 %124, %125
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 3)
  br i1 %126, label %127, label %133

127:                                              ; preds = %119
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 8)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) inttoptr (i64 8192 to ptr addrspace(3)), ptr addrspace(2) inttoptr (i64 40960 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 2)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) inttoptr (i64 8192 to ptr addrspace(4)), ptr addrspace(2) null, i64 4415226380288, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 3)
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) inttoptr (i64 16384 to ptr addrspace(5)), ptr addrspace(3) inttoptr (i64 8192 to ptr addrspace(3)), ptr addrspace(4) inttoptr (i64 8192 to ptr addrspace(4)), i64 -6917529026567077824)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 10, i64 3)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 8)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 9)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 10, i64 3)
  call void @llvm.hivm.SET.LOOP3.PARA(i64 1)
  call void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6) inttoptr (i64 16384 to ptr addrspace(6)), ptr addrspace(5) inttoptr (i64 16384 to ptr addrspace(5)), i64 274882102272, i64 8796093022272)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 10, i64 9)
  %128 = load volatile i32, ptr addrspace(11) inttoptr (i64 32 to ptr addrspace(11)), align 4
  %129 = sub i32 %128, 1
  store volatile i32 %129, ptr addrspace(11) inttoptr (i64 32 to ptr addrspace(11)), align 4
  %130 = load volatile i32, ptr addrspace(11) inttoptr (i64 4 to ptr addrspace(11)), align 4
  %131 = add i32 %130, 1
  store volatile i32 %131, ptr addrspace(11) inttoptr (i64 4 to ptr addrspace(11)), align 4
  %132 = add i32 %90, 64
  br label %134

133:                                              ; preds = %119
  br label %134

134:                                              ; preds = %127, %133
  %135 = phi i32 [ %90, %133 ], [ %132, %127 ]
  br label %136

136:                                              ; preds = %134
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 2)
  %137 = load volatile i32, ptr addrspace(11) inttoptr (i64 36 to ptr addrspace(11)), align 4
  %138 = icmp sgt i32 %137, 0
  %139 = load volatile i32, ptr addrspace(11) inttoptr (i64 8 to ptr addrspace(11)), align 4
  %140 = icmp slt i32 %139, 1
  %141 = and i1 %138, %140
  %142 = icmp slt i32 %91, %77
  %143 = and i1 %141, %142
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 4)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 4)
  br i1 %143, label %144, label %150

144:                                              ; preds = %136
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 1)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) inttoptr (i64 16384 to ptr addrspace(3)), ptr addrspace(2) inttoptr (i64 49152 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 4)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) inttoptr (i64 16384 to ptr addrspace(4)), ptr addrspace(2) null, i64 4415226380288, i64 262148, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 4)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 5)
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) inttoptr (i64 32768 to ptr addrspace(5)), ptr addrspace(3) inttoptr (i64 16384 to ptr addrspace(3)), ptr addrspace(4) inttoptr (i64 16384 to ptr addrspace(4)), i64 -6917529026567077824)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 10, i64 4)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 1)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 11)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 10, i64 4)
  call void @llvm.hivm.SET.LOOP3.PARA(i64 1)
  call void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6) inttoptr (i64 32768 to ptr addrspace(6)), ptr addrspace(5) inttoptr (i64 32768 to ptr addrspace(5)), i64 274882102272, i64 8796093022272)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 10, i64 11)
  %145 = load volatile i32, ptr addrspace(11) inttoptr (i64 36 to ptr addrspace(11)), align 4
  %146 = sub i32 %145, 1
  store volatile i32 %146, ptr addrspace(11) inttoptr (i64 36 to ptr addrspace(11)), align 4
  %147 = load volatile i32, ptr addrspace(11) inttoptr (i64 8 to ptr addrspace(11)), align 4
  %148 = add i32 %147, 1
  store volatile i32 %148, ptr addrspace(11) inttoptr (i64 8 to ptr addrspace(11)), align 4
  %149 = add i32 %91, 64
  br label %151

150:                                              ; preds = %136
  br label %151

151:                                              ; preds = %144, %150
  %152 = phi i32 [ %91, %150 ], [ %149, %144 ]
  br label %153

153:                                              ; preds = %151
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 4)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 5)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 4)
  %154 = load volatile i32, ptr addrspace(11) inttoptr (i64 44 to ptr addrspace(11)), align 4
  %155 = icmp sgt i32 %154, 0
  %156 = load volatile i32, ptr addrspace(11) inttoptr (i64 40 to ptr addrspace(11)), align 4
  %157 = icmp sgt i32 %156, 0
  %158 = and i1 %155, %157
  %159 = icmp slt i32 %92, %77
  %160 = and i1 %158, %159
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 2, i64 3, i64 7)
  br i1 %160, label %161, label %171

161:                                              ; preds = %153
  %162 = icmp eq i32 %92, 0
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 6)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 5)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) inttoptr (i64 24576 to ptr addrspace(3)), ptr addrspace(2) inttoptr (i64 65536 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 6)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) inttoptr (i64 24576 to ptr addrspace(4)), ptr addrspace(2) inttoptr (i64 32768 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 3, i64 2, i64 7)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 3, i64 2, i64 7)
  br i1 %162, label %163, label %201

163:                                              ; preds = %201, %161
  %164 = phi i64 [ %202, %201 ], [ -6917529026567077824, %161 ]
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) inttoptr (i64 49152 to ptr addrspace(5)), ptr addrspace(3) inttoptr (i64 24576 to ptr addrspace(3)), ptr addrspace(4) inttoptr (i64 24576 to ptr addrspace(4)), i64 %164)
  br label %165

165:                                              ; preds = %163
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 5)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 6)
  %166 = load volatile i32, ptr addrspace(11) inttoptr (i64 44 to ptr addrspace(11)), align 4
  %167 = sub i32 %166, 1
  store volatile i32 %167, ptr addrspace(11) inttoptr (i64 44 to ptr addrspace(11)), align 4
  %168 = load volatile i32, ptr addrspace(11) inttoptr (i64 40 to ptr addrspace(11)), align 4
  %169 = sub i32 %168, 1
  store volatile i32 %169, ptr addrspace(11) inttoptr (i64 40 to ptr addrspace(11)), align 4
  %170 = add i32 %92, 64
  br label %172

171:                                              ; preds = %153
  br label %172

172:                                              ; preds = %165, %171
  %173 = phi i32 [ %92, %171 ], [ %170, %165 ]
  br label %174

174:                                              ; preds = %172
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 7)
  call void @llvm.hivm.SET.FLAG.IMM(i64 2, i64 3, i64 6)
  %175 = load volatile i32, ptr addrspace(11) inttoptr (i64 52 to ptr addrspace(11)), align 4
  %176 = icmp sgt i32 %175, 0
  %177 = load volatile i32, ptr addrspace(11) inttoptr (i64 48 to ptr addrspace(11)), align 4
  %178 = icmp sgt i32 %177, 0
  %179 = and i1 %176, %178
  %180 = icmp slt i32 %93, %77
  %181 = and i1 %179, %180
  call void @llvm.hivm.BARRIER(i64 6)
  br i1 %181, label %182, label %192

182:                                              ; preds = %174
  %183 = icmp eq i32 %93, 0
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 4)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 3, i64 3)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) inttoptr (i64 32768 to ptr addrspace(3)), ptr addrspace(2) inttoptr (i64 57344 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 1)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) inttoptr (i64 32768 to ptr addrspace(4)), ptr addrspace(2) inttoptr (i64 24576 to ptr addrspace(2)), i64 4415226380288, i64 262148, i64 1)
  call void @llvm.hivm.BARRIER(i64 6)
  br i1 %183, label %184, label %203

184:                                              ; preds = %203, %182
  %185 = phi i64 [ %204, %203 ], [ -6917529026567077824, %182 ]
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) inttoptr (i64 65536 to ptr addrspace(5)), ptr addrspace(3) inttoptr (i64 32768 to ptr addrspace(3)), ptr addrspace(4) inttoptr (i64 32768 to ptr addrspace(4)), i64 %185)
  br label %186

186:                                              ; preds = %184
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 3)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 2, i64 4)
  %187 = load volatile i32, ptr addrspace(11) inttoptr (i64 52 to ptr addrspace(11)), align 4
  %188 = sub i32 %187, 1
  store volatile i32 %188, ptr addrspace(11) inttoptr (i64 52 to ptr addrspace(11)), align 4
  %189 = load volatile i32, ptr addrspace(11) inttoptr (i64 48 to ptr addrspace(11)), align 4
  %190 = sub i32 %189, 1
  store volatile i32 %190, ptr addrspace(11) inttoptr (i64 48 to ptr addrspace(11)), align 4
  %191 = add i32 %93, 64
  br label %193

192:                                              ; preds = %174
  br label %193

193:                                              ; preds = %186, %192
  %194 = phi i32 [ %93, %192 ], [ %191, %186 ]
  br label %195

195:                                              ; preds = %193
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 0, i64 15)
  %196 = add i32 %87, 64
  br label %86

197:                                              ; preds = %86
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
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 0, i64 15)
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
  br label %198

198:                                              ; preds = %197, %43
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 10, i64 2, i64 0)
  %199 = add i32 %41, 28
  br label %40

200:                                              ; preds = %40
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 10, i64 2, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 13)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 10, i64 12)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void

201:                                              ; preds = %161
  %202 = phi i64 [ 2305843010287697984, %161 ]
  br label %163

203:                                              ; preds = %182
  %204 = phi i64 [ 2305843010287697984, %182 ]
  br label %184
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
  br i1 %29, label %30, label %406

30:                                               ; preds = %23
  %31 = mul i64 %28, 1024
  %32 = add i64 %31, 8
  %33 = inttoptr i64 %32 to ptr addrspace(11)
  %34 = inttoptr i64 %31 to ptr addrspace(11)
  %35 = add i64 %31, 4
  %36 = inttoptr i64 %35 to ptr addrspace(11)
  %37 = add i64 %31, 36
  %38 = inttoptr i64 %37 to ptr addrspace(11)
  %39 = add i64 %31, 44
  %40 = inttoptr i64 %39 to ptr addrspace(11)
  %41 = add i64 %31, 52
  %42 = inttoptr i64 %41 to ptr addrspace(11)
  %43 = add i64 %31, 32
  %44 = inttoptr i64 %43 to ptr addrspace(11)
  %45 = add i64 %31, 40
  %46 = inttoptr i64 %45 to ptr addrspace(11)
  %47 = add i64 %31, 28
  %48 = inttoptr i64 %47 to ptr addrspace(11)
  %49 = add i64 %31, 48
  %50 = inttoptr i64 %49 to ptr addrspace(11)
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
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 24 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1048 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 28 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1052 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 32 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1056 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 36 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1060 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 40 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1064 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 44 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1068 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 48 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1072 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 52 to ptr addrspace(11)), align 4
  store volatile i32 0, ptr addrspace(11) inttoptr (i64 1076 to ptr addrspace(11)), align 4
  %51 = call i64 @llvm.hivm.GET.BLOCK.IDX()
  %52 = zext i32 %22 to i64
  %53 = udiv i64 %51, %52
  %54 = zext i32 %21 to i64
  %55 = udiv i64 %53, %54
  %56 = zext i32 %20 to i64
  %57 = urem i64 %55, %56
  %58 = trunc i64 %57 to i32
  %59 = add i32 %16, 63
  %60 = sdiv i32 %59, 64
  %61 = mul i32 %60, %17
  %62 = mul i32 %61, %14
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 12)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 13)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 3)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 1)
  br label %63

63:                                               ; preds = %403, %30
  %64 = phi i32 [ %404, %403 ], [ %58, %30 ]
  %65 = icmp slt i32 %64, %62
  br i1 %65, label %66, label %405

66:                                               ; preds = %63
  %67 = sdiv i32 %64, %60
  %68 = srem i32 %64, %60
  %69 = sdiv i32 %67, %17
  %70 = sext i32 %69 to i64
  %71 = ptrtoint ptr addrspace(1) %13 to i64
  %72 = add i64 %71, 0
  %73 = inttoptr i64 %72 to ptr addrspace(1)
  %74 = getelementptr i32, ptr addrspace(1) %73, i64 %70
  %75 = load i32, ptr addrspace(1) %74, align 4
  %76 = add i64 %70, 1
  %77 = ptrtoint ptr addrspace(1) %13 to i64
  %78 = add i64 %77, 0
  %79 = inttoptr i64 %78 to ptr addrspace(1)
  %80 = getelementptr i32, ptr addrspace(1) %79, i64 %76
  %81 = load i32, ptr addrspace(1) %80, align 4
  %82 = sub i32 %81, %75
  %83 = mul i32 %68, 64
  %84 = icmp slt i32 %83, %82
  %85 = srem i32 %67, %17
  %86 = sdiv i32 %17, %18
  %87 = sdiv i32 %85, %86
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 1)
  br i1 %84, label %88, label %403

88:                                               ; preds = %66
  %89 = ptrtoint ptr addrspace(1) %12 to i64
  %90 = add i64 %89, 0
  %91 = inttoptr i64 %90 to ptr addrspace(1)
  %92 = getelementptr i32, ptr addrspace(1) %91, i64 %70
  %93 = load i32, ptr addrspace(1) %92, align 4
  %94 = ptrtoint ptr addrspace(1) %12 to i64
  %95 = add i64 %94, 0
  %96 = inttoptr i64 %95 to ptr addrspace(1)
  %97 = getelementptr i32, ptr addrspace(1) %96, i64 %76
  %98 = load i32, ptr addrspace(1) %97, align 4
  %99 = sub i32 %98, %93
  %100 = sdiv i32 %83, 64
  %101 = mul i32 %100, 64
  %102 = add i32 %101, 64
  %103 = call i32 @llvm.smin.i32(i32 %102, i32 %99)
  %104 = fmul float %19, 0x3FF7154760000000
  %105 = sext i32 %93 to i64
  %106 = sext i32 %17 to i64
  %107 = mul i64 %105, %106
  %108 = sext i32 %99 to i64
  %109 = sext i32 %82 to i64
  %110 = sext i32 %83 to i64
  %111 = mul i32 %69, %15
  %112 = mul i32 %111, %16
  %113 = sext i32 %16 to i64
  %114 = sext i32 %75 to i64
  %115 = sext i32 %18 to i64
  %116 = mul i64 %114, %115
  %117 = mul i64 %116, 64
  %118 = mul i32 %87, 64
  %119 = mul i32 %18, 64
  %120 = sext i32 %119 to i64
  %121 = sub i64 %109, %110
  %122 = call i64 @llvm.smax.i64(i64 %121, i64 0)
  %123 = call i64 @llvm.smin.i64(i64 %122, i64 64)
  %124 = mul i64 %110, %120
  %125 = add i64 %110, 1
  %126 = mul i64 %125, %120
  %127 = sub i64 %126, %124
  %128 = sext i32 %118 to i64
  %129 = add i64 %124, %128
  %130 = add i64 %129, %117
  br label %407

131:                                              ; preds = %134, %423
  %132 = phi i64 [ 0, %423 ], [ %143, %134 ]
  %133 = icmp slt i64 %132, 4
  br i1 %133, label %134, label %144

134:                                              ; preds = %131
  %135 = mul i64 %132, 16
  %136 = mul i64 %132, 1024
  %137 = mul i64 %136, 2
  %138 = add i64 0, %137
  %139 = getelementptr i8, ptr addrspace(2) null, i64 %138
  %140 = mul i64 %135, 2
  %141 = add i64 0, %140
  %142 = getelementptr i8, ptr addrspace(6) inttoptr (i64 98304 to ptr addrspace(6)), i64 %141
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %139, ptr addrspace(6) %142, i64 12884968448)
  %143 = add i64 %132, 1
  br label %131

144:                                              ; preds = %131
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 2)
  br label %435

145:                                              ; preds = %148, %451
  %146 = phi i64 [ 0, %451 ], [ %157, %148 ]
  %147 = icmp slt i64 %146, 4
  br i1 %147, label %148, label %158

148:                                              ; preds = %145
  %149 = mul i64 %146, 16
  %150 = mul i64 %146, 1024
  %151 = mul i64 %150, 2
  %152 = add i64 0, %151
  %153 = getelementptr i8, ptr addrspace(2) inttoptr (i64 8192 to ptr addrspace(2)), i64 %152
  %154 = mul i64 %149, 2
  %155 = add i64 0, %154
  %156 = getelementptr i8, ptr addrspace(6) inttoptr (i64 106496 to ptr addrspace(6)), i64 %155
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %153, ptr addrspace(6) %156, i64 12884968448)
  %157 = add i64 %146, 1
  br label %145

158:                                              ; preds = %145
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 7)
  %159 = mul i64 %107, 64
  %160 = mul i32 %85, 64
  %161 = mul i32 %17, 64
  %162 = sext i32 %161 to i64
  %163 = sext i32 %160 to i64
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 9)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 10)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 11)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 0, i64 15)
  %164 = icmp eq i32 %103, 0
  %165 = sub i32 %103, 1
  %166 = udiv i32 %165, 64
  %167 = add i32 %166, 1
  %168 = select i1 %164, i32 0, i32 %167
  %169 = mul i32 %168, 5
  %170 = add i32 %169, 6
  %171 = mul i32 %170, 64
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
  br label %172

172:                                              ; preds = %398, %158
  %173 = phi i32 [ %399, %398 ], [ 0, %158 ]
  %174 = phi i64 [ %294, %398 ], [ 0, %158 ]
  %175 = phi i64 [ %238, %398 ], [ 0, %158 ]
  %176 = phi i64 [ %380, %398 ], [ 0, %158 ]
  %177 = phi i64 [ %381, %398 ], [ 0, %158 ]
  %178 = phi i64 [ %382, %398 ], [ 0, %158 ]
  %179 = phi i32 [ %239, %398 ], [ 0, %158 ]
  %180 = phi i32 [ %295, %398 ], [ 0, %158 ]
  %181 = phi i32 [ %383, %398 ], [ 0, %158 ]
  %182 = phi i32 [ %397, %398 ], [ 0, %158 ]
  %183 = icmp slt i32 %173, %171
  br i1 %183, label %184, label %400

184:                                              ; preds = %172
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 0, i64 15)
  %185 = load volatile i32, ptr addrspace(11) %48, align 4
  %186 = icmp slt i32 %185, 1
  %187 = load volatile i32, ptr addrspace(11) %50, align 4
  %188 = icmp slt i32 %187, 1
  %189 = and i1 %186, %188
  %190 = icmp slt i32 %179, %103
  %191 = and i1 %189, %190
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 4)
  br i1 %191, label %192, label %236

192:                                              ; preds = %184
  %193 = sub i64 %108, %175
  %194 = call i64 @llvm.smax.i64(i64 %193, i64 0)
  %195 = call i64 @llvm.smin.i64(i64 %194, i64 64)
  %196 = mul i64 %175, %162
  %197 = add i64 %175, 1
  %198 = mul i64 %197, %162
  %199 = sub i64 %198, %196
  %200 = sext i32 %160 to i64
  %201 = add i64 %196, %200
  %202 = add i64 %201, %159
  br label %457

203:                                              ; preds = %206, %473
  %204 = phi i64 [ 0, %473 ], [ %215, %206 ]
  %205 = icmp slt i64 %204, 4
  br i1 %205, label %206, label %216

206:                                              ; preds = %203
  %207 = mul i64 %204, 16
  %208 = mul i64 %204, 1024
  %209 = mul i64 %208, 2
  %210 = add i64 0, %209
  %211 = getelementptr i8, ptr addrspace(2) inttoptr (i64 16384 to ptr addrspace(2)), i64 %210
  %212 = mul i64 %207, 2
  %213 = add i64 0, %212
  %214 = getelementptr i8, ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), i64 %213
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %211, ptr addrspace(6) %214, i64 12884968448)
  %215 = add i64 %204, 1
  br label %203

216:                                              ; preds = %203
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 4)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 4)
  br label %217

217:                                              ; preds = %220, %216
  %218 = phi i64 [ %229, %220 ], [ 0, %216 ]
  %219 = icmp slt i64 %218, 4
  br i1 %219, label %220, label %230

220:                                              ; preds = %217
  %221 = mul i64 %218, 16
  %222 = mul i64 %218, 1024
  %223 = mul i64 %222, 2
  %224 = add i64 0, %223
  %225 = getelementptr i8, ptr addrspace(2) inttoptr (i64 24576 to ptr addrspace(2)), i64 %224
  %226 = mul i64 %221, 2
  %227 = add i64 0, %226
  %228 = getelementptr i8, ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), i64 %227
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %225, ptr addrspace(6) %228, i64 12884968448)
  %229 = add i64 %218, 1
  br label %217

230:                                              ; preds = %217
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 4)
  %231 = load volatile i32, ptr addrspace(11) %48, align 4
  %232 = add i32 %231, 1
  store volatile i32 %232, ptr addrspace(11) %48, align 4
  %233 = load volatile i32, ptr addrspace(11) %50, align 4
  %234 = add i32 %233, 1
  store volatile i32 %234, ptr addrspace(11) %50, align 4
  %235 = add i32 %179, 64
  br label %237

236:                                              ; preds = %184
  br label %237

237:                                              ; preds = %230, %236
  %238 = phi i64 [ %175, %236 ], [ %485, %230 ]
  %239 = phi i32 [ %179, %236 ], [ %235, %230 ]
  br label %240

240:                                              ; preds = %237
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 4)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 5)
  %241 = load volatile i32, ptr addrspace(11) %44, align 4
  %242 = icmp slt i32 %241, 1
  %243 = load volatile i32, ptr addrspace(11) %46, align 4
  %244 = icmp slt i32 %243, 1
  %245 = and i1 %242, %244
  %246 = icmp slt i32 %180, %103
  %247 = and i1 %245, %246
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 2)
  br i1 %247, label %248, label %292

248:                                              ; preds = %240
  %249 = sub i64 %108, %174
  %250 = call i64 @llvm.smax.i64(i64 %249, i64 0)
  %251 = call i64 @llvm.smin.i64(i64 %250, i64 64)
  %252 = mul i64 %174, %162
  %253 = add i64 %174, 1
  %254 = mul i64 %253, %162
  %255 = sub i64 %254, %252
  %256 = sext i32 %160 to i64
  %257 = add i64 %252, %256
  %258 = add i64 %257, %159
  br label %486

259:                                              ; preds = %262, %502
  %260 = phi i64 [ 0, %502 ], [ %271, %262 ]
  %261 = icmp slt i64 %260, 4
  br i1 %261, label %262, label %272

262:                                              ; preds = %259
  %263 = mul i64 %260, 16
  %264 = mul i64 %260, 1024
  %265 = mul i64 %264, 2
  %266 = add i64 0, %265
  %267 = getelementptr i8, ptr addrspace(2) inttoptr (i64 32768 to ptr addrspace(2)), i64 %266
  %268 = mul i64 %263, 2
  %269 = add i64 0, %268
  %270 = getelementptr i8, ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), i64 %269
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %267, ptr addrspace(6) %270, i64 12884968448)
  %271 = add i64 %260, 1
  br label %259

272:                                              ; preds = %259
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 6)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 8)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 2)
  br label %273

273:                                              ; preds = %276, %272
  %274 = phi i64 [ %285, %276 ], [ 0, %272 ]
  %275 = icmp slt i64 %274, 4
  br i1 %275, label %276, label %286

276:                                              ; preds = %273
  %277 = mul i64 %274, 16
  %278 = mul i64 %274, 1024
  %279 = mul i64 %278, 2
  %280 = add i64 0, %279
  %281 = getelementptr i8, ptr addrspace(2) inttoptr (i64 40960 to ptr addrspace(2)), i64 %280
  %282 = mul i64 %277, 2
  %283 = add i64 0, %282
  %284 = getelementptr i8, ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), i64 %283
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %281, ptr addrspace(6) %284, i64 12884968448)
  %285 = add i64 %274, 1
  br label %273

286:                                              ; preds = %273
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 8)
  %287 = load volatile i32, ptr addrspace(11) %44, align 4
  %288 = add i32 %287, 1
  store volatile i32 %288, ptr addrspace(11) %44, align 4
  %289 = load volatile i32, ptr addrspace(11) %46, align 4
  %290 = add i32 %289, 1
  store volatile i32 %290, ptr addrspace(11) %46, align 4
  %291 = add i32 %180, 64
  br label %293

292:                                              ; preds = %240
  br label %293

293:                                              ; preds = %286, %292
  %294 = phi i64 [ %174, %292 ], [ %514, %286 ]
  %295 = phi i32 [ %180, %292 ], [ %291, %286 ]
  br label %296

296:                                              ; preds = %293
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 3)
  %297 = load volatile i32, ptr addrspace(11) %34, align 4
  %298 = icmp sgt i32 %297, 0
  %299 = load volatile i32, ptr addrspace(11) %36, align 4
  %300 = icmp sgt i32 %299, 0
  %301 = and i1 %298, %300
  %302 = load volatile i32, ptr addrspace(11) %38, align 4
  %303 = icmp slt i32 %302, 1
  %304 = and i1 %301, %303
  %305 = load volatile i32, ptr addrspace(11) %40, align 4
  %306 = icmp slt i32 %305, 1
  %307 = and i1 %304, %306
  %308 = load volatile i32, ptr addrspace(11) %42, align 4
  %309 = icmp slt i32 %308, 1
  %310 = and i1 %307, %309
  %311 = icmp slt i32 %181, %103
  %312 = and i1 %310, %311
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 7)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 5)
  br i1 %312, label %313, label %378

313:                                              ; preds = %296
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 10)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 9)
  %314 = sub i64 %108, %178
  %315 = call i64 @llvm.smax.i64(i64 %314, i64 0)
  %316 = call i64 @llvm.smin.i64(i64 %315, i64 64)
  %317 = mul i64 %178, %113
  %318 = add i64 %317, %110
  %319 = add i64 %178, 1
  %320 = mul i64 %319, %113
  %321 = add i64 %320, %110
  %322 = sub i64 %321, %318
  %323 = sext i32 %112 to i64
  %324 = add i64 %318, %323
  br label %515

325:                                              ; preds = %328, %1062
  %326 = phi i64 [ 0, %1062 ], [ %337, %328 ]
  %327 = icmp slt i64 %326, 4
  br i1 %327, label %328, label %338

328:                                              ; preds = %325
  %329 = mul i64 %326, 16
  %330 = mul i64 %326, 1024
  %331 = mul i64 %330, 2
  %332 = add i64 0, %331
  %333 = getelementptr i8, ptr addrspace(2) inttoptr (i64 49152 to ptr addrspace(2)), i64 %332
  %334 = mul i64 %329, 2
  %335 = add i64 0, %334
  %336 = getelementptr i8, ptr addrspace(6) inttoptr (i64 139264 to ptr addrspace(6)), i64 %335
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %333, ptr addrspace(6) %336, i64 12884968448)
  %337 = add i64 %326, 1
  br label %325

338:                                              ; preds = %325
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 1)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 6)
  br label %339

339:                                              ; preds = %342, %338
  %340 = phi i64 [ %351, %342 ], [ 0, %338 ]
  %341 = icmp slt i64 %340, 4
  br i1 %341, label %342, label %352

342:                                              ; preds = %339
  %343 = mul i64 %340, 16
  %344 = mul i64 %340, 1024
  %345 = mul i64 %344, 2
  %346 = add i64 0, %345
  %347 = getelementptr i8, ptr addrspace(2) inttoptr (i64 57344 to ptr addrspace(2)), i64 %346
  %348 = mul i64 %343, 2
  %349 = add i64 0, %348
  %350 = getelementptr i8, ptr addrspace(6) inttoptr (i64 131072 to ptr addrspace(6)), i64 %349
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %347, ptr addrspace(6) %350, i64 12884968448)
  %351 = add i64 %340, 1
  br label %339

352:                                              ; preds = %339
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 3)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 5)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 5)
  br label %353

353:                                              ; preds = %356, %352
  %354 = phi i64 [ %365, %356 ], [ 0, %352 ]
  %355 = icmp slt i64 %354, 4
  br i1 %355, label %356, label %366

356:                                              ; preds = %353
  %357 = mul i64 %354, 16
  %358 = mul i64 %354, 1024
  %359 = mul i64 %358, 2
  %360 = add i64 0, %359
  %361 = getelementptr i8, ptr addrspace(2) inttoptr (i64 65536 to ptr addrspace(2)), i64 %360
  %362 = mul i64 %357, 2
  %363 = add i64 0, %362
  %364 = getelementptr i8, ptr addrspace(6) inttoptr (i64 139264 to ptr addrspace(6)), i64 %363
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) %361, ptr addrspace(6) %364, i64 12884968448)
  %365 = add i64 %354, 1
  br label %353

366:                                              ; preds = %353
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 5, i64 5)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 9)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 10)
  %367 = load volatile i32, ptr addrspace(11) %34, align 4
  %368 = sub i32 %367, 1
  store volatile i32 %368, ptr addrspace(11) %34, align 4
  %369 = load volatile i32, ptr addrspace(11) %36, align 4
  %370 = sub i32 %369, 1
  store volatile i32 %370, ptr addrspace(11) %36, align 4
  %371 = load volatile i32, ptr addrspace(11) %38, align 4
  %372 = add i32 %371, 1
  store volatile i32 %372, ptr addrspace(11) %38, align 4
  %373 = load volatile i32, ptr addrspace(11) %40, align 4
  %374 = add i32 %373, 1
  store volatile i32 %374, ptr addrspace(11) %40, align 4
  %375 = load volatile i32, ptr addrspace(11) %42, align 4
  %376 = add i32 %375, 1
  store volatile i32 %376, ptr addrspace(11) %42, align 4
  %377 = add i32 %181, 64
  br label %379

378:                                              ; preds = %296
  br label %379

379:                                              ; preds = %366, %378
  %380 = phi i64 [ %176, %378 ], [ %1063, %366 ]
  %381 = phi i64 [ %177, %378 ], [ %1064, %366 ]
  %382 = phi i64 [ %178, %378 ], [ %1065, %366 ]
  %383 = phi i32 [ %181, %378 ], [ %377, %366 ]
  br label %384

384:                                              ; preds = %379
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 5)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 6)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 7)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  %385 = load volatile i32, ptr addrspace(11) %33, align 4
  %386 = icmp sgt i32 %385, 0
  %387 = icmp slt i32 %182, %103
  %388 = and i1 %386, %387
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 4)
  br i1 %388, label %389, label %395

389:                                              ; preds = %384
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 1, i64 11)
  %390 = sext i32 %182 to i64
  %391 = add i64 %105, %390
  %392 = mul i64 %391, %106
  %393 = mul i64 %392, 64
  %394 = add i64 %393, %163
  br label %1066

395:                                              ; preds = %384
  br label %396

396:                                              ; preds = %1084, %395
  %397 = phi i32 [ %1114, %1084 ], [ %182, %395 ]
  br label %398

398:                                              ; preds = %396
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 4)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 0, i64 15)
  %399 = add i32 %173, 64
  br label %172

400:                                              ; preds = %172
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
  %401 = mul i64 %114, %106
  %402 = mul i64 %401, 64
  br label %1115

403:                                              ; preds = %1195, %66
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 1)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 5, i64 1, i64 3)
  %404 = add i32 %64, 28
  br label %63

405:                                              ; preds = %63
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 5, i64 1, i64 3)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 7)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 2)
  call void @llvm.hivm.BARRIER(i64 6)
  br label %406

406:                                              ; preds = %405, %23
  ret void

407:                                              ; preds = %421, %88
  %408 = phi i32 [ %422, %421 ], [ 0, %88 ]
  %409 = icmp sle i32 %408, 0
  br i1 %409, label %410, label %423

410:                                              ; preds = %407
  %411 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %412

412:                                              ; preds = %415, %410
  %413 = phi i64 [ %419, %415 ], [ 0, %410 ]
  %414 = icmp slt i64 %413, 32
  br i1 %414, label %415, label %420

415:                                              ; preds = %412
  %416 = trunc i64 %413 to i32
  %417 = mul i32 %416, 256
  %418 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %411, i32 0)
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %418, ptr addrspace(6) inttoptr (i64 98304 to ptr addrspace(6)), i32 %417, i32 1, i32 0, <256 x i1> %411)
  %419 = add i64 %413, 1
  br label %412

420:                                              ; preds = %412
  br label %421

421:                                              ; preds = %420
  %422 = add i32 %408, 1
  br label %407, !llvm.loop !3

423:                                              ; preds = %407
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  %424 = and i64 %123, 2097151
  %425 = shl i64 %424, 4
  %426 = or i64 %425, 288230380446679040
  %427 = mul i64 %127, 2
  %428 = and i64 %427, 1099511627775
  %429 = or i64 %428, 140737488355328
  %430 = ptrtoint ptr addrspace(1) %1 to i64
  %431 = mul i64 %130, 2
  %432 = add i64 0, %431
  %433 = add i64 %430, %432
  %434 = inttoptr i64 %433 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 98304 to ptr addrspace(6)), ptr addrspace(1) %434, i64 %426, i64 %429)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 0)
  br label %131

435:                                              ; preds = %449, %144
  %436 = phi i32 [ %450, %449 ], [ 0, %144 ]
  %437 = icmp sle i32 %436, 0
  br i1 %437, label %438, label %451

438:                                              ; preds = %435
  %439 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %440

440:                                              ; preds = %443, %438
  %441 = phi i64 [ %447, %443 ], [ 0, %438 ]
  %442 = icmp slt i64 %441, 32
  br i1 %442, label %443, label %448

443:                                              ; preds = %440
  %444 = trunc i64 %441 to i32
  %445 = mul i32 %444, 256
  %446 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %439, i32 0)
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %446, ptr addrspace(6) inttoptr (i64 106496 to ptr addrspace(6)), i32 %445, i32 1, i32 0, <256 x i1> %439)
  %447 = add i64 %441, 1
  br label %440

448:                                              ; preds = %440
  br label %449

449:                                              ; preds = %448
  %450 = add i32 %436, 1
  br label %435, !llvm.loop !5

451:                                              ; preds = %435
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  %452 = ptrtoint ptr addrspace(1) %2 to i64
  %453 = mul i64 %130, 2
  %454 = add i64 0, %453
  %455 = add i64 %452, %454
  %456 = inttoptr i64 %455 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 106496 to ptr addrspace(6)), ptr addrspace(1) %456, i64 %426, i64 %429)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 1)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 7)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 1)
  br label %145

457:                                              ; preds = %471, %192
  %458 = phi i32 [ %472, %471 ], [ 0, %192 ]
  %459 = icmp sle i32 %458, 0
  br i1 %459, label %460, label %473

460:                                              ; preds = %457
  %461 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %462

462:                                              ; preds = %465, %460
  %463 = phi i64 [ %469, %465 ], [ 0, %460 ]
  %464 = icmp slt i64 %463, 32
  br i1 %464, label %465, label %470

465:                                              ; preds = %462
  %466 = trunc i64 %463 to i32
  %467 = mul i32 %466, 256
  %468 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %461, i32 0)
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %468, ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), i32 %467, i32 1, i32 0, <256 x i1> %461)
  %469 = add i64 %463, 1
  br label %462

470:                                              ; preds = %462
  br label %471

471:                                              ; preds = %470
  %472 = add i32 %458, 1
  br label %457, !llvm.loop !6

473:                                              ; preds = %457
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 3)
  %474 = and i64 %195, 2097151
  %475 = shl i64 %474, 4
  %476 = or i64 %475, 288230380446679040
  %477 = mul i64 %199, 2
  %478 = and i64 %477, 1099511627775
  %479 = or i64 %478, 140737488355328
  %480 = ptrtoint ptr addrspace(1) %6 to i64
  %481 = mul i64 %202, 2
  %482 = add i64 0, %481
  %483 = add i64 %480, %482
  %484 = inttoptr i64 %483 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), ptr addrspace(1) %484, i64 %476, i64 %479)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 4)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 5)
  %485 = add i64 %175, 64
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 0)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 5)
  br label %203

486:                                              ; preds = %500, %248
  %487 = phi i32 [ %501, %500 ], [ 0, %248 ]
  %488 = icmp sle i32 %487, 0
  br i1 %488, label %489, label %502

489:                                              ; preds = %486
  %490 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %491

491:                                              ; preds = %494, %489
  %492 = phi i64 [ %498, %494 ], [ 0, %489 ]
  %493 = icmp slt i64 %492, 32
  br i1 %493, label %494, label %499

494:                                              ; preds = %491
  %495 = trunc i64 %492 to i32
  %496 = mul i32 %495, 256
  %497 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %490, i32 0)
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %497, ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), i32 %496, i32 1, i32 0, <256 x i1> %490)
  %498 = add i64 %492, 1
  br label %491

499:                                              ; preds = %491
  br label %500

500:                                              ; preds = %499
  %501 = add i32 %487, 1
  br label %486, !llvm.loop !7

502:                                              ; preds = %486
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 3)
  %503 = and i64 %251, 2097151
  %504 = shl i64 %503, 4
  %505 = or i64 %504, 288230380446679040
  %506 = mul i64 %255, 2
  %507 = and i64 %506, 1099511627775
  %508 = or i64 %507, 140737488355328
  %509 = ptrtoint ptr addrspace(1) %0 to i64
  %510 = mul i64 %258, 2
  %511 = add i64 0, %510
  %512 = add i64 %509, %511
  %513 = inttoptr i64 %512 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), ptr addrspace(1) %513, i64 %505, i64 %508)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 3)
  %514 = add i64 %174, 64
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 6)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 3)
  br label %259

515:                                              ; preds = %521, %313
  %516 = phi i32 [ %522, %521 ], [ 0, %313 ]
  %517 = icmp sle i32 %516, 0
  br i1 %517, label %518, label %523

518:                                              ; preds = %515
  %519 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %520 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %520, ptr addrspace(6) inttoptr (i64 172544 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %519)
  br label %521

521:                                              ; preds = %518
  %522 = add i32 %516, 1
  br label %515, !llvm.loop !8

523:                                              ; preds = %515
  %524 = trunc i64 %316 to i32
  br label %525

525:                                              ; preds = %531, %523
  %526 = phi i32 [ %532, %531 ], [ 0, %523 ]
  %527 = icmp sle i32 %526, 0
  br i1 %527, label %528, label %533

528:                                              ; preds = %525
  %529 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %530 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %524, <256 x i1> %529, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %530, ptr addrspace(6) inttoptr (i64 172800 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %529)
  br label %531

531:                                              ; preds = %528
  %532 = add i32 %526, 1
  br label %525, !llvm.loop !9

533:                                              ; preds = %525
  br label %534

534:                                              ; preds = %540, %533
  %535 = phi i32 [ %541, %540 ], [ 0, %533 ]
  %536 = icmp sle i32 %535, 0
  br i1 %536, label %537, label %542

537:                                              ; preds = %534
  %538 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %539 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %539, ptr addrspace(6) inttoptr (i64 173056 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %538)
  br label %540

540:                                              ; preds = %537
  %541 = add i32 %535, 1
  br label %534, !llvm.loop !10

542:                                              ; preds = %534
  %543 = trunc i64 %123 to i32
  br label %544

544:                                              ; preds = %550, %542
  %545 = phi i32 [ %551, %550 ], [ 0, %542 ]
  %546 = icmp sle i32 %545, 0
  br i1 %546, label %547, label %552

547:                                              ; preds = %544
  %548 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %549 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %543, <256 x i1> %548, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %549, ptr addrspace(6) inttoptr (i64 173312 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %548)
  br label %550

550:                                              ; preds = %547
  %551 = add i32 %545, 1
  br label %544, !llvm.loop !11

552:                                              ; preds = %544
  %553 = and i64 %316, 2097151
  %554 = and i64 %123, 2097151
  %555 = shl i64 %553, 4
  %556 = shl i64 %554, 25
  %557 = or i64 %555, %556
  %558 = or i64 %557, 288230376151711744
  %559 = and i64 %322, 1099511627775
  %560 = or i64 %559, 70368744177664
  %561 = ptrtoint ptr addrspace(1) %11 to i64
  %562 = add i64 %324, 0
  %563 = add i64 %561, %562
  %564 = inttoptr i64 %563 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 163840 to ptr addrspace(6)), ptr addrspace(1) %564, i64 %558, i64 %560)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  br label %565

565:                                              ; preds = %590, %552
  %566 = phi i32 [ %591, %590 ], [ 0, %552 ]
  %567 = icmp sle i32 %566, 0
  br i1 %567, label %568, label %592

568:                                              ; preds = %565
  %569 = call i32 @llvm.smax.i32(i32 %524, i32 0)
  %570 = call i32 @llvm.smin.i32(i32 %569, i32 64)
  %571 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)
  %572 = mul i32 %570, 64
  br label %573

573:                                              ; preds = %576, %568
  %574 = phi i64 [ %588, %576 ], [ 0, %568 ]
  %575 = icmp slt i64 %574, 16
  br i1 %575, label %576, label %589

576:                                              ; preds = %573
  %577 = trunc i64 %574 to i32
  %578 = mul i32 %577, 256
  %579 = sub i32 %572, %578
  %580 = call i32 @llvm.smax.i32(i32 %579, i32 0)
  %581 = call i32 @llvm.smin.i32(i32 %580, i32 256)
  %582 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 %581)
  %583 = extractvalue { <256 x i1>, i32 } %582, 0
  %584 = extractvalue { <256 x i1>, i32 } %582, 1
  %585 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 163840 to ptr addrspace(6)), i32 %578, i32 0, i32 0)
  %586 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %571, i32 0)
  %587 = call <256 x i8> @llvm.hivm.vsel.v256i8(<256 x i8> %585, <256 x i8> %586, <256 x i1> %583)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %587, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %578, i32 0, i32 0, <256 x i1> %571)
  %588 = add i64 %574, 1
  br label %573

589:                                              ; preds = %573
  br label %590

590:                                              ; preds = %589
  %591 = add i32 %566, 1
  br label %565, !llvm.loop !12

592:                                              ; preds = %565
  br label %593

593:                                              ; preds = %641, %592
  %594 = phi i32 [ %642, %641 ], [ 0, %592 ]
  %595 = icmp sle i32 %594, 0
  br i1 %595, label %596, label %643

596:                                              ; preds = %593
  %597 = call i32 @llvm.smax.i32(i32 %543, i32 0)
  %598 = call i32 @llvm.smin.i32(i32 %597, i32 64)
  %599 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)
  %600 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 %598)
  %601 = extractvalue { <256 x i1>, i32 } %600, 0
  %602 = extractvalue { <256 x i1>, i32 } %600, 1
  %603 = add i32 %598, 64
  %604 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 %603)
  %605 = extractvalue { <256 x i1>, i32 } %604, 0
  %606 = extractvalue { <256 x i1>, i32 } %604, 1
  %607 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 64)
  %608 = extractvalue { <256 x i1>, i32 } %607, 0
  %609 = extractvalue { <256 x i1>, i32 } %607, 1
  %610 = call <256 x i1> @llvm.hivm.pxor.z(<256 x i1> %605, <256 x i1> %608, <256 x i1> %599)
  %611 = call <256 x i1> @llvm.hivm.por.z(<256 x i1> %601, <256 x i1> %610, <256 x i1> %599)
  %612 = add i32 %598, 128
  %613 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 %612)
  %614 = extractvalue { <256 x i1>, i32 } %613, 0
  %615 = extractvalue { <256 x i1>, i32 } %613, 1
  %616 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 128)
  %617 = extractvalue { <256 x i1>, i32 } %616, 0
  %618 = extractvalue { <256 x i1>, i32 } %616, 1
  %619 = call <256 x i1> @llvm.hivm.pxor.z(<256 x i1> %614, <256 x i1> %617, <256 x i1> %599)
  %620 = call <256 x i1> @llvm.hivm.por.z(<256 x i1> %611, <256 x i1> %619, <256 x i1> %599)
  %621 = add i32 %598, 192
  %622 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 %621)
  %623 = extractvalue { <256 x i1>, i32 } %622, 0
  %624 = extractvalue { <256 x i1>, i32 } %622, 1
  %625 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 192)
  %626 = extractvalue { <256 x i1>, i32 } %625, 0
  %627 = extractvalue { <256 x i1>, i32 } %625, 1
  %628 = call <256 x i1> @llvm.hivm.pxor.z(<256 x i1> %623, <256 x i1> %626, <256 x i1> %599)
  %629 = call <256 x i1> @llvm.hivm.por.z(<256 x i1> %620, <256 x i1> %628, <256 x i1> %599)
  br label %630

630:                                              ; preds = %633, %596
  %631 = phi i64 [ %639, %633 ], [ 0, %596 ]
  %632 = icmp slt i64 %631, 16
  br i1 %632, label %633, label %640

633:                                              ; preds = %630
  %634 = trunc i64 %631 to i32
  %635 = mul i32 %634, 256
  %636 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %635, i32 0, i32 0)
  %637 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %599, i32 0)
  %638 = call <256 x i8> @llvm.hivm.vsel.v256i8(<256 x i8> %636, <256 x i8> %637, <256 x i1> %629)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %638, ptr addrspace(6) inttoptr (i64 201216 to ptr addrspace(6)), i32 %635, i32 0, i32 0, <256 x i1> %599)
  %639 = add i64 %631, 1
  br label %630

640:                                              ; preds = %630
  br label %641

641:                                              ; preds = %640
  %642 = add i32 %594, 1
  br label %593, !llvm.loop !13

643:                                              ; preds = %593
  %644 = sub i64 %108, %176
  %645 = call i64 @llvm.smax.i64(i64 %644, i64 0)
  %646 = call i64 @llvm.smin.i64(i64 %645, i64 64)
  %647 = mul i64 %176, %106
  %648 = add i64 %176, 1
  %649 = mul i64 %648, %106
  %650 = sub i64 %649, %647
  %651 = sext i32 %85 to i64
  %652 = add i64 %647, %651
  %653 = add i64 %652, %107
  br label %654

654:                                              ; preds = %660, %643
  %655 = phi i32 [ %661, %660 ], [ 0, %643 ]
  %656 = icmp sle i32 %655, 0
  br i1 %656, label %657, label %662

657:                                              ; preds = %654
  %658 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %659 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %659, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %658)
  br label %660

660:                                              ; preds = %657
  %661 = add i32 %655, 1
  br label %654, !llvm.loop !14

662:                                              ; preds = %654
  %663 = trunc i64 %646 to i32
  br label %664

664:                                              ; preds = %670, %662
  %665 = phi i32 [ %671, %670 ], [ 0, %662 ]
  %666 = icmp sle i32 %665, 0
  br i1 %666, label %667, label %672

667:                                              ; preds = %664
  %668 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %669 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %663, <256 x i1> %668, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %669, ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %668)
  br label %670

670:                                              ; preds = %667
  %671 = add i32 %665, 1
  br label %664, !llvm.loop !15

672:                                              ; preds = %664
  %673 = and i64 %646, 2097151
  %674 = shl i64 %673, 4
  %675 = or i64 %674, 288230376285929472
  %676 = mul i64 %650, 4
  %677 = and i64 %676, 1099511627775
  %678 = or i64 %677, 4398046511104
  %679 = ptrtoint ptr addrspace(1) %7 to i64
  %680 = mul i64 %653, 4
  %681 = add i64 0, %680
  %682 = add i64 %679, %681
  %683 = inttoptr i64 %682 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) inttoptr (i64 167936 to ptr addrspace(6)), ptr addrspace(1) %683, i64 %675, i64 %678)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 2)
  br label %684

684:                                              ; preds = %699, %672
  %685 = phi i32 [ %700, %699 ], [ 0, %672 ]
  %686 = icmp sle i32 %685, 0
  br i1 %686, label %687, label %701

687:                                              ; preds = %684
  %688 = call i32 @llvm.smax.i32(i32 %663, i32 0)
  %689 = call i32 @llvm.smin.i32(i32 %688, i32 64)
  %690 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %691 = call i32 @llvm.smax.i32(i32 %689, i32 0)
  %692 = call i32 @llvm.smin.i32(i32 %691, i32 64)
  %693 = call { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32 %692)
  %694 = extractvalue { <256 x i1>, i32 } %693, 0
  %695 = extractvalue { <256 x i1>, i32 } %693, 1
  %696 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 167936 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %697 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %690, i32 0)
  %698 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %696, <64 x float> %697, <256 x i1> %694)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %698, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %690)
  br label %699

699:                                              ; preds = %687
  %700 = add i32 %685, 1
  br label %684, !llvm.loop !16

701:                                              ; preds = %684
  br label %702

702:                                              ; preds = %718, %701
  %703 = phi i32 [ %719, %718 ], [ 0, %701 ]
  %704 = icmp sle i32 %703, 0
  br i1 %704, label %705, label %720

705:                                              ; preds = %702
  %706 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %707

707:                                              ; preds = %710, %705
  %708 = phi i64 [ %716, %710 ], [ 0, %705 ]
  %709 = icmp slt i64 %708, 64
  br i1 %709, label %710, label %717

710:                                              ; preds = %707
  %711 = mul i64 %708, 64
  %712 = trunc i64 %711 to i32
  %713 = mul i32 %712, 4
  %714 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 16384 to ptr addrspace(6)), i32 %713, i32 0, i32 0)
  %715 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %714, float %104, <256 x i1> %706)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %715, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %713, i32 2, i32 0, <256 x i1> %706)
  %716 = add i64 %708, 1
  br label %707

717:                                              ; preds = %707
  br label %718

718:                                              ; preds = %717
  %719 = add i32 %703, 1
  br label %702, !llvm.loop !17

720:                                              ; preds = %702
  br label %721

721:                                              ; preds = %728, %720
  %722 = phi i32 [ %729, %728 ], [ 0, %720 ]
  %723 = icmp sle i32 %722, 0
  br i1 %723, label %724, label %730

724:                                              ; preds = %721
  %725 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %726 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %727 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %726, float 0x3FF7154760000000, <256 x i1> %725)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %727, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %725)
  br label %728

728:                                              ; preds = %724
  %729 = add i32 %722, 1
  br label %721, !llvm.loop !18

730:                                              ; preds = %721
  br label %731

731:                                              ; preds = %751, %730
  %732 = phi i32 [ %752, %751 ], [ 0, %730 ]
  %733 = icmp sle i32 %732, 0
  br i1 %733, label %734, label %753

734:                                              ; preds = %731
  %735 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %736

736:                                              ; preds = %739, %734
  %737 = phi i64 [ %749, %739 ], [ 0, %734 ]
  %738 = icmp slt i64 %737, 64
  br i1 %738, label %739, label %750

739:                                              ; preds = %736
  %740 = trunc i64 %737 to i32
  %741 = mul i32 %740, 64
  %742 = mul i32 %740, 256
  %743 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %742, i32 0, i32 0)
  %744 = udiv i32 %741, 64
  %745 = urem i32 %744, 64
  %746 = mul i32 %745, 4
  %747 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %746, i32 3, i32 0)
  %748 = call <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float> %743, <64 x float> %747, <256 x i1> %735)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %748, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %742, i32 2, i32 0, <256 x i1> %735)
  %749 = add i64 %737, 1
  br label %736

750:                                              ; preds = %736
  br label %751

751:                                              ; preds = %750
  %752 = add i32 %732, 1
  br label %731, !llvm.loop !19

753:                                              ; preds = %731
  br label %754

754:                                              ; preds = %775, %753
  %755 = phi i32 [ %776, %775 ], [ 0, %753 ]
  %756 = icmp sle i32 %755, 0
  br i1 %756, label %757, label %777

757:                                              ; preds = %754
  %758 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %759

759:                                              ; preds = %762, %757
  %760 = phi i64 [ %773, %762 ], [ 0, %757 ]
  %761 = icmp slt i64 %760, 64
  br i1 %761, label %762, label %774

762:                                              ; preds = %759
  %763 = trunc i64 %760 to i32
  %764 = udiv i32 %763, 64
  %765 = urem i32 %763, 64
  %766 = mul i32 %765, 64
  %767 = mul i32 %764, 4096
  %768 = add i32 %767, %766
  %769 = mul i32 %768, 4
  %770 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %769, i32 0, i32 0)
  %771 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %770, float 0x3FE62E4300000000, <256 x i1> %758)
  %772 = call <64 x float> @llvm.hivm.vexp.x.v64f32(<64 x float> %771, <256 x i1> %758)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %772, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %769, i32 2, i32 0, <256 x i1> %758)
  %773 = add i64 %760, 1
  br label %759

774:                                              ; preds = %759
  br label %775

775:                                              ; preds = %774
  %776 = add i32 %755, 1
  br label %754, !llvm.loop !20

777:                                              ; preds = %754
  br label %778

778:                                              ; preds = %792, %777
  %779 = phi i32 [ %793, %792 ], [ 0, %777 ]
  %780 = icmp sle i32 %779, 0
  br i1 %780, label %781, label %794

781:                                              ; preds = %778
  %782 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)
  br label %783

783:                                              ; preds = %786, %781
  %784 = phi i64 [ %790, %786 ], [ 0, %781 ]
  %785 = icmp slt i64 %784, 16
  br i1 %785, label %786, label %791

786:                                              ; preds = %783
  %787 = mul i64 %784, 256
  %788 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %782, i32 0)
  %789 = trunc i64 %787 to i32
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %788, ptr addrspace(6) inttoptr (i64 205312 to ptr addrspace(6)), i32 %789, i32 0, i32 0, <256 x i1> %782)
  %790 = add i64 %784, 1
  br label %783

791:                                              ; preds = %783
  br label %792

792:                                              ; preds = %791
  %793 = add i32 %779, 1
  br label %778, !llvm.loop !21

794:                                              ; preds = %778
  br label %795

795:                                              ; preds = %852, %794
  %796 = phi i32 [ %853, %852 ], [ 0, %794 ]
  %797 = icmp sle i32 %796, 0
  br i1 %797, label %798, label %854

798:                                              ; preds = %795
  %799 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %800

800:                                              ; preds = %803, %798
  %801 = phi i64 [ %850, %803 ], [ 0, %798 ]
  %802 = icmp slt i64 %801, 16
  br i1 %802, label %803, label %851

803:                                              ; preds = %800
  %804 = trunc i64 %801 to i32
  %805 = mul i32 %804, 256
  %806 = mul i32 %804, 1024
  %807 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)
  %808 = call <256 x i8> @llvm.hivm.vbr.v256s8(i8 0)
  %809 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 201216 to ptr addrspace(6)), i32 %805, i32 13, i32 0)
  %810 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %809, <256 x i8> %808)
  %811 = extractvalue { <256 x i8>, <256 x i8> } %810, 0
  %812 = extractvalue { <256 x i8>, <256 x i8> } %810, 1
  %813 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %811, <256 x i1> %807, i32 0)
  %814 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %812, <256 x i1> %807, i32 0)
  %815 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 205312 to ptr addrspace(6)), i32 %805, i32 13, i32 0)
  %816 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %815, <256 x i8> %808)
  %817 = extractvalue { <256 x i8>, <256 x i8> } %816, 0
  %818 = extractvalue { <256 x i8>, <256 x i8> } %816, 1
  %819 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %817, <256 x i1> %807, i32 0)
  %820 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %818, <256 x i1> %807, i32 0)
  %821 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %813, <64 x i32> %819, <256 x i1> %799)
  %822 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %814, <64 x i32> %820, <256 x i1> %799)
  %823 = add i32 %805, 128
  %824 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 201216 to ptr addrspace(6)), i32 %823, i32 13, i32 0)
  %825 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %824, <256 x i8> %808)
  %826 = extractvalue { <256 x i8>, <256 x i8> } %825, 0
  %827 = extractvalue { <256 x i8>, <256 x i8> } %825, 1
  %828 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %826, <256 x i1> %807, i32 0)
  %829 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %827, <256 x i1> %807, i32 0)
  %830 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 205312 to ptr addrspace(6)), i32 %823, i32 13, i32 0)
  %831 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %830, <256 x i8> %808)
  %832 = extractvalue { <256 x i8>, <256 x i8> } %831, 0
  %833 = extractvalue { <256 x i8>, <256 x i8> } %831, 1
  %834 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %832, <256 x i1> %807, i32 0)
  %835 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %833, <256 x i1> %807, i32 0)
  %836 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %828, <64 x i32> %834, <256 x i1> %799)
  %837 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %829, <64 x i32> %835, <256 x i1> %799)
  %838 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %806, i32 0, i32 0)
  %839 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %799, i32 0)
  %840 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %838, <64 x float> %839, <256 x i1> %821)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %840, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %806, i32 2, i32 0, <256 x i1> %799)
  %841 = add i32 %806, 256
  %842 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %841, i32 0, i32 0)
  %843 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %842, <64 x float> %839, <256 x i1> %822)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %843, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %841, i32 2, i32 0, <256 x i1> %799)
  %844 = add i32 %806, 512
  %845 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %844, i32 0, i32 0)
  %846 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %845, <64 x float> %839, <256 x i1> %836)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %846, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %844, i32 2, i32 0, <256 x i1> %799)
  %847 = add i32 %806, 768
  %848 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %847, i32 0, i32 0)
  %849 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %848, <64 x float> %839, <256 x i1> %837)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %849, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %847, i32 2, i32 0, <256 x i1> %799)
  %850 = add i64 %801, 1
  br label %800

851:                                              ; preds = %800
  br label %852

852:                                              ; preds = %851
  %853 = add i32 %796, 1
  br label %795, !llvm.loop !22

854:                                              ; preds = %795
  br label %855

855:                                              ; preds = %876, %854
  %856 = phi i32 [ %877, %876 ], [ 0, %854 ]
  %857 = icmp sle i32 %856, 0
  br i1 %857, label %858, label %878

858:                                              ; preds = %855
  %859 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %860

860:                                              ; preds = %863, %858
  %861 = phi i64 [ %874, %863 ], [ 0, %858 ]
  %862 = icmp slt i64 %861, 64
  br i1 %862, label %863, label %875

863:                                              ; preds = %860
  %864 = trunc i64 %861 to i32
  %865 = udiv i32 %864, 64
  %866 = urem i32 %864, 64
  %867 = mul i32 %866, 64
  %868 = mul i32 %865, 4096
  %869 = add i32 %868, %867
  %870 = mul i32 %869, 4
  %871 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %870, i32 0, i32 0)
  %872 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %871, <256 x i1> %859, i32 0, i32 0, i32 0)
  %873 = mul i32 %869, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %872, ptr addrspace(6) inttoptr (i64 131072 to ptr addrspace(6)), i32 %873, i32 7, i32 0, <256 x i1> %859)
  %874 = add i64 %861, 1
  br label %860

875:                                              ; preds = %860
  br label %876

876:                                              ; preds = %875
  %877 = add i32 %856, 1
  br label %855, !llvm.loop !23

878:                                              ; preds = %855
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 6)
  %879 = sub i64 %108, %177
  %880 = call i64 @llvm.smax.i64(i64 %879, i64 0)
  %881 = call i64 @llvm.smin.i64(i64 %880, i64 64)
  %882 = mul i64 %177, %106
  %883 = add i64 %177, 1
  %884 = mul i64 %883, %106
  %885 = sub i64 %884, %882
  %886 = add i64 %882, %651
  %887 = add i64 %886, %107
  br label %888

888:                                              ; preds = %894, %878
  %889 = phi i32 [ %895, %894 ], [ 0, %878 ]
  %890 = icmp sle i32 %889, 0
  br i1 %890, label %891, label %896

891:                                              ; preds = %888
  %892 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %893 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %893, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %892)
  br label %894

894:                                              ; preds = %891
  %895 = add i32 %889, 1
  br label %888, !llvm.loop !24

896:                                              ; preds = %888
  %897 = trunc i64 %881 to i32
  br label %898

898:                                              ; preds = %904, %896
  %899 = phi i32 [ %905, %904 ], [ 0, %896 ]
  %900 = icmp sle i32 %899, 0
  br i1 %900, label %901, label %906

901:                                              ; preds = %898
  %902 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %903 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %897, <256 x i1> %902, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %903, ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %902)
  br label %904

904:                                              ; preds = %901
  %905 = add i32 %899, 1
  br label %898, !llvm.loop !25

906:                                              ; preds = %898
  %907 = and i64 %881, 2097151
  %908 = shl i64 %907, 4
  %909 = or i64 %908, 288230376285929472
  %910 = mul i64 %885, 4
  %911 = and i64 %910, 1099511627775
  %912 = or i64 %911, 4398046511104
  %913 = ptrtoint ptr addrspace(1) %8 to i64
  %914 = mul i64 %887, 4
  %915 = add i64 0, %914
  %916 = add i64 %913, %915
  %917 = inttoptr i64 %916 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) inttoptr (i64 168192 to ptr addrspace(6)), ptr addrspace(1) %917, i64 %909, i64 %912)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 1)
  br label %918

918:                                              ; preds = %933, %906
  %919 = phi i32 [ %934, %933 ], [ 0, %906 ]
  %920 = icmp sle i32 %919, 0
  br i1 %920, label %921, label %935

921:                                              ; preds = %918
  %922 = call i32 @llvm.smax.i32(i32 %897, i32 0)
  %923 = call i32 @llvm.smin.i32(i32 %922, i32 64)
  %924 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %925 = call i32 @llvm.smax.i32(i32 %923, i32 0)
  %926 = call i32 @llvm.smin.i32(i32 %925, i32 64)
  %927 = call { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32 %926)
  %928 = extractvalue { <256 x i1>, i32 } %927, 0
  %929 = extractvalue { <256 x i1>, i32 } %927, 1
  %930 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168192 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %931 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %924, i32 0)
  %932 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %930, <64 x float> %931, <256 x i1> %928)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %932, ptr addrspace(6) inttoptr (i64 213504 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %924)
  br label %933

933:                                              ; preds = %921
  %934 = add i32 %919, 1
  br label %918, !llvm.loop !26

935:                                              ; preds = %918
  br label %936

936:                                              ; preds = %956, %935
  %937 = phi i32 [ %957, %956 ], [ 0, %935 ]
  %938 = icmp sle i32 %937, 0
  br i1 %938, label %939, label %958

939:                                              ; preds = %936
  %940 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %941

941:                                              ; preds = %944, %939
  %942 = phi i64 [ %954, %944 ], [ 0, %939 ]
  %943 = icmp slt i64 %942, 64
  br i1 %943, label %944, label %955

944:                                              ; preds = %941
  %945 = trunc i64 %942 to i32
  %946 = mul i32 %945, 64
  %947 = mul i32 %945, 256
  %948 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) null, i32 %947, i32 0, i32 0)
  %949 = udiv i32 %946, 64
  %950 = urem i32 %949, 64
  %951 = mul i32 %950, 4
  %952 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 213504 to ptr addrspace(6)), i32 %951, i32 3, i32 0)
  %953 = call <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float> %948, <64 x float> %952, <256 x i1> %940)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %953, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %947, i32 2, i32 0, <256 x i1> %940)
  %954 = add i64 %942, 1
  br label %941

955:                                              ; preds = %941
  br label %956

956:                                              ; preds = %955
  %957 = add i32 %937, 1
  br label %936, !llvm.loop !27

958:                                              ; preds = %936
  br label %959

959:                                              ; preds = %976, %958
  %960 = phi i32 [ %977, %976 ], [ 0, %958 ]
  %961 = icmp sle i32 %960, 0
  br i1 %961, label %962, label %978

962:                                              ; preds = %959
  %963 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %964

964:                                              ; preds = %967, %962
  %965 = phi i64 [ %974, %967 ], [ 0, %962 ]
  %966 = icmp slt i64 %965, 64
  br i1 %966, label %967, label %975

967:                                              ; preds = %964
  %968 = mul i64 %965, 64
  %969 = trunc i64 %968 to i32
  %970 = mul i32 %969, 4
  %971 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %970, i32 0, i32 0)
  %972 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %970, i32 0, i32 0)
  %973 = call <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float> %971, <64 x float> %972, <256 x i1> %963)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %973, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %970, i32 2, i32 0, <256 x i1> %963)
  %974 = add i64 %965, 1
  br label %964

975:                                              ; preds = %964
  br label %976

976:                                              ; preds = %975
  %977 = add i32 %960, 1
  br label %959, !llvm.loop !28

978:                                              ; preds = %959
  br label %979

979:                                              ; preds = %1036, %978
  %980 = phi i32 [ %1037, %1036 ], [ 0, %978 ]
  %981 = icmp sle i32 %980, 0
  br i1 %981, label %982, label %1038

982:                                              ; preds = %979
  %983 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %984

984:                                              ; preds = %987, %982
  %985 = phi i64 [ %1034, %987 ], [ 0, %982 ]
  %986 = icmp slt i64 %985, 16
  br i1 %986, label %987, label %1035

987:                                              ; preds = %984
  %988 = trunc i64 %985 to i32
  %989 = mul i32 %988, 256
  %990 = mul i32 %988, 1024
  %991 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)
  %992 = call <256 x i8> @llvm.hivm.vbr.v256s8(i8 0)
  %993 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 201216 to ptr addrspace(6)), i32 %989, i32 13, i32 0)
  %994 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %993, <256 x i8> %992)
  %995 = extractvalue { <256 x i8>, <256 x i8> } %994, 0
  %996 = extractvalue { <256 x i8>, <256 x i8> } %994, 1
  %997 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %995, <256 x i1> %991, i32 0)
  %998 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %996, <256 x i1> %991, i32 0)
  %999 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 205312 to ptr addrspace(6)), i32 %989, i32 13, i32 0)
  %1000 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %999, <256 x i8> %992)
  %1001 = extractvalue { <256 x i8>, <256 x i8> } %1000, 0
  %1002 = extractvalue { <256 x i8>, <256 x i8> } %1000, 1
  %1003 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %1001, <256 x i1> %991, i32 0)
  %1004 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %1002, <256 x i1> %991, i32 0)
  %1005 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %997, <64 x i32> %1003, <256 x i1> %983)
  %1006 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %998, <64 x i32> %1004, <256 x i1> %983)
  %1007 = add i32 %989, 128
  %1008 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 201216 to ptr addrspace(6)), i32 %1007, i32 13, i32 0)
  %1009 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %1008, <256 x i8> %992)
  %1010 = extractvalue { <256 x i8>, <256 x i8> } %1009, 0
  %1011 = extractvalue { <256 x i8>, <256 x i8> } %1009, 1
  %1012 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %1010, <256 x i1> %991, i32 0)
  %1013 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %1011, <256 x i1> %991, i32 0)
  %1014 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 205312 to ptr addrspace(6)), i32 %1007, i32 13, i32 0)
  %1015 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %1014, <256 x i8> %992)
  %1016 = extractvalue { <256 x i8>, <256 x i8> } %1015, 0
  %1017 = extractvalue { <256 x i8>, <256 x i8> } %1015, 1
  %1018 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %1016, <256 x i1> %991, i32 0)
  %1019 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %1017, <256 x i1> %991, i32 0)
  %1020 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %1012, <64 x i32> %1018, <256 x i1> %983)
  %1021 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %1013, <64 x i32> %1019, <256 x i1> %983)
  %1022 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %990, i32 0, i32 0)
  %1023 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %983, i32 0)
  %1024 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %1022, <64 x float> %1023, <256 x i1> %1005)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1024, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %990, i32 2, i32 0, <256 x i1> %983)
  %1025 = add i32 %990, 256
  %1026 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1025, i32 0, i32 0)
  %1027 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %1026, <64 x float> %1023, <256 x i1> %1006)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1027, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %1025, i32 2, i32 0, <256 x i1> %983)
  %1028 = add i32 %990, 512
  %1029 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1028, i32 0, i32 0)
  %1030 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %1029, <64 x float> %1023, <256 x i1> %1020)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1030, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %1028, i32 2, i32 0, <256 x i1> %983)
  %1031 = add i32 %990, 768
  %1032 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1031, i32 0, i32 0)
  %1033 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %1032, <64 x float> %1023, <256 x i1> %1021)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1033, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %1031, i32 2, i32 0, <256 x i1> %983)
  %1034 = add i64 %985, 1
  br label %984

1035:                                             ; preds = %984
  br label %1036

1036:                                             ; preds = %1035
  %1037 = add i32 %980, 1
  br label %979, !llvm.loop !29

1038:                                             ; preds = %979
  br label %1039

1039:                                             ; preds = %1060, %1038
  %1040 = phi i32 [ %1061, %1060 ], [ 0, %1038 ]
  %1041 = icmp sle i32 %1040, 0
  br i1 %1041, label %1042, label %1062

1042:                                             ; preds = %1039
  %1043 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1044

1044:                                             ; preds = %1047, %1042
  %1045 = phi i64 [ %1058, %1047 ], [ 0, %1042 ]
  %1046 = icmp slt i64 %1045, 64
  br i1 %1046, label %1047, label %1059

1047:                                             ; preds = %1044
  %1048 = trunc i64 %1045 to i32
  %1049 = udiv i32 %1048, 64
  %1050 = urem i32 %1048, 64
  %1051 = mul i32 %1050, 64
  %1052 = mul i32 %1049, 4096
  %1053 = add i32 %1052, %1051
  %1054 = mul i32 %1053, 4
  %1055 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %1054, i32 0, i32 0)
  %1056 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %1055, <256 x i1> %1043, i32 0, i32 0, i32 0)
  %1057 = mul i32 %1053, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %1056, ptr addrspace(6) inttoptr (i64 139264 to ptr addrspace(6)), i32 %1057, i32 7, i32 0, <256 x i1> %1043)
  %1058 = add i64 %1045, 1
  br label %1044

1059:                                             ; preds = %1044
  br label %1060

1060:                                             ; preds = %1059
  %1061 = add i32 %1040, 1
  br label %1039, !llvm.loop !30

1062:                                             ; preds = %1039
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 5)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 7)
  %1063 = add i64 %176, 64
  %1064 = add i64 %177, 64
  %1065 = add i64 %178, 64
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 7)
  br label %325

1066:                                             ; preds = %1082, %389
  %1067 = phi i32 [ %1083, %1082 ], [ 0, %389 ]
  %1068 = icmp sle i32 %1067, 0
  br i1 %1068, label %1069, label %1084

1069:                                             ; preds = %1066
  %1070 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1071

1071:                                             ; preds = %1074, %1069
  %1072 = phi i64 [ %1080, %1074 ], [ 0, %1069 ]
  %1073 = icmp slt i64 %1072, 64
  br i1 %1073, label %1074, label %1081

1074:                                             ; preds = %1071
  %1075 = mul i64 %1072, 64
  %1076 = trunc i64 %1075 to i32
  %1077 = mul i32 %1076, 4
  %1078 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 32768 to ptr addrspace(6)), i32 %1077, i32 0, i32 0)
  %1079 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %1078, float %19, <256 x i1> %1070)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1079, ptr addrspace(6) inttoptr (i64 81920 to ptr addrspace(6)), i32 %1077, i32 2, i32 0, <256 x i1> %1070)
  %1080 = add i64 %1072, 1
  br label %1071

1081:                                             ; preds = %1071
  br label %1082

1082:                                             ; preds = %1081
  %1083 = add i32 %1067, 1
  br label %1066, !llvm.loop !31

1084:                                             ; preds = %1066
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 4)
  %1085 = sub i32 %103, %182
  %1086 = call i32 @llvm.smax.i32(i32 %1085, i32 0)
  %1087 = call i32 @llvm.smin.i32(i32 %1086, i32 64)
  %1088 = sext i32 %1087 to i64
  %1089 = sext i32 %161 to i64
  %1090 = call i64 @llvm.hivm.GET.CTRL()
  %1091 = call i64 @llvm.hivm.SBITSET1(i64 %1090, i64 6)
  %1092 = call i64 @llvm.hivm.SBITSET0(i64 %1091, i64 7)
  %1093 = call i64 @llvm.hivm.SBITSET0(i64 %1092, i64 8)
  call void @llvm.hivm.SET.CTRL(i64 %1093)
  %1094 = call i64 @llvm.hivm.GET.CTRL()
  %1095 = call i64 @llvm.hivm.SBITSET0(i64 %1094, i64 9)
  %1096 = call i64 @llvm.hivm.SBITSET0(i64 %1095, i64 10)
  call void @llvm.hivm.SET.CTRL(i64 %1096)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 4)
  %1097 = and i64 %1088, 2097151
  %1098 = shl i64 %1097, 4
  %1099 = or i64 %1098, 288230384741646336
  %1100 = mul i64 %1089, 4
  %1101 = and i64 %1100, 1099511627775
  %1102 = or i64 %1101, 281474976710656
  %1103 = ptrtoint ptr addrspace(1) %3 to i64
  %1104 = mul i64 %394, 4
  %1105 = add i64 0, %1104
  %1106 = add i64 %1103, %1105
  %1107 = inttoptr i64 %1106 to ptr addrspace(1)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %1107, ptr addrspace(6) inttoptr (i64 81920 to ptr addrspace(6)), i64 %1099, i64 %1102)
  %1108 = call i64 @llvm.hivm.GET.CTRL()
  %1109 = call i64 @llvm.hivm.SBITSET0(i64 %1108, i64 6)
  %1110 = call i64 @llvm.hivm.SBITSET0(i64 %1109, i64 7)
  %1111 = call i64 @llvm.hivm.SBITSET0(i64 %1110, i64 8)
  call void @llvm.hivm.SET.CTRL(i64 %1111)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 11)
  %1112 = load volatile i32, ptr addrspace(11) %33, align 4
  %1113 = sub i32 %1112, 1
  store volatile i32 %1113, ptr addrspace(11) %33, align 4
  %1114 = add i32 %182, 64
  br label %396

1115:                                             ; preds = %1131, %400
  %1116 = phi i32 [ %1132, %1131 ], [ 0, %400 ]
  %1117 = icmp sle i32 %1116, 0
  br i1 %1117, label %1118, label %1133

1118:                                             ; preds = %1115
  %1119 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1120

1120:                                             ; preds = %1123, %1118
  %1121 = phi i64 [ %1129, %1123 ], [ 0, %1118 ]
  %1122 = icmp slt i64 %1121, 64
  br i1 %1122, label %1123, label %1130

1123:                                             ; preds = %1120
  %1124 = mul i64 %1121, 64
  %1125 = trunc i64 %1124 to i32
  %1126 = mul i32 %1125, 4
  %1127 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 49152 to ptr addrspace(6)), i32 %1126, i32 0, i32 0)
  %1128 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %1127, float %19, <256 x i1> %1119)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1128, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1126, i32 2, i32 0, <256 x i1> %1119)
  %1129 = add i64 %1121, 1
  br label %1120

1130:                                             ; preds = %1120
  br label %1131

1131:                                             ; preds = %1130
  %1132 = add i32 %1116, 1
  br label %1115, !llvm.loop !32

1133:                                             ; preds = %1115
  br label %1134

1134:                                             ; preds = %1155, %1133
  %1135 = phi i32 [ %1156, %1155 ], [ 0, %1133 ]
  %1136 = icmp sle i32 %1135, 0
  br i1 %1136, label %1137, label %1157

1137:                                             ; preds = %1134
  %1138 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1139

1139:                                             ; preds = %1142, %1137
  %1140 = phi i64 [ %1153, %1142 ], [ 0, %1137 ]
  %1141 = icmp slt i64 %1140, 64
  br i1 %1141, label %1142, label %1154

1142:                                             ; preds = %1139
  %1143 = trunc i64 %1140 to i32
  %1144 = udiv i32 %1143, 64
  %1145 = urem i32 %1143, 64
  %1146 = mul i32 %1145, 64
  %1147 = mul i32 %1144, 4096
  %1148 = add i32 %1147, %1146
  %1149 = mul i32 %1148, 4
  %1150 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1149, i32 0, i32 0)
  %1151 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %1150, <256 x i1> %1138, i32 0, i32 0, i32 0)
  %1152 = mul i32 %1148, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %1151, ptr addrspace(6) inttoptr (i64 147456 to ptr addrspace(6)), i32 %1152, i32 7, i32 0, <256 x i1> %1138)
  %1153 = add i64 %1140, 1
  br label %1139

1154:                                             ; preds = %1139
  br label %1155

1155:                                             ; preds = %1154
  %1156 = add i32 %1135, 1
  br label %1134, !llvm.loop !33

1157:                                             ; preds = %1134
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 2)
  %1158 = mul i64 %110, %162
  %1159 = mul i64 %125, %162
  %1160 = sub i64 %1159, %1158
  %1161 = sext i32 %160 to i64
  %1162 = add i64 %1158, %1161
  %1163 = add i64 %1162, %402
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 2)
  %1164 = mul i64 %1160, 2
  %1165 = and i64 %1164, 1099511627775
  %1166 = or i64 %1165, 140737488355328
  %1167 = ptrtoint ptr addrspace(1) %4 to i64
  %1168 = mul i64 %1163, 2
  %1169 = add i64 0, %1168
  %1170 = add i64 %1167, %1169
  %1171 = inttoptr i64 %1170 to ptr addrspace(1)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %1171, ptr addrspace(6) inttoptr (i64 147456 to ptr addrspace(6)), i64 %426, i64 %1166)
  br label %1172

1172:                                             ; preds = %1193, %1157
  %1173 = phi i32 [ %1194, %1193 ], [ 0, %1157 ]
  %1174 = icmp sle i32 %1173, 0
  br i1 %1174, label %1175, label %1195

1175:                                             ; preds = %1172
  %1176 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1177

1177:                                             ; preds = %1180, %1175
  %1178 = phi i64 [ %1191, %1180 ], [ 0, %1175 ]
  %1179 = icmp slt i64 %1178, 64
  br i1 %1179, label %1180, label %1192

1180:                                             ; preds = %1177
  %1181 = trunc i64 %1178 to i32
  %1182 = udiv i32 %1181, 64
  %1183 = urem i32 %1181, 64
  %1184 = mul i32 %1183, 64
  %1185 = mul i32 %1182, 4096
  %1186 = add i32 %1185, %1184
  %1187 = mul i32 %1186, 4
  %1188 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 65536 to ptr addrspace(6)), i32 %1187, i32 0, i32 0)
  %1189 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %1188, <256 x i1> %1176, i32 0, i32 0, i32 0)
  %1190 = mul i32 %1186, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %1189, ptr addrspace(6) inttoptr (i64 155648 to ptr addrspace(6)), i32 %1190, i32 7, i32 0, <256 x i1> %1176)
  %1191 = add i64 %1178, 1
  br label %1177

1192:                                             ; preds = %1177
  br label %1193

1193:                                             ; preds = %1192
  %1194 = add i32 %1173, 1
  br label %1172, !llvm.loop !34

1195:                                             ; preds = %1172
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 1)
  %1196 = ptrtoint ptr addrspace(1) %5 to i64
  %1197 = mul i64 %1163, 2
  %1198 = add i64 0, %1197
  %1199 = add i64 %1196, %1198
  %1200 = inttoptr i64 %1199 to ptr addrspace(1)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %1200, ptr addrspace(6) inttoptr (i64 155648 to ptr addrspace(6)), i64 %426, i64 %1166)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 12)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 13)
  br label %403
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
declare <64 x float> @llvm.hivm.vdups.z.v64f32(float, <256 x i1>, i32)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vsel.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)

; Unknown intrinsic
declare { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vdups.z.v64i32(i32, <256 x i1>, i32)

; Unknown intrinsic
declare void @llvm.hivm.vstsx1.v64s32(<64 x i32>, ptr addrspace(6), i32, i32, i32, <256 x i1>)

; Unknown intrinsic
declare <64 x i32> @llvm.hivm.vci.v64i32(i32, i32)

; Unknown intrinsic
declare <256 x i8> @llvm.hivm.vdups.z.v256i8(i8, <256 x i1>, i32)

; Unknown intrinsic
declare void @llvm.hivm.vstsx1.v256s8(<256 x i8>, ptr addrspace(6), i32, i32, i32, <256 x i1>)

; Unknown intrinsic
declare <64 x float> @llvm.hivm.vexp.x.v64f32(<64 x float>, <256 x i1>)

; Unknown intrinsic
declare { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.pxor.z(<256 x i1>, <256 x i1>, <256 x i1>)

; Unknown intrinsic
declare <256 x i1> @llvm.hivm.por.z(<256 x i1>, <256 x i1>, <256 x i1>)

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