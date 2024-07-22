import 'package:flutter/material.dart';

import '../constants.dart';
import 'dialog_content.dart';

class TaskDialog extends StatelessWidget {
  const TaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBackgroundColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      title: const Text('Add new task'),
      content: const DialogContent(),
      actions: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            overlayColor: Colors.grey[900],
          ),
          child: const Text(
            'Save',
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            overlayColor: Colors.grey[900],
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
