import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class IconDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('显示系统自带默认Icons数据'),
        Icon(
          IconData(
            0xe570,
            fontFamily: 'MaterialIcons',
            matchTextDirection: true,
          ),
          color: Colors.red,
          size: 50,
        ),
        Icon(
          IconData(
            0xe571,
            fontFamily: 'MaterialIcons',
            matchTextDirection: true,
          ),
          color: Colors.blue,
          size: 50,
        ),
        Icon(
          IconData(
            0xe572,
            fontFamily: 'MaterialIcons',
            matchTextDirection: true,
          ),
          color: Colors.green,
          size: 50,
        ),
        Icon(
          IconData(
            0xe574,
            fontFamily: 'MaterialIcons',
            matchTextDirection: true,
          ),
          color: Colors.yellow,
          size: 50,
        ),
      ],
    );
  }
}
