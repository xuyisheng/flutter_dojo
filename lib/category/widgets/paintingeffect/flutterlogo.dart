import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class FlutterLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('FlutterLogo基本使用'),
          FlutterLogo(),
          FlutterLogo(
            size: 120,
          ),
          MainTitleWidget('FlutterLogo不同样式'),
          FlutterLogo(
            size: 120,
            style: FlutterLogoStyle.horizontal,
            textColor: Colors.green,
          ),
          FlutterLogo(
            size: 120,
            style: FlutterLogoStyle.stacked,
            textColor: Colors.yellow,
          ),
          FlutterLogo(
            size: 120,
            style: FlutterLogoStyle.markOnly,
            textColor: Colors.red,
          )
        ],
      ),
    );
  }
}
