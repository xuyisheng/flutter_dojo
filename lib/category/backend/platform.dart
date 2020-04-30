import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class PlatformWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var style = TextStyle(fontSize: 20);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        MainTitleWidget('Platform封装了一些平台相关的属性枚举判断'),
        Text('${Platform.isAndroid}', style: style),
        Text('${Platform.operatingSystem}', style: style),
        Text('${Platform.localeName}', style: style),
        Text('${Platform.version}', style: style),
        Text('${Platform.script}', style: style),
        Text('${Platform.resolvedExecutable}', style: style),
      ],
    );
  }
}
