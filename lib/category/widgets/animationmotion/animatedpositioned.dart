import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedPositionedWidget extends StatefulWidget {
  @override
  _AnimatedPositionedWidgetState createState() => _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  bool status = true;

  double left = 30;
  double top = 30;
  double right = 30;
  double bottom = 30;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('AnimatedPositioned基本使用'),
          Container(
            color: Colors.red,
            height: 300,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  left: left,
                  top: top,
                  right: right,
                  bottom: bottom,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            child: Text('Change position'),
            onPressed: () => setState(() {
              left = status ? 10 : 40;
              top = status ? 20 : 40;
              right = status ? 20 : 40;
              bottom = status ? 20 : 40;
              status = !status;
            }),
          ),
          MainTitleWidget('AnimatedPositionedDirectional'),
          SubtitleWidget(
              '''Animated version of [PositionedDirectional] which automatically transitions the child's position over a given duration whenever the given position changes.'''),
          Container(
            color: Colors.red,
            height: 200,
            child: Stack(
              children: <Widget>[
                AnimatedPositionedDirectional(
                  start: left,
                  width: 100,
                  height: 100,
                  duration: Duration(milliseconds: 500),
                  child: Container(color: Colors.blueAccent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
