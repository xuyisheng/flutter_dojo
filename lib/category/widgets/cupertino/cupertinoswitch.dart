import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoSwitchWidget extends StatefulWidget {
  @override
  _CupertinoSwitchWidgetState createState() => _CupertinoSwitchWidgetState();
}

class _CupertinoSwitchWidgetState extends State<CupertinoSwitchWidget> {
  bool flag1 = false;
  bool flag2 = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Switch基本使用'),
          CupertinoSwitch(
            value: flag1,
            onChanged: (value) {
              setState(() => flag1 = value);
            },
          ),
          CupertinoSwitch(
            value: flag2,
            activeColor: Colors.blue,
            onChanged: (value) {
              setState(() => flag2 = value);
            },
          )
        ],
      ),
    );
  }
}
