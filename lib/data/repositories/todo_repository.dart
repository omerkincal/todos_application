import '../../domain/entites/todo_entity.dart';
import '../../domain/repositeries/todo_repository_interface.dart';
import '../datasources/local/hive_datasources.dart';
import '../models/todo.dart';

class TodoRepository implements TodoRepositoryInterface {
  final HiveDatabaseService _hiveDataSource = HiveDatabaseService();

// final todoModel = todo.getModelFromEntity();

  @override
  void saveTodo(TodoEntity todo) {
    final todoModel = Todo(
        // id: todo.id,
        // title: todo.title,
        // description: todo.description,
        // isCompleted: todo.isCompleted,
        // priority: todo.priority,
        // dueDate: todo.dueDate,
        );
    _hiveDataSource.addNewTodo(todoModel);
  }

  @override
  void getTodos() {
    _hiveDataSource.loadData();
  }
}
