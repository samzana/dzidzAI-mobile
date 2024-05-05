import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Baloo 2',
        fontSize: 62.sp,
        fontWeight: FontWeight.w800,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Baloo 2',
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Baloo 2',
        fontSize: 25.sp,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
