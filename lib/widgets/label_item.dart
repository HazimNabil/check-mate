import 'package:check_mate/constants.dart';
import 'package:flutter/material.dart';

class LabelItem extends StatelessWidget {
  final String label;
  final Color color;

  const LabelItem({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: kBackgroundColor,
          fontSize: 15,
        ),
      ),
    );
  }
}
