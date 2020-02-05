import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class ScreenOrientationWidget extends StatefulWidget {
  @override
  _ScreenOrientationWidgetState createState() => _ScreenOrientationWidgetState();
}

class _ScreenOrientationWidgetState extends State<ScreenOrientationWidget> {
  var orientations = DeviceOrientation.portraitUp;
  var gravityOrientation = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('指定单方向'),
        MultiSelectionWidget(
          'Screen Orientation',
          DeviceOrientation.values,
          ['portraitUp', 'portraitDown', 'landscapeLeft', 'landscapeRight'],
          (v) {
            SystemChrome.setPreferredOrientations([v]);
          },
        ),
        MainTitleWidget('重力感应'),
        Row(
          children: <Widget>[
            Text('跟随手机旋转'),
            Switch(
              value: gravityOrientation,
              onChanged: (v) {
                setState(() => gravityOrientation = !gravityOrientation);
                if (v) {
                  SystemChrome.setPreferredOrientations(DeviceOrientation.values);
                } else {
                  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                }
              },
            )
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
}
