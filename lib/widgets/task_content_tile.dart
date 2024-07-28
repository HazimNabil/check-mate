import 'package:check_mate/models/task_model.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'label_item.dart';

class TaskContentTile extends StatelessWidget {
  final Task task;
  final IconData checkIcon;
  final TextDecoration? decoration;
  final VoidCallback toggleCheck;

  const TaskContentTile({
    super.key,
    required this.task,
    required this.checkIcon,
    required this.decoration,
    required this.toggleCheck,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Color(task.color),
      contentPadding: const EdgeInsets.symmetric(horizontal: 2),
      horizontalTitleGap: 0,
      leading: IconButton(
        icon: Icon(
          checkIcon,
          size: 21,
          color: kPrimaryColor,
        ),
        onPressed: toggleCheck,
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          task.title,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            decoration: decoration,
            decorationThickness: 2,
            decorationColor: kPrimaryColor,
          ),
        ),
      ),
      trailing: LabelItem(
        label: task.label,
        color: kPrimaryColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
