import 'package:dzidzai_mobile/data/reading/comprehension_practice.dart';
import 'package:dzidzai_mobile/data/reading/summary_practice.dart';
import 'package:dzidzai_mobile/data/reading/vocabulary_practice.dart';
import 'package:dzidzai_mobile/data/writing/free_composition_practice.dart';
import 'package:dzidzai_mobile/data/writing/guided_composition_practice.dart';
import 'package:dzidzai_mobile/utils/get_total_questions.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  late Database _database;

  Future<void> init() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'dzidzai.db');
      _database =
          await openDatabase(path, version: 1, onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE GrammarProgress (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            subsection TEXT,
            questionIndex INTEGER,
            isCorrect INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE ReadingProgress (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            subsection TEXT,
            passage INTEGER,
            questionIndex INTEGER,
            isCorrect INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE SummaryProgress (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            summaryIndex INTEGER,
            studentResponse TEXT,
            grade INTEGER, 
            feedback TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE WritingProgress (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            freeOrGuided TEXT,
            subsection TEXT,
            compositionIndex INTEGER,
            studentResponse TEXT,
            grade INTEGER,
            feedback TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE ExamProgress (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            examType INTEGER,
            examIndex INTEGER,
            Score INTEGER
          )
        ''');
      });
    } catch (e) {
      print('Error initializing database: $e');
    }
  }

  Future<void> trackGrammarAnswer(
      String subsection, int questionIndex, bool isCorrect) async {
    final List<Map<String, dynamic>> existingEntries = await _database.query(
      'GrammarProgress',
      where: 'subsection = ? AND questionIndex = ?',
      whereArgs: [subsection, questionIndex],
    );

    if (existingEntries.isNotEmpty) {
      // Update existing entry
      await _database.update(
        'GrammarProgress',
        {
          'isCorrect': isCorrect ? 1 : 0,
        },
        where: 'subsection = ? AND questionIndex = ?',
        whereArgs: [subsection, questionIndex],
      );
    } else {
      // Insert new entry
      await _database.insert(
        'GrammarProgress',
        {
          'subsection': subsection,
          'questionIndex': questionIndex,
          'isCorrect': isCorrect ? 1 : 0,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<int>> fetchAnsweredGrammarQuestions(String subsection) async {
    final List<Map<String, dynamic>> maps = await _database.query(
        'GrammarProgress',
        where: 'subsection = ? AND (isCorrect IS NULL OR isCorrect = ?)',
        whereArgs: [subsection, 1]);

    return List.generate(maps.length, (i) {
      return maps[i]['questionIndex'];
    });
  }

  Future<double> calculateProgress(
      String subsection, int totalQuestions) async {
    final List<Map<String, dynamic>> results = await _database.query(
      'GrammarProgress',
      where: 'subsection = ?',
      whereArgs: [subsection],
    );

    int correctCount = results.where((row) => row['isCorrect'] == 1).length;

    return totalQuestions > 0 ? (correctCount / totalQuestions) * 100 : 0.0;
  }

  Future<int> getTotalAnsweredQuestions() async {
    final List<Map<String, dynamic>> results = await _database.query(
      'GrammarProgress',
      where: 'isCorrect = ?',
      whereArgs: [1],
    );

    return results.length;
  }

  Future<double> calculateOverallGrammarProgress() async {
    final int totalAnsweredQuestions = await getTotalAnsweredQuestions();
    final int totalQuestions = getTotalGrammarQuestions();

    if (totalQuestions == 0) return 0.0;

    return (totalAnsweredQuestions / totalQuestions) * 100;
  }

  Future<double> calculateComprehensionProgress(
      String subsection, int index) async {
    final List<Map<String, dynamic>> results = await _database.query(
      'ReadingProgress',
      where: 'subsection = ? AND passage = ? AND isCorrect = ?',
      whereArgs: [subsection, index, 1],
    );

    int correctAnswers = results.length;
    int totalQuestions = comprehensionQuestions[index].questions.length;

    if (totalQuestions == 0) {
      return 0.0;
    }

    return (correctAnswers / totalQuestions) * 100;
  }

  Future<void> trackComprehensionAnswer(
      String subsection, int passage, int questionIndex, bool isCorrect) async {
    final List<Map<String, dynamic>> existingEntries = await _database.query(
      'ReadingProgress',
      where: 'subsection = ? AND passage = ? AND questionIndex = ?',
      whereArgs: [subsection, passage, questionIndex],
    );

    if (existingEntries.isNotEmpty) {
      // Update existing entry
      await _database.update(
        'ReadingProgress',
        {
          'isCorrect': isCorrect ? 1 : 0,
        },
        where: 'subsection = ? AND passage = ? AND questionIndex = ?',
        whereArgs: [subsection, passage, questionIndex],
      );
    } else {
      // Insert new entry
      await _database.insert(
        'ReadingProgress',
        {
          'subsection': subsection,
          'passage': passage,
          'questionIndex': questionIndex,
          'isCorrect': isCorrect ? 1 : 0,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<double> calculateSummaryProgress(int summaryIndex) async {
    final List<Map<String, dynamic>> results = await _database.query(
      'SummaryProgress',
      columns: ['grade'],
      where: 'summaryIndex = ?',
      whereArgs: [summaryIndex],
    );

    if (results.isEmpty) {
      return 0.0;
    }

    int grade = results.first['grade'];

    return (grade / 20) * 100;
  }

  Future<void> trackSummaryAnswer(int summaryIndex, String studentResponse,
      int grade, String feedback) async {
    final List<Map<String, dynamic>> existingEntries = await _database.query(
      'SummaryProgress',
      where: 'summaryIndex = ?',
      whereArgs: [summaryIndex],
    );

    if (existingEntries.isNotEmpty) {
      // Update existing entry
      await _database.update(
        'SummaryProgress',
        {
          'studentResponse': studentResponse,
          'grade': grade,
          'feedback': feedback,
        },
        where: 'summaryIndex = ?',
        whereArgs: [summaryIndex],
      );
    } else {
      // Insert new entry
      await _database.insert(
        'SummaryProgress',
        {
          'summaryIndex': summaryIndex,
          'studentResponse': studentResponse,
          'grade': grade,
          'feedback': feedback,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<Map<String, dynamic>?> getSummaryProgress(int summaryIndex) async {
    final List<Map<String, dynamic>> existingEntries = await _database.query(
      'SummaryProgress',
      where: 'summaryIndex = ?',
      whereArgs: [summaryIndex],
    );

    if (existingEntries.isNotEmpty) {
      return existingEntries.first;
    } else {
      return null;
    }
  }

  Future<double> calculateOverallSummaryProgress() async {
    try {
      // Get the total number of unique summaries (distinct summaryIndex)
      final summaryCountResult = await _database.rawQuery(
          'SELECT COUNT(DISTINCT summaryIndex) AS count FROM SummaryProgress');
      final totalSummaries = Sqflite.firstIntValue(summaryCountResult) ?? 0;

      if (totalSummaries == 0) {
        return 0.0; // No summaries available
      }

      // Get the total sum of grades
      final gradeSumResult = await _database
          .rawQuery('SELECT SUM(grade) AS total FROM SummaryProgress');
      final totalGrades = Sqflite.firstIntValue(gradeSumResult) ?? 0;

      // Calculate overall progress
      final overallProgress = totalGrades / (20 * summaryQuestions.length);
      return overallProgress * 100.0;
    } catch (e) {
      return 0.0; // Return 0.0 in case of an error
    }
  }

  Future<double> calculateOverallReadingProgress() async {
    final List<Map<String, dynamic>> results = await _database.query(
      'ReadingProgress',
      columns: ['isCorrect'],
      where: 'isCorrect = ?',
      whereArgs: [1],
    );

    int correctCount = results.length;

    int totalComprehensionQuestions = comprehensionQuestions.fold(
        0,
        (sum, comprehensionPractice) =>
            sum + comprehensionPractice.questions.length);

    int totalVocabularyQuestions = vocabularyQuestions.fold(0,
        (sum, vocabularyPractice) => sum + vocabularyPractice.questions.length);

    int totalReadingQuestions =
        totalComprehensionQuestions + totalVocabularyQuestions;

    double readingProgress = totalReadingQuestions > 0
        ? (correctCount / totalReadingQuestions) * 100
        : 0.0;

    double summaryProgress = await calculateOverallSummaryProgress();

    return (readingProgress + summaryProgress) / 2;
  }

  Future<void> recordEssayResponse(
      String freeOrGuided,
      String subsection,
      int compositionIndex,
      String studentResponse,
      int grade,
      String feedback) async {
    final List<Map<String, dynamic>> existingEntries = await _database.query(
      'WritingProgress',
      where: 'freeOrGuided = ? AND subsection = ? AND compositionIndex = ?',
      whereArgs: [freeOrGuided, subsection, compositionIndex],
    );


    if (existingEntries.isNotEmpty) {
      await _database.update(
        'WritingProgress',
        {
          'studentResponse': studentResponse,
          'grade': grade,
          'feedback': feedback,
        },
        where: 'freeOrGuided = ? AND subsection = ? AND compositionIndex = ?',
        whereArgs: [freeOrGuided, subsection, compositionIndex],
      );
    } else {
      await _database.insert(
        'WritingProgress',
        {
          'freeOrGuided': freeOrGuided,
          'subsection': subsection,
          'compositionIndex': compositionIndex,
          'studentResponse': studentResponse,
          'grade': grade,
          'feedback': feedback,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<Map<String, dynamic>?> getPreviousEssaySubmission(
      String freeOrGuided, String subsection, int compositionIndex) async {
    final List<Map<String, dynamic>> existingEntries = await _database.query(
      'WritingProgress',
      where: 'freeOrGuided = ? AND subsection = ? AND compositionIndex = ?',
      whereArgs: [freeOrGuided, subsection, compositionIndex],
    );

    if (existingEntries.isNotEmpty) {
      return existingEntries.first;
    } else {
      return null;
    }
  }

  Future<double> getCompositionProgress(
      String freeOrGuided, String subsection, int compositionIndex) async {
    final List<Map<String, dynamic>> result = await _database.query(
      'WritingProgress',
      columns: ['grade'],
      where: 'freeOrGuided = ? AND subsection = ? AND compositionIndex = ?',
      whereArgs: [freeOrGuided, subsection, compositionIndex],
    );

    if (result.isEmpty) {
      return 0.0;
    }

    int grade = result.first['grade'];

    double progress;
    if (freeOrGuided == 'free') {
      progress = (grade / 30) * 100;
    } else if (freeOrGuided == 'guided') {
      progress = (grade / 20) * 100;
    } else {
      progress = 0.0;
    }
    return progress;
  }

  Future<double> getSubsectionProgress(
      String freeOrGuided, String subsection) async {
    final List<Map<String, dynamic>> results = await _database.query(
      'WritingProgress',
      columns: ['grade'],
      where: 'freeOrGuided = ? AND subsection = ?',
      whereArgs: [freeOrGuided, subsection],
    );

    if (results.isEmpty) {
      return 0.0;
    }

    int totalGrades =
        results.fold(0, (sum, row) => sum + (row['grade'] as int));

    int numberOfSubmissions = results.length;
    int totalPossibleGrades;

    if (freeOrGuided == 'free') {
      totalPossibleGrades = numberOfSubmissions * 30;
    } else if (freeOrGuided == 'guided') {
      totalPossibleGrades = numberOfSubmissions * 20;
    } else {
      return 0.0;
    }

    return (totalGrades / totalPossibleGrades) * 100;
  }

  Future<double> calculateOverallWritingProgress() async {
    final List<Map<String, dynamic>> freeResults = await _database.query(
      'WritingProgress',
      columns: ['grade'],
      where: 'freeOrGuided = ?',
      whereArgs: ['free'],
    );

    int totalFreeGrades =
        freeResults.fold(0, (sum, row) => sum + (row['grade'] as int));

    int totalFreeQuestions = narrativeCompositionQuestions.length +
        descriptiveCompositionQuestions.length +
        informativeCompositionQuestions.length +
        argumentativeCompositionQuestions.length +
        discursiveCompositionQuestions.length +
        creativeCompositionQuestions.length;
    int totalFreePossible = totalFreeQuestions * 30;

    final List<Map<String, dynamic>> guidedResults = await _database.query(
      'WritingProgress',
      columns: ['grade'],
      where: 'freeOrGuided = ?',
      whereArgs: ['guided'],
    );

    int totalGuidedGrades =
        guidedResults.fold(0, (sum, row) => sum + (row['grade'] as int));

    int totalGuidedQuestions = memosCompositionQuestions.length +
        lettersCompositionQuestions.length +
        articlesCompositionQuestions.length +
        cvCompositionQuestions.length +
        reportsCompositionQuestions.length +
        speechesCompositionQuestions.length;
    int totalGuidedPossible = totalGuidedQuestions * 20;

    double freeProgress = totalFreePossible > 0
        ? (totalFreeGrades / totalFreePossible) * 100
        : 0.0;
    double guidedProgress = totalGuidedPossible > 0
        ? (totalGuidedGrades / totalGuidedPossible) * 100
        : 0.0;

    return (freeProgress + guidedProgress) / 2;
  }

  Future<double> calculateOverallExamPracticeProgress(index) async {
    return 20.0;
  }

  Future<double> calculateExamPracticeProgress(paper, index) async {
    return 20.0;
  }
}
