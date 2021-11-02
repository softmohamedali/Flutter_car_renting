import 'package:fisrtflutter/models/cars.dart';
import 'package:sqflite/sqflite.dart';

class CarsDataBase{
  CarsDataBase._();

  static final CarsDataBase db = CarsDataBase._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    Database _database = await openDatabase(
        "carsdb.db",
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
        CREATE TABLE cars (
        name TEXT NOT NULL,
        image TEXT NOT NULL,
        )
        ''');
        });
    return _database;
  }

  void insertCArs(Cars cars) async {
    Database _db = await database;
    await _db.insert(
      'cars',
      cars.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

}