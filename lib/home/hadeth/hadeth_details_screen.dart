import 'package:flutter/material.dart';
import 'package:islami_app/home/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../my_theme.dart';
import 'hadeth_tab.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth-details';

  @override
  State<HadethDetailsScreen> createState() => _hadethStatScreen();
}

class _hadethStatScreen extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    var args =
        ModalRoute.of(context)!.settings.arguments as Hadeth;

    return SafeArea(
        child: Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                settingProvider.getMainBackground(),
              ))),
      child: Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title)
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 64),
          padding: EdgeInsets.all(20),
          height: 700,
          decoration: BoxDecoration(
            color: settingProvider.isDarkMode()? Theme.of(context).backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Text(args.title,style: Theme.of(context).textTheme.headline4!.copyWith(
                color: settingProvider.isDarkMode()? Theme.of(context).primaryColor : Colors.black
              )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                width: double.infinity,
                height: 1.5,
                color:Theme.of(context).primaryColor,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    args.content,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: settingProvider.isDarkMode()? Theme.of(context).primaryColor : Colors.black

                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

