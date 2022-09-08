import 'package:flutter/material.dart';

class MyTheme {
  static final Color colorGold = Color(0xFFB7935F);
  static final Color colorYellow = Color(0xFFFACC1D);
  static final Color colorDarkBlue = Color(0xFF141A2E);

  static final ThemeData lightTheme = ThemeData(
      backgroundColor: Colors.white,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      primaryColor: colorGold,
      textTheme: const TextTheme(
        bodyText1:
            TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'my-font'),
        headline4:
            TextStyle(fontSize: 28, color: Colors.black, fontFamily: 'my-font'),
        headline5: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontFamily: 'my-font',
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'my-font')),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorGold,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedLabelStyle: TextStyle(
          color: Colors.black,
        ),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ));

  /*======================================================================*/
  static final ThemeData darkTheme = ThemeData(
      backgroundColor: colorDarkBlue,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorDarkBlue,
      ),
      primaryColor: colorYellow,
      textTheme: const TextTheme(
        bodyText1:
            TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'my-font'),
        headline4:
            TextStyle(fontSize: 28, color: Colors.white, fontFamily: 'my-font'),
        headline5: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontFamily: 'my-font',
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'my-font')),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorDarkBlue,
        selectedIconTheme: IconThemeData(color: colorYellow),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedLabelStyle: TextStyle(
          color: colorYellow,
        ),
        selectedItemColor: colorYellow,
        unselectedItemColor: Colors.white,
      ));
}
