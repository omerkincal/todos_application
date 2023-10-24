import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

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
}
