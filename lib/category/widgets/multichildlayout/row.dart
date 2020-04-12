import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class RowWidget extends StatefulWidget {
  @override
  _RowWidgetState createState() => _RowWidgetState();
}

class _RowWidgetState extends State<RowWidget> {
  var sizeSelection = MainAxisSize.min;
  var mainAlignSelection = MainAxisAlignment.start;
  var crossAlignSelection = CrossAxisAlignment.start;
  var textDirectionSelection = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('设置主轴尺寸'),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.red,
            child: Row(
              mainAxisSize: sizeSelection,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('RowItem1'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('RowItem2'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('RowItem3'),
                ),
              ],
            ),
          ),
        ),
        MultiSelectionWidget(
          'MainAxisSize',
          MainAxisSize.values,
          MainAxisSize.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
          (value) {
            setState(() => sizeSelection = value);
          },
        ),
        MainTitleWidget('设置主轴对齐方式'),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.red,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: mainAlignSelection,
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
          'MainAxisAlignment',
          MainAxisAlignment.values,
          MainAxisAlignment.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
          (value) {
            setState(() {
              mainAlignSelection = value;
            });
          },
        ),
        MainTitleWidget('设置副轴对齐方式'),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.red,
            child: Row(
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
        MultiSelectionWidget(
          'CrossAxisAlignment',
          CrossAxisAlignment.values,
          CrossAxisAlignment.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
          (value) {
            setState(() {
              crossAlignSelection = value;
            });
          },
        ),
        MainTitleWidget('设置TextDirection'),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.red,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              textDirection: textDirectionSelection,
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
          'TextDirection',
          TextDirection.values,
          CrossAxisAlignment.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
          (value) {
            setState(() {
              textDirectionSelection = value;
            });
          },
        ),
      ],
    );
  }
}
