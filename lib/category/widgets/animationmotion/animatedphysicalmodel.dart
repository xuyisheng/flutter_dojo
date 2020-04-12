import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedPhysicalModelWidget extends StatefulWidget {
  @override
  _AnimatedPhysicalModelWidgetState createState() => _AnimatedPhysicalModelWidgetState();
}

class _AnimatedPhysicalModelWidgetState extends State<AnimatedPhysicalModelWidget> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        MainTitleWidget('AnimatedPhysicalModel基本使用'),
        SubtitleWidget('改变物理状态，例如高度、阴影的时候使用动画效果'),
        AnimatedPhysicalModel(
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          elevation: status ? 0 : 10,
          shape: BoxShape.rectangle,
          shadowColor: Colors.black,
          color: Colors.red,
          borderRadius: status ? BorderRadius.circular(20) : BorderRadius.circular(0),
          child: Container(
            margin: EdgeInsets.all(20),
            height: 200,
            width: 200,
            color: Colors.yellow,
            child: FlutterLogo(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: RaisedButton(
            child: const Text('Change elevation and borderRadius'),
            onPressed: () {
              setState(() => status = !status);
            },
          ),
        ),
      ],
    );
  }
}
