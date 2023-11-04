// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'todo.freezed.dart';

import 'package:hive/hive.dart';

part 'todo.g.dart';

// @unfreezed
@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String description;
  @HiveField(3)
  late bool isCompleted = false;
  @HiveField(4)
  late int priority;
  @HiveField(5)
  late DateTime dueDate;

  // factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

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
