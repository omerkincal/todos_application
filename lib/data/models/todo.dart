import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';


/// TODO -FB : Global olmasa daha iyi olur gibi
var uuid = Uuid().v4();

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String uuid,
    required String title,
    required String description,
    bool? isCompleted,
    required int priority,
    required DateTime dueDate,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);





  /// TODO -FB : Bir kaç yerde bunu kullandığını gördüm bu şekilde kullanman daha iyi olur heryerde entity to model yapmana gerek kalmaz

  Todo getModelFromEntity({TodoEntity entity}){
    return Todo(
       uuid: todo.uuid,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
      priority: todo.priority,
      dueDate: todo.dueDate,
    );
  }
}
