import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class VisibilityWidget extends StatefulWidget {
  @override
  _VisibilityWidgetState createState() => _VisibilityWidgetState();
}

class _VisibilityWidgetState extends State<VisibilityWidget> {
  bool flag1 = true;
  bool flag2 = true;
  bool flag3 = true;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('通过在Build函数中控制创建的Widget'),
          Builder(builder: (context) {
            if (flag1) {
              return Container(
                color: Colors.red,
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: Text(
                  'Flag1',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return Container(
                color: Colors.blue,
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: Text(
                  '!Flag1',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          }),
          Switch(
            value: flag1,
            onChanged: (value) {
              setState(() => flag1 = value);
            },
          ),
          MainTitleWidget('通过Offstage控制Widget是否展示'),
          Offstage(
            offstage: !flag2,
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              width: 100,
              height: 100,
              child: Text(
                'Flag2',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Switch(
            value: flag2,
            onChanged: (value) {
              setState(() => flag2 = value);
            },
          ),
          MainTitleWidget('通过Opacity控制Widget是否展示'),
          SubtitleWidget('Opacity的使用会耗费GPU资源，性能没有前面2种高'),
          Opacity(
            opacity: flag3 ? 1.0 : 0.0,
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              width: 100,
              height: 100,
              child: Text(
                'Flag3',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Switch(
            value: flag3,
            onChanged: (value) {
              setState(() => flag3 = value);
            },
          ),
          MainTitleWidget('通过IndexedStack实现'),
          IndexedStack(
            index: index,
            children: <Widget>[
              Icon(
                Icons.add,
                size: 40.0,
                color: Colors.red,
              ),
              Icon(
                Icons.ac_unit,
                size: 40.0,
                color: Colors.red,
              ),
            ],
          ),
          Switch(
            value: index == 0,
            onChanged: (value) {
              setState(() => index = value ? 0 : 1);
            },
          ),
        ],
      ),
    );
  }
}
