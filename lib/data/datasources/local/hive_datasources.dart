import 'package:hive_flutter/hive_flutter.dart';
import 'package:todos_application/data/models/todo.dart';

class HiveDataSource {
  List<dynamic> toDoList = [];
  Todo todo1 = Todo(
    id: 1,
    title: "Alışveriş",
    description: "markete gitmeyi unutma",
    isCompleted: false,
    priority: 1,
    dueDate: DateTime.now(),
  );

  Todo todo2 = Todo(
    id: 2,
    title: "Spor",
    description: "spor yapmayı unutma",
    isCompleted: false,
    priority: 2,
    dueDate: DateTime.now(),
  );

  // uygulama ilk çalıştığında gözükecek örnek todolar
  void createInitialData() {
    toDoList = [
      todo1,
      todo2,
    ];
  }

  // güncel todoları çek
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  // yeni todolar ekler veya var olan todoyu günceller
  void updateDatabase() {
    _myBox.put('TODOLIST', toDoList);
  }

  final _myBox = Hive.box('todoBox');
}
