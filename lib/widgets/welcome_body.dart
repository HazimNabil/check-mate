import 'package:check_mate/constants.dart';
import 'package:flutter/material.dart';

import 'app_logo.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 294),
          const AppLogo(),
          const SizedBox(height: 32),
          const Text(
            kAppName,
            style: TextStyle(
              color: kBackgroundColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 13),
          const Text(
            'Write what you need\n to do. Everyday. ',
            style: TextStyle(
              color: Color(0xFFC4C4C4),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 193.5),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              fixedSize: WidgetStatePropertyAll(Size(220, 53)),
              backgroundColor: WidgetStatePropertyAll(kBackgroundColor),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
