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

131:                                              ; preds = %134, %424
  %132 = phi i64 [ 0, %424 ], [ %143, %134 ]
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
  br label %436

145:                                              ; preds = %148, %453
  %146 = phi i64 [ 0, %453 ], [ %157, %148 ]
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
  br label %459

203:                                              ; preds = %206, %476
  %204 = phi i64 [ 0, %476 ], [ %215, %206 ]
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
  %238 = phi i64 [ %175, %236 ], [ %488, %230 ]
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
  br label %489

259:                                              ; preds = %262, %506
  %260 = phi i64 [ 0, %506 ], [ %271, %262 ]
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
  %294 = phi i64 [ %174, %292 ], [ %518, %286 ]
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
  br label %519

325:                                              ; preds = %328, %1099
  %326 = phi i64 [ 0, %1099 ], [ %337, %328 ]
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
  %380 = phi i64 [ %176, %378 ], [ %1100, %366 ]
  %381 = phi i64 [ %177, %378 ], [ %1101, %366 ]
  %382 = phi i64 [ %178, %378 ], [ %1102, %366 ]
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
  br label %1103

395:                                              ; preds = %384
  br label %396

396:                                              ; preds = %1121, %395
  %397 = phi i32 [ %1151, %1121 ], [ %182, %395 ]
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
  br label %1152

403:                                              ; preds = %1232, %66
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

407:                                              ; preds = %422, %88
  %408 = phi i32 [ %423, %422 ], [ 0, %88 ]
  %409 = icmp sle i32 %408, 0
  br i1 %409, label %410, label %424

410:                                              ; preds = %407
  %411 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %412

412:                                              ; preds = %415, %410
  %413 = phi i64 [ %420, %415 ], [ 0, %410 ]
  %414 = icmp slt i64 %413, 32
  br i1 %414, label %415, label %421

415:                                              ; preds = %412
  %416 = mul i64 %413, 128
  %417 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %411, i32 0)
  %418 = trunc i64 %416 to i32
  %419 = mul i32 %418, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %417, ptr addrspace(6) inttoptr (i64 98304 to ptr addrspace(6)), i32 %419, i32 1, i32 0, <256 x i1> %411)
  %420 = add i64 %413, 1
  br label %412

421:                                              ; preds = %412
  br label %422

422:                                              ; preds = %421
  %423 = add i32 %408, 1
  br label %407, !llvm.loop !3

424:                                              ; preds = %407
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  %425 = and i64 %123, 2097151
  %426 = shl i64 %425, 4
  %427 = or i64 %426, 288230380446679040
  %428 = mul i64 %127, 2
  %429 = and i64 %428, 1099511627775
  %430 = or i64 %429, 140737488355328
  %431 = ptrtoint ptr addrspace(1) %1 to i64
  %432 = mul i64 %130, 2
  %433 = add i64 0, %432
  %434 = add i64 %431, %433
  %435 = inttoptr i64 %434 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 98304 to ptr addrspace(6)), ptr addrspace(1) %435, i64 %427, i64 %430)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 0)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 0)
  br label %131

436:                                              ; preds = %451, %144
  %437 = phi i32 [ %452, %451 ], [ 0, %144 ]
  %438 = icmp sle i32 %437, 0
  br i1 %438, label %439, label %453

439:                                              ; preds = %436
  %440 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %441

441:                                              ; preds = %444, %439
  %442 = phi i64 [ %449, %444 ], [ 0, %439 ]
  %443 = icmp slt i64 %442, 32
  br i1 %443, label %444, label %450

444:                                              ; preds = %441
  %445 = mul i64 %442, 128
  %446 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %440, i32 0)
  %447 = trunc i64 %445 to i32
  %448 = mul i32 %447, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %446, ptr addrspace(6) inttoptr (i64 106496 to ptr addrspace(6)), i32 %448, i32 1, i32 0, <256 x i1> %440)
  %449 = add i64 %442, 1
  br label %441

450:                                              ; preds = %441
  br label %451

451:                                              ; preds = %450
  %452 = add i32 %437, 1
  br label %436, !llvm.loop !5

453:                                              ; preds = %436
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 0)
  %454 = ptrtoint ptr addrspace(1) %2 to i64
  %455 = mul i64 %130, 2
  %456 = add i64 0, %455
  %457 = add i64 %454, %456
  %458 = inttoptr i64 %457 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 106496 to ptr addrspace(6)), ptr addrspace(1) %458, i64 %427, i64 %430)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 1)
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 7)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 1)
  br label %145

459:                                              ; preds = %474, %192
  %460 = phi i32 [ %475, %474 ], [ 0, %192 ]
  %461 = icmp sle i32 %460, 0
  br i1 %461, label %462, label %476

462:                                              ; preds = %459
  %463 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %464

464:                                              ; preds = %467, %462
  %465 = phi i64 [ %472, %467 ], [ 0, %462 ]
  %466 = icmp slt i64 %465, 32
  br i1 %466, label %467, label %473

467:                                              ; preds = %464
  %468 = mul i64 %465, 128
  %469 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %463, i32 0)
  %470 = trunc i64 %468 to i32
  %471 = mul i32 %470, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %469, ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), i32 %471, i32 1, i32 0, <256 x i1> %463)
  %472 = add i64 %465, 1
  br label %464

473:                                              ; preds = %464
  br label %474

474:                                              ; preds = %473
  %475 = add i32 %460, 1
  br label %459, !llvm.loop !6

476:                                              ; preds = %459
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 3)
  %477 = and i64 %195, 2097151
  %478 = shl i64 %477, 4
  %479 = or i64 %478, 288230380446679040
  %480 = mul i64 %199, 2
  %481 = and i64 %480, 1099511627775
  %482 = or i64 %481, 140737488355328
  %483 = ptrtoint ptr addrspace(1) %6 to i64
  %484 = mul i64 %202, 2
  %485 = add i64 0, %484
  %486 = add i64 %483, %485
  %487 = inttoptr i64 %486 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 114688 to ptr addrspace(6)), ptr addrspace(1) %487, i64 %479, i64 %482)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 4)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 5)
  %488 = add i64 %175, 64
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 0)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 5)
  br label %203

489:                                              ; preds = %504, %248
  %490 = phi i32 [ %505, %504 ], [ 0, %248 ]
  %491 = icmp sle i32 %490, 0
  br i1 %491, label %492, label %506

492:                                              ; preds = %489
  %493 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  br label %494

494:                                              ; preds = %497, %492
  %495 = phi i64 [ %502, %497 ], [ 0, %492 ]
  %496 = icmp slt i64 %495, 32
  br i1 %496, label %497, label %503

