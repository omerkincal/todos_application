// domain/entities/todo_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';

@freezed
class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    required int id,
    required String title,
    required String description,
    required bool isCompleted,
    required int priority,
    required DateTime dueDate,
  }) = _TodoEntity;
}
