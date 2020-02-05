import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class AnimatedThemeWidget extends StatefulWidget {
  @override
  _AnimatedThemeWidgetState createState() => _AnimatedThemeWidgetState();
}

class _AnimatedThemeWidgetState extends State<AnimatedThemeWidget> {
  var isLight = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('AnimatedTheme基本使用'),
        AnimatedTheme(
          data: isLight ? ThemeData.light() : ThemeData.dark(),
          duration: const Duration(seconds: 1),
          child: Card(
            child: const Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                'Xys Flutter',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        RaisedButton(
          onPressed: () {
            setState(() => isLight = !isLight);
          },
          child: Text('Change theme'),
        ),
      ],
    );
  }
}
