import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class PositionedTransitionWidget extends StatefulWidget {
  @override
  _PositionedTransitionWidgetState createState() => _PositionedTransitionWidgetState();
}

class _PositionedTransitionWidgetState extends State<PositionedTransitionWidget> with SingleTickerProviderStateMixin {
  final RelativeRectTween relativeRectTween = RelativeRectTween(
    begin: RelativeRect.fromLTRB(100, 100, 0, 0),
    end: RelativeRect.fromLTRB(0, 0, 50, 50),
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
        MainTitleWidget('PositionedTransition基本使用'),
        SubtitleWidget('改变Positione的时候使用动画效果'),
        Container(
          color: Colors.yellow,
          width: 300,
          height: 300,
          child: Stack(
            children: <Widget>[
              PositionedTransition(
                rect: relativeRectTween.animate(controller),
                child: Container(
                  color: Colors.red,
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(20),
                  child: FlutterLogo(),
                ),
              ),
            ],
          ),
        ),
        RaisedButton(
          onPressed: () {
            status ? controller.forward() : controller.reverse();
            status = !status;
          },
          child: Text("Change Positione"),
        )
      ],
    );
  }
}
