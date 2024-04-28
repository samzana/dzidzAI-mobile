import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Dzidz',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontFamily: 'Baloo 2',
                  color: black,
                  fontSize: 62.sp,
                  fontWeight: FontWeight.w800,
                ),
          ),
          TextSpan(
            text: 'AI',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontFamily: 'Baloo 2',
                  color: blue,
                  fontSize: 62.sp,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ],
      ),
    );
  }
}