497:                                              ; preds = %494
  %498 = mul i64 %495, 128
  %499 = call <128 x bfloat> @llvm.hivm.vdups.z.v128bf16(bfloat 0xR0000, <256 x i1> %493, i32 0)
  %500 = trunc i64 %498 to i32
  %501 = mul i32 %500, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %499, ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), i32 %501, i32 1, i32 0, <256 x i1> %493)
  %502 = add i64 %495, 1
  br label %494

503:                                              ; preds = %494
  br label %504

504:                                              ; preds = %503
  %505 = add i32 %490, 1
  br label %489, !llvm.loop !7

506:                                              ; preds = %489
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 4, i64 3)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 4, i64 3)
  %507 = and i64 %251, 2097151
  %508 = shl i64 %507, 4
  %509 = or i64 %508, 288230380446679040
  %510 = mul i64 %255, 2
  %511 = and i64 %510, 1099511627775
  %512 = or i64 %511, 140737488355328
  %513 = ptrtoint ptr addrspace(1) %0 to i64
  %514 = mul i64 %258, 2
  %515 = add i64 0, %514
  %516 = add i64 %513, %515
  %517 = inttoptr i64 %516 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 122880 to ptr addrspace(6)), ptr addrspace(1) %517, i64 %509, i64 %512)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 2)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 5, i64 3)
  %518 = add i64 %174, 64
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 6)
  call void @llvm.hivm.BARRIER(i64 6)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 5, i64 3)
  br label %259

519:                                              ; preds = %525, %313
  %520 = phi i32 [ %526, %525 ], [ 0, %313 ]
  %521 = icmp sle i32 %520, 0
  br i1 %521, label %522, label %527

522:                                              ; preds = %519
  %523 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %524 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %524, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %523)
  br label %525

525:                                              ; preds = %522
  %526 = add i32 %520, 1
  br label %519, !llvm.loop !8

527:                                              ; preds = %519
  %528 = trunc i64 %316 to i32
  br label %529

529:                                              ; preds = %535, %527
  %530 = phi i32 [ %536, %535 ], [ 0, %527 ]
  %531 = icmp sle i32 %530, 0
  br i1 %531, label %532, label %537

532:                                              ; preds = %529
  %533 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %534 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %528, <256 x i1> %533, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %534, ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %533)
  br label %535

535:                                              ; preds = %532
  %536 = add i32 %530, 1
  br label %529, !llvm.loop !9

537:                                              ; preds = %529
  br label %538

538:                                              ; preds = %554, %537
  %539 = phi i32 [ %555, %554 ], [ 0, %537 ]
  %540 = icmp sle i32 %539, 0
  br i1 %540, label %541, label %556

541:                                              ; preds = %538
  %542 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %543 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %542, i32 0)
  %544 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 1, <256 x i1> %542, i32 0)
  %545 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 64)
  %546 = extractvalue { <256 x i1>, i32 } %545, 0
  %547 = extractvalue { <256 x i1>, i32 } %545, 1
  %548 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %549 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %550 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32> %548, <64 x i32> %549, <256 x i1> %542)
  %551 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %544, <64 x i32> %543, <256 x i1> %550)
  %552 = call <128 x i16> @llvm.hivm.vpack.x.v64i32(<64 x i32> %551, i32 0)
  %553 = call <256 x i8> @llvm.hivm.vpack.x.v128i16(<128 x i16> %552, i32 0)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %553, ptr addrspace(6) inttoptr (i64 172544 to ptr addrspace(6)), i32 0, i32 0, i32 0, <256 x i1> %546)
  br label %554

554:                                              ; preds = %541
  %555 = add i32 %539, 1
  br label %538, !llvm.loop !10

556:                                              ; preds = %538
  br label %557

557:                                              ; preds = %563, %556
  %558 = phi i32 [ %564, %563 ], [ 0, %556 ]
  %559 = icmp sle i32 %558, 0
  br i1 %559, label %560, label %565

560:                                              ; preds = %557
  %561 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %562 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %562, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %561)
  br label %563

563:                                              ; preds = %560
  %564 = add i32 %558, 1
  br label %557, !llvm.loop !11

565:                                              ; preds = %557
  %566 = trunc i64 %123 to i32
  br label %567

567:                                              ; preds = %573, %565
  %568 = phi i32 [ %574, %573 ], [ 0, %565 ]
  %569 = icmp sle i32 %568, 0
  br i1 %569, label %570, label %575

570:                                              ; preds = %567
  %571 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %572 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %566, <256 x i1> %571, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %572, ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %571)
  br label %573

573:                                              ; preds = %570
  %574 = add i32 %568, 1
  br label %567, !llvm.loop !12

575:                                              ; preds = %567
  br label %576

576:                                              ; preds = %592, %575
  %577 = phi i32 [ %593, %592 ], [ 0, %575 ]
  %578 = icmp sle i32 %577, 0
  br i1 %578, label %579, label %594

579:                                              ; preds = %576
  %580 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %581 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %580, i32 0)
  %582 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 1, <256 x i1> %580, i32 0)
  %583 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 64)
  %584 = extractvalue { <256 x i1>, i32 } %583, 0
  %585 = extractvalue { <256 x i1>, i32 } %583, 1
  %586 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %587 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %588 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32> %586, <64 x i32> %587, <256 x i1> %580)
  %589 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %582, <64 x i32> %581, <256 x i1> %588)
  %590 = call <128 x i16> @llvm.hivm.vpack.x.v64i32(<64 x i32> %589, i32 0)
  %591 = call <256 x i8> @llvm.hivm.vpack.x.v128i16(<128 x i16> %590, i32 0)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %591, ptr addrspace(6) inttoptr (i64 172608 to ptr addrspace(6)), i32 0, i32 0, i32 0, <256 x i1> %584)
  br label %592

592:                                              ; preds = %579
  %593 = add i32 %577, 1
  br label %576, !llvm.loop !13

594:                                              ; preds = %576
  %595 = and i64 %316, 2097151
  %596 = and i64 %123, 2097151
  %597 = shl i64 %595, 4
  %598 = shl i64 %596, 25
  %599 = or i64 %597, %598
  %600 = or i64 %599, 288230376151711744
  %601 = and i64 %322, 1099511627775
  %602 = or i64 %601, 70368744177664
  %603 = ptrtoint ptr addrspace(1) %11 to i64
  %604 = add i64 %324, 0
  %605 = add i64 %603, %604
  %606 = inttoptr i64 %605 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 163840 to ptr addrspace(6)), ptr addrspace(1) %606, i64 %600, i64 %602)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  br label %607

607:                                              ; preds = %625, %594
  %608 = phi i32 [ %626, %625 ], [ 0, %594 ]
  %609 = icmp sle i32 %608, 0
  br i1 %609, label %610, label %627

610:                                              ; preds = %607
  %611 = call <256 x i1> @llvm.hivm.pset.b8(i32 2)
  %612 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %611, i32 0)
  br label %613

