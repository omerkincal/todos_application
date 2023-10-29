import '../entites/todo_entity.dart';
import '../repositeries/todo_repository_interface.dart';

class SaveTodoUseCase {
  final TodoRepositoryInterface _repository;

  SaveTodoUseCase(this._repository);

  void execute(TodoEntity todo) {
    return _repository.saveTodo(todo);
  }
}
