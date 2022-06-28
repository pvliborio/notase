import 'dart:async';
import 'dart:io';

import 'package:notase/models/LocalLanguage.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService db = DatabaseService();

  late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "DB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE LocalLanguage ("
          "uid TEXT PRIMARY KEY,"
          "actualLocale TEXT"
          ")");
    });
  }

  setLanguage(LocalLanguage localLanguage) async {
    final db = await database;
    //get the biggest id in the table
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into LocalLanguage (uid,actualLocale)"
        " VALUES (?,?)",
        [localLanguage.uid, localLanguage.actualLocale]);
    return raw;
  }

  updateLanguage(LocalLanguage localLanguage) async {
    final db = await database;
    var res = await db.update("LocalLanguage", localLanguage.toMap(),
        where: "uid = ?", whereArgs: [localLanguage.uid]);
    return res;
  }

  getLocale(String uid) async {
    final db = await database;
    var res =
        await db.query("LocalLanguage", where: "uid = ?", whereArgs: [uid]);
    return res.isNotEmpty ? LocalLanguage.fromJson(res.first) : null;
  }

  deleteLanguage(String uid) async {
    final db = await database;
    return db.delete("LocalLanguage", where: "uid = ?", whereArgs: [uid]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete from LocalLanguage");
  }
}
