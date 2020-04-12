import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';
import 'package:vector_math/vector_math_64.dart' as v;

class Matrix4Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Scale'),
          Stack(
            children: <Widget>[
              Transform(
                transform: Matrix4.identity()..scale(1.2, 1.2, 1),
                alignment: Alignment.topCenter,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              ),
            ],
          ),
          MainTitleWidget('Translate'),
          Stack(
            children: <Widget>[
              Transform(
                transform: Matrix4.identity()..translate(100.0, 0, 0),
                alignment: Alignment.topCenter,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              ),
            ],
          ),
          MainTitleWidget('Rotate'),
          Stack(
            children: <Widget>[
              Transform(
                transform: Matrix4.identity()..rotateZ(pi / 4),
                alignment: Alignment.topLeft,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              ),
            ],
          ),
          MainTitleWidget('Skew'),
          Stack(
            children: <Widget>[
              Transform(
                transform: Matrix4.skewX(0.5),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              ),
            ],
          ),
          MainTitleWidget('Matrix inverted'),
          SubtitleWidget('通常用来实现镜像效果'),
          Stack(
            children: <Widget>[
              Transform(
                transform: Matrix4.skewX(0.5),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Transform(
                transform: Matrix4.inverted(Matrix4.skewX(0.5)),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                ),
              ),
            ],
          ),
          MainTitleWidget('Matrix Compose'),
          Stack(
            children: <Widget>[
              Transform(
                transform: Matrix4.compose(
                  v.Vector3(100, 0, 0),
                  v.Quaternion.random(Random()),
                  v.Vector3(1.2, 1.2, 1.2),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              ),
            ],
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
