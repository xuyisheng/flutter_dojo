import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoScrollbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('CupertinoScrollbar基本使用'),
        CupertinoScrollbar(
          child: Container(
            height: 400,
            child: ListView.custom(
              scrollDirection: Axis.vertical,
              childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(title: Text('list item $index'));
                },
                childCount: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
