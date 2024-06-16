import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class User {
  String? id;
  String firstname = '';
  String lastname = '';
  String email = '';
  String passwd = '';

  User(String ln, String fn, String e, String pwd, String? id)
      : id = id ?? uuid.v4() {
    lastname = ln;
    firstname = fn;
    email = e;
    passwd = pwd;
  }

  @override
  String toString() {
    return 'User{id: $id, firstname: $firstname, lastname: $lastname, email: $email, passwd: $passwd}';
  }
}
