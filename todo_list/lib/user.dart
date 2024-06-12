import 'package:uuid/uuid.dart';
var uuid = const Uuid();
class User {
  String? id;
  String name = "";

  User(String n, String? id) : id = id??uuid.v4() {
    name = n;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name}';
  }
}
