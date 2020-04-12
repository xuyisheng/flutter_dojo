import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class GestureDetectorWidget extends StatefulWidget {
  @override
  _GestureDetectorWidgetState createState() => _GestureDetectorWidgetState();
}

class _GestureDetectorWidgetState extends State<GestureDetectorWidget> {
  var state = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MainTitleWidget('GestureDetector基本使用'),
        Expanded(child: Text(state)),
        GestureDetector(
          child: Container(
            width: 300,
            height: 300,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          onTap: () {
            debugPrint('onTap');
            setState(() => state = ('onTap'));
          },
          onTapDown: (TapDownDetails details) {
            debugPrint('onTapDown');
            setState(() => state = ('onTapDown '
                '${details.globalPosition.dx}'
                '${details.globalPosition.dy}'));
          },
          onTapUp: (TapUpDetails details) {
            debugPrint('onTapUp');
            setState(() => state = ('onTapUp'
                '${details.globalPosition.dx}'
                '${details.globalPosition.dy}'));
          },
          onTapCancel: () {
            debugPrint('onTapCancel');
            setState(() => state = ('onTapCancel'));
          },
          onVerticalDragDown: (DragDownDetails details) =>
              setState(() => state = ('onVerticalDragDown localPosition: ${details.localPosition}')),
          onVerticalDragStart: (DragStartDetails details) =>
              setState(() => state = ('onVerticalDragStart localPosition: ${details.localPosition}')),
          onVerticalDragUpdate: (DragUpdateDetails details) =>
              setState(() => state = ('onVerticalDragUpdate delta: ${details.delta.dx} - ${details.delta.dy}')),
          onVerticalDragEnd: (DragEndDetails details) => setState(() => state = ('onVerticalDragEnd')),
          onVerticalDragCancel: () => setState(() => state = ('onVerticalDragCancel')),
        ),
      ],
    );
  }
}
