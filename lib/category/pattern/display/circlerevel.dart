import 'package:flutter/material.dart';

class CircleRevelWidget extends StatefulWidget {
  @override
  _CircleRevelWidgetState createState() => _CircleRevelWidgetState();
}

class _CircleRevelWidgetState extends State<CircleRevelWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.isCompleted) {
          controller.reverse();
        } else {
          controller.forward();
        }
      },
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blueAccent,
          child: CircleRevelAnimation(
            minR: 0,
            maxR: 250,
            offset: Offset(100, 100),
            animation: animation,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                height: 250,
                width: 250,
                color: Colors.redAccent,
                child: Text('CircleRevel'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircleRevelAnimation extends StatelessWidget {
  final Offset offset;

  final double minR;

  final double maxR;

  final Widget child;

  final Animation<double> animation;

  CircleRevelAnimation({
    @required this.child,
    @required this.animation,
    this.offset,
    this.minR,
    this.maxR,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return ClipPath(
          clipper: CircleRevelClipper(
            value: animation.value,
            minR: minR,
            maxR: maxR,
            offset: offset,
          ),
          child: this.child,
        );
      },
    );
  }
}

class CircleRevelClipper extends CustomClipper<Path> {
  final double value;
  final double minR;
  final double maxR;
  final Offset offset;

  CircleRevelClipper({
    this.value,
    this.offset,
    this.minR,
    this.maxR,
  });

  @override
  bool shouldReclip(old) => true;

  @override
  Path getClip(Size size) {
    var path = Path();
    var rect = Rect.fromCircle(
      radius: minR + (maxR - minR) * value,
      center: offset,
    );
    path.addOval(rect);
    return path;
  }
}
