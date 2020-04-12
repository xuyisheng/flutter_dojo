import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class RotateMenuWidget extends StatefulWidget {
  @override
  _RotateMenuWidgetState createState() => _RotateMenuWidgetState();
}

class _RotateMenuWidgetState extends State<RotateMenuWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: -pi / 2, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.grey.shade200,
            child: Center(child: MainTitleWidget('通过简单的Transform实现旋转菜单展示')),
          ),
          AnimatedBuilder(
            animation: animation,
            builder: (context, widget) {
              return Transform.rotate(
                angle: animation.value,
                origin: Offset(24, 24),
                alignment: Alignment.topLeft,
                child: Container(
                  constraints: BoxConstraints.expand(),
                  color: Colors.purple,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 100, left: 10),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            'Rotate Menu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Menu',
                            style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Menu',
                            style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Menu',
                            style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {
                if (controller.isCompleted) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.menu,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
