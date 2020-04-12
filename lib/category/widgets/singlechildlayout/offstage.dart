import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class OffstageWidget extends StatefulWidget {
  @override
  _OffstageWidgetState createState() => _OffstageWidgetState();
}

class _OffstageWidgetState extends State<OffstageWidget> {
  var flag = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Offstage基本使用'),
          Offstage(
            offstage: flag,
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              color: Colors.green,
              child: Text('offstage:false'),
            ),
          ),
          SubtitleWidget('offstage为true（默认）时，不显示子widget'),
          SubtitleWidget('offstage为false时，显示子widget'),
          SubtitleWidget('如果有动画，动画会继续运行，无论它是否可见，都会增加耗电和消耗CPU'),
          SubtitleWidget('如果是完全不用的widget更好的方式是从tree中移除，而不是保存在Offstage子树中'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Toggle Offstage'),
              Switch(
                value: flag,
                onChanged: (v) {
                  setState(() => flag = v);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
