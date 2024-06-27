import 'package:dzidzai_mobile/components/home/progress_bar.dart';
import 'package:dzidzai_mobile/components/icon_wrapper.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WritingCard extends StatelessWidget {
  const WritingCard({
    super.key,
    required this.text,
    required this.icon,
    required this.progress,
    required this.onPressed,
  });

  final String text;
  final String icon;
  final double progress;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 176.w,
          height: 170.h,
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(14.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconWrapper(icon: icon, radius: 50.r, color: white),
                const Spacer(),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Baloo 2',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10.h),
                ProgressBar(progress: progress/100, height: 12.h, width: 152.w,),
              ],
            ),
          ),
        ));
  }
}
