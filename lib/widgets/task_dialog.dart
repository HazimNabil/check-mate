import 'package:check_mate/helper/show_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import 'action_button.dart';
import 'custom_text_field.dart';

class TaskDialog extends StatefulWidget {
  const TaskDialog({super.key});

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final labels = const [
    'Personal',
    'Work',
    'Finance',
    'Other',
  ];

  final formKey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String? label;
  late int color;
  bool isLoading = false;

  DropdownMenuItem<String> toDropdownItem(label) {
    return DropdownMenuItem(
      value: label,
      child: Text(label),
    );
  }

  int getLabelColor(String label) {
    switch (label.toLowerCase()) {
      case 'personal':
        return const Color(0xFFFF7F7F).value;
      case 'work':
        return const Color(0xFF4682B4).value;
      case 'finance':
        return const Color(0xFF50C878).value;
      case 'other':
        return const Color(0xFF9966CC).value;
      default:
        return Colors.grey.value;
    }
  }

  Future<void> addTask() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      var tasks = FirebaseFirestore.instance.collection(kTaskCollection);
      var userId = FirebaseAuth.instance.currentUser!.uid;
      try {
        await tasks.add({
          'id': userId,
          'title': title,
          'isChecked': false,
          'isPinned': false,
          'label': label,
          'color': getLabelColor(label!),
        });
        setState(() => isLoading = false);
        Navigator.pop(context);
      } catch (e) {
        showSnackBar(context, e.toString());
        setState(() => isLoading = false);
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
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
                  validator: (data) {
                    if (data?.isEmpty ?? true) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3E2E2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField(
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  value: label,
                  isExpanded: true,
                  iconEnabledColor: kPrimaryColor,
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  borderRadius: BorderRadius.circular(8),
                  dropdownColor: const Color(0xFFE3E2E2),
                  hint: const Text('Task label'),
                  items: labels.map(toDropdownItem).toList(),
                  onChanged: (value) => setState(() => label = value),
                ),
              ),
            ],
          ),
        ),
        actions: [
          ActionButton(
            text: 'Save',
            onPressed: addTask,
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
