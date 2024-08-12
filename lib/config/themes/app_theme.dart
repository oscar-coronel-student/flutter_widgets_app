import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.purpleAccent,
  Colors.cyanAccent,
  Colors.yellowAccent,
  Colors.redAccent
];

class AppTheme {

  final int colorIndex;
  final bool isDarkMode;

  const AppTheme({
    int index = 0,
    bool mode = false
  }):
    assert(index >= 0 && index < colors.length, 'Index no soportado para setear el color en el tema'),
    colorIndex = index,
    isDarkMode = mode;

  ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colors[colorIndex],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: colors[colorIndex],
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      )
    );
  }

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode
  }) => AppTheme(
    index: selectedColor ?? colorIndex,
    mode: isDarkMode ?? this.isDarkMode
  );

}