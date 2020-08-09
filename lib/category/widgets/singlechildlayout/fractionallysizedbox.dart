import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class FractionallySizedBoxWidget extends StatefulWidget {
  @override
  _FractionallySizedBoxWidgetState createState() => _FractionallySizedBoxWidgetState();
}

class _FractionallySizedBoxWidgetState extends State<FractionallySizedBoxWidget> {
  double widthFactor = 0.5;
  double heightFactor = 0.5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('FractionallySizedBox基本使用'),
          SubtitleWidget('FractionallySizedBox控件会根据Parent大小来调整Child的尺寸，隐藏Child的尺寸数值将不起作用。'),
          SubtitleWidget('当设置widthFactor或heightFactor，Child的宽高会使用Parnet宽高 * Factor，当Factor大于1的时候Child会超出Parent范围'),
          Text('widthFactor 0-2'),
          Slider(
              value: widthFactor,
              min: 0,
              max: 2,
              onChanged: (v) {
                setState(() => widthFactor = v);
              }),
          Text('heightFactor 0-2'),
          Slider(
              value: heightFactor,
              min: 0,
              max: 2,
              onChanged: (v) {
                setState(() => heightFactor = v);
              }),
          Container(
            color: Colors.orange,
            height: 100,
            width: 100,
            child: FractionallySizedBox(
              alignment: Alignment.topLeft,
              widthFactor: widthFactor,
              heightFactor: heightFactor,
              child: Container(color: Colors.red),
            ),
          ),
          SizedBox(height: 100),
          SubtitleWidget(
              'widthFactor: ${widthFactor.toStringAsFixed(2)}, heightFactor: ${heightFactor.toStringAsFixed(2)}'),
          MainTitleWidget('FractionallySizedBox 百分百布局'),
          SubtitleWidget('size the child to a fraction of the total available space'),
          FractionallySizedBox(
            widthFactor: 1,
            child: RaisedButton(
              onPressed: () {},
              child: Text('100% Text'),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.7,
            child: RaisedButton(
              onPressed: () {},
              child: Text('70% Text'),
            ),
          )
        ],
      ),
    );
  }
}
