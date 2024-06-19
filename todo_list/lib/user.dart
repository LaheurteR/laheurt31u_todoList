import 'package:todo_list/task.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class User {
  String? id;
  String firstname = '';
  String lastname = '';
  String email = '';
  String _passwd = '';
  List<Task> tasks = [];

  User(String ln, String fn, String e, String pwd, String? id)
      : id = id ?? uuid.v4() {
    lastname = ln;
    firstname = fn;
    email = e;
    _passwd = pwd;
  }

  @override
  String toString() {
    return 'User{id: $id, firstname: $firstname, lastname: $lastname, email: $email, passwd: $_passwd}';
  }
}
