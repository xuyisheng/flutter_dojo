import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedSizeWidget extends StatefulWidget {
  @override
  _AnimatedSizeWidgetState createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget> with SingleTickerProviderStateMixin {
  bool status = true;
  double width = 200;
  double height = 200;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        MainTitleWidget('AnimatedSize基本使用'),
        SubtitleWidget('改变Size的时候使用动画效果'),
        Container(
          width: 300,
          height: 300,
          color: Colors.yellow,
          child: Center(
            child: AnimatedSize(
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: Container(
                width: width,
                height: height,
                color: Colors.blue,
              ),
              vsync: this,
            ),
          ),
        ),
        RaisedButton(
          child: Text('Change Size'),
          onPressed: () {
            setState(() {
              width = status ? 250 : 200;
              height = status ? 150 : 200;
              status = !status;
            });
          },
        ),
      ],
    );
  }
}
