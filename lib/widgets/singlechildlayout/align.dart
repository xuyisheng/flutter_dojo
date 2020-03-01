import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/item_util.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

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
          MainTitleWidget('FractionalOffset'),
          SubtitleWidget('FractionalOffset通过坐标来控制偏移,继承自Alignment'),
          Container(
            height: 200,
            width: 200,
            color: Colors.yellow,
            child: Align(
              alignment: FractionalOffset(0.2, 0.8),
              child: FlutterLogo(size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
