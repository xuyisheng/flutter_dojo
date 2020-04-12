import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class IndexedStackWidget extends StatefulWidget {
  @override
  _IndexedStackWidgetState createState() => _IndexedStackWidgetState();
}

class _IndexedStackWidgetState extends State<IndexedStackWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('IndexedStack基本使用'),
        IndexedStack(
          index: index,
          children: <Widget>[
            Icon(
              Icons.add,
              size: 40.0,
              color: Colors.red,
            ),
            Icon(
              Icons.ac_unit,
              size: 40.0,
              color: Colors.red,
            ),
            Icon(
              Icons.access_alarm,
              size: 40.0,
              color: Colors.red,
            ),
            Icon(
              Icons.accessibility,
              size: 40.0,
              color: Colors.red,
            ),
            Icon(
              Icons.account_balance,
              size: 40.0,
              color: Colors.red,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              if (index < 4) {
                index++;
              } else {
                index = 0;
              }
            });
          },
          child: Text('Change index'),
        ),
      ],
    );
  }
}
