import 'package:fisrtflutter/models/cars.dart';
import 'package:get/get.dart';
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
        id INTEGER PRIMARYKEY AUTO GENRATE,
        name TEXT ,
        model TEXT ,
        img TEXT ,
        numHorse TEXT ,
        numHand TEXT ,
        motorSize TEXT ,
        numKiloMeter TEXT ,
        color TEXT ,
        gerType TEXT ,
        carStstus TEXT ,
        fuelType TEXT ,
        location TEXT ,
        paymType TEXT ,
        certificExsit TEXT ,
        certificEnd TEXT ,
        phone TEXT ,
        note TEXT,
        price TEXT,
        userId TEXT)
        ''');
        });
    return _database;
  }

  insertCArs(Cars cars) async {
    Database _db = await database;
    await _db.insert(
      'cars',
      cars.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  delelteFav(Cars car) async{
    Database _db = await database;
    await _db.delete('cars',where: 'userId = ?',whereArgs: [car.userId])
    .then((value) => {
      Get.snackbar("deletedd", "message")
    }).catchError((onError){
      Get.snackbar("error ${onError}", "message");
      print("error ${onError}");
    });

  }

  Future<List<Cars>> getAllCars() async{
    Database _db = await database;

    List<Map> list=await _db.query('cars',);

    return list.isNotEmpty ? list.map((e) => Cars.fromJson(e)).toList() : [];
  }



}