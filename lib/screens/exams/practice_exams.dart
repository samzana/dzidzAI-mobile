import 'package:dzidzai_mobile/components/lessons/reading_practice_tile.dart';
import 'package:dzidzai_mobile/components/lessons/writing_guidelines_tile.dart';
import 'package:dzidzai_mobile/data/final_exams/paper_one_practice.dart';
import 'package:dzidzai_mobile/services/sqflite/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PracticeExams extends StatelessWidget {
  const PracticeExams({super.key});

  Future<double> _calculateProgress(BuildContext context, int index) async {
    final progress = await Provider.of<DatabaseService>(context, listen: false)
        .calculateOverallExamPracticeProgress(index);
    return progress;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 12.w, top: 20.w, right: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Practice Exams',
              style: TextStyle(
                fontFamily: 'Baloo 2',
                fontSize: 40.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 0.h),
            Expanded(
                child: ListView.builder(
              itemCount: paperOneQuestions.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: WritingGuidelinesTile(
                      title: 'Exam Practice',
                      onPressed: () {},
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: FutureBuilder(
                      future: _calculateProgress(context, index-1),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        final progress = snapshot.data ?? 0.0;

                        return ReadingPracticeTile(
                          title: 'Practice Exam $index',
                          progress: progress,
                          onPressed: () {
                            
                          }
                        );
                      }),
                );
              },
            )),
          ],
        ));
  }
}
