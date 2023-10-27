import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/datasources/local/hive_datasources.dart';
import '../../../data/repositories/todo_repository.dart';
import '../../../domain/entites/todo_entity.dart';
import '../../../locator/get_it_locator.dart';
import '../../blocs/theme_provider.dart';
import '../../controllers/todo_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TodoController _todoController = TodoController(
    TodoRepository(),
    locator<HiveDataSource>(), // HiveDataSource'ı locator üzerinden al
  );

  @override
  void initState() {
    super.initState();
    _todoController = TodoController(
      TodoRepository(),
      locator<HiveDataSource>(),
    );
    _todoController.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ThemeMode newThemeMode =
                  Theme.of(context).brightness == Brightness.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
              Provider.of<ThemeProvider>(context, listen: false)
                  .setThemeMode(newThemeMode);
            },
            icon: const Icon(Icons.brightness_4_sharp),
          )
        ],
      ),
      body: Column(
        children: [
          // Todo listesini gösterir
          if (_todoController.todo != null)
            ListTile(
              title: Text(_todoController.todo!.title),
              subtitle: Text(_todoController.todo!.description),
            ),
          // Yeni bir todo eklemek için bir TextField ve bir button
          TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(labelText: 'Yeni Todo Başlığı'),
          ),
          ElevatedButton(
            onPressed: () {
              // Yeni todo eklemek için saveTodo metodunu kullanma
              _todoController.saveTodo(
                TodoEntity(
                  id: 1, // Yeni bir todo için örnek bir ID
                  title: 'Yeni Todo Başlığı',
                  description: 'Yeni Todo Açıklaması',
                  priority: 1,
                  dueDate: DateTime.now(),
                ),
              );
            },
            child: const Text('Yeni Todo Ekle'),
          ),
        ],
      ),
    );
  }
}
