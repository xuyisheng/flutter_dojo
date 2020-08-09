import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class BackdropFilterWidget extends StatefulWidget {
  @override
  _BackdropFilterWidgetState createState() => _BackdropFilterWidgetState();
}

class _BackdropFilterWidgetState extends State<BackdropFilterWidget> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('BackdropFilter基本使用'),
          ClipRect(
            child: Stack(
              children: <Widget>[
                Image.asset('assets/images/flower.jpg'),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: value,
                      sigmaY: value,
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                )
              ],
            ),
          ),
          MainTitleWidget('BackdropFilter自定义范围'),
          Stack(
            children: <Widget>[
              Image.asset('assets/images/flower.jpg'),
              Positioned(
                top: 50,
                left: 50,
                right: 50,
                bottom: 50,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: value,
                      sigmaY: value,
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ),
              )
            ],
          ),
          Text('Change blur value'),
          Slider(
              value: value,
              min: 0,
              max: 10,
              onChanged: (value) {
                setState(() => this.value = value);
              })
        ],
      ),
    );
  }
}
