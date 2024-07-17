import 'package:check_mate/constants.dart';
import 'package:check_mate/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar_title.dart';
import '../widgets/home_body.dart';

class HomeView extends StatelessWidget {
  static String route = 'home_view';

  const HomeView({super.key});

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const AppBarTitle(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            size: 29,
            Icons.search,
            color: kPrimaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, LoginView.route);
          },
          icon: const Icon(
            size: 29,
            Icons.logout,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const HomeBody(),
    );
  }
}
