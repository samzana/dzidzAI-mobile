import 'package:dzidzai_mobile/models/api/grade_reading_request.dart';
import 'package:dzidzai_mobile/models/api/grade_reading_response.dart';
import 'package:dzidzai_mobile/services/grading_services/api_service.dart';
import 'package:flutter/material.dart';

class GradeReadingProvider with ChangeNotifier {
  final GradingApiService apiService = GradingApiService();
  GradeReadingResponse? _response;
  bool _isLoading = false;

  GradeReadingResponse? get response => _response;
  bool get isLoading => _isLoading;

  Future<void> gradeReading(GradeReadingRequest request) async {
    _isLoading = true;
    notifyListeners();
    try {
      _response = await apiService.gradeReading(request);
    } catch (e) {
      // handle errors 
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
