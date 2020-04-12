import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class SwitchListTileWidget extends StatefulWidget {
  @override
  _SwitchListTileWidgetState createState() => _SwitchListTileWidgetState();
}

class _SwitchListTileWidgetState extends State<SwitchListTileWidget> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('SwitchListTile基本用法'),
        SwitchListTile(
          title: Text('Title'),
          subtitle: Text('Subtitle'),
          secondary: Icon(Icons.print),
          value: isCheck,
          onChanged: (value) {
            setState(() => isCheck = value);
          },
        ),
      ],
    );
  }
}
