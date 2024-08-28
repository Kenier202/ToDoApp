import 'package:flutter/material.dart';
import 'package:todo_app/pages/toDo_barrel.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List toDoList = [
    ["programar", false],
    ["gym", false],
    ["programar", false],
    ["gym", false],
    ["programar", false],
  ];

  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

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
        onPressed: () {},
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0],
            taskComplete: toDoList[index][1],
            onChange: (value) => checkBoxChange(value, index),
          );
        },
      ),
    );
  }
}
