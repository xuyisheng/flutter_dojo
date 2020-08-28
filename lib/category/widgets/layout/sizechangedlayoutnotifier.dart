import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class SizeChangedLayoutNotifierWidget extends StatefulWidget {
  @override
  _SizeChangedLayoutNotifierWidgetState createState() => _SizeChangedLayoutNotifierWidgetState();
}

class _SizeChangedLayoutNotifierWidgetState extends State<SizeChangedLayoutNotifierWidget> {
  var size = 200.0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (notification) {
        print('${notification.runtimeType}');
        return false;
      },
      child: SizeChangedLayoutNotifier(
        child: Column(
          children: [
            MainTitleWidget('SizeChangedLayoutNotifier基本使用'),
            GestureDetector(
              onTap: () {
                setState(() => size = Random().nextInt(300).toDouble());
              },
              child: AnimatedContainer(
                width: size,
                height: size,
                color: Colors.blueAccent,
                duration: Duration(seconds: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
