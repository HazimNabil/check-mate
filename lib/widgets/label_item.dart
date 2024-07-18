import 'package:check_mate/constants.dart';
import 'package:flutter/material.dart';

class LabelItem extends StatelessWidget {
  final String label;

  const LabelItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF898989),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: kBackgroundColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
