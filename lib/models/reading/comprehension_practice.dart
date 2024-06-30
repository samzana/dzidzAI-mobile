import 'package:dzidzai_mobile/models/reading/comprehension_question.dart';

class ComprehensionPracticeModel {
  final String instructions;
  final List<String> passage;
  final List<ComprehensionQuestion> questions;

  ComprehensionPracticeModel({
    required this.instructions,
    required this.passage,
    required this.questions,
  });
}
