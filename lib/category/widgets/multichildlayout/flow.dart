import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class FlowWidget extends StatefulWidget {
  @override
  _FlowWidgetState createState() => _FlowWidgetState();
}

class _FlowWidgetState extends State<FlowWidget> with SingleTickerProviderStateMixin {
  AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  Widget flowMenuItem(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          menuAnimation.status == AnimationStatus.completed ? menuAnimation.reverse() : menuAnimation.forward();
        },
        child: Container(
          width: 40,
          height: 40,
          color: Colors.blue,
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MainTitleWidget('Flow基本使用'),
          SubtitleWidget('关键在于对Child的定位'),
          Container(
            child: Flow(
              delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
              children: menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
            ),
          ),
          CircleLayout(),
          Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            child: CircleAnimLayout(
              children: List.generate(8, (_) {}).map((v) => CircleAvatar(child: Icon(Icons.attach_money))).toList(),
              icon: CircleAvatar(child: Text('xu')),
            ),
          ),
        ],
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({this.menuAnimation}) : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 300);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dy = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dy = context.getChildSize(i).height * i;
      context.paintChild(i, transform: Matrix4.translationValues(0, dy * menuAnimation.value, 0));
    }
  }
}

class CircleLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      child: Flow(
        delegate: _CircleFlowDelegate(),
        children: List.generate(8, (_) {}).map((v) => CircleAvatar(child: Icon(Icons.attach_money))).toList(),
      ),
    );
  }
}

class _CircleFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double radius = context.size.shortestSide / 2;
    var count = context.childCount;
    var rad = 2 * pi / count;
    for (int i = 0; i < count; i++) {
      var width = context.getChildSize(i).width / 2;
      var height = context.getChildSize(i).height / 2;
      var offsetX = (radius - width) * cos(i * rad) + radius;
      var offsetY = (radius - height) * sin(i * rad) + radius;
      context.paintChild(i, transform: Matrix4.translationValues(offsetX - width, offsetY - height, 0.0));
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}

class CircleAnimLayout extends StatefulWidget {
  final List<Widget> children;
  final Widget icon;

  CircleAnimLayout({@required this.children, @required this.icon});

  @override
  _CircleAnimLayoutState createState() => _CircleAnimLayoutState();
}

class _CircleAnimLayoutState extends State<CircleAnimLayout> with SingleTickerProviderStateMixin {
  AnimationController controller;
  double rad = 0;
  bool closed = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this)
      ..addListener(() => setState(() => rad = (closed ? (controller.value) : 1 - controller.value)))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          closed = !closed;
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: CircleAnimLayoutDelegate(rad),
      children: [
        ...widget.children,
        GestureDetector(
          onTap: () {
            controller.reset();
            controller.forward();
          },
          child: widget.icon,
        ),
      ],
    );
  }
}

class CircleAnimLayoutDelegate extends FlowDelegate {
  final double rad;

  CircleAnimLayoutDelegate(this.rad);

  @override
  void paintChildren(FlowPaintingContext context) {
    double radius = context.size.shortestSide / 2;
    var count = context.childCount - 1;
    var perRad = 2 * pi / count;
    for (int i = 0; i < count; i++) {
      print(i);
      var cSizeX = context.getChildSize(i).width / 2;
      var cSizeY = context.getChildSize(i).height / 2;
      var offsetX = rad * (radius - cSizeX) * cos(i * perRad) + radius;
      var offsetY = rad * (radius - cSizeY) * sin(i * perRad) + radius;
      context.paintChild(i, transform: Matrix4.translationValues(offsetX - cSizeX, offsetY - cSizeY, 0.0));
    }
    context.paintChild(context.childCount - 1,
        transform: Matrix4.translationValues(
            radius - context.getChildSize(context.childCount - 1).width / 2, radius - context.getChildSize(context.childCount - 1).height / 2, 0.0));
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}
