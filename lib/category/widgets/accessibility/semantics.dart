import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class SemanticsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Semantics表示了在无障碍模式下的语义'),
        Semantics(
          label: '包含语义',
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blueAccent,
            child: Text('包含语义'),
          ),
        ),
      ],
    );
  }
}
