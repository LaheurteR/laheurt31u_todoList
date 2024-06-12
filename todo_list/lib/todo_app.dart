import 'package:flutter/material.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Todo list',
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text("Todo list"),
            ),
          ),
    ));
  }
}
