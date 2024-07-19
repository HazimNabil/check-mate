import 'package:check_mate/views/login_view.dart';
import 'package:check_mate/widgets/all_lists_widget.dart';
import 'package:check_mate/widgets/pinned_lists_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../widgets/drawer_tile.dart';
import '../widgets/logo_drawer_header.dart';

class HomeView extends StatefulWidget {
  static String route = 'home_view';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final bodies = const [
    AllListWidget(),
    PinnedListWidget(),
  ];

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
      body: bodies[currentIndex],
      endDrawer: Drawer(
        backgroundColor: kBackgroundColor,
        child: ListView(
          children: [
            const LogoDrawerHeader(),
            const SizedBox(height: 60),
            DrawerTile(
              title: 'All Lists',
              icon: FontAwesomeIcons.list,
              onTap: () => setState(() {
                currentIndex = 0;
                Navigator.pop(context);
              }),
            ),
            const SizedBox(height: 40),
            DrawerTile(
              title: 'Pinned Lists',
              icon: FontAwesomeIcons.thumbtack,
              onTap: () => setState(() {
                currentIndex = 1;
                Navigator.pop(context);
              }),
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
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, LoginView.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}

