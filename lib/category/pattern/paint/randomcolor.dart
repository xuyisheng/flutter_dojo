import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class RandomColorWidget extends StatefulWidget {
  @override
  _RandomColorWidgetState createState() => _RandomColorWidgetState();
}

class _RandomColorWidgetState extends State<RandomColorWidget> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('通过预设的MaterialColor数组获取Color'),
          Container(
            width: 100,
            height: 100,
            color: Colors.teal[100 * (index % 9)],
          ),
          Slider(
            max: 10,
            min: 0,
            value: index.toDouble(),
            onChanged: (value) {
              setState(() => index = value.toInt());
            },
          ),
          MainTitleWidget('通过随机数获取随机Color'),
          Container(
            width: 100,
            height: 100,
            color: Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF)),
          ),
          RaisedButton(onPressed: () => setState(() {}), child: Text('Change Color')),
          Container(
            width: 100,
            height: 100,
            color: getRandomColor(),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.grey[100 + 100 * Random().nextInt(8)],
          ),
        ],
      ),
    );
  }
}

getRandomColor() => Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
