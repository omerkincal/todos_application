import 'package:hive/hive.dart';

final class HiveDataSource {
  Future<void> saveData(String key, dynamic data) async {
    final box = await Hive.openBox('todoBox');
    await box.put(key, data);
  }

  Future<dynamic> getData(String key) async {
    final box = await Hive.openBox('todoBox');
    return box.get(key);
  }

  Future<String> deleteData(String key) async {
    final box = await Hive.openBox('todoBox');
    String message = "";
    try {
      box.delete(key);
      message = "başarılı";
      return message;
    } catch (e) {
      message = e.toString();
      return message;
    }
  }
}
