import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/pages/toDo_barrel.dart';
import 'package:todo_app/utils/create_new_task.dart';

class HomeView extends StatefulWidget {
  static const name = "HomeView";
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _mybox = Hive.box("mybox");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  //open the box

  // filed controller
  final _controller = TextEditingController();

  // to do list
  // checkbox
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.updateDatabase();
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      if (_controller.text.isEmpty) return;
      db.toDoList.add(
        [_controller.text, false],
      );
      Navigator.of(context).pop();
      _controller.clear();
    });
    db.updateDatabase();
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
  void DeleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
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
        onPressed: () {
          addNewTask();
        },
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskComplete: db.toDoList[index][1],
            onChange: (value) => checkBoxChange(value, index),
            deleteFunction: (p0) => DeleteTask(index),
          );
        },
      ),
    );
  }
}
