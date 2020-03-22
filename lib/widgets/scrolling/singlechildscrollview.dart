import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MainTitleWidget('SingleChildScrollView基本使用'),
            SubtitleWidget('借助Container的alignment，可以实现撑满屏幕的效果，其原理与Align、Center类似'),
            Container(
              color: Colors.blue,
              height: 200,
            ),
            Container(
              color: Colors.red,
              height: 200,
            ),
            Container(
              color: Colors.cyan,
              height: 200,
            ),
            Container(
              color: Colors.amber,
              height: 200,
            ),
            Container(
              color: Colors.pink,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
