import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          "Add Task Screen",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
