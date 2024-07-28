import 'package:flutter/material.dart';

import '../constants.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;

  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = kPrimaryColor,
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
        style: TextStyle(color: textColor),
      ),
    );
  }
}
