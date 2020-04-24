import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ShapeBorderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('自定义ShapeBorder实现自己的外形'),
        Material(
          color: Colors.red,
          shape: StarBorder(),
          child: Container(
            width: 100,
            height: 100,
          ),
        ),
        SizedBox(height: 40),
        FloatingActionButton(
          onPressed: () {},
          shape: StarBorder(),
          child: Text('FAB'),
        ),
      ],
    );
  }
}

class StarBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path path = Path();
    path.moveTo(rect.width / 2, 0);
    path.lineTo(0, rect.height);
    path.lineTo(rect.width, rect.height);
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}
