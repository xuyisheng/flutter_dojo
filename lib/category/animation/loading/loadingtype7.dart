import 'dart:math';

import 'package:flutter/material.dart';

class LoadingType7 extends StatefulWidget {
  @override
  _LoadingType7State createState() => _LoadingType7State();
}

class _LoadingType7State extends State<LoadingType7> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(100, 100),
          painter: DemoPainter(
            Tween(begin: pi * 1.5, end: pi * 3.5).chain(CurveTween(curve: Interval(0.5, 1.0))).evaluate(_controller),
            sin(Tween(begin: 0.0, end: pi).evaluate(_controller)) * pi,
          ),
        );
      },
    );
  }
}

class DemoPainter extends CustomPainter {
  final double arcStart;
  final double arcSweep;

  DemoPainter(this.arcStart, this.arcSweep);

  @override
  void paint(Canvas canvas, Size size) {
    double side = min(size.width, size.height);
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    canvas.drawArc(Offset.zero & Size(side, side), arcStart, arcSweep, false, paint);
  }

  @override
  bool shouldRepaint(DemoPainter other) {
    return arcStart != other.arcStart || arcSweep != other.arcSweep;
  }
}
