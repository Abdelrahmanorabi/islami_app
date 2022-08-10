import 'package:flutter/material.dart';
import 'package:islami_app/home/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class VerseWidget extends StatelessWidget {
  String content;
  int index;

  VerseWidget(this.content, this.index);

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    return Container(
        // alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          ' { ${index+1 } }     $content ',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: settingProvider.isDarkMode()? Theme.of(context).primaryColor : Colors.black

          ),
          textAlign: TextAlign.center,
        ));
  }
}
