import 'package:check_mate/services/auth_service.dart';
import 'package:check_mate/views/home_view.dart';
import 'package:check_mate/views/login_view.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  static String route = 'auth_view';

  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: AuthService().getUserState(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeView();
          }
          return const LoginView();
        },
      ),
    );
  }
}
