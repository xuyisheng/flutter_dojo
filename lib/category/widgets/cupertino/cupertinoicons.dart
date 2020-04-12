import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoIconsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('CupertinoIcons基本用法'),
        Icon(CupertinoIcons.phone),
        Icon(CupertinoIcons.add_circled),
        Icon(CupertinoIcons.clear),
        Icon(CupertinoIcons.delete_simple),
        Icon(CupertinoIcons.music_note),
        Icon(CupertinoIcons.shuffle_thick),
        Icon(CupertinoIcons.refresh_bold),
        Icon(CupertinoIcons.battery_25_percent),
      ],
    );
  }
}
