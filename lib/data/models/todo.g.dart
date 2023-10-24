// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoImpl _$$TodoImplFromJson(Map<String, dynamic> json) => _$TodoImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      isCompleted: json['isCompleted'] as bool?,
      priority: json['priority'] as int,
      dueDate: DateTime.parse(json['dueDate'] as String),
    );

Map<String, dynamic> _$$TodoImplToJson(_$TodoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'priority': instance.priority,
      'dueDate': instance.dueDate.toIso8601String(),
    };
