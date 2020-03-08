import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class NotificationListenerWidget extends StatefulWidget {
  @override
  _NotificationListenerWidgetState createState() => _NotificationListenerWidgetState();
}

class _NotificationListenerWidgetState extends State<NotificationListenerWidget> {
  final StreamController<String> _controller = StreamController();

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('NotificationListener基本使用'),
        Expanded(
          child: StreamBuilder(
            initialData: '',
            stream: _controller.stream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return Text(snapshot.data);
            },
          ),
        ),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int position) {
                return ListTile(
                  title: Text('ListTile:$position'),
                );
              },
              itemCount: 30,
            ),
            onNotification: (notification) {
              var state = '';
              switch (notification.runtimeType) {
                case ScrollStartNotification:
                  state = '开始滚动';
                  break;
                case ScrollUpdateNotification:
                  state = '正在滚动';
                  break;
                case ScrollEndNotification:
                  state = '滚动停止';
                  break;
                case OverscrollNotification:
                  state = '滚动到边界';
                  break;
              }
              _controller.add('depth:${notification.depth}\n'
                  'state:$state\n'
                  'metrics\n'
                  '-axisDirection:${notification.metrics.axisDirection}\n'
                  '-axis:${notification.metrics.axis}\n'
                  '-extentAfter:${notification.metrics.extentAfter}\n'
                  '-extentBefore:${notification.metrics.extentBefore}\n'
                  '-extentInside:${notification.metrics.extentInside}\n'
                  '-minScrollExtent:${notification.metrics.minScrollExtent}\n'
                  '-maxScrollExtent:${notification.metrics.maxScrollExtent}\n'
                  '-atEdge:${notification.metrics.atEdge}\n'
                  '-outOfRange:${notification.metrics.outOfRange}\n'
                  '-pixels:${notification.metrics.pixels}\n'
                  '-viewportDimension:${notification.metrics.viewportDimension}\n');
              return false;
            },
          ),
        ),
      ],
    );
  }
}
