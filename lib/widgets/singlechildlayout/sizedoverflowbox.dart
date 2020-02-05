import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class SizedOverflowBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('SizedOverflowBox基本使用'),
        Container(
          color: Colors.red,
          child: SizedOverflowBox(
            size: const Size(100, 100),
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              height: 50,
              width: 150,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
