import 'package:dzidzai_mobile/components/lessons/writing_card.dart';
import 'package:dzidzai_mobile/screens/lessons/grammar/grammar.dart';
import 'package:dzidzai_mobile/screens/lessons/reading/reading.dart';
import 'package:dzidzai_mobile/screens/lessons/writing/writing.dart';
import 'package:dzidzai_mobile/services/sqflite/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Lessons extends StatelessWidget {
  const Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, top: 20.w, right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Practice and Learn',
            style: TextStyle(
              fontFamily: 'Baloo 2',
              fontSize: 40.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 0.h),
          FutureBuilder<List<double>>(
            future: Future.wait([
              Provider.of<DatabaseService>(context, listen: false)
                  .calculateOverallGrammarProgress(),
              Provider.of<DatabaseService>(context, listen: false)
                  .calculateOverallReadingProgress(),
              Provider.of<DatabaseService>(context, listen: false)
                  .calculateOverallWritingProgress(),
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Error calculating progress'));
              }

              final progressValues = snapshot.data ?? [0.0, 0.0, 0.0];
              final grammarProgress = progressValues[0];
              final readingProgress = progressValues[1];
              final writingProgress = progressValues[2];

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WritingCard(
                        text: 'Grammar',
                        icon: 'assets/images/grammar.png',
                        progress: grammarProgress,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Grammar(),
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      WritingCard(
                        text: 'Comprehension',
                        icon: 'assets/images/reading.png',
                        progress: readingProgress,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Reading(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WritingCard(
                        text: 'Writing',
                        icon: 'assets/images/writing.png',
                        progress: writingProgress,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Writing(),
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      WritingCard(
                        text: 'Summary',
                        icon: 'assets/images/reading.png',
                        progress: readingProgress, // Assuming summary falls under reading progress
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Reading(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
