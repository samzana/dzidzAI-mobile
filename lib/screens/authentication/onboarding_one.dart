import 'package:dzidzai_mobile/components/authentication%20/logo.dart';
import 'package:dzidzai_mobile/screens/background_scaffold.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.h,
          ),
          const Image(
            image: AssetImage('assets/images/zimsec-logo.png'),
          ),
          SizedBox(
            height: 21.h,
          ),
          const Logo(),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 62.w),
            child: Text(
              'An AI powered app for your final exam preparation',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: black,
                fontFamily: 'Baloo 2',
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
