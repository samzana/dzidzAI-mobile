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

  Future<List<int>> fetchUnansweredGrammarQuestions(String subsection) async {
    final List<Map<String, dynamic>> maps = await _database.query(
        'GrammarProgress',
        where: 'subsection = ? AND (isCorrect IS NULL OR isCorrect = ?)',
        whereArgs: [subsection, 0]);

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
}
