import 'package:flutter/material.dart';

import 'to_do_text_field.dart';

class TaskTile extends StatelessWidget {
  final IconData icon;

  const TaskTile({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 4,
      horizontalTitleGap: 0,
      leading: Icon(icon),
      title: const ToDoTextField(
        fontSize: 18,
        hint: 'To-do',
      ),
    );
  }
}
