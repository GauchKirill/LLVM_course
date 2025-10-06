; ModuleID = 'src/app.c'
source_filename = "src/app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @random_range(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = tail call i32 @rand() #4
  %4 = sub i32 %1, %0
  %5 = add i32 %4, 1
  %6 = srem i32 %3, %5
  %7 = add nsw i32 %6, %0
  ret i32 %7
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [50 x i32], align 16
  %2 = alloca [50 x i32], align 16
  %3 = alloca [50 x i32], align 16
  %4 = alloca [50 x i32], align 16
  %5 = alloca [50 x i32], align 16
  %6 = alloca [50 x i32], align 16
  %7 = alloca [50 x i32], align 16
  %8 = alloca [50 x i32], align 16
  %9 = tail call i64 @time(ptr noundef null) #4
  %10 = trunc i64 %9 to i32
  tail call void @srand(i32 noundef %10) #4
  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %1) #4
  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %2) #4
  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %3) #4
  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %4) #4
  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %5) #4
  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %6) #4
  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %7) #4
  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %8) #4
  br label %11

11:                                               ; preds = %0, %11
  %12 = phi i64 [ 0, %0 ], [ %59, %11 ]
  %13 = tail call i32 @rand() #4
  %14 = srem i32 %13, 11
  %15 = add nsw i32 %14, 5
  %16 = getelementptr inbounds [50 x i32], ptr %5, i64 0, i64 %12
  store i32 %15, ptr %16, align 4, !tbaa !5
  %17 = tail call i32 @rand() #4
  %18 = shl nsw i32 %14, 1
  %19 = sub nsw i32 791, %18
  %20 = srem i32 %17, %19
  %21 = add nsw i32 %20, %15
  %22 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 %12
  store i32 %21, ptr %22, align 4, !tbaa !5
  %23 = tail call i32 @rand() #4
  %24 = shl nsw i32 %15, 1
  %25 = sub nsw i32 601, %24
  %26 = srem i32 %23, %25
  %27 = add nsw i32 %26, %15
  %28 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 %12
  store i32 %27, ptr %28, align 4, !tbaa !5
  %29 = tail call i32 @rand() #4
  %30 = srem i32 %29, 6
  %31 = add nsw i32 %30, 1
  %32 = tail call i32 @rand() #4
  %33 = and i32 %32, 1
  %34 = icmp eq i32 %33, 0
  %35 = xor i32 %30, -1
  %36 = select i1 %34, i32 %35, i32 %31
  %37 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %12
  store i32 %36, ptr %37, align 4, !tbaa !5
  %38 = tail call i32 @rand() #4
  %39 = srem i32 %38, 6
  %40 = add nsw i32 %39, 1
  %41 = tail call i32 @rand() #4
  %42 = and i32 %41, 1
  %43 = icmp eq i32 %42, 0
  %44 = xor i32 %39, -1
  %45 = select i1 %43, i32 %44, i32 %40
  %46 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %12
  store i32 %45, ptr %46, align 4, !tbaa !5
  %47 = tail call i32 @rand() #4
  %48 = srem i32 %47, 206
  %49 = add nsw i32 %48, 50
  %50 = getelementptr inbounds [50 x i32], ptr %6, i64 0, i64 %12
  store i32 %49, ptr %50, align 4, !tbaa !5
  %51 = tail call i32 @rand() #4
  %52 = srem i32 %51, 206
  %53 = add nsw i32 %52, 50
  %54 = getelementptr inbounds [50 x i32], ptr %7, i64 0, i64 %12
  store i32 %53, ptr %54, align 4, !tbaa !5
  %55 = tail call i32 @rand() #4
  %56 = srem i32 %55, 206
  %57 = add nsw i32 %56, 50
  %58 = getelementptr inbounds [50 x i32], ptr %8, i64 0, i64 %12
  store i32 %57, ptr %58, align 4, !tbaa !5
  %59 = add nuw nsw i64 %12, 1
  %60 = icmp eq i64 %59, 50
  br i1 %60, label %61, label %11

61:                                               ; preds = %11
  %62 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 48
  %63 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 48
  %64 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 48
  %65 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 48
  %66 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 49
  %67 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 49
  %68 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 49
  %69 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 49
  br label %70

