import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager/utilities/task.dart';

class TasksDatabase {
  static final TasksDatabase instance = TasksDatabase._init();

  static Database? _database;

  TasksDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    // final integerType = 'INTEGER NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableTasks (
    ${TasksFields.id} $idType,
    ${TasksFields.taskText} $textType,
    ${TasksFields.isComplete} $boolType,
    ${TasksFields.taskDueDateAndTime} $textType
    )
    ''');
  }

  Future<Task> create(Task task) async {
    final db = await instance.database;
    final id = await db.insert(tableTasks, task.toJson());
    return task.copy(id: id);
  }

  Future<Task> readTask(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableTasks,
      columns: TasksFields.values,
      where: '${TasksFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task.fromJson(maps.first);
    } else {
      throw Exception('ID $id not Found');
    }
  }

  Future<List<Task>> readAllTasks() async {
    final db = await instance.database;

    final orderBy = '${TasksFields.taskDueDateAndTime} ASC';
    // final result = await db.rawQuery('SELECT * FROM $tableTasks ORDER BY $orderBy');
    final result = await db.query(tableTasks, orderBy: orderBy);
    return result.map((json) => Task.fromJson(json)).toList();
  }

  Future<int> update(Task task) async {
    final db = await instance.database;

    return db.update(
      tableTasks,
      task.toJson(),
      where: '${TasksFields.id} = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableTasks,
      where: '${TasksFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
