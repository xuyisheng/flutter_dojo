import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class StackWidget extends StatefulWidget {
  @override
  _StackWidgetState createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  var alignment = Alignment.topLeft;
  var fit = StackFit.expand;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Stack基本使用'),
        Container(
          width: double.infinity,
          color: Colors.yellow,
          height: 300,
          child: Stack(
            alignment: alignment,
            children: [
              Container(
                color: Colors.cyan,
                width: 200,
                height: 200,
              ),
              Container(
                color: Colors.red,
                width: 150,
                height: 150,
              ),
              Container(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        MultiSelectionWidget(
          'Alignment',
          [
            Alignment.topLeft,
            Alignment.centerLeft,
            Alignment.center,
            Alignment.bottomRight,
            Alignment.bottomCenter,
            Alignment.bottomLeft,
            Alignment.centerRight,
            Alignment.topCenter,
            Alignment.topRight,
          ],
          [
            'topLeft',
            'centerLeft',
            'center',
            'bottomRight',
            'bottomCenter',
            'bottomLeft',
            'centerRight',
            'topCenter',
            'topRight',
          ],
          (value) {
            setState(() => alignment = value);
          },
        ),
        MainTitleWidget('Stack fit'),
        SubtitleWidget('fit用于确定没有定位的子组件如何去适应Stack的大小'),
        SubtitleWidget('StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小'),
        MultiSelectionWidget(
          'Fit',
          StackFit.values,
          StackFit.values,
          (value) {
            setState(() => fit = value);
          },
        ),
        Container(
          width: double.infinity,
          color: Colors.yellow,
          height: 300,
          child: Stack(
            fit: fit,
            overflow: Overflow.clip,
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.blue,
                width: 100,
                height: 50,
              ),
              Text(
                "show stack demo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
