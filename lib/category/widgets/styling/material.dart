import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class MaterialWidget extends StatefulWidget {
  @override
  _MaterialWidgetState createState() => _MaterialWidgetState();
}

class _MaterialWidgetState extends State<MaterialWidget> {
  double _value = 0.0;

  void _change(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Material中使用图形'),
          Material(
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(color: Colors.black, width: 4),
            ),
            color: Colors.yellow,
            child: Container(
              height: 200,
              width: 200,
            ),
          ),
          SizedBox(height: 40.0),
          SubtitleWidget('调整图形形状'),
          Material(
            color: Colors.redAccent,
            shape: BeveledRectangleBorder(
              side: const BorderSide(
                width: 1.0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(_value),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Text in Material',
                style: Theme.of(context).textTheme.display2,
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Slider(
            value: _value,
            min: 0.0,
            max: 300.0,
            onChanged: (value) {
              _change(value);
            },
          ),
          SubtitleWidget('通过Type属性设置形状'),
          Material(
            type: MaterialType.circle,
            color: Colors.green,
            child: Container(
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
