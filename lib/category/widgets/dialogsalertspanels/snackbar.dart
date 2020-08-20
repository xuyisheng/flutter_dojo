import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class SnackBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('SnackBar基本使用'),
        SubtitleWidget('SnackBarAction: A button for a [SnackBar], known as an \"action\".'),
        RaisedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('basic snackbar'),
              backgroundColor: Colors.blue,
              duration: Duration(seconds: 3),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Text('Show Snackbar'),
        ),
        RaisedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: Text(
                'show snackBarAction in left',
              ),
              backgroundColor: Colors.blue,
              action: SnackBarAction(
                textColor: Colors.white,
                label: 'undo',
                onPressed: () {},
              ),
              duration: Duration(seconds: 3),
              //animation,
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Text('Show snackbar with action'),
        )
      ],
    );
  }
}
