import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/tasks_provider.dart';
import 'todo_list_app.dart' as app;

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TasksProvider(), child: const app.TodoListApp()));
}
