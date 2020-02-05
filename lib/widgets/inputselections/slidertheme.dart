import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class SliderThemeWidget extends StatefulWidget {
  @override
  _SliderThemeWidgetState createState() => _SliderThemeWidgetState();
}

class _SliderThemeWidgetState extends State<SliderThemeWidget> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('SliderTheme基本用法'),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
//                activeTickMarkColor:Colors.yellowAccent,
            activeTrackColor: Colors.yellowAccent,
            //实际进度的颜色
//                inactiveTickMarkColor:Colors.black
            thumbColor: Colors.black,
            //滑块中心的颜色
            inactiveTrackColor: Colors.red,
            //默 认进度条的颜色
            valueIndicatorColor: Colors.blue,
            //提示进度的气派的背景色
            valueIndicatorTextStyle: TextStyle(
              //提示气泡里面文字的样式
              color: Colors.white,
            ),
            inactiveTickMarkColor: Colors.blue,
            //divisions对进度线分割后 断续线中间间隔的颜色
            overlayColor: Colors.pink, //滑块边缘颜色
          ),
          child: Container(
            width: 340.0,
            margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Text('0.0'),
                Expanded(
                  flex: 1,
                  child: Slider(
                    value: value,
                    label: '$value',
                    divisions: 10,
                    onChanged: (v) {
                      setState(() {
                        value = v.floorToDouble();
                      });
                    },
                    min: 0.0,
                    max: 100.0,
                  ),
                ),
                Text('100.0'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
