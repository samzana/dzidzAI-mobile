import 'package:dzidzai_mobile/models/api/grade_free_composition_request.dart';
import 'package:dzidzai_mobile/models/api/grade_reading_request.dart';
import 'package:dzidzai_mobile/models/api/grade_reading_response.dart';
import 'package:dzidzai_mobile/models/api/grade_summary_request.dart';
import 'package:dzidzai_mobile/services/grading_services/api_service.dart';
import 'package:flutter/material.dart';

class GradeReadingProvider with ChangeNotifier {
  final GradingApiService apiService = GradingApiService();
  GradeReadingResponse? _response;
  String? _compositionFeedback; // Separate field for composition feedback
  bool _isLoading = false;

  GradeReadingResponse? get response => _response;
  String? get compositionFeedback => _compositionFeedback;
  bool get isLoading => _isLoading;

  Future<void> gradeReading(GradeReadingRequest request) async {
    _isLoading = true;
    notifyListeners();
    try {
      _response = await apiService.gradeReading(request);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> gradeSummary(GradeSummaryRequest request) async {
    _isLoading = true;
    notifyListeners();
    try {
      _response = await apiService.gradeSummary(request);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Updated method to handle string response
  Future<void> gradeFreeComposition(GradeFreeCompositionRequest request) async {
    _isLoading = true;
    notifyListeners();
    try {
      _compositionFeedback = await apiService.gradeFreeComposition(request);

    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
