import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class MergeSemanticsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('MergeSemantics表示将子Widget的语义进行合并'),
        MergeSemantics(
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
