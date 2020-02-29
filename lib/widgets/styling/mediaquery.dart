import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class MediaQueryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);

    return ListView(
      children: <Widget>[
        MainTitleWidget('MediaQuery基本使用'),
        Text('size.width : ${data.size.width}'),
        Text('size.height : ${data.size.height}'),
        Text('devicePixelRatio : ${data.devicePixelRatio}'),
        Text('orientation : ${data.orientation}'),
        MainTitleWidget('MediaQuery修改参数'),
        MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 2),
          child: Container(child: Text('Change TextScaleFactor')),
        ),
      ],
    );
  }
}
