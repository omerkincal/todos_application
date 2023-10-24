import 'package:todos_application/data/datasources/local/hive_datasources.dart';
import 'package:todos_application/data/models/todo.dart';

class TodoRepository {
  final HiveDataSource _hiveDataSource;

  TodoRepository(this._hiveDataSource);

  Future<void> saveTodo(Todo todo) async {
    await _hiveDataSource.saveData(todo.uuid, todo);
  }

  Future<Todo?> getTodoById(String uuid) async {
    final dynamic data = await _hiveDataSource.getData(uuid);
    return data as Todo?;
  }

  Future<String?> deleteTodoById(String uuid) async {
    var message = await _hiveDataSource.deleteData(uuid);
    return message;
  }
}
