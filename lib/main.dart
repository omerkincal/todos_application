import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'locator/get_it_locator.dart';
import 'presentation/blocs/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr_TR', null);
  // await Hive.initFlutter();
  // Hive.registerAdapter(TodoAdapter());
  // await Hive.openBox<Todo>(BoxesEnum.todo_box.boxKey);
  await ServiceLocator.setup();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider()..getThemeMode(),
      child: const App(),
    ),
  );
}
