import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoActionSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('ActionSheet基本使用'),
        RaisedButton(
          onPressed: () => showActionSheet(context),
          child: Text('Show ActionSheet'),
        ),
      ],
    );
  }

  Future<void> showActionSheet(BuildContext context) async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('ActionSheet'),
          message: Text('ActionSheet message'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('ActionSheet Item1'),
              onPressed: () {},
            ),
            CupertinoActionSheetAction(
              child: Text('ActionSheet Item2'),
              onPressed: () {},
            ),
            CupertinoActionSheetAction(
              child: Text('ActionSheet Item3'),
              onPressed: () {},
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text('Cancel'),
            onPressed: () {},
          ),
        );
      },
    );
  }
}
