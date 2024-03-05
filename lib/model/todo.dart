import 'package:hive_flutter/hive_flutter.dart';

part 'todo.g.dart';

@HiveType(typeId: 2)
class Todo {
  @HiveField(0)
  final String title;
  @HiveField(1)
  bool isChecked;

  Todo({required this.title, this.isChecked = false});

  void toggleTodo() {
    isChecked = !isChecked;
  }
}
