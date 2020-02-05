import 'package:flutter/material.dart';

class CustomMultiChildLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _CustomLayout(margin: 5),
      children: <Widget>[
        LayoutId(
          id: Custom.up,
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: DecoratedBox(
                decoration: BoxDecoration(
              color: Colors.blue,
            )),
          ),
        ),
        LayoutId(
          id: Custom.center,
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: DecoratedBox(
                decoration: BoxDecoration(
              color: Colors.red,
            )),
          ),
        ),
        LayoutId(
          id: Custom.down,
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: DecoratedBox(
                decoration: BoxDecoration(
              color: Colors.green,
            )),
          ),
        ),
        LayoutId(
          id: Custom.right,
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: DecoratedBox(
                decoration: BoxDecoration(
              color: Colors.limeAccent,
            )),
          ),
        ),
        LayoutId(
          id: Custom.left,
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: DecoratedBox(
                decoration: BoxDecoration(
              color: Colors.deepOrange,
            )),
          ),
        ),
      ],
    );
  }
}

enum Custom {
  up,
  center,
  down,
  left,
  right,
}

class _CustomLayout extends MultiChildLayoutDelegate {
  _CustomLayout({this.margin: 3.0});

  //外边距
  final double margin;

  @override //性能布局
  void performLayout(Size size) {
    final BoxConstraints box = BoxConstraints.loose(size);
    Size upSize;
    Size centerSize;
    Size downSize;
    Size leftSize;
    Size rightSize;
    if (hasChild(Custom.up)) {
      upSize = layoutChild(Custom.up, box);
      final dx = (size.width - upSize.width) / 2;
      final dy = (size.height - upSize.height) / 2 - upSize.height - margin;
      positionChild(Custom.up, Offset(dx, dy));
    }
    if (hasChild(Custom.center)) {
      centerSize = layoutChild(Custom.center, box);
      final dx = (size.width - centerSize.width) / 2;
      final dy = (size.height - centerSize.height) / 2;
      positionChild(Custom.center, Offset(dx, dy));
    }
    if (hasChild(Custom.down)) {
      downSize = layoutChild(Custom.down, box);
      final dx = (size.width - downSize.width) / 2;
      final dy = (size.height - downSize.height) / 2 + downSize.height + margin;
      positionChild(Custom.down, Offset(dx, dy));
    }
    if (hasChild(Custom.left)) {
      leftSize = layoutChild(Custom.left, box);
      final dx = (size.width - leftSize.width) / 2 - leftSize.width - margin;
      final dy = (size.height - leftSize.height) / 2;
      positionChild(Custom.left, Offset(dx, dy));
    }
    if (hasChild(Custom.right)) {
      rightSize = layoutChild(Custom.right, box);
      final dx = (size.width - rightSize.width) / 2 + rightSize.width + margin;
      final dy = (size.height - rightSize.height) / 2;
      positionChild(Custom.right, Offset(dx, dy));
    }
  }

  @override //是否应该重绘
  bool shouldRelayout(_CustomLayout oldDelegate) {
    return oldDelegate.margin != margin;
  }
}
