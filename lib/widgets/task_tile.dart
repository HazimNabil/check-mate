import 'package:flutter/material.dart';

import 'to_do_text_field.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      horizontalTitleGap: 0,
      leading: Icon(Icons.check_box_outline_blank),
      title: ToDoTextField(
        fontSize: 18,
        hint: 'To-do',
      ),
    );
  }
}
