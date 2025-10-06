; ModuleID = 'src/sim.c'
source_filename = "src/sim.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.SDL_Event = type { %struct.SDL_SensorEvent, [8 x i8] }
%struct.SDL_SensorEvent = type { i32, i32, i32, [6 x float], i64 }

@window = dso_local local_unnamed_addr global ptr null, align 8
@renderer = dso_local local_unnamed_addr global ptr null, align 8
@stderr = external local_unnamed_addr global ptr, align 8
@.str = private unnamed_addr constant [20 x i8] c"SDL_Init Error: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"Gas Particle Simulation\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"SDL_CreateWindow Error: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"SDL_CreateRenderer Error: %s\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @draw_filled_circle(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = sub nsw i32 0, %3
  %6 = icmp slt i32 %3, 0
  br i1 %6, label %13, label %7

7:                                                ; preds = %4
  %8 = mul nsw i32 %3, %3
  br label %9

9:                                                ; preds = %14, %7
  %10 = phi i32 [ %5, %7 ], [ %15, %14 ]
  %11 = mul nsw i32 %10, %10
  %12 = add nsw i32 %10, %2
  br label %17

13:                                               ; preds = %14, %4
  ret void

14:                                               ; preds = %25
  %15 = add i32 %10, 1
  %16 = icmp eq i32 %10, %3
  br i1 %16, label %13, label %9

17:                                               ; preds = %9, %25
  %18 = phi i32 [ %5, %9 ], [ %26, %25 ]
  %19 = mul nsw i32 %18, %18
  %20 = add nuw nsw i32 %19, %11
  %21 = icmp ugt i32 %20, %8
  br i1 %21, label %25, label %22

22:                                               ; preds = %17
  %23 = add nsw i32 %18, %1
  %24 = tail call i32 @SDL_RenderDrawPoint(ptr noundef %0, i32 noundef %23, i32 noundef %12) #4
  br label %25

25:                                               ; preds = %17, %22
  %26 = add i32 %18, 1
  %27 = icmp eq i32 %18, %3
  br i1 %27, label %14, label %17
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

declare i32 @SDL_RenderDrawPoint(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @simInit() local_unnamed_addr #0 {
  %1 = tail call i32 @SDL_Init(i32 noundef 32) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %7, label %3

3:                                                ; preds = %0
  %4 = load ptr, ptr @stderr, align 8, !tbaa !5
  %5 = tail call ptr @SDL_GetError() #4
  %6 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %4, ptr noundef nonnull @.str, ptr noundef %5) #5
  br label %22

7:                                                ; preds = %0
  %8 = tail call ptr @SDL_CreateWindow(ptr noundef nonnull @.str.1, i32 noundef 805240832, i32 noundef 805240832, i32 noundef 800, i32 noundef 600, i32 noundef 4) #4
  store ptr %8, ptr @window, align 8, !tbaa !5
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %14

10:                                               ; preds = %7
  %11 = load ptr, ptr @stderr, align 8, !tbaa !5
  %12 = tail call ptr @SDL_GetError() #4
  %13 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef nonnull @.str.2, ptr noundef %12) #5
  tail call void @SDL_Quit() #4
  br label %22

14:                                               ; preds = %7
  %15 = tail call ptr @SDL_CreateRenderer(ptr noundef nonnull %8, i32 noundef -1, i32 noundef 6) #4
  store ptr %15, ptr @renderer, align 8, !tbaa !5
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %22

17:                                               ; preds = %14
  %18 = load ptr, ptr @stderr, align 8, !tbaa !5
  %19 = tail call ptr @SDL_GetError() #4
  %20 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %18, ptr noundef nonnull @.str.3, ptr noundef %19) #5
  %21 = load ptr, ptr @window, align 8, !tbaa !5
  tail call void @SDL_DestroyWindow(ptr noundef %21) #4
  tail call void @SDL_Quit() #4
  br label %22

22:                                               ; preds = %3, %10, %17, %14
  ret void
}