70:                                               ; preds = %84, %61
  %71 = phi i64 [ 0, %61 ], [ %85, %84 ]
  %72 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %71
  %73 = load <4 x i32>, ptr %72, align 16, !tbaa !5
  %74 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 %71
  %75 = load <4 x i32>, ptr %74, align 16, !tbaa !5
  %76 = add nsw <4 x i32> %75, %73
  store <4 x i32> %76, ptr %74, align 16, !tbaa !5
  %77 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %71
  %78 = load <4 x i32>, ptr %77, align 16, !tbaa !5
  %79 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 %71
  %80 = load <4 x i32>, ptr %79, align 16, !tbaa !5
  %81 = add nsw <4 x i32> %80, %78
  store <4 x i32> %81, ptr %79, align 16, !tbaa !5
  %82 = add nuw i64 %71, 4
  %83 = icmp eq i64 %82, 48
  br i1 %83, label %86, label %84

84:                                               ; preds = %70, %140
  %85 = phi i64 [ %82, %70 ], [ 0, %140 ]
  br label %70, !llvm.loop !9

86:                                               ; preds = %70
  %87 = load i32, ptr %62, align 16, !tbaa !5
  %88 = load i32, ptr %63, align 16, !tbaa !5
  %89 = add nsw i32 %88, %87
  store i32 %89, ptr %63, align 16, !tbaa !5
  %90 = load i32, ptr %64, align 16, !tbaa !5
  %91 = load i32, ptr %65, align 16, !tbaa !5
  %92 = add nsw i32 %91, %90
  store i32 %92, ptr %65, align 16, !tbaa !5
  %93 = load i32, ptr %66, align 4, !tbaa !5
  %94 = load i32, ptr %67, align 4, !tbaa !5
  %95 = add nsw i32 %94, %93
  store i32 %95, ptr %67, align 4, !tbaa !5
  %96 = load i32, ptr %68, align 4, !tbaa !5
  %97 = load i32, ptr %69, align 4, !tbaa !5
  %98 = add nsw i32 %97, %96
  store i32 %98, ptr %69, align 4, !tbaa !5
  br label %99

99:                                               ; preds = %86, %134
  %100 = phi i64 [ %135, %134 ], [ 0, %86 ]
  %101 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 %100
  %102 = load i32, ptr %101, align 4, !tbaa !5
  %103 = getelementptr inbounds [50 x i32], ptr %5, i64 0, i64 %100
  %104 = load i32, ptr %103, align 4, !tbaa !5
  %105 = icmp slt i32 %102, %104
  br i1 %105, label %106, label %110

106:                                              ; preds = %99
  store i32 %104, ptr %101, align 4, !tbaa !5
  %107 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %100
  %108 = load i32, ptr %107, align 4, !tbaa !5
  %109 = sub nsw i32 0, %108
  store i32 %109, ptr %107, align 4, !tbaa !5
  br label %110

110:                                              ; preds = %106, %99
  %111 = phi i32 [ %104, %106 ], [ %102, %99 ]
  %112 = sub nsw i32 800, %104
  %113 = icmp sgt i32 %111, %112
  br i1 %113, label %114, label %118

114:                                              ; preds = %110
  store i32 %112, ptr %101, align 4, !tbaa !5
  %115 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %100
  %116 = load i32, ptr %115, align 4, !tbaa !5
  %117 = sub nsw i32 0, %116
  store i32 %117, ptr %115, align 4, !tbaa !5
  br label %118

118:                                              ; preds = %114, %110
  %119 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 %100
  %120 = load i32, ptr %119, align 4, !tbaa !5
  %121 = icmp slt i32 %120, %104
  br i1 %121, label %122, label %126

122:                                              ; preds = %118
  store i32 %104, ptr %119, align 4, !tbaa !5
  %123 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %100
  %124 = load i32, ptr %123, align 4, !tbaa !5
  %125 = sub nsw i32 0, %124
  store i32 %125, ptr %123, align 4, !tbaa !5
  br label %126

126:                                              ; preds = %122, %118
  %127 = phi i32 [ %104, %122 ], [ %120, %118 ]
  %128 = sub nsw i32 600, %104
  %129 = icmp sgt i32 %127, %128
  br i1 %129, label %130, label %134

130:                                              ; preds = %126
  store i32 %128, ptr %119, align 4, !tbaa !5
  %131 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %100
  %132 = load i32, ptr %131, align 4, !tbaa !5
  %133 = sub nsw i32 0, %132
  store i32 %133, ptr %131, align 4, !tbaa !5
  br label %134

134:                                              ; preds = %126, %130
  %135 = add nuw nsw i64 %100, 1
  %136 = icmp eq i64 %135, 50
  br i1 %136, label %143, label %99

