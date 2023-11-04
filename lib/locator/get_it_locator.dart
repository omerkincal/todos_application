import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../core/services/hive_database_service.dart';
import '../data/models/todo.dart';
import '../core/enums/hive_box.dart';

// @immutable
final class ServiceLocator {
  static final locator = GetIt.instance;
  static Future<void> setup() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoAdapter());

    await Hive.openBox<Todo>(BoxesEnum.todo_box.boxKey);

    await Hive.openBox<bool>(BoxesEnum.theme_box.boxKey);

    locator.registerLazySingleton<TodoAdapter>(() => TodoAdapter());
    locator.registerLazySingleton<HiveDatabaseService>(
        () => HiveDatabaseService());
  }
}