613:                                              ; preds = %616, %610
  %614 = phi i64 [ %623, %616 ], [ 0, %610 ]
  %615 = icmp slt i64 %614, 4096
  br i1 %615, label %616, label %624

616:                                              ; preds = %613
  %617 = trunc i64 %614 to i32
  %618 = udiv i32 %617, 64
  %619 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 172544 to ptr addrspace(6)), i32 %618, i32 1, i32 0)
  %620 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s8(<256 x i8> %619, <256 x i8> %612, <256 x i1> %611)
  %621 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 163840 to ptr addrspace(6)), i32 %617, i32 1, i32 0)
  %622 = call <256 x i8> @llvm.hivm.vsel.v256i8(<256 x i8> %621, <256 x i8> %612, <256 x i1> %620)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %622, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %617, i32 3, i32 0, <256 x i1> %611)
  %623 = add i64 %614, 1
  br label %613

624:                                              ; preds = %613
  br label %625

625:                                              ; preds = %624
  %626 = add i32 %608, 1
  br label %607, !llvm.loop !14

627:                                              ; preds = %607
  br label %628

628:                                              ; preds = %646, %627
  %629 = phi i32 [ %647, %646 ], [ 0, %627 ]
  %630 = icmp sle i32 %629, 0
  br i1 %630, label %631, label %648

631:                                              ; preds = %628
  %632 = call <256 x i1> @llvm.hivm.pset.b8(i32 2)
  %633 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %632, i32 0)
  br label %634

634:                                              ; preds = %637, %631
  %635 = phi i64 [ %644, %637 ], [ 0, %631 ]
  %636 = icmp slt i64 %635, 4096
  br i1 %636, label %637, label %645

637:                                              ; preds = %634
  %638 = trunc i64 %635 to i32
  %639 = urem i32 %638, 64
  %640 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 172608 to ptr addrspace(6)), i32 %639, i32 1, i32 0)
  %641 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s8(<256 x i8> %640, <256 x i8> %633, <256 x i1> %632)
  %642 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %638, i32 1, i32 0)
  %643 = call <256 x i8> @llvm.hivm.vsel.v256i8(<256 x i8> %642, <256 x i8> %633, <256 x i1> %641)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %643, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %638, i32 3, i32 0, <256 x i1> %632)
  %644 = add i64 %635, 1
  br label %634

645:                                              ; preds = %634
  br label %646

646:                                              ; preds = %645
  %647 = add i32 %629, 1
  br label %628, !llvm.loop !15

648:                                              ; preds = %628
  %649 = sub i64 %108, %176
  %650 = call i64 @llvm.smax.i64(i64 %649, i64 0)
  %651 = call i64 @llvm.smin.i64(i64 %650, i64 64)
  %652 = mul i64 %176, %106
  %653 = add i64 %176, 1
  %654 = mul i64 %653, %106
  %655 = sub i64 %654, %652
  %656 = sext i32 %85 to i64
  %657 = add i64 %652, %656
  %658 = add i64 %657, %107
  br label %659

659:                                              ; preds = %665, %648
  %660 = phi i32 [ %666, %665 ], [ 0, %648 ]
  %661 = icmp sle i32 %660, 0
  br i1 %661, label %662, label %667

662:                                              ; preds = %659
  %663 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %664 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %664, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %663)
  br label %665

665:                                              ; preds = %662
  %666 = add i32 %660, 1
  br label %659, !llvm.loop !16

667:                                              ; preds = %659
  %668 = trunc i64 %651 to i32
  br label %669

669:                                              ; preds = %675, %667
  %670 = phi i32 [ %676, %675 ], [ 0, %667 ]
  %671 = icmp sle i32 %670, 0
  br i1 %671, label %672, label %677

672:                                              ; preds = %669
  %673 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %674 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %668, <256 x i1> %673, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %674, ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %673)
  br label %675

675:                                              ; preds = %672
  %676 = add i32 %670, 1
  br label %669, !llvm.loop !17

677:                                              ; preds = %669
  br label %678

678:                                              ; preds = %694, %677
  %679 = phi i32 [ %695, %694 ], [ 0, %677 ]
  %680 = icmp sle i32 %679, 0
  br i1 %680, label %681, label %696

681:                                              ; preds = %678
  %682 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %683 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %682, i32 0)
  %684 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 1, <256 x i1> %682, i32 0)
  %685 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 64)
  %686 = extractvalue { <256 x i1>, i32 } %685, 0
  %687 = extractvalue { <256 x i1>, i32 } %685, 1
  %688 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %689 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 168704 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %690 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32> %688, <64 x i32> %689, <256 x i1> %682)
  %691 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %684, <64 x i32> %683, <256 x i1> %690)
  %692 = call <128 x i16> @llvm.hivm.vpack.x.v64i32(<64 x i32> %691, i32 0)
  %693 = call <256 x i8> @llvm.hivm.vpack.x.v128i16(<128 x i16> %692, i32 0)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %693, ptr addrspace(6) inttoptr (i64 168960 to ptr addrspace(6)), i32 0, i32 0, i32 0, <256 x i1> %686)
  br label %694

694:                                              ; preds = %681
  %695 = add i32 %679, 1
  br label %678, !llvm.loop !18

696:                                              ; preds = %678
  %697 = and i64 %651, 2097151
  %698 = shl i64 %697, 4
  %699 = or i64 %698, 288230376285929472
  %700 = mul i64 %655, 4
  %701 = and i64 %700, 1099511627775
  %702 = or i64 %701, 4398046511104
  %703 = ptrtoint ptr addrspace(1) %7 to i64
  %704 = mul i64 %658, 4
  %705 = add i64 0, %704
  %706 = add i64 %703, %705
  %707 = inttoptr i64 %706 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) inttoptr (i64 167936 to ptr addrspace(6)), ptr addrspace(1) %707, i64 %699, i64 %702)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 2)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 2)
  br label %708

708:                                              ; preds = %730, %696
  %709 = phi i32 [ %731, %730 ], [ 0, %696 ]
  %710 = icmp sle i32 %709, 0
  br i1 %710, label %711, label %732

711:                                              ; preds = %708
  %712 = call <256 x i1> @llvm.hivm.pset.b8(i32 2)
  %713 = call <256 x i1> @llvm.hivm.pset.b32(i32 2)
  %714 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %712, i32 0)
  br label %715

715:                                              ; preds = %718, %711
  %716 = phi i64 [ %728, %718 ], [ 0, %711 ]
  %717 = icmp slt i64 %716, 64
  br i1 %717, label %718, label %729

