import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ScrollbarWidget extends StatefulWidget {
  @override
  _ScrollbarWidgetState createState() => _ScrollbarWidgetState();
}

class _ScrollbarWidgetState extends State<ScrollbarWidget> {
  var offsetY = -1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Scrollbar基本使用'),
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        ),
        MainTitleWidget('自定义Scrollbar'),
        Expanded(
          child: NotificationListener(
            onNotification: onScrollNotification,
            child: Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),
                Align(
                  alignment: Alignment(1, offsetY),
                  child: CustomScrollBar(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    setState(() {
      final ScrollMetrics metrics = notification.metrics;
      offsetY = -1 + (metrics.pixels / metrics.maxScrollExtent) * 2;
    });
    return true;
  }
}

class CustomScrollBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.grey.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.arrow_drop_up,
            size: 10,
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 10,
          ),
        ],
      ),
    );
  }
}
