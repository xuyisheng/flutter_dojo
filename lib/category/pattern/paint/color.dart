import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ColorWidget extends StatefulWidget {
  @override
  _ColorWidgetState createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  @override
  Widget build(BuildContext context) {
    var color = Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Color Luminance'),
          Container(
            color: color,
            padding: EdgeInsets.all(16),
            child: Text(
              'Luminance',
              style: TextStyle(
                fontSize: 30,
                color: color.computeLuminance() > 0.5 ? Colors.white : Colors.black,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {});
            },
            child: Text('change color luminance'),
          ),
          MainTitleWidget('MaterialColor'),
          for (int i = 0; i < 10; i++) ...[
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.blue[100 * i],
            )
          ],
        ],
      ),
    );
  }
}
