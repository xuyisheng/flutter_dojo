import 'package:flutter/material.dart';

class SplashAnimManager {
  final AnimationController controller;
  final Animation<double> animLeft;
  final Animation<double> animRight;
  final Animation<double> animBottom;
  final double screenWidth;

  SplashAnimManager(this.controller, this.screenWidth)
      // 简单的解决两边文字不相等导致的距离不一样的问题
      : animLeft = Tween(begin: -screenWidth / 2 - 20, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.5, curve: Curves.easeIn),
          ),
        ),
        animRight = Tween(begin: screenWidth / 2, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.5, curve: Curves.easeIn),
          ),
        ),
        animBottom = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1, curve: Curves.easeIn),
          ),
        );
}
