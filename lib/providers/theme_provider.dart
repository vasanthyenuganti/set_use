import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _theme = ThemeMode.light;
  ThemeMode get theme => _theme;

  void themeOnChange(bool t) {
    if (t) {
      _theme = ThemeMode.dark;
      notifyListeners();
    } else {
      _theme = ThemeMode.light;
      notifyListeners();
    }
  }
}
