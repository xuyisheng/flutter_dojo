import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoSliderWidget extends StatefulWidget {
  @override
  _CupertinoSliderWidgetState createState() => _CupertinoSliderWidgetState();
}

class _CupertinoSliderWidgetState extends State<CupertinoSliderWidget> {
  double _value1 = 20;
  double _value2 = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Slider基本使用'),
        CupertinoSlider(
          value: _value1,
          min: 0,
          max: 100,
          onChanged: (double value) {
            setState(() => _value1 = value);
          },
        ),
        Text('Slider value ：${_value1.toStringAsFixed(1)}'),
        CupertinoSlider(
          value: _value2,
          divisions: 5,
          min: 0,
          max: 100,
          activeColor: Colors.green,
          onChanged: (double value) {
            setState(() {
              _value2 = value;
            });
          },
          onChangeStart: (v) {},
          onChangeEnd: (v) {},
        ),
        Text('Slider value ：${_value2.toString()}'),
      ],
    );
  }
}
