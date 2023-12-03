import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_application/data/datasources/local/todos.dart';

import 'presentation/blocs/theme_provider.dart';
import 'presentation/features/home/home_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'T O D O S',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        appBarTheme: const AppBarTheme(
          color: Colors.deepOrange,
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.black26,
          centerTitle: true,
        ),
      ),
      home: HomeView(todos: Boxes.getTodos()),
    );
  }
}
