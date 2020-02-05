import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoColorsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('CupertinoIcons基本用法'),
        Container(
          height: 60,
          color: CupertinoColors.activeBlue,
        ),
        Container(
          height: 60,
          color: CupertinoColors.activeGreen,
        ),
        Container(
          height: 60,
          color: CupertinoColors.activeOrange,
        ),
        Container(
          height: 60,
          color: CupertinoColors.destructiveRed,
        ),
        Container(
          height: 60,
          color: CupertinoColors.darkBackgroundGray,
        ),
        Container(
          height: 60,
          color: CupertinoColors.extraLightBackgroundGray,
        ),
      ],
    );
  }
}
