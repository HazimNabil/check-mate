import 'package:check_mate/widgets/task_tile.dart';
import 'package:flutter/material.dart';

import 'task_list.dart';
import 'to_do_text_field.dart';

class ToDoListBody extends StatelessWidget {
  const ToDoListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
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
        )
      ],
    );
  }
}
