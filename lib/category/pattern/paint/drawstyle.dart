import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class DrawStyleWidget extends StatefulWidget {
  @override
  _DrawStyleWidgetState createState() => _DrawStyleWidgetState();
}

class _DrawStyleWidgetState extends State<DrawStyleWidget> {
  var strokeWidth;
  var strokeCap;
  var strokeJoin;
  var style;
  var maskFilter;
  var isClip = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MultiSelectionWidget(
          'Style',
          PaintingStyle.values,
          PaintingStyle.values,
          (value) {
            setState(() => style = value);
          },
        ),
        MultiSelectionWidget(
          'StrokeWidth',
          [8.0, 16.0, 24.0],
          ['8', '16', '24'],
          (value) {
            setState(() => strokeWidth = value);
          },
        ),
        MultiSelectionWidget(
          'StrokeCap',
          StrokeCap.values,
          StrokeCap.values,
          (value) {
            setState(() => strokeCap = value);
          },
        ),
        MultiSelectionWidget(
          'StrokeJoin',
          StrokeJoin.values,
          StrokeJoin.values,
          (value) {
            setState(() => strokeJoin = value);
          },
        ),
        SubtitleWidget('Work with Canvas.drawPath and rectangles in Paint.style stroke'),
        MultiSelectionWidget(
          'MaskFilter',
          BlurStyle.values,
          BlurStyle.values,
          (value) {
            setState(() => maskFilter = value);
          },
        ),
        Container(
          color: Colors.yellow,
          constraints: const BoxConstraints.expand(height: 400),
          child: CustomPaint(
            painter: PaintTest(strokeWidth, strokeCap, strokeJoin, style, maskFilter),
          ),
        ),
        SubtitleWidget('限制CustomPaint的绘制尺寸-clip方式'),
        Container(
          color: Colors.yellow,
          constraints: const BoxConstraints.expand(height: 100),
          child: CustomPaint(
            painter: PaintTest1(isClip),
          ),
        ),
        Row(
          children: <Widget>[
            Text('限制尺寸'),
            Switch(
              value: isClip,
              onChanged: (v) {
                setState(() => isClip = v);
              },
            ),
          ],
        )
      ],
    );
  }
}

class PaintTest extends CustomPainter {
  double strokeWidth;
  var strokeCap;
  var strokeJoin;
  var style;
  var maskFilter;
  var mPaint = Paint();

  PaintTest(this.strokeWidth, this.strokeCap, this.strokeJoin, this.style, this.maskFilter);

  @override
  void paint(Canvas canvas, Size size) {
    if (strokeWidth != null) {
      mPaint.strokeWidth = strokeWidth;
    }
    if (strokeCap != null) {
      mPaint.strokeCap = strokeCap;
    }
    if (style != null) {
      mPaint.style = style;
    }
    if (strokeJoin != null) {
      mPaint.strokeJoin = strokeJoin;
    }
    if (maskFilter != null) {
      mPaint.maskFilter = MaskFilter.blur(maskFilter, 3.0);
    }
    var offset1 = Offset(30.0, 30.0);
    var offset2 = Offset(size.width - 30.0, 30.0);
    var offset3 = Offset(size.width / 2, size.height * 0.2);
    var circle0 = Offset(size.width / 4, size.height / 2);
    var circle1 = Offset(size.width * 3 / 4, size.height / 2);

    canvas.drawRect(Rect.fromCenter(center: circle1, width: 100, height: 100), mPaint);
    canvas.drawLine(offset1, offset2, mPaint);
    canvas.drawLine(offset2, offset3, mPaint);
    canvas.drawCircle(circle0, 50, mPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class PaintTest1 extends CustomPainter {
  final isClip;

  PaintTest1(this.isClip);

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    if (isClip) {
      canvas.clipRect(rect);
    }
    canvas.drawRect(
      rect,
      Paint()..color = Colors.blue,
    );
    canvas.drawCircle(
      Offset(size.width / 2, 0),
      size.height,
      Paint()..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
