import 'package:check_mate/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          children: [
            const LogoDrawerHeader(),
            const SizedBox(height: 60),
            DrawerTile(
              title: 'All Lists',
              icon: FontAwesomeIcons.list,
              onTap: () {},
            ),
            const SizedBox(height: 40),
            DrawerTile(
              title: 'Pinned Lists',
              icon: FontAwesomeIcons.thumbtack,
              onTap: () {},
            ),
            const SizedBox(height: 40),
            DrawerTile(
              title: 'Search',
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () {},
            ),
            const SizedBox(height: 190),
            DrawerTile(
              title: 'Logout',
              icon: FontAwesomeIcons.arrowRightFromBracket,
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, LoginView.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 32),
      horizontalTitleGap: 30,
      onTap: onTap,
      leading: Icon(
        icon,
        color: kPrimaryColor,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
