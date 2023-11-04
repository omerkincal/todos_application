// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  void Function(bool?)? onChanged;

  ToDoTile({
    Key? key,
    required this.taskName,
    required this.isTaskCompleted,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            //checkbox
            Checkbox(
              value: isTaskCompleted,
              onChanged: onChanged,
              activeColor: Colors.white30,
            ),

            //task name
            Text(
              taskName,
              style: TextStyle(
                color: Colors.white,
                decoration: isTaskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
