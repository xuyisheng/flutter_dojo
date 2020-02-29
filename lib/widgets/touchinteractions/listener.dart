import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ListenerWidget extends StatefulWidget {
  @override
  _ListenerWidgetState createState() => _ListenerWidgetState();
}

class _ListenerWidgetState extends State<ListenerWidget> {
  var state = '';
  var toggle = true;
  var selection = HitTestBehavior.deferToChild;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MainTitleWidget('Listener基本使用'),
        SubtitleWidget('默认情况下，透明区域不响应点击操作'),
        SubtitleWidget('默认为deferToChild，子Widget会依次进行命中测试'),
        SubtitleWidget('opaque，在命中测试时，将当前组件当成不透明处理(即使本身是透明的)，相当于当前Widget的整个区域都是点击区域'),
        SubtitleWidget('translucent，即使透明区域也会响应点击操作'),
        Row(
          children: <Widget>[
            Text('Show Container Background Color'),
            Switch(value: toggle, onChanged: (value) => setState(() => toggle = value)),
          ],
        ),
        MultiSelectionWidget(
          'behavior',
          HitTestBehavior.values,
          HitTestBehavior.values,
          (value) {
            setState(() => selection = value);
          },
        ),
        Expanded(child: Text(state)),
        Listener(
          child: Container(
            width: 300,
            height: 300,
            color: toggle ? Colors.blue : null,
            alignment: Alignment.center,
            child: Text('命中测试'),
          ),
          behavior: selection,
          onPointerDown: (pos) => setState(() => state = ('onPointerDown')),
          onPointerMove: (pos) => setState(() => state = ('onPointerMove')),
          onPointerUp: (pos) => setState(() => state = ('onPointerUp')),
          onPointerCancel: (pos) => setState(() => state = ('onPointerCancel')),
        ),
      ],
    );
  }
}
