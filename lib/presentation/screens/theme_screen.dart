import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {

  static const String routeName = 'theme';

  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Themes'),
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
      body: const _ThemeView(),
    );
  }
}

class _ThemeView extends ConsumerWidget {
  
  const _ThemeView();

  @override
  Widget build(BuildContext context, ref) {

    final colors = ref.watch(colorListProvider);
    final selectedColorIndex = ref.watch(selectedIndexColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle( color: color)),
          subtitle: Text('${ color.value }'),
          activeColor: color,
          value: index,
          groupValue: selectedColorIndex,
          onChanged: (value){
            if(value != null){
              ref.read(selectedIndexColorProvider.notifier).update((state) => value);
            }
          }
        );
      },
    );
  }

}