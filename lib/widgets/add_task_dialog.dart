import 'package:check_mate/helper/show_snack_bar.dart';
import 'package:check_mate/models/task_model.dart';
import 'package:check_mate/services/task_service.dart';
import 'package:check_mate/widgets/label_drop_selector.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../helper/get_label_color.dart';
import 'action_button.dart';
import 'custom_text_field.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final formKey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String? label;
  late int color;
  bool isLoading = false;

  Future<void> save() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      var task = Task(
        title: title!,
        isChecked: false,
        isPinned: false,
        color: getLabelColor(label!),
        label: label!,
      );
      try {
        await TaskService().addTask(task);
      } on FormatException catch (e) {
        if(mounted) showSnackBar(context, e.message);
      }
      setState(() => isLoading = false);
      if (mounted) Navigator.pop(context);
    } else {
      setState(() => autovalidateMode = AutovalidateMode.always);
    }
  }

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
        title: const Text('Add new task'),
        content: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomTextField(
                  hint: 'Task title',
                  onChanged: (data) => title = data,
                  validator: validateTitle,
                ),
              ),
              const SizedBox(height: 10),
              LabelDropSelector(
                label: label,
                hint: 'Task label',
                onChanged: (value) => setState(() => label = value),
              )
            ],
          ),
        ),
        actions: [
          ActionButton(
            text: 'Save',
            onPressed: save,
          ),
          ActionButton(
            text: 'Cancel',
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
