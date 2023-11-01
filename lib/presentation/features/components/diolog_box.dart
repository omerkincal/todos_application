import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todos_application/data/datasources/local/hive_datasources.dart';
import 'package:todos_application/data/models/todo.dart';

import '../../../locator/get_it_locator.dart';
import 'my_button.dart';

class DiologBox extends StatefulWidget {
  const DiologBox({super.key});

  @override
  State<DiologBox> createState() => _DiologBoxState();
}

class _DiologBoxState extends State<DiologBox> {
  final HiveDataSource _hiveService = ServiceLocator.locator<HiveDataSource>();

  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priorityController = TextEditingController();

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

  // void saveNewTask() {
  //   setState(() {
  //     db.toDoList.add([_controller.text.trim(), false]);
  //     _controller.clear();
  //   });
  //   Navigator.of(context).pop();
  //   db.updateDatabase();
  // }

  void createNewTodo() {
    Todo newTodo = Todo(
      id: _hiveService.toDoList.length + 1,
      title: titleController.text,
      description: descriptionController.text,
      dueDate: selectedDate,
      priority: 1,
      isCompleted: false,
    );
    _hiveService.toDoList.add(newTodo);
    _hiveService.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
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
                  DateFormat('yMd').format(selectedDate),
                ),
                MyButton(
                  text: 'Son Tarih',
                  onPressed: () async {
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
}
