import 'package:check_mate/services/task_service.dart';
import 'package:check_mate/typedefs.dart';
import 'package:check_mate/widgets/loading_indicator.dart';
import 'package:check_mate/widgets/something_went_wrong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'all_tasks_empty.dart';
import 'task_list.dart';

class AllTasksBuilder extends StatefulWidget {
  const AllTasksBuilder({super.key});

  @override
  State<AllTasksBuilder> createState() => _AllTasksBuilderState();
}

class _AllTasksBuilderState extends State<AllTasksBuilder> {
  late TaskStream stream;

  @override
  void initState() {
    super.initState();
    stream = TaskService().readTasks();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.docs.isEmpty) {
            return const AllTasksEmpty();
          } else {
            return TaskList(tasks: snapshot.data!.docs);
          }
        } else if (snapshot.hasError) {
          return SomethingWentWrong(message: snapshot.error.toString());
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
