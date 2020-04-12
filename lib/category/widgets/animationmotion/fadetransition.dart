import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class FadeTransitionWidget extends StatefulWidget {
  @override
  _FadeTransitionWidgetState createState() => _FadeTransitionWidgetState();
}

class _FadeTransitionWidgetState extends State<FadeTransitionWidget> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  bool status = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('FadeTransition基本使用'),
        SubtitleWidget('使用透明度过度动画'),
        FadeTransition(
          opacity: animation,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          ),
        ),
        RaisedButton(
          onPressed: () {
            status ? controller.forward() : controller.reverse();
            status = !status;
          },
          child: Text('Start FadeTransition'),
        ),
      ],
    );
  }
}
