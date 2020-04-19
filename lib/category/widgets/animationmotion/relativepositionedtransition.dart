import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class RelativePositionedTransitionWidget extends StatefulWidget {
  @override
  _RelativePositionedTransitionWidgetState createState() => _RelativePositionedTransitionWidgetState();
}

class _RelativePositionedTransitionWidgetState extends State<RelativePositionedTransitionWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          animationController.reset();
          animationController.forward();
        });
      },
      child: Column(
        children: <Widget>[
          MainTitleWidget('RelativePositionedTransition基本使用'),
          Container(
            color: Colors.grey.shade200,
            width: 200,
            height: 200,
            child: Stack(
              children: <Widget>[
                RelativePositionedTransition(
                  size: Size(200, 200),
                  rect: RectTween(
                    begin: Rect.fromLTRB(0, 0, 50, 50),
                    end: Rect.fromLTRB(0, 0, 150, 150).translate(50, 50),
                  ).animate(animationController),
                  child: FlutterLogo(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
