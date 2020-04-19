import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class UnconstrainedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('UnconstrainedBox基本使用'),
          SubtitleWidget(
              '子组件的大小会被父组件的constraints属性限制，通过UnconstrainedBox可以解除此限制，类似的还有Row、Column、Align、Center，以及alignment属性等'),
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
                child: Center(
                  child: Text(
                    '父容器100x50，通过UnconstrainedBox设置为200x200',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SubtitleWidget('只解除单一方向上的约束'),
          Container(
            color: Colors.blueAccent,
            width: 150,
            height: 150,
            child: UnconstrainedBox(
              alignment: Alignment.center,
              constrainedAxis: Axis.vertical,
              child: Container(
                color: Colors.purple,
                width: 100,
                height: 100,
                child: Center(
                  child: Text(
                    '解除竖直方向约束',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
