import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class FractionalTranslationWidget extends StatefulWidget {
  @override
  _FractionalTranslationWidgetState createState() => _FractionalTranslationWidgetState();
}

class _FractionalTranslationWidgetState extends State<FractionalTranslationWidget> {
  double valueSelection = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('FractionalTranslation基本使用'),
        SubtitleWidget('在绘制Child之前，修改offset'),
        Slider(
            min: 0,
            max: 1,
            value: valueSelection,
            onChanged: (value) {
              setState(() => valueSelection = value);
            }),
        Container(
          color: Colors.red,
          child: FractionalTranslation(
            translation: Offset(valueSelection, valueSelection),
            transformHitTests: true,
            child: Image.asset('images/logo.png'),
          ),
        ),
      ],
    );
  }
}
