import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todos_application/core/enums/hive_box.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  final myThemeBox = Hive.box<bool>(BoxesEnum.theme_box.boxKey);
  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) async {
    await myThemeBox.put(BoxesEnum.theme_box.boxKey, mode == ThemeMode.dark);
    _themeMode = mode;
    notifyListeners();
  }

  void getThemeMode() {
    _themeMode = myThemeBox.get(BoxesEnum.theme_box.boxKey) == true
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
