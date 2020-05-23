import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class CheckBoxListTileWidget extends StatefulWidget {
  @override
  _CheckBoxListTileWidgetState createState() => _CheckBoxListTileWidgetState();
}

class _CheckBoxListTileWidgetState extends State<CheckBoxListTileWidget> {
  bool isCheck = false;
  bool isCheckAll = false;
  ListTileControlAffinity affinity = ListTileControlAffinity.leading;
  List<bool> isCheckList = [false, false, false, false];

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
          activeColor: Colors.black,
          value: isCheckAll,
          onChanged: (value) {
            setState(() {
              isCheckList = [value, value, value, value];
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
          activeColor: Colors.blueAccent,
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
        CheckboxListTile(
          title: Text('CheckboxListTile 4'),
          value: isCheckList[3],
          onChanged: (value) {
            setState(() => isCheckList[3] = value);
          },
          controlAffinity: affinity,
        ),
        SubtitleWidget('控制CheckBox位置'),
        MultiSelectionWidget(
          'ControlAffinity',
          ListTileControlAffinity.values,
          ListTileControlAffinity.values,
          (value) {
            setState(() => affinity = value);
          },
        ),
      ],
    );
  }
}
