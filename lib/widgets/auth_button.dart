import 'package:flutter/material.dart';

import '../constants.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AuthButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: const Size(170, 45),
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: kBackgroundColor,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
