import 'package:flutter/material.dart';

import 'task_list.dart';
import 'task_tile.dart';
import 'to_do_text_field.dart';

class ToDoListSection extends StatelessWidget {
  const ToDoListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ToDoTextField(fontSize: 26, hint: 'Title'),
          ),
          TaskList(),
          SliverToBoxAdapter(
            child: TaskTile(icon: Icons.add_box_outlined),
          ),
        ],
      ),
    );
  }
}
