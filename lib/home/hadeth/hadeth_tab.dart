import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../my_theme.dart';
import 'hadeth_name_widget.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  /*===================[Variables]==========================*/
  List<Hadeth> hadethList = [];

  /*========================================================*/

  /*===================[Methods]==========================*/

  void readHadethFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<Hadeth> ahadethOfFile = [];

    List<String> allHadeth = fileContent.trim().split('#');
    for (int i = 0; i < allHadeth.length; i++) {
      List<String> hadethLines = allHadeth[i].trim().split('\n');
      String title = hadethLines[0];
      if (title.isEmpty) continue;
      hadethLines.removeAt(0);
      String content = hadethLines.join('\n');
      Hadeth hadeth = Hadeth(title, content);
      ahadethOfFile.add(hadeth);
    }
    hadethList = ahadethOfFile;
    setState(() {});
  }

  /*========================================================*/

  @override
  Widget build(BuildContext context) {
    if(hadethList.isEmpty){readHadethFile();}
    return Column(
      children: [
        Image.asset('assets/images/hadeth_header_image.png'),
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal:
                      BorderSide(color: MyTheme.primaryColor, width: 2)),
            ),
            child: Text('Names', style: Theme.of(context).textTheme.headline4)),
        Expanded(
            child: ListView.separated(
                itemCount: hadethList.length,
                itemBuilder: (context, int index) {
                  return HadethNameWidget(hadethList[index].title,hadethList[index].content);

                },
              separatorBuilder: (context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 64),
                  width: double.infinity,
                  height: 10,
                );
              },

            ))
      ],
    );
  }
}

// Data class
class Hadeth {
  String title;
  String content;

  Hadeth(this.title, this.content);
}
