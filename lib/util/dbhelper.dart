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

  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;
    var result =  await db.insert(tblTodo, todo.toMap());
    
    return result;
  }

  Future<List> getTodos() async {
    Database db = await this.db;
    var result = await db.rawQuery("SELECT * FROM $tblTodo ORDER BY $colPriority ASC");

    return result;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
      await db.rawQuery("SELECT COUNT(*) FROM $tblTodo")
    );

    return result;
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.update(
      tblTodo, 
      todo.toMap(),
      where: "$colId = ?",
      whereArgs: [todo.id]
    );

    return result;
  }

  Future<int> deleteTodo(int id) async {
    Database db = await this.db;
    var result = db.rawDelete("DELETE FROM $tblTodo WHERE $colId=$id");

    return result;
  }
}