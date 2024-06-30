import 'package:dzidzai_mobile/components/lessons/reading_card.dart';
import 'package:dzidzai_mobile/data/reading/comprehension_practice.dart';
import 'package:dzidzai_mobile/screens/lessons/reading/comprehension_practice.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reading extends StatelessWidget {
  const Reading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'Reading and Comprehension',
          style: TextStyle(
            fontFamily: 'Baloo 2',
            fontSize: 25.sp,
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'The ZIMSEC Syllabus for English Language expects students to be able to read passages, answer comprehension questions and write short summaries of the passages.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Baloo 2',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Comprehension',
                      style: TextStyle(
                        fontFamily: 'Baloo 2',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      ReadingCard(
                        color: blue,
                        wrapperColor: lightBlue,
                        text: "Comprehension Tips",
                        icon: "assets/images/wand.png",
                        onPressed: () {},
                      ),
                      const Spacer(),
                      ReadingCard(
                        color: orange,
                        wrapperColor: wrapperOrange,
                        text: "Comprehension Practice",
                        icon: "assets/images/reading.png",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ComprehensionPractice(
                                comprehensionPractice:
                                    comprehensionQuestions[0],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Vocabulary',
                      style: TextStyle(
                        fontFamily: 'Baloo 2',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      ReadingCard(
                        color: blue,
                        wrapperColor: lightBlue,
                        text: "Vocabulary Tips",
                        icon: "assets/images/wand.png",
                        onPressed: () {},
                      ),
                      const Spacer(),
                      ReadingCard(
                        color: orange,
                        wrapperColor: wrapperOrange,
                        text: "Vocabulary Practice",
                        icon: "assets/images/reading.png",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Summary',
                      style: TextStyle(
                        fontFamily: 'Baloo 2',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      ReadingCard(
                        color: blue,
                        wrapperColor: lightBlue,
                        text: "Summary      Tips",
                        icon: "assets/images/wand.png",
                        onPressed: () {},
                      ),
                      const Spacer(),
                      ReadingCard(
                        color: orange,
                        wrapperColor: wrapperOrange,
                        text: "Summary Practice",
                        icon: "assets/images/reading.png",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
