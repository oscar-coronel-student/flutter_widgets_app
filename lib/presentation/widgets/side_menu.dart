import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {

  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value){
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: [
        NavigationDrawerDestination(
          icon: const Icon(Icons.add),
          label: const Text('Home Screen')
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.accessible_sharp),
          label: const Text('Otra pantalla')
        ),
      ]
    );
  }
}