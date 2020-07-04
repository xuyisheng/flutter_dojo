import 'dart:async';

import 'package:flutter/material.dart';

class DrawBezier extends StatefulWidget {
  @override
  _DrawBezierState createState() => _DrawBezierState();
}

class _DrawBezierState extends State<DrawBezier> with TickerProviderStateMixin {
  AnimationController animationController;
  List<Offset> pointList = [];
  List<Offset> pivotList = [];
  Size screenSize = Size(300, 300);

  @override
  void initState() {
    super.initState();
    pivotList = [
      Offset(screenSize.width * 3 / 6, screenSize.height * 1 / 6),
      Offset(screenSize.width * 5 / 6, screenSize.height * 3 / 6),
      Offset(screenSize.width * 3 / 6, screenSize.height * 5 / 6),
      Offset(screenSize.width * 1 / 6, screenSize.height * 3 / 6),
      Offset(screenSize.width * 3 / 6, screenSize.height * 1 / 6),
    ];

    animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationController.addListener(() {
      pointList.add(getQuadraticBezier(pivotList, animationController.value));
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(Duration(seconds: 1), () {
          pointList.clear();
          animationController.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        Timer(Duration(seconds: 1), () {
          pointList.clear();
          animationController.forward();
        });
      }
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => CustomPaint(
          size: Size(
            screenSize.width,
            screenSize.height,
          ),
          foregroundPainter: _DemoPainter(screenSize, animationController.value, pointList, pivotList),
        ),
      ),
    );
  }
}

class _DemoPainter extends CustomPainter {
  final Size screenSize;
  final double animation;
  final List<Offset> pointList;
  final List<Offset> pivotList;
  Paint painter = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.black;
  Paint painter2 = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.red;

  _DemoPainter(this.screenSize, this.animation, this.pointList, this.pivotList);

  @override
  void paint(Canvas canvas, Size size) {
    getQuadraticBezier(pivotList, animation, canvas: canvas, paint: painter2);

    for (var o in pointList) {
      canvas.drawCircle(o, 1.0, painter);
    }
  }

  @override
  bool shouldRepaint(_DemoPainter oldDelegate) => true;
}

Offset getQuadraticBezier(List<Offset> offsetList, double t, {Canvas canvas, Paint paint}) {
  return getQuadraticBezier2(offsetList, t, 0, offsetList.length - 1, canvas, paint);
}

Offset getQuadraticBezier2(List<Offset> offsetList, double t, int i, int j, Canvas canvas, Paint paint) {
  if (i == j) return offsetList[i];

  Offset b0 = getQuadraticBezier2(offsetList, t, i, j - 1, canvas, paint);
  Offset b1 = getQuadraticBezier2(offsetList, t, i + 1, j, canvas, paint);
  Offset res = Offset((1 - t) * b0.dx + t * b1.dx, (1 - t) * b0.dy + t * b1.dy);
  if (canvas != null && paint != null) {
    canvas.drawLine(b1, b0, paint);
    canvas.drawCircle(res, 2.0, paint);
  }
  return res;
}
