import '../entites/todo_entity.dart';

abstract class TodoRepositoryInterface {
  void saveTodo(TodoEntity todo);
  void getTodos();
}
