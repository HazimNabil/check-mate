import 'package:flutter/material.dart';

import '../constants.dart';

class ToDoTextField extends StatelessWidget {
  final double fontSize;
  final String hint;
  const ToDoTextField({super.key, required this.fontSize, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      style: TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: kBackgroundColor,
        hintText: hint,
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
