import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = MyDatabase();

  @override
  void initState() {
    db.loadData();
    super.initState();
  }

  void onChanged(bool? value, int index) {
    setState(() {
      db.todos[index].toggleTodo();
    });
    db.updateData();
  }

  void createTodo(String todoText) {
    Todo newTodo = Todo(title: todoText);
    setState(() {
      db.todos.add(newTodo);
    });
    db.updateData();
  }

  void deleteTodo(int index) {
    setState(() {
      db.todos.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        elevation: 0,
        title: const Text('TO DO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => DialogBox(
              onSaveTodo: createTodo,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todos.length,
        itemBuilder: (context, index) => TodoItem(
          title: db.todos[index].title,
          isChecked: db.todos[index].isChecked,
          onChanged: (value) => onChanged(value, index),
          onDismissed: () => deleteTodo(index),
        ),
      ),
    );
  }
}
