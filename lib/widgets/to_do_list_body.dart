import 'package:flutter/material.dart';

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
                child: ToDoTextField(),
              )
            ],
          ),
        )
      ],
    );
  }
}
