// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_app/utils/my_buttons.dart';

class CreateNewTask extends StatelessWidget {
  static const name = "CreateNewTask";
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;

  CreateNewTask({
    super.key,
    required this.onSaved,
    required this.onCancel,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 140,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Add new task",
              ),
            ),

            //buttons add and delete
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomButtons(
                  name: "Save",
                  onChanged: onSaved,
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomButtons(
                  name: "Cancel",
                  onChanged: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
