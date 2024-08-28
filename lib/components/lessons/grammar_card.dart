import 'package:dzidzai_mobile/components/icon_wrapper.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GrammarCard extends StatelessWidget {
  const GrammarCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: IntrinsicWidth(
        child: Container(
          height: 105.h,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconWrapper(icon: icon, radius: 25.w, color: white, fillColor: lightGrey,),
              const Spacer(),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Baloo 2',
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}