import 'package:flutter/material.dart';

import '../models/task_model.dart';
import 'task_tile.dart';

class AllTasksPopulated extends StatelessWidget {
  final List<Task> tasks;
  const AllTasksPopulated({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(task: tasks[index]);
        },
      ),
    );
  }
}
