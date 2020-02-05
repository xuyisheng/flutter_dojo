import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('AlertDialog基本使用'),
        RaisedButton(
          onPressed: () {
            showAlertDialog(context);
          },
          child: Text('Show AlertDialog'),
        ),
        MainTitleWidget('修改Dialog界面'),
        SubtitleWidget('showDialog方法调用后，Context改变为新的Layer的Content，导致原有页面的setState失效'),
        SubtitleWidget('使用StatefulBuilder'),
        RaisedButton(
          onPressed: () {
            showDialogModify(context);
          },
          child: Text('Show Dialog'),
        ),
        SubtitleWidget('新建StatefulWidget作为Dialog的Content'),
        RaisedButton(
          onPressed: () {
            showModifyDialogWithNew(context);
          },
          child: Text('Show Dialog'),
        )
      ],
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('dialog title'),
          content: Text('dialog content'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showModifyDialogWithNew(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return NewDialogLayerWithState();
      },
    );
  }

  void showDialogModify(BuildContext context) {
    var show = 'Text';
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, dialogState) {
            return AlertDialog(
              title: Text('dialog title'),
              content: Text('dialog content'),
              actions: <Widget>[
                Text(show),
                FlatButton(
                  child: Text('Change1'),
                  onPressed: () {
                    dialogState(() {
                      show = 'Change1';
                    });
                  },
                ),
                FlatButton(
                  child: Text('Change2'),
                  onPressed: () {
                    dialogState(() {
                      show = 'Change2';
                    });
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class NewDialogLayerWithState extends StatefulWidget {
  final String label;

  NewDialogLayerWithState({Key key, this.label}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewDialogLayerWithStateState();
}

class NewDialogLayerWithStateState extends State<NewDialogLayerWithState> {
  var show = 'Text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 100,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(show),
              FlatButton(
                child: Text('Change1'),
                onPressed: () {
                  setState(() {
                    show = 'Change1';
                  });
                },
              ),
              FlatButton(
                child: Text('Change2'),
                onPressed: () {
                  setState(() {
                    show = 'Change2';
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
