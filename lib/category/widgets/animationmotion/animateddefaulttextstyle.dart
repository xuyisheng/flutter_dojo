import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleWidgetState createState() => _AnimatedDefaultTextStyleWidgetState();
}

class _AnimatedDefaultTextStyleWidgetState extends State<AnimatedDefaultTextStyleWidget> with SingleTickerProviderStateMixin {
  var style = TextStyle(
    fontSize: 20,
    color: Colors.cyan,
  );

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = TextStyleTween(
      begin: TextStyle(color: Colors.blue, fontSize: 16),
      end: TextStyle(color: Colors.red, fontSize: 32),
    ).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MainTitleWidget('AnimatedDefaultTextStyle基本用法'),
        SubtitleWidget('切换Textstyle的时候增加动画效果'),
        AnimatedDefaultTextStyle(
          child: Text('1234567'),
          style: style,
          duration: Duration(
            seconds: 2,
          ),
          curve: Curves.ease,
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              style = TextStyle(
                fontSize: 40,
                color: Colors.red,
                fontStyle: FontStyle.italic,
              );
            });
            _animationController.forward();
          },
          child: Text('Change Text Style'),
        ),
        MainTitleWidget('Change Text Style'),
        SubtitleWidget('Animated version of a [DefaultTextStyle] that animates the different properties of its [TextStyle].'),
        DefaultTextStyleTransition(
          style: _animation,
          child: Text('DefaultTextStyleTransition'),
        ),
      ],
    );
  }
}
