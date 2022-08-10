import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  /*=====================[Variables]======================*/
  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  /*===================================================*/

  /*=====================[Methods]======================*/

  void changeLanguage(String newLanguage) async {
    final prefs = await SharedPreferences.getInstance();
    if (newLanguage == currentLanguage) {
      return;
    }
    currentLanguage = newLanguage;
    prefs.setString('lang', currentLanguage);
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) async {
    final prefs = await SharedPreferences.getInstance();
    if (newTheme == currentTheme) {
      return;
    }
    currentTheme = newTheme;
    prefs.setString(
        'theme', (currentTheme == ThemeMode.light) ? 'light' : 'dark');
    notifyListeners();
  }

  bool isDarkMode() {
    return (currentTheme == ThemeMode.dark);
  }

  String getMainBackground() {
    return isDarkMode()
        ? 'assets/images/background_pattern_dark.png'
        : 'assets/images/background_pattern.png';
  }

/*===================================================*/

}
