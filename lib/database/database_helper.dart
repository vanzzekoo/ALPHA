import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/driver.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    var documentsDirectory = await getDatabasesPath();
    var path = join(documentsDirectory, 'gojek.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE drivers (
        id INTEGER PRIMARY KEY,
        name TEXT,
        ktp TEXT,
        password TEXT
      )
    ''');
  }

  Future<void> insertDriver(Driver driver) async {
    var db = await database;
    await db.insert('drivers', driver.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Driver?> getDriver({required int id}) async {
    var db = await database;
    var maps = await db.query('drivers', where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Driver.fromMap(maps.first);
    }
    return null;
  }

  Future<void> updateDriver(Driver driver) async {
    var db = await database;
    await db.update(
      'drivers',
      driver.toMap(),
      where: 'id = ?',
      whereArgs: [driver.id],
    );
  }

  // Add more methods for updating, deleting, and querying as needed
}
