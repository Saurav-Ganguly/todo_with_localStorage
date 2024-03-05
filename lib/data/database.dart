import 'package:hive_flutter/hive_flutter.dart';
//import 'package:todo_app/model/todo.dart';

class MyDatabase {
  var todos = [];

  final _myBox = Hive.box('mybox');

  void loadData() {
    var initialTodos = _myBox.get('TODOS');

    if (initialTodos == null) {
      todos = [];
    } else {
      todos = initialTodos;
    }
  }

  void updateData() {
    _myBox.put('TODOS', todos);
  }
}
