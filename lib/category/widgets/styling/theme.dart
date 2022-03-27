import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Theme基本用法'),
        SubtitleWidget('FloatingActionButton内部使用Theme的accentColor'),
        Theme(
          data: ThemeData(
            accentColor: Colors.red,
          ),
          child: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
          ),
        ),
        MainTitleWidget('使用Theme'),
        Container(
          color: Theme.of(context).accentColor,
          child: Text(
            '通过Theme.of(context)使用Theme',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        MainTitleWidget('拓展Theme'),
        Container(
          color: Theme.of(context).copyWith(accentColor: Colors.cyan).accentColor,
          child: Text(
            '通过Theme.of(context).copyWith拓展Theme',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        MainTitleWidget('通过Theme统一样式'),
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              minWidth: 48,
              height: 24,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          child: Row(
            children: <Widget>[
              FlatButton(
                color: Colors.red,
                onPressed: () {},
                child: Text('Theme1'),
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: () {},
                child: Text('Theme2'),
              )
            ],
          ),
        ),
        MainTitleWidget('CupertinoTheme'),
        SubtitleWidget('Applies a visual styling theme to descendant Cupertino widgets.'),
        CupertinoTheme(
          data: CupertinoThemeData(
            barBackgroundColor: CupertinoColors.activeGreen,
          ),
          child: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: Icon(Icons.arrow_back),
              middle: Text('CupertinoTheme'),
            ),
            child: Container(),
          ),
        ),
      ],
    );
  }
}
