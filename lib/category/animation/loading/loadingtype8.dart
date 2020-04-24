import 'dart:math';

import 'package:flutter/material.dart';

class LoadingType8 extends StatefulWidget {
  @override
  _LoadingType8State createState() => _LoadingType8State();
}

class _LoadingType8State extends State<LoadingType8> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation startAnimation;
  Animation swapAnimation;
  Tween<double> start = Tween(begin: 0, end: 2 * pi);
  Tween<double> swap = Tween(begin: 0, end: pi);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..repeat();
    startAnimation = start.animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    swapAnimation = swap.animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
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
          painter: DemoPainter(startAnimation.value, swapAnimation.value),
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
