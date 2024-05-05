import 'package:dzidzai_mobile/components/bottom_nav_items.dart';
import 'package:dzidzai_mobile/services/tab_navigation/landing_page_bloc.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: bottomNavScreen[state.tabIndex],
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: white,
              splashColor: transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: bottomNavItems,
              currentIndex: state.tabIndex,
              backgroundColor: white,
              selectedItemColor: black,
              selectedFontSize: 17.sp,
              selectedLabelStyle: const TextStyle(
                fontFamily: 'Baloo 2',
                fontWeight: FontWeight.w800,
              ),
              onTap: (index) {
                BlocProvider.of<LandingPageBloc>(context).add(TabChange(tabIndex: index));
              },
            ),
          ),
        );
      },
    );
  }
}
