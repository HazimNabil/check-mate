import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_text_field.dart';

class DialogContent extends StatelessWidget {
  final labels = const [
    'Personal',
    'Work',
    'Finance',
    'Other',
  ];

  const DialogContent({super.key});

  DropdownMenuItem<String> toDropdownItem(label) {
    return DropdownMenuItem(
      value: label,
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomTextField(
            hint: 'Task title',
            onChanged: (value) {},
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
            isExpanded: true,
            iconEnabledColor: kPrimaryColor,
            padding: const EdgeInsets.only(left: 16, right: 8),
            borderRadius: BorderRadius.circular(8),
            dropdownColor: const Color(0xFFE3E2E2),
            hint: const Text('Task label'),
            items: labels.map(toDropdownItem).toList(),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
