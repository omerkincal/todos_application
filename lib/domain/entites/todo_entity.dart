// domain/entities/todo_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';

@freezed
class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    required String uuid,
    required String title,
    required String description,
    bool? isCompleted,
    required int priority,
    required DateTime dueDate,
  }) = _TodoEntity;
}
