import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ButtonBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('ButtonBar基本使用'),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Button集合
            RaisedButton(
              child: Text('Item1'),
              color: Colors.yellow,
              onPressed: () => {},
            ),
            RaisedButton(
              child: Text('Item2'),
              color: Colors.red,
              onPressed: () => {},
            ),
            RaisedButton(
              child: Text('Item3'),
              color: Colors.blue,
              onPressed: () => {},
            ),
          ],
        ),
      ],
    );
  }
}
