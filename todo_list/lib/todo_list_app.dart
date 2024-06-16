import 'package:flutter/material.dart';
import 'package:todo_list/screens/tasks_master.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TasksMaster();
  }
}
