import 'package:dzidzai_mobile/components/landing_page.dart';
import 'package:dzidzai_mobile/providers/ai_api/grade_reading_provider.dart';
import 'package:dzidzai_mobile/providers/sqflite/database_provider.dart';
import 'package:dzidzai_mobile/services/phone_auth/auth_cubit.dart';
import 'package:dzidzai_mobile/services/phone_auth/auth_states.dart';
import 'package:dzidzai_mobile/services/sqflite/database_service.dart';
import 'package:dzidzai_mobile/services/tab_navigation/landing_page_bloc.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Initialize DatabaseService
  final databaseService = DatabaseService();
  await databaseService.init();

  runApp(MyApp(databaseService: databaseService));
}

class MyApp extends StatelessWidget {
  final DatabaseService databaseService;

  const MyApp({super.key, required this.databaseService});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      child: MultiBlocProvider(
        providers: [
          // Provide DatabaseService to the app
          Provider<DatabaseService>.value(
            value: databaseService,
          ),
          ChangeNotifierProvider(
            create: (_) => GradeReadingProvider(),
          ),
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
          BlocProvider(
            create: (context) => LandingPageBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: white,
            ),
          ),
          home: BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) {
              return previous is AuthInitialState;
            },
            builder: (context, state) {
              if (state is AuthLoggedInState) {
                return const LandingPage();
              } else {
                return const LandingPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
