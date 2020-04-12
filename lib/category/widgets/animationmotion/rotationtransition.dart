import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class RotationTransitionWidget extends StatefulWidget {
  @override
  _RotationTransitionWidgetState createState() => _RotationTransitionWidgetState();
}

class _RotationTransitionWidgetState extends State<RotationTransitionWidget> with SingleTickerProviderStateMixin {
  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 3,
  );
  AnimationController controller;
  bool status = true;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('RotationTransition基本使用'),
        SubtitleWidget('改变旋转角度的时候使用动画效果'),
        RotationTransition(
          turns: turnsTween.animate(controller),
          child: Container(
            color: Colors.red,
            width: 200,
            height: 200,
            padding: EdgeInsets.all(20),
            child: FlutterLogo(),
          ),
        ),
        RaisedButton(
          onPressed: () {
            status ? controller.forward() : controller.reverse();
            status = !status;
          },
          child: Text("Change Rotation"),
        ),
        RaisedButton(
          onPressed: () {
            controller.animateTo(0.125);
          },
          child: Text("Goto Half"),
        ),
      ],
    );
  }
}
