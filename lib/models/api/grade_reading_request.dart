class GradeReadingRequest {
  final List<String> passage;
  final String question;
  final String response;

  GradeReadingRequest({
    required this.passage,
    required this.question,
    required this.response,
  });

  Map<String, dynamic> toJson() {
    return {
      'passage': passage,
      'question': question,
      'response': response,
    };
  }
}
