import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedBuilderWidget extends StatefulWidget {
  @override
  _AnimatedBuilderWidgetState createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(begin: 0.0, end: 100.0).animate(_controller);
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
        MainTitleWidget('AnimatedBuilder基本使用'),
        SubtitleWidget('用于给一个现有Widget添加动画'),
        AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget child) {
            return Center(
              child: Container(
                color: Colors.red,
                height: _animation.value,
              ),
            );
          },
        ),
        RaisedButton(
          onPressed: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: Text('Start anim'),
        )
      ],
    );
  }
}
