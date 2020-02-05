import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class DecoratedBoxTransitionWidget extends StatefulWidget {
  @override
  _DecoratedBoxTransitionWidgetState createState() => _DecoratedBoxTransitionWidgetState();
}

class _DecoratedBoxTransitionWidgetState extends State<DecoratedBoxTransitionWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool status = true;
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.yellow,
      border: Border.all(
        color: Colors.black,
        style: BorderStyle.solid,
        width: 4.0,
      ),
      borderRadius: BorderRadius.zero,
      shape: BoxShape.rectangle,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10.0,
          spreadRadius: 4.0,
        )
      ],
    ),
    end: BoxDecoration(
      color: Colors.red,
      border: Border.all(
        color: Colors.redAccent,
        style: BorderStyle.solid,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
      shape: BoxShape.rectangle,
    ),
  );

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('DecoratedBoxTransition基本使用'),
        SubtitleWidget('改变DecoratedBox的时候使用动画效果'),
        DecoratedBoxTransition(
          position: DecorationPosition.background,
          decoration: decorationTween.animate(_controller),
          child: Container(
            child: Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(20),
              child: FlutterLogo(),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: RaisedButton(
            onPressed: () {
              if (status) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
              status = !status;
            },
            child: Text("Change DecoratedBoxTransition"),
          ),
        )
      ],
    );
  }
}
