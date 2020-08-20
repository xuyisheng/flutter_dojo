import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class LinearProgressIndicatorWidget extends StatefulWidget {
  @override
  _LinearProgressIndicatorWidgetState createState() => _LinearProgressIndicatorWidgetState();
}

class _LinearProgressIndicatorWidgetState extends State<LinearProgressIndicatorWidget> with SingleTickerProviderStateMixin {
  var animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('LinearProgressIndicator基本使用'),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: 300,
          child: LinearProgressIndicator(),
        ),
        SubtitleWidget('value固定后即没有动画效果'),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: 300,
          child: LinearProgressIndicator(
            value: 0.5,
          ),
        ),
        SubtitleWidget('通过设置valueColor来实现变换颜色的效果'),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: 300,
          child: LinearProgressIndicator(
            valueColor: animation,
          ),
        ),
        SubtitleWidget('通过AlwaysStoppedAnimation来修改不需要变换颜色的效果'),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: 300,
          child: LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
        SubtitleWidget('通过ClipRRect设置圆角效果 通过修改父容器高度设置显示高度'),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: 300,
          height: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.red,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
