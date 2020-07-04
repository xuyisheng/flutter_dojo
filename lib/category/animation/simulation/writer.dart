import 'package:flutter/material.dart';

class WriterWidget extends StatefulWidget {
  @override
  _WriterWidgetState createState() => _WriterWidgetState();
}

class _WriterWidgetState extends State<WriterWidget> with TickerProviderStateMixin {
  AnimationController animationController;
  CharacterFactory characterFactory;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));

    characterFactory = CharacterFactory();

    animationController.addListener(() {
      characterFactory.addPoint(animationController.value);
    });

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (characterFactory.step != -1) {
          characterFactory.step++;
        }
        animationController.reset();
        animationController.forward();
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
      child: AnimatedBuilder(
        animation: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
        builder: (context, child) => Container(
          child: CustomPaint(
            painter: _DemoPainter(characterFactory.offsetPoint, characterFactory.path),
          ),
        ),
      ),
    );
  }
}

class _DemoPainter extends CustomPainter {
  final Offset offsetPoint;
  final Path path;
  Paint painter;

  _DemoPainter(this.offsetPoint, this.path) {
    painter = Paint()
      ..strokeWidth = 1.0
      ..color = Colors.red
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, painter);
    canvas.drawCircle(offsetPoint, 10.0, painter);

    canvas.drawLine(Offset(0.0, 100.0), Offset(300.0, 100.0), painter);
    canvas.drawLine(Offset(0.0, 150.0), Offset(300.0, 150.0), painter);
    canvas.drawLine(Offset(0.0, 200.0), Offset(300.0, 200.0), painter);
  }

  @override
  bool shouldRepaint(_DemoPainter oldDelegate) => true;
}

class CharacterFactory {
  Offset offsetPoint;
  Path path = Path();
  int step = 0;

  Offset getQuadraticBezier(List<Offset> offsetList, double t) {
    return getQuadraticBezier2(offsetList, t, 0, offsetList.length - 1);
  }

  Offset getQuadraticBezier2(List<Offset> offsetList, double t, int i, int j) {
    if (i == j) return offsetList[i];
    Offset b0 = getQuadraticBezier2(offsetList, t, i, j - 1);
    Offset b1 = getQuadraticBezier2(offsetList, t, i + 1, j);
    Offset res = Offset((1 - t) * b0.dx + t * b1.dx, (1 - t) * b0.dy + t * b1.dy);
    return res;
  }

  void addPoint(double time) {
    bool finish = false;
    bChar(time, 0.0, 0);
    eChar(time, 50.0, 2);
    sChar(time, 100.0, 4);
    finish = hChar(time, 150.0, 5);
    if (finish) {
      step = -1;
    }
  }

  bool bChar(double time, [double xOffset = 0.0, int stepOffset = 0]) {
    if (step == stepOffset) {
      path.moveTo(0.0 + xOffset, 100.0);
      offsetPoint = getQuadraticBezier([
        Offset(0.0 + xOffset, 100.0),
        Offset(0.0 + xOffset, 200.0),
      ], time);
    } else if (step == stepOffset + 1) {
      path.moveTo(0.0 + xOffset, 175.0);
      offsetPoint = getQuadraticBezier([
        Offset(0.0 + xOffset, 175.0),
        Offset(35.0 + xOffset, 100.0),
        Offset(80.0 + xOffset, 212.0),
        Offset(0.0 + xOffset, 200.0),
      ], time);
    } else if (step > stepOffset + 1) {
      return true;
    }
    path.addRect(Rect.fromCircle(center: offsetPoint, radius: 2.0));
    return false;
  }

