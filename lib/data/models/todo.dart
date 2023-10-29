import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@unfreezed
class Todo with _$Todo {
  factory Todo({
    required int id,
    required String title,
    required String description,
    required bool isCompleted,
    required int priority,
    required DateTime dueDate,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  // Todo getModelFromEntity({required TodoEntity entity}) {
  //   return Todo(
  //     id: entity.id,
  //     title: entity.title,
  //     description: entity.description,
  //     isCompleted: entity.isCompleted,
  //     priority: entity.priority,
  //     dueDate: entity.dueDate,
  //   );
  // }
}
