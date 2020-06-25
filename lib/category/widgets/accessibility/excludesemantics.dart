import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ExcludeSemanticsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('ExcludeSemantics表示清除当前Widget的语义'),
        SubtitleWidget('例如某些组件不包含实际意义，为了简化，所以去掉语义'),
        ExcludeSemantics(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blueAccent,
            child: Text('包含语义'),
          ),
        )
      ],
    );
  }
}
