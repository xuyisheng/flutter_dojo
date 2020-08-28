import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class NotificationListenerWidget extends StatefulWidget {
  @override
  _NotificationListenerWidgetState createState() => _NotificationListenerWidgetState();
}

class _NotificationListenerWidgetState extends State<NotificationListenerWidget> {
  final StreamController<String> _controller = StreamController();
  String msg = '';
  String msgParent = '';
  bool returnValue = true;
  var state = '';

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
        MainTitleWidget('自定义Notification'),
        SubtitleWidget('onNotification返回值控制通知的传递'),
        MultiSelectionWidget('onNotification返回值', [true, false], [true, false], (value) {
          setState(() => returnValue = value);
        }),
        NotificationListener<MyNotification>(
          onNotification: (notification) {
            setState(() => msgParent = notification.msg);
            return true;
          },
          child: NotificationListener<MyNotification>(
            onNotification: (notification) {
              setState(() => msg = notification.msg);
              return returnValue;
            },
            child: Column(
              children: [
                Text('自定义Msg: $msg, \n父Widget是否收到消息: ${msgParent.isEmpty ? false : true}'),
                Builder(
                  builder: (BuildContext context) {
                    return RaisedButton(
                      onPressed: () {
                        msg = '';
                        msgParent = '';
                        MyNotification('MyNotification').dispatch(context);
                      },
                      child: Text('Send'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}
