import 'package:flutter/material.dart';
import 'package:todo_list/task.dart';
import 'package:todo_list/widgets/task_preview.dart';
import 'package:todo_list/services/task_service.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({super.key});

  @override
  State<TasksMaster> createState() => _TasksMasterState();
}

class _TasksMasterState extends State<TasksMaster> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task List'),
        ),
        body: FutureBuilder<List<Task>>(
          future: TaskService().fetchTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No tasks found'));
            } else {
              List<Task> tasks = snapshot.data!;
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  Task task = tasks[index];
                  return TaskPreview(task: task);
                },
              );
            }
          },
        ),
      ),
    );
  }
}