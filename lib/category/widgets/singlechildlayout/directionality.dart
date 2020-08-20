import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class DirectionalityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainTitleWidget('Directionality基本用法'),
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text('控制文字方向'),
          ),
        ),
      ],
    );
  }
}
