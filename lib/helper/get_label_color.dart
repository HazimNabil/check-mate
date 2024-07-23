import 'package:flutter/material.dart';

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
