import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ExpandIconWidget extends StatefulWidget {
  @override
  _ExpandIconWidgetState createState() => _ExpandIconWidgetState();
}

class _ExpandIconWidgetState extends State<ExpandIconWidget> with SingleTickerProviderStateMixin {
  var flag = true;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
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
        MainTitleWidget('ExpandIcon基本使用'),
        Row(
          children: <Widget>[
            RotationTransition(
              turns: Tween<double>(
                begin: 0,
                end: 0.5,
              ).animate(controller),
              child: FlutterLogo(
                size: 100,
              ),
            ),
            ExpandIcon(
              isExpanded: flag,
              size: 50,
              color: Colors.blue,
              expandedColor: Colors.grey,
              onPressed: (value) {
                if (flag) {
                  controller.forward();
                } else {
                  controller.reverse();
                }
                setState(() => flag = !flag);
              },
            ),
          ],
        ),
      ],
    );
  }
}
