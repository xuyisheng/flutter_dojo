import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class FittedBoxWidget extends StatefulWidget {
  @override
  _FittedBoxWidgetState createState() => _FittedBoxWidgetState();
}

class _FittedBoxWidgetState extends State<FittedBoxWidget> {
  var boxFitSelection = BoxFit.none;
  var alignSelection = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('设置Child的Scale和Position'),
        SubtitleWidget('负责将Child在Parent组件中的位置和大小进行调整'),
        MultiSelectionWidget(
          'BoxFit',
          BoxFit.values,
          BoxFit.values,
          (value) {
            setState(() => boxFitSelection = value);
          },
        ),
        MultiSelectionWidget(
          'Alignment',
          [
            Alignment.bottomLeft,
            Alignment.center,
            Alignment.centerLeft,
            Alignment.bottomRight,
            Alignment.bottomCenter,
            Alignment.centerRight,
            Alignment.topCenter,
            Alignment.topLeft,
            Alignment.topRight,
          ],
          [
            'bottomLeft',
            'center',
            'centerLeft',
            'bottomRight',
            'bottomCenter',
            'centerRight',
            'topCenter',
            'topLeft',
            'topRight',
          ],
          (value) {
            setState(() => alignSelection = value);
          },
        ),
        Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            constraints: BoxConstraints(maxWidth: 200),
            margin: const EdgeInsets.all(10),
            child: FittedBox(
              fit: boxFitSelection,
              alignment: alignSelection,
              child: Container(
                color: Colors.red,
                child: Text(
                  'FittedBox',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
