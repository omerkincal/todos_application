import '../entites/todo_entity.dart';
import '../repositeries/todo_repository_interface.dart';

class SaveTodoUseCase {
  final TodoRepositoryInterface _repository;

  SaveTodoUseCase(this._repository);

  Future<void> execute(TodoEntity todo) async {
    await _repository.saveTodo(todo);
  }
}
