import 'package:check_mate/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'all_lists_widget.dart';
import 'pinned_lists_widget.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _selectedSegment = 0;
  final children = {
    0: const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        'All Lists',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    1: const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        'Pinned',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  };

  Widget buildSegmentContent(int selectedSegment) {
    if (_selectedSegment == 0) {
      return const AllListWidget();
    } else {
      return const PinnedListWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          width: 340,
          child: CupertinoSegmentedControl<int>(
            children: children,
            onValueChanged: (int value) {
              setState(() => _selectedSegment = value);
            },
            groupValue: _selectedSegment,
            selectedColor: kPrimaryColor,
            pressedColor: const Color(0xFFE5E5E5),
            borderColor: Colors.transparent,
            unselectedColor: const Color(0xFFE5E5E5),
          ),
        ),
        buildSegmentContent(_selectedSegment),
      ],
    );
  }
}
