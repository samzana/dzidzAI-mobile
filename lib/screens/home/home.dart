import 'package:dzidzai_mobile/components/authentication%20/logo.dart';
import 'package:dzidzai_mobile/components/home/current_standing.dart';
import 'package:dzidzai_mobile/components/home/full_exam.dart';
import 'package:dzidzai_mobile/components/home/profile_avatar.dart';
import 'package:dzidzai_mobile/components/home/skill_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, top: 0.w, right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Logo(fontSize: 40.sp,),
              const Spacer(),
              const ProfileAvatar(),
            ],
          ),
          SizedBox(height: 5.h),
          const Row(
            children: [
              CurrentStanding(currentStanding: "A",),
              Spacer(),
              FullExam()
            ],
          ),
          SizedBox(height: 60.h),
          Text(
            'Continue Your Exam Preparation',
            style: TextStyle(
              fontFamily: 'Baloo 2',
              fontSize: 23.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 14.h),
          SkillButton(skill: "Grammar", onPressed: (){}, icon: 'assets/images/grammar.png', progress: 20),
          SizedBox(height: 30.h),
          SkillButton(skill: "Reading and Comprehension", onPressed: (){}, icon: 'assets/images/reading.png', progress: 40),
          SizedBox(height: 30.h),
          SkillButton(skill: "Writing and Compositions", onPressed: (){}, icon: 'assets/images/writing.png', progress: 60),
        ],
      ),
    );
  }
}
