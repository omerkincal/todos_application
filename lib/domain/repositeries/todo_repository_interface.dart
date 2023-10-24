import '../entites/todo_entity.dart';

abstract class TodoRepositoryInterface {
  Future<void> saveTodo(TodoEntity todo);
  Future<TodoEntity?> getTodoById(String uuid);
  Future<String?> deleteTodo(String uuid);
}
