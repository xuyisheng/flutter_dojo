import 'dart:async';

import 'package:flutter/material.dart';

class LayerWidget extends StatefulWidget {
  @override
  _LayerWidgetState createState() => _LayerWidgetState();
}

class _LayerWidgetState extends State<LayerWidget> with SingleTickerProviderStateMixin {
  Timer timer;

  AnimationController animationController;

  final offsetTween = TweenSequence([
    TweenSequenceItem<double>(
        tween: Tween(begin: -30.0, end: 0.0).chain(
          CurveTween(curve: Cubic(0.14, 1.0, 0.34, 1.0)),
        ),
        weight: 0.7),
    TweenSequenceItem<double>(
        tween: Tween(begin: 0.0, end: 30.0).chain(
          CurveTween(curve: Cubic(0.4, 0.0, 1.0, 1.0)),
        ),
        weight: 0.3),
  ]);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      update();
    });
  }

  update() async {
    await animationController.forward();
    setState(() {
      animationController
        ..reset()
        ..animateTo(0.7);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(offsetTween.animate(animationController).value.toString());
    return Center(
      child: CustomPaint(
        painter: Layer(offsetTween.animate(animationController)),
        child: SizedBox.expand(),
      ),
    );
  }
}

class Layer extends CustomPainter {
  Animation offset;

  final TextPainter bg = TextPainter(
    text: TextSpan(
      text: 'XYS',
      style: TextStyle(
        fontSize: 150,
        fontWeight: FontWeight.w700,
        color: Colors.blue,
      ),
    ),
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );
  final TextPainter fg = TextPainter(
    text: TextSpan(
      text: 'flutter',
      style: TextStyle(
        fontSize: 80,
        color: Colors.red,
      ),
    ),
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );

  Layer(this.offset) : super(repaint: offset);

  @override
  void paint(Canvas canvas, Size size) {
    bg
      ..layout(minWidth: size.width)
      ..paint(canvas, Offset(0, (size.height - (bg.height + 30)) / 2));
    canvas.saveLayer(null, Paint()..blendMode = BlendMode.multiply);
    fg
      ..layout(minWidth: size.width)
      ..paint(canvas, Offset(0, offset.value + (size.height - (fg.height + 30)) / 2));
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
