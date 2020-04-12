import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class InterpolatorWidget extends StatefulWidget {
  @override
  _InterpolatorWidgetState createState() => _InterpolatorWidgetState();
}

class _InterpolatorWidgetState extends State<InterpolatorWidget> {
  var curves = [
    Curves.bounceIn,
    Curves.bounceInOut,
    Curves.bounceOut,
    Curves.decelerate,
    Curves.ease,
    Curves.easeIn,
    Curves.easeInBack,
    Curves.easeInCirc,
    Curves.easeInCubic,
    Curves.easeInExpo,
    Curves.easeInOut,
    Curves.easeInOutBack,
    Curves.easeInOutCirc,
    Curves.easeInOutCubic,
    Curves.easeInOutExpo,
    Curves.easeInOutQuad,
    Curves.easeInOutQuart,
    Curves.easeInOutQuint,
    Curves.easeInOutSine,
    Curves.easeInQuad,
    Curves.easeInQuart,
    Curves.easeInSine,
    Curves.easeInToLinear,
    Curves.easeOut,
    Curves.easeOutBack,
    Curves.easeOutCirc,
    Curves.easeOutCubic,
    Curves.easeOutExpo,
    Curves.easeOutQuad,
    Curves.easeOutQuart,
    Curves.easeOutQuint,
    Curves.easeOutSine,
    Curves.elasticIn,
    Curves.elasticInOut,
    Curves.elasticOut,
    Curves.fastLinearToSlowEaseIn,
    Curves.fastOutSlowIn,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('绘制所有的缓动曲线'),
        Expanded(
          child: ListView.builder(
            itemCount: curves.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Text('${curves[index]}'),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    color: Colors.grey.shade200,
                    constraints: const BoxConstraints.expand(height: 300),
                    child: CustomPaint(
                      painter: CurvePainter(curves[index]),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class CurvePainter extends CustomPainter {
  var padding = 10.0;
  var paintAxis = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 2;

  Curve curve;

  CurvePainter(this.curve);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    canvas.translate(0, size.height * 0.8);
    path.moveTo(0, 0);
    for (int i = 0; i < 1000; i++) {
      var fraction = i.toDouble() / 1000;
      var value = curve.transform(fraction) * size.height * 0.6;
      path.lineTo(fraction * size.width, -value);
    }
    canvas.drawPath(path, paintAxis);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
