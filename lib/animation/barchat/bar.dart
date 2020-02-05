import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class BarWidget extends StatefulWidget {
  @override
  _BarWidgetState createState() => _BarWidgetState();
}

class _BarWidgetState extends State<BarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('通过AnimatedContainer实现简单的柱状图'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimBarItem(),
            AnimBarItem(),
            AnimBarItem(),
            AnimBarItem(),
          ],
        ),
        RaisedButton(
          onPressed: () => setState(() {}),
          child: Text('Refresh'),
        ),
      ],
    );
  }
}

class AnimBarItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 200,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                color: Colors.blueAccent,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                width: 20,
                height: Random().nextInt(120).toDouble(),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                color: Colors.grey.shade200,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                width: 20,
                height: Random().nextInt(80).toDouble(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
