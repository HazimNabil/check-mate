import 'package:flutter/material.dart';

import '../constants.dart';

class ToDoTextField extends StatelessWidget {
  const ToDoTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      style: const TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: kBackgroundColor,
        hintText: 'Title',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
    );
  }
}
