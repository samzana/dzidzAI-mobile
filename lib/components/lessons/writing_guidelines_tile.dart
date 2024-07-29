import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WritingGuidelinesTile extends StatelessWidget {
  const WritingGuidelinesTile({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Guidelines',
              style: TextStyle(
                fontFamily: 'Baloo 2',
                fontSize: 23.sp,
                fontWeight: FontWeight.w800,
                color: black,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              title.startsWith('Exam') 
              ? 'Click for guidelines and tips for acing the exam'
              : 'Click for tips and guidelines for $title compositions.',
              style: TextStyle(
                fontFamily: 'Baloo 2',
                fontSize: 18.sp,
                color: black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
