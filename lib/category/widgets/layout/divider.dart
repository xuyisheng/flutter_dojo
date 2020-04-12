import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MainTitleWidget('Divider基本用法'),
          ListTile(
            title: Text('Item1'),
          ),
          Divider(),
          ListTile(
            title: Text('Item2'),
          ),
          Divider(),
          ListTile(
            title: Text('Item3'),
          ),
          Divider(),
          MainTitleWidget('Divider的高度范围 height'),
          Divider(height: 60),
          MainTitleWidget('Divider的分割线粗细'),
          Divider(thickness: 20),
          MainTitleWidget('Divider左侧的空间大小 indent'),
          Divider(indent: 100),
          MainTitleWidget('Divider颜色 color'),
          Divider(color: Colors.red),
        ],
      ),
    );
  }
}
