import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class StreamWidget extends StatefulWidget {
  @override
  _StreamWidgetState createState() => _StreamWidgetState();
}

class _StreamWidgetState extends State<StreamWidget> {
  String showText1 = '';
  String showText2 = '';
  String showText3 = '';
  String showText4 = '';
  Stream stream;

  StreamController<String> streamController;

  StreamSink streamSink;

  @override
  void initState() {
    super.initState();
    streamController = StreamController<String>();
    streamSink = streamController.sink;
  }

  @override
  void dispose() {
    streamController.close();
    streamSink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Stream的创建'),
        RaisedButton(
          onPressed: () {
            stream = Stream.fromFuture(createFromFuture());
            stream.listen(
              (onData) {
                showText1 += 'Stream Listen $onData ';
                setState(() {});
              },
              onError: (onError) {
                showText1 += 'Stream Listen $onError ';
                setState(() {});
              },
              onDone: () {
                showText1 += 'Stream Listen onDone ';
                setState(() {});
              },
            );
          },
          child: Text('通过Future创建Stream'),
        ),
        Text(showText1),
        RaisedButton(
          onPressed: () {
            streamController.add('add data from StreamController');
            streamController.stream.listen(
              (onData) {
                showText2 += 'StreamController Listen $onData ';
                setState(() {});
              },
              onError: (onError) {
                showText2 += 'StreamController Listen $onError ';
                setState(() {});
              },
              onDone: () {
                showText2 += 'StreamController Listen onDone ';
                setState(() {});
              },
            );
          },
          child: Text('通过StreamController创建Stream'),
        ),
        RaisedButton(
          onPressed: () {
            streamSink.add('add data from StreamSink');
            streamController.stream.listen(
              (onData) {
                showText2 += 'StreamSink Listen $onData ';
                setState(() {});
              },
              onError: (onError) {
                showText2 += 'StreamSink Listen $onError ';
                setState(() {});
              },
              onDone: () {
                showText2 += 'StreamSink Listen onDone ';
                setState(() {});
              },
            );
          },
          child: Text('通过StreamSink创建Stream'),
        ),
        Text(showText2),
        MainTitleWidget('Stream的变换'),
        RaisedButton(
          onPressed: () {
            var stream = Stream.fromIterable([1, 2, 3, 4, 5]);
            var reduce = stream.map((value) {
              return value + 1;
            }).reduce((s, c) {
              return s + c;
            });
            reduce.then((value) {
              setState(() {
                showText3 = value.toString();
              });
              return value;
            });
          },
          child: Text('Stream变换[1, 2, 3, 4, 5] add 1 and then sum is 20'),
        ),
        Text(showText3),
        RaisedButton(
          onPressed: () {
            var stream = Stream<int>.fromIterable([1, 2, 3]);
            var streamTransformer = StreamTransformer<int, String>.fromHandlers(
              handleData: (int data, sink) {
                if (data == 2) {
                  sink.add('Right ');
                } else {
                  sink.add('Wrong ');
                }
              },
            );
            stream.transform(streamTransformer).listen((String data) {
              setState(() => showText4 += data);
            }, onError: (error) => print('Error'));
          },
          child: Text('StreamTransformer[1, 2, 3] 2 is right'),
        ),
        Text(showText4),
        MainTitleWidget('StreamBuilder'),
        RaisedButton(
          onPressed: () {
            streamController.add('data');
          },
          child: Text('Add Data and change UI'),
        ),
        StreamBuilder(
          initialData: 'init data',
          stream: streamController.stream,
          builder: (context, snapshot) {
            return Text('${snapshot.data}');
          },
        ),
      ],
    );
  }

  Future<String> createFromFuture() async {
    await Future.delayed(Duration(seconds: 1));
    return 'createFromFuture';
  }
}
