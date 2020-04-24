import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class KeepPressingWidget extends StatefulWidget {
  @override
  _KeepPressingWidgetState createState() => _KeepPressingWidgetState();
}

class _KeepPressingWidgetState extends State<KeepPressingWidget> {
  int _counter = 0;
  final duration = Duration(milliseconds: 300);
  Timer timer;

  void increment(Timer t) {
    setState(() => _counter++);
  }

  void onTapDown(TapDownDetails tap) {
    increment(null);
    timer = Timer.periodic(duration, increment);
  }

  void onTapUp(TapUpDetails tap) {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('通过Timer和GestureDetector来实现长按连续执行的功能'),
        Container(
          height: 50,
          width: 50,
          decoration: ShapeDecoration(
            shape: CircleBorder(side: BorderSide.none),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              "+" + _counter.toString(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
        SizedBox(height: 24),
        GestureDetector(
          onTapUp: onTapUp,
          onTapDown: onTapDown,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 1),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 8)],
            ),
            child: Icon(
              Icons.add_circle_outline,
              color: Colors.blue,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
