import 'package:flutter/material.dart';

class AllTasksEmpty extends StatelessWidget {
  const AllTasksEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
