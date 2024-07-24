import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  final String message;

  const SomethingWentWrong({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
