import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentStanding extends StatelessWidget {
  const CurrentStanding({
    super.key,
    required this.currentStanding,
  });

  final String currentStanding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.w,
      height: 210.h,
      decoration: BoxDecoration(
        color: orange,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          'N/A',
          style: TextStyle(
            fontFamily: 'Baloo 2',
            color: white,
            fontSize: 55.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        Text(
          'Current Grade Standing',
          style: TextStyle(
            fontFamily: 'Baloo 2',
            color: white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],),
    );
  }
}
