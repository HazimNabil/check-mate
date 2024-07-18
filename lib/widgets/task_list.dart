import 'package:flutter/material.dart';

import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 3,
        (context, index) {
          return const TaskTile(
            icon: Icons.check_box_outline_blank,
          );
        },
      ),
    );
  }
}