718:                                              ; preds = %715
  %719 = trunc i64 %716 to i32
  %720 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 168960 to ptr addrspace(6)), i32 %719, i32 1, i32 0)
  %721 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s8(<256 x i8> %720, <256 x i8> %714, <256 x i1> %712)
  %722 = call <256 x i1> @llvm.hivm.punpack(<256 x i1> %721, i32 0)
  %723 = call <256 x i1> @llvm.hivm.punpack(<256 x i1> %722, i32 0)
  %724 = mul i32 %719, 4
  %725 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %713, i32 0)
  %726 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 167936 to ptr addrspace(6)), i32 %724, i32 3, i32 0)
  %727 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %726, <64 x float> %725, <256 x i1> %723)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %727, ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i32 %724, i32 5, i32 0, <256 x i1> %713)
  %728 = add i64 %716, 1
  br label %715

729:                                              ; preds = %715
  br label %730

730:                                              ; preds = %729
  %731 = add i32 %709, 1
  br label %708, !llvm.loop !19

732:                                              ; preds = %708
  br label %733

733:                                              ; preds = %749, %732
  %734 = phi i32 [ %750, %749 ], [ 0, %732 ]
  %735 = icmp sle i32 %734, 0
  br i1 %735, label %736, label %751

736:                                              ; preds = %733
  %737 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %738

738:                                              ; preds = %741, %736
  %739 = phi i64 [ %747, %741 ], [ 0, %736 ]
  %740 = icmp slt i64 %739, 64
  br i1 %740, label %741, label %748

741:                                              ; preds = %738
  %742 = mul i64 %739, 64
  %743 = trunc i64 %742 to i32
  %744 = mul i32 %743, 4
  %745 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 16384 to ptr addrspace(6)), i32 %744, i32 0, i32 0)
  %746 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %745, float %104, <256 x i1> %737)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %746, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %744, i32 2, i32 0, <256 x i1> %737)
  %747 = add i64 %739, 1
  br label %738

748:                                              ; preds = %738
  br label %749

749:                                              ; preds = %748
  %750 = add i32 %734, 1
  br label %733, !llvm.loop !20

751:                                              ; preds = %733
  br label %752

752:                                              ; preds = %759, %751
  %753 = phi i32 [ %760, %759 ], [ 0, %751 ]
  %754 = icmp sle i32 %753, 0
  br i1 %754, label %755, label %761

755:                                              ; preds = %752
  %756 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %757 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %758 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %757, float 0x3FF7154760000000, <256 x i1> %756)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %758, ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %756)
  br label %759

759:                                              ; preds = %755
  %760 = add i32 %753, 1
  br label %752, !llvm.loop !21

761:                                              ; preds = %752
  br label %762

762:                                              ; preds = %782, %761
  %763 = phi i32 [ %783, %782 ], [ 0, %761 ]
  %764 = icmp sle i32 %763, 0
  br i1 %764, label %765, label %784

765:                                              ; preds = %762
  %766 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %767

767:                                              ; preds = %770, %765
  %768 = phi i64 [ %780, %770 ], [ 0, %765 ]
  %769 = icmp slt i64 %768, 64
  br i1 %769, label %770, label %781

770:                                              ; preds = %767
  %771 = trunc i64 %768 to i32
  %772 = mul i32 %771, 64
  %773 = mul i32 %771, 256
  %774 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %773, i32 0, i32 0)
  %775 = udiv i32 %772, 64
  %776 = urem i32 %775, 64
  %777 = mul i32 %776, 4
  %778 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i32 %777, i32 3, i32 0)
  %779 = call <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float> %774, <64 x float> %778, <256 x i1> %766)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %779, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %773, i32 2, i32 0, <256 x i1> %766)
  %780 = add i64 %768, 1
  br label %767

781:                                              ; preds = %767
  br label %782

782:                                              ; preds = %781
  %783 = add i32 %763, 1
  br label %762, !llvm.loop !22

784:                                              ; preds = %762
  br label %785

785:                                              ; preds = %806, %784
  %786 = phi i32 [ %807, %806 ], [ 0, %784 ]
  %787 = icmp sle i32 %786, 0
  br i1 %787, label %788, label %808

788:                                              ; preds = %785
  %789 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %790

790:                                              ; preds = %793, %788
  %791 = phi i64 [ %804, %793 ], [ 0, %788 ]
  %792 = icmp slt i64 %791, 64
  br i1 %792, label %793, label %805

793:                                              ; preds = %790
  %794 = trunc i64 %791 to i32
  %795 = udiv i32 %794, 64
  %796 = urem i32 %794, 64
  %797 = mul i32 %796, 64
  %798 = mul i32 %795, 4096
  %799 = add i32 %798, %797
  %800 = mul i32 %799, 4
  %801 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %800, i32 0, i32 0)
  %802 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %801, float 0x3FE62E4300000000, <256 x i1> %789)
  %803 = call <64 x float> @llvm.hivm.vexp.x.v64f32(<64 x float> %802, <256 x i1> %789)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %803, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %800, i32 2, i32 0, <256 x i1> %789)
  %804 = add i64 %791, 1
  br label %790

805:                                              ; preds = %790
  br label %806

806:                                              ; preds = %805
  %807 = add i32 %786, 1
  br label %785, !llvm.loop !23

808:                                              ; preds = %785
  br label %809

809:                                              ; preds = %823, %808
  %810 = phi i32 [ %824, %823 ], [ 0, %808 ]
  %811 = icmp sle i32 %810, 0
  br i1 %811, label %812, label %825

812:                                              ; preds = %809
  %813 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)
  br label %814

814:                                              ; preds = %817, %812
  %815 = phi i64 [ %821, %817 ], [ 0, %812 ]
  %816 = icmp slt i64 %815, 16
  br i1 %816, label %817, label %822

817:                                              ; preds = %814
  %818 = mul i64 %815, 256
  %819 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %813, i32 0)
  %820 = trunc i64 %818 to i32
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %819, ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i32 %820, i32 0, i32 0, <256 x i1> %813)
  %821 = add i64 %815, 1
  br label %814

822:                                              ; preds = %814
  br label %823

823:                                              ; preds = %822
  %824 = add i32 %810, 1
  br label %809, !llvm.loop !24

825:                                              ; preds = %809
  br label %826

826:                                              ; preds = %855, %825
  %827 = phi i32 [ %856, %855 ], [ 0, %825 ]
  %828 = icmp sle i32 %827, 0
  br i1 %828, label %829, label %857

829:                                              ; preds = %826
  br label %830

830:                                              ; preds = %852, %829
  %831 = phi i64 [ %853, %852 ], [ 0, %829 ]
  %832 = icmp slt i64 %831, 64
  br i1 %832, label %833, label %854

833:                                              ; preds = %830
  br label %834

834:                                              ; preds = %837, %833
  %835 = phi i64 [ %851, %837 ], [ 0, %833 ]
  %836 = icmp slt i64 %835, 64
  br i1 %836, label %837, label %852

