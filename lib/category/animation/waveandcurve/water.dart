import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

class WaterWidget extends StatefulWidget {
  @override
  _WaterWidgetState createState() => _WaterWidgetState();
}

class _WaterWidgetState extends State<WaterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
        child: WaveView(percentageValue: 60.0),
      ),
    );
  }
}

class WaveView extends StatefulWidget {
  final double percentageValue;

  const WaveView({Key key, this.percentageValue = 100.0}) : super(key: key);

  @override
  _WaveViewState createState() => _WaveViewState();
}

class _WaveViewState extends State<WaveView> with TickerProviderStateMixin {
  static var sizeWidth = 200.0;
  AnimationController animationController;
  AnimationController waveAnimationController;
  Offset bottleOffset1 = Offset(0, 0);
  List<Offset> animList1 = [];
  Offset bottleOffset2 = Offset(sizeWidth, 0);
  List<Offset> animList2 = [];

  @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    waveAnimationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    animationController
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    waveAnimationController.addListener(() {
      animList1.clear();
      for (int i = -2 - bottleOffset1.dx.toInt(); i <= sizeWidth + 2; i++) {
        animList1.add(
          Offset(
            i.toDouble() + bottleOffset1.dx.toInt(),
            sin((waveAnimationController.value * 360 - i) % 360 * vector.degrees2Radians) * 4 +
                (((100 - widget.percentageValue) * 160 / 100)),
          ),
        );
      }
      animList2.clear();
      for (int i = -2 - bottleOffset2.dx.toInt(); i <= sizeWidth + 2; i++) {
        animList2.add(
          Offset(
            i.toDouble() + bottleOffset2.dx.toInt(),
            sin((waveAnimationController.value * 360 - i) % 360 * vector.degrees2Radians) * 4 +
                (((100 - widget.percentageValue) * 160 / 100)),
          ),
        );
      }
    });
    waveAnimationController.repeat();
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    waveAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
        builder: (context, child) => Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.5),
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent.withOpacity(0.4), Colors.blueAccent.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              clipper: WaveClipper(animationController.value, animList1),
            ),
            ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent.withOpacity(0.4), Colors.blueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              clipper: WaveClipper(animationController.value, animList2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.percentageValue.round().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        letterSpacing: 0.0,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        '%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 6,
              bottom: 8,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController, curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 0,
              bottom: 16,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController, curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 24,
              bottom: 32,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController, curve: Interval(0.6, 0.8, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 20,
              bottom: 0,
              child: Transform(
                transform: Matrix4.translationValues(0.0, 16 * (1.0 - animationController.value), 0.0),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(animationController.status == AnimationStatus.reverse ? 0.0 : 0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList = [];

  WaveClipper(this.animation, this.waveList);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.addPolygon(waveList, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) => animation != oldClipper.animation;
}
