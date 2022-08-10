import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/providers/settings_provider.dart';
import 'package:islami_app/home/quran/verse_widget.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  /*===================[Variables]==========================*/
  List<String> verses = [];

/*========================================================*/
/*===================[Methods]==========================*/

  void readFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.trim().split('\n');
    verses = lines;
    setState(() {});
  }

/*========================================================*/
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    var arguments =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;

    if (verses.isEmpty) {
      readFile(arguments.index);
    }
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  settingProvider.getMainBackground(),
                ))),
        child: Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context)!.app_title)),
          body: (verses.isEmpty)
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 64),
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: settingProvider.isDarkMode()
                        ? Theme.of(context).backgroundColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Text(arguments.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: settingProvider.isDarkMode()
                                      ? Theme.of(context).primaryColor
                                      : Colors.black)),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        width: double.infinity,
                        height: 1.5,
                        color: Theme.of(context).primaryColor,
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemCount: verses.length,
                            itemBuilder: (context, int index) {
                              return VerseWidget(verses[index], index);
                            },
                            separatorBuilder: (context, int index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 64),
                                width: double.infinity,
                                height: 2,
                                color: Theme.of(context).primaryColor,
                              );
                            }),
                      ),
                    ],
                  )),
        ),
      ),
    );
  }
}

// Data class
class SuraDetailsArguments {
  int index;
  String title;

  SuraDetailsArguments(this.index, this.title);
}
