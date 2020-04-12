import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/item_util.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class OpacityWidget extends StatefulWidget {
  @override
  _OpacityWidgetState createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget> {
  double slideValue = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Opacity基本使用'),
          Slider(
            value: slideValue,
            onChanged: (value) {
              setState(() => slideValue = value.toDouble());
            },
          ),
          Item(),
          Opacity(
            opacity: slideValue,
            child: Item(),
          ),
          Item(),
          MainTitleWidget('与其它Widget叠加'),
          Stack(
            children: <Widget>[
              Icon(
                Icons.print,
                size: 100,
              ),
              Opacity(
                opacity: slideValue,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          MainTitleWidget('Animated Opacity'),
          Stack(
            children: <Widget>[
              Icon(
                Icons.print,
                size: 100,
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: slideValue,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
