import 'package:hive/hive.dart';
import 'package:todos_application/core/enums/hive_box.dart';
import '/data/models/todo.dart';

class Boxes {
  static Box<Todo> getTodos() => Hive.box<Todo>(BoxesEnum.todo_box.boxKey);
}
