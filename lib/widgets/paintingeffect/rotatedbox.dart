import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class RotatedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('RotatedBox基本使用'),
        Container(
          color: Colors.blue,
          child: RotatedBox(
            quarterTurns: 3,
            child: const Text('RotatedBox  RotatedBox'),
          ),
        ),
      ],
    );
  }
}
