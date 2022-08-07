import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/hadeth_details_screen.dart';

class HadethNameWidget extends StatelessWidget {
  String title;
  String content;
  HadethNameWidget(this.title,this.content);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: HadethDetailsArguments(title,content)
      );
      },
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          )),
    );
  }
}
