import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class RadioWidget extends StatefulWidget {
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  var selectValue = 1;

  onChange(value) {
    setState(() => selectValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Radio基本使用'),
        Radio(
          value: 1,
          groupValue: selectValue,
          onChanged: (value) => onChange(value),
        ),
        Radio(
          value: 2,
          groupValue: selectValue,
          onChanged: (value) => onChange(value),
        ),
        Radio(
          value: 3,
          groupValue: selectValue,
          onChanged: (value) => onChange(value),
        ),
      ],
    );
  }
}
