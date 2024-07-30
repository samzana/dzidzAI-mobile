import 'package:dzidzai_mobile/models/grammar/grammar_exercise.dart';
import 'package:dzidzai_mobile/models/reading/comprehension_practice.dart';
import 'package:dzidzai_mobile/models/reading/summary_practice.dart';

class PaperTwoPracticeModel {
  final ComprehensionPracticeModel comprehensionQuestions;
  final ComprehensionPracticeModel vocabularyQuestions;
  final SummaryPracticeModel summaryQuestion;
  final List<GrammarExerciseModel> grammarQuestions;

  PaperTwoPracticeModel({
    required this.comprehensionQuestions,
    required this.vocabularyQuestions,
    required this.summaryQuestion,
    required this.grammarQuestions,
  });
}

