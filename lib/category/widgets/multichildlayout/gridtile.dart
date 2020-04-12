import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class GridTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('GridTile基本使用'),
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
                GridTile(
                  header: Text(
                    "GridTile header",
                    style: TextStyle(color: Colors.white),
                  ),
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "GridTile child",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  footer: Text(
                    "GridTile footer",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GridTile(
                  header: GridTileBar(
                    title: Text('title'),
                    subtitle: Text('subtitle'),
                    leading: Icon(Icons.title),
                    trailing: Text("trailing"),
                  ),
                  child: Container(
                    child: Text(
                      "GridTile child",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  footer: Text(
                    "GridTile footer",
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
