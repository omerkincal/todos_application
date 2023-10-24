import 'package:hive/hive.dart';

class HiveDataSource {
  Future<void> saveData(String key, dynamic data) async {
    final box = await Hive.openBox('myBox');
    await box.put(key, data);
  }

  Future<dynamic> getData(String key) async {
    final box = await Hive.openBox('myBox');
    return box.get(key);
  }
}
