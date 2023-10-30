import 'package:flutter/material.dart';
import 'package:todos_application/data/datasources/local/hive_datasources.dart';
import 'package:todos_application/data/models/todo.dart';

import '../../../locator/get_it_locator.dart';
import 'my_button.dart';

class DiologBox extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DiologBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<DiologBox> createState() => _DiologBoxState();
}

class _DiologBoxState extends State<DiologBox> {
  final HiveDataSource _hiveService = ServiceLocator.locator<HiveDataSource>();

  DateTime selectedDate = DateTime.now();

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

  void createNewTodo(Todo todo) {
    todo.id = _hiveService.toDoList.length + 1;
    _hiveService.toDoList.add(todo);
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
            //get user input
            TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "What do you have to do?",
              ),
            ),

            TextButton(
              onPressed: () async {
                selectDate(context);
              },
              child: const Text('Son Tarih'),
            ),

            //buttons save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: widget.onSave),
                const SizedBox(width: 10),
                MyButton(text: "Cancel", onPressed: widget.onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
