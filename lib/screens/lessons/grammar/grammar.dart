import 'package:dzidzai_mobile/components/lessons/writing_card.dart';
import 'package:dzidzai_mobile/data/grammar/nouns.dart';
import 'package:dzidzai_mobile/providers/sqflite/database_provider.dart';
import 'package:dzidzai_mobile/screens/lessons/grammar/grammar_exercise.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Grammar extends StatelessWidget {
  const Grammar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
        
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'Grammar',
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
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Text(
                    'The ZIMSEC Syllabus for English Language expects students to have mastery of the following supporting language structures. Click on each card to practice them through interactive exercises.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Baloo 2',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WritingCard(
                      text: "Nouns",
                      icon: "assets/images/grammar.png",
                      progress: 10,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GrammarExercise(
                              title: 'Nouns',
                              questions: nounQuestions,
                            ),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    WritingCard(
                      text: "Verbs",
                      icon: "assets/images/grammar.png",
                      progress: 40,
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WritingCard(
                      text: "Adjectives",
                      icon: "assets/images/grammar.png",
                      progress: 20,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    WritingCard(
                      text: "Adverbs",
                      icon: "assets/images/grammar.png",
                      progress: 30,
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WritingCard(
                      text: "Pronouns",
                      icon: "assets/images/grammar.png",
                      progress: 10,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    WritingCard(
                      text: "Word Formation",
                      icon: "assets/images/grammar.png",
                      progress: 100,
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WritingCard(
                      text: "Sentence Construction",
                      icon: "assets/images/grammar.png",
                      progress: 10,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    WritingCard(
                      text: "Direct and Indirect Speech",
                      icon: "assets/images/grammar.png",
                      progress: 40,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
