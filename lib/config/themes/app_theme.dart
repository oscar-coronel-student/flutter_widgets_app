import 'package:flutter/material.dart';

const List<Color> _colors = [
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.purpleAccent,
  Colors.cyanAccent,
  Colors.yellowAccent,
  Colors.redAccent
];

class AppTheme {

  final int colorIndex;

  const AppTheme({
    required int index
  }):
    assert(index >= 0 && index < _colors.length, 'Index no soportado para setear el color en el tema'),
    colorIndex = index;

  ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colors[colorIndex],
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: _colors[colorIndex],
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

}