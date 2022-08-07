import 'package:flutter/material.dart';

class MyTheme {
  static final Color primaryColor = Color(0xFFB7935F);
  static final ThemeData lightTheme = ThemeData(
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedLabelStyle: TextStyle(
          color: Colors.black,
        ),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ));
}
