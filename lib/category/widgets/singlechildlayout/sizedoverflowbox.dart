import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class SizedOverflowBoxWidget extends StatefulWidget {
  @override
  _SizedOverflowBoxWidgetState createState() => _SizedOverflowBoxWidgetState();
}

class _SizedOverflowBoxWidgetState extends State<SizedOverflowBoxWidget> {
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('SizedOverflowBox基本使用'),
          Container(
            color: Colors.red,
            child: SizedOverflowBox(
              size: const Size(200, 200),
              alignment: AlignmentDirectional.bottomStart,
              child: Container(
                height: 50,
                width: 300,
                color: Colors.blue,
              ),
            ),
          ),
          SubtitleWidget('通过size属性对子组件进行偏移的同时还能超出父容器'),
          Container(
            alignment: Alignment.topLeft,
            color: Colors.grey.shade200,
            width: 200,
            height: 200,
            child: SizedOverflowBox(
              size: Size(x, y),
              child: Container(width: 50, height: 50, color: Colors.purple),
            ),
          ),
          Slider(
              divisions: 300,
              min: 0,
              max: 300,
              label: 'x:' + x.toStringAsFixed(0),
              value: x,
              onChanged: (v) => setState(() => x = v)),
          Slider(
              divisions: 300,
              min: 0,
              max: 300,
              label: 'y:' + y.toStringAsFixed(0),
              value: y,
              onChanged: (v) => setState(() => y = v)),
        ],
      ),
    );
  }
}
