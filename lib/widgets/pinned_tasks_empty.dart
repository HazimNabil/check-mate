import 'package:flutter/material.dart';

class PinnedTasksEmpty extends StatelessWidget {
  const PinnedTasksEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/Group 42.png'),
            const SizedBox(height: 89),
            const Text(
              'Ooops! No pinned task yet...',
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
