import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class FlexibleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Flexible基本使用'),
        SubtitleWidget('fit属性是在flex划分后进行的计算'),
        SubtitleWidget('FlexFit.loose允许子Widget获取可获取的最大尺寸，但可以不占满'),
        SubtitleWidget('FlexFit.tight强制子Widget占据所有剩余空间'),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Container(
            height: 50,
            color: Colors.indigoAccent,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.yellow,
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.red,
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Container(
            color: Colors.green,
            height: 10,
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(
            color: Colors.orange,
            height: 10,
          ),
        )
      ],
    );
  }
}
