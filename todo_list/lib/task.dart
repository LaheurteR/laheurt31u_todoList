import 'package:uuid/uuid.dart';
var uuid = const Uuid();
enum Priority {
  low, normal, high
}

class Task
{
  String? id;
  String titre = '';
  bool completed = false;
  Task({required String t, String? id, completed = false}) : id = id??uuid.v4()
  {
    titre = t;
  }

  @override
  String toString() {
    return 'Task{id: $id, titre: $titre, completed: $completed}';
  }
}