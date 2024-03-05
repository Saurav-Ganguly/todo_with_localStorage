import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/pages/home_page.dart';

void main() async {
  //initialize the hive flutter
  await Hive.initFlutter();

  // Register Adapter
  Hive.registerAdapter(TodoAdapter());

  //open a box
  await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        useMaterial3: false,
      ),
    );
  }
}
