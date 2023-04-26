import 'package:getx_todo_mvc/core/model/todo_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  String tableName = 'todo_table';

  String todoId = 'id';
  String todoTitle = 'title';
  String todoDescription = 'description';
  String todoDate = 'date';
  String todoStatus = 'status';
  String todoDeleted = 'isDeleted';
  String todoDone = 'isDone';
  String todoFavorite = 'isFavorite';
  String todoMillis = 'millis';

  static final DatabaseHelper _dbServices =
      DatabaseHelper._privateConstructor();

  factory DatabaseHelper() => _dbServices;

  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter for database

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    String directory = await getDatabasesPath();
    String path = '${directory}todos.db';

    // open/ create database at a given path
    var todosDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return todosDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''CREATE TABLE $tableName (
                  tid INTEGER  PRIMARY KEY,
                  $todoId TEXT,
                  $todoTitle TEXT ,
                  $todoDescription TEXT,
                  $todoDate TEXT,
                  $todoStatus TEXT,
                  $todoDeleted INTEGER,
                  $todoFavorite INTEGER,
                  $todoDone INTEGER,
                  $todoMillis INTEGER
                  )
    
    ''');
  }

// add  table
  Future<int> insertTodos(ModelTodo mdlTodo) async {
    Database db = await instance.database;
    int result = await db.insert(tableName, mdlTodo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  // read data from table
  Future<List<ModelTodo>> getAllTodos() async {
    List<ModelTodo> allTodos = [];

    Database db = await instance.database;

    List<Map<String, dynamic>> listMap = await db.query(tableName);

    for (var todo in listMap) {
      ModelTodo c = ModelTodo.fromJson(todo);
      allTodos.add(c);
    }

    return allTodos;
  }

  // read specific data from table

  Future<ModelTodo> getSingleTodos(String tid) async {

    Database db = await instance.database;

    List<Map<String, dynamic>> listMap = await db.query(tableName, where: '$todoId = ?', whereArgs: [tid]);

    ModelTodo todo = ModelTodo.fromJson(listMap.first);

    return todo;
  }


  // update data from table
  Future<bool> updateTodos(ModelTodo todo) async {
    bool isSuccess = false;

    Database db = await instance.database;

    await db
        .update(tableName, todo.toJson(),
        where: '$todoId=?', whereArgs: [todo.id])
        .whenComplete(() {
      isSuccess = true;
    });

    return isSuccess;
  }

  deleteAllTodos() async {
    Database db = await instance.database;
    db.delete(tableName, where: '$todoDeleted = ?', whereArgs: [1]);
  }
  deleteSingleTodos(String tid) async {
    Database db = await instance.database;
    db.delete(tableName, where: '$todoId = ?', whereArgs: [tid]);
  }
}


