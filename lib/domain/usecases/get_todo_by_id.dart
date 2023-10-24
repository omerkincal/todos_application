import '../entites/todo_entity.dart';
import '../repositeries/todo_repository_interface.dart';

class GetTodoByIdUseCase {
  final TodoRepositoryInterface _repository;

  GetTodoByIdUseCase(this._repository);

  Future<TodoEntity?> execute(String uuid) async {
    return await _repository.getTodoById(uuid);
  }
}
