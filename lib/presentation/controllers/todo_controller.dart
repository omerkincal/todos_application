// presentation/controllers/todo_controller.dart
import 'package:flutter/widgets.dart';

import '../../domain/entites/todo_entity.dart';
import '../../domain/usecases/delete_todo.dart';
import '../../domain/usecases/get_todo_by_id.dart';
import '../../domain/usecases/save_todo.dart';

class TodoController extends ChangeNotifier {
  final GetTodoByIdUseCase _getTodoByIdUseCase;
  final SaveTodoUseCase _saveTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  TodoController(
    this._getTodoByIdUseCase,
    this._saveTodoUseCase,
    this._deleteTodoUseCase,
  );

  TodoEntity? _todo;

  TodoEntity? get todo => _todo;

  Future<void> getTodoById(String uuid) async {
    _todo = await _getTodoByIdUseCase.execute(uuid);
    notifyListeners();
  }

  Future<void> saveTodo(TodoEntity todo) async {
    await _saveTodoUseCase.execute(todo);
    notifyListeners();
  }

  Future<void> deleteTodo(String uuid) async {
    await _deleteTodoUseCase.execute(uuid);
    _todo = null;
    notifyListeners();
  }
}
