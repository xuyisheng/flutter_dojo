import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ListTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('ListTile基本使用'),
        ListTile(
          title: Text('title'),
        ),
        MainTitleWidget('ListTile 配置'),
        ListTile(
          title: Text('title text with dense'),
          dense: true,
        ),
        ListTile(
          title: Text('title text without dense'),
          dense: false,
        ),
        ListTile(
          title: Text('title'),
          leading: Text('leading'),
        ),
        ListTile(
          title: Text('title'),
          leading: Icon(Icons.access_alarm),
        ),
        ListTile(
          title: Text('title'),
          leading: Text('leading'),
          trailing: Text('trailing'),
        ),
        ListTile(
          title: Text('title'),
          leading: Icon(Icons.access_alarm),
          trailing: Icon(Icons.account_balance),
        ),
        ListTile(
          title: Text('title'),
          leading: Text('leading'),
          trailing: Text('trailing'),
          isThreeLine: true,
          subtitle: Text('subtitle'),
        ),
        ListTile(
          title: Text('title'),
          leading: Icon(Icons.access_alarm),
          trailing: Icon(Icons.account_balance),
          isThreeLine: true,
          subtitle: Text('subtitle'),
        ),
      ],
    );
  }
}
