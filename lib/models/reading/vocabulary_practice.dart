import 'package:dzidzai_mobile/models/reading/comprehension_question.dart';

class VocabularyPracticeModel{
  final String readingInstructions;
  final List<String> passage;
  final String answeringInstructions;
  final List<ComprehensionQuestion> questions;

  VocabularyPracticeModel({
    required this.readingInstructions,
    required this.passage,
    required this.answeringInstructions,
    required this.questions,
  });
}