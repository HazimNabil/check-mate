import 'package:flutter/material.dart';

import '../constants.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: const Alignment(5.5, -6),
          children: [
            Container(
              height: 30,
              width: 31,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const Icon(
              size: 27,
              Icons.check,
              color: kPrimaryColor,
            ),
          ],
        ),
        const SizedBox(width: 12),
        const Text(
          kAppName,
          style: TextStyle(
            fontFamily: 'Inter-ExtraBold',
            fontWeight: FontWeight.w800,
            fontSize: 26,
          ),
        )
      ],
    );
  }
}
