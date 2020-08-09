import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Switch基本用法'),
        Switch(
          value: isCheck,
          onChanged: (value) {
            this.setState(() => isCheck = value);
          },
        ),
        Switch(
          value: false,
          onChanged: null,
        ),
        MainTitleWidget('Custom Switch'),
        Switch.adaptive(
          value: isCheck,
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() => isCheck = value);
          },
        ),
        Switch(
          value: isCheck,
          activeTrackColor: Colors.green,
          inactiveThumbColor: Colors.black,
          inactiveThumbImage: AssetImage('assets/images/align.png'),
          activeThumbImage: AssetImage('assets/images/baseline.png'),
          inactiveTrackColor: Colors.yellow,
          activeColor: Colors.blue,
          // 激活时原点颜色
          onChanged: (value) {
            this.setState(() {
              isCheck = value;
            });
          },
        ),
      ],
    );
  }
}
