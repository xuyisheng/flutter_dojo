import 'dart:math';

import 'package:flutter/material.dart';

class SpiralWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: CustomPaint(
            size: Size(300, 300),
            painter: SpiralPainter(),
          ),
        ),
      ],
    );
  }
}

class SpiralPainter extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(createSpiralPath(size), _paint);
  }

  Path createSpiralPath(Size size) {
    double radius = 0, angle = 0;
    Path path = Path();
    for (int n = 0; n < 200; n++) {
      radius += 0.75;
      angle += (pi * 2) / 50;
      var x = size.width / 2 + radius * cos(angle);
      var y = size.height / 2 + radius * sin(angle);
      if (n > 0) {
        path.lineTo(x, y);
      } else {
        path.moveTo(x, y);
      }
    }
    return path;
  }

  @override
  bool shouldRepaint(SpiralPainter oldDelegate) {
    return false;
  }
}
