import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class FadeInImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('FadeInImage基本使用'),
        SubtitleWidget('在加载网络图片前后的使用切换动画效果'),
        Container(
          child: FadeInImage.assetNetwork(
            fadeInDuration: Duration(milliseconds: 100),
            fadeInCurve: Curves.easeIn,
            placeholder: 'images/flower.jpg',
            image: 'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png',
          ),
        ),
      ],
    );
  }
}
