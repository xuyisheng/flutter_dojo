import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ScrollConfigurationWidget extends StatelessWidget {
  final initList = List<String>.generate(20, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('ScrollConfiguration edge effect'),
        SubtitleWidget('通过修改ScrollBehavior来改变滚动组件的边缘效果，例如ListView边缘半月形闪光'),
        SubtitleWidget('如果要全局生效则需要在MaterialApp下设置'),
        SubtitleWidget('或者设置ThemeData的TargetPlatform.iOS'),
        Expanded(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: initList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${initList[index]}'),
                );
              },
            ),
          ),
        ),
        SubtitleWidget('通过设置NotificationListener来修改'),
        Expanded(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowGlow();
              return false;
            },
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: initList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${initList[index]}'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

// edge效果来自GlowingOverscrollIndicator
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
