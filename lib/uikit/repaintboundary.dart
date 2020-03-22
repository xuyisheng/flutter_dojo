import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class RepaintBoundaryWidget extends StatefulWidget {
  @override
  _RepaintBoundaryWidgetState createState() => _RepaintBoundaryWidgetState();
}

class _RepaintBoundaryWidgetState extends State<RepaintBoundaryWidget> {
  GlobalKey _paintKey = GlobalKey();
  Offset _offset;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    var child = CustomPaint(
      painter: ExpensivePainter(),
      isComplex: true,
      willChange: false,
    );
    return Column(
      children: <Widget>[
        MainTitleWidget('通过RepaintBoundary提高绘制性能'),
        SubtitleWidget(
            '类似SingleChildScrollView，每次滑动都会paintChild，只要child.isRepaintBoundary为false，那么就会执行，通过RepaintBoundary，可以将需要重绘与不需要重绘的图层进行分离，从而提高性能'),
        Row(
          children: <Widget>[
            Text('Add RepaintBoundary'),
            Switch(
              value: flag,
              onChanged: (value) {
                setState(() => flag = value);
              },
            ),
          ],
        ),
        SizedBox(height: 30),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              flag ? RepaintBoundary(child: child) : Container(child: child),
              Listener(
                onPointerDown: _updateOffset,
                onPointerMove: _updateOffset,
                child: CustomPaint(
                  key: _paintKey,
                  painter: MyCustomPainter(_offset),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _updateOffset(PointerEvent event) {
    RenderBox referenceBox = _paintKey.currentContext.findRenderObject();
    Offset offset = referenceBox.globalToLocal(event.position);
    setState(() => _offset = offset);
  }
}

class ExpensivePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    debugPrint('is painting');
    Random rand = Random(12345);
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.yellow,
      Colors.green,
      Colors.white,
    ];
    for (int i = 0; i < 5000; i++) {
      canvas.drawCircle(
        Offset(rand.nextDouble() * size.width, rand.nextDouble() * size.height),
        10 + rand.nextDouble() * 20,
        Paint()..color = colors[rand.nextInt(colors.length)].withOpacity(0.2),
      );
    }
  }

  @override
  bool shouldRepaint(ExpensivePainter other) => false;
}

class MyCustomPainter extends CustomPainter {
  final Offset _offset;

  MyCustomPainter(this._offset);

  @override
  void paint(Canvas canvas, Size size) {
    if (_offset == null) return;
    canvas.drawCircle(_offset, 10.0, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(MyCustomPainter other) => other._offset != _offset;
}
