import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/item_util.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ExpandedWidget extends StatefulWidget {
  @override
  _ExpandedWidgetState createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('No Expand'),
        Container(
          color: Colors.blue,
          child: Row(
            children: <Widget>[
              Item(),
              Item(),
              Item(),
            ],
          ),
        ),
        MainTitleWidget('Expand in middle'),
        Container(
          color: Colors.blue,
          child: Row(
            children: <Widget>[
              Item(),
              Expanded(child: Item()),
              Item(),
            ],
          ),
        ),
        MainTitleWidget('Expand with flex'),
        Container(
          color: Colors.blue,
          child: Row(
            children: <Widget>[
              Expanded(flex: 4, child: Item()),
              Expanded(flex: 3, child: Item()),
              Expanded(flex: 2, child: Item()),
              Expanded(flex: 1, child: Item()),
            ],
          ),
        ),
      ],
    );
  }
}
