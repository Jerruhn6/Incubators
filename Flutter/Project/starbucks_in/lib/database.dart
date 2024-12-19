import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "profile.db";
  static const _databaseVersion = 1;

  static const table = 'user_profile';

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnPhone = 'phone';
  static const columnAddress = 'address';

  static Database? _database;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _databaseName);

    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnPhone TEXT NOT NULL,
        $columnAddress TEXT NOT NULL
      )
    ''');
  }

  // Insert or update user profile
  Future<int> insertOrUpdate(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert(table, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Fetch the user profile
  Future<Map<String, dynamic>?> getUserProfile() async {
    final db = await database;
    final result = await db.query(table, limit: 1);
    if (result.isNotEmpty) return result.first;
    return null;
  }
}
