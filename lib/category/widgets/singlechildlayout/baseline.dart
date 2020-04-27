import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class BaselineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Baseline基本使用'),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 60),
            color: Colors.blue,
            height: 120,
            width: 120,
            child: Baseline(
              child: Container(
                color: Colors.red,
                height: 60,
                width: 60,
              ),
              baseline: 20,
              baselineType: TextBaseline.alphabetic,
            ),
          ),
        ),
        MainTitleWidget('根据child baseline定位child widget'),
        SubtitleWidget('如果child有baseline，则根据child的baseline属性，调整child的位置'),
        SubtitleWidget('如果child没有baseline，则根据child的bottom，来调整child的位置'),
        Row(
          children: <Widget>[
            Baseline(
              baseline: 50,
//                baselineType: TextBaseline.alphabetic, // 对齐字符底部的水平线
              baselineType: TextBaseline.ideographic, // 对齐表意字符的水平线
              child: Text(
                'fontSize：12',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Baseline(
              baseline: 50,
              baselineType: TextBaseline.ideographic,
              child: Container(
                width: 30,
                height: 30,
                color: Colors.red,
              ),
            ),
            Baseline(
              baseline: 50,
              baselineType: TextBaseline.ideographic,
              child: Text(
                'Text ：25',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
