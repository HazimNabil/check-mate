import 'package:check_mate/services/auth_service.dart';
import 'package:check_mate/views/login_view.dart';
import 'package:check_mate/widgets/all_tasks_builder.dart';
import 'package:check_mate/widgets/pinned_tasks_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../widgets/add_task_fab.dart';
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
    AllTasksBuilder(),
    PinnedTasksBuilder(),
  ];

  Future<void> logout() async {
    await AuthService().logout();
    if (mounted) {
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, LoginView.route);
    }
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
      body: bodies[currentIndex],
      endDrawer: Drawer(
        backgroundColor: kBackgroundColor,
        child: ListView(
          children: [
            const LogoDrawerHeader(),
            const SizedBox(height: 60),
            DrawerTile(
              title: 'All Tasks',
              icon: FontAwesomeIcons.list,
              onTap: () => selectBody(0),
            ),
            const SizedBox(height: 40),
            DrawerTile(
              title: 'Pinned Tasks',
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
      floatingActionButton: const AddTaskFAB(),
    );
  }
}
