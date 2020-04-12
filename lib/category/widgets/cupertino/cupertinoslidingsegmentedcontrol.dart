import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoSlidingSegmentedControlWidget extends StatefulWidget {
  @override
  _CupertinoSlidingSegmentedControlWidgetState createState() => _CupertinoSlidingSegmentedControlWidgetState();
}

class _CupertinoSlidingSegmentedControlWidgetState extends State<CupertinoSlidingSegmentedControlWidget> {
  var groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('CupertinoSlidingSegmentedControl基本使用'),
        CupertinoSlidingSegmentedControl<int>(
          children: {
            1: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("Segment 1"),
            ),
            2: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("Segment 2"),
            ),
            3: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("Segment 3"),
            ),
            4: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("Segment 4"),
            ),
          },
          onValueChanged: (value) {
            setState(() => groupValue = value);
          },
          groupValue: groupValue,
        ),
      ],
    );
  }
}
