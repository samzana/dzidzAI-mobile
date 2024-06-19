import 'package:dzidzai_mobile/components/home/progress_bar.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillButton extends StatelessWidget {
  const SkillButton({
    super.key,
    required this.skill,
    required this.onPressed,
    required this.icon,
    required this.progress,
  });

  final String skill;
  final VoidCallback onPressed;
  final String icon;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 390.w,
        height: 85.h,
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(38.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60.w, 
                height: 60
                    .w, 
                decoration: BoxDecoration(
                  shape: BoxShape.circle, 
                  image: DecorationImage(
                    image: AssetImage(icon), 
                  ),
                ),
              ),
              SizedBox(width: 10.w), 
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            skill,
                            style: TextStyle(
                              fontFamily: 'Baloo 2',
                              fontSize: 23.sp,
                              fontWeight: FontWeight.w800,
                              color: black,
                            ),
                            overflow:
                                TextOverflow.ellipsis, 
                          ),
                        ),
                        SizedBox(
                            width:
                                10.w), 
                        Text(
                          '${progress.toStringAsFixed(0)}%',
                          style: TextStyle(
                            fontFamily: 'Baloo 2',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w800,
                            color: blue,
                          ),
                        ),
                        SizedBox(
                            width:
                                20.w),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    ProgressBar(progress: progress / 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
