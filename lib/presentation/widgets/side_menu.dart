import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int? navDrawerIndex;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 34;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value){
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.pushNamed(menuItem.routeName);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
          child: const Text('Main'),
        ),

        ...appMenuItems
          .sublist(0,3)
          .map((menuItem) {
            return NavigationDrawerDestination(
              icon: Icon(menuItem.icon),
              label: Text(menuItem.title),
            );
          }),
        
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More options'),
        ),

        ...appMenuItems
          .sublist(3)
          .map((menuItem) {
            return NavigationDrawerDestination(
              icon: Icon(menuItem.icon),
              label: Text(menuItem.title),

            );
          }),

      ]
    );
  }
}