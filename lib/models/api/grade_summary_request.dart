class GradeSummaryRequest {
  final List<String> passage;
  final List<String> question;
  final String response;

  GradeSummaryRequest({
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
