import 'package:dzidzai_mobile/screens/background_scaffold.dart';
import 'package:dzidzai_mobile/screens/lessons/grammar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Grammar extends StatelessWidget {
  const Grammar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Grammar',
              style: TextStyle(
                fontFamily: 'Baloo 2',
                fontSize: 37.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'The ZIMSEC Syllabus for English Language expects students to have mastery of the following supporting language structures. Click on each to practice and master them through interactive exercises.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Baloo 2',
                fontSize: 22.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20.h),
            Wrap(
              spacing: 12.h,
              runSpacing: 20.h,
              children: [
                GrammarCard(title: "Nouns", icon: "assets/images/grammar.png", onTap: (){}),
                GrammarCard(title: "Verbs", icon: "assets/images/grammar.png", onTap: (){}),
                GrammarCard(title: "Pronouns", icon: "assets/images/grammar.png", onTap: (){}),
                GrammarCard(title: "Adjectives", icon: "assets/images/grammar.png", onTap: (){}),
                GrammarCard(title: "Adverbs", icon: "assets/images/grammar.png", onTap: (){}),
                GrammarCard(title: "Spelling and Word Formation", icon: "assets/images/grammar.png", onTap: (){}),
                GrammarCard(title: "Sentence Construction", icon: "assets/images/grammar.png", onTap: (){}),
                GrammarCard(title: "Direct and Indirect Speech", icon: "assets/images/grammar.png", onTap: (){}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
