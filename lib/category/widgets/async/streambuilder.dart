import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class StreamBuilderWidget extends StatefulWidget {
  @override
  _StreamBuilderWidgetState createState() => _StreamBuilderWidgetState();
}

class _StreamBuilderWidgetState extends State<StreamBuilderWidget> {
  int _counter = 0;
  bool isClick = false;

  final StreamController<int> _streamController = StreamController();
  final periodicStream = Stream<double>.periodic(
    Duration(milliseconds: 100),
    (x) => (x * 2).toDouble(),
  ).take(30);

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('StreamBuilder基本使用'),
        StreamBuilder<int>(
          stream: _streamController.stream,
          initialData: _counter,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('Hit : ${snapshot.data} times');
          },
        ),
        RaisedButton(
          onPressed: () {
            _streamController.sink.add(++_counter);
          },
          child: Text('Stream Sink one time'),
        ),
        MainTitleWidget('Stream periodic'),
        StreamBuilder<double>(
          stream: isClick ? periodicStream : null,
          builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
            return Text('Periodic : ${snapshot.data}');
          },
        ),
        RaisedButton(
          onPressed: () {
            setState(() => isClick = !isClick);
          },
          child: Text('Start'),
        ),
      ],
    );
  }
}
