import 'package:flutter/material.dart';

import 'app_logo.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppLogo(),
      ],
    );
  }
}
