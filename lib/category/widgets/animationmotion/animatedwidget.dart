import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedWidgetWidget extends StatefulWidget {
  @override
  _AnimatedWidgetWidgetState createState() => _AnimatedWidgetWidgetState();
}

class _AnimatedWidgetWidgetState extends State<AnimatedWidgetWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animationScale;
  Animation<double> _animationRotation;
  Animation<double> _animationSize;
  Animation<Offset> _animationSlide;
  bool status = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationScale = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animationRotation = Tween(begin: 0.0, end: 2.0).animate(_controller);
    _animationSize = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animationSlide = Tween(begin: Offset(0, 0), end: Offset(0.5, 0.5)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('AnimatedWidget基本使用'),
        SubtitleWidget('常用的AnimatedWidget示例'),
        ScaleTransition(
          scale: _animationScale,
          child: Container(
            color: Colors.yellow,
            height: 100,
            child: Text('ScaleTransition'),
          ),
        ),
        RotationTransition(
          turns: _animationRotation,
          child: Container(
            color: Colors.green,
            height: 100,
            child: Text('RotationTransition'),
          ),
        ),
        SizeTransition(
          axis: Axis.vertical,
          sizeFactor: _animationSize,
          child: Container(
            color: Colors.red,
            height: 100,
            width: 100,
            child: FlutterLogo(),
          ),
        ),
        SlideTransition(
          position: _animationSlide,
          child: Container(
            color: Colors.cyan,
            height: 100,
            child: Text('SlideTransition'),
          ),
        ),
        RaisedButton(
          onPressed: () {
            status = !status;
            return status ? _controller.forward() : _controller.reverse();
          },
          child: Text('Start anim'),
        )
      ],
    );
  }
}
