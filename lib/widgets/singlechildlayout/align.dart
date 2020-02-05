import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/item_util.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/single_selection_item.dart';

class AlignWidget extends StatefulWidget {
  @override
  _AlignWidgetState createState() => _AlignWidgetState();
}

class _AlignWidgetState extends State<AlignWidget> {
  double xAlign = 0;
  double yAlign = 0;
  double widthFactor = 1;
  double heightFactor = 1;
  bool useSlider = false;

  var alignSelection = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Align value'),
          Container(
            margin: EdgeInsets.all(20),
            alignment: useSlider ? Alignment(xAlign, yAlign) : alignSelection,
            width: 200,
            height: 200,
            color: Colors.yellow,
            child: Text('Align'),
          ),
          Text('x'),
          Slider(
            min: -1,
            max: 1,
            value: xAlign,
            onChanged: (value) {
              useSlider = true;
              setState(() => xAlign = value);
            },
          ),
          Text('y'),
          Slider(
            min: -1,
            max: 1,
            value: yAlign,
            onChanged: (value) {
              useSlider = true;
              setState(() => yAlign = value);
            },
          ),
          MainTitleWidget('Align enum'),
          MultiSelectionWidget(
            'MainAxisAlignment',
            [
              Alignment.topLeft,
              Alignment.centerLeft,
              Alignment.center,
              Alignment.bottomRight,
              Alignment.bottomCenter,
              Alignment.bottomLeft,
              Alignment.centerRight,
              Alignment.topCenter,
              Alignment.topRight,
            ],
            [
              'topLeft',
              'centerLeft',
              'center',
              'bottomRight',
              'bottomCenter',
              'bottomLeft',
              'centerRight',
              'topCenter',
              'topRight',
            ],
            (value) {
              setState(() => alignSelection = value);
            },
          ),
          MainTitleWidget('Align with Factor'),
          Container(
            color: Colors.blue,
            child: Align(
              widthFactor: widthFactor,
              heightFactor: heightFactor,
              child: SizedItem(50),
            ),
          ),
          Slider(
            min: 0,
            max: 10,
            value: widthFactor,
            onChanged: (value) {
              setState(() => widthFactor = value);
            },
          ),
          Slider(
            min: 0,
            max: 10,
            value: heightFactor,
            onChanged: (value) {
              setState(() => heightFactor = value);
            },
          ),
        ],
      ),
    );
  }
}

const SelectionValue<Alignment> alignmentTopLeft = SelectionValue(Alignment.topLeft, 'topLeft', 'topLeft');
const SelectionValue<Alignment> alignmentTopCenter = SelectionValue(Alignment.topCenter, 'topCenter', 'topCenter');
const SelectionValue<Alignment> alignmentTopRight = SelectionValue(Alignment.topRight, 'topRight', 'topRight');
const SelectionValue<Alignment> alignmentBottomCenter =
    SelectionValue(Alignment.bottomCenter, 'bottomCenter', 'bottomCenter');
const SelectionValue<Alignment> alignmentBottomLeft = SelectionValue(Alignment.bottomLeft, 'bottomLeft', 'bottomLeft');
const SelectionValue<Alignment> alignmentBottomRight =
    SelectionValue(Alignment.bottomRight, 'bottomRight', 'bottomRight');
const SelectionValue<Alignment> alignmentCenter = SelectionValue(Alignment.center, 'center', 'center');
const SelectionValue<Alignment> alignmentCenterLeft = SelectionValue(Alignment.centerLeft, 'centerLeft', 'centerLeft');
const SelectionValue<Alignment> alignmentCenterRight =
    SelectionValue(Alignment.centerRight, 'centerRight', 'centerRight');
