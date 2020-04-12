import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class CurveFittingWidget extends StatefulWidget {
  @override
  _CurveFittingWidgetState createState() => _CurveFittingWidgetState();
}

class _CurveFittingWidgetState extends State<CurveFittingWidget> {
  var type = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey.shade200,
          constraints: const BoxConstraints.expand(height: 400),
          child: CustomPaint(
            painter: CurvePainter(type: type),
          ),
        ),
        MultiSelectionWidget(
          'Algorithm',
          [1, 2, 3],
          ['三次样条插值', '贝塞尔曲线', 'CurveMonotoneX'],
          (value) => setState(() => type = value),
        ),
      ],
    );
  }
}

class CurvePainter extends CustomPainter {
  var type;
  Paint linePaint = Paint()
    ..color = Colors.red
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
  var pointPaint = Paint()
    ..color = Colors.black
    ..strokeWidth = 8
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
  var random = Random();
  var pointsCount = 10;

  CurvePainter({this.type = 1});

  @override
  void paint(Canvas canvas, Size size) {
    var points = List.generate(pointsCount, (index) {
      return Offset(size.width / (pointsCount - 1) * index, random.nextDouble() * size.height * 0.9);
    });
    canvas.drawPoints(PointMode.points, points, pointPaint);
    switch (type) {
      case 1:
        CubicSplineInterpolation.drawCurveFittingLine(canvas, linePaint, points);
        break;
      case 2:
        BezierCurve.drawCurveFittingLine(canvas, linePaint, points);
        break;
      case 3:
        CurveMonotoneX.drawCurveFittingLine(canvas, linePaint, points);
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

/// CurveMonotoneX
class CurveMonotoneX {
  static void drawCurveFittingLine(Canvas canvas, Paint paint, List<Offset> points) {
    final path = new Path()..moveTo(points.first.dx.toDouble(), points.first.dy.toDouble());
    MonotoneX.addCurve(path, points);
    canvas.drawPath(path, paint);
  }
}

/// 贝塞尔曲线
class BezierCurve {
  static void drawCurveFittingLine(Canvas canvas, Paint paint, List<Offset> points) {
    var targetPoints = List<Offset>();
    targetPoints.add(points[0]);
    targetPoints.addAll(points);
    targetPoints.add(points[points.length - 1]);
    final path = new Path();
    for (int i = 1; i < targetPoints.length - 2; i++) {
      path.moveTo(targetPoints[i].dx.toDouble(), targetPoints[i].dy.toDouble());
      var controllerPoint1 = Offset(
        targetPoints[i].dx + (targetPoints[i + 1].dx - targetPoints[i - 1].dx) / 4,
        targetPoints[i].dy + (targetPoints[i + 1].dy - targetPoints[i - 1].dy) / 4,
      );
      var controllerPoint2 = Offset(
        targetPoints[i + 1].dx - (targetPoints[i + 2].dx - targetPoints[i].dx) / 4,
        targetPoints[i + 1].dy - (targetPoints[i + 2].dy - targetPoints[i].dy) / 4,
      );
      path.cubicTo(controllerPoint1.dx, controllerPoint1.dy, controllerPoint2.dx, controllerPoint2.dy,
          targetPoints[i + 1].dx, targetPoints[i + 1].dy);
    }
    canvas.drawPath(path, paint);
  }
}

/// 三次样条插值
class CubicSplineInterpolation {
  int n;
  List<num> xs;
  List<num> ys;

  bool spInitialized;
  List<num> spY2s;

  CubicSplineInterpolation(List<num> _xs, List<num> _ys) {
    this.n = _xs.length;
    this.xs = _xs;
    this.ys = _ys;
    this.spInitialized = false;
  }

  num spline(num x) {
    if (!this.spInitialized) {
      num p, qn, sig, un;
      List<num> us;
      us = new List<num>(n - 1);
      spY2s = new List<num>(n);
      us[0] = spY2s[0] = 0.0;
      for (int i = 1; i <= n - 2; i++) {
        sig = (xs[i] - xs[i - 1]) / (xs[i + 1] - xs[i - 1]);
        p = sig * spY2s[i - 1] + 2.0;
        spY2s[i] = (sig - 1.0) / p;
        us[i] = (ys[i + 1] - ys[i]) / (xs[i + 1] - xs[i]) - (ys[i] - ys[i - 1]) / (xs[i] - xs[i - 1]);
        us[i] = (6.0 * us[i] / (xs[i + 1] - xs[i - 1]) - sig * us[i - 1]) / p;
      }
      qn = un = 0.0;
      spY2s[n - 1] = (un - qn * us[n - 2]) / (qn * spY2s[n - 2] + 1.0);
      for (int k = n - 2; k >= 0; k--) {
        spY2s[k] = spY2s[k] * spY2s[k + 1] + us[k];
      }
      this.spInitialized = true;
    }
    int klo, khi, k;
    num h, b, a;
    klo = 0;
    khi = n - 1;
    while (khi - klo > 1) {
      k = (khi + klo) >> 1;
      if (xs[k] > x)
        khi = k;
      else
        klo = k;
    }
    h = xs[khi] - xs[klo];
    if (h == 0.0) {
      throw new Exception('h==0.0');
    }
    a = (xs[khi] - x) / h;
    b = (x - xs[klo]) / h;
    return a * ys[klo] + b * ys[khi] + ((a * a * a - a) * spY2s[klo] + (b * b * b - b) * spY2s[khi]) * (h * h) / 6.0;
  }

  static void drawCurveFittingLine(Canvas canvas, Paint paint, List<Offset> points) {
    var interval = 0.1;
    var interpolationPoints = List<Offset>();
    for (int k = 0; k < points.length; k++) {
      if ((k + 1) < points.length) {
        num temp = 0;
        while (temp < points[k + 1].dx) {
          temp = temp + interval;
          interpolationPoints.add(Offset(temp, 0.0));
        }
      }
    }
    var tempX = points.map((item) => item.dx).toList();
    var tempY = points.map((item) => item.dy).toList();
    var ip = CubicSplineInterpolation(tempX, tempY);
    for (int j = 0; j < interpolationPoints.length; j++) {
      interpolationPoints[j] = Offset(interpolationPoints[j].dx, ip.spline(interpolationPoints[j].dx));
    }
    interpolationPoints.addAll(points);
    interpolationPoints.sort((a, b) {
      if (a.dx == b.dx)
        return 0;
      else if (a.dx < b.dx)
        return -1;
      else
        return 1;
    });
    final path = new Path();
    path.moveTo(interpolationPoints[0].dx.toDouble(), interpolationPoints[0].dy.toDouble());
    for (int i = 1; i < interpolationPoints.length; i++) {
      path.lineTo(interpolationPoints[i].dx.toDouble(), interpolationPoints[i].dy.toDouble());
    }
    canvas.drawPath(path, paint);
  }
}

class MonotoneX {
  static num _sign(num x) {
    return x < 0 ? -1 : 1;
  }

  // Calculate a one-sided slope.
  static double _slope2(double x0, double y0, double x1, double y1, double t) {
    var h = x1 - x0;
    return h != 0 ? (3 * (y1 - y0) / h - t) / 2 : t;
  }

  static double _slope3(double x0, double y0, double x1, double y1, double x2, double y2) {
    double h0 = x1 - x0;
    double h1 = x2 - x1;
    double s0 = (y1 - y0) / (h0 != 0 ? h0 : (h1 < 0 ? -double.infinity : double.infinity));
    double s1 = (y2 - y1) / (h1 != 0 ? h1 : (h0 < 0 ? -double.infinity : double.infinity));
    double p = (s0 * h1 + s1 * h0) / (h0 + h1);
    var source = [s0.abs(), s1.abs(), 0.5 * p.abs()];
    source.sort();
    return (_sign(s0) + _sign(s1)) * source.first ?? 0;
  }

  // According to https://en.wikipedia.org/wiki/Cubic_Hermite_spline#Representations
  // "you can express cubic Hermite interpolation in terms of cubic Bézier curves
  // with respect to the four values p0, p0 + m0 / 3, p1 - m1 / 3, p1".
  static Path _point(Path path, double x0, double y0, double x1, double y1, double t0, double t1) {
    var dx = (x1 - x0) / 3;
    path.cubicTo(x0 + dx, y0 + dx * t0, x1 - dx, y1 - dx * t1, x1, y1);
    return path;
  }

  static Path addCurve(Path path, List<Offset> points, [bool reversed = false]) {
    var targetPoints = List<Offset>();
    targetPoints.addAll(points);
    targetPoints.add(Offset(points[points.length - 1].dx * 2, points[points.length - 1].dy * 2));
    double x0, y0, x1, y1, t0;
    if (path == null) {
      path = Path();
    }
    List<List<double>> arr = [];
    for (int i = 0; i < targetPoints.length; i++) {
      double t1;
      double x = targetPoints[i].dx;
      double y = targetPoints[i].dy;
      if (x == x1 && y == y1) continue;
      switch (i) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          t1 = _slope3(x0, y0, x1, y1, x, y);
          arr.add([x0, y0, x1, y1, _slope2(x0, y0, x1, y1, t1), t1]);
          break;
        default:
          t1 = _slope3(x0, y0, x1, y1, x, y);
          arr.add([x0, y0, x1, y1, t0, t1]);
      }
      x0 = x1;
      y0 = y1;
      x1 = x;
      y1 = y;
      t0 = t1;
    }
    if (reversed) {
      arr.reversed.forEach((f) {
        _point(path, f[2], f[3], f[0], f[1], f[5], f[4]);
      });
    } else {
      arr.forEach((f) {
        _point(path, f[0], f[1], f[2], f[3], f[4], f[5]);
      });
    }
    return path;
  }
}
