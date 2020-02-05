import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              children: <Widget>[
                MainTitleWidget('SingleChildScrollView基本使用'),
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
      },
    );
  }
}
