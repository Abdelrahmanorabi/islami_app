import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/providers/settings_provider.dart';
import 'package:islami_app/home/quran/sura_details.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_theme.dart';

void main() {
  runApp(ChangeNotifierProvider<SettingsProvider>(
      create: (BuildContext context) {
        return SettingsProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  /*===========================[Variables]=============================*/
  late SettingsProvider settingProvider;

  /*==================================================================*/
  /*===========================[Methods]=============================*/
  void getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    // set default language
    settingProvider.changeLanguage(prefs.getString('lang') ?? 'ar');

    // get default theme
    if (prefs.getString('theme') == 'light') {
      settingProvider.changeTheme(ThemeMode.light);
    } else if (prefs.getString('theme') == 'dark') {
      settingProvider.changeTheme(ThemeMode.dark);
    }
  }
  /*==================================================================*/

  @override
  Widget build(BuildContext context) {
    settingProvider = Provider.of<SettingsProvider>(context);
    getSharedPreferences();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: settingProvider.currentTheme,
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
