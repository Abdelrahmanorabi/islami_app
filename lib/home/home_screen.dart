import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/hadeth_tab.dart';
import 'package:islami_app/home/quran/quran_tab.dart';
import 'package:islami_app/home/radio/radio_tab.dart';
import 'package:islami_app/home/tasbeh/sebha_tab.dart';
import 'package:islami_app/my_theme.dart';


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
            title: const Text(
              'Islami',
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: MyTheme.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (int index) {
                selectedIndex = index;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                  label: 'Hadeth',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                  label: 'Sebha',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                  label: 'Radio',
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
