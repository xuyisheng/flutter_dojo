import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class LayerBlendModeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('SaveLayer与图层混合'),
        SubtitleWidget('绘制的的内容只有在saveLayer产生的新图层中指定的rect中才生效'),
        SubtitleWidget('BlendMode和ColorFilter只有在合并图层的时候才会生效'),
        Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child: CustomPaint(
              painter: MyPainter(),
            ),
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(
      Rect.fromLTRB(0, 0, size.width * 0.7, size.height * 0.7),
      Paint()
        ..color = Colors.blue
        ..blendMode = BlendMode.difference,
    );
    // 填充区域
    canvas.drawPaint(Paint()..color = Colors.red);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
