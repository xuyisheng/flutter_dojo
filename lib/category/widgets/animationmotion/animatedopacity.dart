import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double opacity = 1.0;

  _changeOpacity() {
    setState(() => opacity = opacity == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainTitleWidget('AnimatedOpacity基本使用'),
          SubtitleWidget('改变透明度的时候使用动画效果'),
          Container(
            height: 300,
            width: 300,
            color: Colors.grey.shade200,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 1),
              child: FlutterLogo(),
            ),
          ),
          RaisedButton(
            child: Text('Change Opacity'),
            onPressed: _changeOpacity,
          ),
        ],
      ),
    );
  }
}
