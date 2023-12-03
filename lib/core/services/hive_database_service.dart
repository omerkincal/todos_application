import 'package:hive/hive.dart';
import 'package:todos_application/data/models/todo.dart';

class HiveDatabaseService {
  final Box<Todo>? _myBox;

  HiveDatabaseService({required Box<Todo>? myBox}) : _myBox = myBox;
  // güncel todoları çeker
  List<Todo> loadData() {
    return _myBox!.values.toList().cast<Todo>();
  }

  // yeni todolar ekler veya var olan todoyu günceller
  void addNewTodo(Todo todo) {
    _myBox!.add(todo);
  }

  void deleteTodo(Todo todo) {
    todo.delete();
  }
}
