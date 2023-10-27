import 'package:hive_flutter/hive_flutter.dart';
import 'package:todos_application/data/models/todo.dart';

class HiveDataSource {
  List<Todo> toDoList = [];
  Todo todo1 = Todo(
      id: 1,
      title: "Alışveriş",
      description: "markete gitmeyi unutma",
      priority: 1,
      dueDate: DateTime.now());
  Todo todo2 = Todo(
      id: 1,
      title: "Spor",
      description: "spor yapmayı unutma",
      priority: 2,
      dueDate: DateTime.now());
  void createInitialData() {
    toDoList.add(todo1);
    toDoList.add(todo2);
  }

  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  void updateDatabase() {
    _myBox.put('TODOLIST', toDoList);
  }

  final _myBox = Hive.box('todoBox');
}
