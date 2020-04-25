import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:getting_started/model/todo.dart';

class DbHelper {

  static final DbHelper _dbHelper = DbHelper._internal();
  
  String tblTodo = "todo";

  String colId = "id";

  String colTitle = "title";

  String colDesc = "desc";

  String colPriority = "priority";

  String colDate = "date";

  DbHelper._internal();

  factory DbHelper() => _dbHelper;

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }

    return _db;
  }

  Future<Database> initializeDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "todo.db";
    var dbTodo = await openDatabase(path, version: 1, onCreate: _createDb);

    return dbTodo;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $tblTodo($colId INTEGER PRIMARY KEY, $colTitle TEXT, " 
      + "$colDesc TEXT, $colPriority INTEGER, $colDate TEXT)"
    );
  }
}