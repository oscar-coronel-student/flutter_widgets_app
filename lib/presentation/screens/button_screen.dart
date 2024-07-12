import 'package:flutter/material.dart';


class ButtonScreen extends StatelessWidget {

  static const String routeName = 'buttons';
  
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const Placeholder(),
    );
  }
}