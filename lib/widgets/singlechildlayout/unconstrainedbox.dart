import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class UnconstrainedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('UnconstrainedBox基本使用'),
        SubtitleWidget('子组件的大小会被父组件的constraints属性限制，通过UnconstrainedBox可以解除此限制，类似的还有Row、Column、Align、Center等'),
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 100,
            minHeight: 50,
          ),
          child: UnconstrainedBox(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
