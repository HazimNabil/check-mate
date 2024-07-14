import 'package:check_mate/constants.dart';
import 'package:check_mate/views/home_view.dart';
import 'package:flutter/material.dart';

import 'views/welcome_view.dart';

void main() {
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
      },
    );
  }
}
