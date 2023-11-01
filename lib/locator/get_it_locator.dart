import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todos_application/data/datasources/local/hive_datasources.dart';

class ServiceLocator {
  static final locator = GetIt.instance;

  static Future<void> setup() async {
    await Hive.initFlutter();
    await Hive.openBox('todoBox');
    locator.registerLazySingleton<HiveDataSource>(() => HiveDataSource());
  }
}
