import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class IconThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('IconTheme基本使用'),
        SubtitleWidget('给Icon设置Theme 白色50%透明度'),
        AppBar(
          actions: <Widget>[
            IconTheme(
              data: IconThemeData(
                color: Colors.white,
                opacity: 0.5,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.account_balance),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.access_alarm),
                  ),
                ],
              ),
            ),
          ],
        ),
        SubtitleWidget('给Icon设置Theme 白色'),
        AppBar(
          actions: <Widget>[
            IconTheme(
              data: IconThemeData(color: Colors.white),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                    size: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text('like'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
