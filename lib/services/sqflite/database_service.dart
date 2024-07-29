import 'package:dzidzai_mobile/utils/get_total_questions.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  late Database _database;

  Future<void> init() async {
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
    });
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

  Future<double> calculateComprehensionProgress(index) async {
    return 20.0;
  }

  Future<double> calculateVocabularyProgress(index) async {
    return 50.0;
  }

  Future<double> calculateSummaryProgress(index) async {
    return 30.0;
  }

  // Placeholder for reading progress calculation
  Future<double> calculateOverallReadingProgress() async {
    // Implement reading progress calculation here
    return 0.0;
  }

  // Placeholder for writing progress calculation
  Future<double> calculateOverallWritingProgress() async {
    // Implement writing progress calculation here
    return 0.0;
  }

  Future<double> calculateOverallExamPracticeProgress(index) async {
    return 20.0;
  }

  Future<double> calculateExamPracticeProgress(paper, index) async {
    return 20.0;
  }
}
