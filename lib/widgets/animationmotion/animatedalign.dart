import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedAlignWidget extends StatefulWidget {
  @override
  _AnimatedAlignWidgetState createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  var _alignment = Alignment.topLeft;

  void _changeAlignment() {
    setState(() => _alignment = _alignment == Alignment.topLeft ? Alignment.bottomRight : Alignment.topLeft);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        MainTitleWidget('AnimatedAlign基本使用'),
        SubtitleWidget('改变Align的时候使用动画效果'),
        Container(
          height: 300,
          width: 300,
          color: Colors.grey.shade200,
          child: AnimatedAlign(
            alignment: _alignment,
            curve: Curves.ease,
            duration: Duration(seconds: 3),
            child: FlutterLogo(
              size: 100,
            ),
          ),
        ),
        RaisedButton(
          onPressed: () => _changeAlignment(),
          child: Text("Change Align"),
        )
      ],
    );
  }
}
