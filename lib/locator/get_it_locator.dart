import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todos_application/data/datasources/local/hive_datasources.dart';
import 'package:todos_application/data/models/todo.dart';

class ServiceLocator {
  static final locator = GetIt.instance;

  static Future<void> setup() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoAdapter());

    await Hive.openBox<Todo>('todos');
    locator.registerLazySingleton<TodoAdapter>(() => TodoAdapter());
    locator.registerLazySingleton<HiveDatabaseService>(
        () => HiveDatabaseService());
  }
}
