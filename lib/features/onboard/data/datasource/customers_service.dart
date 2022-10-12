import 'package:flutter/foundation.dart';
import 'package:mt_app/features/onboard/data/datasource/app_database.dart';

import 'package:sqflite/sqflite.dart';

import '../model/app_customer.dart';


class CustomersService {
  final AppDatabase appDatabase;

  CustomersService({required this.appDatabase});

  Future<AppCustomer> insert(AppCustomer model) async {
    final db = await appDatabase.database;
    final int insertedId = await db.insert(cTableName, model.toMap());
    model.id = insertedId;
    return model;
  }

  Future<AppCustomer?> findById(int id) async {
    final db = await appDatabase.database;
    List<Map<String, dynamic>> maps = await db.query(cTableName,
        where: '$cColumnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return AppCustomer.fromMap(maps.first);
    }
    return null;
  }

  Future<List<AppCustomer>> findAll() async {
    List<AppCustomer> modelsList = [];

    try {
      final db = await appDatabase.database;
      List<Map<String, Object?>> listMap = await db.query(
        cTableName,
        orderBy: "$cColumnId DESC",
      );
      modelsList = listMap.map((modelMap) {
        return AppCustomer.fromMap(modelMap);
      }).toList();
    } catch (e, stackTrace) {
      debugPrint('$e\n$stackTrace');
    }

    return modelsList;
  }

  Future<List<AppCustomer>> findAllByPage(
      {int page = 0, int pageLimit = 15}) async {
    final db = await appDatabase.database;
    List<Map<String, Object?>> listMap = await db.query(cTableName,
        orderBy: "$cColumnId DESC",
        offset: page * pageLimit,
        limit: pageLimit);

    List<AppCustomer> modelsList = [];
    modelsList = listMap.map((modelMap) {
      return AppCustomer.fromMap(modelMap);
    }).toList();

    return modelsList;
  }

  Future<int> delete(int id) async {
    final db = await appDatabase.database;
    return db.delete(cTableName, where: '$cColumnId = ?', whereArgs: [id]);
  }
  Future<int> count() async {
    final db = await appDatabase.database;
    int count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $cTableName'))??0;
    return count;
  }
  Future<int> update(AppCustomer model) async {
    final db = await appDatabase.database;
    return db.update(cTableName, model.toMap(),
        where: '$cColumnId = ?', whereArgs: [model.id]);
  }

  Future<void> close() async {
    final db = await appDatabase.database;
    db.close();
  }
}
