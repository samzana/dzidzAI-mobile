import 'package:dzidzai_mobile/services/tab_navigation/landing_page_bloc.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullExam extends StatelessWidget {
  const FullExam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 190.w,
        height: 210.h,
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70.w, 
              height: 70.w, 
              decoration: const BoxDecoration(
                shape: BoxShape.circle, 
                color: lightBlue,
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/graded-exam.png'), 
                ),
              ),
            ),
            const Spacer(),
            Text(
              'Practice Full Exam',
              style: TextStyle(
                fontFamily: 'Baloo 2',
                color: white,
                fontSize: 23.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        BlocProvider.of<LandingPageBloc>(context).add(TabChange(tabIndex: 2));
      },
    );
  }
}
