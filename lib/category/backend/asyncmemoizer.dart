import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AsyncMemoizerWidget extends StatefulWidget {
  @override
  _AsyncMemoizerWidgetState createState() => _AsyncMemoizerWidgetState();
}

class _AsyncMemoizerWidgetState extends State<AsyncMemoizerWidget> {
  bool switchValue = false;
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('AsyncMemoizer的基本使用'),
        SubtitleWidget('类似FutureBuilder之类的Widget，在setState后会重新执行future，通过AsyncMemoizer可以限制只执行一次'),
        SubtitleWidget('AsyncMemoizer可以将同一个函数的执行结果保存，多次调用只运行一次'),
        Row(
          children: <Widget>[
            Text('Enable AsyncMemoizer'),
            Switch(
              value: switchValue,
              onChanged: (newValue) {
                setState(() => switchValue = newValue);
              },
            ),
          ],
        ),
        RaisedButton(
          onPressed: () => setState(() {}),
          child: Text('Fetch Data'),
        ),
        FutureBuilder(
          future: fetchData(switchValue),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                return Center(child: Text(snapshot.data));
            }
          },
        ),
      ],
    );
  }

  fetchData(bool flag) async {
    if (flag) {
      return this._memoizer.runOnce(() async {
        await Future.delayed(Duration(seconds: 1));
        return 'Data From Net';
      });
    } else {
      await Future.delayed(Duration(seconds: 2));
      return 'Data From Net';
    }
  }
}
