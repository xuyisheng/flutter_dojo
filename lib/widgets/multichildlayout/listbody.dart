import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ListBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        MainTitleWidget('ListBody基本使用'),
        ListBody(
          mainAxis: Axis.vertical,
          reverse: false,
          children: List.generate(10, (index) {
            return Container(
              color: Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF)),
              width: 100,
              height: 100,
              child: Text(
                'Item in ListBody',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
