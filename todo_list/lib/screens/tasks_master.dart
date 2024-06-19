import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/tasks_provider.dart';
import 'package:todo_list/screens/task_form.dart';
import 'package:todo_list/task.dart';
import 'package:todo_list/widgets/task_preview.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({super.key});

  @override
  State<TasksMaster> createState() => _TasksMasterState();
}

class _TasksMasterState extends State<TasksMaster> {

  bool firstLoad = true;

  void updateTasks() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TasksProvider taskP = Provider.of<TasksProvider>(context);
    if (firstLoad)
      {
        taskP.initTasks();
        firstLoad = false;
      }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task List'),
        ),
        body: Consumer<TasksProvider>(
          builder: (context, taskProvider, child) {
            if (taskProvider.tasks.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  final Task task = taskProvider.tasks[index];
                  return TaskPreview(task: task);
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TaskForm(type: Type.add, t: null,)),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
