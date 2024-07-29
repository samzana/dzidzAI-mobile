import 'package:dzidzai_mobile/services/sqflite/database_service.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  late DatabaseService _databaseService;

  // Initialize the database service
  void init(DatabaseService databaseService) {
    _databaseService = databaseService;
  }

  Future<void> trackGrammarAnswer(String subsection, int questionIndex, bool isCorrect) async {
    await _databaseService.trackGrammarAnswer(subsection, questionIndex, isCorrect);
  }

  Future<List<int>> fetchUnansweredGrammarQuestions(String subsection) async {
    return await _databaseService.fetchAnsweredGrammarQuestions(subsection);
  }

  Future<double> getProgress(String subsection, int totalQuestions) async {
    return await _databaseService.calculateProgress(subsection, totalQuestions);
  }
}


