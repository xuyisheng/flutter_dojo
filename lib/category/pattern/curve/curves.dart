import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CurvesWidget extends StatefulWidget {
  @override
  _CurvesWidgetState createState() => _CurvesWidgetState();
}

class _CurvesWidgetState extends State<CurvesWidget> {
  var padding = 0.0;
  var curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Curve'),
        setCurve(Curves.linear),
        setCurve(Curves.easeInCirc),
        setCurve(SinCurve()),
        setCurve(SawTooth(3)),
        RaisedButton(
          onPressed: () {
            setState(() => padding = padding == 0 ? 200 : 0.0);
          },
          child: Text('Start'),
        ),
      ],
    );
  }

  Widget setCurve(Curve curve) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: AnimatedPadding(
          padding: EdgeInsets.only(left: padding),
          duration: Duration(seconds: 3),
          curve: curve,
          child: Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class SinCurve extends Curve {
  @override
  double transformInternal(double t) {
    return sin(3 * 2 * pi * t) * 0.5 + 0.5;
  }
}