837:                                              ; preds = %834
  %838 = mul i64 %831, 64
  %839 = add i64 %838, %835
  %840 = getelementptr i8, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i64 %839
  %841 = load i8, ptr addrspace(6) %840, align 1
  %842 = mul i64 %831, 64
  %843 = add i64 %842, %835
  %844 = getelementptr i8, ptr addrspace(6) inttoptr (i64 188928 to ptr addrspace(6)), i64 %843
  %845 = load i8, ptr addrspace(6) %844, align 1
  %846 = icmp ne i8 %841, %845
  %847 = mul i64 %831, 64
  %848 = add i64 %847, %835
  %849 = getelementptr i1, ptr addrspace(6) inttoptr (i64 201216 to ptr addrspace(6)), i64 %848
  %850 = zext i1 %846 to i8
  store i8 %850, ptr addrspace(6) %849, align 1
  %851 = add i64 %835, 1
  br label %834

852:                                              ; preds = %834
  %853 = add i64 %831, 1
  br label %830

854:                                              ; preds = %830
  br label %855

855:                                              ; preds = %854
  %856 = add i32 %827, 1
  br label %826, !llvm.loop !25

857:                                              ; preds = %826
  br label %858

858:                                              ; preds = %889, %857
  %859 = phi i32 [ %890, %889 ], [ 0, %857 ]
  %860 = icmp sle i32 %859, 0
  br i1 %860, label %861, label %891

861:                                              ; preds = %858
  %862 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %863 = call <256 x i8> @llvm.hivm.vbr.v256s8(i8 0)
  %864 = call <64 x i32> @llvm.hivm.vbr.v64s32(i32 0)
  br label %865

865:                                              ; preds = %868, %861
  %866 = phi i64 [ %887, %868 ], [ 0, %861 ]
  %867 = icmp slt i64 %866, 32
  br i1 %867, label %868, label %888

868:                                              ; preds = %865
  %869 = trunc i64 %866 to i32
  %870 = mul i32 %869, 128
  %871 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 201216 to ptr addrspace(6)), i32 %870, i32 13, i32 0)
  %872 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %871, <256 x i8> %863)
  %873 = extractvalue { <256 x i8>, <256 x i8> } %872, 0
  %874 = extractvalue { <256 x i8>, <256 x i8> } %872, 1
  %875 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %873, <256 x i1> %862, i32 0)
  %876 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %875, <64 x i32> %864, <256 x i1> %862)
  %877 = mul i32 %869, 512
  %878 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %862, i32 0)
  %879 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %877, i32 0, i32 0)
  %880 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %879, <64 x float> %878, <256 x i1> %876)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %880, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %877, i32 2, i32 0, <256 x i1> %862)
  %881 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %874, <256 x i1> %862, i32 0)
  %882 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %881, <64 x i32> %864, <256 x i1> %862)
  %883 = add i32 %870, 64
  %884 = mul i32 %883, 4
  %885 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %884, i32 0, i32 0)
  %886 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %885, <64 x float> %878, <256 x i1> %882)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %886, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %884, i32 2, i32 0, <256 x i1> %862)
  %887 = add i64 %866, 1
  br label %865

888:                                              ; preds = %865
  br label %889

889:                                              ; preds = %888
  %890 = add i32 %859, 1
  br label %858, !llvm.loop !26

891:                                              ; preds = %858
  br label %892

892:                                              ; preds = %913, %891
  %893 = phi i32 [ %914, %913 ], [ 0, %891 ]
  %894 = icmp sle i32 %893, 0
  br i1 %894, label %895, label %915

895:                                              ; preds = %892
  %896 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %897

897:                                              ; preds = %900, %895
  %898 = phi i64 [ %911, %900 ], [ 0, %895 ]
  %899 = icmp slt i64 %898, 64
  br i1 %899, label %900, label %912

900:                                              ; preds = %897
  %901 = trunc i64 %898 to i32
  %902 = udiv i32 %901, 64
  %903 = urem i32 %901, 64
  %904 = mul i32 %903, 64
  %905 = mul i32 %902, 4096
  %906 = add i32 %905, %904
  %907 = mul i32 %906, 4
  %908 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %907, i32 0, i32 0)
  %909 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %908, <256 x i1> %896, i32 0, i32 0, i32 0)
  %910 = mul i32 %906, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %909, ptr addrspace(6) inttoptr (i64 131072 to ptr addrspace(6)), i32 %910, i32 7, i32 0, <256 x i1> %896)
  %911 = add i64 %898, 1
  br label %897

912:                                              ; preds = %897
  br label %913

913:                                              ; preds = %912
  %914 = add i32 %893, 1
  br label %892, !llvm.loop !27

915:                                              ; preds = %892
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 6)
  %916 = sub i64 %108, %177
  %917 = call i64 @llvm.smax.i64(i64 %916, i64 0)
  %918 = call i64 @llvm.smin.i64(i64 %917, i64 64)
  %919 = mul i64 %177, %106
  %920 = add i64 %177, 1
  %921 = mul i64 %920, %106
  %922 = sub i64 %921, %919
  %923 = add i64 %919, %656
  %924 = add i64 %923, %107
  br label %925

925:                                              ; preds = %931, %915
  %926 = phi i32 [ %932, %931 ], [ 0, %915 ]
  %927 = icmp sle i32 %926, 0
  br i1 %927, label %928, label %933

928:                                              ; preds = %925
  %929 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %930 = call <64 x i32> @llvm.hivm.vci.v64i32(i32 0, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %930, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %929)
  br label %931

931:                                              ; preds = %928
  %932 = add i32 %926, 1
  br label %925, !llvm.loop !28

933:                                              ; preds = %925
  %934 = trunc i64 %918 to i32
  br label %935

935:                                              ; preds = %941, %933
  %936 = phi i32 [ %942, %941 ], [ 0, %933 ]
  %937 = icmp sle i32 %936, 0
  br i1 %937, label %938, label %943

938:                                              ; preds = %935
  %939 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %940 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 %934, <256 x i1> %939, i32 0)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %940, ptr addrspace(6) inttoptr (i64 185088 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %939)
  br label %941

941:                                              ; preds = %938
  %942 = add i32 %936, 1
  br label %935, !llvm.loop !29

943:                                              ; preds = %935
  br label %944

944:                                              ; preds = %960, %943
  %945 = phi i32 [ %961, %960 ], [ 0, %943 ]
  %946 = icmp sle i32 %945, 0
  br i1 %946, label %947, label %962

