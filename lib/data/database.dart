import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  var mybox = Hive.box("mybox");

  // initial data for tasks
  void createInitialData() {
    [];
  }

  //load data from database

  void loadData() {
    toDoList = mybox.get("TODOLIST");
  }

  // update database
  void updateDatabase() {
    mybox.put("TODOLIST", toDoList);
  }
}
