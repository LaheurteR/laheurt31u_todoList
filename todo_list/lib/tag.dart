import 'package:uuid/uuid.dart';
var uuid = const Uuid();

class Tag
{
  String valeur = "";

  Tag(String v)
  {
    valeur = v;
  }

  @override
  String toString() {
    return 'Tag{valeur: $valeur}';
  }
}
