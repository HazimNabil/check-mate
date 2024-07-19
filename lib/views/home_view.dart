import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/home_body.dart';
import '../widgets/logo_drawer_header.dart';

class HomeView extends StatelessWidget {
  static String route = 'home_view';

  const HomeView({super.key});

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Image.asset('assets/images/light app logo.png'),
      titleSpacing: 0,
      title: const Text(
        kAppName,
        style: TextStyle(
          fontFamily: 'Inter-ExtraBold',
          fontWeight: FontWeight.w800,
          fontSize: 26,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const HomeBody(),
      endDrawer: Drawer(
        backgroundColor: kBackgroundColor,
        child: ListView(
          children: const [
            LogoDrawerHeader(),
          ],
        ),
      ),
    );
  }
}
