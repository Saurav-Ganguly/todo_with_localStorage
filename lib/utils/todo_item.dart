import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final bool isChecked;
  final void Function(bool?)? onChanged;
  final VoidCallback onDismissed;

  const TodoItem({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        onDismissed();
      },
      background: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
        ),
        child: Container(
          color: Colors.red,
          child: const Icon(Icons.delete),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
