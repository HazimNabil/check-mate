import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Icon? prefix;
  final IconButton? suffix;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.onChanged,
    this.validator,
    this.obscureText = false,
    this.prefix,
    this.suffix,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
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
