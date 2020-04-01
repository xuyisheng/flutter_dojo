import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class TweenAnimationBuilderWidget extends StatefulWidget {
  @override
  _TweenAnimationBuilderWidgetState createState() => _TweenAnimationBuilderWidgetState();
}

class _TweenAnimationBuilderWidgetState extends State<TweenAnimationBuilderWidget> {
  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('TweenAnimationBuilder基本使用'),
        Container(
          height: 120,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: targetValue),
            onEnd: () {
              setState(() => targetValue = 96);
            },
            duration: Duration(seconds: 2),
            builder: (BuildContext context, double size, Widget child) {
              return IconButton(
                iconSize: size,
                color: Colors.blue,
                icon: child,
                onPressed: () {
                  setState(() {
                    targetValue = targetValue == 24.0 ? 48.0 : 24.0;
                  });
                },
              );
            },
            child: Icon(Icons.aspect_ratio),
          ),
        ),
        MainTitleWidget('使用TweenAnimationBuilder构建无内置的隐式动画'),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 6 * pi),
          duration: Duration(milliseconds: 2000),
          child: Icon(Icons.aspect_ratio, size: 60),
          builder: (BuildContext context, double value, Widget child) {
            double wiggle = sin(value);
            return Transform.translate(
              offset: Offset(0, wiggle * 6),
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: value == 0 || value == 6 * pi ? 0 : 8,
                child: child,
              ),
            );
          },
        ),
      ],
    );
  }
}