137:                                              ; preds = %194, %143
  %138 = add nuw nsw i64 %145, 1
  %139 = icmp eq i64 %146, 50
  br i1 %139, label %140, label %143

140:                                              ; preds = %137
  %141 = call i32 @sim(ptr noundef nonnull %6, ptr noundef nonnull %7, ptr noundef nonnull %8, ptr noundef nonnull %1, ptr noundef nonnull %2, ptr noundef nonnull %5, i32 noundef 50) #4
  %142 = icmp eq i32 %141, 0
  br i1 %142, label %84, label %197

143:                                              ; preds = %134, %137
  %144 = phi i64 [ %146, %137 ], [ 0, %134 ]
  %145 = phi i64 [ %138, %137 ], [ 1, %134 ]
  %146 = add nuw nsw i64 %144, 1
  %147 = icmp ult i64 %144, 49
  br i1 %147, label %148, label %137

148:                                              ; preds = %143
  %149 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 %144
  %150 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 %144
  %151 = getelementptr inbounds [50 x i32], ptr %5, i64 0, i64 %144
  %152 = load i32, ptr %151, align 4, !tbaa !5
  %153 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %144
  %154 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %144
  br label %155

155:                                              ; preds = %148, %194
  %156 = phi i64 [ %145, %148 ], [ %195, %194 ]
  %157 = load i32, ptr %149, align 4, !tbaa !5
  %158 = getelementptr inbounds [50 x i32], ptr %1, i64 0, i64 %156
  %159 = load i32, ptr %158, align 4, !tbaa !5
  %160 = sub nsw i32 %157, %159
  %161 = load i32, ptr %150, align 4, !tbaa !5
  %162 = getelementptr inbounds [50 x i32], ptr %2, i64 0, i64 %156
  %163 = load i32, ptr %162, align 4, !tbaa !5
  %164 = sub nsw i32 %161, %163
  %165 = mul nsw i32 %160, %160
  %166 = mul nsw i32 %164, %164
  %167 = add nuw nsw i32 %166, %165
  %168 = getelementptr inbounds [50 x i32], ptr %5, i64 0, i64 %156
  %169 = load i32, ptr %168, align 4, !tbaa !5
  %170 = add nsw i32 %169, %152
  %171 = mul nsw i32 %170, %170
  %172 = icmp ult i32 %167, %171
  %173 = icmp ne i32 %167, 0
  %174 = and i1 %173, %172
  br i1 %174, label %175, label %194

175:                                              ; preds = %155
  %176 = load i32, ptr %153, align 4, !tbaa !5
  %177 = load i32, ptr %154, align 4, !tbaa !5
  %178 = getelementptr inbounds [50 x i32], ptr %3, i64 0, i64 %156
  %179 = load i32, ptr %178, align 4, !tbaa !5
  store i32 %179, ptr %153, align 4, !tbaa !5
  %180 = getelementptr inbounds [50 x i32], ptr %4, i64 0, i64 %156
  %181 = load i32, ptr %180, align 4, !tbaa !5
  store i32 %181, ptr %154, align 4, !tbaa !5
  store i32 %176, ptr %178, align 4, !tbaa !5
  store i32 %177, ptr %180, align 4, !tbaa !5
  %182 = icmp sgt i32 %160, 0
  %183 = select i1 %182, i32 2, i32 -2
  %184 = select i1 %182, i32 -2, i32 2
  %185 = add nsw i32 %157, %183
  store i32 %185, ptr %149, align 4, !tbaa !5
  %186 = load i32, ptr %158, align 4, !tbaa !5
  %187 = add nsw i32 %186, %184
  store i32 %187, ptr %158, align 4, !tbaa !5
  %188 = icmp sgt i32 %164, 0
  %189 = select i1 %188, i32 2, i32 -2
  %190 = select i1 %188, i32 -2, i32 2
  %191 = add nsw i32 %161, %189
  store i32 %191, ptr %150, align 4, !tbaa !5
  %192 = load i32, ptr %162, align 4, !tbaa !5
  %193 = add nsw i32 %192, %190
  store i32 %193, ptr %162, align 4, !tbaa !5
  br label %194

194:                                              ; preds = %175, %155
  %195 = add nuw nsw i64 %156, 1
  %196 = icmp eq i64 %195, 50
  br i1 %196, label %137, label %155

197:                                              ; preds = %140
  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %8) #4
  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %7) #4
  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %6) #4
  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %5) #4
  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %4) #4
  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %3) #4
  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %1) #4
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

declare i32 @sim(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
