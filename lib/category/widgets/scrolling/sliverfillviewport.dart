import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class SliverFillViewportWidget extends StatefulWidget {
  @override
  _SliverFillViewportWidgetState createState() => _SliverFillViewportWidgetState();
}

class _SliverFillViewportWidgetState extends State<SliverFillViewportWidget> {
  var value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('SliverFillViewport基本使用'),
        SubtitleWidget('通过viewportFraction修改视图在列表中的占比'),
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverFillViewport(
                viewportFraction: value,
                delegate: SliverChildBuilderDelegate(
                  (_, int index) => Container(
                    margin: EdgeInsets.all(16),
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    height: 60,
                    child: Text(
                      '修仙指南',
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                  childCount: 2,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: value,
          min: 0.1,
          max: 1,
          onChanged: (value) {
            setState(() => this.value = value);
          },
        ),
      ],
    );
  }
}
