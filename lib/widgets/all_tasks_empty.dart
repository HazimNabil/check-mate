import 'package:flutter/material.dart';

import 'new_list_button.dart';

class AllTasksEmpty extends StatelessWidget {
  const AllTasksEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 170),
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
      ),
    );
  }
}
