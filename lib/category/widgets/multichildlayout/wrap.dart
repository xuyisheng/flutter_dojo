import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/item_util.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class WrapWidget extends StatefulWidget {
  @override
  _WrapWidgetState createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  var axisSelection = Axis.horizontal;
  var spacingSelection = 10.0;
  var runSpacingSelection = 10.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Wrap基本用法'),
        MultiSelectionWidget(
          'Axis',
          Axis.values,
          Axis.values,
          (value) {
            setState(() => axisSelection = value);
          },
        ),
        MultiSelectionWidget(
          'spacing 主轴间距',
          [10.0, 15.0, 20.0, 25.0],
          [10, 15, 20, 25],
          (value) {
            setState(() => spacingSelection = value);
          },
        ),
        MultiSelectionWidget(
          'runSpacing 副轴间距',
          [10.0, 15.0, 20.0, 25.0],
          [10, 15, 20, 25],
          (value) {
            setState(() => runSpacingSelection = value);
          },
        ),
        Container(
          color: Colors.red,
          height: 400,
          child: Wrap(
            direction: axisSelection,
            spacing: spacingSelection,
            runSpacing: runSpacingSelection,
            children: <Widget>[
              RandomWidthItem(),
              RandomWidthItem(),
              RandomWidthItem(),
              RandomWidthItem(),
              RandomWidthItem(),
              RandomWidthItem(),
              RandomWidthItem(),
              RandomWidthItem(),
              RandomWidthItem(),
            ],
          ),
        ),
      ],
    );
  }
}
