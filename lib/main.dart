import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:todos_application/data/models/todo.dart';
// import 'package:todos_application/locator/get_it_locator.dart';
// import 'package:todos_application/data/datasources/local/hive_datasources.dart';

import 'app.dart';
// import 'locator/get_it_locator.dart';
import 'presentation/blocs/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr_TR', null);
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');
  // await ServiceLocator.setup();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const App(),
    ),
  );
}
