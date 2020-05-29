import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class InkWellWidget extends StatefulWidget {
  @override
  _InkWellWidgetState createState() => _InkWellWidgetState();
}

class _InkWellWidgetState extends State<InkWellWidget> {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('InkWell基本使用'),
          SubtitleWidget('InkWell需要设置在Material Widget中'),
          SubtitleWidget('InkWell的Child有背景色时会被遮挡，需要设置在Material中'),
          Container(
            height: 100,
            width: 100,
            child: Material(
              color: Colors.yellow,
              child: InkWell(
                onTap: () => setState(() {}),
              ),
            ),
          ),
          MainTitleWidget('InkWell with Shape'),
          Material(
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => setState(() {}),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  alignment: Alignment.center,
                  child: Text(
                    'InkWell',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          MainTitleWidget('自定义InkWell颜色'),
          Container(
            height: 100,
            width: 100,
            child: Material(
              color: Colors.green,
              child: InkWell(
                highlightColor: Colors.red,
                splashColor: Colors.blue,
                onTap: () => setState(() {}),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
