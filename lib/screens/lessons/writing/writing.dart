import 'package:dzidzai_mobile/components/lessons/writing_card.dart';
import 'package:dzidzai_mobile/data/writing/free_composition_practice.dart';
import 'package:dzidzai_mobile/screens/lessons/reading/practice_tiles.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Writing extends StatelessWidget {
  const Writing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'Writing and Compositions',
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
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'The ZIMSEC Syllabus for English Language expects students to be able to write compositions on various topics in the different categories below:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Baloo 2',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Free Compositions',
                      style: TextStyle(
                        fontFamily: 'Baloo 2',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WritingCard(
                        text: "Narrative",
                        icon: "assets/images/reading.png",
                        progress: 10,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'Narrative',
                                exercises: narrativeCompositionQuestions,
                              ),
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      WritingCard(
                        text: "Descriptive",
                        icon: "assets/images/reading.png",
                        progress: 40,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'Descriptive',
                                exercises: narrativeCompositionQuestions,
                              ),
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
                        text: "Informative",
                        icon: "assets/images/reading.png",
                        progress: 20,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'Informative',
                                exercises: narrativeCompositionQuestions,
                              ),
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      WritingCard(
                        text: "Argumentative",
                        icon: "assets/images/reading.png",
                        progress: 30,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'Argumentative',
                                exercises: narrativeCompositionQuestions,
                              ),
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
                        text: "Discursive",
                        icon: "assets/images/reading.png",
                        progress: 10,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'Discursive',
                                exercises: narrativeCompositionQuestions,
                              ),
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      WritingCard(
                        text: "Creative",
                        icon: "assets/images/reading.png",
                        progress: 100,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'Creative',
                                exercises: narrativeCompositionQuestions,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Guided Compositions',
                      style: TextStyle(
                        fontFamily: 'Baloo 2',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WritingCard(
                        text: "Memos",
                        icon: "assets/images/reading.png",
                        progress: 20,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'Memos',
                                exercises: narrativeCompositionQuestions,
                              ),
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      WritingCard(
                        text: "Letters",
                        icon: "assets/images/reading.png",
                        progress: 10,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'Letters',
                                exercises: narrativeCompositionQuestions,
                              ),
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
                        text: "Articles",
                        icon: "assets/images/reading.png",
                        progress: 10,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'Articles',
                                exercises: narrativeCompositionQuestions,
                              ),
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      WritingCard(
                        text: "CV",
                        icon: "assets/images/reading.png",
                        progress: 70,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'CV',
                                exercises: narrativeCompositionQuestions,
                              ),
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
                        text: "Reports",
                        icon: "assets/images/reading.png",
                        progress: 30,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'Reports',
                                exercises: narrativeCompositionQuestions,
                              ),
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      WritingCard(
                        text: "Speeches",
                        icon: "assets/images/reading.png",
                        progress: 50,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PracticeTiles(
                                title: 'Speeches',
                                exercises: narrativeCompositionQuestions,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
