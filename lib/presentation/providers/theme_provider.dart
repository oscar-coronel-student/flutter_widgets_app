import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final colorListProvider = Provider<List<Color>>((ref) => colors);



final themeNofifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

class ThemeNotifier extends StateNotifier<AppTheme> {

  ThemeNotifier(): super( AppTheme() );

  void toggleDarkmode(){
    state = state.copyWith( isDarkMode: !state.isDarkMode );
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith( selectedColor: colorIndex );
  }

}