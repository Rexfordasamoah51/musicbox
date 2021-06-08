import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:musicbox/logic/services/theme/theme.dart';

// State
final themeDark = MusicBoxAppTheme.dark();
final themeLight = MusicBoxAppTheme.light();

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  /// Setting the default textTheme
  var textTheme = themeDark.textTheme;

  // Method
  void updateTheme(bool value) {
    if (value == true) {
      textTheme = themeLight.textTheme;
      emit(ThemeMode.light);
    } else {
      textTheme = themeLight.textTheme;
      emit(ThemeMode.dark);
    }
  }
}
