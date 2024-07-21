import 'package:flutter/material.dart';

import '../constants.dart';

class TaskDialog extends StatelessWidget {
  const TaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: kBackgroundColor,
      title: Text('Add new task'),
      contentPadding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 2,
      ),
    );
  }
}
