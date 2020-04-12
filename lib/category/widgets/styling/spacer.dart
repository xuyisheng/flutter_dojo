import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/item_util.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class SpacerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Spacer基本使用'),
        Expanded(
          child: Row(
            children: <Widget>[
              SizedItem(60),
              Spacer(
                flex: 1,
              ),
              SizedItem(60),
              Spacer(
                flex: 2,
              ),
              SizedItem(60),
            ],
          ),
        ),
      ],
    );
  }
}
