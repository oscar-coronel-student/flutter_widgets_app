import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const String routeName = 'counter';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            },
            icon: Icon(
              isDarkMode 
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined
            )
          )
        ],
      ),
      body: const _CounterView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          /* ref.read(counterProvider.notifier).state++; */
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}

class _CounterView extends ConsumerWidget {
  
  const _CounterView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final counter = ref.watch(counterProvider);
    final titleTheme = Theme.of(context).textTheme.titleLarge;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Valor: $counter', style: titleTheme)
        ],
      ),
    );
  }
}