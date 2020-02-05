import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class PositionedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Positioned基本使用'),
        SubtitleWidget('Positioned与PositionedDirectional的区别为横方向上使用的参数名不同'),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                color: Colors.yellow,
              ),
              Positioned(
                top: 20,
                left: 20,
                width: 100,
                height: 100,
                child: Container(
                  color: Colors.blue,
                  child: Text('Child with Positioned'),
                ),
              ),
              PositionedDirectional(
                start: 80,
                top: 140,
                child: Container(
                  color: Colors.orange,
                  child: Text('Child with PositionedDirectional'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
