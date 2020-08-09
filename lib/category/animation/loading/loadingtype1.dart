import 'dart:math';

import 'package:flutter/material.dart';

class LoadingType1 extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  LoadingType1({this.color1 = Colors.deepOrangeAccent, this.color2 = Colors.yellow, this.color3 = Colors.lightGreen});

  @override
  _LoadingType1State createState() => _LoadingType1State();
}

class _LoadingType1State extends State<LoadingType1> with TickerProviderStateMixin {
  Animation<double> animation1;
  Animation<double> animation2;
  Animation<double> animation3;
  AnimationController controller1;
  AnimationController controller2;
  AnimationController controller3;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);

    controller2 = AnimationController(duration: const Duration(milliseconds: 900), vsync: this);

    controller3 = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);

    animation1 = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller1, curve: Interval(0.0, 1.0, curve: Curves.linear)));

    animation2 = Tween<double>(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller2, curve: Interval(0.0, 1.0, curve: Curves.easeIn)));

    animation3 = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller3, curve: Interval(0.0, 1.0, curve: Curves.decelerate)));

    controller1.repeat();
    controller2.repeat();
    controller3.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          RotationTransition(
            turns: animation1,
            child: CustomPaint(
              painter: Arc1Painter(widget.color1),
              child: Container(
                width: 50.0,
                height: 50.0,
              ),
            ),
          ),
          RotationTransition(
            turns: animation2,
            child: CustomPaint(
              painter: Arc2Painter(widget.color2),
              child: Container(
                width: 50.0,
                height: 50.0,
              ),
            ),
          ),
          RotationTransition(
            turns: animation3,
            child: CustomPaint(
              painter: Arc3Painter(widget.color3),
              child: Container(
                width: 50.0,
                height: 50.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }
}

class Arc1Painter extends CustomPainter {
  final Color color;

  Arc1Painter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p1 = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Rect rect1 = Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    canvas.drawArc(rect1, 0.0, 0.5 * pi, false, p1);
    canvas.drawArc(rect1, 0.6 * pi, 0.8 * pi, false, p1);
    canvas.drawArc(rect1, 1.5 * pi, 0.4 * pi, false, p1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Arc2Painter extends CustomPainter {
  final Color color;

  Arc2Painter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p2 = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Rect rect2 = Rect.fromLTWH(0.0 + (0.2 * size.width) / 2, 0.0 + (0.2 * size.height) / 2,
        size.width - 0.2 * size.width, size.height - 0.2 * size.height);

    canvas.drawArc(rect2, 0.0, 0.5 * pi, false, p2);
    canvas.drawArc(rect2, 0.8 * pi, 0.6 * pi, false, p2);
    canvas.drawArc(rect2, 1.6 * pi, 0.2 * pi, false, p2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Arc3Painter extends CustomPainter {
  final Color color;

  Arc3Painter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p3 = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Rect rect3 = Rect.fromLTWH(0.0 + (0.4 * size.width) / 2, 0.0 + (0.4 * size.height) / 2,
        size.width - 0.4 * size.width, size.height - 0.4 * size.height);

    canvas.drawArc(rect3, 0.0, 0.9 * pi, false, p3);
    canvas.drawArc(rect3, 1.1 * pi, 0.8 * pi, false, p3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
