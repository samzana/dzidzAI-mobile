import 'package:dzidzai_mobile/screens/exams/practice_exams_list.dart';
import 'package:dzidzai_mobile/screens/home/home.dart';
import 'package:dzidzai_mobile/screens/lessons/lessons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      'assets/images/home.svg',
      height: 44.h,
      width: 44.w,
    ),
    activeIcon: SvgPicture.asset(
      'assets/images/selected_home.svg',
      height: 44.h,
      width: 44.w,
    ),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      'assets/images/book.svg',
      height: 44.h,
      width: 44.w,
    ),
    activeIcon: SvgPicture.asset(
      'assets/images/selected_book.svg',
      height: 44.h,
      width: 44.w,
    ),
    label: 'Lessons'
  ),
  /*
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      'assets/images/performance.svg',
      height: 44.h,
      width: 44.w,
    ),
    activeIcon: SvgPicture.asset(
      'assets/images/selected_performance.svg',
      height: 44.h,
      width: 44.w,
    ),
    label: 'Metrics'
  ),
  */
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      'assets/images/evaluation.svg',
      height: 44.h,
      width: 44.w,
    ),
    activeIcon: SvgPicture.asset(
      'assets/images/selected_evaluation.svg',
      height: 44.h,
      width: 44.w,
    ),
    label: 'Exams'
  ),
  /*
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      'assets/images/settings.svg',
      height: 44.h,
      width: 44.w,
    ),
    activeIcon: SvgPicture.asset(
      'assets/images/selected_settings.svg',
      height: 44.h,
      width: 44.w,
    ),
    label: 'Settings'
  ),
  */
];

const List<Widget> bottomNavScreen = <Widget>[
  Home(),
  Lessons(),
  PracticeExams(),
];