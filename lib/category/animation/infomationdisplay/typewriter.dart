import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class TypewriterWidget extends StatefulWidget {
  @override
  _TypewriterWidgetState createState() => _TypewriterWidgetState();
}

class _TypewriterWidgetState extends State<TypewriterWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<String> animation;
  static const String message = '''
  Widgets that have global keys reparent their subtrees when they are moved from one location in the tree to another location in the tree. In order to reparent its subtree, a widget must arrive at its new location in the tree in the same animation frame in which it was removed from its old location in the tree.
  ''';

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = TypewriterTween(end: message).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('自定义Tween实现对文字的截取动画'),
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Text(
              '${animation.value}',
              style: TextStyle(fontSize: 16),
            );
          },
        ),
        RaisedButton(
          onPressed: () {
            if (controller.status == AnimationStatus.completed) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
          child: Text('Start'),
        )
      ],
    );
  }
}

class TypewriterTween extends Tween<String> {
  TypewriterTween({String begin = '', String end}) : super(begin: begin, end: end);

  String lerp(double t) {
    var cutoff = (end.length * t).round();
    return end.substring(0, cutoff);
  }
}
