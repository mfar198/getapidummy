import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _themeData = isDarkMode ? darkMode : lightMode;
    notifyListeners();
  }

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = _themeData == darkMode;
    await prefs.setBool('isDarkMode', !isDarkMode);
    _themeData = isDarkMode ? lightMode : darkMode;
    notifyListeners();
  }
}