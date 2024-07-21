import 'package:flutter/material.dart';

import '../constants.dart';

class NewListButton extends StatelessWidget {
  const NewListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(kPrimaryColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      onPressed: () {},
      label: const Text(
        'New List',
        style: TextStyle(
          color: kBackgroundColor,
          fontSize: 17,
        ),
      ),
      icon: const Icon(
        Icons.add,
        color: kBackgroundColor,
      ),
    );
  }
}