  bool eChar(double time, [double xOffset = 0.0, int stepOffset = 0]) {
    if (step == stepOffset) {
      path.moveTo(0.0 + xOffset, 185.0);
      offsetPoint = getQuadraticBezier([
        Offset(0.0 + xOffset, 185.0),
        Offset(60.0 + xOffset, 165.0),
        Offset(45.0 + xOffset, 150.0),
        Offset(25.0 + xOffset, 150.0),
      ], time);
    } else if (step == stepOffset + 1) {
      path.moveTo(25.0 + xOffset, 150.0);
      offsetPoint = getQuadraticBezier([
        Offset(25.0 + xOffset, 150.0),
        Offset(0.0 + xOffset, 155.0),
        Offset(-5.0 + xOffset, 200.0),
        Offset(5.0 + xOffset, 215.0),
        Offset(40.0 + xOffset, 185.0),
      ], time);
    } else if (step > stepOffset + 1) {
      return true;
    }
    path.addRect(Rect.fromCircle(center: offsetPoint, radius: 2.0));
    return false;
  }

  bool sChar(double time, [double xOffset = 0.0, int stepOffset = 0]) {
    if (step == stepOffset) {
      path.moveTo(40.0 + xOffset, 165.0);
      offsetPoint = getQuadraticBezier([
        Offset(40.0 + xOffset, 165.0),
        Offset(40.0 + xOffset, 135.0),
        Offset(0.0 + xOffset, 150.0),
        Offset(-20.0 + xOffset, 155.0),
        Offset(-20.0 + xOffset, 175.0),
        Offset(100.0 + xOffset, 180.0),
        Offset(50.0 + xOffset, 185.0),
        Offset(50.0 + xOffset, 215.0),
        Offset(25.0 + xOffset, 205.0),
        Offset(15.0 + xOffset, 200.0),
        Offset(0.0 + xOffset, 185.0),
      ], time);
    } else if (step > stepOffset) {
      return true;
    }
    path.addRect(Rect.fromCircle(center: offsetPoint, radius: 2.0));
    return false;
  }

  bool iChar(double time, [double xOffset = 0.0, int stepOffset = 0]) {
    if (step == stepOffset) {
      path.moveTo(20.0 + xOffset, 150.0);
      offsetPoint = getQuadraticBezier([
        Offset(20.0 + xOffset, 150.0),
        Offset(20.0 + xOffset, 195.0),
      ], time);
    } else if (step == stepOffset + 1) {
      path.moveTo(20.0 + xOffset, 195.0);
      offsetPoint = getQuadraticBezier([
        Offset(20.0 + xOffset, 195.0),
        Offset(25.0 + xOffset, 205.0),
        Offset(35.0 + xOffset, 195.0),
      ], time);
    } else if (step == stepOffset + 2) {
      path.moveTo(20.0 + xOffset, 135.0);
      offsetPoint = getQuadraticBezier([
        Offset(20.0 + xOffset, 135.0),
        Offset(20.0 + xOffset, 140.0),
      ], time);
    } else if (step > stepOffset + 2) {
      return true;
    }
    path.addRect(Rect.fromCircle(center: offsetPoint, radius: 2.0));
    return false;
  }

  bool gChar(double time, [double xOffset = 0.0, int stepOffset = 0]) {
    if (step == stepOffset) {
      path.moveTo(40.0 + xOffset, 150.0);
      offsetPoint = getQuadraticBezier([
        Offset(40.0 + xOffset, 150.0),
        Offset(-5.0 + xOffset, 150.0),
        Offset(0.0 + xOffset, 200.0),
        Offset(0.0 + xOffset, 215.0),
        Offset(20.0 + xOffset, 200.0),
        Offset(40.0 + xOffset, 180.0),
      ], time);
    } else if (step == stepOffset + 1) {
      path.moveTo(40.0 + xOffset, 150.0);
      offsetPoint = getQuadraticBezier([
        Offset(40.0 + xOffset, 150.0),
        Offset(40.0 + xOffset, 240.0),
      ], time);
    } else if (step == stepOffset + 2) {
      path.moveTo(40.0 + xOffset, 240.0);
      offsetPoint = getQuadraticBezier([
        Offset(40.0 + xOffset, 240.0),
        Offset(35.0 + xOffset, 285.0),
        Offset(10.0 + xOffset, 285.0),
        Offset(-15.0 + xOffset, 250.0),
        Offset(45.0 + xOffset, 215.0),
      ], time);
    } else if (step > stepOffset + 2) {
      return true;
    }
    path.addRect(Rect.fromCircle(center: offsetPoint, radius: 2.0));
    return false;
  }

