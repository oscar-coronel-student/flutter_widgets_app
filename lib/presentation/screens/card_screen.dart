import 'package:flutter/material.dart';


class CardScreen extends StatelessWidget {

  static const String routeName = 'cards';
  
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Screen'),
      ),
      body: const Placeholder(),
    );
  }
}