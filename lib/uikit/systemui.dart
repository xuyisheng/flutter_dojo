import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class SystemUIWidget extends StatefulWidget {
  @override
  _SystemUIWidgetState createState() => _SystemUIWidgetState();
}

class _SystemUIWidgetState extends State<SystemUIWidget> {
  var selections = SystemUiOverlay.top;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('状态栏和虚拟导航显示隐藏'),
        MultiSelectionWidget(
          'StatusBar',
          SystemUiOverlay.values,
          ['top', 'bottom'],
          (v) {
            setState(() {});
            SystemChrome.setEnabledSystemUIOverlays([v]);
          },
        ),
        MainTitleWidget('状态栏和虚拟导航着色'),
        MultiSelectionWidget(
          'Tint',
          SystemUiOverlay.values,
          ['top', 'bottom'],
          (v) {
            setState(() {});
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                systemNavigationBarColor: getRandomColor(),
                systemNavigationBarDividerColor: getRandomColor(),
                statusBarColor: getRandomColor(),
              ),
            );
          },
        ),
      ],
    );
  }
}

getRandomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
