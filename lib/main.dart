import 'package:flutter/material.dart';

import 'views/welcome_view.dart';

void main() {
  runApp(const CheckMate());
}

class CheckMate extends StatelessWidget {
  const CheckMate({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeView(),
    );
  }
}
