import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoAlertDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('AlertDialog基本使用'),
        CupertinoButton(
          color: Colors.blue,
          pressedOpacity: 0.6,
          child: Text('Show AlertDialog'),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: Text('Title'),
                  content: Text('Content'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('OK'),
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text('Cancel'),
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
