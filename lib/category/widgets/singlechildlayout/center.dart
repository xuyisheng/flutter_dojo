import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Center基本使用'),
        Container(
          width: 300,
          height: 300,
          color: Colors.yellow,
          child: Center(
            child: Text('Center'),
          ),
        ),
        Container(
          color: Colors.cyan,
          child: Center(
            widthFactor: 4,
            heightFactor: 4,
            child: Text('Center'),
          ),
        ),
      ],
    );
  }
}
