import '../entites/todo_entity.dart';

abstract class TodoRepositoryInterface {
  Future<void> saveTodo(TodoEntity todo);
  Future<void> getTodos();
}
