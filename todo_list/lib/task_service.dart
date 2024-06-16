import 'package:faker/faker.dart';
import 'package:todo_list/task.dart';

var rand = Faker();

class TaskService {
  Future<List<Task>> fetchTasks() async {
    List<Task> taches = [];
    for (int i = 0; i < 100; i++) {
      taches.add(Task(t: faker.lorem.sentence(),c : faker.lorem.sentence(), completed: faker.randomGenerator.boolean()));
    }
    return taches;
  }

}
Future<void> main()
async {
  TaskService t = TaskService();
  List<Task> taches = await t.fetchTasks();
  for (Task t in taches) {
    print(t.toString());
  }
}
