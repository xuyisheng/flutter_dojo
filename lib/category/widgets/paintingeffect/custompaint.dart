import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class CustomPaintWidget extends StatefulWidget {
  @override
  _CustomPaintWidgetState createState() => _CustomPaintWidgetState();
}

class _CustomPaintWidgetState extends State<CustomPaintWidget> {
  var pointMode;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Draw functions'),
        MultiSelectionWidget(
          'PointMode',
          PointMode.values,
          PointMode.values,
          (value) {
            setState(() => pointMode = value);
          },
        ),
        Container(
          color: Colors.green,
          constraints: const BoxConstraints.expand(height: 700),
          child: CustomPaint(
            painter: MyPainter(pointMode),
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  var pointMode;
  var mPaint = Paint()..strokeWidth = 4;
  var mPaintStroke = Paint()
    ..strokeWidth = 4
    ..style = PaintingStyle.stroke;

  MyPainter(this.pointMode);

  @override
  void paint(Canvas canvas, Size size) {
    if (pointMode == null) {
      pointMode = PointMode.points;
    }
    // 画点
    canvas.drawPoints(
        pointMode,
        [
          Offset(30.0, 30.0),
          Offset(60.0, 30.0),
          Offset(90.0, 30.0),
          Offset(30.0, 60.0),
          Offset(60.0, 60.0),
          Offset(90.0, 60.0),
          Offset(30.0, 90.0),
          Offset(60.0, 90.0),
          Offset(90.0, 90.0),
        ],
        mPaint);
    // 画线
    canvas.drawLine(Offset(30.0, 120.0), Offset(90.0, 120.0), mPaint);
    // 画弧
    canvas.drawArc(Rect.fromCircle(center: Offset(120.0, 30.0), radius: 60), 0, pi / 3, true, mPaint);
    canvas.drawArc(Rect.fromCircle(center: Offset(210.0, 30.0), radius: 60), 0, pi / 3, false, mPaint);
    canvas.drawArc(Rect.fromCircle(center: Offset(120.0, 90.0), radius: 60), 0, pi / 3, true, mPaintStroke);
    canvas.drawArc(Rect.fromCircle(center: Offset(210.0, 90.0), radius: 60), 0, pi / 3, false, mPaintStroke);
    // 画矩形
    canvas.drawRect(Rect.fromCircle(center: Offset(60.0, 180.0), radius: 30), mPaint);
    canvas.drawRect(Rect.fromCircle(center: Offset(150.0, 180.0), radius: 30), mPaintStroke);
    // 画圆角矩形
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromCircle(center: Offset(60.0, 270.0), radius: 30), Radius.circular(16)), mPaint);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromCircle(center: Offset(150.0, 270.0), radius: 30),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(16),
        ),
        mPaint);
    // 画嵌套矩形
    canvas.drawDRRect(RRect.fromRectXY(Rect.fromCircle(center: Offset(60.0, 360.0), radius: 40.0), 8.0, 8.0),
        RRect.fromRectXY(Rect.fromCircle(center: Offset(60.0, 360.0), radius: 30.0), 16.0, 16.0), mPaint);
    canvas.drawDRRect(RRect.fromRectXY(Rect.fromCircle(center: Offset(150.0, 360.0), radius: 40.0), 8.0, 8.0),
        RRect.fromRectXY(Rect.fromCircle(center: Offset(150.0, 360.0), radius: 30.0), 16.0, 16.0), mPaintStroke);
    // 画圆
    canvas.drawCircle(Offset(60, 450), 30, mPaint);
    canvas.drawCircle(Offset(150, 450), 30, mPaintStroke);
    // 画椭圆
    canvas.drawOval(Rect.fromCenter(center: Offset(60, 510), width: 60, height: 30), mPaint);
    canvas.drawOval(Rect.fromCenter(center: Offset(150, 510), width: 60, height: 30), mPaintStroke);
    // 画Path
    canvas.drawPath(
        Path()
          ..moveTo(240, 150)
          ..lineTo(300, 200)
          ..lineTo(240, 240),
        mPaintStroke);
    // 画阴影
    canvas.drawShadow(
        Path()
          ..moveTo(30.0, 540.0)
          ..lineTo(30.0, 600.0)
          ..lineTo(120.0, 600.0)
          ..lineTo(120.0, 540.0)
          ..close(),
        Colors.black,
        3,
        false);
    canvas.drawShadow(
        Path()
          ..moveTo(150.0, 540.0)
          ..lineTo(150.0, 600.0)
          ..lineTo(240.0, 600.0)
          ..lineTo(240.0, 540.0)
          ..close(),
        Colors.black,
        3,
        true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
