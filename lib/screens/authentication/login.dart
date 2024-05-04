import 'package:dzidzai_mobile/components/authentication%20/auth_background_scaffold.dart';
import 'package:dzidzai_mobile/components/authentication%20/text_form_field.dart';
import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/screens/authentication/signup.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      child: Form(
        child: Padding(
          padding: EdgeInsets.only(
            top: 200.h,
            left: 17.w,
            right: 17.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s get you back into your account',
                style: TextStyle(
                  color: black,
                  fontFamily: 'Baloo 2',
                  fontSize: 41.sp,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 37.h,
              ),
              Text(
                'your phone number',
                style: TextStyle(
                  color: darkGrey,
                  fontFamily: 'Baloo 2',
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 2.h,
              ),
              AuthTextFormField(controller: _phoneController, keyboardType: TextInputType.phone),
              SizedBox(
                height: 21.h,
              ),
              Text(
                'your password',
                style: TextStyle(
                  color: darkGrey,
                  fontFamily: 'Baloo 2',
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              AuthTextFormField(controller: _passwordController, keyboardType: TextInputType.visiblePassword),
              SizedBox(
                height: 0.h,
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {  },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: black,
                        fontFamily: 'Baloo 2',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: AppButton(
                  text: 'Login',
                  color: blue,
                  width: 380.w,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: black,
                      fontFamily: 'Baloo 2',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: orange,
                        fontFamily: 'Baloo 2',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
