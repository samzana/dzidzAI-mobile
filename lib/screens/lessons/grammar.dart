import 'package:dzidzai_mobile/components/lessons/grammar_card.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Grammar extends StatelessWidget {
  const Grammar({
    super.key,
  });

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
                Wrap(
                  spacing: 12.h,
                  runSpacing: 20.h,
                  children: [
                    GrammarCard(title: "Nouns", icon: "assets/images/grammar.png", onTap: () {}),
                    GrammarCard(title: "Adjectives", icon: "assets/images/grammar.png", onTap: () {}),
                    GrammarCard(title: "Verbs", icon: "assets/images/grammar.png", onTap: () {}),
                    GrammarCard(title: "Pronouns", icon: "assets/images/grammar.png", onTap: () {}),
                    GrammarCard(title: "Adverbs", icon: "assets/images/grammar.png", onTap: () {}),
                    GrammarCard(title: "Spelling and Word Formation", icon: "assets/images/grammar.png", onTap: () {}),
                    GrammarCard(title: "Sentence Construction", icon: "assets/images/grammar.png", onTap: () {}),
                    GrammarCard(title: "Direct and Indirect Speech", icon: "assets/images/grammar.png", onTap: () {}),
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
