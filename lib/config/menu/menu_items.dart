import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/animated_screen.dart';
import 'package:widgets_app/presentation/screens/button_screen.dart';
import 'package:widgets_app/presentation/screens/card_screen.dart';
import 'package:widgets_app/presentation/screens/progress_screen.dart';
import 'package:widgets_app/presentation/screens/snackbar_screen.dart';


class MenuItems {
  
  final String title;
  final String subtitle;
  final String link;
  final String routeName;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
    required this.routeName
  });

}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subtitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
    routeName: ButtonScreen.routeName
  ),
  MenuItems(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
    routeName: CardScreen.routeName
  ),
  MenuItems(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
    routeName: ProgressScreen.routeName
  ),
  MenuItems(
    title: 'Snackbars y diálogos',
    subtitle: 'Indicadores en pantalla',
    link: '/snackbar',
    icon: Icons.info_outline,
    routeName: SnackbarScreen.routeName
  ),
  MenuItems(
    title: 'AnimatedContainer',
    subtitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_outlined,
    routeName: AnimatedScreen.routeName
  ),
];