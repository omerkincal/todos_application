import '../repositeries/todo_repository_interface.dart';

class DeleteTodo {
  final TodoRepositoryInterface _repository;

  DeleteTodo(this._repository);

  Future<String?> execute(String uuid) async {
    return await _repository.deleteTodo(uuid);
  }
}
