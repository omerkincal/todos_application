import '../repositeries/todo_repository_interface.dart';

class GetTodosUseCase {
  final TodoRepositoryInterface _repository;

  GetTodosUseCase(this._repository);

  void execute() {
    return _repository.getTodos();
  }
}
