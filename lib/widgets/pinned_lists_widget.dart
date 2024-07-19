import 'package:flutter/material.dart';

import 'new_list_button.dart';

class PinnedListWidget extends StatelessWidget {
  const PinnedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 170),
          Image.asset('assets/images/Group 42.png'),
          const SizedBox(height: 89),
          const Text(
            'Ooops! No pinned list yet...',
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
