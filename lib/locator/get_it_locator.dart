import 'package:get_it/get_it.dart';

import '../data/datasources/local/hive_datasources.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<HiveDataSource>(() => HiveDataSource());
}
