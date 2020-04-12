import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoActivityIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('ActivityIndicator基本使用'),
        CupertinoActivityIndicator(),
        SizedBox(height: 20),
        CupertinoActivityIndicator(radius: 30.0),
        SizedBox(height: 20),
        CupertinoActivityIndicator(
          animating: false,
          radius: 30.0,
        )
      ],
    );
  }
}
