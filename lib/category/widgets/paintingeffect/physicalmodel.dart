import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class PhysicalModelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('PhysicalModel基本使用'),
        SubtitleWidget('修改组件的物理属性，例如Z轴高度，或者裁剪带背景图的容器'),
        PhysicalModel(
          elevation: 6,
          shape: BoxShape.rectangle,
          shadowColor: Colors.black,
          color: Colors.white,
          child: Container(
            height: 120,
            width: 120,
            color: Colors.blue[50],
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        SizedBox(height: 20),
        PhysicalModel(
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          color: Colors.transparent,
          elevation: 5,
          child: Container(
            width: 120,
            child: Image.asset(
              'images/book.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
