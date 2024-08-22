import 'package:dio/dio.dart';
import 'package:dzidzai_mobile/models/api/grade_reading_request.dart';
import 'package:dzidzai_mobile/models/api/grade_reading_response.dart';
import 'package:dzidzai_mobile/models/api/grade_summary_request.dart';

class GradingApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://dzidzai-bafc41fca692.herokuapp.com'; 

  Future<T> _gradeContent<T>(
    String endpoint,
    Map<String, dynamic> requestData,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await _dio.post(
        '$baseUrl/$endpoint',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: requestData,
      );

      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else {
        throw Exception('Failed to grade content');
      }
    } on DioException catch (e) {
      throw Exception('Failed to grade content: ${e.message}');
    }
  }

  Future<GradeReadingResponse> gradeReading(GradeReadingRequest request) {
    return _gradeContent(
      'reading/grade',
      request.toJson(),
      GradeReadingResponse.fromJson,
    );
  }

  Future<GradeReadingResponse> gradeSummary(GradeSummaryRequest request) {
    return _gradeContent(
      'reading/summary',
      request.toJson(),
      GradeReadingResponse.fromJson,
    );
  }
}

