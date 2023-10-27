// presentation/controllers/todo_controller.dart
import 'package:flutter/widgets.dart';
import 'package:todos_application/data/datasources/local/hive_datasources.dart';

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
      [HiveDataSource? hiveDataSource] // Bu repository parametresi
      )
      : _getTodosUseCase = GetTodosUseCase(todoRepository),
        _saveTodoUseCase = SaveTodoUseCase(todoRepository);

  TodoEntity? _todo;

  TodoEntity? get todo => _todo;

  void getTodos() {
    _getTodosUseCase.execute();
    notifyListeners();
  }

  Future<void> saveTodo(TodoEntity todo) async {
    await _saveTodoUseCase.execute(todo);
    notifyListeners();
  }
}
