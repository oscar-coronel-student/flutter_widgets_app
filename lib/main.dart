import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/themes/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp())
  );
}

class MainApp extends ConsumerWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final AppTheme appTheme = ref.watch(themeNofifierProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      theme: appTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
  
}
