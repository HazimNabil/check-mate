import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer_tile.dart';

class DrawerItemsList extends StatelessWidget {
  final VoidCallback toSearchView;
  final VoidCallback logout;
  final Function(int) selectBody;

  const DrawerItemsList({
    super.key,
    required this.toSearchView,
    required this.logout,
    required this.selectBody,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
