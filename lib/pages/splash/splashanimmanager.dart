import 'package:flutter/material.dart';

class SplashAnimManager {
  final AnimationController controller;
  final Animation<double> animLeft;
  final Animation<double> animRight;
  final double screenWidth;
  final double offset;

  SplashAnimManager(this.controller, this.screenWidth, this.offset)
      : animLeft = Tween(begin: screenWidth, end: screenWidth / 2 - offset).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn,
          ),
        ),
        animRight = Tween(begin: screenWidth, end: screenWidth / 2 + offset).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn,
          ),
        );
}
