import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class LineMetricsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ShowTextAndPosition(),
    );
  }
}

class ShowTextAndPosition extends StatelessWidget {
  final text = 'Show Text line metrics.\n很长很长，中文English、￥*（）而且12345。\nΩß˙©†∆˚ø≤µ∫√ƒ®åß∂';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        final width = constraints.maxWidth;
        textPainter.layout(
          minWidth: 20,
          maxWidth: width,
        );
        final height = textPainter.height;

        return Container(
          width: width,
          height: height,
          child: CustomPaint(painter: MyPainter(textPainter)),
        );
      },
    );
  }
}

class MyPainter extends CustomPainter {
  TextPainter textPainter;

  final baseLinePaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;
  final textBoundsPaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  MyPainter(this.textPainter);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset(0, 0) & size, Paint()..color = Colors.grey.shade200);
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = Offset(0, 0);
    textPainter.paint(canvas, offset);
    List<ui.LineMetrics> lines = textPainter.computeLineMetrics();
    for (ui.LineMetrics line in lines) {
      final baseline = line.baseline;
      final left = line.left;
      final top = line.baseline - line.ascent;
      final right = left + line.width;
      final bottom = line.baseline + line.descent;
      final rect = Rect.fromLTRB(left, top, right, bottom);
      canvas.drawLine(
        Offset(left, baseline),
        Offset(right, baseline),
        baseLinePaint,
      );
      canvas.drawRect(rect, textBoundsPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
