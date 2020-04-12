import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class TooltipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Tooltip基本使用'),
        SubtitleWidget('长按弹出提示'),
        Tooltip(
          message: 'accessibility tooltip',
          verticalOffset: 48,
          child: Icon(
            Icons.accessibility,
            size: 50,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MainTitleWidget('Tooltip in IconButton'),
        IconButton(
          icon: Icon(Icons.backup),
          onPressed: () {},
          tooltip: 'backup tooltip',
        )
      ],
    );
  }
}
