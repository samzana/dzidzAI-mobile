import 'package:dzidzai_mobile/components/authentication%20/logo.dart';
import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/screens/authentication/main_auth_screen.dart';
import 'package:dzidzai_mobile/screens/authentication/onboarding_three.dart';
import 'package:dzidzai_mobile/screens/background_scaffold.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

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
          Logo(fontSize: 62.sp,),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 62.w),
            child: Text(
              'Our app uses AI augmented by ZIMSEC recommended study materials.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: black,
                fontFamily: 'Baloo 2',
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              bottom: 64.h,
            ),
            child: Row(
              children: [
                AppButton(
                  text: 'Skip',
                  color: black,
                  width: 147.w,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainAuthScreen(),
                      ),
                    );
                  },
                ),
                const Spacer(),
                AppButton(
                  text: 'Proceed',
                  color: blue,
                  width: 191.w,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingThree(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
