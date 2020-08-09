import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

/// Hours text of Chinese traditional time
final hoursInChinese = ['子', '丑', '寅', '卯', '辰', '巳', '午', '未', '申', '酉', '戌', '亥'];

/// Minutes text of Chinese traditional time
final minutesInChinese = ['圆', '|', '拾', '|', '廿', '|', '卅', '|', '卌', '|', '圩', '|'];
final weekdayList = ['Mon', 'Tues', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];
final monthList = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

/// Mock data of weather
final weatherList = [Icons.cloud, Icons.wb_sunny];

/// Mock data of location
final locationList = ['Shanghai', 'Hangzhou', 'BeiJing'];

enum _Element {
  background,
  taichiLight,
  taichiDark,
  numbers,
  indicatorColor,
  shadow,
}

/// Theme data of Taichi
final taichiTheme = {
  _Element.background: Color.fromARGB(255, 175, 210, 237),
  _Element.taichiLight: Color.fromARGB(255, 14, 88, 142),
  _Element.taichiDark: Color.fromARGB(255, 215, 235, 252),
  _Element.numbers: Color.fromARGB(255, 210, 235, 254),
  _Element.indicatorColor: Color.fromARGB(255, 252, 154, 48),
  _Element.shadow: Color.fromARGB(255, 59, 109, 154),
};

/// Total distance traveled by a second or a minute hand, each second or minute, respectively.
final radiansPerTick = radians(360 / 60);

/// Total distance traveled by an hour hand, each hour, in radians.
final radiansPerHour = radians(360 / 24);

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> with SingleTickerProviderStateMixin {
  final temperature = Random().nextInt(35).clamp(15, 35);
  final location = locationList[Random().nextInt(3)];
  final weather = weatherList[Random().nextInt(2)];

  var secondOffset = 0.0;
  var hourNum = 0;
  var minuteNum = 0;
  var showDate;

  DateTime datetime;
  Timer timer;

  /// Second hand animation
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    updateTime();
    startAnim();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      startAnim();
      updateTime();
      setState(() {});
    });
  }

  void updateTime() {
    datetime = DateTime.now();
    hourNum = datetime.hour;
    minuteNum = datetime.minute;
    secondOffset = datetime.second * radiansPerTick;
    showDate = '${weekdayList[datetime.weekday - 1]}\n${monthList[datetime.month - 1]} ${datetime.day}';
  }

  void startAnim() {
    animation = Tween(begin: secondOffset, end: secondOffset + radiansPerTick).animate(
      CurvedAnimation(
        parent: controller,
        curve: _BounceOutCurve._(),
      ),
    );
    secondOffset += radiansPerTick;
    controller.reset();
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: AspectRatio(
          aspectRatio: 5 / 3,
          child: Container(
            width: double.infinity,
            color: taichiTheme[_Element.background],
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    /// background
                    CustomPaint(
                      painter: TaiChiWidget(),
                    ),

                    /// Second hand
                    AnimatedBuilder(
                      builder: (context, widget) {
                        return CustomPaint(
                          painter: SecondHandWidget(animation.value),
                        );
                      },
                      animation: animation,
                    ),

                    /// Hour hand
                    CustomPaint(
                      painter: HourHandWidget(hourNum),
                    ),

                    /// Minute hand
                    CustomPaint(
                      painter: MinutesWidget(minuteNum),
                    ),

                    /// Date
                    Positioned(
                      child: Text(
                        showDate,
                        style: TextStyle(
                          fontSize: constraints.maxWidth / 33,
                          color: taichiTheme[_Element.taichiLight],
                        ),
                      ),
                      top: constraints.maxHeight * 0.23,
                      left: constraints.maxWidth * 0.35,
                    ),

                    /// Weather and location
                    Positioned(
                      child: ExtraInfo(
                        weather: weather,
                        location: location,
                        temperature: temperature,
                        maxWidth: constraints.maxWidth,
                      ),
                      top: constraints.maxHeight * 0.6,
                      left: constraints.maxWidth * 0.55,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ExtraInfo extends StatelessWidget {
  const ExtraInfo({
    Key key,
    @required this.weather,
    @required this.location,
    @required this.temperature,
    @required this.maxWidth,
  }) : super(key: key);

  final IconData weather;
  final String location;
  final num temperature;
  final num maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          weather,
          color: taichiTheme[_Element.taichiDark],
          size: maxWidth / 20,
        ),
        Text(
          location,
          style: TextStyle(
            fontSize: maxWidth / 40,
            color: taichiTheme[_Element.taichiDark],
          ),
        ),
        Text(
          '$temperature℃',
          style: TextStyle(
            fontSize: maxWidth / 40,
            color: taichiTheme[_Element.taichiDark],
          ),
        )
      ],
    );
  }
}

class SecondHandWidget extends CustomPainter {
  final paintNumber = Paint()..color = taichiTheme[_Element.numbers];

  final paintIndicator = Paint()
    ..color = taichiTheme[_Element.indicatorColor]
    ..style = PaintingStyle.fill;

  final paintOutCircleStroke = Paint()
    ..color = taichiTheme[_Element.shadow]
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  var offset;

