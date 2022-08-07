import 'package:flutter/material.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth-details';

  @override
  State<HadethDetailsScreen> createState() => _hadethStatScreen();
}

class _hadethStatScreen extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as HadethDetailsArguments;

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
          title: Text(args.title),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 64),
          padding: EdgeInsets.all(20),
          height: 700,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: SingleChildScrollView(
            child: Text(
              args.content,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ));
  }
}

// Data class
class HadethDetailsArguments {
  String title;
  String content;

  HadethDetailsArguments(this.title, this.content);
}
