import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  static String route = 'login_view';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
              // color: kBackgroundColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 150),
          CustomTextField(hint: 'Email'),
          SizedBox(height: 20),
          CustomTextField(hint: 'Password')
        ],
      ),
    );
  }
}
