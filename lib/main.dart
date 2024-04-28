import 'package:dzidzai_mobile/screens/authentication/onboarding_one.dart';
import 'package:dzidzai_mobile/services/phone_auth/auth_cubit.dart';
import 'package:dzidzai_mobile/services/phone_auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(414, 896),
      child: BlocProvider(
          create: (context) => AuthCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home:
                BlocBuilder<AuthCubit, AuthState>(buildWhen: (previous, current) {
              return previous is AuthInitialState;
            }, builder: (context, state) {
              if (state is AuthLoggedInState) {
                return const OnboardingOne();
              } else {
                return const OnboardingOne();
              }
            }),
          )
        ),
    );
  }
}
