import 'package:check_mate/constants.dart';
import 'package:check_mate/firebase_options.dart';
import 'package:check_mate/views/home_view.dart';
import 'package:check_mate/views/login_view.dart';
import 'package:check_mate/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'views/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CheckMate());
}

class CheckMate extends StatelessWidget {
  const CheckMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeView(),
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        fontFamily: 'Inter',
      ),
      routes: {
        HomeView.route: (context) => const HomeView(),
        LoginView.route: (context) => const LoginView(),
        RegisterView.route: (context) => const RegisterView(),
      },
    );
  }
}
