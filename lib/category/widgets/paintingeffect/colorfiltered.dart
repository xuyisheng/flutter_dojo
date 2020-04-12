import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ColorFilteredWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('改变图片的着色'),
        SubtitleWidget('除了图片，自定义Widget或者普通Widget同样可以使用'),
        ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.green, BlendMode.modulate),
          child: Image.asset('images/logo.png'),
        )
      ],
    );
  }
}
