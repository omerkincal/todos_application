import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todos_application/locator/get_it_locator.dart';
// import 'package:todos_application/data/datasources/local/hive_datasources.dart';

import 'app.dart';
// import 'locator/get_it_locator.dart';
import 'presentation/blocs/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await Hive.openBox('todoBox');
  await ServiceLocator.setup();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const App(),
    ),
  );
}
