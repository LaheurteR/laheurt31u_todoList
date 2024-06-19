import 'package:faker/faker.dart';
import 'package:todo_list/task.dart';

var rand = Faker();

class TaskService {
  static List<Task> taskenr = [];

  static Future<List<Task>> fetchTasks() async {
    List<Task> taches = [];
    for (int i = 0; i < 50; i++) {
      taches.add(Task(
          t: faker.lorem.sentence(),
          c: faker.lorem.sentence(),
          completed: faker.randomGenerator.boolean()));
    }
    for (Task t in taskenr) {
      taches.add(t);
    }
    return taches;
  }

  static void createTask(Task t) async {
    taskenr.add(t);
  }

  static void deleteTask(Task t)
  {
    taskenr.remove(t);
  }
}
