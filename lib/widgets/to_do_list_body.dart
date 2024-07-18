import 'package:check_mate/widgets/label_section.dart';
import 'package:flutter/material.dart';

import 'to_do_list_section.dart';

class ToDoListBody extends StatelessWidget {
  const ToDoListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ToDoListSection(),
        LabelSection(),
      ],
    );
  }
}
