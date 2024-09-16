import 'package:dzidzai_mobile/components/lessons/reading_practice_tile.dart';
import 'package:dzidzai_mobile/models/exams/paper_one_practice.dart';
import 'package:dzidzai_mobile/models/exams/paper_two_practice.dart';
import 'package:dzidzai_mobile/screens/exams/paper_one.dart';
import 'package:dzidzai_mobile/screens/exams/paper_two.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PracticeExam extends StatelessWidget {
  const PracticeExam({
    super.key,
    required this.index,
    required this.paperOne,
    required this.paperTwo,
  });

  final int index;
  final PaperOnePracticeModel paperOne;
  final PaperTwoPracticeModel paperTwo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'Practice Exam ${index + 1}',
          style: const TextStyle(
            fontFamily: 'Baloo 2',
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: white,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              children: [
                ReadingPracticeTile(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PaperOne(paper: paperOne);
                    }));
                  },
                  title: 'Paper One',
                  progress: 0,
                ),
                SizedBox(height: 40.h),
                ReadingPracticeTile(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PaperTwo(paper: paperTwo);
                    }));
                  },
                  title: 'Paper Two',
                  progress: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
