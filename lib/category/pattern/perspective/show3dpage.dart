import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class Show3DPageWidget extends StatefulWidget {
  @override
  _Show3DPageWidgetState createState() => _Show3DPageWidgetState();
}

class _Show3DPageWidgetState extends State<Show3DPageWidget> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Gesture配合Transform实现透视效果'),
        Expanded(
          child: Transform(
            // a factor of 0.01 to make it better to use for rotation
            // (which is in radians, where a complete rotation is
            // 2π — approximately 6.28 — so a complete rotation requires
            // a pan movement of 628 pixels).
            // You can play with the scale factor to make the
            // rotation more or less sensitive to finger movement.
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(0.01 * _offset.dy)
              ..rotateY(-0.01 * _offset.dx),
            alignment: FractionalOffset.center,
            child: GestureDetector(
              onPanUpdate: (details) => setState(() => _offset += details.delta),
              onDoubleTap: () => setState(() => _offset = Offset.zero),
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Title'),
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
