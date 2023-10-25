import '../repositeries/todo_repository_interface.dart';

class DeleteTodoUseCase {
  final TodoRepositoryInterface _repository;

  DeleteTodoUseCase(this._repository);

  Future<String?> execute(String uuid) async {
    return await _repository.deleteTodo(uuid);
  }
}