947:                                              ; preds = %944
  %948 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %949 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %948, i32 0)
  %950 = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 1, <256 x i1> %948, i32 0)
  %951 = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 64)
  %952 = extractvalue { <256 x i1>, i32 } %951, 0
  %953 = extractvalue { <256 x i1>, i32 } %951, 1
  %954 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %955 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 185088 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %956 = call <256 x i1> @llvm.hivm.vcmp.lt.s.z.s32(<64 x i32> %954, <64 x i32> %955, <256 x i1> %948)
  %957 = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %950, <64 x i32> %949, <256 x i1> %956)
  %958 = call <128 x i16> @llvm.hivm.vpack.x.v64i32(<64 x i32> %957, i32 0)
  %959 = call <256 x i8> @llvm.hivm.vpack.x.v128i16(<128 x i16> %958, i32 0)
  call void @llvm.hivm.vstsx1.v256s8(<256 x i8> %959, ptr addrspace(6) inttoptr (i64 185344 to ptr addrspace(6)), i32 0, i32 0, i32 0, <256 x i1> %952)
  br label %960

960:                                              ; preds = %947
  %961 = add i32 %945, 1
  br label %944, !llvm.loop !30

962:                                              ; preds = %944
  %963 = and i64 %918, 2097151
  %964 = shl i64 %963, 4
  %965 = or i64 %964, 288230376285929472
  %966 = mul i64 %922, 4
  %967 = and i64 %966, 1099511627775
  %968 = or i64 %967, 4398046511104
  %969 = ptrtoint ptr addrspace(1) %8 to i64
  %970 = mul i64 %924, 4
  %971 = add i64 0, %970
  %972 = add i64 %969, %971
  %973 = inttoptr i64 %972 to ptr addrspace(1)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) inttoptr (i64 168192 to ptr addrspace(6)), ptr addrspace(1) %973, i64 %965, i64 %968)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 1)
  br label %974

974:                                              ; preds = %996, %962
  %975 = phi i32 [ %997, %996 ], [ 0, %962 ]
  %976 = icmp sle i32 %975, 0
  br i1 %976, label %977, label %998

977:                                              ; preds = %974
  %978 = call <256 x i1> @llvm.hivm.pset.b8(i32 2)
  %979 = call <256 x i1> @llvm.hivm.pset.b32(i32 2)
  %980 = call <256 x i8> @llvm.hivm.vdups.z.v256i8(i8 0, <256 x i1> %978, i32 0)
  br label %981

981:                                              ; preds = %984, %977
  %982 = phi i64 [ %994, %984 ], [ 0, %977 ]
  %983 = icmp slt i64 %982, 64
  br i1 %983, label %984, label %995

984:                                              ; preds = %981
  %985 = trunc i64 %982 to i32
  %986 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 185344 to ptr addrspace(6)), i32 %985, i32 1, i32 0)
  %987 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s8(<256 x i8> %986, <256 x i8> %980, <256 x i1> %978)
  %988 = call <256 x i1> @llvm.hivm.punpack(<256 x i1> %987, i32 0)
  %989 = call <256 x i1> @llvm.hivm.punpack(<256 x i1> %988, i32 0)
  %990 = mul i32 %985, 4
  %991 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %979, i32 0)
  %992 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168192 to ptr addrspace(6)), i32 %990, i32 3, i32 0)
  %993 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %992, <64 x float> %991, <256 x i1> %989)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %993, ptr addrspace(6) inttoptr (i64 205312 to ptr addrspace(6)), i32 %990, i32 5, i32 0, <256 x i1> %979)
  %994 = add i64 %982, 1
  br label %981

995:                                              ; preds = %981
  br label %996

996:                                              ; preds = %995
  %997 = add i32 %975, 1
  br label %974, !llvm.loop !31

998:                                              ; preds = %974
  br label %999

999:                                              ; preds = %1019, %998
  %1000 = phi i32 [ %1020, %1019 ], [ 0, %998 ]
  %1001 = icmp sle i32 %1000, 0
  br i1 %1001, label %1002, label %1021

1002:                                             ; preds = %999
  %1003 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1004

1004:                                             ; preds = %1007, %1002
  %1005 = phi i64 [ %1017, %1007 ], [ 0, %1002 ]
  %1006 = icmp slt i64 %1005, 64
  br i1 %1006, label %1007, label %1018

1007:                                             ; preds = %1004
  %1008 = trunc i64 %1005 to i32
  %1009 = mul i32 %1008, 64
  %1010 = mul i32 %1008, 256
  %1011 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) null, i32 %1010, i32 0, i32 0)
  %1012 = udiv i32 %1009, 64
  %1013 = urem i32 %1012, 64
  %1014 = mul i32 %1013, 4
  %1015 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 205312 to ptr addrspace(6)), i32 %1014, i32 3, i32 0)
  %1016 = call <64 x float> @llvm.hivm.vsub.s.x.v64f32(<64 x float> %1011, <64 x float> %1015, <256 x i1> %1003)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1016, ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %1010, i32 2, i32 0, <256 x i1> %1003)
  %1017 = add i64 %1005, 1
  br label %1004

1018:                                             ; preds = %1004
  br label %1019

1019:                                             ; preds = %1018
  %1020 = add i32 %1000, 1
  br label %999, !llvm.loop !32

1021:                                             ; preds = %999
  br label %1022

1022:                                             ; preds = %1039, %1021
  %1023 = phi i32 [ %1040, %1039 ], [ 0, %1021 ]
  %1024 = icmp sle i32 %1023, 0
  br i1 %1024, label %1025, label %1041

1025:                                             ; preds = %1022
  %1026 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1027

1027:                                             ; preds = %1030, %1025
  %1028 = phi i64 [ %1037, %1030 ], [ 0, %1025 ]
  %1029 = icmp slt i64 %1028, 64
  br i1 %1029, label %1030, label %1038

1030:                                             ; preds = %1027
  %1031 = mul i64 %1028, 64
  %1032 = trunc i64 %1031 to i32
  %1033 = mul i32 %1032, 4
  %1034 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1033, i32 0, i32 0)
  %1035 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 184832 to ptr addrspace(6)), i32 %1033, i32 0, i32 0)
  %1036 = call <64 x float> @llvm.hivm.vmul.s.x.v64f32(<64 x float> %1034, <64 x float> %1035, <256 x i1> %1026)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1036, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1033, i32 2, i32 0, <256 x i1> %1026)
  %1037 = add i64 %1028, 1
  br label %1027

1038:                                             ; preds = %1027
  br label %1039

1039:                                             ; preds = %1038
  %1040 = add i32 %1023, 1
  br label %1022, !llvm.loop !33

1041:                                             ; preds = %1022
  br label %1042

1042:                                             ; preds = %1073, %1041
  %1043 = phi i32 [ %1074, %1073 ], [ 0, %1041 ]
  %1044 = icmp sle i32 %1043, 0
  br i1 %1044, label %1045, label %1075

1045:                                             ; preds = %1042
  %1046 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %1047 = call <256 x i8> @llvm.hivm.vbr.v256s8(i8 0)
  %1048 = call <64 x i32> @llvm.hivm.vbr.v64s32(i32 0)
  br label %1049

