import 'package:todos_application/data/datasources/local/hive_datasources.dart';
import 'package:todos_application/data/models/todo.dart';

import '../../domain/entites/todo_entity.dart';
import '../../domain/repositeries/todo_repository_interface.dart';

class TodoRepository implements TodoRepositoryInterface {
  final HiveDataSource _hiveDataSource = HiveDataSource();

// final todoModel = todo.getModelFromEntity();

  @override
  void saveTodo(TodoEntity todo) {
    final todoModel = Todo(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
      priority: todo.priority,
      dueDate: todo.dueDate,
    );
    _hiveDataSource.toDoList.add(todoModel);
    _hiveDataSource.updateDatabase();
  }

  @override
  void getTodos() {
    _hiveDataSource.loadData();
  }
}
