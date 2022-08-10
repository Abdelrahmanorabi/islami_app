import 'package:flutter/material.dart';
import 'package:islami_app/home/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  /*=====================[Methods]======================*/
  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  Widget getUnSelectedItem(String text) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }

  /*===================================================*/
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeLanguage('en');
              },
              child: (settingsProvider.currentLanguage == 'en')
                  ? getSelectedItem('English')
                  : getUnSelectedItem('English')),
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeLanguage('ar');
              },
              child: (settingsProvider.currentLanguage == 'ar')
                  ? getSelectedItem('العربية')
                  : getUnSelectedItem('العربية'))
        ],
      ),
    );
  }
}
