import 'dart:math';

import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.yellow,
      width: 60,
      height: 60,
    );
  }
}

class SizedItem extends StatelessWidget {
  final double size;

  SizedItem(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: size,
      height: size,
    );
  }
}

class RandomWidthItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.yellow,
      width: Random().nextInt(100).toDouble(),
      height: 60,
    );
  }
}

class RandomHeightItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.yellow,
      height: 10 + Random().nextInt(100).toDouble(),
      width: 60,
    );
  }
}
