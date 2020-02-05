import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class IntrinsicHeightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('IntrinsicHeight基本使用'),
        SubtitleWidget('限制Child的最大高度'),
        Expanded(
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 50,
                    color: Colors.orange,
                  ),
                  Container(
                    width: 100,
                    color: Colors.green,
                  )
                ],
              ),
              SizedBox(height: 20),
              IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 50,
                      color: Colors.orange,
                    ),
                    Container(
                      width: 100,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
