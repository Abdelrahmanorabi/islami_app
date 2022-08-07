import 'package:flutter/material.dart';

class VerseWidget extends StatelessWidget {
  String content;
  int index;

  VerseWidget(this.content, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        // alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          ' { ${index+1 } }     $content ',
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ));
  }
}
