import 'dart:math';

import 'package:flutter/material.dart';

class AnimAppBar extends StatefulWidget {
  @override
  _AnimAppBarState createState() => _AnimAppBarState();
}

class _AnimAppBarState extends State<AnimAppBar> {
  int fromTabIndex = 0;
  int toTabIndex = 0;
  Random r = Random();

  void update() {
    setState(() {
      fromTabIndex = toTabIndex;
      toTabIndex = (r.nextInt(4) + fromTabIndex) % 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabIndicator(
        fromIndex: fromTabIndex,
        toIndex: toTabIndex,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: update,
        child: Icon(Icons.repeat),
      ),
    );
  }
}

class TabIndicator extends StatefulWidget {
  final int fromIndex;
  final int toIndex;

  TabIndicator({Key key, this.fromIndex, this.toIndex}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabIndicatorState();
  }
}

class _TabIndicatorState extends State<TabIndicator> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> dxTargetAnim;
  Animation<double> dxEntryAnim;

  var screenWidth;
  double iconSize;
  double height;
  double section;
  double horizontalPadding;

  @override
  void initState() {
    super.initState();

    iconSize = 47.0;
    height = 70.0;
    screenWidth = 300.0;
    section = screenWidth / 8;
    horizontalPadding = section - iconSize / 2;

    setUpAnimation(widget.fromIndex, widget.toIndex);
  }

  @override
  void dispose() {
    if (animationController != null) animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(TabIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fromIndex != widget.fromIndex || oldWidget.toIndex != widget.toIndex) {
      setUpAnimation(widget.fromIndex, widget.toIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffee613a),
      child: CustomPaint(
        size: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        painter: _TabIndicationPainter(
          dxTarget: dxTargetAnim.value,
          dxEntry: dxEntryAnim.value,
          dy: height / 2,
          radius: iconSize / 2,
        ),
        child: indicatorIcon(),
      ),
    );
  }

  void setUpAnimation(int fromIndex, int toIndex) {
    animationController = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );

    dxTargetAnim = Tween<double>(begin: section * (fromIndex * 2 + 1), end: section * (toIndex * 2 + 1))
        .animate(intervalCurved(begin: 0.0, end: 1.0));
    dxEntryAnim = Tween<double>(begin: section * (fromIndex * 2 + 1), end: section * (toIndex * 2 + 1))
        .animate(intervalCurved(begin: 0.5, end: 1.0));

    animationController
      ..addListener(() {
        setState(() {});
      });

    if (fromIndex != toIndex) {
      animationController.forward();
    }
  }

  CurvedAnimation intervalCurved({begin = 0.0, end = 1.0, curve = Curves.easeInOut}) {
    return CurvedAnimation(
      parent: animationController,
      curve: Interval(begin, end, curve: curve),
    );
  }

  Widget indicatorIcon() {
    return Container(
      width: screenWidth,
      height: height,
      padding: EdgeInsets.symmetric(
        vertical: height / 2 - iconSize / 2,
      ),
      child: Stack(
        children: <Widget>[
          getIcon(0),
          getIcon(1),
          getIcon(2),
          getIcon(3),
        ],
      ),
    );
  }

  Widget getIcon(index) {
    return Positioned(
      left: section * (index * 2 + 1) - iconSize / 2,
      child: Container(
        width: 47.0,
        height: 47.0,
        alignment: Alignment.center,
        child: Text('$index'),
      ),
    );
  }
}

class _TabIndicationPainter extends CustomPainter {
  Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  _TabIndicationPainter({this.dxTarget = 200.0, this.dxEntry = 50.0, this.radius = 25.0, this.dy = 25.0}) {
    painter = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    bool left2right = dxEntry < dxTarget;
    Offset entry = Offset(left2right ? dxEntry : dxTarget, dy);
    Offset target = Offset(left2right ? dxTarget : dxEntry, dy);

    Path path = Path();
    path.addArc(Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(_TabIndicationPainter oldDelegate) => true;
}
