import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class KeyboardWidget extends StatefulWidget {
  @override
  _KeyboardWidgetState createState() => _KeyboardWidgetState();
}

class _KeyboardWidgetState extends State<KeyboardWidget> with WidgetsBindingObserver {
  var isShowUp = false;
  var focusNode = FocusNode();

  void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void showKeyboard(BuildContext context) {
    final focusScope = FocusScope.of(context);
    focusScope.requestFocus(FocusNode());
    Future.delayed(Duration.zero, () => focusScope.requestFocus(focusNode));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => isShowUp = window.viewInsets.bottom > 0);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return ListView(
      children: <Widget>[
        MainTitleWidget('软键盘'),
        TextField(focusNode: focusNode),
        RaisedButton(
          onPressed: () {
            dismissKeyboard(context);
          },
          child: Text('Close keyboard'),
        ),
        RaisedButton(
          onPressed: () {
            showKeyboard(context);
          },
          child: Text('Show keyboard'),
        ),
        MainTitleWidget('键盘是否弹起'),
        Text('是否弹起：$isShowUp'),
      ],
    );
  }
}
