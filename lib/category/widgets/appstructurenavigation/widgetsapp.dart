import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class WidgetsAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('WidgetsApp'),
        SubtitleWidget('WidgetsApp是Root Widget的一种，用于自定义一些属性时使用'),
        SubtitleWidget('MaterialApp是实现了Material Design的Root Widget'),
        SubtitleWidget('CupertinoApp是实现了iOS设计风格的Root Widget'),
      ],
    );
  }
}
