import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class CurveLineWidget extends StatefulWidget {
  @override
  _CurveLineWidgetState createState() => _CurveLineWidgetState();
}

class _CurveLineWidgetState extends State<CurveLineWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  double _fraction = 0.0;
  int _seconds = 3;
  Path _path;
  GlobalKey customPaintKey = GlobalKey();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _seconds),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('通过PathMetrics计算Path上的坐标'),
        SubtitleWidget('通过getTangentForOffset获取点的Position'),
        Expanded(
          child: Container(
            constraints: BoxConstraints.expand(),
            child: CustomPaint(
              key: customPaintKey,
              painter: PathPainter(_path, _fraction),
            ),
          ),
        ),
        RaisedButton(
          onPressed: startPathMotion,
          child: Text('Start'),
        ),
        SubtitleWidget('通过extractPath截取Path片段'),
        Expanded(
          child: Container(
            constraints: BoxConstraints.expand(),
            child: CustomPaint(
              painter: PathSegmentPainter(_path, _fraction),
            ),
          ),
        ),
        RaisedButton(
          onPressed: startPathMotion,
          child: Text('Start'),
        ),
      ],
    );
  }

  Path _getPath(Size size) {
    Path path = Path();
    path.moveTo(20, 20);
    path.cubicTo(
      size.width / 4,
      size.height / 2,
      size.width / 4 * 3,
      size.height / 2,
      size.width - 20,
      size.height - 20,
    );
    return path;
  }

  startPathMotion() {
    _controller.reset();
    RenderBox renderBox = customPaintKey.currentContext.findRenderObject();
    Size s = renderBox.size;
    _path = _getPath(s);
    PathMetrics pms = _path.computeMetrics();
    PathMetric pm = pms.elementAt(0);
    double len = pm.length;
    _animation = Tween(begin: 0.0, end: len).animate(_controller)
      ..addListener(() {
        setState(() => _fraction = _animation.value);
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.stop();
        }
      });
    _controller.forward();
  }
}

class PathPainter extends CustomPainter {
  double _fraction;
  Path _path;

  PathPainter(this._path, this._fraction);

  Paint _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  Paint _paint2 = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    if (_path == null) {
      return;
    }
    PathMetrics pms = _path.computeMetrics();
    PathMetric pm = pms.elementAt(0);
    Tangent t = pm.getTangentForOffset(_fraction);
    canvas.drawPath(_path, _paint);
    canvas.drawCircle(t.position, 10, _paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class PathSegmentPainter extends CustomPainter {
  double _fraction;
  Path _path;

  PathSegmentPainter(this._path, this._fraction);

  Paint _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (_path == null) {
      return;
    }
    Path segmentPath = Path();

    PathMetrics pms = _path.computeMetrics();
    PathMetric pm = pms.elementAt(0);

    var extractPath = pm.extractPath(0.0, _fraction);
    segmentPath.addPath(extractPath, Offset(0, 0));

    canvas.drawPath(segmentPath, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
