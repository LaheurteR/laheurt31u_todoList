import 'package:flutter/material.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Todo list',
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text("ToDo List"),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){

            },
            backgroundColor: Colors.blue,
            child:
            const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    ));
  }
}
