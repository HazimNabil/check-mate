import 'package:check_mate/typedefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'loading_indicator.dart';
import 'something_went_wrong.dart';
import 'task_list.dart';

class SearchBodyBuilder extends StatelessWidget {
  final String searchTerm;
  final TaskStream? stream;

  const SearchBodyBuilder({
    super.key,
    required this.searchTerm,
    required this.stream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasData) {
          var tasks = snapshot.data!.docs.where((doc) {
            var title = (doc['title'] as String).toLowerCase();
            return title.contains(searchTerm);
          }).toList();
          return TaskList(tasks: tasks);
        } else if (snapshot.hasError) {
          return SomethingWentWrong(message: snapshot.error.toString());
        } else {
          return const TaskList(tasks: []);
        }
      },
    );
  }
}
