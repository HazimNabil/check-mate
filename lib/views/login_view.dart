import 'package:flutter/material.dart';

import '../widgets/auth_button.dart';
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
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 130),
          CustomTextField(hint: 'Email'),
          SizedBox(height: 20),
          CustomTextField(hint: 'Password'),
          SizedBox(height: 50),
          AuthButton(),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have account? ",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
