import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

//https://www.khanacademy.org/math/math-for-fun-and-glory/vi-hart/doodling-in-math/v/doodling-in-math-class-stars
//https://www.youtube.com/watch?v=omsNTaNLvAA
//http://java-sl.com/shapes.html
class NStarWidget extends StatefulWidget {
  @override
  _NStarWidgetState createState() => _NStarWidgetState();
}

class _NStarWidgetState extends State<NStarWidget> with SingleTickerProviderStateMixin {
  var num = 3;
  var R = 40.0;
  var r = 20.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.yellow,
          constraints: const BoxConstraints.expand(height: 500),
          child: CustomPaint(
            painter: NStarTest(num, R, r),
          ),
        ),
        Row(
          children: <Widget>[
            Text('N :'),
            Expanded(
              child: Slider(
                value: num.toDouble(),
                min: 3,
                max: 20,
                onChanged: (value) {
                  setState(() => num = value.toInt());
                },
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text('R :'),
            Expanded(
              child: Slider(
                value: R,
                min: 40,
                max: 100,
                onChanged: (value) {
                  setState(() => R = value);
                },
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text('r :'),
            Expanded(
              child: Slider(
                value: r.toDouble(),
                min: 20,
                max: 60,
                onChanged: (value) {
                  setState(() => r = value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NStarTest extends CustomPainter {
  var mPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3
    ..color = Colors.black;
  var num = 3;
  var R = 40.0;
  var r = 20.0;

  NStarTest(this.num, this.R, this.r);

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制N角星
    canvas.translate(size.width / 2, size.height / 6);
    canvas.save();
    canvas.drawPath(nStarPath(num, R, r), mPaint);
    canvas.restore();

    // 绘制正N角星
    canvas.translate(0, size.height / 6 * 2);
    canvas.save();
    canvas.drawPath(regularStarPath(num, R), mPaint);
    canvas.restore();

    // 绘制正N边形
    canvas.translate(0, size.height / 6 * 2);
    canvas.save();
    canvas.drawPath(regularPolygonPath(num, R), mPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// N角星路径
Path nStarPath(int num, double R, double r) {
  Path path = Path();
  double perDeg = 360 / num;
  double degA = perDeg / 2 / 2;
  double degB = 360 / (num - 1) / 2 - degA / 2 + degA;

  path.moveTo(cos(_rad(degA)) * R, (-sin(_rad(degA)) * R));
  for (int i = 0; i < num; i++) {
    path.lineTo(cos(_rad(degA + perDeg * i)) * R, -sin(_rad(degA + perDeg * i)) * R);
    path.lineTo(cos(_rad(degB + perDeg * i)) * r, -sin(_rad(degB + perDeg * i)) * r);
  }
  path.close();
  return path;
}

double _rad(double deg) {
  return deg * pi / 180;
}

// 画正N角星的路径
Path regularStarPath(int num, double R) {
  double degA, degB;
  if (num % 2 == 1) {
    degA = 360 / num / 2 / 2;
    degB = 180 - degA - 360 / num / 2;
  } else {
    degA = 360 / num / 2;
    degB = 180 - degA - 360 / num / 2;
  }
  double r = R * sin(_rad(degA)) / sin(_rad(degB));
  return nStarPath(num, R, r);
}

// 画正N边形的路径
Path regularPolygonPath(int num, double R) {
  double r = R * cos(_rad(360 / num / 2));
  return nStarPath(num, R, r);
}
