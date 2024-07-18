import 'package:check_mate/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/to_do_list_body.dart';

class ToDoListView extends StatelessWidget {
  static String route = 'to_do_list_view';

  const ToDoListView({super.key});

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.fromLTRB(10, 8, 16, 8),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            border: Border.all(color: kPrimaryColor, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Row(
            children: [
              Icon(FontAwesomeIcons.mapPin, size: 12),
              SizedBox(width: 7),
              Text(
                'Pin',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const ToDoListBody(),
    );
  }
}
