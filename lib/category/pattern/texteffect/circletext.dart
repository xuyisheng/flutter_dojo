import 'dart:math';

import 'package:flutter/material.dart';

class CircleTextWidget extends StatefulWidget {
  @override
  _CircleTextWidgetState createState() => _CircleTextWidgetState();
}

class _CircleTextWidgetState extends State<CircleTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: CustomPaint(
          painter: _CircularTextPainter(
            texts: Text('XuYisheng ZhuJia Android Flutter'),
          ),
        ),
      ),
    );
  }
}

class _CircularTextPainter extends CustomPainter {
  final Text texts;

  double _radius = 0.0;
  var backgroundPaint = Paint()..color = Colors.grey;

  _CircularTextPainter({this.texts});

  @override
  void paint(Canvas canvas, Size size) {
    _radius = min(size.width / 2, size.height / 2);
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawCircle(Offset.zero, _radius, backgroundPaint);

    canvas.save();
    List<TextPainter> _charPainters = [];
    for (final char in texts.data.split('')) {
      _charPainters.add(
        TextPainter(
          text: TextSpan(
            text: char,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout(),
      );
    }
    _paintTextClockwise(canvas, size, _charPainters);
    canvas.restore();
  }

  void _paintTextClockwise(Canvas canvas, Size size, List<TextPainter> _charPainters) {
    bool hasStrokeStyle = backgroundPaint.style == PaintingStyle.stroke && backgroundPaint.strokeWidth > 0.0;
    double space = 10;
    var startAngle = -90;
    double angleShift = 0;
    canvas.rotate((startAngle + 90 - angleShift) * pi / 180);
    for (int i = 0; i < _charPainters.length; i++) {
      final tp = _charPainters[i];
      final x = -tp.width / 2;
      final y = -_radius - (hasStrokeStyle ? tp.height / 2 : 0.0);

      tp.paint(canvas, Offset(x, y));
      canvas.rotate(space * pi / 180);
    }
  }

  @override
  bool shouldRepaint(_CircularTextPainter oldDelegate) {
    bool isBackgroundPaintChanged() {
      return oldDelegate.backgroundPaint.color != backgroundPaint.color ||
          oldDelegate.backgroundPaint.style != backgroundPaint.style ||
          oldDelegate.backgroundPaint.strokeWidth != backgroundPaint.strokeWidth;
    }

    return isBackgroundPaintChanged();
  }
}
