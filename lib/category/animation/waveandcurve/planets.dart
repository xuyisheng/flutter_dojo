import 'dart:ui';

import 'package:flutter/material.dart';

class PlanetsWidget extends StatefulWidget {
  @override
  _PlanetsWidgetState createState() => _PlanetsWidgetState();
}

class _PlanetsWidgetState extends State<PlanetsWidget> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controller1;
  AnimationController _controller2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _controller.repeat();
    _controller1.repeat();
    _controller2.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, snapshot) {
        return Center(
          child: CustomPaint(
            painter: AtomPaint(
              value: _controller.value,
              value1: _controller1.value,
              value2: _controller2.value,
            ),
          ),
        );
      },
    );
  }
}

class AtomPaint extends CustomPainter {
  AtomPaint({
    this.value,
    this.value1,
    this.value2,
  });

  final double value, value1, value2;

  Paint _axisPaint = Paint()
    ..color = Colors.grey.shade200
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset.zero, 20.0, Paint()..color = Colors.red);
    drawAxis(value, canvas, 60, Paint()..color = Colors.grey);
    drawAxis(value1, canvas, 100, Paint()..color = Colors.pink);
    drawAxis(value2, canvas, 140, Paint()..color = Colors.blueAccent);
  }

  drawAxis(double value, Canvas canvas, double radius, Paint paint) {
    var firstAxis = getCirclePath(radius);
    canvas.drawPath(firstAxis, _axisPaint);
    PathMetrics pathMetrics = firstAxis.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      Path extractPath = pathMetric.extractPath(0.0, pathMetric.length * value);
      try {
        var metric = extractPath.computeMetrics().first;
        final offset = metric.getTangentForOffset(metric.length).position;
        canvas.drawCircle(offset, 12.0, paint);
      } catch (e) {}
    }
  }

  Path getCirclePath(double radius) => Path()..addOval(Rect.fromCircle(center: Offset(0, 0), radius: radius));

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
