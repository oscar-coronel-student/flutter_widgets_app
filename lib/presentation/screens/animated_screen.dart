import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String routeName = 'animated';
  
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigoAccent;
  double borderRadius = 20.0;

  void changeShape(){
    final random = Random();

    final int red = random.nextInt(255);
    final int green = random.nextInt(255);
    final int blue = random.nextInt(255);

    width = random.nextInt(300) + 50;
    height = random.nextInt(500) + 50;
    color = Color.fromRGBO(red, green, blue, 1.0);
    borderRadius = (random.nextDouble() * 30) + 10;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: _AnimatedView(
        width: width,
        height: height,
        color: color,
        borderRadius: borderRadius,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}

class _AnimatedView extends StatelessWidget {
  
  final double width;
  final double height;
  final Color color;
  final double borderRadius;

  const _AnimatedView({
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius,
  });
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeOutCubic,
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius)
            ),
          ),
        ],
      ),
    );
  }

}