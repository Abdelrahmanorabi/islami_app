import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/hadeth_tab.dart';
import 'package:islami_app/home/quran/quran_tab.dart';
import 'package:islami_app/home/radio/radio_tab.dart';
import 'package:islami_app/home/tasbeh/sebha_tab.dart';
import 'package:islami_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*===================[Variables]==========================*/
  int selectedIndex = 0;
  List<Widget> tabs = [QuranTab(), HadethTab(), SebhaTab(), RadioTab()];

  /*========================================================*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/background_pattern.png',
                ))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title)),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: MyTheme.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (int index) {
                selectedIndex = index;
                setState(() {});
              },
              items:  [
                BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/ic_quran.png')),
                  label: AppLocalizations.of(context)!.quran_title,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                  label:  AppLocalizations.of(context)!.hadeth_title,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                  label:  AppLocalizations.of(context)!.tasbeh_title,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/ic_radio.png')),
                  label:  AppLocalizations.of(context)!.radio_title,
                ),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ),
    );

  }
}
