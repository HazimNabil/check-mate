import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class AddTaskFAB extends StatelessWidget {
  const AddTaskFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: kPrimaryColor,
      shape: const CircleBorder(),
      child: const Icon(
        FontAwesomeIcons.plus,
        color: kBackgroundColor,
        size: 18,
      ),
    );
  }
}
