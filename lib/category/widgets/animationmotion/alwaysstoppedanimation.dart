import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AlwaysStoppedAnimationWidget extends StatefulWidget {
  @override
  _AlwaysStoppedAnimationWidgetState createState() => _AlwaysStoppedAnimationWidgetState();
}

class _AlwaysStoppedAnimationWidgetState extends State<AlwaysStoppedAnimationWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('AlwaysStoppedAnimation基本使用'),
        SubtitleWidget('AlwaysStoppedAnimation通常用于在XXXTransition中配置Animation，不用创建新的Tween'),
        AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) {
            return ScaleTransition(
              scale: AlwaysStoppedAnimation<double>(1.0 - (controller.value) * 0.4),
              child: RotationTransition(
                turns: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Colors.grey.withOpacity(0.6), offset: const Offset(2.0, 4.0), blurRadius: 8),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                    child: Image.asset('images/book.jpg'),
                  ),
                ),
              ),
            );
          },
        ),
        RaisedButton(
          onPressed: () {
            if (controller.isCompleted) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
          child: Text('start'),
        ),
      ],
    );
  }
}
