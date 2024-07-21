import 'package:check_mate/widgets/task_dialog.dart';
import 'package:flutter/material.dart';

void showTaskDialog(BuildContext context, TaskDialog dialog) {
  showDialog(
    context: context,
    builder: (context) {
      return dialog;
    },
  );
}
