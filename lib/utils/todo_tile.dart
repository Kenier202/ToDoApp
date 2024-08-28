import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  final Function(bool?)? onChange;

  const TodoTile(
      {super.key,
      required this.taskName,
      required this.taskComplete,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskComplete,
              onChanged: onChange,
              activeColor: Colors.black,
            ),
            Text(
              taskName,
              style: TextStyle(
                decoration: taskComplete
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
