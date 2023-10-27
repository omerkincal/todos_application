import '../entites/todo_entity.dart';




/// TODO -FB : dartz paketini inceleyebilirsin 
/// DataModel özelliği**  DataModel<Failure,RepsonseModel> 
abstract class TodoRepositoryInterface {
  Future<void> saveTodo(TodoEntity todo);
  Future<TodoEntity?> getTodoById(String uuid);
  Future<String?> deleteTodo(String uuid);
}
