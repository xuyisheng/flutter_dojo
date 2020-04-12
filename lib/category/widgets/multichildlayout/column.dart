import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class ColumnWidget extends StatefulWidget {
  @override
  _ColumnWidgetState createState() => _ColumnWidgetState();
}

class _ColumnWidgetState extends State<ColumnWidget> {
  var mainAlignSelection = MainAxisAlignment.start;
  var crossAlignSelection = CrossAxisAlignment.start;
  var verticalDirectionSelection = VerticalDirection.down;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Column MainAxisAlignment'),
        MultiSelectionWidget(
          'MainAxisAlignment',
          MainAxisAlignment.values,
          MainAxisAlignment.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
          (value) {
            setState(() => mainAlignSelection = value);
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 300,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: mainAlignSelection,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('I  t  e  m  1'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item2'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('I t e m 3'),
                ),
              ],
            ),
          ),
        ),
        MainTitleWidget('Column CrossAxisAlignment'),
        MultiSelectionWidget(
          'CrossAxisAlignment',
          CrossAxisAlignment.values,
          CrossAxisAlignment.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
          (value) {
            setState(() => crossAlignSelection = value);
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.red,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: crossAlignSelection,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Container(
                  color: Colors.yellow,
                  width: 100,
                  height: 100,
                  child: Text('Item1'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item2'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item3'),
                ),
              ],
            ),
          ),
        ),
        MainTitleWidget('设置VerticalDirection'),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 200,
            color: Colors.red,
            child: Column(
              verticalDirection: verticalDirectionSelection,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item1'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item2'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item3'),
                ),
              ],
            ),
          ),
        ),
        MultiSelectionWidget(
          'VerticalDirection',
          VerticalDirection.values,
          VerticalDirection.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
          (value) {
            setState(() => verticalDirectionSelection = value);
          },
        ),
      ],
    );
  }
}