1049:                                             ; preds = %1052, %1045
  %1050 = phi i64 [ %1071, %1052 ], [ 0, %1045 ]
  %1051 = icmp slt i64 %1050, 32
  br i1 %1051, label %1052, label %1072

1052:                                             ; preds = %1049
  %1053 = trunc i64 %1050 to i32
  %1054 = mul i32 %1053, 128
  %1055 = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) inttoptr (i64 201216 to ptr addrspace(6)), i32 %1054, i32 13, i32 0)
  %1056 = call { <256 x i8>, <256 x i8> } @llvm.hivm.vintlv.v256i8(<256 x i8> %1055, <256 x i8> %1047)
  %1057 = extractvalue { <256 x i8>, <256 x i8> } %1056, 0
  %1058 = extractvalue { <256 x i8>, <256 x i8> } %1056, 1
  %1059 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %1057, <256 x i1> %1046, i32 0)
  %1060 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %1059, <64 x i32> %1048, <256 x i1> %1046)
  %1061 = mul i32 %1053, 512
  %1062 = call <64 x float> @llvm.hivm.vdups.z.v64f32(float 0.000000e+00, <256 x i1> %1046, i32 0)
  %1063 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1061, i32 0, i32 0)
  %1064 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %1063, <64 x float> %1062, <256 x i1> %1060)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1064, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1061, i32 2, i32 0, <256 x i1> %1046)
  %1065 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> %1058, <256 x i1> %1046, i32 0)
  %1066 = call <256 x i1> @llvm.hivm.vcmp.ne.s.z.s32(<64 x i32> %1065, <64 x i32> %1048, <256 x i1> %1046)
  %1067 = add i32 %1054, 64
  %1068 = mul i32 %1067, 4
  %1069 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1068, i32 0, i32 0)
  %1070 = call <64 x float> @llvm.hivm.vsel.v64f32(<64 x float> %1069, <64 x float> %1062, <256 x i1> %1066)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1070, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1068, i32 2, i32 0, <256 x i1> %1046)
  %1071 = add i64 %1050, 1
  br label %1049

1072:                                             ; preds = %1049
  br label %1073

1073:                                             ; preds = %1072
  %1074 = add i32 %1043, 1
  br label %1042, !llvm.loop !34

1075:                                             ; preds = %1042
  br label %1076

1076:                                             ; preds = %1097, %1075
  %1077 = phi i32 [ %1098, %1097 ], [ 0, %1075 ]
  %1078 = icmp sle i32 %1077, 0
  br i1 %1078, label %1079, label %1099

1079:                                             ; preds = %1076
  %1080 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1081

1081:                                             ; preds = %1084, %1079
  %1082 = phi i64 [ %1095, %1084 ], [ 0, %1079 ]
  %1083 = icmp slt i64 %1082, 64
  br i1 %1083, label %1084, label %1096

1084:                                             ; preds = %1081
  %1085 = trunc i64 %1082 to i32
  %1086 = udiv i32 %1085, 64
  %1087 = urem i32 %1085, 64
  %1088 = mul i32 %1087, 64
  %1089 = mul i32 %1086, 4096
  %1090 = add i32 %1089, %1088
  %1091 = mul i32 %1090, 4
  %1092 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1091, i32 0, i32 0)
  %1093 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %1092, <256 x i1> %1080, i32 0, i32 0, i32 0)
  %1094 = mul i32 %1090, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %1093, ptr addrspace(6) inttoptr (i64 139264 to ptr addrspace(6)), i32 %1094, i32 7, i32 0, <256 x i1> %1080)
  %1095 = add i64 %1082, 1
  br label %1081

1096:                                             ; preds = %1081
  br label %1097

1097:                                             ; preds = %1096
  %1098 = add i32 %1077, 1
  br label %1076, !llvm.loop !35

1099:                                             ; preds = %1076
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 5)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 7)
  %1100 = add i64 %176, 64
  %1101 = add i64 %177, 64
  %1102 = add i64 %178, 64
  call void @llvm.hivm.WAIT.INTRA.BLOCKI.mode(i64 5, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 7)
  br label %325

1103:                                             ; preds = %1119, %389
  %1104 = phi i32 [ %1120, %1119 ], [ 0, %389 ]
  %1105 = icmp sle i32 %1104, 0
  br i1 %1105, label %1106, label %1121

1106:                                             ; preds = %1103
  %1107 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1108

1108:                                             ; preds = %1111, %1106
  %1109 = phi i64 [ %1117, %1111 ], [ 0, %1106 ]
  %1110 = icmp slt i64 %1109, 64
  br i1 %1110, label %1111, label %1118

1111:                                             ; preds = %1108
  %1112 = mul i64 %1109, 64
  %1113 = trunc i64 %1112 to i32
  %1114 = mul i32 %1113, 4
  %1115 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 32768 to ptr addrspace(6)), i32 %1114, i32 0, i32 0)
  %1116 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %1115, float %19, <256 x i1> %1107)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1116, ptr addrspace(6) inttoptr (i64 81920 to ptr addrspace(6)), i32 %1114, i32 2, i32 0, <256 x i1> %1107)
  %1117 = add i64 %1109, 1
  br label %1108

1118:                                             ; preds = %1108
  br label %1119

1119:                                             ; preds = %1118
  %1120 = add i32 %1104, 1
  br label %1103, !llvm.loop !36

1121:                                             ; preds = %1103
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 4)
  %1122 = sub i32 %103, %182
  %1123 = call i32 @llvm.smax.i32(i32 %1122, i32 0)
  %1124 = call i32 @llvm.smin.i32(i32 %1123, i32 64)
  %1125 = sext i32 %1124 to i64
  %1126 = sext i32 %161 to i64
  %1127 = call i64 @llvm.hivm.GET.CTRL()
  %1128 = call i64 @llvm.hivm.SBITSET1(i64 %1127, i64 6)
  %1129 = call i64 @llvm.hivm.SBITSET0(i64 %1128, i64 7)
  %1130 = call i64 @llvm.hivm.SBITSET0(i64 %1129, i64 8)
  call void @llvm.hivm.SET.CTRL(i64 %1130)
  %1131 = call i64 @llvm.hivm.GET.CTRL()
  %1132 = call i64 @llvm.hivm.SBITSET0(i64 %1131, i64 9)
  %1133 = call i64 @llvm.hivm.SBITSET0(i64 %1132, i64 10)
  call void @llvm.hivm.SET.CTRL(i64 %1133)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 4)
  %1134 = and i64 %1125, 2097151
  %1135 = shl i64 %1134, 4
  %1136 = or i64 %1135, 288230384741646336
  %1137 = mul i64 %1126, 4
  %1138 = and i64 %1137, 1099511627775
  %1139 = or i64 %1138, 281474976710656
  %1140 = ptrtoint ptr addrspace(1) %3 to i64
  %1141 = mul i64 %394, 4
  %1142 = add i64 0, %1141
  %1143 = add i64 %1140, %1142
  %1144 = inttoptr i64 %1143 to ptr addrspace(1)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %1144, ptr addrspace(6) inttoptr (i64 81920 to ptr addrspace(6)), i64 %1136, i64 %1139)
  %1145 = call i64 @llvm.hivm.GET.CTRL()
  %1146 = call i64 @llvm.hivm.SBITSET0(i64 %1145, i64 6)
  %1147 = call i64 @llvm.hivm.SBITSET0(i64 %1146, i64 7)
  %1148 = call i64 @llvm.hivm.SBITSET0(i64 %1147, i64 8)
  call void @llvm.hivm.SET.CTRL(i64 %1148)
  call void @llvm.hivm.SET.INTRA.BLOCKI.mode(i64 1, i64 11)
  %1149 = load volatile i32, ptr addrspace(11) %33, align 4
  %1150 = sub i32 %1149, 1
  store volatile i32 %1150, ptr addrspace(11) %33, align 4
  %1151 = add i32 %182, 64
  br label %396

