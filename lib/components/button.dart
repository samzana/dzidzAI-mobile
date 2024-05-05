import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;
  final double width;

  const AppButton({
    super.key, 
    required this.text, 
    required this.color, 
    required this.width,
    required this.onPressed,
  }); 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: 68.h,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 10.h,
          shadowColor: color == black ? grey : navy,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Baloo 2',
            fontWeight: FontWeight.w800,
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 25.sp,
          )
        ),
      ),
    );
  }


}
