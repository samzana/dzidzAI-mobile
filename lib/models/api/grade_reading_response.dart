class GradeReadingResponse {
  final String grade;
  final String feedback;

  GradeReadingResponse({required this.grade, required this.feedback});

  factory GradeReadingResponse.fromJson(Map<String, dynamic> json) {
    return GradeReadingResponse(
      grade: json['grade'],
      feedback: json['feedback'],
    );
  }
}





