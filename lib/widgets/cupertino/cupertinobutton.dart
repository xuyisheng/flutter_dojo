import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Button基本使用'),
        CupertinoButton(
          child: Text('Button'),
          onPressed: () {},
        ),
        SizedBox(height: 20),
        CupertinoButton.filled(
          child: Text('Button'),
          onPressed: () {},
        ),
      ],
    );
  }
}
