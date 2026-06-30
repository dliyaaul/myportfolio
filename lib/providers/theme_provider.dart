import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool darkMode = true;

  void toggleTheme() {
    darkMode = !darkMode;
    notifyListeners();
  }
}
