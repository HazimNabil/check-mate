import 'package:check_mate/constants.dart';
import 'package:check_mate/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';
import '../services/task_service.dart';

class DeleteTaskDialog extends StatefulWidget {
  final String taskId;

  const DeleteTaskDialog({super.key, required this.taskId});

  @override
  State<DeleteTaskDialog> createState() => _DeleteTaskDialogState();
}

class _DeleteTaskDialogState extends State<DeleteTaskDialog> {
  bool isLoading = false;

  Future<void> delete(BuildContext context) async {
    setState(() => isLoading = true);
    try {
      await TaskService().deleteTask(widget.taskId);
    } on FormatException catch (e) {
      if (context.mounted) showSnackBar(context, e.message);
    }
    setState(() => isLoading = false);
    if (context.mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CircularProgressIndicator(
        color: kPrimaryColor,
      ),
      child: AlertDialog(
        title: const Text('Delete task'),
        actions: [
          ActionButton(
            text: 'Delete',
            textColor: Colors.red,
            onPressed: () => delete(context),
          ),
          ActionButton(
            text: 'Cancel',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
