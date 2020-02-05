import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ConstrainedBoxWidget extends StatefulWidget {
  @override
  _ConstrainedBoxWidgetState createState() => _ConstrainedBoxWidgetState();
}

class _ConstrainedBoxWidgetState extends State<ConstrainedBoxWidget> {
  double count = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MainTitleWidget('设置最大宽度或高度'),
          Slider(
            value: count,
            max: 15,
            onChanged: (value) {
              setState(() {
                count = value;
              });
            },
          ),
          SubtitleWidget('最小高度100,最小宽度100,最大高度200,最大宽度150'),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 100,
              minHeight: 100,
              maxWidth: 150,
              maxHeight: 200,
            ),
            child: Container(
              color: Colors.red,
              margin: EdgeInsets.all(10),
              child: Text(
                '使用内容填充容器' * count.toInt(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          MainTitleWidget('BoxConstraints.expand'),
          SubtitleWidget('无论子Widget是什么约束，都填充父容器'),
          ConstrainedBox(
            constraints: BoxConstraints.expand(
              width: 200,
              height: 200,
            ),
            child: Container(
              color: Colors.red,
              margin: EdgeInsets.all(10),
              child: Text(
                '使用内容填充容器' * count.toInt(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          MainTitleWidget('BoxConstraints.tight'),
          SubtitleWidget('无论子Widget是什么约束，均按照Size的宽高进行约束'),
          SubtitleWidget('tightFor和tightForFinite是tight属性的精细化设置'),
          ConstrainedBox(
            constraints: BoxConstraints.tight(Size(100, 100)),
            child: Container(
              color: Colors.red,
              margin: EdgeInsets.all(10),
              child: Text(
                '使用内容填充容器' * count.toInt(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          MainTitleWidget('BoxConstraints.loose'),
          SubtitleWidget('loose限制了Child的最大Size'),
          ConstrainedBox(
            constraints: BoxConstraints.loose(Size(100, 100)),
            child: Container(
              color: Colors.red,
              margin: EdgeInsets.all(10),
              child: Text(
                '使用内容填充容器' * count.toInt(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
