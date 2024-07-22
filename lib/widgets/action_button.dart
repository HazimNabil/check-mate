import 'package:flutter/material.dart';

import '../constants.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        overlayColor: Colors.grey[900],
      ),
      child: Text(
        text,
        style: const TextStyle(color: kPrimaryColor),
      ),
    );
  }
}
