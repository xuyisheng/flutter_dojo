import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class SequenceWidget extends StatefulWidget {
  @override
  _SequenceWidgetState createState() => _SequenceWidgetState();
}

class _SequenceWidgetState extends State<SequenceWidget> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  TweenSequence tweenSequence;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 6));
    tweenSequence = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.red,
            end: Colors.blue,
          ),
          weight: 0.3),
      TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.yellow,
            end: Colors.green,
          ),
          weight: 0.3),
      TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.cyan,
            end: Colors.orange,
          ),
          weight: 0.4),
    ]);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('通过TweenSequence实行序列动画'),
        AnimatedBuilder(
          animation: animationController,
          builder: (context, widget) {
            return Container(
              width: 200,
              height: 200,
              color: tweenSequence.animate(animationController).value,
            );
          },
        ),
        RaisedButton(
          onPressed: () {
            if (animationController.status == AnimationStatus.completed) {
              animationController.reverse();
            } else {
              animationController.forward();
            }
          },
          child: Text('Start'),
        ),
      ],
    );
  }
}