  bool hChar(double time, [double xOffset = 0.0, int stepOffset = 0]) {
    if (step == stepOffset) {
      path.moveTo(0.0 + xOffset, 100.0);
      offsetPoint = getQuadraticBezier([
        Offset(0.0 + xOffset, 100.0),
        Offset(0.0 + xOffset, 200.0),
      ], time);
    } else if (step == stepOffset + 1) {
      path.moveTo(0.0 + xOffset, 175.0);
      offsetPoint = getQuadraticBezier([
        Offset(0.0 + xOffset, 175.0),
        Offset(45.0 + xOffset, 120.0),
        Offset(45.0 + xOffset, 200.0),
      ], time);
    } else if (step > stepOffset + 1) {
      return true;
    }
    path.addRect(Rect.fromCircle(center: offsetPoint, radius: 2.0));
    return false;
  }

  bool tChar(double time, [double xOffset = 0.0, int stepOffset = 0]) {
    if (step == stepOffset) {
      path.moveTo(25.0 + xOffset, 100.0);
      offsetPoint = getQuadraticBezier([
        Offset(25.0 + xOffset, 100.0),
        Offset(25.0 + xOffset, 195.0),
      ], time);
    } else if (step == stepOffset + 1) {
      path.moveTo(25.0 + xOffset, 195.0);
      offsetPoint = getQuadraticBezier([
        Offset(25.0 + xOffset, 195.0),
        Offset(30.0 + xOffset, 205.0),
        Offset(45.0 + xOffset, 200.0),
      ], time);
    } else if (step == stepOffset + 2) {
      path.moveTo(10.0 + xOffset, 145.0);
      offsetPoint = getQuadraticBezier([
        Offset(10.0 + xOffset, 145.0),
        Offset(25.0 + xOffset, 150.0),
        Offset(45.0 + xOffset, 145.0),
      ], time);
    } else if (step > stepOffset + 2) {
      return true;
    }
    path.addRect(Rect.fromCircle(center: offsetPoint, radius: 2.0));
    return false;
  }

  bool oChar(double time, [double xOffset = 0.0, int stepOffset = 0]) {
    if (step == stepOffset) {
      path.moveTo(25.0 + xOffset, 150.0);
      offsetPoint = getQuadraticBezier([
        Offset(25.0 + xOffset, 150.0),
        Offset(-5.0 + xOffset, 175.0),
        Offset(-5.0 + xOffset, 200.0),
        Offset(25.0 + xOffset, 235.0),
        Offset(65.0 + xOffset, 175.0),
        Offset(65.0 + xOffset, 150.0),
        Offset(25.0 + xOffset, 150.0),
      ], time);
    } else if (step > stepOffset) {
      return true;
    }
    path.addRect(Rect.fromCircle(center: offsetPoint, radius: 2.0));
    return false;
  }

  bool fChar(double time, [double xOffset = 0.0, int stepOffset = 0]) {
    if (step == stepOffset) {
      path.moveTo(40.0 + xOffset, 100.0);
      offsetPoint = getQuadraticBezier([
        Offset(40.0 + xOffset, 100.0),
        Offset(-15.0 + xOffset, 100.0),
        Offset(50.0 + xOffset, 200.0),
        Offset(0.0 + xOffset, 200.0),
      ], time);
    } else if (step == stepOffset + 1) {
      path.moveTo(0.0 + xOffset, 140.0);
      offsetPoint = getQuadraticBezier([
        Offset(0.0 + xOffset, 140.0),
        Offset(30.0 + xOffset, 125.0),
      ], time);
    } else if (step > stepOffset + 1) {
      return true;
    }
    path.addRect(Rect.fromCircle(center: offsetPoint, radius: 2.0));
    return false;
  }
}
