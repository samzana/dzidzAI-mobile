import 'package:dzidzai_mobile/components/lessons/grammar_card.dart';
import 'package:dzidzai_mobile/components/lessons/writing_card.dart';
import 'package:dzidzai_mobile/models/grammar_exercise.dart';
import 'package:dzidzai_mobile/screens/lessons/grammar_exercise.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Grammar extends StatelessWidget {
  Grammar({
    super.key,
  });

  var nounsQuestion = GrammarExerciseModel(
    type: "mcq",
    question: 'Which of the following words is a noun?',
    options: ['Cat', 'Quickly'],
    answer: 'Cat', 
    instructions: 'Choose the correct noun from the options below.',
    feedback: 'A noun is a word that names a person, place, thing, or idea.',
  );

  @override
  Widget build(BuildContext context) {
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
          /*
          image: DecorationImage(
            image: AssetImage('assets/images/background1.png'),
            fit: BoxFit.cover,
          ),
          */
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
                      icon: "assets/images/reading.png",
                      progress: 10,
                      onPressed: () {
                        //load nouns exercises
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GrammarExercise(
                              title: 'Nouns',
                              question: nounsQuestion,
                            ),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    WritingCard(
                      text: "Verbs",
                      icon: "assets/images/reading.png",
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
                      icon: "assets/images/reading.png",
                      progress: 20,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    WritingCard(
                      text: "Adverbs",
                      icon: "assets/images/reading.png",
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
                      icon: "assets/images/reading.png",
                      progress: 10,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    WritingCard(
                      text: "Word Formation",
                      icon: "assets/images/reading.png",
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
                      icon: "assets/images/reading.png",
                      progress: 10,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    WritingCard(
                      text: "Direct and Indirect Speech",
                      icon: "assets/images/reading.png",
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
