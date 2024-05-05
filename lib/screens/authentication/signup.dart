import 'package:dzidzai_mobile/components/authentication%20/auth_background_scaffold.dart';
import 'package:dzidzai_mobile/components/authentication%20/text_form_field.dart';
import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/screens/authentication/login.dart';
import 'package:dzidzai_mobile/screens/authentication/phone_verification.dart';
import 'package:dzidzai_mobile/services/phone_auth/auth_cubit.dart';
import 'package:dzidzai_mobile/services/phone_auth/auth_states.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:dzidzai_mobile/utils/clean_phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      child: Form(
        key: _signupFormKey,
        child: Padding(
          padding: EdgeInsets.only(
            top: 150.h,
            left: 17.w,
            right: 17.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s get you set up',
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
                'your name',
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
              AuthTextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 21.h,
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
              AuthTextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone number cannot be empty';
                  } else if (value.length < 9) {
                    return 'Phone number must be at least 9 digits';
                  } else if (value.length > 10) {
                    return 'Phone number must be at most 10 digits';
                  } else if (!RegExp(r'^\+?\d+$').hasMatch(value.trim())) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
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
              AuthTextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot be empty';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 56.h,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthCodeSentState) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhoneVerification(
                          phoneNumber:
                              cleanPhoneNumber(_phoneController.text.trim()),
                          name: _nameController.text.trim(),
                          password: _passwordController.text.trim(),
                        ),
                      ),
                    );
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        duration: const Duration(seconds: 20),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: blue,
                      ),
                    );
                  }
                  return Center(
                    child: AppButton(
                      text: 'Sign Up',
                      color: blue,
                      width: 380.w,
                      onPressed: () {
                        if (_signupFormKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).sendOTP(
                            _phoneController.text,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill in all fields'),
                              duration: Duration(seconds: 20),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
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
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
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
