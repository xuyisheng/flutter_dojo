import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/style/app_color.dart';

class CheckBoxWidget extends StatefulWidget {
  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('CheckBox 正常态 Null态'),
        Checkbox(
          value: true,
          onChanged: (v) {},
          tristate: true,
        ),
        Checkbox(
          value: null,
          tristate: true,
          onChanged: null,
        ),
        MainTitleWidget('Custom CheckBox'),
        Checkbox(
            activeColor: AppColor.randomColor(),
            tristate: false,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value;
              });
            })
      ],
    );
  }
}
