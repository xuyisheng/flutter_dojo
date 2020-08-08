import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class IconDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('显示系统自带默认Icons数据'),
        Icon(
          Icons.train,
          color: Colors.red,
          size: 50,
        ),
        Icon(
          Icons.face,
          color: Colors.blue,
          size: 50,
        ),
        Icon(
          Icons.vibration,
          color: Colors.green,
          size: 50,
        ),
        Icon(
          Icons.g_translate,
          color: Colors.yellow,
          size: 50,
        ),
      ],
    );
  }
}
