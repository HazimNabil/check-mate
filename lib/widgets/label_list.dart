import 'package:check_mate/widgets/label_item.dart';
import 'package:flutter/material.dart';

class LabelList extends StatelessWidget {
  final labels = const [
    'Personal',
    'Work',
    'Finance',
    'Other',
  ];

  const LabelList({super.key});

  List<LabelItem> buildLabelList() {
    var labelItems = labels.map((label) => LabelItem(label: label));
    return labelItems.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buildLabelList(),
    );
  }
}
