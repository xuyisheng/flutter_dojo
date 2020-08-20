import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RawGestureDetectorWidget extends StatefulWidget {
  @override
  _RawGestureDetectorWidgetState createState() => _RawGestureDetectorWidgetState();
}

class _RawGestureDetectorWidgetState extends State<RawGestureDetectorWidget> {
  String str = '';

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        TapGestureRecognizer: GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
          () => TapGestureRecognizer(),
          (TapGestureRecognizer instance) {
            instance
              ..onTapDown = (TapDownDetails details) {
                setState(() => str = 'down');
              }
              ..onTapUp = (TapUpDetails details) {
                setState(() => str = 'up');
              }
              ..onTap = () {
                setState(() => str = 'tap');
              }
              ..onTapCancel = () {
                setState(() => str = 'cancel');
              };
          },
        ),
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: Text(str),
      ),
    );
  }
}
