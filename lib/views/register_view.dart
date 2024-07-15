import 'package:check_mate/views/login_view.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  static String route = 'register_view';

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Register',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 130),
          const CustomTextField(hint: 'Email'),
          const SizedBox(height: 20),
          const CustomTextField(hint: 'Password'),
          const SizedBox(height: 20),
          const CustomTextField(hint: 'Confirm Password'),
          const SizedBox(height: 50),
          const AuthButton(title: 'Register'),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have account? ",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, LoginView.route);
                },
                child: const Text(
                  'Login here',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
