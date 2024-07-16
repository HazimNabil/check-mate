import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;

  const CustomTextField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFE3E2E2),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFE3E2E2)),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kPrimaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
