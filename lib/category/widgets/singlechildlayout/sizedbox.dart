import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

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
      ],
    );
  }
}
