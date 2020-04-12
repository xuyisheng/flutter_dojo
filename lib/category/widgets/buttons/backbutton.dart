import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class BackButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('BackButton基本使用'),
        SizedBox(height: 20),
        BackButton(color: Colors.red),
        SizedBox(height: 20),
        SubtitleWidget('BackButtonIcon，只是一张图'),
        BackButtonIcon(),
        SizedBox(height: 20),
        SubtitleWidget('CloseButton与BackButton功能相同，图标不同'),
        CloseButton(),
      ],
    );
  }
}
