import 'package:check_mate/helper/get_label_color.dart';
import 'package:check_mate/services/task_service.dart';
import 'package:check_mate/widgets/label_drop_selector.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import 'action_button.dart';
import 'custom_text_field.dart';

class EditTaskDialog extends StatefulWidget {
  final String oldTitle, oldLabel, taskId;

  const EditTaskDialog({
    super.key,
    required this.oldTitle,
    required this.oldLabel,
    required this.taskId,
  });

  @override
  State<EditTaskDialog> createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  final formKey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String? label;
  late int color;
  bool isLoading = false;

  String? validateTitle(data) {
    if (data?.isEmpty ?? true) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CircularProgressIndicator(
        color: kPrimaryColor,
      ),
      child: AlertDialog(
        backgroundColor: kBackgroundColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        title: const Text('Edit task'),
        content: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomTextField(
                  hint: widget.oldTitle,
                  onChanged: (data) => title = data,
                  validator: validateTitle,
                ),
              ),
              const SizedBox(height: 10),
              LabelDropSelector(
                label: label,
                hint: widget.oldLabel,
                onChanged: (value) => setState(() => label = value),
              )
            ],
          ),
        ),
        actions: [
          ActionButton(
            text: 'Edit',
            onPressed: editTask,
          ),
          ActionButton(
            text: 'Cancel',
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  void editTask() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      var fields = {
        'title': title,
        'label': label,
        'color': getLabelColor(label!),
      };
      await TaskService().editTask(widget.taskId, fields, context);
      setState(() => isLoading = false);
      if (mounted) Navigator.pop(context);
    } else {
      setState(() => autovalidateMode = AutovalidateMode.always);
    }
  }
}
