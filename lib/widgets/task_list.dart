import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  final List<QueryDocumentSnapshot> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            task: Task.fromJson(tasks[index]),
            taskId: tasks[index].id,
          );
        },
      ),
    );
  }
}
