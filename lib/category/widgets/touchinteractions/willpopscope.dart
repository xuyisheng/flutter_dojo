import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class WillPopScopeWidget extends StatefulWidget {
  @override
  _WillPopScopeWidgetState createState() => _WillPopScopeWidgetState();
}

class _WillPopScopeWidgetState extends State<WillPopScopeWidget> {
  int last = 0;
  bool flag = true;

  Future<bool> _onWillPopDialog() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<bool> _onWillPopClick() {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - last > 1000) {
      last = DateTime.now().millisecondsSinceEpoch;
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: flag ? _onWillPopDialog : _onWillPopClick,
      child: Column(
        children: <Widget>[
          MainTitleWidget('WillPopScope基本使用'),
          Center(
            child: Column(
              children: <Widget>[
                Text('使用弹窗？'),
                Switch(
                  value: flag,
                  onChanged: (v) {
                    setState(() => flag = v);
                  },
                ),
                Text('监听Back键'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
