import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double value = 0;
  var rangeValues = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Slider基本用法'),
        Slider(
          value: value,
          min: 0,
          max: 100,
          onChanged: (v) {
            setState(() => value = v.roundToDouble());
          },
        ),
        MainTitleWidget('Slider adaptive'),
        SubtitleWidget('根据平台的不同产生不同风格的Slider'),
        Slider.adaptive(
          value: value,
          min: 0,
          max: 100,
          onChanged: (v) {
            setState(() => value = v.roundToDouble());
          },
        ),
        MainTitleWidget('Custom Slider with divisions'),
        Slider(
          value: value,
          inactiveColor: Colors.yellow,
          label: 'Now : $value',
          min: 0.0,
          max: 100.0,
          divisions: 10,
          activeColor: Colors.black,
          //进度中活动部分的颜色
          onChanged: (v) {
            setState(() => value = v.roundToDouble());
          },
        ),
        MainTitleWidget('RangeSlider'),
        RangeSlider(
          activeColor: Colors.blue,
          inactiveColor: Colors.red,
          divisions: 100,
          values: rangeValues,
          min: 0.0,
          max: 100.0,
          onChanged: (RangeValues values) {
            setState(() {
              rangeValues = values;
            });
          },
          labels: RangeLabels(
            '${rangeValues.start.round()}',
            '${rangeValues.end.round()}',
          ),
        ),
        RangeSlider(
          values: RangeValues(0.3, 0.7),
          onChanged: null,
        ),
      ],
    );
  }
}
