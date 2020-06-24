import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class SizedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('SizedBox基本使用'),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: Container(
            color: Colors.green,
            child: Text('SizedBox'),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: Container(
            color: Colors.green,
            child: Text('SizedBox'),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        SubtitleWidget('通过fromSize、expand简化创建'),
        Container(
          width: 100,
          height: 100,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
          ),
          child: SizedBox.expand(
            child: Text('expand'),
          ),
        ),
      ],
    );
  }
}
