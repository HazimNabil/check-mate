import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
        if (isKeyboardVisible) {
          FocusScope.of(context).unfocus();
          await Future.delayed(const Duration(milliseconds: 520));
        }
        Navigator.pop(context);
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 16),
        child: Text(
          'Cancel',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
