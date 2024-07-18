import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const String routeName = 'progress';
  
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }

}

class _ProgressView extends StatelessWidget {

  const _ProgressView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        children: [
          const SizedBox( height: 30, ),
          const Text('Circular Progress Indicator'),
          const SizedBox( height: 10 ),
          CircularProgressIndicator(
            backgroundColor: Colors.black45,
            color: colors.primary,
            strokeWidth: 2
          ),

          const SizedBox( height: 20 ),
          const Text('Circular y Linear Controlado'),
          const SizedBox( height: 10 ),
          const _ControlledProgressIndicator()
        ],
      )
    );
  }

}

class _ControlledProgressIndicator extends StatelessWidget {

  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: Stream.periodic( const Duration( milliseconds: 300 ), (value){
        return value * 2 / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator( 
                backgroundColor: Colors.black12,
                strokeWidth: 2,
                value: progressValue,
              ),
              const SizedBox( width: 20 ),
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                )
              )
            ],
          ),
        );
      }
    );
  }

}