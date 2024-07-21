import 'package:flutter/material.dart';

import 'task_tile.dart';

class ActiveListsBody extends StatelessWidget {
  const ActiveListsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const TaskTile();
        },
      ),
    );
  }
}
