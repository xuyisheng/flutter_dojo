import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CheckBoxListTileWidget extends StatefulWidget {
  @override
  _CheckBoxListTileWidgetState createState() => _CheckBoxListTileWidgetState();
}

class _CheckBoxListTileWidgetState extends State<CheckBoxListTileWidget> {
  bool isCheck = false;
  bool isCheckAll = false;
  List<bool> isCheckList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('CheckboxListTile'),
        CheckboxListTile(
          title: Text('CheckboxListTile Title'),
          activeColor: Colors.red,
          value: isCheck,
          onChanged: (value) {
            setState(() => isCheck = value);
          },
          secondary: const Icon(Icons.edit),
        ),
        MainTitleWidget('CheckboxListTile Check All'),
        CheckboxListTile(
          title: Text('Check all?'),
          activeColor: Colors.red,
          value: isCheckAll,
          onChanged: (value) {
            setState(() {
              isCheckList = [value, value, value];
              return isCheckAll = value;
            });
          },
          secondary: const Icon(Icons.edit),
        ),
        CheckboxListTile(
          title: Text('CheckboxListTile 1'),
          activeColor: Colors.red,
          value: isCheckList[0],
          onChanged: (value) {
            setState(() => isCheckList[0] = value);
          },
          secondary: const Icon(Icons.edit),
        ),
        CheckboxListTile(
          title: Text('CheckboxListTile 2'),
          activeColor: Colors.red,
          value: isCheckList[1],
          onChanged: (value) {
            setState(() => isCheckList[1] = value);
          },
          secondary: const Icon(Icons.edit),
        ),
        CheckboxListTile(
          title: Text('CheckboxListTile 3'),
          activeColor: Colors.red,
          value: isCheckList[2],
          onChanged: (value) {
            setState(() => isCheckList[2] = value);
          },
          secondary: const Icon(Icons.edit),
        ),
      ],
    );
  }
}
