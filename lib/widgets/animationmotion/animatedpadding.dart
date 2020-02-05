import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  @override
  _AnimatedPaddingWidgetState createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  double paddingValue = 0;

  _changePadding() {
    paddingValue = Random().nextDouble() * 100;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('AnimatedPadding基本使用'),
        SubtitleWidget('改变Padding的时候使用动画效果'),
        Container(
          width: double.infinity,
          height: 400,
          color: Colors.red,
          child: AnimatedPadding(
            padding: EdgeInsets.all(paddingValue),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
          ),
        ),
        RaisedButton(
          onPressed: _changePadding,
          child: Text('change padding'),
        ),
      ],
    );
  }
}
