import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class IsolateWidget extends StatefulWidget {
  @override
  _IsolateWidgetState createState() => _IsolateWidgetState();
}

class _IsolateWidgetState extends State<IsolateWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;
  String result = '';
  Isolate isolate;
  var sender;

  void createIsolate() async {
    ReceivePort receive = ReceivePort();
    isolate = await Isolate.spawn<SendPort>(countWithIsolate, receive.sendPort);
    sender = await receive.first;
    receive.close();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller.repeat();
    createIsolate();
  }

  @override
  void dispose() {
    controller.dispose();
    isolate?.kill(priority: Isolate.immediate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Center(
            child: RotationTransition(
              turns: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(controller),
              child: Image.asset('assets/images/book.jpg'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(result),
        ),
        Flexible(
          flex: 2,
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () => countLargeNum(),
                child: Text('在UI主isolate中进行耗时计算'),
              ),
              RaisedButton(
                onPressed: () => countLargeNumWithIsolate(),
                child: Text('开启新的isolate进行计算'),
              ),
              RaisedButton(
                onPressed: () => countLargeNumWithCompute(),
                child: Text('使用Compute进行计算'),
              ),
              SubtitleWidget('Compute是对isolate的封装类'),
            ],
          ),
        ),
      ],
    );
  }

  countLargeNum() async {
    var count = 99999999;
    int r = countEven(count);
    setState(() => this.result = '${count.toString()}有${r.toString()}个偶数');
  }

  countLargeNumWithIsolate() async {
    var count = 99999999;
    ReceivePort _temp = ReceivePort();
    sender.send(MessagePackage(_temp.sendPort, count));
    int r = await _temp.first;
    _temp.close();
    setState(() => this.result = '${count.toString()}有${r.toString()}个偶数');
  }

  countLargeNumWithCompute() async {
    var count = 99999999;
    int r = await compute(countEven, count);
    setState(() => this.result = '${count.toString()}有${r.toString()}个偶数');
  }
}

int countEven(num num) {
  int count = 0;
  while (num > 0) {
    if (num % 2 == 0) {
      count++;
    }
    num--;
  }
  return count;
}

class MessagePackage {
  SendPort sender;
  dynamic msg;

  MessagePackage(this.sender, this.msg);
}

countWithIsolate(SendPort redSendPort) {
  ReceivePort blueReceivePort = ReceivePort();
  redSendPort.send(blueReceivePort.sendPort);
  blueReceivePort.listen((package) {
    MessagePackage _msg = package as MessagePackage;
    int r = countEven(_msg.msg as num);
    _msg.sender.send(r);
  });
}
