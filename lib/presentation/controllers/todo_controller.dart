// presentation/controllers/todo_controller.dart
import 'package:flutter/widgets.dart';

import '../../data/datasources/local/hive_datasources.dart';
import '../../data/repositories/todo_repository.dart';
import '../../domain/entites/todo_entity.dart';
import '../../domain/usecases/get_todo_by_id.dart';
import '../../domain/usecases/save_todo.dart';

class TodoController extends ChangeNotifier {
  final GetTodosUseCase _getTodosUseCase;
  final SaveTodoUseCase _saveTodoUseCase;

  // TodoController(
  //   this._getTodoByIdUseCase,
  //   this._saveTodoUseCase,
  //   this._deleteTodoUseCase,
  // );

  TodoController(TodoRepository todoRepository,
      [HiveDatabaseService? hiveDataSource] // Bu repository parametresi
      )
      : _getTodosUseCase = GetTodosUseCase(todoRepository),
        _saveTodoUseCase = SaveTodoUseCase(todoRepository);

  TodoEntity? _todo;

  TodoEntity? get todo => _todo;

  void getTodos() {
    return _getTodosUseCase.execute();
  }

  void saveTodo(TodoEntity todo) {
    return _saveTodoUseCase.execute(todo);
  }
}
