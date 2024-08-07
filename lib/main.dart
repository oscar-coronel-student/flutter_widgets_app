import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp())
  );
}

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Flutter Widgets',
      theme: AppTheme(index: 0).getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
  
}
