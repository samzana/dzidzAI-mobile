class CompositionTipsModel {
  final String description;
  final List<String> tips;
  final Example? example;

  CompositionTipsModel({
    required this.description,
    required this.tips,
    this.example,
  });
}

class Example {
  final String prompt;
  final List<String> points;

  Example({
    required this.prompt,
    required this.points,
  });
}