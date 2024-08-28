class GradeFreeCompositionRequest {
  final String prompt;
  final String type;
  final String response;

  GradeFreeCompositionRequest({
    required this.prompt,
    required this.type,
    required this.response,
  });

  Map<String, dynamic> toJson() {
    return {
      'prompt': prompt,
      'type': type,
      'response': response,
    };
  }
}