1152:                                             ; preds = %1168, %400
  %1153 = phi i32 [ %1169, %1168 ], [ 0, %400 ]
  %1154 = icmp sle i32 %1153, 0
  br i1 %1154, label %1155, label %1170

1155:                                             ; preds = %1152
  %1156 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1157

1157:                                             ; preds = %1160, %1155
  %1158 = phi i64 [ %1166, %1160 ], [ 0, %1155 ]
  %1159 = icmp slt i64 %1158, 64
  br i1 %1159, label %1160, label %1167

1160:                                             ; preds = %1157
  %1161 = mul i64 %1158, 64
  %1162 = trunc i64 %1161 to i32
  %1163 = mul i32 %1162, 4
  %1164 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 49152 to ptr addrspace(6)), i32 %1163, i32 0, i32 0)
  %1165 = call <64 x float> @llvm.hivm.vmuls.s.x.v64f32(<64 x float> %1164, float %19, <256 x i1> %1156)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %1165, ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1163, i32 2, i32 0, <256 x i1> %1156)
  %1166 = add i64 %1158, 1
  br label %1157

1167:                                             ; preds = %1157
  br label %1168

1168:                                             ; preds = %1167
  %1169 = add i32 %1153, 1
  br label %1152, !llvm.loop !37

1170:                                             ; preds = %1152
  br label %1171

1171:                                             ; preds = %1192, %1170
  %1172 = phi i32 [ %1193, %1192 ], [ 0, %1170 ]
  %1173 = icmp sle i32 %1172, 0
  br i1 %1173, label %1174, label %1194

1174:                                             ; preds = %1171
  %1175 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1176

1176:                                             ; preds = %1179, %1174
  %1177 = phi i64 [ %1190, %1179 ], [ 0, %1174 ]
  %1178 = icmp slt i64 %1177, 64
  br i1 %1178, label %1179, label %1191

1179:                                             ; preds = %1176
  %1180 = trunc i64 %1177 to i32
  %1181 = udiv i32 %1180, 64
  %1182 = urem i32 %1180, 64
  %1183 = mul i32 %1182, 64
  %1184 = mul i32 %1181, 4096
  %1185 = add i32 %1184, %1183
  %1186 = mul i32 %1185, 4
  %1187 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 168448 to ptr addrspace(6)), i32 %1186, i32 0, i32 0)
  %1188 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %1187, <256 x i1> %1175, i32 0, i32 0, i32 0)
  %1189 = mul i32 %1185, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %1188, ptr addrspace(6) inttoptr (i64 147456 to ptr addrspace(6)), i32 %1189, i32 7, i32 0, <256 x i1> %1175)
  %1190 = add i64 %1177, 1
  br label %1176

1191:                                             ; preds = %1176
  br label %1192

1192:                                             ; preds = %1191
  %1193 = add i32 %1172, 1
  br label %1171, !llvm.loop !38

1194:                                             ; preds = %1171
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 2)
  %1195 = mul i64 %110, %162
  %1196 = mul i64 %125, %162
  %1197 = sub i64 %1196, %1195
  %1198 = sext i32 %160 to i64
  %1199 = add i64 %1195, %1198
  %1200 = add i64 %1199, %402
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 2)
  %1201 = mul i64 %1197, 2
  %1202 = and i64 %1201, 1099511627775
  %1203 = or i64 %1202, 140737488355328
  %1204 = ptrtoint ptr addrspace(1) %4 to i64
  %1205 = mul i64 %1200, 2
  %1206 = add i64 0, %1205
  %1207 = add i64 %1204, %1206
  %1208 = inttoptr i64 %1207 to ptr addrspace(1)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %1208, ptr addrspace(6) inttoptr (i64 147456 to ptr addrspace(6)), i64 %427, i64 %1203)
  br label %1209

1209:                                             ; preds = %1230, %1194
  %1210 = phi i32 [ %1231, %1230 ], [ 0, %1194 ]
  %1211 = icmp sle i32 %1210, 0
  br i1 %1211, label %1212, label %1232

1212:                                             ; preds = %1209
  %1213 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  br label %1214

1214:                                             ; preds = %1217, %1212
  %1215 = phi i64 [ %1228, %1217 ], [ 0, %1212 ]
  %1216 = icmp slt i64 %1215, 64
  br i1 %1216, label %1217, label %1229

1217:                                             ; preds = %1214
  %1218 = trunc i64 %1215 to i32
  %1219 = udiv i32 %1218, 64
  %1220 = urem i32 %1218, 64
  %1221 = mul i32 %1220, 64
  %1222 = mul i32 %1219, 4096
  %1223 = add i32 %1222, %1221
  %1224 = mul i32 %1223, 4
  %1225 = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 65536 to ptr addrspace(6)), i32 %1224, i32 0, i32 0)
  %1226 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> %1225, <256 x i1> %1213, i32 0, i32 0, i32 0)
  %1227 = mul i32 %1223, 2
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %1226, ptr addrspace(6) inttoptr (i64 155648 to ptr addrspace(6)), i32 %1227, i32 7, i32 0, <256 x i1> %1213)
  %1228 = add i64 %1215, 1
  br label %1214

1229:                                             ; preds = %1214
  br label %1230

1230:                                             ; preds = %1229
  %1231 = add i32 %1210, 1
  br label %1209, !llvm.loop !39

1232:                                             ; preds = %1209
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 1)
  %1233 = ptrtoint ptr addrspace(1) %5 to i64
  %1234 = mul i64 %1200, 2
  %1235 = add i64 0, %1234
  %1236 = add i64 %1233, %1235
  %1237 = inttoptr i64 %1236 to ptr addrspace(1)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %1237, ptr addrspace(6) inttoptr (i64 155648 to ptr addrspace(6)), i64 %427, i64 %1203)
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