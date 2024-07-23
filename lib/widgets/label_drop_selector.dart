import 'package:flutter/material.dart';

import '../constants.dart';

class LabelDropSelector extends StatelessWidget {
  final String hint;
  final String? label;
  final void Function(String?) onChanged;
  final labels = const [
    'Personal',
    'Work',
    'Finance',
    'Other',
  ];

  const LabelDropSelector({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.label,
  });

  DropdownMenuItem<String> toDropdownItem(label) {
    return DropdownMenuItem(
      value: label,
      child: Text(label),
    );
  }

  String? validateLabel(value) {
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE3E2E2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String>(
        validator: validateLabel,
        value: label,
        isExpanded: true,
        iconEnabledColor: kPrimaryColor,
        padding: const EdgeInsets.only(left: 16, right: 8),
        borderRadius: BorderRadius.circular(8),
        dropdownColor: const Color(0xFFE3E2E2),
        hint: Text(hint),
        items: labels.map(toDropdownItem).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
