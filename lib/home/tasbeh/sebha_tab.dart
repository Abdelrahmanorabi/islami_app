import 'package:flutter/material.dart';
import 'package:islami_app/home/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  /*===================[Variables]==========================*/
  double angle = 0;
  int counter = 0;
  int currentIndex = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد الله',
    'لا اله الا الله',
    ' الله أكبر'
  ];

  /*========================================================*/
  void rotateSebhaBody() {
    angle--;
    counter++;
    if(counter== 34){
      currentIndex++;
      counter=0;
    }
    if(currentIndex>azkar.length-1){
      currentIndex=0;
    }
    setState(() {});

  }

  /*========================================================*/
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            height: size.height * .45,
            child: Stack(
              children: [
                Positioned(
                    left: size.width * .44,
                    child: Image.asset(settingProvider.isDarkMode()
                        ? 'assets/images/sebha_head_dark.png'
                        : 'assets/images/sebha_head_light.png')),
                Positioned(
                    left: size.width * .20,
                    top: size.height * .11,
                    child: InkWell(
                      onTap: rotateSebhaBody,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Transform.rotate(
                        angle: angle,
                        child: Image.asset(settingProvider.isDarkMode()
                            ? 'assets/images/sebha_body_dark.png'
                            : 'assets/images/sebha_body_light.png'),
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            'عدد  التسبيحات',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 13,
          ),
          Container(
            width: 75,
            height: 85,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: (settingProvider.isDarkMode())
                    ? Color(0xFF141A2E)
                    : Color(0xFFB7935F),
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 135,
            height: 50,
            decoration: BoxDecoration(
                color: (settingProvider.isDarkMode())
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              '${azkar[currentIndex]}',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
                color: (settingProvider.isDarkMode())? Colors.black : Colors.white
              ),

            ),
          )
        ],
      ),
    );
  }
}
