import 'package:flutter/material.dart';

class AppTutorialScreen extends StatelessWidget {

  static const String routeName = 'app_tutorial';
  
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Tutorial'),
      ),
      body: const _AppTutorialView(),
    );
  }

}

class _AppTutorialView extends StatelessWidget {

  const _AppTutorialView();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
}