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
  Timer countDown;
  int seconds = 0;

  @override
  void dispose() {
    timer?.cancel();
    countDown?.cancel();
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
        MainTitleWidget('倒计时'),
        Text(countdownTime(seconds)),
        RaisedButton(
          onPressed: () {
            var now = DateTime.now();
            var twoHours = now.add(Duration(minutes: 2)).difference(now);
            seconds = twoHours.inSeconds;
            startTimer();
          },
          child: Text('开始倒计时'),
        ),
      ],
    );
  }

  String countdownTime(int seconds) {
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return formatTime(hour) + ':' + formatTime(minute) + ':' + formatTime(second);
  }

  String formatTime(int timeNum) {
    return timeNum.toString().padLeft(2, '0');
  }

  void startTimer() {
    //设置 1 秒回调一次
    const period = const Duration(seconds: 1);
    countDown = Timer.periodic(
      period,
      (timer) {
        setState(() => seconds--);
        if (seconds == 0) {
          countDown.cancel();
        }
      },
    );
  }
}
