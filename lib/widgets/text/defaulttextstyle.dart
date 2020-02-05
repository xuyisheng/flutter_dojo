import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class DefaultTextStyleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('DefaultTextStyle基本使用'),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 60,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
          child: Text('Flutter'),
        ),
      ],
    );
  }
}
