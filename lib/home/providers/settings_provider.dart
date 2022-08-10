import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  /*=====================[Variables]======================*/
  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  /*===================================================*/

  /*=====================[Methods]======================*/

  void changeLanguage(String newLanguage) {
    if (newLanguage == currentLanguage) {
      return;
    }
    currentLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) {
      return;
    }
    currentTheme = newTheme;
    notifyListeners();
  }

  bool isDarkMode() {
    return (currentTheme == ThemeMode.dark);
  }
  String getMainBackground(){
    return isDarkMode()? 'assets/images/background_pattern_dark.png':'assets/images/background_pattern.png';
  }
/*===================================================*/

}
