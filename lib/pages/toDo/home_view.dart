import 'package:flutter/material.dart';
import 'package:todo_app/pages/toDo_barrel.dart';
import 'package:todo_app/utils/create_new_task.dart';

class HomeView extends StatefulWidget {
  static const name = "HomeView";
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // filed controller
  final _controller = TextEditingController();

  // to do list
  List toDoList = [
    ["programar", false],
    ["gym", false],
  ];

  // checkbox
  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      if (_controller.text.isEmpty) return;
      toDoList.add(
        [_controller.text, false],
      );
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  // add task
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return CreateNewTask(
          controller: _controller,
          onSaved: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void DelteTask() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        title: const Center(
          child: Text(
            "To Do",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 137, 178, 245),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 27, 102, 216),
        hoverColor: const Color.fromARGB(255, 255, 255, 255),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          addNewTask();
        },
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0],
            taskComplete: toDoList[index][1],
            onChange: (value) => checkBoxChange(value, index),
            deleteFunction: (p0) => DelteTask(),
          );
        },
      ),
    );
  }
}