  SecondHandWidget(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(size.width, size.height) * 0.4;
    final paintOutCircle = Paint()
      ..color = taichiTheme[_Element.taichiLight]
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius / 10;

    canvas.drawCircle(Offset(centerX, centerY), radius * 1.05, paintOutCircle);
    canvas.translate(centerX, centerY);
    canvas.rotate(pi / 2 + offset);

    /// Draw seconds num indicator
    for (int i = 0; i < 60; i++) {
      canvas.save();
      canvas.translate(0, -radius);
      canvas.rotate(-pi / 2);
      canvas.drawCircle(Offset(radius * 0.05, 0), radius / 60, paintNumber);
      canvas.restore();
      canvas.rotate(radiansPerTick);
    }
    canvas.restore();

    canvas.translate(centerX, centerY);
    canvas.drawCircle(Offset(radius * 1.05, 0), radius / 20, paintNumber);
    var textPainter = TextPainter(
      text: TextSpan(
        text: DateTime.now().second.toString(),
        style: TextStyle(
          fontSize: radius / 16,
          color: taichiTheme[_Element.indicatorColor],
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter
      ..paint(
        canvas,
        Offset(radius * 1.05 - textPainter.width / 2, -textPainter.height / 2),
      );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HourHandWidget extends CustomPainter {
  var hour;

  HourHandWidget(this.hour);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(size.width, size.height) * 0.15;
    var rect = Rect.fromCircle(center: Offset(0, -size.height * 0.2), radius: radius * 1.2);

    final Gradient gradient = LinearGradient(
      colors: [
        taichiTheme[_Element.indicatorColor].withOpacity(0.1),
        taichiTheme[_Element.indicatorColor],
      ],
    );

    final paintRange = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..shader = gradient.createShader(rect);

    canvas.translate(centerX, centerY);

    canvas.rotate(pi / 3);
    var startAngle = -pi / 2 - pi / 3;
    canvas.drawArc(rect, startAngle, 2 * pi * hour / 24, false, paintRange);

    canvas.translate(0, -size.height * 0.2);

    canvas.rotate(-pi / 3);
    var textPainter = TextPainter(
      text: TextSpan(
        text: hour.toString(),
        style: TextStyle(
          fontSize: radius,
          fontWeight: FontWeight.w500,
        ),
      ),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter
      ..paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );

    canvas.save();
    for (int i = 0; i < hoursInChinese.length; i++) {
      var textPainter = TextPainter(
        text: TextSpan(
            text: hoursInChinese[i],
            style: TextStyle(
              fontSize: radius / 4,
              color: taichiTheme[_Element.taichiDark],
            )),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter
        ..paint(
          canvas,
          Offset(-textPainter.width / 2, -(textPainter.height / 2) - radius),
        );
      canvas.rotate(2 * pi / hoursInChinese.length);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(HourHandWidget oldDelegate) {
    return oldDelegate.hour != hour;
  }
}

class MinutesWidget extends CustomPainter {
  final paintIndicator = Paint()
    ..color = taichiTheme[_Element.indicatorColor]
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 2
    ..style = PaintingStyle.fill;
  var minute;

  MinutesWidget(this.minute);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(size.width, size.height) * 0.15;

    canvas.translate(centerX, centerY);
    canvas.rotate(-pi * 2 / 3);
    canvas.translate(0, -size.height * 0.2);
    canvas.rotate(pi * 2 / 3);
    var textPainter = TextPainter(
      text: TextSpan(
        text: minute.toString().padLeft(2, '0'),
        style: TextStyle(
          fontSize: radius,
          color: taichiTheme[_Element.taichiLight],
          fontWeight: FontWeight.w500,
        ),
      ),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter
      ..paint(
        canvas,
        Offset(
          -textPainter.width / 2,
          -(textPainter.height / 2),
        ),
      );

    canvas.save();
    canvas.rotate(radiansPerTick * minute);
    canvas.drawLine(Offset(0, -radius * 0.9), Offset(0, -radius * 1.1), paintIndicator);
    canvas.restore();

    canvas.save();
    for (int i = 0; i < minutesInChinese.length; i++) {
      var textPainter = TextPainter(
        text: TextSpan(
          text: minutesInChinese[i],
          style: TextStyle(
            fontSize: radius / 4,
            color: taichiTheme[_Element.taichiLight],
          ),
        ),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter
        ..paint(
          canvas,
          Offset(-textPainter.width / 2, -(textPainter.height / 2) - radius),
        );

      canvas.rotate(2 * pi / minutesInChinese.length);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(MinutesWidget oldDelegate) {
    return oldDelegate.minute != minute;
  }
}

class TaiChiWidget extends CustomPainter {
  final paintRight = Paint()
    ..color = taichiTheme[_Element.taichiLight]
    ..style = PaintingStyle.fill;

  final paintLeft = Paint()
    ..color = taichiTheme[_Element.taichiDark]
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(size.width, size.height) * 0.2;

    var taiChiPathRight = Path();

    canvas.translate(centerX, centerY);
    canvas.rotate(pi / 3);

    /// Add taichi path
    taiChiPathRight.addArc(Rect.fromCircle(center: Offset(0, -radius), radius: radius), -pi / 2, -pi);
    taiChiPathRight.arcTo(Rect.fromCircle(center: Offset(0, radius), radius: radius), -pi / 2, pi, true);
    taiChiPathRight.addArc(Rect.fromCircle(center: Offset(0, 0), radius: radius * 2), -pi / 2, pi);
    var path = Path.combine(PathOperation.difference, taiChiPathRight,
        Path()..addArc(Rect.fromCircle(center: Offset(0, radius), radius: radius), -pi / 2, pi));
    canvas.drawPath(path, paintRight);

    canvas.rotate(pi);
    canvas.drawPath(path, paintLeft);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _BounceOutCurve extends Curve {
  const _BounceOutCurve._();

  @override
  double transform(double t) {
    t -= 1.0;
    return t * t * (3 * t + 2) + 1.0;
  }
}
