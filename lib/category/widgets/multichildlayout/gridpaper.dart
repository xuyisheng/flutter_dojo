import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class GridPaperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('GridPaper基本使用'),
        Expanded(
          child: Container(
            color: Colors.blue,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 4,
              padding: const EdgeInsets.all(8),
              childAspectRatio: 3 / 2,
              children: <Widget>[
                GridPaper(
                  child: Text(
                    "Text1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GridPaper(
                  interval: 50,
                  divisions: 4,
                  subdivisions: 4,
                  child: Text(
                    "二次划分",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