declare i32 @SDL_Init(i32 noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #3

declare ptr @SDL_GetError() local_unnamed_addr #2

declare ptr @SDL_CreateWindow(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

declare void @SDL_Quit() local_unnamed_addr #2

declare ptr @SDL_CreateRenderer(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

declare void @SDL_DestroyWindow(ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @sim(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1, ptr nocapture noundef readonly %2, ptr nocapture noundef readonly %3, ptr nocapture noundef readonly %4, ptr nocapture noundef readonly %5, i32 noundef %6) local_unnamed_addr #0 {
  %8 = alloca %union.SDL_Event, align 8
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %8) #4
  br label %9

9:                                                ; preds = %12, %7
  %10 = call i32 @SDL_PollEvent(ptr noundef nonnull %8) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %15, label %12

12:                                               ; preds = %9
  %13 = load i32, ptr %8, align 8, !tbaa !9
  %14 = icmp eq i32 %13, 256
  br i1 %14, label %70, label %9

15:                                               ; preds = %9
  %16 = load ptr, ptr @renderer, align 8, !tbaa !5
  %17 = call i32 @SDL_SetRenderDrawColor(ptr noundef %16, i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext 0, i8 noundef zeroext -1) #4
  %18 = load ptr, ptr @renderer, align 8, !tbaa !5
  %19 = call i32 @SDL_RenderClear(ptr noundef %18) #4
  %20 = icmp sgt i32 %6, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %15
  %22 = zext nneg i32 %6 to i64
  br label %25

23:                                               ; preds = %67, %15
  %24 = load ptr, ptr @renderer, align 8, !tbaa !5
  call void @SDL_RenderPresent(ptr noundef %24) #4
  call void @SDL_Delay(i32 noundef 16) #4
  br label %70

25:                                               ; preds = %21, %67
  %26 = phi i64 [ 0, %21 ], [ %68, %67 ]
  %27 = load ptr, ptr @renderer, align 8, !tbaa !5
  %28 = getelementptr inbounds i32, ptr %0, i64 %26
  %29 = load i32, ptr %28, align 4, !tbaa !10
  %30 = trunc i32 %29 to i8
  %31 = getelementptr inbounds i32, ptr %1, i64 %26
  %32 = load i32, ptr %31, align 4, !tbaa !10
  %33 = trunc i32 %32 to i8
  %34 = getelementptr inbounds i32, ptr %2, i64 %26
  %35 = load i32, ptr %34, align 4, !tbaa !10
  %36 = trunc i32 %35 to i8
  %37 = call i32 @SDL_SetRenderDrawColor(ptr noundef %27, i8 noundef zeroext %30, i8 noundef zeroext %33, i8 noundef zeroext %36, i8 noundef zeroext -1) #4
  %38 = load ptr, ptr @renderer, align 8, !tbaa !5
  %39 = getelementptr inbounds i32, ptr %3, i64 %26
  %40 = load i32, ptr %39, align 4, !tbaa !10
  %41 = getelementptr inbounds i32, ptr %4, i64 %26
  %42 = load i32, ptr %41, align 4, !tbaa !10
  %43 = getelementptr inbounds i32, ptr %5, i64 %26
  %44 = load i32, ptr %43, align 4, !tbaa !10
  %45 = sub nsw i32 0, %44
  %46 = icmp slt i32 %44, 0
  br i1 %46, label %67, label %47

47:                                               ; preds = %25
  %48 = mul nsw i32 %44, %44
  br label %49

49:                                               ; preds = %53, %47
  %50 = phi i32 [ %45, %47 ], [ %54, %53 ]
  %51 = mul nsw i32 %50, %50
  %52 = add nsw i32 %50, %42
  br label %56

53:                                               ; preds = %64
  %54 = add i32 %50, 1
  %55 = icmp eq i32 %50, %44
  br i1 %55, label %67, label %49

56:                                               ; preds = %64, %49
  %57 = phi i32 [ %45, %49 ], [ %65, %64 ]
  %58 = mul nsw i32 %57, %57
  %59 = add nuw nsw i32 %58, %51
  %60 = icmp ugt i32 %59, %48
  br i1 %60, label %64, label %61

61:                                               ; preds = %56
  %62 = add nsw i32 %57, %40
  %63 = call i32 @SDL_RenderDrawPoint(ptr noundef %38, i32 noundef %62, i32 noundef %52) #4
  br label %64

64:                                               ; preds = %61, %56
  %65 = add i32 %57, 1
  %66 = icmp eq i32 %57, %44
  br i1 %66, label %53, label %56

67:                                               ; preds = %53, %25
  %68 = add nuw nsw i64 %26, 1
  %69 = icmp eq i64 %68, %22
  br i1 %69, label %23, label %25

70:                                               ; preds = %12, %23
  %71 = phi i32 [ 0, %23 ], [ 1, %12 ]
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %8) #4
  ret i32 %71
}

declare i32 @SDL_PollEvent(ptr noundef) local_unnamed_addr #2

declare i32 @SDL_SetRenderDrawColor(ptr noundef, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext) local_unnamed_addr #2

declare i32 @SDL_RenderClear(ptr noundef) local_unnamed_addr #2

declare void @SDL_RenderPresent(ptr noundef) local_unnamed_addr #2

declare void @SDL_Delay(i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @simExit() local_unnamed_addr #0 {
  %1 = load ptr, ptr @renderer, align 8, !tbaa !5
  tail call void @SDL_DestroyRenderer(ptr noundef %1) #4
  %2 = load ptr, ptr @window, align 8, !tbaa !5
  tail call void @SDL_DestroyWindow(ptr noundef %2) #4
  tail call void @SDL_Quit() #4
  ret void
}

declare void @SDL_DestroyRenderer(ptr noundef) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
