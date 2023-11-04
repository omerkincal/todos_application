import 'package:hive/hive.dart';
import '/data/models/todo.dart';

class Boxes {
  static Box<Todo> getTodos() => Hive.box<Todo>('todos');
}
