import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../views/to_do_list_view.dart';

class AddListFab extends StatelessWidget {
  const AddListFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, ToDoListView.route);
      },
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
