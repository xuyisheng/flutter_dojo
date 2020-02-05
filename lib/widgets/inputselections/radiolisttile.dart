import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class RadioListTileWidget extends StatefulWidget {
  @override
  _RadioListTileWidgetState createState() => _RadioListTileWidgetState();
}

class _RadioListTileWidgetState extends State<RadioListTileWidget> {
  var selectValue = 1;

  onChange(value) {
    setState(() => selectValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('RadioListTile基本使用'),
        RadioListTile(
          title: Text('Title1'),
          subtitle: Text('Subtitle1'),
          value: 1,
          groupValue: selectValue,
          onChanged: (value) => onChange(value),
        ),
        RadioListTile(
          title: Text('Title2'),
          subtitle: Text('Subtitle2'),
          value: 2,
          groupValue: selectValue,
          onChanged: (value) => onChange(value),
        ),
        RadioListTile(
          title: Text('Title3'),
          subtitle: Text('Subtitle3'),
          value: 3,
          groupValue: selectValue,
          onChanged: (value) => onChange(value),
        ),
      ],
    );
  }
}
