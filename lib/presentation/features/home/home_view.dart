import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../data/datasources/local/hive_datasources.dart';
import '../../../locator/get_it_locator.dart';
import '../../blocs/theme_provider.dart';
import '../components/diolog_box.dart';
import '../components/todo_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _myBox = Hive.box('todoBox');

  final HiveDataSource _hiveService = ServiceLocator.locator<HiveDataSource>();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      _hiveService.createInitialData();
    } else {
      _hiveService.loadData();
    }
    super.initState();
  }

  deleteTheTask(int index) {
    _hiveService.toDoList.removeAt(index);
    _hiveService.updateDatabase();
  }

  void checkBoxChanged(int index) {
    setState(() {
      _hiveService.toDoList[index].isCompleted =
          !_hiveService.toDoList[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade300,
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
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const DiologBox(); // Ya da DiologBox() widget'inizi burada çağırabilirsiniz.
            },
          );
        },
      ),
      body: _hiveService.toDoList.isEmpty
          ? const Center(
              child: Text('Yapılacak iş kalmadı'),
            )
          : ListView.builder(
              itemCount: _hiveService.toDoList.length,
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

                  key: Key(_hiveService.toDoList[index].toString()),
                  child: ToDoTile(
                    taskName: _hiveService.toDoList[index].title,
                    isTaskCompleted: _hiveService.toDoList[index].isCompleted,
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
