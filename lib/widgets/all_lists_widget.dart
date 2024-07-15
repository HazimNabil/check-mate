import 'package:flutter/material.dart';

import 'new_list_button.dart';

class AllListWidget extends StatelessWidget {
  const AllListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Image.asset('assets/images/todo svg.png'),
        const SizedBox(height: 89),
        const Text(
          'Create your first to-do list...',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 48),
        const NewListButton(),
      ],
    );
  }
}
