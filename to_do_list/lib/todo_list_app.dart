import 'package:flutter/material.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: new AppBar(
        title: new Text('TodoList'),
        centerTitle: true,
      ),
    ));
  }
}

// class TodoList extends StatefulWidget {
//   @override
//   _TodoListState createState() => new _TodoListState();
// }
