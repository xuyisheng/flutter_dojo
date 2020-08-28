import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class GeneratorsWidget extends StatefulWidget {
  @override
  _GeneratorsWidgetState createState() => _GeneratorsWidgetState();
}

class _GeneratorsWidgetState extends State<GeneratorsWidget> {
  var iterableText = '';
  var streamText = '';
  var iterableYieldText = '';
  var streamYieldText = '';
  StreamSubscription stream;
  StreamSubscription streamYield;

  @override
  void dispose() {
    stream?.cancel();
    streamYield?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainTitleWidget('迭代器生成器-sync*'),
          SubtitleWidget('同步生成Iterable'),
          Text(iterableText),
          RaisedButton(
            onPressed: () {
              setState(() => iterableText = generateIterable().join(','));
            },
            child: Text('Generate'),
          ),
          MainTitleWidget('流生成器-async*'),
          SubtitleWidget('异步生成Stream，常用于不断产生Stream事件'),
          Text(streamText),
          RaisedButton(
            onPressed: () {
              stream = generateStream().listen((event) {
                setState(() => streamText += event.toString());
              });
            },
            child: Text('Generate'),
          ),
          MainTitleWidget('递归优化-yield*'),
          SubtitleWidget('配合sync*'),
          Text(iterableYieldText),
          RaisedButton(
            onPressed: () {
              setState(() => iterableYieldText = generateYieldIterable(10).join(','));
            },
            child: Text('Generate'),
          ),
          SubtitleWidget('配合async*'),
          Text(streamYieldText),
          RaisedButton(
            onPressed: () {
              streamYield = generateYieldStream(10).listen((event) {
                setState(() => streamYieldText += event.toString());
              });
            },
            child: Text('Generate'),
          ),
        ],
      ),
    );
  }

  Iterable<int> generateIterable() sync* {
    var i = 0;
    while (i < 10) {
      yield i;
      i++;
    }
  }

  Iterable<int> generateYieldIterable(int n) sync* {
    if (n > 0) {
      yield n;
      yield* generateYieldIterable(n - 1);
    }
  }

  Stream<int> generateStream() async* {
    var i = 0;
    while (i < 10) {
      yield i;
      await Future.delayed(Duration(seconds: 1));
      i++;
    }
  }

  Stream<int> generateYieldStream(int n) async* {
    if (n > 0) {
      yield n;
      await Future.delayed(Duration(seconds: 1));
      yield* generateYieldStream(n - 1);
    }
  }
}
