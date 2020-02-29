import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class CustomSingleChildLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('CustomSingleChildLayout用于控制Child的布局行为'),
        SubtitleWidget('虽然Child的尺寸是200x200，但是被限制为50x50'),
        CustomSingleChildLayout(
          delegate: FixedSizeDelegate(Size(50, 50)),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

class FixedSizeDelegate extends SingleChildLayoutDelegate {
  final Size size;

  FixedSizeDelegate(this.size);

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return new BoxConstraints.tight(size);
  }

  @override
  Size getSize(BoxConstraints constraints) => size;

  @override
  bool shouldRelayout(FixedSizeDelegate oldDelegate) {
    return size != oldDelegate.size;
  }
}
