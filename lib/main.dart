import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/home/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/quran/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:MyTheme.lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
          HadethDetailsScreen.routeName:(_)=> HadethDetailsScreen(),
        });
  }
}
