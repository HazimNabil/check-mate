import 'package:check_mate/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar_title.dart';

class HomeView extends StatelessWidget {
  static String route = 'home_view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
    );
  }

  AppBar buildAppBar() {
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
      ],
    );
  }
}
