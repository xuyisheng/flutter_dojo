import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class VerticalDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('VerticalDivider基本使用'),
        Expanded(
          child: Row(
            children: <Widget>[
              Container(
                child: Text('Item1'),
              ),
              VerticalDivider(),
              Container(
                child: Text('Item2'),
              ),
              VerticalDivider(),
              Container(
                child: Text('Item3'),
              ),
              VerticalDivider(),
            ],
          ),
        ),
      ],
    );
  }
}
