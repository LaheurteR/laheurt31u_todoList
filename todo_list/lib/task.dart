import 'package:uuid/uuid.dart';
var uuid = const Uuid();
enum Priority {
  low, normal, high
}

class Task
{
  String? id;
  String titre = '';
  String content = '';
  bool completed = false;
  Task({required String t, required String c, String? id, this.completed = false}) : id = id??uuid.v4()
  {
    titre = t;
    content = c;

  }

  @override
  String toString() {
    return 'Task{id: $id, titre: $titre, completed: $completed}';
  }
}