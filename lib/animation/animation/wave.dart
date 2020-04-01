import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class WaveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('波浪效果'),
        Container(
          color: Colors.grey.shade200,
          child: Center(
            child: WaveBall(
              circleColor: Colors.white,
              progress: 0.6,
              child: Center(
                child: Text(
                  '60%',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        MainTitleWidget('正弦波'),
        Container(
          child: SineWave(
            size: Size(MediaQuery.of(context).size.width, 100),
            type: 0,
          ),
        ),
        Container(
          child: SineWave(
            size: Size(MediaQuery.of(context).size.width, 100),
            type: 1,
          ),
        ),
        Container(
          child: SineWave(
            size: Size(MediaQuery.of(context).size.width, 100),
            type: 2,
          ),
        ),
      ],
    );
  }
}

const int WaveCount = 4;

class WaveBall extends StatefulWidget {
  final double progress;
  final double size;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color circleColor;
  final Widget child;
  final double range;
  final Duration duration;

  const WaveBall({
    Key key,
    this.size = 150.0,
    this.progress = 0.0,
    this.foregroundColor = Colors.blue,
    this.backgroundColor = Colors.lightBlue,
    this.circleColor = Colors.grey,
    this.child,
    this.duration = const Duration(seconds: 2),
    this.range = 10.0,
  })  : assert(progress >= 0.0 && progress <= 1.0),
        super(key: key);

  @override
  _WaveBallState createState() => _WaveBallState();
}

class _WaveBallState extends State<WaveBall> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          constraints: BoxConstraints.tightFor(
            height: widget.size,
            width: widget.size,
          ),
          child: CustomPaint(
            painter: WaveBallPainter(
              animationValue: controller.value,
              range: widget.range,
              progress: widget.progress,
              foregroundColor: widget.foregroundColor,
              backgroundColor: widget.backgroundColor,
              circleColor: widget.circleColor,
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}

class WaveBallPainter extends CustomPainter {
  final double progress;
  final double animationValue;
  final double range;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color circleColor;

  WaveBallPainter({
    this.foregroundColor,
    this.circleColor,
    this.backgroundColor,
    this.animationValue,
    this.progress = 0.0,
    this.range = 10.0,
  })  : assert(animationValue >= 0.0 && animationValue <= 1.0),
        assert(progress >= 0.0 && progress <= 1.0);

  @override
  void paint(Canvas canvas, Size size) {
    double levelHeight = (1.0 - progress) * size.height;
    double specWidget = size.width / WaveCount;
    double translateX = size.width * animationValue;
    double translateX2 = size.width * (1 - animationValue);

    Path path = new Path();
    path.moveTo(0 - translateX, size.height);
    path.lineTo(0 - translateX, levelHeight);
    for (int i = 1; i <= WaveCount; i++) {
      double controllerX = specWidget * (i * 2 - 1) - translateX;
      double controllerY = i % 2 == 0 ? levelHeight - range : levelHeight + range;
      double toX = specWidget * (2 * i) - translateX;
      path.quadraticBezierTo(controllerX, controllerY, toX, levelHeight);
    }
    path.lineTo(size.width + translateX, size.height);
    path.close();

    Path path2 = new Path();
    path2.moveTo(0 - translateX2, size.height);
    path2.lineTo(0 - translateX2, levelHeight);
    for (int i = 1; i <= WaveCount; i++) {
      double controllerX = specWidget * (i * 2 - 1) - translateX2;
      double controllerY = i % 2 != 0 ? levelHeight - range : levelHeight + range;
      double toX = specWidget * (2 * i) - translateX2;

      path2.quadraticBezierTo(controllerX, controllerY, toX, levelHeight);
    }
    path2.lineTo(size.width + translateX2, size.height);
    path2.close();

    Path path3 = new Path();
    path3.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
    path3.close();

    canvas.clipPath(path3, doAntiAlias: true);

    Paint mPaint = new Paint();

    mPaint.style = PaintingStyle.fill;
    mPaint.isAntiAlias = true;

    mPaint.color = circleColor;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, mPaint);

    mPaint.color = backgroundColor;
    canvas.drawPath(path2, mPaint);

    mPaint.color = foregroundColor;
    canvas.drawPath(path, mPaint);
  }

  @override
  bool shouldRepaint(WaveBallPainter oldDelegate) {
    return oldDelegate.animationValue != this.animationValue ||
        oldDelegate.range != this.range ||
        oldDelegate.progress != this.progress ||
        oldDelegate.backgroundColor != this.backgroundColor ||
        oldDelegate.foregroundColor != this.foregroundColor ||
        oldDelegate.circleColor != this.circleColor;
  }
}

class SineWave extends StatefulWidget {
  final Size size;
  final int type;

  const SineWave({Key key, this.type = 0, @required this.size}) : super(key: key);

  @override
  _SineWaveState createState() => _SineWaveState();
}

class _SineWaveState extends State<SineWave> with SingleTickerProviderStateMixin {
  List<Offset> _points;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
      upperBound: 2 * pi,
    );
    _initPoints();
    _controller.repeat();
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
      builder: (BuildContext context, Widget child) {
        return ClipPath(
          clipper: WaveClipper(_controller.value, _points, widget.type),
          child: BlueGradient(),
        );
      },
    );
  }

  void _initPoints() {
    _points = [];
    Random r = Random();
    for (int i = 0; i < widget.size.width; i++) {
      double x = i.toDouble();
      double y = r.nextDouble() * (widget.size.height * 0.8);
      _points.add(Offset(x, y));
    }
  }
}

class WaveClipper extends CustomClipper<Path> {
  double _value;
  List<Offset> _wavePoints;
  int _type;

  WaveClipper(this._value, this._wavePoints, this._type);

  @override
  Path getClip(Size size) {
    if (_type == 0 || _type == 1) {
      var path = Path();
      _type == 0 ? _makeSineWave(size) : _modulateRandom(size);
      path.addPolygon(_wavePoints, false);
      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
      return path;
    } else {
      return _bezierWave(size);
    }
  }

  void _modulateRandom(Size size) {
    final maxDiff = 3.0;
    Random r = Random();
    for (int i = 0; i < size.width; i++) {
      var point = _wavePoints[i];
      double diff = maxDiff - r.nextDouble() * maxDiff * 2.0;
      double newY = max(0.0, point.dy + diff);
      newY = min(size.height, newY);
      Offset newPoint = Offset(point.dx, newY);
      _wavePoints[i] = newPoint;
    }
  }

  void _makeSineWave(Size size) {
    final amplitude = size.height / 3;
    final yOffset = amplitude;
    for (int x = 0; x < size.width; x++) {
      double y = amplitude * sin(x / 4 + _value) + yOffset;
      Offset newPoint = Offset(x.toDouble(), y);
      _wavePoints[x] = newPoint;
    }
  }

  Path _bezierWave(Size size) {
    final v = _value * pi * 2;
    final path = Path();

    final y1 = sin(v);
    final y2 = sin(v + pi / 2);
    final y3 = sin(v + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(size.width / 5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BlueGradient extends StatelessWidget {
  final overlayHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: overlayHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.blue,
            Colors.blue.withOpacity(0.25),
          ],
        ),
      ),
    );
  }
}
