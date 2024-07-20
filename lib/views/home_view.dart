import 'package:check_mate/views/login_view.dart';
import 'package:check_mate/widgets/active_lists_body.dart';
import 'package:check_mate/widgets/all_lists_widget.dart';
import 'package:check_mate/widgets/pinned_lists_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../widgets/drawer_tile.dart';
import '../widgets/logo_drawer_header.dart';
import 'search_view.dart';

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

  void logout() {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, LoginView.route);
  }

  void selectBody(int index) {
    setState(() {
      currentIndex = index;
      Navigator.pop(context);
    });
  }

  void toSearchView() {
    Navigator.pop(context);
    Navigator.pushNamed(context, SearchView.route);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kBackgroundColor,
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
      body: const ActiveListsBody(),
      endDrawer: Drawer(
        backgroundColor: kBackgroundColor,
        child: ListView(
          children: [
            const LogoDrawerHeader(),
            const SizedBox(height: 60),
            DrawerTile(
              title: 'All Lists',
              icon: FontAwesomeIcons.list,
              onTap: () => selectBody(0),
            ),
            const SizedBox(height: 40),
            DrawerTile(
              title: 'Pinned Lists',
              icon: FontAwesomeIcons.thumbtack,
              onTap: () => selectBody(1),
            ),
            const SizedBox(height: 40),
            DrawerTile(
              title: 'Search',
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: toSearchView,
            ),
            const SizedBox(height: 190),
            DrawerTile(
              title: 'Logout',
              icon: FontAwesomeIcons.arrowRightFromBracket,
              onTap: logout,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        shape: const CircleBorder(),
        child: const Icon(
          FontAwesomeIcons.plus,
          color: kBackgroundColor,
          size: 18,
        ),
      ),
    );
  }
}
