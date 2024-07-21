import 'package:check_mate/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TaskDialog extends StatelessWidget {
  const TaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBackgroundColor,
      title: const Text('Add new task'),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 2,
      ),
      content: CustomTextField(
        hint: 'Task title',
        onChanged: (value) {},
      ),
    );
  }
}
