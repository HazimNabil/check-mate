import 'package:check_mate/constants.dart';
import 'package:check_mate/models/task_model.dart';
import 'package:check_mate/widgets/all_tasks_populated.dart';
import 'package:check_mate/widgets/loading_indicator.dart';
import 'package:check_mate/widgets/something_went_wrong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'all_tasks_empty.dart';

class AllTasksBuilder extends StatefulWidget {
  const AllTasksBuilder({super.key});

  @override
  State<AllTasksBuilder> createState() => _AllTasksBuilderState();
}

class _AllTasksBuilderState extends State<AllTasksBuilder> {
  dynamic stream;

  @override
  void initState() {
    super.initState();
    var taskCollection = FirebaseFirestore.instance.collection(kTaskCollection);
    stream = taskCollection.snapshots();
  }

  Task toTask(task) => Task.fromJson(task);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.docs.isEmpty) {
            return const AllTasksEmpty();
          } else {
            return AllTasksPopulated(tasks: snapshot.data!.docs);
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
