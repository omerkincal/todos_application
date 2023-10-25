import 'package:todos_application/data/datasources/local/hive_datasources.dart';
import 'package:todos_application/data/models/todo.dart';

import '../../domain/entites/todo_entity.dart';
import '../../domain/repositeries/todo_repository_interface.dart';

class TodoRepository implements TodoRepositoryInterface {
  final HiveDataSource _hiveDataSource;

  TodoRepository(this._hiveDataSource);

  @override
  Future<void> saveTodo(TodoEntity todo) async {
    final todoModel = Todo(
      uuid: todo.uuid,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
      priority: todo.priority,
      dueDate: todo.dueDate,
    );
    await _hiveDataSource.saveData(todo.uuid, todoModel);
  }

  @override
  Future<TodoEntity?> getTodoById(String uuid) async {
    final dynamic data = await _hiveDataSource.getData(uuid);
    if (data != null) {
      return TodoEntity(
        uuid: data.uuid,
        title: data.title,
        description: data.description,
        isCompleted: data.isCompleted,
        priority: data.priority,
        dueDate: data.dueDate,
      );
    }
    return null;
  }

  @override
  Future<String?> deleteTodo(String uuid) async {
    try {
      await _hiveDataSource.deleteData(uuid);
      return 'Todo deleted successfully';
    } catch (e) {
      return 'Error deleting todo: $e';
    }
  }
}




// class TodoRepository {
//   final HiveDataSource _hiveDataSource;

//   TodoRepository(this._hiveDataSource);

//   Future<void> saveTodo(Todo todo) async {
//     await _hiveDataSource.saveData(todo.uuid, todo);
//   }

//   Future<Todo?> getTodoById(String uuid) async {
//     final dynamic data = await _hiveDataSource.getData(uuid);
//     return data as Todo?;
//   }

//   Future<String?> deleteTodoById(String uuid) async {
//     var message = await _hiveDataSource.deleteData(uuid);
//     return message;
//   }
// }
