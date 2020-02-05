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
        MainTitleWidget('TweenAnimationBuilder'),
        TweenAnimationBuilder(
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
      ],
    );
  }
}
