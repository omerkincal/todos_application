import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todos_application/core/enums/hive_box.dart';
import 'package:todos_application/core/services/hive_database_service.dart';
import 'package:todos_application/data/datasources/local/todos.dart';

import '../../../data/models/todo.dart';
import '../../blocs/theme_provider.dart';
import '../components/my_button.dart';
import '../components/todo_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HiveDatabaseService _hiveDatabaseService = HiveDatabaseService();

  @override
  void dispose() {
    // Hive.close();
    Hive.box(BoxesEnum.todo_box.boxKey).clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text(
          'T O D O',
        ),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          showDialog(
            context: context,
            builder: (_) {
              return addNewTodo();
            },
          ); // Ya da DiologBox() widget'inizi burada çağırabilirsiniz.
        },
      ),
      body: ValueListenableBuilder<Box<Todo>>(
        valueListenable: Boxes.getTodos().listenable(),
        builder: (context, box, _) {
          final todos = box.values.toList().cast<Todo>();
          return buildContent(todos);
        },
      ),
    );
  }

  Widget addNewTodo() {
    DateTime selectedDate = DateTime.now();
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    // TextEditingController priorityController = TextEditingController();

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    void createNewTodo() {
      dynamic newTodo = Todo()
        ..id = 1
        ..description = descriptionController.text
        ..title = titleController.text
        ..dueDate = selectedDate
        ..priority = 1
        ..isCompleted = false;
      _hiveDatabaseService.addNewTodo(newTodo);
      Navigator.pop(context);
    }

    return AlertDialog(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      content: SizedBox(
        height: 500,
        width: 300,
        child: Column(
          children: [
            //get inputs from user
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "What do you have to do?",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              maxLines: null, // null kullanarak çoklu satır girişine izin verin
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Description',
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  DateFormat.yMMMMd('tr_TR').format(selectedDate),
                ),
                MyButton(
                  text: 'Son Tarih',
                  onPressed: () {
                    selectDate(context);
                  },
                ),
              ],
            ),

            //buttons save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                    text: "Save",
                    onPressed: () {
                      createNewTodo();
                    }),
                const SizedBox(width: 10),
                MyButton(
                  text: "Cancel",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildContent(List<Todo> todos) {
    return todos.isEmpty
        ? const Center(
            child: Text('Yapılacak iş kalmadı'),
          )
        : ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return Dismissible(
                //confirmDismiss: ,
                onDismissed: (direction) {
                  deleteTodo(todos[index]);
                },
                background: Container(
                  color: Theme.of(context).canvasColor,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.all(25),
                  child: const Icon(Icons.delete),
                ),
                key: UniqueKey(),
                child: ToDoTile(
                  taskName: todos[index].title,
                  isTaskCompleted: todos[index].isCompleted,
                  onChanged: (value) {
                    checkBoxChanged(todos[index]);
                  },
                ),
              );
            },
          );
  }

  void checkBoxChanged(Todo todo) {
    setState(() {
      todo.isCompleted = !todo.isCompleted;
    });
  }

  void deleteTodo(Todo todo) {
    setState(() {
      _hiveDatabaseService.deleteTodo(todo);
    });
  }
}
