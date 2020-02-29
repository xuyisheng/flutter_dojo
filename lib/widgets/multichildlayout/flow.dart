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
    return Column(
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
      ],
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
    return Size(double.infinity, 400);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dy = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dy = context.getChildSize(i).height * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          0,
          dy * menuAnimation.value,
          0,
        ),
      );
    }
  }
}
