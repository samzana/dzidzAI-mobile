import 'package:dio/dio.dart';
import 'package:dzidzai_mobile/models/api/grade_reading_request.dart';
import 'package:dzidzai_mobile/models/api/grade_reading_response.dart';

class GradingApiService {
  final Dio _dio = Dio();
  final String baseUrl =
      'https://dzidzai-bafc41fca692.herokuapp.com'; 

  Future<GradeReadingResponse> gradeReading(GradeReadingRequest request) async {
    try {
      final response = await _dio.post(
        '$baseUrl/reading/grade',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return GradeReadingResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to grade reading');
      }
    } on DioException catch (e) {
      throw Exception('Failed to grade reading: ${e.message}');
    }
  }
}
