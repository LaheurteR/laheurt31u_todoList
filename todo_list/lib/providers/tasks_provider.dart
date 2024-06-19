import 'package:flutter/material.dart';
import 'package:todo_list/services/task_service.dart';

import '../task.dart';

class TasksProvider extends ChangeNotifier{
   final List<Task> _tasks = [];

  void initTasks () async
  {
    _tasks.addAll(await TaskService.fetchTasks());
    notifyListeners();
  }

  List<Task> get tasks => _tasks;

  void addTask(Task t)
  {
    _tasks.add(t);
    notifyListeners();
  }

  Task getTaskById(String id)
  {
    return _tasks.firstWhere((element) => element.id == id);
  }

  void updateTask(Task t)
  {
    Task task = getTaskById(t.id!);
    task.titre = t.titre;
    task.content = t.content;
    notifyListeners();
  }

  void deleteTask(Task t)
  {
    _tasks.remove(t);
    notifyListeners();
  }
}