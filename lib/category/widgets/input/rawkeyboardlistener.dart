import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class RawKeyboardListenerWidget extends StatefulWidget {
  @override
  _RawKeyboardListenerWidgetState createState() => _RawKeyboardListenerWidgetState();
}

class _RawKeyboardListenerWidgetState extends State<RawKeyboardListenerWidget> {
  var text = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) {
          print('${event.runtimeType.toString()}');
          if (event.runtimeType.toString() == 'RawKeyDownEvent' && event.data is RawKeyEventDataAndroid) {
            RawKeyEventDataAndroid data = event.data;
            print('_keyCode: ${data.keyCode}');
            setState(() => text = data.keyCode.toString());
            return true;
          }
          return false;
        },
        child: Column(
          children: <Widget>[
            MainTitleWidget('RawKeyboardListener基本使用'),
            SubtitleWidget('仅适用于Raw Key'),
            TextField(),
            Text('keyCode $text'),
          ],
        ),
      ),
    );
  }
}
