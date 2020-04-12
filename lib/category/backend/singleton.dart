import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class SingletonWidget extends StatelessWidget {
  final singleton = MySingleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Singleton'),
        SubtitleWidget('通过factory设置Singleton，并通过StreamController更新数据'),
        StreamBuilder<MyData>(
          stream: singleton.stream,
          initialData: MyData('init data'),
          builder: (context, snapshot) {
            return Text(snapshot.data.dataStr, style: Theme.of(context).textTheme.display3);
          },
        ),
        SizedBox(height: 50),
        RaisedButton(
          onPressed: () {
            singleton.setData(MyData('test${Random().nextInt(100)}'));
          },
          child: Text('add data'),
        ),
      ],
    );
  }
}

class MySingleton {
  static final MySingleton _instanceTransfer = MySingleton.__internal();

  StreamController streamController = StreamController<MyData>();

  get stream => streamController.stream;

  void setData(MyData data) {
    streamController.sink.add(data);
  }

  void dispose() {
    streamController.close();
  }

  factory MySingleton() {
    return _instanceTransfer;
  }

  MySingleton.__internal();
}

class MyData {
  String dataStr;

  MyData(this.dataStr);
}
