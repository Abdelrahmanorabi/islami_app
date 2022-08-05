import 'package:flutter/material.dart';
import 'package:islami_app/hadeth_tab.dart';
import 'package:islami_app/my_colors.dart';
import 'package:islami_app/quran_tab.dart';
import 'package:islami_app/radio_tab.dart';
import 'package:islami_app/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*===================[Variables]==========================*/
  int selectedIndex = 0;
  List<Widget> tabs = [QuranTab(),HadethTab(),SebhaTab(),RadioTab()];

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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: const Text(
              'Islami',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'my-font'),
            ),
          ),
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: MyColors.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (int index) {
                selectedIndex = index;
                setState(() {});
              },
              selectedIconTheme: const IconThemeData(color: Colors.black),
              unselectedIconTheme: const IconThemeData(color: Colors.white),
              selectedLabelStyle: const TextStyle(color: Colors.black,),
              selectedItemColor: Colors.brown,
              unselectedItemColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                  label: 'Sebha',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                  label: 'Hadeth',
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
