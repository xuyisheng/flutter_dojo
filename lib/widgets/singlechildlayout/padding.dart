import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Padding基本使用'),
        Container(
          color: Colors.cyan,
          padding: EdgeInsets.all(16),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
