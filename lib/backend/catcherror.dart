import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CatchErrorWidget extends StatefulWidget {
  @override
  _CatchErrorWidgetState createState() => _CatchErrorWidgetState();
}

class _CatchErrorWidgetState extends State<CatchErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Catch error'),
        RaisedButton(
          onPressed: () {
            throw Exception();
          },
          child: Text('Throw exception'),
        )
      ],
    );
  }
}
