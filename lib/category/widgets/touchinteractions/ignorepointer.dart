import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class IgnorePointerWidget extends StatefulWidget {
  @override
  _IgnorePointerWidgetState createState() => _IgnorePointerWidgetState();
}

class _IgnorePointerWidgetState extends State<IgnorePointerWidget> {
  bool ignoreTouch = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('IgnorePointer基本使用'),
        Text('IgnoreTouch Touch?'),
        Switch(
            value: ignoreTouch,
            onChanged: (value) {
              setState(() => ignoreTouch = value);
            }),
        IgnorePointer(
          ignoring: ignoreTouch,
          child: RaisedButton(
            onPressed: () {},
            child: Text('IgnorePointer'),
          ),
        ),
      ],
    );
  }
}
