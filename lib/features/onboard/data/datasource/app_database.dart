import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String iCanCareDB = 'mt_app_data.db';

//c= Customers
const String cTableName = 'app_customers_v1';
const String cColumnId = 'id';
const String cColumnEMEI = 'emei';
const String cColumnFirstName = 'first_name';
const String cColumnLastName = 'last_name';
const String cColumnDob = 'dob';
const String cColumnPassport = 'passport';
const String cColumnEmail = 'email';
const String cColumnImagePath = 'image_path';
const String cColumnDeviceName = 'device_name';
const String cColumnLatitude = 'latitude';
const String cColumnLongitude = 'longitude';


class AppDatabase{

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      if(_database!.isOpen){
        return _database!;
      }
    }

    _database = await openDefaultDB();
    return _database!;
  }

  Future<Database> openDefaultDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath,iCanCareDB);
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          createTables(db);
         },
        onUpgrade: (Database db, int oldVersion, int newVersion){
          createTables(db);
        }
        );
  }

  void createTables(Database db) async{
    try{
      await db.execute(
          'CREATE TABLE $cTableName ($cColumnId INTEGER PRIMARY KEY, $cColumnEMEI TEXT, $cColumnFirstName TEXT, $cColumnLastName TEXT, $cColumnDob TEXT, $cColumnPassport TEXT, $cColumnEmail TEXT, $cColumnImagePath TEXT, $cColumnDeviceName TEXT, $cColumnLatitude TEXT, $cColumnLongitude TEXT)');

    }catch (e, stackTrace) {
      debugPrint('$e\n$stackTrace');
    }

  }
}