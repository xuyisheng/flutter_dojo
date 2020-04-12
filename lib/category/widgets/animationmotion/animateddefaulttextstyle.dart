import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleWidgetState createState() => _AnimatedDefaultTextStyleWidgetState();
}

class _AnimatedDefaultTextStyleWidgetState extends State<AnimatedDefaultTextStyleWidget> {
  var style = TextStyle(
    fontSize: 20,
    color: Colors.cyan,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MainTitleWidget('AnimatedDefaultTextStyle基本用法'),
        SubtitleWidget('切换Textstyle的时候增加动画效果'),
        AnimatedDefaultTextStyle(
          child: Text('1234567'),
          style: style,
          duration: Duration(
            seconds: 2,
          ),
          curve: Curves.ease,
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              style = TextStyle(
                fontSize: 40,
                color: Colors.red,
                fontStyle: FontStyle.italic,
              );
            });
          },
          child: Text('Change Text Style'),
        ),
      ],
    );
  }
}
