import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_text_field.dart';

class DialogContent extends StatefulWidget {
  final labels = const [
    'Personal',
    'Work',
    'Finance',
    'Other',
  ];

  const DialogContent({super.key});

  @override
  State<DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  final formKey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String? label;

  DropdownMenuItem<String> toDropdownItem(label) {
    return DropdownMenuItem(
      value: label,
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFE3E2E2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton(
              value: label,
              isExpanded: true,
              iconEnabledColor: kPrimaryColor,
              padding: const EdgeInsets.only(left: 16, right: 8),
              borderRadius: BorderRadius.circular(8),
              dropdownColor: const Color(0xFFE3E2E2),
              hint: const Text('Task label'),
              items: widget.labels.map(toDropdownItem).toList(),
              onChanged: (value) => setState(() => label = value),
            ),
          ),
        ],
      ),
    );
  }
}
