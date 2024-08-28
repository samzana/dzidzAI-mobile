
/*
class ExamDatabaseService extends BaseDatabaseService {
  @override
  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ExamProgress (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        examType INTEGER,
        examIndex INTEGER,
        Score INTEGER, 
      )
    ''');
  }

  Future<double> calculateOverallExamProgress(index) async {
    return 0.0;
  }
}
*/
