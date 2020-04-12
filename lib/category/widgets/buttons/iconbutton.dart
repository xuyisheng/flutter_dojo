import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class IconButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('IconButton基本使用'),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.desktop_mac),
              onPressed: () {},
              tooltip: 'show tooltip',
            ),
            IconButton(
              icon: Icon(Icons.desktop_mac),
              onPressed: null,
            ),
          ],
        ),
        MainTitleWidget('Custom IconButton'),
        IconButton(
          // 定义图标在IconButton中的定位方式,AlignmentGeometry 如果父Widget尺寸大于child Widget尺寸，这个属性设置会起作用，有很多种对齐方式。
          alignment: AlignmentDirectional.center,
          // 按钮颜色
          color: Colors.green,
          // 如果图标被禁用，则用于按钮内图标的颜色。默认为当前主题的ThemeData.disabledColor
          disabledColor: Colors.cyan,
          // 高亮时的背景色
          highlightColor: Colors.yellow,
          // 按钮内图标的大小
          icon: Icon(Icons.print),
          // 图标尺寸
          iconSize: 50,
          // 按钮内部,墨汁飞溅的颜色,点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
          splashColor: Colors.blue,
          padding: EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
          // 描述按下按钮时将发生的操作的文本
          tooltip: 'show tooltip',
          // IconButton 的点击事件
          onPressed: () {},
        ),
      ],
    );
  }
}
