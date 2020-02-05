import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class OutlineButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('OutlineButton基本使用'),
        OutlineButton(
          child: Text('OutlineButton'),
          onPressed: () {},
        ),
        MainTitleWidget('OutlineButton with icon'),
        OutlineButton.icon(
          icon: Icon(
            Icons.input,
            size: 25.0,
            color: Colors.cyan,
          ),
          label: Text('OutlineButton'),
          onPressed: () {},
        ),
        MainTitleWidget('OutlineButton with custom border'),
        OutlineButton(
          child: Text('OutlineButton'),
          onPressed: () {},
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
            style: BorderStyle.solid,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
