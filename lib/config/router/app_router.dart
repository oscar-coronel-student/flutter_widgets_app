import 'package:go_router/go_router.dart';

import 'package:widgets_app/presentation/screens/home_screen.dart';
import 'package:widgets_app/presentation/screens/button_screen.dart';
import 'package:widgets_app/presentation/screens/card_screen.dart';


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
  ],
);