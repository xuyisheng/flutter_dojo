import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class DrawInterpolator extends StatefulWidget {
  @override
  _DrawInterpolatorState createState() => _DrawInterpolatorState();
}

class _DrawInterpolatorState extends State<DrawInterpolator> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animationTime;
  Animation<double> animation;
  List<Offset> offsetList;
  List<Curve> curveDemoList;
  String curveStr;
  double axisArea = 260.0;

  int curveDemoIndex = 0;

  @override
  void initState() {
    super.initState();
    offsetList = List<Offset>();
    curveDemoList = [
      Curves.linear,
      Curves.decelerate,
      Curves.ease,
      Curves.easeIn,
      Curves.easeOut,
      Curves.easeInOut,
      Curves.fastOutSlowIn,
      Curves.bounceIn,
      Curves.bounceOut,
      Curves.bounceInOut,
      Curves.elasticIn,
      Curves.elasticOut,
      Curves.elasticInOut,
      const Cubic(0.25, 0.0, 0.0, 1.0)
    ];
    setUpAnimation(curveDemoList[curveDemoIndex]);
  }

  @override
  void dispose() {
    if (animationController != null) animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CustomPaint(
        size: Size(
          axisArea,
          axisArea,
        ),
        painter: _DemoPainter(offsetList, curveStr, axisArea),
      ),
    );
  }

  void setUpAnimation(Curve curve) {
    if (curve == Curves.linear) {
      curveStr = 'linear';
    } else if (curve == Curves.decelerate) {
      curveStr = 'decelerate';
    } else if (curve == Curves.ease) {
      curveStr = 'ease';
    } else if (curve == Curves.easeIn) {
      curveStr = 'easeIn';
    } else if (curve == Curves.easeOut) {
      curveStr = 'easeOut';
    } else if (curve == Curves.easeInOut) {
      curveStr = 'easeInOut';
    } else if (curve == Curves.fastOutSlowIn) {
      curveStr = 'fastOutSlowIn';
    } else if (curve == Curves.bounceIn) {
      curveStr = 'bounceIn';
    } else if (curve == Curves.bounceOut) {
      curveStr = 'bounceOut';
    } else if (curve == Curves.bounceInOut) {
      curveStr = 'bounceInOut';
    } else if (curve == Curves.elasticIn) {
      curveStr = 'elasticIn';
    } else if (curve == Curves.elasticOut) {
      curveStr = 'elasticOut';
    } else if (curve == Curves.elasticInOut) {
      curveStr = 'elasticInOut';
    } else {
      curveStr = 'Custom';
    }

    animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.0, end: axisArea).animate(intervalCurved(curve: curve));
    animationTime = Tween<double>(begin: 0.0, end: axisArea).animate(animationController);

    animationController
      ..addListener(() {
        offsetList.add(Offset(animationTime.value, animation.value));
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          offsetList.clear();

          Timer(Duration(milliseconds: 200), () {
            curveDemoIndex = (curveDemoIndex + 1) % curveDemoList.length;
            setUpAnimation(curveDemoList[curveDemoIndex]);
          });
        } else if (status == AnimationStatus.completed) {
          offsetList.clear();
          animationController.reverse();
        }
      });

    animationController.forward();
  }

  CurvedAnimation intervalCurved({begin = 0.0, end = 1.0, curve = Curves.linear}) {
    return CurvedAnimation(
      parent: animationController,
      curve: Interval(begin, end, curve: curve),
    );
  }
}

class _DemoPainter extends CustomPainter {
  Paint curvePainter;
  Paint axisPainter;
  Paint axisPointPainter;
  Paint linearPainter;
  List<Offset> offsetList;
  String curveName;
  double axisArea;

  _DemoPainter(this.offsetList, this.curveName, this.axisArea) {
    curvePainter = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    axisPointPainter = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;
    axisPainter = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    linearPainter = Paint()
      ..color = Colors.red
      ..strokeWidth = 0.2
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Draw value axis
    canvas.drawLine(Offset(0.0, 0.0), Offset(0.0, axisArea + 20), axisPainter);
    canvas.drawLine(Offset(-5.0, axisArea), Offset(0.0, axisArea + 20), axisPainter);
    canvas.drawLine(Offset(0.0, axisArea + 20), Offset(5.0, axisArea), axisPainter);

    // Draw time axis
    canvas.drawLine(Offset(0.0, 0.0), Offset(axisArea + 20, 0.0), axisPainter);
    canvas.drawLine(Offset(axisArea, -5.0), Offset(axisArea + 20, 0.0), axisPainter);
    canvas.drawLine(Offset(axisArea + 20, 0.0), Offset(axisArea, 5.0), axisPainter);

    // Draw linear line
    canvas.drawLine(Offset(0.0, 0.0), Offset(axisArea, axisArea), linearPainter);
    // Draw text
    drawText(canvas, Offset(-20.0, -20.0), '0,0');
    drawText(canvas, Offset(-20.0, axisArea + 20), 'value');
    drawText(canvas, Offset(axisArea + 20, -20.0), 'time');
    drawText(canvas, Offset(axisArea / 2, axisArea + 20), curveName);

    canvas.drawPoints(PointMode.polygon, offsetList, curvePainter);

    if (offsetList.length > 0) {
      Offset latestPoint = offsetList[offsetList.length - 1];
      canvas.drawCircle(Offset(0.0, latestPoint.dy), 2.0, axisPointPainter);
      canvas.drawCircle(Offset(latestPoint.dx, 0.0), 2.0, axisPointPainter);

      canvas.drawLine(Offset(0.0, latestPoint.dy), latestPoint, linearPainter);
      canvas.drawLine(Offset(latestPoint.dx, 0.0), latestPoint, linearPainter);
    }
  }

  @override
  bool shouldRepaint(_DemoPainter oldDelegate) => true;

  void drawText(Canvas canvas, Offset offset, String text) {
    TextPainter tp = TextPainter(
        text: TextSpan(style: TextStyle(color: Colors.black), text: text),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, offset);
  }
}
