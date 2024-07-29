import 'package:dzidzai_mobile/components/home/progress_bar.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReadingPracticeTile extends StatelessWidget {
  const ReadingPracticeTile({
    super.key,
    required this.onPressed,
    required this.title,
    required this.progress,
  });

  final VoidCallback onPressed;
  final String title;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 390.w,
        height: 100.h,
        decoration: BoxDecoration(
            color: lightGrey, borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Baloo 2',
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w800,
                  color: black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10.h,
              ),
              ProgressBar(progress: progress / 100, height: 20.h, width: 285.w),
            ],
          ),
        ),
      ),
    );
  }
}
