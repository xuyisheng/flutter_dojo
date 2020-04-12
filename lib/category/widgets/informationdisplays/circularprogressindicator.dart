import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('CircularProgressIndicator基本使用'),
        Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
        SubtitleWidget('固定Value'),
        Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            value: 0.5,
          ),
        ),
        MainTitleWidget('CircularProgressIndicator自定义'),
        Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
