import 'dart:math';

import 'package:flutter/material.dart';

class FireWidget extends StatefulWidget {
  @override
  _FireWidgetState createState() => _FireWidgetState();
}

class _FireWidgetState extends State<FireWidget> with TickerProviderStateMixin {
  AnimationController animationController;
  final particleSystem = <Particle>[];

  @override
  void initState() {
    super.initState();
    List.generate(100, (i) {
      particleSystem.add(Particle());
    });
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 100))
      ..addListener(() {
        for (int i = 0; i < particleSystem.length; i++) {
          // Move particle
          particleSystem[i].move();

          // Restored particle
          if (particleSystem[i].remainingLife < 0 || particleSystem[i].radius < 0) {
            particleSystem[i] = Particle();
          }
        }
      })
      ..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => CustomPaint(
          painter: _DemoPainter(particleSystem),
        ),
      ),
    );
  }
}

class _DemoPainter extends CustomPainter {
  final List<Particle> particleSystem;

  _DemoPainter(this.particleSystem);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particleSystem) {
      particle.display(canvas);
    }
  }

  @override
  bool shouldRepaint(_DemoPainter oldDelegate) => true;
}

class Particle {
  Offset speed;
  Offset location;
  double radius;
  double life;
  Color color;
  double opacity;

  double remainingLife;
  var screenWidth = 300;
  var palette = <Color>[];

  Particle() {
    Random rd = Random();
    this.speed = Offset(-5 + rd.nextDouble() * 10, -15.0 + rd.nextDouble() * 10);
    this.location = Offset(screenWidth / 2, screenWidth / 3 * 2);
    this.radius = 10 + rd.nextDouble() * 20;
    this.life = 20 + rd.nextDouble() * 10;
    this.remainingLife = this.life;

    for (int i = 30; i < 100; i++) {
      palette.add(HSLColor.fromAHSL(1.0, 0.0, 1.0, i / 100).toColor());
    }

    this.color = palette[0];
  }

  move() {
    this.remainingLife--;
    this.radius--;
    this.location = this.location + this.speed;
    int colorI = palette.length - (this.remainingLife / this.life * palette.length).round();
    if (colorI >= 0 && colorI < palette.length) {
      this.color = palette[colorI];
    }
  }

  display(Canvas canvas) {
    this.opacity = (this.remainingLife / this.life * 100).round() / 100;
    var gradient = RadialGradient(
      colors: [
        Color.fromRGBO(this.color.red, this.color.green, this.color.blue, this.opacity),
        Color.fromRGBO(this.color.red, this.color.green, this.color.blue, this.opacity),
        Color.fromRGBO(this.color.red, this.color.green, this.color.blue, 0.0)
      ],
      stops: [0.0, 0.5, 1.0],
    );

    Paint painter = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(Rect.fromCircle(center: this.location, radius: this.radius));

    canvas.drawCircle(this.location, this.radius, painter);
  }
}
