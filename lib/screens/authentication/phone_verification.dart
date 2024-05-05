import 'package:dzidzai_mobile/components/authentication%20/auth_background_scaffold.dart';
import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/components/landing_page.dart';
import 'package:dzidzai_mobile/services/phone_auth/auth_cubit.dart';
import 'package:dzidzai_mobile/services/phone_auth/auth_states.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({
    super.key,
    required this.phoneNumber,
    required this.name,
    required this.password,
  });

  final String phoneNumber;
  final String name;
  final String password;

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      child: Padding(
        padding: EdgeInsets.only(
          top: 350.h,
          left: 17.w,
          right: 17.w,
        ),
        child: Column(
          children: [
            Text(
              'Enter the code sent to your phone',
              style: TextStyle(
                color: black,
                fontFamily: 'Baloo 2',
                fontSize: 41.sp,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            PinCodeTextField(
              controller: _codeController,
              pinBoxHeight: 68.h,
              pinBoxWidth: 53.w,
              pinBoxRadius: 3.r,
              maxLength: 6,
              pinBoxColor: grey,
              keyboardType: TextInputType.number,
              pinBoxBorderWidth: 0.w,
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: blue,
                    ),
                  );
                }
                return Column(
                  children: [
                    AppButton(
                      text: 'Confirm',
                      color: blue,
                      width: 380.w,
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).verifyOTP(
                          _codeController.text,
                          widget.name,
                          widget.phoneNumber,
                          widget.password,
                        );
                      },
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Enter new phone number',
                        style: TextStyle(
                          color: orange,
                          fontFamily: 'Baloo 2',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                );
              },
              listener: (context, state) {
                if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      duration: const Duration(seconds: 20),
                    ),
                  );
                } else if (state is AuthLoggedInState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LandingPage(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
