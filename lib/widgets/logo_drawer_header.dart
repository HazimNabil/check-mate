import 'package:flutter/material.dart';

import '../constants.dart';

class LogoDrawerHeader extends StatelessWidget {
  const LogoDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/light app logo.png',
            scale: 0.7,
          ),
          const SizedBox(height: 15),
          const Text(
            kAppName,
            style: TextStyle(
              fontFamily: 'Inter-ExtraBold',
              fontWeight: FontWeight.w800,
              fontSize: 26,
            ),
          ),
        ],
      ),
    );
  }
}
