import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(3.5, -3.5),
      children: [
        Container(
          height: 55,
          width: 56.77,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(9.46),
          ),
        ),
        const Icon(
          size: 45,
          Icons.check,
          color: Colors.white,
        ),
      ],
    );
  }
}
