enum GrammarExerciseType {
  mcq,
  rewriteSentence,
  multipleChoice,
}

class GrammarExerciseModel {
  final String type;
  final String instructions;
  final String question;
  final List<String>? options;
  final String answer;
  final String feedback;

  GrammarExerciseModel({
    required this.type,
    required this.instructions,
    required this.question,
    this.options,
    required this.answer,
    required this.feedback,
  });

  static GrammarExerciseType parseType(String type) {
    switch (type) {
      case 'mcq':
        return GrammarExerciseType.mcq;
      case 'fillInTheBlank':
        return GrammarExerciseType.rewriteSentence;
      default:
        throw Exception('Invalid type');
    }
  }

  String typeToString(GrammarExerciseType type) {
    switch (type) {
      case GrammarExerciseType.mcq:
        return 'mcq';
      case GrammarExerciseType.rewriteSentence:
        return 'fillInTheBlank';
      default:
        throw Exception('Invalid type');
    }
  }
}
