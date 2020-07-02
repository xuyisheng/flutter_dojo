import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class TransformWidget extends StatefulWidget {
  @override
  _TransformWidgetState createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> {
  double scale = 1;
  double angle = 0;
  double offsetX = 0;
  var rotatePoint = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Transform基本使用'),
          Container(
            margin: EdgeInsets.only(top: 60),
            color: Colors.blue,
            child: Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.skewY(0.2)..rotateZ(pi / 20),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.red,
                child: const Text('Transform widget'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60),
            color: Colors.blue,
            child: Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.translationValues(10, 10, 0)..rotateZ(pi),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.red,
                child: const Text('Transform widget'),
              ),
            ),
          ),
          SubtitleWidget('通过设置Transform origin属性来修改Transform中心点'),
          SubtitleWidget('通过设置Transform transformHitTests属性来设置是否修改点击区域'),
          MainTitleWidget('Transform突破容器的边界'),
          SizedBox(height: 40),
          Center(
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blueAccent,
              child: Align(
                alignment: Alignment.topCenter,
                child: Transform.translate(
                  offset: Offset(0, -20),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          MainTitleWidget('Transform scale rotate translate'),
          Transform.scale(
            scale: scale,
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
              child: Center(child: Text('scale')),
            ),
          ),
          Slider(
            value: scale,
            min: 0.5,
            max: 1.5,
            onChanged: (value) {
              setState(() {
                scale = value;
              });
            },
          ),
          Transform.rotate(
            angle: angle,
            alignment: rotatePoint,
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
              child: Center(child: Text('rotate')),
            ),
          ),
          SubtitleWidget('通过改变alignment来修改旋转中心点'),
          MultiSelectionWidget(
            'Rotate Point',
            [
              Alignment.topLeft,
              Alignment.centerLeft,
              Alignment.center,
              Alignment.bottomRight,
              Alignment.bottomCenter,
              Alignment.bottomLeft,
              Alignment.centerRight,
              Alignment.topCenter,
              Alignment.topRight,
            ],
            [
              'topLeft',
              'centerLeft',
              'center',
              'bottomRight',
              'bottomCenter',
              'bottomLeft',
              'centerRight',
              'topCenter',
              'topRight',
            ],
            (value) {
              setState(() => rotatePoint = value);
            },
          ),
          Slider(
            value: angle,
            min: -pi / 2,
            max: pi / 2,
            onChanged: (value) {
              setState(() {
                angle = value;
              });
            },
          ),
          Transform.translate(
            offset: Offset(offsetX, 0),
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
              child: Center(child: Text('translate')),
            ),
          ),
          Slider(
            value: offsetX,
            min: 0,
            max: 100,
            onChanged: (value) {
              setState(() => offsetX = value);
            },
          ),
        ],
      ),
    );
  }
}
