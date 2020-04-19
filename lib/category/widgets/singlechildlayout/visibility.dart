import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class VisibilityWidget extends StatefulWidget {
  @override
  _VisibilityWidgetState createState() => _VisibilityWidgetState();
}

class _VisibilityWidgetState extends State<VisibilityWidget> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Visibility基本使用'),
        Row(
          children: <Widget>[
            Text('是否显示'),
            Switch(
              value: flag,
              onChanged: (v) {
                setState(() => flag = v);
              },
            ),
          ],
        ),
        Visibility(
          visible: flag,
          child: FlutterLogo(size: 150),
        ),
      ],
    );
  }
}
