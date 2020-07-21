import 'package:flutter/material.dart';

class SafeAreaWidget extends StatefulWidget {
  @override
  _SafeAreaWidgetState createState() => _SafeAreaWidgetState();
}

class _SafeAreaWidgetState extends State<SafeAreaWidget> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: isEnabled,
        bottom: isEnabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: Text(
                '在全面屏、挖孔屏中进行适配，可以避开系统设置的notch区域',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () => setState(() => isEnabled == true ? isEnabled = false : isEnabled = true),
              child: Text(isEnabled ? 'Disable SafeArea' : 'Enable SafeArea'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Back'),
            ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: Text(
                'SafeArea可以分别设置底部和顶部是否需要启用',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
