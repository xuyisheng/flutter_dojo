import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class OverflowBoxWidget extends StatefulWidget {
  @override
  _OverflowBoxWidgetState createState() => _OverflowBoxWidgetState();
}

class _OverflowBoxWidgetState extends State<OverflowBoxWidget> {
  var input = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('OverflowBox基本使用'),
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Align(
              alignment: const Alignment(1, 1),
              child: SizedBox(
                width: 10,
                height: 20,
                child: OverflowBox(
                  minWidth: 0,
                  maxWidth: 100,
                  minHeight: 0,
                  maxHeight: 50,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: 150,
            height: 150,
            color: Colors.deepPurpleAccent,
            child: OverflowBox(
              alignment: Alignment.center,
              minHeight: 50,
              minWidth: 50,
              maxWidth: 200,
              maxHeight: 120,
              child: Container(
                color: Colors.orange,
                child: Text(input),
              ),
            ),
          ),
          SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '输入文字可超过父容器',
            ),
            onChanged: (v) => setState(
              () {
                input = v;
              },
            ),
          ),
        ],
      ),
    );
  }
}
