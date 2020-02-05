import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class DrawTextWidget extends StatefulWidget {
  @override
  _DrawTextWidgetState createState() => _DrawTextWidgetState();
}

class _DrawTextWidgetState extends State<DrawTextWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('TextPainter绘制Text'),
        SubtitleWidget('通过TextPainter 可以获取要渲染的文字的Size 但是不绘制出来(不调用paint即可)'),
        Container(
          constraints: const BoxConstraints.expand(height: 200),
          child: CustomPaint(
            painter: MyPainter(true),
          ),
        ),
        MainTitleWidget('ParagraphBuilder绘制Text'),
        Container(
          constraints: const BoxConstraints.expand(height: 200),
          child: CustomPaint(
            painter: MyPainter(false),
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final bool useTextPainter;

  MyPainter(this.useTextPainter);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset(0, 0) & size, Paint()..color = Colors.red.shade300);
    // 限制最大高度
    canvas.clipRect(Offset(0, 0) & size);
    final TextStyle style = TextStyle(
      color: Colors.black,
      fontSize: 20,
      height: 2,
    );
    if (useTextPainter) {
      var text = 'Flutter TextPainter 绘制Text !@#%^（）()' * 10;
      TextPainter(
        text: TextSpan(text: text, style: style),
        textAlign: TextAlign.justify,
        maxLines: 3,
        textDirection: TextDirection.ltr,
      )
        ..layout(maxWidth: size.width - 10 - 10)
        ..paint(canvas, const Offset(10, 10));
    } else {
      var text = 'Flutter ParagraphBuilder 绘制Text !@#%^（）()' * 10;
      final ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle(
        fontSize: style.fontSize,
        fontFamily: style.fontFamily,
        fontStyle: style.fontStyle,
        fontWeight: style.fontWeight,
        textAlign: TextAlign.justify,
        maxLines: 3,
      ))
        ..pushStyle(style.getTextStyle())
        ..addText(text);
      final ui.Paragraph paragraph = paragraphBuilder.build()
        ..layout(ui.ParagraphConstraints(width: size.width - 10 - 10)); // Paragraph need to have specified width :/
      canvas.drawParagraph(paragraph, const Offset(10, 10));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
