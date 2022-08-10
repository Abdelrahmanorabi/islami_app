import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/providers/settings_provider.dart';
import 'package:islami_app/home/quran/sura_details.dart';
import 'package:provider/provider.dart';
import 'my_theme.dart';

void main() {
  runApp(ChangeNotifierProvider <SettingsProvider>(
      create: (BuildContext context) {
          return SettingsProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);


    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode:settingProvider.currentTheme ,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(settingProvider.currentLanguage),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
          HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
        });
  }
}
