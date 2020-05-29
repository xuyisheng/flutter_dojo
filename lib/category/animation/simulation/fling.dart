import 'package:flutter/material.dart';

class FlingWidget extends StatefulWidget {
  @override
  _FlingWidgetState createState() => _FlingWidgetState();
}

class _FlingWidgetState extends State<FlingWidget> with SingleTickerProviderStateMixin {
  Animation<Offset> _flingAnimation;
  AnimationController _controller;

  initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _flingAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(300.0, 300.0),
    ).animate(_controller);
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _flingAnimation,
      builder: (BuildContext context, Widget child) {
        return Transform(
          transform: Matrix4.identity()..translate(_flingAnimation.value.dx, _flingAnimation.value.dy),
          child: Container(
            height: 100.0,
            width: 100.0,
            child: GestureDetector(
                onTap: () {
                  _controller
                    ..value = 0.0
                    ..fling(velocity: 0.1)
                    ..addListener(() {});
                },
                child: Image.asset('images/owl.jpg')),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
