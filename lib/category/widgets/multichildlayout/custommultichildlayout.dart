import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CustomMultiChildLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('自定义视图示例'),
        Container(
          width: 300,
          height: 200,
          color: Colors.grey.shade200,
          child: CustomMultiChildLayout(
            delegate: CustomLayout(),
            children: <Widget>[
              LayoutId(
                id: CustomID.topLeft,
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue,
                ),
              ),
              LayoutId(
                id: CustomID.center,
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              ),
              LayoutId(
                id: CustomID.bottomRight,
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum CustomID {
  topLeft,
  center,
  bottomRight,
}

class CustomLayout extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    final BoxConstraints box = BoxConstraints.loose(size);
    Size centerSize;
    Size bottomRightSize;
    if (hasChild(CustomID.topLeft)) {
      // 即使位置与元素尺寸无关，layoutChild也必须调用，用于获取元素尺寸
      layoutChild(CustomID.topLeft, box);
      final dx = .0;
      final dy = .0;
      positionChild(CustomID.topLeft, Offset(dx, dy));
    }
    if (hasChild(CustomID.center)) {
      centerSize = layoutChild(CustomID.center, box);
      final dx = (size.width - centerSize.width) / 2;
      final dy = (size.height - centerSize.height) / 2;
      positionChild(CustomID.center, Offset(dx, dy));
    }
    if (hasChild(CustomID.bottomRight)) {
      bottomRightSize = layoutChild(CustomID.bottomRight, box);
      final dx = size.width - bottomRightSize.width;
      final dy = size.height - bottomRightSize.height;
      positionChild(CustomID.bottomRight, Offset(dx, dy));
    }
  }

  @override
  bool shouldRelayout(CustomLayout oldDelegate) {
    return false;
  }
}
