import 'package:flutter/material.dart';

class ToDoListTile extends StatelessWidget {
  const ToDoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: ListTile(
        tileColor: Colors.blue,
        contentPadding: const EdgeInsets.symmetric(horizontal: 2),
        horizontalTitleGap: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.check_box_outline_blank,
            size: 21,
          ),
          onPressed: () {},
        ),
        title: const Text(
          "Write code",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
