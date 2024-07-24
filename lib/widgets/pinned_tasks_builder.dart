import 'package:check_mate/constants.dart';
import 'package:check_mate/widgets/task_list.dart';
import 'package:check_mate/widgets/loading_indicator.dart';
import 'package:check_mate/widgets/pinned_tasks_empty.dart';
import 'package:check_mate/widgets/something_went_wrong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PinnedTasksBuilder extends StatefulWidget {
  const PinnedTasksBuilder({super.key});

  @override
  State<PinnedTasksBuilder> createState() => _PinnedTasksBuilderState();
}

class _PinnedTasksBuilderState extends State<PinnedTasksBuilder> {
  dynamic stream;

  @override
  void initState() {
    super.initState();
    var taskCollection = FirebaseFirestore.instance.collection(kTaskCollection);
    stream = taskCollection.where('isPinned', isEqualTo: true).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.docs.isEmpty) {
            return const PinnedTasksEmpty();
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
