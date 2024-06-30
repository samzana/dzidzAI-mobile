class SummaryPracticeModel {
  final String instructions;
  final List<String> passage;
  final List<String> questions;
  final String beginningWords;

  SummaryPracticeModel({
    required this.instructions,
    required this.passage,
    required this.questions,
    required this.beginningWords,
  });
}
