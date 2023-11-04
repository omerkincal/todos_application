import 'package:todos_application/data/datasources/local/todos.dart';
import 'package:todos_application/data/models/todo.dart';

class HiveDatabaseService {
  final _myBox = Boxes.getTodos();

  // güncel todoları çeker
  List<Todo> loadData() {
    return _myBox.values.toList().cast<Todo>();
  }

  // yeni todolar ekler veya var olan todoyu günceller
  void addNewTodo(Todo todo) {
    _myBox.add(todo);
  }

  void deleteTodo(Todo todo) {
    todo.delete();
  }
}
