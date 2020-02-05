import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  @override
  _AnimatedCrossFadeWidgetState createState() => _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MainTitleWidget('AnimatedCrossFade基本使用'),
        SubtitleWidget('两个子元素切换的时候增加动画效果'),
        AnimatedCrossFade(
          sizeCurve: ElasticOutCurve(),
          firstCurve: Curves.easeIn,
          secondCurve: Curves.easeInOut,
          duration: Duration(seconds: 3),
          firstChild: FlutterLogo(
            style: FlutterLogoStyle.horizontal,
            size: 100,
          ),
          secondChild: FlutterLogo(
            style: FlutterLogoStyle.markOnly,
            size: 100,
          ),
          crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
        RaisedButton(
          onPressed: () {
            setState(() => isFirst = !isFirst);
          },
          child: Text('Change child with different height'),
        ),
      ],
    );
  }
}
