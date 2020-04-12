import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  var oneTimeResult = '';
  var count = 0;
  Timer timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('One Time Timer'),
        RaisedButton(
          onPressed: () {
            Timer(Duration(seconds: 3), () {
              setState(() => oneTimeResult = ' Show Result');
            });
          },
          child: Text('等待3秒后显示结果 $oneTimeResult'),
        ),
        MainTitleWidget('Periodic Timer'),
        RaisedButton(
          onPressed: () {
            timer = Timer.periodic(Duration(seconds: 1), (timer) {
              setState(() {
                count++;
              });
            });
          },
          child: Text('开始计数'),
        ),
        Text('Show count $count'),
      ],
    );
  }
}
