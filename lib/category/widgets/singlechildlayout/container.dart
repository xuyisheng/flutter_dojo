import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Container基本使用'),
        SubtitleWidget('Container在没有子节点的时候，会试图变得足够大，Container在带有子节点的时候，会根据子节点的尺寸调节自身大小'),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
        SubtitleWidget('Container 设置渐变'),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.green,
            gradient: RadialGradient(colors: [Colors.green, Colors.blue], stops: [0.5, 1]),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SubtitleWidget('Container与DecoratedBox在使用Border时的不同'),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 10),
          ),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Text('DecoratedBox的border会占据子widget的显示区域'),
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 10),
          ),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Text('Container的border会占据子widget的显示区域'),
          ),
        ),
      ],
    );
  }
}
