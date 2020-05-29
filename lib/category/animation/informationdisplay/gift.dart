import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class GiftWidget extends StatefulWidget {
  @override
  _GiftWidgetState createState() => _GiftWidgetState();
}

class _GiftWidgetState extends State<GiftWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    var sequence = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: -pi / 8), weight: 0.3),
        TweenSequenceItem(tween: Tween(begin: -pi / 8, end: pi / 8), weight: 0.4),
        TweenSequenceItem(tween: Tween(begin: pi / 8, end: 0.0), weight: 0.3),
      ],
    );
    animation = sequence.animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('通过TweenSequence分解动画'),
        SubtitleWidget('通过repeat()返回的TickerFuture和时间来控制repeat次数'),
        Expanded(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, widget) {
              return Transform.rotate(
                angle: animation.value,
                child: Icon(
                  Icons.card_giftcard,
                  size: 80,
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
        RaisedButton(
          onPressed: () {
            controller.repeat().timeout(Duration(milliseconds: 3000), onTimeout: () {
              controller.stop(canceled: true);
            });
          },
          child: Text('Start'),
        ),
      ],
    );
  }
}
