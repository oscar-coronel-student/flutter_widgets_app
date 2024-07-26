import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/animated_screen.dart';

import 'package:widgets_app/presentation/screens/home_screen.dart';
import 'package:widgets_app/presentation/screens/button_screen.dart';
import 'package:widgets_app/presentation/screens/card_screen.dart';
import 'package:widgets_app/presentation/screens/progress_screen.dart';
import 'package:widgets_app/presentation/screens/snackbar_screen.dart';
import 'package:widgets_app/presentation/screens/ui_controls_screen.dart';


// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.routeName,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: ButtonScreen.routeName,
      path: '/buttons',
      builder: (context, state) => const ButtonScreen(),
    ),
    GoRoute(
      name: CardScreen.routeName,
      path: '/cards',
      builder: (context, state) => const CardScreen(),
    ),
    GoRoute(
      name: ProgressScreen.routeName,
      path: '/progress',
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/snackbar',
      name: SnackbarScreen.routeName,
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.routeName,
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: '/ui_controls',
      name: UiControlsScreen.routeName,
      builder: (context, state) => const UiControlsScreen(),
    ),
  ],
);