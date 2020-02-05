import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class IntrinsicWidthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('IntrinsicWidth基本使用'),
          Column(
            children: <Widget>[
              Container(
                height: 100,
                width: 50,
                color: Colors.orange,
              ),
              Container(
                height: 100,
                color: Colors.green,
              )
            ],
          ),
          SizedBox(height: 20),
          SubtitleWidget('限制Child的最大宽度'),
          IntrinsicWidth(
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.orange,
                ),
                Container(
                  height: 100,
                  color: Colors.green,
                )
              ],
            ),
          ),
          MainTitleWidget('保证子Widget宽度相同'),
          SubtitleWidget('让Row/Column中的子Widget保持同样的高度或宽度'),
          IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('One'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('TwoTwo'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('ThreeThreeThree'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
