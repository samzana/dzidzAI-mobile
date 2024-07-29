import 'package:dzidzai_mobile/components/lessons/writing_card.dart';
import 'package:dzidzai_mobile/data/grammar/adjectives.dart';
import 'package:dzidzai_mobile/data/grammar/adverbs.dart';
import 'package:dzidzai_mobile/data/grammar/direct_and_indirect_speech.dart';
import 'package:dzidzai_mobile/data/grammar/nouns.dart';
import 'package:dzidzai_mobile/data/grammar/pronouns.dart';
import 'package:dzidzai_mobile/data/grammar/sentence_construction.dart';
import 'package:dzidzai_mobile/data/grammar/verbs.dart';
import 'package:dzidzai_mobile/data/grammar/word_formation.dart';
import 'package:dzidzai_mobile/screens/lessons/grammar/grammar_exercise.dart';
import 'package:dzidzai_mobile/services/sqflite/database_service.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:dzidzai_mobile/utils/get_total_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Grammar extends StatelessWidget {
  const Grammar({super.key});

  Future<Map<String, double>> _getProgress(DatabaseService databaseProvider) async {
    final sections = [
      'Nouns',
      'Verbs',
      'Adjectives',
      'Adverbs',
      'Pronouns',
      'Word Formation',
      'Sentence Construction',
      'Direct and Indirect Speech'
    ];
    
    final progressMap = <String, double>{};

    for (var section in sections) {
      final totalQuestions = getTotalQuestionsForSection(section);
      final progress = await databaseProvider.calculateProgress(section, totalQuestions);
      progressMap[section] = progress;
    }

    return progressMap;
  }


  @override
  Widget build(BuildContext context) {
    final databaseProvider = Provider.of<DatabaseService>(context, listen: false);

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
      body: FutureBuilder<Map<String, double>>(
        future: _getProgress(databaseProvider),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final progress = snapshot.data ?? {};

            return Container(
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
                            progress: progress['Nouns'] ?? 0,
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
                            progress: progress['Verbs'] ?? 0,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GrammarExercise(
                                    title: 'Verbs',
                                    questions: verbQuestions,
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
                            text: "Adjectives",
                            icon: "assets/images/grammar.png",
                            progress: progress['Adjectives'] ?? 0,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GrammarExercise(
                                    title: 'Adjectives',
                                    questions: adjectiveQuestions,
                                  ),
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                          WritingCard(
                            text: "Adverbs",
                            icon: "assets/images/grammar.png",
                            progress: progress['Adverbs'] ?? 0,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GrammarExercise(
                                    title: 'Adverbs',
                                    questions: adverbQuestions,
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
                            text: "Pronouns",
                            icon: "assets/images/grammar.png",
                            progress: progress['Pronouns'] ?? 0,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GrammarExercise(
                                    title: 'Pronouns',
                                    questions: pronounQuestions,
                                  ),
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                          WritingCard(
                            text: "Word Formation",
                            icon: "assets/images/grammar.png",
                            progress: progress['Word Formation'] ?? 0,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GrammarExercise(
                                    title: 'Word Formation',
                                    questions: wordFormationQuestions,
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
                            text: "Sentence Construction",
                            icon: "assets/images/grammar.png",
                            progress: progress['Sentence Construction'] ?? 0,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GrammarExercise(
                                    title: 'Sentence Construction',
                                    questions: sentenceConstructionQuestions,
                                  ),
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                          WritingCard(
                            text: "Direct and Indirect Speech",
                            icon: "assets/images/grammar.png",
                            progress: progress['Direct and Indirect Speech'] ?? 0,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GrammarExercise(
                                    title: 'Direct and Indirect Speech',
                                    questions: directIndirectSpeechQuestions,
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
            );
          }
        },
      ),
    );
  }
}


 