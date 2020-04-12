import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('AlertDialog基本使用'),
        SubtitleWidget('通过showDialog方法调用'),
        RaisedButton(
          onPressed: () {
            showAlertDialog(context);
          },
          child: Text('Show AlertDialog'),
        ),
        SubtitleWidget('通过showGeneralDialog方法调用，无MaterialDesign风格'),
        RaisedButton(
          onPressed: () {
            showCustomDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Dialog Title"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Show Custom AlertDialog'),
        ),
        MainTitleWidget('修改Dialog宽度'),
        SubtitleWidget('showDialog方法中给对话框设置了宽度限制，所以需要先使用UnconstrainedBox取消该限制'),
        RaisedButton(
          onPressed: () {
            showCustomWidthDialog(context);
          },
          child: Text('Show Custom Width Dialog'),
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
        SubtitleWidget('或者将需要改变的Widget单独抽取出来'),
        RaisedButton(
          onPressed: () {
            showModifyDialogWithNew(context);
          },
          child: Text('Show Dialog'),
        ),
        SubtitleWidget('使用Element的markNeedsBuild标记'),
        RaisedButton(
          onPressed: () {
            showDialogModify2(context);
          },
          child: Text('Show Dialog'),
        ),
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

  void showCustomWidthDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 200,
            child: AlertDialog(
              content: Text("Custom Width"),
            ),
          ),
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

  void showDialogModify2(BuildContext context) {
    var show = 'Text';
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('dialog title'),
          content: Text('dialog content'),
          actions: <Widget>[
            Text(show),
            FlatButton(
              child: Text('Change1'),
              onPressed: () {
                show = 'Change1';
                (context as Element).markNeedsBuild();
              },
            ),
            FlatButton(
              child: Text('Change2'),
              onPressed: () {
                show = 'Change2';
                (context as Element).markNeedsBuild();
              },
            ),
          ],
        );
      },
    );
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (
        BuildContext buildContext,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null ? Theme(data: theme, child: pageChild) : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.blueAccent.withAlpha(100),
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),
          child: child,
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
