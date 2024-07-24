import 'package:dzidzai_mobile/components/lessons/writing_card.dart';
import 'package:dzidzai_mobile/screens/lessons/grammar/grammar.dart';
import 'package:dzidzai_mobile/screens/lessons/reading/reading.dart';
import 'package:dzidzai_mobile/screens/lessons/writing/writing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lessons extends StatelessWidget {
  const Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, top: 50.w, right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
                'Practice and Learn',
                style: TextStyle(
                  fontFamily: 'Baloo 2',
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WritingCard(text: 'Grammar', icon: 'assets/images/grammar.png', progress: 30, onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Grammar(),
                ),
              );
              },),
              const Spacer(),
              WritingCard(text: 'Comprehension', icon: 'assets/images/reading.png', progress: 30, onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Reading(),
                ),
              );
              },),
            ],
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WritingCard(text: 'Writing', icon: 'assets/images/writing.png', progress: 30, onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Writing(),
                ),
              );
              },),
              const Spacer(),
              WritingCard(text: 'Summary', icon: 'assets/images/reading.png', progress: 30, onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Reading(),
                ),
              );
              },),
            ],
          ),
      ],),
    );
  }
}
