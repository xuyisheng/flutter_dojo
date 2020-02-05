import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class CupertinoContextMenuWidget extends StatefulWidget {
  @override
  _CupertinoContextMenuWidgetState createState() => _CupertinoContextMenuWidgetState();
}

class _CupertinoContextMenuWidgetState extends State<CupertinoContextMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('CupertinoContextMenu基本使用'),
        SubtitleWidget('长按弹出ContextMenu'),
        Container(
          width: 100,
          height: 100,
          child: CupertinoContextMenu(
            child: Container(
              child: Image.asset('images/book.jpg'),
            ),
            actions: <Widget>[
              CupertinoContextMenuAction(
                child: const Text('Action one'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoContextMenuAction(
                child: const Text('Action two'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
