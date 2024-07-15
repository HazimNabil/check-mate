import 'package:check_mate/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_list_button.dart';

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
        const SizedBox(height: 100),
        Image.asset('assets/images/todo svg.png'),
        const SizedBox(height: 89),
        const Text(
          'Create your first to-do list...',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 48),
        const NewListButton()
      ],
    );
  }
}

