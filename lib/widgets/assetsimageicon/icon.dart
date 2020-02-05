import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('显示系统自带默认Icons数据'),
        Icon(
          Icons.access_alarm,
          color: Colors.blue,
          size: 50,
        ),
        MainTitleWidget('显示Asset数据'),
        SubtitleWidget('修改Icon颜色、Size'),
        ImageIcon(
          AssetImage('images/logo.png'),
          color: Colors.red,
          size: 50.0,
        ),
      ],
    );
  }
}
