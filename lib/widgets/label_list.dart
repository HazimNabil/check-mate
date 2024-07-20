import 'package:check_mate/constants.dart';
import 'package:check_mate/widgets/label_item.dart';
import 'package:flutter/material.dart';

class LabelList extends StatefulWidget {
  const LabelList({super.key});

  @override
  State<LabelList> createState() => _LabelListState();
}

class _LabelListState extends State<LabelList> {
  int? currentIndex;
  final labels = const [
    'Personal',
    'Work',
    'Finance',
    'Other',
  ];

  Color changeColor(int? currentIndex, int index) {
    if (currentIndex == index) {
      return kPrimaryColor;
    }
    return const Color(0xFF898989);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 29,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => setState(() => currentIndex = index),
            child: LabelItem(
              label: labels[index],
              color: changeColor(currentIndex, index),
            ),
          );
        },
      ),
    );
  }
}
