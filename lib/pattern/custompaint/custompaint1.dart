import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CustomPaint1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('CustomPainter结合GestureDetector实现自定义进度条'),
        CustomProgress(),
      ],
    );
  }
}

class CustomProgress extends StatefulWidget {
  @override
  _CustomProgressState createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress> {
  final GlobalKey customKey = GlobalKey();
  var progress = 0.5;
  var width = 400.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 150,
      color: Colors.grey.shade200,
      child: GestureDetector(
        onPanUpdate: doUpdate,
        child: CustomPaint(
          key: customKey,
          painter: CustomProgressPainter(progress.clamp(0, 1)),
        ),
      ),
    );
  }

  doUpdate(DragUpdateDetails details) {
    setState(() => progress = (details.localPosition.dx) / width);
  }
}

class CustomProgressPainter extends CustomPainter {
  final progress;
  var maxWidth;
  var maxHeight;
  var offsetStart;
  var offsetEnd;

  var painterBg = Paint()
    ..color = Colors.black12
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 18;

  var painterProgress = Paint()
    ..color = Color.alphaBlend(Colors.pinkAccent, Colors.white)
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 14;

  var painterHandle = Paint()
    ..color = Colors.pinkAccent
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 14;

  CustomProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    maxWidth = size.width * 0.9;
    offsetStart = Offset((size.width - maxWidth) / 2, size.height / 2);
    offsetEnd = offsetStart + Offset(progress * maxWidth, 0);

    var rect = Rect.fromLTRB(
      (size.width - maxWidth) / 2,
      0,
      (size.width - maxWidth) / 2 + maxWidth * progress,
      size.height,
    );

    var gradient = LinearGradient(
      colors: [
        Colors.pinkAccent.withOpacity(0.2),
        Colors.pinkAccent,
      ],
    );

    painterProgress.shader = gradient.createShader(rect);

    // 绘制背景条
    canvas.drawLine(
      offsetStart,
      offsetStart + Offset(maxWidth, 0),
      painterBg,
    );
    // 绘制进度条
    canvas.drawLine(
      offsetStart,
      offsetEnd,
      painterProgress,
    );
    // 绘制控制点
    canvas.drawCircle(offsetEnd, 12, painterHandle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
