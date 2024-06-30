import 'package:dzidzai_mobile/components/icon_wrapper.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReadingCard extends StatelessWidget {
  const ReadingCard({
    super.key,
    required this.color,
    required this.wrapperColor,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final Color color;
  final Color wrapperColor;
  final String text;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 176.w,
        height: 170.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(14.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconWrapper(icon: icon, radius: 50.r, color: wrapperColor, fillColor: white,),
              const Spacer(),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Baloo 2',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
