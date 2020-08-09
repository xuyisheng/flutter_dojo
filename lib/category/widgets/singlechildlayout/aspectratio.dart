import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AspectRatioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('AspectRatio基本使用'),
        SubtitleWidget('Show AspectRatio 4:3'),
        Container(
          color: Colors.red,
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Image(
              image: AssetImage('assets/images/book.jpg'),
            ),
          ),
        ),
        SubtitleWidget('Show AspectRatio 3:4'),
        Container(
          color: Colors.blue,
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: Image(
              image: AssetImage('assets/images/book.jpg'),
            ),
          ),
        ),
      ],
    );
  }
}
