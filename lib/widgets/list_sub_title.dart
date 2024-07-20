import 'package:flutter/material.dart';

import '../constants.dart';
import 'label_item.dart';

class ListSubTitle extends StatelessWidget {
  const ListSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        LabelItem(
          label: 'Work',
          color: kPrimaryColor,
        ),
        SizedBox(width: 10),
        Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              color: kPrimaryColor,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              '09-01-2003',
              style: TextStyle(color: kPrimaryColor, fontSize: 17),
            ),
          ],
        )
      ],
    );
  }
}
