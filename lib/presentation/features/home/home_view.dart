import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../data/datasources/local/hive_datasources.dart';
import '../../blocs/theme_provider.dart';
import '../components/todo_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _myBox = Hive.box('todoBox');

  DateTime? selectedDate;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int? priority;

  HiveDataSource db = HiveDataSource();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  deleteTheTask(int index) {
    db.toDoList.removeAt(index);
    db.updateDatabase();
  }

  void checkBoxChanged(int index) {
    setState(() {
      db.toDoList[index].isCompleted = !db.toDoList[index].isCompleted;
    });
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: db.toDoList.isEmpty
          ? const Center(
              child: Text('Yapılacak iş kalmadı'),
            )
          : ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  //confirmDismiss: ,
                  onDismissed: (direction) {
                    // if (direction == DismissDirection.endToStart) {
                    deleteTheTask(index);
                    // }
                    //  else if (direction == DismissDirection.startToEnd) {
                    //   updateTheTask(index);
                    // }
                  },
                  background: Container(
                    color: Colors.redAccent,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.all(25),
                    child: const Icon(Icons.delete),
                  ),

                  key: Key(db.toDoList[index].toString()),
                  child: ToDoTile(
                    taskName: db.toDoList[index].title,
                    isTaskCompleted: db.toDoList[index].isCompleted,
                    onChanged: (value) {
                      checkBoxChanged(index);
                    },
                  ),
                );
              },
            ),
    );
  }
}
