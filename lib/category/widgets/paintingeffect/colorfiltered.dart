import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ColorFilteredWidget extends StatefulWidget {
  @override
  _ColorFilteredWidgetState createState() => _ColorFilteredWidgetState();
}

class _ColorFilteredWidgetState extends State<ColorFilteredWidget> {
  var mode = BlendMode.modulate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('改变图片的着色'),
        SubtitleWidget('除了图片，自定义Widget或者普通Widget同样可以使用'),
        ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.green, mode),
          child: Image.asset('images/logo.png'),
        ),
        MultiSelectionWidget('BlendMode', BlendMode.values, BlendMode.values, (value) {
          setState(() => mode = value);
        })
      ],
    );
  }
}
