import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class PlaceholderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Placeholder基本使用'),
        Container(
          width: 200,
          height: 200,
          color: Colors.white,
          child: Placeholder(
            color: Colors.blue,
          ),
        ),
        MainTitleWidget('Placeholder修改线条和颜色'),
        Container(
          width: 200,
          height: 200,
          color: Colors.white,
          child: Placeholder(
            color: Colors.green,
            strokeWidth: 5,
          ),
        ),
      ],
    );
  }
}
