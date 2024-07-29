import 'package:dzidzai_mobile/data/grammar/adjectives.dart';
import 'package:dzidzai_mobile/data/reading/comprehension_practice.dart';
import 'package:dzidzai_mobile/data/reading/summary_practice.dart';
import 'package:dzidzai_mobile/models/exams/paper_two_practice.dart';

List<PaperTwoPracticeModel> paperTwoQuestions = [
  PaperTwoPracticeModel(
    comprehensionQuestions: comprehensionQuestions[0], 
    summaryQuestion: summaryQuestions[0], 
    grammarQuestions: adjectiveQuestions,
  ),
  PaperTwoPracticeModel(
    comprehensionQuestions: comprehensionQuestions[0], 
    summaryQuestion: summaryQuestions[0], 
    grammarQuestions: adjectiveQuestions,
  ), 
];
