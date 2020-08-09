import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double size = 200;
  Color color = Colors.grey.shade200;
  double radius = 0;
  Future future = Future.delayed(Duration(seconds: 3));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MainTitleWidget('AnimatedContainer基本使用'),
          SubtitleWidget('在改变Container属性的时候添加动画效果'),
          RaisedButton(
            onPressed: () {
              size = Random().nextInt(300).toDouble();
              setState(() {});
            },
            child: Text('Change Size'),
          ),
          RaisedButton(
            onPressed: () {
              color = Colors.grey[100 + 100 * Random().nextInt(8)];
              setState(() {});
            },
            child: Text('Change Color'),
          ),
          RaisedButton(
            onPressed: () {
              radius = 100 * Random().nextDouble();
              setState(() {});
            },
            child: Text('Change Radius'),
          ),
          AnimatedContainer(
            margin: EdgeInsets.only(top: 20),
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(radius),
            ),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 300),
          ),
          MainTitleWidget('AnimatedContainer 结合FutureBuilder'),
          FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              var width = .0;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  width = .0;
                  break;
                case ConnectionState.done:
                  width = 100.0;
                  break;
              }
              return AnimatedContainer(
                width: width,
                duration: Duration(seconds: 3),
                curve: Curves.easeIn,
                child: Image.asset('assets/images/logo.png'),
              );
            },
          ),
        ],
      ),
    );
  }
}
