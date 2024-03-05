import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key, required this.onSaveTodo});
  final TextEditingController _todoText = TextEditingController();
  final Function(String) onSaveTodo;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: _todoText,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new todo..',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String todoText = _todoText.text;
                    onSaveTodo(todoText);
                    _todoText.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
