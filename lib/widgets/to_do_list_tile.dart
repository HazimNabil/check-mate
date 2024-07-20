import 'package:check_mate/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'list_sub_title.dart';

class ToDoListTile extends StatelessWidget {
  const ToDoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 22,
        ),
        tileColor: Colors.blue,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 24.0),
          child: Text(
            "Daily To-do's",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: const ListSubTitle(),
        trailing: const Icon(
          FontAwesomeIcons.trash,
          color: kPrimaryColor,
          size: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
