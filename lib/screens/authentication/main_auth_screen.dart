import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/screens/authentication/login.dart';
import 'package:dzidzai_mobile/screens/authentication/signup.dart';
import 'package:dzidzai_mobile/screens/background_scaffold.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAuthScreen extends StatelessWidget {
  const MainAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 200.h,
              left: 19.w,
              right: 19.w,
            ),
            child: Text(
              'Begin your final exam prep',
              style: TextStyle(
                color: black,
                fontFamily: 'Baloo 2',
                fontSize: 41.sp,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 52.w),
            child: Text(
              'Begin your path towards gaining the knowledge and skills needed to tackle the exam with confidence',
              style: TextStyle(
                color: darkGrey,
                fontFamily: 'Baloo 2',
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 69.h,
          ),
          Center(
            child: AppButton(
              text: 'Sign Up',
              color: black,
              width: 380.w,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Center(
            child: AppButton(
              text: 'Login',
              color: blue,
              width: 380.w,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 34.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Column(children: [
              Text(
                'By continuing, you agree to DzidzAi\'s',
                style: TextStyle(
                  color: black,
                  fontFamily: 'Baloo 2',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Terms of Service',
                      style: TextStyle(
                        color: orange,
                        fontFamily: 'Baloo 2',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    ' and ',
                    style: TextStyle(
                      color: black,
                      fontFamily: 'Baloo 2',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: orange,
                        fontFamily: 'Baloo 2',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
